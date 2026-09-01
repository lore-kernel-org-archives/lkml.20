Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320603542F6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273013; cv=pass; b=KDqD5K7nsCeZFL1pnBNG+6AAvjjjITVGVkxdmD1uzjho8pL/vvVd3rUBrt7G2FrdH0okEzrJhewRrBt4l9Q4h7wysKPrhInvGaKLEYx8PGhChftXSWoYsJ/XO0RAFHy028y5uqPQCfZqjvVmu12uA/Aiyc2c9lvC8nOAWsfy9T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273013; c=relaxed/simple;
	bh=hO66QjvFvGCV1TK4yqeQYuxk+Mmmppj+GGDoeW2H4xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpNFc/Sz9BjkMHqr/bNUdwegPmlcRdXd+5Ne9+7QHQsV+CJw8HQ3fTPTvddVFs3t7tQL28XAZSF1PUsXvNqwLhgroG1qpS/uK0aBvYxxja0hH6L52DyywI22BvQqtiSbyyYFkPcjX5UWSwZaTqnDPLg0W5zBbcS6wNp7KqYSXkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8i0PAXA; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8i0PAXA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso6167042a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273009; cv=none;
        d=google.com; s=arc-20260327;
        b=d5KBYWX2tXc1Fy6fH4jC2tMdvJOvicwTJ8rpfjONVIAGCP3xyyIxNbs1JKNE77F+j3
         P5IjeuvLZm0TVw018fUJ6PPqos7d+FPHG2g9F8EPL/qpaQ+Ka/iGrAiw4Yq8M9VFyn5o
         4Q2K34wvz60M8KgJ1RqcSCBCKAs9J5u7U6mRNpfWlvxZI2hUSMsLO2gznGKkOSSvRBrv
         ZTKx2Z92AOKyP8Eee7HMyDbtRzcMLzfUTuIkfnrrhI1PokY33hdvXJbIyp7As7nl9L32
         ltnlq6tR86qZ8qPjMVqxMb+4z7aVq5JiTNFTq+GIrcjWFB2UdPIw5JVXstvARbnW0NXo
         YbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        fh=dKU1OYXFhSrzAz11ntJzXC83/JtDjQ2RWS8eyFQfPag=;
        b=WkpgyT8mVm3impFh+XdyfoFcOd7y1xThG6SUw+tc8cy9tmSagWDNWPOkbJh1xYmiPr
         TBFgumSDVNv+Ddtc3sb4rZH0er6gw5UFEP63gRZydIBWfWkwqJrm0Pi/g0SMabhE57dC
         CZLeXdcyx+doUki8Co8xA3QQ5q6LsmFj6HUJ5FivMQDYLVhGMpOxgozPAjsDarCJI7ah
         7beHEI6AoaKT85JITxJSx99p4R0BTiUIGxLTSzEWomvXfy21mhTSoRI1oXhlwOObI0ov
         dl58PXjxOCEKp0ZbBHIVZTTR+dGFJMOfEQJeauc4pmxY4M+dh7dXCg3etgMYmf7AVYVG
         GRRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273009; x=1788877809; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        b=G8i0PAXACK+x6b7YMOSSEYqE2ah4sBav28gW8nzr517OMaqMhws4nSJOpQNNmn7zW1
         wQ0/a8VuGvLZTL6b+2OBf4bupxWVabAFolphncNoqCCQU9gtffm8iGSAep3sG+NJWy7l
         gyQLjWQUeNNL3lccKQ6eBbjTtkBycAD6f6cT6ei6GTutS1eK7Drv/VudGrJdjcEeE2Jb
         ii0TUU89Ne4TkN5HNaD0de43fZSand20o59WVIEEAWSH6kj9FunPEkcA6MkOQmqpRNsk
         y8rCYtMIXWe68PRx7aDWHhs9b5jvmRYqEJGx9lhOqmgDRIt8luOtxljjqwfWqJ2Vtc/o
         gsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273009; x=1788877809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        b=P0A3lehF5L61a7dWOsIqNuIVrsTV8iVXW/Lmgb8uiJycVTcAkleKrNrRx4sNo/Pzvk
         b9PH0iZ3jpbsFpvnLuh/OlIM1BjteOwIxqjQfXHAp/CwO07pSI1suRYcHfMrR9toQW8e
         KKruU2w0t3taHAbYsR3PtX8/Gpsd2oBeyTdxRJZ38PxsU2VDFueqdHErg2WaVOApukgu
         8FnO7RGvZI1j0Xyk3E2M2jWjWwP4POvN3y4iq8WaYrlTfD9pXZI+TxHtm8ndpUwlDDAM
         Cs2zR5JLm3gJkbjI5Q9oKT1+XjNljdyE+YOGxDwxhvtaWKA9tLpkzK8lLhiMiwCAdYSV
         tjHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwK3A5+7ACvQ3VmvvegwfXkFwRkT6RerYJqkQEPhl5I3ZNv5fuuDH8E7Z3Qgwl6CvTCRf9aLxGL4AlBJo=@vger.kernel.org
