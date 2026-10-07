Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB5D356766
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394188; cv=pass; b=gdgR8yDXmT4Ad4SRtnIvGLBYbIoXOAwrrG+RvgwB7FqxAV0sFTb6Ztkp1TXD+ldXlRCyTzoWCj8YZxEMzqviLAZstkgiemXXAoZErl4aqlYkixLJ1QuxHCTco+vX12mUsicSPhK2lxlFInFwe+SM7aXotCOuR1qERk8G0hfUzMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394188; c=relaxed/simple;
	bh=zTRKIT0s2tS4ywlRW4Caixv+Mc/Gnk/vX5KSCXqaq5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGVnUobtK4ej7mvHiRzDP4bGsGRXgyWnRxFYy3rZj9+spJpAF00eI/Xy6WaDTNQ5G163AbRf5U0nUJu4nkxf1AxTPPpbD6LEjagCyUI9d94BsWNEcgeB/ZMb9CprxImX12DT974M6RZoBF1KlEcFvGr0a7Q3Zjmi+GpG47Bxbs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGaUx81Q; arc=pass smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGaUx81Q"
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-824040a3379so1977380a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791394186; cv=none;
        d=google.com; s=arc-20260327;
        b=ch527Biq88k3H9+qbKcLTrN4SVXFkHG4LUA1Q38ODhKAgEcYjtO8VUf3iA1UK5ZnTw
         1V8UnltAfUvLndgFBbc+0tPJhSQAQcs+Xwh3AaPZaf8Jv6jGPpU3j+UIvIKW20jRrSU+
         sWz2RqmDrRckdnbfhIRjqQ4577P4i3sz36upLNWdxGGkwYBSF0siXCehL9S/mniDjRgl
         jl4sFGpCXZIeStMO1e3VUikahyzJy4byTtnVTGhNGIC4hZktkkoEbp+jcciGgVWdXNG5
         BBx+DdrPav9Yv1ULs2Sabs9cWaE7F6bVJFrJSaL7rN4aKphQZemIQsjAgQOF2u9RJQTP
         H02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        fh=8zot1upSI2H8R6lmImMcAZxMGhNVqbOcRaR+I24P3hE=;
        b=QyLD+Ms2f+K/f7IY/4OTsm/ClPPFdLR67QTwsE123Tu6cxldAgY6GuXZgcWUwrKP4V
         ecrpr9K9OdDr9TJWFbUC6S5mQIPo4UKwv7hO6axiA3DUFVcE8LIDVKW+ldfFK8Mcavtf
         BKiY5kPaWSEDLhPlW7Cx319Vk2F/NtT8ONCEWBN+zP3Za9u7K5vIFvTGmm5O7jNJH2Yk
         ORFTnXJrQdDDmA+SEzDW6jdMz6xvU/hHtwohfWzTeURGxxJIexBc0frcRhClZQN8roCp
         7RagJmhAN+ccsv2bzntMjMp8HpdEkijttFEign+ok+TtDuOs7wlVIa/6KhONc0CUinG3
         IxSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394186; x=1791998986; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        b=PGaUx81QKnvLqC7bDwSMY/z8Nqbmf6a+1L5WRxFb1rx2cSujFAT/MEQJMI/RJL3y07
         gvUq4QLJn72zWMVgplmXC/SPFxlPh907Oz7qJrTimqwdp6Zxj2fPwpi7kq8vH7WuMPw0
         r8tmDJ5o5pFgd9+E3AsxKHZ+Xulw4mkDKh5YoiL2geX4CdCL7Un8D5AXDM57+gRU/nSx
         B/fIoHCxu35V2tXPPG6N4suOCYAOqmI/fZSjkyVrEcFIL4doJgxXJbi/xFrlMOwiXkW3
         N/RokhItCo7NiV3XPbeFqO1Jfzz83A1bxBiO8783IXO1GI522ttLAjnPycIXu8AmIwx7
         kjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394186; x=1791998986;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        b=SymU4m0Wk+20dymt9Mpe4YcCQThlzRC8LcmjJWQMK/kk8vV0gY+/lQW8/Wejj2D+km
         xwGkofMc+y2yKSssf8ocVp9MFb+gPfbP3hkYBZ1Oz4UssXQimWE2xNcTX4xRpt+TI/1G
         gGT/+3nA5pb9z+rKYHq3kCcF/DPWDxBN+BUZUksuR9yuZv+b0MwaB4re4zpTYGWaV6UM
         ucUhdEMTHw5ucz+UnSLkLmqMnvLhtv+MyCqAuN4NWnEEzescsiujzziIv9QDkl6M+Spk
         X6WD3QTCvEp+nbfmY2l1QU3pFw/6umpc9C5WdojeV60imrugj0vSe+gkm9twLKWfIcZQ
         mMzw==
