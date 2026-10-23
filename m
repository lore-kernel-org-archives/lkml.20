Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794344;
	b=vrtvTnQg8WUxHd9oVOTYQtos8EvxiRgcdaUjW5qFRMEQsth+nWY7jYoenvB2R1wrvDtM
	 Qfn9IAKjjr6/1Lf0LeO34fEFJZ7sG/pegjdWYLfA50e2SKqwOt6WRzjI5Ou7WWzUlLqYH
	 FDT4oTw+QWD4Q3+PD8+zs2MTvSaj/sa8VBKy3fYZ6TB/aji8mpGTh9vZaaWt74jpyS22T
	 AF778/2UmxEcAm3xi6aCVWi/XuLYFZHHn5ZvAFnazCD30yjGWv4SP0AFhOonHaxo5JWRZ
	 pJ8DrepR+TpagRfwVAKuhRMeRGVkRxQIkASgWKUKi3+yQ6XHTE+1giIm4U/mjfbJ+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794344;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZW4f/bR0z9X+iXbSmnF3Tp6NyBRkbBWJTCRV7Fj2AnU=;
	b=H06FjDPoNIBV9Gzp2P0K9u3TAaBESXzPNQd/UMLdYDuoS/d9/L6y4pEv7L7t50lOH/Xz
	 +kTUI35uAzVEzPCdE67dHcfzgitmj+LzUqcqxVk3jXjAL0gGO2zyftUvMTQwsyUYfitS2
	 9atPGiK9EqyzowVFykN0h9BD2dP7SFUDpAneSZATVeoEN/Kp4roWP6zI0mGNopJgdmCY+
	 LAnIvBogrCF4zB8f3H8/Ai5fWaIRxiLbjsrQSqP1UoUK900yLfwN1XlHx7eXQlBLSWfr9
	 968wCS+R2Q3c++SuOmkIA2RYxvo2wuW0ICzF6tIS1Fq0eF7ZZI4OuohXhDaOcWwfbWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="P/lDtrff";
	arc=none smtp.remote-ip=91.218.175.150
Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F8606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P/lDtrff
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u2RfliYPbv+3w6elZKzr8CHYPnDNw3MYZtq8+QF/6MI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792794341; v=1; x=1793399141;
 b=P/lDtrffUrzzLvqruj7aLeNYurvmbTFl4CckgrCjD5s7Jf+X63XXt8oSvG6cHXFuNqIA6Fwd
 UgFZifqJmUUTcmYMvd+1XCOJZJLOhon/26JixWxWPVay1KRdunENsZ8okZo9KgK4v7b24kOU1vU
 qxBuc00zEy8ZkI2PbAmv3H3o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aee3234f182cf0bb;
	Fri, 23 Oct 2026 22:25:41 +0000
X-Mizu-Trace-ID: aee3234f182cf0bb
X-Migadu-Flow: FLOW_OUT
Message-ID: <88f41f2c-4226-4122-9627-4fc29a29b99b@linux.dev>
Date: Fri, 23 Oct 2026 15:25:33 -0700
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
Subject: Re: [PATCH v4 1/2] tracing: fgraph: allocate shadow stacks inline
 with GFP_NOWAIT
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, mhiramat@kernel.org,
 mark.rutland@arm.com, mathieu.desnoyers@efficios.com, andrii@kernel.org,
 peterz@infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, kernel-team@meta.com,
 stable@vger.kernel.org
References: <20261021174406.2891598-1-vineet.gupta@linux.dev>
 <20261021174406.2891598-2-vineet.gupta@linux.dev>
 <CAEf4BzaTYgNwiBtvYoSw1wzuFZchs-2CCP93gh2OeDt-919-eQ@mail.gmail.com>
 <20261023143816.48163575@gandalf.local.home>
 <75b66acc-354e-4cd2-b9cb-4c22e8a02635@linux.dev>
 <20261023180902.2bf7cef4@gandalf.local.home>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20261023180902.2bf7cef4@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 3:09 PM, Steven Rostedt wrote:
> On Fri, 23 Oct 2026 13:13:41 -0700
> Vineet Gupta <vineet.gupta@linux.dev> wrote:
>
>> On 10/23/26 11:38 AM, Steven Rostedt wrote:
>>> On Fri, 23 Oct 2026 11:13:44 -0700
>>> Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
>>>   
>>>> Acked-by: Andrii Nakryiko <andrii@kernel.org>
>>>>
>>>> I presume this will go through Masami and Steven's tree, is that right?
>>> Yes, but it came in during the merge window, and since it's just a speed up
>>> and not fixing something that's broken, I was going to let this go in the
>>> next merge window. I rather have a change like this sit through a full -rc
>>> release.
>> It is a speed up but not for optimization sake but to cure rcu stalls in
>> production at Meta. IMHO it should go in sooner than wait a full release
>> cycle.
>>
> Either way, I'd like to give it a bit more testing first. That is, the
> earliest it will go is after -rc1.

That's fair.

Thx,
-Vineet