X-Gm-Message-State: AFuF++kbAcSx3wgNlyx23oTiQgwDUlSw/s8J9aa8Xf+uePQYp0Yhhbxs
	C9r+brizNj+wIlxv2G7xpLrUSUeqkSSXP48wZor2onbucGGTNOnj60ceHhwscGjZGWL9KFz0GNs
	FRRPxbpKyvz6RtjuIVln6eh3SocYgMhk=
X-Gm-Gg: AR+sD11ki7PpfbuU2uN4x21QZ+z3fE6G3O5cIzFp14M41CGYe9krmPCS+yow44HTnQm
	55NbmaXF14y3RgEk3j5O9Ef96CoTj01UQsLMg4ii2HjhYFerjJwdtqwlF65pTuSRBnxwIRDCffm
	8/2JE3tTHLEGawWQYOj2rsDvmdKKIo75oAnInb4PFXUGCOpyrKcFijXcWnG+Dn6HpTZTy7nr2/x
	CPQHRcSE4nAGOlVlK0wx+/iLlbnXDen42gFswGJQSfZKV9Da3K8v/tQPWQ8KTugvJeFNSwL6YBK
	TO25Z75ZnVlnsBtOvylccbBEW8R/rlFS05xL+WbGiMQS9z13ynh9WSZhd02ekGnekq9VnmUf6pG
	CtaDzcdGHR3LYsHxsQPYWX4MroZE0/YmpF7c=
X-Received: by 2002:a17:907:c1f:b0:c16:12ff:dc93 with SMTP id
 a640c23a62f3a-c25b3d6fd4amr496747966b.18.1788273009053; Tue, 01 Sep 2026
 07:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
 <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
 <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com> <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
In-Reply-To: <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 19:59:55 +0530
X-Gm-Features: AcwNN1Uomn3Xc_3Adcsk8DWFI-MLIGjMbU2Tt_GmbXn_JHJipzIc1HtCVCNKh-A
Message-ID: <CAA-+uk+orBPf3uCpwyC02Wnvk9mzChukO494wuPfu2r5PpX9dQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 19:51, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 18:22:34, Sreeshankar K wrote:
> > On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > >
> > > On 26-09-01 09:24:35, Sreeshankar K wrote:
> > > > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > > > SoC (internally codenamed Lito).
> > > >
> > > > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > > > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > > > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> > > >
> > > > This patchset is organized as follows:
> > > > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > > > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > > > interrupt controllers, clock providers, power domains, and reserved memory.
> > > >
> > > > Dependencies:
> > > > This patchset depends on the following patch:
> > > > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > > >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> > > >
> > > > Changelog [v9]:
> > > > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > > >   Make all clk_init_data instances const across the driver.
> > >
> > > You sent 3 versions in less than 24 hours. Please slow down.
> > >
> > > Give a chance to the reviewers to have a look at each version before
> > > sending a new one.
> >
> >
> > I apologize for my actions. v7 was the intended new patchset. Unfortunately
> > there was an interruption during submission of patches, only 08/12
> > patches submitted.
> > That's why I submitted the v8 patchset.
>
> Yes, and now you have sent v9. So even without the v7, you still have 2
> version in just a couple of hours.
