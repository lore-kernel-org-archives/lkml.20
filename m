Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5AD387362
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273078; cv=pass; b=S/CJwzImnLiLA2GfZCjVJhsiRPypHJiMXnFF7v1bXJwGuHJtDtWYvBKzb+ssQkuo+CTpP8wzZn3o1/BDi17dsNH7zt77Owqh4rMPwgfmZTcZaV3LhPG6//7LCt9zHH7ZrWlhaaL8XWUaYB6q2cs5inKqIdO1X7GtnDHdwEatYvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273078; c=relaxed/simple;
	bh=5JCE49kjhVD4CKDJFuR7VYFhCbO5kEQuzu/oho0PrZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWQDW8ODMEGz1O220OffsGQ5W6dzP9XcJq9B2wYLgI3pcdM9OkQzBsEcqes3TFc2BHsZf9WZod7+FU/2WrxVli4ncOBpwMivmrSpvVg2V3KBfxrG83qEFPqqWJUOEFi+EOh5BS9QqSKa4ux3tFAPQWZw16Kp9UibH4ppnY+PN8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ra0nvFJa; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra0nvFJa"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1379607a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273075; cv=none;
        d=google.com; s=arc-20260327;
        b=nMTAt+MHKoLdzbTBebjf1r5JrIt8UnMgqWm3gh8s3CwKnCrwfejYs6QP9JrgrFWZR6
         F5CIEYNeBvvmfxV/+fObdiYympwRgVj5J0txKITl8UvV4IxS5j67zCTjI9LIIII6HLbW
         FgZke06l1y9qa+fI0B9OCp/pSEjBL2O7o549A/GX06u0Ce95ABPzvwcBEdQ7TmTHwHw6
         JIBgPruWntT8aTzrNLYpRITNfYY82Y5tnNRUBP9n8okqUx3FpXiJjkcMAHTCbqRRUM+2
         VGjkYFiauexghnpidbOGo+Vj0LKL8tAfDV68lvVE7/r8WjhbRRX0fVOo8JT0Cepfh9U5
         jbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        fh=qiog2ptH0YK8QWJGLOEUeZVAhzN3MPqFi2jbXRQnWMs=;
        b=nWQKtoXz4I6CaChhABHwC8nVvU9YJ/ZBGP/Qb49AunDvtVkYrsGqZ4APLzUrDZSO3t
         OoHd1neV30XDM1/t8VxYVh7HpbOHvZmHZCIbENdJBAD1XGkBkYXyHmRwdOKD1RbhY9s+
         BwEMvvqAKJHWo+z2GsKI1d0UfPhhPjuk7YFleDC2HuowZM5hXL7G38DMyjHPqOLLZF4P
         1p11EBW/uSd8JJMoiXdtShDYwYwe2TfjoaaapMGDBnpS+zvx76PoxT+XYaN0S+Vgr1UJ
         469wcl2G9tUGz1wdA3TWAKkzV9qANx6qecYZpYiUcthLtDykSz+FyMzrGWNpaUDkMXBs
         7LEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273075; x=1788877875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        b=Ra0nvFJanSQ7SkN68JImzqcpaOmtuEL15S+/IRDIAVmT7x/rTpvhfH8yKuqsqtVFKq
         QTAFGWPmu0fk6JczX285Uryl2flqajJ9WjERZ/sJ2lV+/37uSniOxoXBndM4IzNC1tuA
         qsT5IHLkXCDt9/ay/2//d4DFVQvsjTfa6iufkPv1gLiECG6xcHMC3bQr9TJM6qWk+3zT
         c38gYxIM6UZqWUlrbG3EsJ22x8sQIeTTKseBWou/Nok1r5Vavd45oNMVu0ahoZ6kVzLT
         vhWEukICnaWe8mpItmxV6Pt7f0qTOFqAbEehcJgR6gt9gj0epqs/jljEU6JNsYJ1/NHQ
         adXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273075; x=1788877875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        b=jr+jbuWE08Av4THU2MaSi3S1YXoojuOisFHQVYTGqNgo9Uv+j9fArKlpPcrFlqVuWS
         L2rRZN9HkH/S4kjO/XT2lE+e8hZBqH8DtuuUxlmhUEOYH3VD/fOUG8Lj6FgYo0xOC5w7
         wa3IXD4OgYDixlPdgRoZpfg7p8Eny6PVqBJmcgLihnCEagvCh9sBv7QrfLUUpUbhTpuW
         vPcsHKYQEg+tAQZM+dikCPkU7craHfLh0wVDip8VF//sL9OaCzYnZy9fBL6JaGPwxl3m
         QEtu21JvAA9eC4ocjtU9Tff8wVCEoZexO3xJWjuzDIFXgBoQvkZE3s2JTwFvsMvGiuP4
         2ldw==
X-Forwarded-Encrypted: i=1; AHgh+RqSPuFtzPeDlZZFb3N12Ds3YwH5k/d9s47isIooM9ZTxARj7cmYPobHWsyZxq46Ap3WezUsbnDqMlG3QnI=@vger.kernel.org
X-Gm-Message-State: AFuF++kJODgOOXm+UJ4ypauMUlU51fBEedTBFnZyXS6Nx3Hqy0kQibvp
	dru4QfkUfxM0Qf8amzhFQ2Efxj9aSjM9bQWpfTRe9O56zgWLrrcvyeoOPtvmw8YSAm1YZlknSSu
	j1wzO71p2G6MVlW3hLREVnYzur/7cC5o=
X-Gm-Gg: AYBFou3NtBxH0d0u9izV+527xEXkje+nv1V1xeK5idJIPOxwBiUuZ25sK1WPEAihY7r
	EmROMcsfnKbC1T4FpAwsqRji8U2BeTSopOJp6rRb6sgXX73QmhAecGkqU1UW8wWyABdccO1V81F
	vuiy6NyVymMSJfQHNnVS0se/eDQudIMkSEa3/r/DpOFiDFLoL3W38A9bMIuMXUhh7o79PAUbLBT
	Af9qvqQYWDhMetoAv63/RDc7XW236MV0008Nz3+73lXLpxa/N69xquhWii9isYt7Bq+P+hNf33Y
	AYhGIG+MrhvG5sQvr8/iizOox1tMDts6aGKhjRKZpnLW9s162zo0OU7WsrzdaQmL7WAdcO24AMi
	vN0dWwaYtvXviNkPnZm+dXXbWItFzdx4z/Yc=
X-Received: by 2002:a17:907:97cd:b0:c20:1c9d:8d4b with SMTP id
 a640c23a62f3a-c2556bad5d4mr1984246166b.2.1788273075015; Tue, 01 Sep 2026
 07:31:15 -0700 (PDT)
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
Date: Tue, 1 Sep 2026 20:01:04 +0530
X-Gm-Features: AcwNN1XCELOPcPvrH8u8ByY6Rzj-i1F5LZ1I1noSysoUtzBHJi3bLNMYR8sODV8
Message-ID: <CAA-+uk+k1sy1oCu8KiRod_MHWOPDzpQiVnD184srzhSggYZETA@mail.gmail.com>
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

I will keep that in mind while submitting future patchset.

Thanks,
Sreeshankar K
