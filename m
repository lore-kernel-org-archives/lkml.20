Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B399C3A4513
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865877; cv=none; b=iiL5Jhzys27Nxlnbp45G4CcXsLE7yDTcR6I4xWKmbGszEFTObZZYv0TIw9mEgYE/y4Uyfj572cicrlmw6EVRx+GvLnecPtP9c21CpUiZ52X3h/ZYYZQD3E/sH6ty7IpdY25A/fBPb6U/hXBveMlA1KOXgjcV5ryr8x8nE3+ka2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865877; c=relaxed/simple;
	bh=O6EFQcxb953o23DHB0zZwkFzyxFaoFr0xbVP0OIUS9c=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFPk3x4V+V+KfKKJTlHe9xcQ912I9YMtBkfmNo/3Iu2AyZdtG5WSlWStxQqBa5U1E/10FCiER5fYfWwS01n1fGj6dOvWcIG4L9D9jYBRusqO2v6shRJcAz8l0RJuVA77uZn19zn6B0nOcvpYo7rKy9P3MFU7eC6hWBHvMS6zinY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccAQ10pU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccAQ10pU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642841F00899
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865876;
	bh=O6EFQcxb953o23DHB0zZwkFzyxFaoFr0xbVP0OIUS9c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ccAQ10pUmIZVZo6n6gbGaoGXBltzFfvByZv/q7yd+iyg8g4/ljzfSq+t2a8Rz8FSj
	 mENQxXdxFV0yHIIsXXKqNaBBuTKnaNSjnirSy7IfhFuoG6hl25g0IXPTGGKnC94olh
	 72BjaU4s4SgtLyptchwJCgklS6JAyUNISAMQjGNciDqog/yM76HTCLrlaC1ysJfz03
	 BZsMysFRsmmqMYTHpvtE5w5MHwkiOdCUns7YghcMIn4KXr2Dq75/NePMdE3VvH2mwj
	 Eu0wYCYckiDB5Wh3r+g8iCfY0KUeNJn8UtRS+cIkfWaiYOvnS3sOscOQf7Pn2iBDPQ
	 DRFac9fHHEkmQ==
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a8736cfa68so4915791fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:44:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNnJaZemMB6ep/2k/h45dquRLn4vZL4wKl7yyOfMUCZ9pzBLtIvIHz3nR11xIII7F72hjyIoSyL1oDOVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEWzX9mCerHht1PFPolE+MtMkZEEY9QMBbMgVkXBfV92EKvFYj
	LHs1ttcuYDIx8h4ddq9UjaeD5DkmmTUCWGAQ/2XenSlkQi4/9q69Nddj1ZFzJNsqg9TwZljfIOS
	yJxx4sV7RcVnNSWc299s6fnQDvCLTgx08r5f0OL7ngA==
X-Received: by 2002:a05:651c:19ac:b0:3a3:74b9:8a7a with SMTP id
 38308e7fff4ca-3a779217c9emr14300421fa.19.1790865875146; Thu, 01 Oct 2026
 07:44:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 17:44:32 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 17:44:32 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260929155152.1898666-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com> <20260929155152.1898666-6-shengchao.guo@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 17:44:32 +0300
X-Gmail-Original-Message-ID: <CAMRc=MdU81=CLRL50QcR7M3bXdrJvkFjiSQzRdTXFXZuV_313g@mail.gmail.com>
X-Gm-Features: AclHuK9pp7HvO18L90366DebJ2ZCRbbfzeGxjPsN3WHF2HSkJ1yuhnXManp9pf8
Message-ID: <CAMRc=MdU81=CLRL50QcR7M3bXdrJvkFjiSQzRdTXFXZuV_313g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU
 PMIC support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>, 
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sep 2026 17:51:50 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>
> The Nord platform is supplied by two families of PMICs on the SPMI bus:
> eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
> Add one dtsi per PMIC type, following the established one-file-per-PMIC
> convention, and include both of them from nord-rrd.dts.
>
> The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
> after their board designators. Each one provides a GPIO controller, an
> ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
> temperature through a DIE_TEMP ADC channel. The monitors use the
> qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
> each is hooked up to a thermal zone.
>
> PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
> existing pmm8654au ompatibles while the file is named after the part
> actually populated on the board. It provides PON with a power key,
> a RTC, and a GPIO controller. The resin is described but left disabled,
> for boards that wire it up to enable.
>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
