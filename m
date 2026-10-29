Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256944;
	b=Qg9eslJZxFPWXn5vvg61wYzstbqQF/PEOiPQ71A1UBXnSEMyuj7y95yeSfzE3BApj9TE
	 uMYmj0lvtBnCOlk2w/am7jgh5PkJaKbevqhwEbE6DOHDtW9ejvXRpBYWmnG+mJDnCLQcw
	 0lmIIZpdAJ/7ZQ/6zwsI7qDTbrSIxmR5XDVgHslnh2r0QPNh1IBGrntwcj7PcCgp83S10
	 vDXsJ6/rpJ3ajDfo1rVVsV+cxiXyB7qvRNNbjLAx/QaZ0dDGiBFME4bJtrbeHYTSzdsy3
	 tnzMigaVu+1kvOzjQAADO+ZiNMsXozSUuPms0oCOJf11lNzen1O9RwSuTw9bXoLN53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
	b=qMvi3ac1rdbIqzz/yFonrJJ5JIU6TFmhIi+iBfNRu6Q/jtWjA3zcUw1ToHdzqsiN1z51
	 mYrfyGnPOwzS1kOLikV6HYOhyiAVyfX+i4+yMpfnPSx4pvwpf+J9WlASaf6yORtQUZjJ0
	 3JiMV9ZQ79OAK+6EZnspl7Qh+2cTnodGXgoOH9lnNhTo8uDHrudyK6iSLdT6W6+WyitcR
	 HvjtZPaVjuKdkRjMPbnTs16af/b2bcrqLAYg4IdQb9ZKN5TOhYIVLbmJSG4Zml6A4ATOH
	 1uGgJX+Gpo5ff3r5kZ2LDAj7nhL7vQNLymcKdfZd/vvTx+9n6xHAsGh/t3cShAxKiAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUETKudL;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9DD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUETKudL
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so12534875e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256943; x=1793861743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=WUETKudLdsxInqGaecGL7sRWIH7KxLIW2z1l3gYvlkMRE7/ykm6SHCTg4LEtGghEBO
         2OGUWkI2GDNHIbNRZcyror9edt+l7slA4g79GXJOZzRMXF1UzaPLxUTtGfSlVWuJqToh
         HQwuRSVz9M6Q5UNemeSFnnU6fro0dysngavrymgXeIatasRC53el25kEaW6Ozb0TQHpy
         xogHkLocdkJb2bhDXfSbD3DsxwyOioX7/WPrMCO84kcUH5mLJHQg45Bd+NIFVnmuhNy/
         804Ik80SVw7TtHQfbP/e0sjn6Wpd9JTZ52QwnPjPRGni99kjTCMPEHGnK1+WlzF/n2D5
         D3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256943; x=1793861743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=ACiu36kMb0F/+Guh7XVJv19q8pmNbx66uW9wHTCGmJXCAj75shb+ZTN1Ov6a9mbrv8
         uIEdtUxWSRW/pjHvA8sJ/+0U7x4GHwDGifgPUc0LKQ3rt/PqBf42ysZCWrf4fb3xRSb1
         hDL8JPbCpZekkK7ka089YAlfkNAPFH/C+GYs30h/4Sub9PYeCnjfnJkmyeM3M+/fSshy
         tcSExOb9AMa7r8Qerdw+vVmV5pvtPc1wZdC/ypQFO5MXqDwCHwPrydscQFbPC1zi/z9S
         JbWogGFDnjnb1oAYZAGVpoXfD2nBAycpIULIo10R96+MoTjYqXagxponogDEmblDBqNH
         7JQg==
X-Forwarded-Encrypted: i=1; AKwUvBy+IEEfxEu164nbd8Vuu06fUGUVNHRe1llRu3inz4DCWt7zHMrGW+DZ3e4Q3TOjE3BedDQBUmN2ncxJ8Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj6T8vrB3EECY3gq8CyIN4MYsG/6Ud2ellZFOCUC7CpfOOtBz3
	oLMDzUgjUV4pWGJtzMvc5S3LBCeUtz4cKIlGy9mEoH6JIrWLaG9PLBWH
X-Gm-Gg: AYBFou1Lu8PfU1JiJRemn6EXcDuHq+asRWZhRRQWO9VDaLU4BiQ2hArkSqEyeUyatvb
	rWKaMCNZn/VZrMXlTsy613E2bQQW9pcU1QmKR5R1pQjX5OsbdfkJMiFI1WgAMQfy2uTyhrAXM4d
	RR7+cmwRsJVyGwPfgMCyFb8y9ZspQCDh0AhYAnxED/Htu9zdLGzf9/XdmQ9NyYDXD+8IFYV983b
	C8peLc7Ve5DB2MOKYpD5XJUrwq9aJxyjy7Ei4N+Dab/xnFLiP62CGtssZt9g3SICi0JS6fahrgS
	JDa4qz+kZWMk/9Ig+ZOhEv2z6aJg/7k0ZPyG03EvXB1pbKPpp2PLoD4W1Aj2PAWiDBUqOJitUro
	KOKituqXFIxyR4yED3Z7gesC7LRgJ4Kl0Z0LO26GLiz3LhCIwcwhXlV2bEoqoA6ylVqiQ6nmTwp
	uiq5uoX34gV40NS6A5laXHVR1UKiMIZP3itTva+iMMvFqCovyWCwwGM4n8v1pa9ynjtmRJIlJdf
	iI40om8uW/PJmfdYIPBbueO4pOmk2dvoCeoVYevAR2Lhf54m7bKWakvgJZDd1TZpEFKu5LsAJqK
	ENIvzp5nvNdaN7kSAJakUxiWiXifdRtPkMd7oMAqwpMWwFnRO2I7knMCGLqDKtZbc99XQ8cm1jw
	mGqQ+Iujsmw==
X-Received: by 2002:a05:600c:34d6:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a9660b54e8mr101112445e9.6.1793256942680;
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm87590825e9.1.2026.10.28.23.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Message-ID: <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com>
Date: Thu, 29 Oct 2026 07:55:41 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/28/26 22:05, Frank Li wrote:
> Does it only impact superspeed? High speed work?

No, it's not even enumerated, on the Dev board.

> 
> Thank you report this problem. Suppose below patch should fix this problem.
> 
> I have not time to test it today.
> 
> 
> Frank

Tested, it doesn't help.

xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
of_dma_configure() and the new code in of_iommu_configure() is never
reached.

Emanuele
