Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9E3559D6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103654; cv=pass; b=VZAD0HwrSzk2PN3l39ld051486c9jUKf+pP5zN9U1iXmpfNwyv/4TORNlkObQutfb6BYkBo268AAcoLut0vY36W9DP8IoMTEToTGRsPjQ7x/+tmUqHtnjOKjjsz19t9cJaaJWJ8imJ5h6PC38Zcu+jkrJxBg2gplm2opn3xsyXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103654; c=relaxed/simple;
	bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKixsPWDc2USO9MWYzf38NHatBn2LckytTwBuTMPqn8TTrOuiVciZ3upEAOyntBFDHP2qnNU0wtgxUfFqme0HzYf2SFys7wwUBkz2x4SNag7/OsRl4g9pjxuPcwD0p1pnqM5V+v1M2uCusAxFelt98xeiM7xPTTINQHWWt2ntc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxOPaxXj; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxOPaxXj"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so4708535ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789103653; cv=none;
        d=google.com; s=arc-20260327;
        b=jJc//Z/YxQLOjJjDX1h85smt8ptZQ+rXYfD7y1wdH7MnvSe2yaadC6HVxgDkbLql7b
         XBdQKXGQXU/YHy+gStXF55oy9rxw9xnybqeaonulMwue9NIyd5TdrZO/ZYx/ODWWPbCG
         +tiZFvGQ/2wvljLI4KiF2BmV535Re373TcKJ9Vn1ngfHtu2xpep8IIFGPqupvqoBhrcm
         ZPExtSGGxlDVHmTLfLdIK5PEpOh19UOmrQEQFGFKpcRvdDpLquNxRXIGcNlOLCmOPh0u
         IpFtg3ww84f2CFWbsNAJ8YNJ/U1JEejDrW1AhaoOjoiKKFs0eRifoz/TL5ra6VGV3E84
         UjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        fh=e4qMbnDyd7u6q4XvE++Z9qVf9TCzhy2ld/DP6wTnGXo=;
        b=nR7nc+R+GLeaO/930sLlkgwa6sKcq1gpRnu6s3mbrK+RKy+HUI9Dg6dPUPpyOPAz8k
         39/NvmJSs4iFHg4oFKIzSQIB39FusnRGGOriLTG/OMOvyzYdegdQqdE8pwvN/Ytabmrr
         TeOidO8vW7GDWitFcFBAUp2qwqaDecHsA2NHKbaQQl0pIk0m0gKnL/nLjnHYU8MYGCtl
         YLNGQEMp5nPl1Kv1dotPm6cOWjbwcztqYfy5gnhzhfZTUNYpSXSHHG5GljxViTj2++2A
         X88OX7gZr88LNpkfOoeW8HoDVUhqHYK7s8oz51c0QaZAI8SovU9LfJMi+rxQOMG5lMtR
         YU/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103653; x=1789708453; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        b=UxOPaxXjtgJPe1tiqCkPoSj61g8Vl5PYOj1H/lISebiEGxIOeWP1MY21cICuDtHlc0
         gwnWFigFLVTDEZWE1sxRdjmhtYGdtyD+ZD2Clf5gVTuFPJEN67hF/quPK/C1D3O5xakX
         rFhLJ8fxM/RMShX9RZtMLIPYnH/SZDVcykJsRpFp392qc6Qq2qFMThAIr1ljbs2rn4WJ
         5Gky4s7F+Cx94Q2p3kFBlKg2MewW4HHV0FOrMFjhhMAqcha8+AZsWs39KG67XYWmHwES
         O1l6/jFGe3n3MmKd3jV7GZRcM+sn0sKP7wxZV9nGS2mJ2cmQuByZygLlF3BN7V0wZG3W
         NbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103653; x=1789708453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        b=nB8yPXSEVvNWglqMvcVjHje2odmn+h50vv7g5+unycuO4hy7q0Glry3pJZfKMxYbD0
         ynuyVMUiJEAlIW/KvbpRttUn+PSC5Cj4dwqf+vUUWmbUwGQUOU34UX62W8X/aL6+vgkj
         +HX89yE5AK1kuyVOT62hJNQJN6JXEjjH+QvmBwW79a6fngQtayF0Ob5XjmQaGpZXCeEW
         IAwR99dFYx9agH1s4wDf8ibD9FhgjG1xRFLvmOCi/MzPaUc60F+UYWWHPY9QNZ+7D3mE
         DhwRPaft7n9qNCKoRN3jD6wpB5fDq0We7kTXplBk/YHX/ouQnawhbTQvPc8Ek2gfuHI9
         F0PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsbRHeWPwMxaOdRUjwO4BkqdyyV2aD26dhk3uq03Vf41nZAgKzE4JLDOAlpjXgszOD+6qn/G2QXCGlGY4=@vger.kernel.org
X-Gm-Message-State: AFuF++nWtHoMthKQwRxLUemJ2Vck0F2Ix5/u91QL5HfejUWVdF7+XVVU
	CPW7HeKuOd6T7o7MJAW/UXcpPWucuedYd2vbSqvxlsgS81paJGGHmWDs7Tn/vK0zEbDYZOLjG11
	dA45+mPOiwbfOTXqus9SmTMMQuEcmNzo=
X-Gm-Gg: AYBFou1cmAcEJVifxdcoCUpJP9LHmLWRW4CZ6St1TMW1sHh+2db5r+9y+zEuHvH4x13
	IhI4XhahNOtjJjeQRrrd+7nyCz+APEd4hOJ26SSNKv4noXg0Te/BDLW++1td5uCDiyhCoCgNKt6
	fsSv4x+/JU2sFdUCqqYckkIYMbZz6N8CdDkKYAEE1RBaSnIKfdRFpjgPQIz2jeL+RO65PtqBRru
	DHYKi63yHUxyvfQdOo62isv9mVBF4Bh9fRgnyde8cN3cWK6KCh5f0Dn9LNri8BLzbQhBRF4PAxq
	ilCyNZNct/tK7DroC93e4YyjJvn9X7FXFUaxSG6buBQCAFkJCex1XwAZRQGWKvAMwSnzgl1lMwY
	mml7df/efJ6UIO5xtTjgdhYJX9G+tWN2rYWh0ole3yJeNqQAMRNRizf62nkS+Sk0eQUE=
X-Received: by 2002:a17:903:2451:b0:2db:7269:38ef with SMTP id
 d9443c01a7336-2dd2a3362camr50043605ad.14.1789103652898; Thu, 10 Sep 2026
 22:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810093112.47807-1-phucduc.bui@gmail.com> <20260810093112.47807-2-phucduc.bui@gmail.com>
 <2026091054-preflight-capacity-e7e2@gregkh>
In-Reply-To: <2026091054-preflight-capacity-e7e2@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 12:14:01 +0700
X-Gm-Features: AcwNN1U4E0obWJZ95GdL5H5vM5ixf2nzVS2DjnR9WxfFgAkwdtRnN-OtjhWnZCA
Message-ID: <CAABR9nGc+ERL_AenTWzHZwxUeRB4KqyvMB5REOgGzko7X-+p8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for letting me know.

>
> This patch did not apply, please rebase and resend.
>

I have rebased the patch and resent it here:

https://lore.kernel.org/all/20260911051043.15962-1-phucduc.bui@gmail.com/

Best regards,
Phuc
