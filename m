Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799548;
	b=grV6fqu2zp+z+PODJphiH1bsR+gEncopEd7l8BcXQ43jHygjwKj0a4gDwv1JNxCy2b90
	 Bk1jgtG2dRpDejMw0UYjdcj2cAjb4r6C0MxtdE3+c6sbN3QmmBiO3Z8aLK7Pd8vv6WrG1
	 Kv1vMIlMvJEUWKfAwHZZjqg6PCQS4m7iHkGlbbiZaNdOHhrhD8Kmn5c5jWR3V4k9/EogF
	 RZQmjdfjReN/+PNHxqwkl4S0Ad3CsaMhlR6EPJkaquWmxJEcp3i8oN8oZDYHFq/HjjnIT
	 WAisseEPJcXFIiMDYMdwEqN45gFJuzrSoUmoU1JVlnJcCekczZ7Eqsl/RAuqSdlRYvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799548;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=q4LcUzQCUtTAVVJJ4EK0d8MuT1mP9AeP0gJC74TLYsc=;
	b=zcEUlMnOnozByYHfK4DJA/hMUXAR2vMDFaK8v66+qX3uOsTSt7lQW7pXm8NS/HbdNhrx
	 Pww2jOYrwEIAXFDwFXFaLcEWfPsQgXfCD5j2QARZsm1SPzXRWE02SQsCA/u+B3A6NaxEw
	 jhvXmdIG6Y6pxcNOKsxIKCZITJxL4yt5otu2Fuqe6OssuEvwWu4dk1ib3eFTD48bN975b
	 xtJV7HLCiD3ytw070mHm5GqsUyovhaEXiN0xv9bavicFQ/qfjvMuIF8eEdj8YEzViKWXc
	 mUKbtTh+5SiCkA+iuLaVLvcX/ZvrTLPRaf/EDwgZpAqiSWivIPe79bexLUSYPPDy1/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=arunraghavan.net;
	spf=pass smtp.mailfrom=arunraghavan.net;
	dkim=pass header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm2 header.b=b1wbdTDl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Jsk8Azh9;
	arc=none smtp.remote-ip=202.12.124.136
Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F45606A8A7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F45606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net header.a=rsa-sha256 header.s=fm2 header.b=b1wbdTDl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Jsk8Azh9
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id CA95E1302E17
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:25:46 -0500 (EST)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-07.internal (MEProxy); Sun, 15 Nov 2026 22:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm2; t=1794799545; x=1794806745; bh=q4LcUzQCUtTAVVJJ4EK0d
	8MuT1mP9AeP0gJC74TLYsc=; b=b1wbdTDliPuMB88tNz8k/iWBmNRhS2BbSirpL
	Zba8XBPELw9u78C4B2Mvk0Xs3Ww7tvIMBUuxY+6hzRYJQqAxiLESeBbBkYLaaTMN
	rNAiFW1/KM043gDSxM3DiPzzVkvEFazddllCNxSGsfb8JNBXeytPOwgFeZwA8oez
	YMSPqw/IBCHRYm7hurkFvL/s6oOoaZ/qrTDCHExwJseR/bZMBcMC1NlzkNqniQVo
	Pi3pkLbRsaHdBa2uanhzfrpTd9n8tyRdLxijzVwVzVQDpFM03c0DEY4yXl6uQ6R0
	Iap/Lr6efZWbHixoldzPnWgWXSrcW2ErzKVhj/2WXYWVmjjCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794799545; x=
	1794806745; bh=q4LcUzQCUtTAVVJJ4EK0d8MuT1mP9AeP0gJC74TLYsc=; b=J
	sk8Azh9tSpb6MnU/Gb0I/SN3dix9QU9iiujlyMLDnt3NtTBAHzDgY+s7P4D73ncx
	S+4ektxS684Kjq6vbPjVEsD62rSEe2ErmWlzUhz8MUTQMZ4D9i55nRA7xxlpd0M+
	hZdVNTTHG4gKzCqLCQI1c0iMIZGPlH4/QLEapPxqDBiW6huEa0AxZ3hP37LTJDc+
	gYfRcy61cS1t+wCGXIYmdTe/w/A7Mu3KjXpKjqQEoZRg9IDpCXqAvkaMZGxV5Y0x
	sX/MLLcrH9oPLsB1+Q+m4LlgZ8Dy/+OSi0EW7Y/KK4NJ7RYfb+0hyLMmTq/8Aj8y
	wHzqvND4IiCRDkNonvXOg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arunraghavan.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794799545; d=arunraghavan.net;
	mf=PGFydW5AYXJ1bnJhZ2hhdmFuLm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:WF9fWa5+HcWTDoCfl02gewBOLuL33DZnrYyuWuRg1KTp3zf
	CRNG5JBSq+coXwAaVOkT5HOLOT/OSjvxV8dqlC9IJpiHebiMrsxtSUm8HkQBb3Pk
	ISr2abgX581OeouA6SKpO+sr+72LPHPxXyFwCHQe9QClVpd1tju/MuVx5kwgKdWi
	3viZd+gkzz9CDz3YJaAOXXyS57vJ1XH0eJeG6XUeGsS7wlqkNZVL7vf4PhF+cV81
	rxCuvWASuKjHa0fBDAr/v4W8BiUZ+bcH06KA4ThyEBpSmfDtM9b6MdyRnW7kqzNz
	9YBNFYyMcOpnR6l3ZvJhsYJ44BdtN7Scx/pt53w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GQYnNjBVtDjE/12OuGq/OsMd8zTMXh0AQkZcVmmNiHo=:xsJNPGbu2Te5aZ2YoaHmx7aGeaH96nP8N7jTslpUZCg=;