X-Forwarded-Encrypted: i=1; AKwUvBxg8SKZt8OTLCbJsR2OPqmnxxVojE+5A14oX96JCmfI7jsjwEkB0gpmaxano7E0hamw9Bz58c2UVv01xk8=@vger.kernel.org
X-Gm-Message-State: AFuF++mlEL3tj6TaXw4XELMupo9rkjHQNfXvFI4KFQyEpq/a1kK5mXvu
	0WrfhJxMYpT2PZ3Dwas8D93/oXoiurSzu7Lv81IB1LKOr4nyaHuf8aFXIoOO7zFSdV66Sn/ceYI
	uJyDcd2SbGhPx7sofnc7s63W5aadqong=
X-Gm-Gg: AYBFou3V9AyNPa6BgXbkNpwkHSlC15GNEyHbaGQirL0jlPIgBEQmVSR1jqQo9uJg2+i
	+dyK61pKgnbW0y0KcYRJ4yRInYh0HpXOVwB5wAmgfDQwZYSCS16Lnl7wEMvRvXYqRdhdBr2qDS0
	tMlUcrvM/GzdkN+CNVnevGRxgaSgLH0e6xI1bSAbT5pFkk8KjUAHiW31cFmNwobQJDIvs385FZe
	fwzem28tXU9SGcvqGfPQXunyZd4F8s1jzPwG4YgUeIjrr7sbMikqTbCqquTsTFZlhPPJPD8F+ku
	upIT4Ee1F9MJGgB9Jxfgjgx7eBwluAzqal3AmauRvSps43cZcNJarkZKv1CFnZvu+yy4MGjuOJn
	cUESjwoE6WeEF1w==
X-Received: by 2002:a05:6808:4f69:b0:4ec:ba7c:1dbe with SMTP id
 5614622812f47-4fc4729811bmr3186518b6e.66.1791394186597; Wed, 07 Oct 2026
 10:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
 <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
In-Reply-To: <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 7 Oct 2026 10:29:35 -0700
X-Gm-Features: AclHuK9vHOpqv4f2YdIvTFbohefG3iRaIeqgIeMjJY_8igy6Stps8jGud7-4xKQ
Message-ID: <CAGEkeHd_KRRUZ8Kqvmf2BWF8stVg=_FSbx701ibS=KdoAy4FZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil <hverkuil@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +       if (!iris_vpu_watchdog(core, core->intr_status))
> +               iris_vpu_disable_irq(core);

If the IRQ thread records a watchdog after this check, while
disable_irq() is waiting, it skips enable_irq(). The hard handler and
helper would then have disabled the IRQ twice, but the next power-on
only enables it once.

Could the helper recheck the watchdog after disable_irq() returns and
core->lock is reacquired, then call enable_irq() once to balance its
extra disable in that case?

If you use this approach for the watchdog fix, could you also add:

Suggested-by: Hungyu Lin <dennylin0707@gmail.com>

Thanks,
Hungyu
