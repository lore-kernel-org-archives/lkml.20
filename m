Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031376;
	b=H2JAx2/9sK0emm25o+O4SW+VnGzESZR20wQhfgXEKSTeQjHbJFQbXpEDiMEKAFt+Bjd6
	 w9M5D6QU6PGw7OfqUPHnPoht9talRkru9yS7pSlTlUtvlYt175FO7YyJ8FlwR9GXOkvGj
	 AqgkPstnF5xQ24YnmsTbkzWKdsZubATgg7L8YTJiaBlyLlF0KIB/yKzPbbetUcJ/KZZTa
	 LByO9YQ7H3m652kbIONQKebziZaB/gmYRlfBB/RniFnhUsV0CYlKLxZ12frEhlMoLmQCa
	 xT8DG90X5t/8ToBD3QTw0p8UWeeNF+YgQT9qyHuSn3aA9xjVPeFO5slkNx4IHFkmkEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031376;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0nm/zKltl+3JgnGrNgoqTrjeaQdzViSBaGY2KoLrCDI=;
	b=nP0jeC4NtHkSPg1eBNqXlKL0ctPpFlmiqCiZxjL/BrMDis9pSuMKgwxXS3NRaZ61GQkn
	 Q3Seoil+dZgSUkn3A0VIv2up4O9bKR8SNqA5IFAqSCQPdWOozv3CPNrcz0o3bCsSng3PI
	 2Uga4uy7vWLEX1HD5wUJ0mj9G7pxNo9NCR2hPKLrSTywhXtnr3l2c3ZcvimL68rITCNCT
	 O1L+IC55oozCln2mJgUpOh0Gfzo9YGFmbnbVxv+uFiEc/vXTzX54RsbGakuN0GX4j2Zym
	 hl2Fi7foiD9MEj54ngE9JQGp49T3tRiG8iPDT4bAmpyQd0v+aLzcKsIFrKGM9qkLhlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kumba.dev;
	spf=pass smtp.mailfrom=kumba.dev;
	dkim=pass header.d=kumba.dev header.i=@kumba.dev header.a=rsa-sha256 header.s=fm3 header.b=eOVuREVL;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WdkLTGmb;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E3C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kumba.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kumba.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kumba.dev header.i=@kumba.dev header.a=rsa-sha256 header.s=fm3 header.b=eOVuREVL;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WdkLTGmb
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CF23B7A03A8
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:16:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 26 Oct 2026 12:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kumba.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1793031375;
	 x=1793117775; bh=0nm/zKltl+3JgnGrNgoqTrjeaQdzViSBaGY2KoLrCDI=; b=
	eOVuREVLSsat2BhOPpgHLnKAvmSaRrV9Ko9WB32ZsZY+T2vRD4jbI9vcOkyZOocU
	eIrfaeroPSlTKKklDjyin71Jy1FSiX6FCWUT5JWmuYOFtkARLZx9UnGlfVy2SKgf
	DHqqzqtrw5Du5EaEW/jwElR0Rq3hECbdSyuJUJq+k1KtfAH7uT6ilxz7bA0qN9Zn
	uix6O4wJTQQnDF7mAyNNhG8IOnz4mTGL1eA+6qL4Wr8MoukDhSMCX6AFWsxHXNm0
	q9f/wku14nGpuaxkaWTekQqmdlTwIOmA0mrxA9isBVf2nn25R0FfJqlIXSI+RMUt
	yfEYMhEyfUfw65JoIm7F2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793031375; x=
	1793117775; bh=0nm/zKltl+3JgnGrNgoqTrjeaQdzViSBaGY2KoLrCDI=; b=W
	dkLTGmbVqe/YsfeX1H9CjBgWu9/6GOEyLLEWk8moimC6LLIKmiFRQXvKj0IFYfzH
	n7T4gWchI0Wm/hgTGO8FkyVXZi8utm7QmLXtgCRc7XBMK/iyEk+b3BUFziLEk5NV
	EsFwDqjS5WmTKV7BFI9euXkychHWMjuU3haP12nNTRNUFxLCb+2vuDt89qEkAYXu
	EoLMcTQXQbTKKk2uNIHsqVWyJbaSZs4s/fsFqWLzSmUDQKwoy4VItkiCoTUG/2we
	btZcd+LR5P+hxCXaBsKIMGBJ1xBQfYvHkQk81jOtgzos8XWi2GLGTbGThzMtSL9j
	L7UkPdl3DuzqNXsh1T5lg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=kumba.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793031375; d=kumba.dev;
	mf=PGxpbnV4QGt1bWJhLmRldj4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:RGB9FL4YJXAen/nrEQ2c8GnhZyyfSgatsz8IFda7rnhiGqa
	fM7pm5Gqzvcf0InhQJ0DK0L8hbRCY7p5Ny0Ny6lLY953Nz0nXlqVduJ/ntkRFvLG
	YNsQAW4l6BZzrQ6yS4/Coj47lgBEbflbvlC2HwNn/APuQJRQU2a7b/k2h89pACkL
	MCmDqZv5JeGfeHyS27rIV7MQlNaPQ1ZBIcAwW8ALEZauIw3k0zX/yxjA9j3EkDh1
	UfCx5mrQSjQ23P8x57nXRBl6SpXv7o5ynia6u2jyBbaBrxqitmDnPl9pt+5OUcP+
	m1Gb09g30xLlHXhzTBqXQuqhtun1jGWfrDwAlOA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:CGNC7+wGguARpk4ZpPjQaVDtzqXyoGtqR9pUvgOtgKQ=:cWvI74xUxpl/aF0NF/OTEuespHFD3g/VECtKUF9q5gc=;