X-ME-Sender: <xms:uHf6apSAHxS_uzWVjPUpxedKdTlkk9N6_vGExtjgjkEpmhOw1nK6nA>
    <xme:uHf6atmK7Zppw_Plx4s0x6X5rQ27kp5vnUHic0cCL5dCYxSfXMR-IqSpW6rK_xmDd
    -_vi27RnYKP9zRMsAgdGxx-fIMHZksQ6MMuWg388RSdJNcte_BWvQ>
X-ME-Proxy-Cause: dmFkZTGJpU0ci2obb7JUc1Cnaaumlqm0f0mvuTjrt8AuKv1oGCYgWAFe0Uq/rm9qehlhVR
    +VqEmOBuGmSGxuSlYbsz1mzTkCRjzNZx5jzQ6S2hGC502LVIG4zixr/2393bFJy8YikyHe
    5uy4jO8rTJGrCCLFcPymMjZHUlC7RMY6vRH/wPw+OGTl13L5N4Rxgd1E+rpgQm38zj4evl
    3UuhFm9PqY0qmcDUXBi+oN/4aER68cjWRN1CY5vcHXRlcRbkulyVA7MDL3WOldhId3A6bZ
    km6D+9gCtt7HLbPJffwjb8zdDFFSlkCfIhq3xIIHKW+taITTJzFaZ3T+4xPCYr3CPeLUR7
    FE2yhp9ypT8bw3PImrkxcjWegy4uaB2ZP7s/Z9z9Va+lKLNZE4ueqja5KNYywHYcFNEs97
    uB6Sycu4/5Rxmk/9kIsj1z9EE2X0laWwCVS4JrTfrxkLmKmKJTh46nRpitKARFdyyqfHa3
    qDvtgiXxAFGJBJGJ6HANSfpp3Hzl71BIUnSL63492JV/ZH+X5z3H+m5RinplIC3TCfXP6F
    7Sc/v3D0FrK2Q/LUYUzR0p4Q6R7LSOda7Y7BUvq2Rz6XRNeh6V57Nk5vURJwD+YvMG/w7d
    7+7qruyTRQA6/e32dEwaM44/r7x+wpYZzSw1ShXZ1UZH5tysNpWJx3LLcRCw
X-ME-Proxy: <xmx:uHf6auzMXSqsbNiTt1a_A6ed621RFDiM-NwrHQvk8gluCYrrsrKZqA>
    <xmx:uHf6am0vaFl5_q7yyslifow3l_4avJ9ItfDNb2XZ-WywPkbPb3fSjg>
    <xmx:uHf6akxYGl7cDq1nY5zMzxR76YkWmReQzkHmRbf8CH45hx4Ok7nSmA>
    <xmx:uHf6arXhEDvgPVU4y33qp8zBUVcPchLFVE2MfqU9T6eMUjkflkgr_g>
    <xmx:uXf6asjaUq8SdeeztJ5QseM4h0_xarr9GrOvZfgyZi3xZSzkZpURsVQi>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3883EB6006E; Sun, 15 Nov 2026 22:25:44 -0500 (EST)
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
X-ThreadId: ALfJLjectwYo
Date: Sun, 15 Nov 2026 19:25:24 -0800
From: "Arun Raghavan" <arun@arunraghavan.net>
To: Michael <jagerkin@gmail.com>, arunr@valvesoftware.com
Cc: "Takashi Iwai" <tiwai@suse.de>, "Takashi Iwai" <tiwai@suse.com>,
 "Jaroslav Kysela" <perex@perex.cz>, alexander.deucher@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>
Message-Id: <5b34b0ef-9eef-4049-a018-3e60bda634f8@app.fastmail.com>
In-Reply-To: <20261026013835.98210-1-jagerkin@gmail.com>
References: <DKT5BQW7XPHP.2KNASR1XE11UD@valvesoftware.com>
 <20261026013835.98210-1-jagerkin@gmail.com>
Subject: Re: [PATCH] ALSA: hda/core: Log stream DMA errors on interrupt
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 25 Oct 2026, at 6:38 PM, Michael wrote:
> On Wed Aug 19, 2026 at 11:53 AM PDT, Arun Raghavan wrote:
>> On Wed Aug 5, 2026 at 11:30 PM PDT, Takashi Iwai wrote:
>>> So what's the best option for users if this happens?
>>> That is, what happens if we don't restart the stream?  Is it a
>>> temporary fail-out and the hardware recovers / resync by itself while
>>> streaming further?  If so and it's short, it might be better to leave
>>> it as is.
>>
>> Unfortunately, there doesn't appear to be much users can do in this
>> state. The warnings we have introduced should at least point to a cause,
>> but the issues seem to be around GPU clocks and power management
>
> A data point from Intel hardware, where there are no obvious issues
> with playback quality.
>
> 7.3.0 logs this continuously as soon as PipeWire opens the analog
> playback stream:
>
>   snd_hda_intel 0000:00:1f.3: stream 7 dma error: 0x28
>
> Per include/sound/hda_register.h, 0x28 is FIFO_READY | FIFO_ERR, the
> same bits you reported.
>
> The only open PCM is pcm0p (2ch, 48 kHz, period 1024, buffer 32768
> frames), so I'm assuming that's stream 7.
>
> Counting the callbacks suppressed, it's something like 7-8/second.
>
> ThinkPad X1 Yoga 3rd gen:
> * i7-8650U, Sunrise Point-LP HDA 8086:9d71 subsystem 17aa:2259
> * Realtek ALC285
> * snd_hda_intel
> * no dGPU

Hum, that's not great. I'm not aware of what the Intel hardware might be doing. Maybe Peter (cc'ed) does?

-- Arun
