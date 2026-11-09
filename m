Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219663;
	b=k5Zgb9ySL98LjaMDIgVlzxRS8I/pFPkOREAFYIQBlLmsj5uG6ezAixRd2p3yQE4wqihi
	 8JR4E8D074wiGBgaZ8rj02pCobDjQJFLaTnUMyPNlqYxKbdxmgPRQbatR3wYNWolsEGpY
	 Lxjwj+lgyeCIcObsUvchc3MST/2fNQJoiH8Suh89ifvao+nwKUzEyf6U+Lo2LwL2r1p0D
	 zQ5VvrhZSSB4dV6lHqRwjsuVeXq7TI+q7H2RP79i75NxaejdFhUdjCBmd2ibbtSCl/6Hy
	 tPN7mPI6ctq9UmOzXoaE8CI2QkDleOHa42iwH0bCwsy2KewcUqaxlq9MsxBuE2TQwAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219663;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=B7FDLZUKPjEFwipCZtZWEV8Ro0PRoRjxsi+GkVo52T8=;
	b=LdEyeXClV/c2VV5suy4sazDnvhohMETIS5MjS+R1LdhVmFRTyMNjLLylW4cMFevQk57X
	 On/y4t7STdaaNFkFeisBDrgrF2MPe+2wrGvX1i7CfCWJU0a6PiKnvccQeHR6DcRHsSQ2K
	 /AUG4xwoor/TCG2AAvszCarPKeq6E8JasF2oxpr7iT7V4sOmkby54nEdodNDIkQ4dZKsO
	 AVe+iwnlOlOS6oq/OS3gjC1f5QZN7rrLD5EwOUUrKTxTbb6l1w/NCqazkQONmn1IbUy18
	 LlJtwA07varwRySsCe8kacMOQlk/Qe34VGlEAu9msoSqPbxwKjHkRfqItTcIQj7O/pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Ba0K3mcT;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yuy3hh1L;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A732606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A732606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Ba0K3mcT;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yuy3hh1L
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id A25681D000D7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:21:01 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 09 Nov 2026 05:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794219646;
	 x=1794306046; bh=B7FDLZUKPjEFwipCZtZWEV8Ro0PRoRjxsi+GkVo52T8=; b=
	Ba0K3mcT/FVII/3zDEmy+BTeyTiXG+E1Nujf4mRzxJKn9i3HIHM/YrStr2PAfC79
	NZyKAXGNbe8tkesfNLltgh7fMLiXM+FI0xq7xsPOGiXiwzcpQKMdK8pqgV45ZgmT
	cLuPiYt+eAoJeTz2STO55Tf1k7hYVsr4aC9FClHrlq3SriLYiErTGEo/C2VQjUeP
	OMqt+JNpavN5VAPKA82KiyWq9phG3HxlO/YgllUVJw8KskGSVhubIjKW8VKOMeID
	/zcBKr7rjHT2L39IQeXgB+eg373/n4H+xATZom/bGk55z43eYnbloRAspzuO2DX2
	li4grVp3+FqkU+UrMLV1yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794219646; x=
	1794306046; bh=B7FDLZUKPjEFwipCZtZWEV8Ro0PRoRjxsi+GkVo52T8=; b=y
	uy3hh1LDUayIxIhNVlZg5UztAeIfCsjwZWNmvtZa/UqKyQ7NuxHhb3BiMm/dzMwU
	wb3Ki7Nf/Wu2nUTa65Yj2dlMoeYfzyQPZPgmT6LwYz6PhLUaqyb+HNTKC7fE0Rrk
	kM9g9JwcUnOeZ8wBjqw1JEeQq3uH6yz0S/DFk8a8/4+rl+iLSEykaRMR5iiFnGfF
	pDWJthP3myyE1+0DSapezLV98Mw2qX0QraK+y62L6nhpRJJGWkRqmMgGi+JIgEWl
	/Bzw4i6sq0YMEwEwSJ9fcEk9RE9KxpfHdNqy+L6Tk4+DrdeIqL+4Wyiy9+ni2X1v
	yvx0GLKsgHSRSNMgUKbrA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794219646; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:HTk5dJL/IcO3yfhUBIcW/aYvjOYgpATCstAdnTNQrxbltFA
	dgxA26wo6656IOOO8+NadBq+UJ/voat/OOHqmE8Nb939rz1Zn1MTLJK6UmbW5vRW
	ZAwdTNgmj1LiZKib6748VWIaVdv44oVhgTiB135Uq+Fag92QzavUp60Vq2A5Aj0e
	jFRnIU/Xgfd58ZP7u0izmDiOppaQXKN9iArr6K16/qB4ClzD3NDaB0W8U1GLZO8H
	mEZsRYyiNHq0TG9pJzJ+3L754EQk4hN3I6FQNmWw6cG0/nkSdFc3cB1Bs3jn0WMf
	gi9qHkUo37v0mLzaFPHJPRlr69jcaRM4Fz9iWaw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:qc0rimyHNOx5k3tCs4U58nIqz4hs7SmVJSrVS9r7tqM=:wr3MVIuXPS6AZf4iSg5v4QlWZBUA1YwfVrMohkXDGk0=;
