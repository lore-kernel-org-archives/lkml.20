Received: from mta1.migadu.com (out-102.mta1.migadu.com [95.215.58.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522483C09F7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028649; cv=none; b=fRSpxjyTMphJvsGGjkqczVUJ/qfI8w7iBK4QNjFr4fTSBBeAT7Iy2rAl0O4t2IDIy5NusD+6dGVlBKmeQyC7O8dZoyEfTOZpJfL2HqHOCxpchz9BujecOHqgw0DM40JGI+fwhoGPUW0xVqONUlNyHyaR4ZG86DOO37N/L6JI7UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028649; c=relaxed/simple;
	bh=HPYr1lTjIcCMB7NT5Hpi9tecnmvU0n2HOtOh4FXso9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8WNZixGTlYqe0Tt5kQodm+ULcoeSaLjPy5dMCjR9n7lpB2MD8NhXFED7shY7Wa9veaiS9ugeQDLwLPCboOC1U8IdguHigCf9QpwzQvCsLR294eOR5d4a7UDtpv9ZYNzB6GU3OOIrSrIQR06/GXTOaWycOOoawc8jbK37HAW8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wHSWDRjl; arc=none smtp.client-ip=95.215.58.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wHSWDRjl"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HPYr1lTjIcCMB7NT5Hpi9tecnmvU0n2HOtOh4FXso9Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789028639; v=1; x=1789633439;
 b=wHSWDRjlpjRI81yZdb/RGHlDPP+qTGSXuRWMoLypTh31qli56OCy8kb+jSaQfk/Xt6Wa7TWE
 8bHEhPxZyE5sSaAkVYA2ZNP++PBCyhCWTL9Og81RvGzaL7u0So47AddEq8aYZZy3gM8i/isCqXT
 T0OByouyEo0br3ZChc1jpRKQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d02be0715170649b;
	Thu, 10 Sep 2026 08:23:59 +0000
X-Mizu-Trace-ID: d02be0715170649b
X-Migadu-Flow: FLOW_OUT
Message-ID: <50286ce9-00cc-484f-9584-9bbe4bf79ef6@linux.dev>
Date: Thu, 10 Sep 2026 13:53:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC bpf-next 0/6] bpf: track scalar equality across the low 32
 bits
To: Eduard Zingerman <eddyz87@gmail.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260814231945.3884596-1-vineet.gupta@linux.dev>
 <5f1b726cd88f2261f70a5aa99f94ea1434c078c1.camel@gmail.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <5f1b726cd88f2261f70a5aa99f94ea1434c078c1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/19/26 10:05 AM, Eduard Zingerman wrote:
> On Fri, 2026-08-14 at 16:19 -0700, Vineet Gupta wrote:
>> The verifier's linked-scalar machinery tracks register equality only for the
>> full 64 bits (optionally with a constant delta). There is no way to record
>> "these two registers share just their low 32 bits", so a 32-bit mov from a
>> source with unknown high bits has to drop the relationship entirely, and a
>> later narrowing of the source never reaches the destination:
>>
>>>   r6 = ...                    /* full 64-bit unknown */
>>>   w7 = w6                     /* 32-bit zero-extending mov          */
>>>   if w6 != 0 goto .Lxx        /* not taken: r6's low 32 bits are 0  */
>>>   if w7 == 0 goto .Lok   <-- not deduced today
>> The same gap exists for the 32-bit sign extension and was the
>> motivation for this patchset.
>>
>>>   0: (61) r2 = *(u32 *)(r1 +24)
>>>   1: (bf) r0 = (s32)r2
>>>   2: (56) if w2 != 0x0 goto pc+10       ; R2=0 (branch taken)
>>>      ...
>>> 12: (95) exit
> Note that ldx instructions have similar structure: one can either zero
> or sign extend on 32-bit load. I think this series should be expanded
> to cover these cases.
To scope this, there are two items related to ldx
  - Narrowing fill off a wide spilled scalar
  - sign extending loads

There's also a case of narrowing spills to handle.

> Also, please drop RFC tag when submitting v2.

Will do, thx.
v2 modulo ldx is ready (and the selftest runs are at par with RFC) but 
I'd still like yay/nay on some of the queries before submitting.

Thx,
-Vineet
