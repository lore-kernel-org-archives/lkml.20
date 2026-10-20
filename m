Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503109;
	b=bEe6V6NwXdww2NZH6bs6ScMhUQxoJyefnIXOkcohJb1+f6bQ8VaqQtTPV5fxRTtxgl5y
	 fIFPkueS6rilTg1YqWhDfhUuIQIfk+lohXFDeSA2hqVi8Rp6accJ9/NUgXByfzQzA8y4d
	 sZL5+AGPmLDgezrCX1NHDKa/kO6Xjno3fkc5pH/8aJjmr3kkMmR+S6Tst2fkH6SXIew2g
	 LXTSWjI17A9NU2gce1rjpOfBwzpC2iwKsirElxjYxEwO0cHkPZsyPoKBZG1+1QytwEArj
	 66bTDJu4iCuv041Xt/mOH4hYxSRG7kTi0Qxn3iYAa6RBcvDlMKYECfyHKfzGWvLheOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503109;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bgejzNpzFsos1ceD0Tyakzy9X/up4gxl6mutO9Y2A2Y=;
	b=yW91VFErOHCShuIAiiYPwnVgwvbQ6VNTJDR26NSUBwmktHvxLimQjrgwhtzi4PkJS9gi
	 4fMDOjW2GLHWwch7UjapUnSg8wHyGbGXIJxY9l5Hx6QFa/j1K8BW1LT9ymbeLAr8kWTO/
	 Ug1rdaICPSGIhPMwwGlhbQIzielCp6qQQRa/7wL44O30wnwZksVRiZ9ezs6Rk/rMbZ5O8
	 pGTCFv6fMjhSZ2Lif7lb0GoZJ27n//H0qx/AxLCScRmaeI75XZunqVgVd03qZep92A2De
	 1ioLAlE7jtw2kiyF1uFfOxHEOgfLk5LfQj4poX8SAmVLcaHJzZqabp5wYj9he75tEpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WRTeGXwl;
	arc=none smtp.remote-ip=95.215.58.58
Received: from mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BB6606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93BB6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WRTeGXwl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7ZCru1odRA7o2VqH04VeCwToaD1wfxYt4FcZF/5+H7Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792503106; v=1; x=1793107906;
 b=WRTeGXwlI6uzGTIwXebYRG7lkXHUpp3h/VE8J64NtOtom4i3+ypXKJGTGCqXQ3TrFDsbgA7Q
 5HBz31P5CvWHJYbfWJYFzZGwOplBckCh3g5CMYwO1/ljde2Cu+yPR6wRLKmK2V0vaY8w2iAd2/B
 /exexrJenXWT7k88klQ3Dtuk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 42b62126c2217a5b;
	Tue, 20 Oct 2026 13:31:46 +0000
X-Mizu-Trace-ID: 42b62126c2217a5b
X-Migadu-Flow: FLOW_OUT
Message-ID: <23d3756c-1a87-402d-80b4-c838dfc29f4d@linux.dev>
Date: Tue, 20 Oct 2026 21:31:38 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned
 pages
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>,
 Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, linmiaohe@huawei.com,
 nao.horiguchi@gmail.com, ziy@nvidia.com, wangkefeng.wang@huawei.com,
 tujinjiang@huawei.com, mgorman@techsingularity.net, chengkaitao@kylinos.cn,
 muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
 <20260928105805.1215770-2-xiangzao@linux.alibaba.com>
 <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
 <20260929034123.2705745-1-xiangzao@linux.alibaba.com>
 <877bjowf9i.fsf@DESKTOP-5N7EMDA>
 <fbd5ae06-b6da-48f6-9c46-188fb6ba9684@linux.dev>
 <bc1b3255-99f7-49c8-bb52-bada6df80f72@kernel.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <bc1b3255-99f7-49c8-bb52-bada6df80f72@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/20 21:07, David Hildenbrand (Arm) 写道:
> On 10/20/26 13:27, Kaitao Cheng wrote:
>>
>>
>> 在 2026/10/11 21:14, Huang, Ying 写道:
>>> Yuanhe Shu <xiangzao@linux.alibaba.com> writes:
>>>
>>>>
>>>> Agreed, and nothing here replaces copy_mc.  Two things the check adds
>>>> while that work is pending: on archs without copy_mc the plain copy
>>>> does not fail, it consumes the poison - the same poison consumption
>>>> commit 841a8bfcbad9 ("mm: prevent poison consumption when splitting
>>>> THP") refused to risk on the split path, at your suggestion; and the
>>>> refusal happens before the copy is attempted at all, while copy_mc
>>>> recovers only during the read.  The check and copy_mc compose.
>>>>
>>>
>>> Is it good to implement the trick in copy_mc_user_highpage() and
>>> copy_mc_highpage() if the macro copy_mc_to_kernel is undefined?
>>
>> On architectures with hardware error correction and exception recovery
>> support, accessing faulty memory automatically triggers an exception,
>> which itself guarantees atomicity.
>>
>> On architectures without such support, even if we implement this logic
>> in copy_mc_user_highpage() and copy_mc_highpage(), checking the hwpoison
>> flag and copying the data remain two separate operations. They cannot
>> be performed atomically, so there is still a race window between them,
>> however small.
> 
> Yes. And you need proper architecture support to fix it?

It does require architecture support, but that doesn't seem practical, haha.

>> Moving the hwpoison check after the copy might address this issue.
>> Is there anything wrong with my understanding?
> 
> Will architectures that are not prepared for copy_mc_user_highpage() not simply
> crash if they trigger an MCE during an access?
> 

Do we need to check both before and after the copy? This feels a bit
redundant, and I'm not sure whether such a small race window warrants
an additional check.

-- 
Thanks
Kaitao Cheng