X-ME-Sender: <xms:dZ7xalvV-oSQXzSmGwqUOUvIP-PomSv9exf87XcvhnVMe5vlsPZJIg>
    <xme:dZ7xapRt72_AEsvVNd2yyCeliWckvwPpK6LKw2WsR8-6phC6NKwNYKuHyAlqC1mtO
    BwXkzndm-9yiB7l1j-2ThjGeYionrz5d8AWsG1FNhwa_Wwy5hE2FNK8_Q>
X-ME-Proxy-Cause: dmFkZTE3M/GjcqLLBjOd6SrtP7LhzOBqkSFZGrsunTI7Nr4aBtog0c0uRaHsnHtezI2yR+
    oOTmscngsYiNA1qhXTIDAit/cteDch/09EtRKcJQjUD/YXDjtwei86mdgOE5zP0Qo0fGnO
    k0BR2T4p2Z91svxZz17knKGf6uimPFB2ndGSKO0PzMoI7ZkB39kjR6800Pz1N4QqplVhYZ
    afTao0MAQ2rl8+7IeAw8TXfwojhwXDfScEqLTdbGuOJlDfNw1e7XgHr1UHkNXDZlejuQKo
    ngAXrRITy3QN9cOuCaXm65zRYI9uMY5ToCREj9tbcKvZSI05y5kepDsPsrTdMCVdfKniBG
    L9OqIuirGNN19C1R7r46fB4XKfmmiD73GqtXhsbC9SdUNO8R2lwYbfgvt4Yh4EPqtm4Mb8
    S4uOm8anaDec75cf3f/L2S4kBhm7f3YBKLb6po7RQdUbu9ftwxpT7w5ZxPkaRlUxfOX7/r
    TOT/yG388KRG78oOmm3tNST+S8rEq7gBXLeIfml139I0arinyTZ11JLeHCMn0mKeI7aOeq
    mj6NGn0UpEIYb/VBM4jX+x7nNBhMzUkSjAAsVRNsbwsI0RGhkGN3A+8zLMh3+g0+wpnX+c
    LhtPkTUkaqERYvdN3W4bwzi2IutI2ch1EeI1PpDMbxNodbloGUhs1vYHTvYw
X-ME-Proxy: <xmx:eZ7xattpJnN8jYbMjMG9DJERGCmxGqb7enS83Rv4nzWtFMRCiHvWcQ>
    <xmx:eZ7xaqtwVNhxFRJtfu9qXkRYWflB5KfOfpdlLYipy6u8U-CX3B14XQ>
    <xmx:eZ7xakWOIiOHKnnGVx3RZjt48CU-ihQENKbNQGmXCwzYDGcGZMJ8Ow>
    <xmx:eZ7xajWiUFfnOsfHwc3FvuMKHiEp8QlsEQZchYFSNI64sSmP0xrtyQ>
    <xmx:fp7xamBiY5fAsMHOUeu24oZZRgf290z3cHie107vzrIDkBvksCfDyMiz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D1DE632A0097; Mon,  9 Nov 2026 05:20:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AqNyIDC2Pk_N
Date: Mon, 09 Nov 2026 11:20:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Uros Bizjak" <ubizjak@gmail.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>
Cc: "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Thomas Gleixner" <tglx@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra" <peterz@infradead.org>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, "Yury Norov" <yury.norov@gmail.com>,
 "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Anthony L Nguyen" <anthony.l.nguyen@intel.com>,
 "Przemek Kitszel" <przemyslaw.kitszel@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
Message-Id: <dc861a6f-bcb2-4a84-84ef-b3d72905c824@app.fastmail.com>
In-Reply-To: <56e7300b-cd1c-4fb4-b269-2243394c6df0@gmail.com>
References: <20261105163440.2381661-1-arnd@kernel.org>
 <20261105163440.2381661-4-arnd@kernel.org>
 <56e7300b-cd1c-4fb4-b269-2243394c6df0@gmail.com>
Subject: Re: [PATCH 3/7] x86: make CX8 usage unconditional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


>> -	asm_inline qual (						\
>> -		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
>> -			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
>> -		: ALT_OUTPUT_SP([var] "+m" (__my_cpu_var(_var)),	\
>> -				"+a" (old__.low), "+d" (old__.high))	\
>> +	asm_inline qual ("cmpxchg8b " __percpu_arg([var])		\
>
> This can be plain "asm" instead of "asm_inline"; there is only one asm 
> instruction in the asm template.
>
>> +		: [var] "+m" (__my_cpu_var(_var)),			\
>> +				"+a" (old__.low), "+d" (old__.high)	\
>>   		: "b" (new__.low), "c" (new__.high),			\
>>   		  "S" (&(_var))						\
>
> The line above was needed to force address of _var in %esi. This is not 
> needed anymore.
>>   		: "memory");						\
>> @@ -359,10 +357,8 @@ do {									\
>>   	old__.var = *_oval;						\
>>   	new__.var = _nval;						\
>>   									\
>> -	asm_inline qual (						\
>> -		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
>> -			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
>> -		: ALT_OUTPUT_SP("=@ccz" (success),			\
>> +	asm_inline qual ("cmpxchg8b " __percpu_arg([var])		\
>
> Also here, use "asm" and remove "S" constraint. Please see [1].
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?h=WIP.x86/cpu&id=8cfdd354dae90a3db46c351d15c801dfbf76fc5a
>

Hi Uros,

Thanks for the suggestions, I changed it all as you suggested now.

      Arnd