X-ME-Sender: <xms:z3zfaiBdEaPIvI1Aw0sRp2RliHy4KW7O_3oh1GWEcFspNecqthsEyw>
    <xme:z3zfaqV0r3p5HzIyka2TGyb7EAM10352VvmNfX5JyJR-lX7ETOs-ibA_lTvSMgEIf
    sv_XpD0P9VSwKE3k82539xzC_0t0fEzARbNkaoxQk5TBetBy8njUg>
X-ME-Received: <xmr:z3zfagAe3iqT4oegezmKo6BzWM-bPny2m-mJLuNlYNgfLxhq2pNASp-Up4peqnupRi5KeLTfGNy23yJ6OuxeAKFuOJ0p8WrI_7Ldc0FhIqQ27WaXhA>
X-ME-Proxy-Cause: dmFkZTF0Wl5oyMHxOZCStGaRgNPPgT5ZrY97mT/gl5aLuoGxW8UmvEz3iaSUCvnjEWfdcu
    ZE5rCbhb4WSEftdLdluPknJE6vEmp706voyY7pgGltDFrQPp/7+wKmdoFqmIS9ae+wy3p2
    +SEK3Cbdx9STsF6xuPWMvY3GD5ypAYC34pMTGuQRz/ALQUiE7kDHugRBAquyZhjE7PNs5R
    ci4gOGCyPnJSuAnKGgHlEtNLmVj6qRiUTDxs9TG1yfalDm2OC6UK7fPOYsuTdTiA0ovIvp
    HZjpq1DW7uG0rE4/OA2nlR75cggDf7p1dqSD4SoXTzi41mKqncIc4LLOpEa4k9RYayX+Cq
    uHTtL2CPkNxjY+NHEW8sXx6lCs2duHPymmfjIi1Ge+VCitFrlXIjeGYQEMZ4ue5lEaZpZe
    pRz7QOcS6GL2Z0MK/K4HH9I68+XyZPZ1na0dtQ8xuPAD6YFF1DwhKKZMoBFnA3NTHUs3FB
    BTtmbLPY88sjs/Jv4rCQMZPyoS6ZO1Tnlzh5ZdFhDNG72MlQSOjFlIWfNtl2GXvaoFjqRG
    0rR00TfHgldcCIRIj4QEGqlUreIADR2dKmK3WJ46+SgmgUDipxrKAlc7jYT2bek899kG8p
    Kcoa/QTkxl6tUbTV2biyfTkMFxyVUIXtCyKNy80LEK3vwq7uqCPIXDfTmlqw
X-ME-Proxy: <xmx:z3zfat8THca3N8aRuxH_ffUOcrSLgRwB5rOZ8EK6S4caXE6zwRit7Q>
    <xmx:z3zfanHjurV0TMDaXZeL0xVuFG4Veb_LcpfIBwDeHfyJzYDaYVv6Ow>
    <xmx:z3zfarNDQw4jpMi9of5AYHSOehlvuiPqNv6utfqX-nvPCP8RWQSIGg>
    <xmx:z3zfahc4jcfgu6GdrqfZIE1moGkB4Y2ZtzA5lsS1TOpGeCC7OVm3Bw>
    <xmx:z3zfapV-6Pyb5HBVo8f0D3vPQVEAurkwMvzSEiMSPwI3lPf_qM-NBC4l>
Feedback-ID: if8114916:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 12:16:14 -0400 (EDT)
Message-ID: <c5319ccd-162a-4fe5-ad9f-046f6aad0c1f@kumba.dev>
Date: Mon, 26 Oct 2026 12:15:35 -0400
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
Subject: Re: [PATCH v2 0/3] rtc: ds1685: power-off fixes
To: Imre Kaloz <kaloz@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013120208.11268-1-kaloz@kernel.org>
Content-Language: en-US
From: Joshua Kinard <linux@kumba.dev>
In-Reply-To: <20261013120208.11268-1-kaloz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2026 08:02, Imre Kaloz wrote:
> Three fixes for ds1685_rtc_poweroff(), on SGI O2 and Octane machines.
> 
> Patch 1 arms the wake-up alarm only if an alarm is set, so that stale
> alarm registers no longer power the machine back on.
> 
> Patch 2 replaces the sleep before the PAB write with a busy wait, as
> power-off handlers must not sleep.
> 
> Patch 3 repeats the PAB write, clearing the kickstart and wake-up
> flags with it, until power is removed.
> 
> Patch 1 was tested on an O2, and the whole series on an Octane.
> 
> Changes in v2:
> - New patch 2: use mdelay() instead of msleep() before the PAB write.
> - Patch 3 (v1 patch 2): use mdelay() instead of msleep() in the
>    repeat loop.
> 
> v1: https://lore.kernel.org/all/20261013094930.574-1-kaloz@kernel.org/
> 
> Imre Kaloz (3):
>    rtc: ds1685: arm the wake-up alarm at power-off only if an alarm is
>      set
>    rtc: ds1685: do not sleep in the power-off handler
>    rtc: ds1685: keep setting PAB until power is removed
> 
>   drivers/rtc/rtc-ds1685.c | 40 ++++++++++++++++++++++++++--------------
>   1 file changed, 26 insertions(+), 14 deletions(-)
> 
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

Whoops, I meant to ACK this thread, not the older one!

Acked-by: Joshua Kinard <linux@kumba.dev>

