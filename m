Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A83CB571
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267173; cv=pass; b=Im9iAxbIRShIr/gmAGq7TCDy/nugpYakA0dRYEr5+52auNyHIfvwq0nIlK0NWNSfzENoHTOwROmdue/eYiwvguaB58VgpHErDkgzT2mzSMVAkeMs1D7IcI4sO4d6fhbmzBoPkJ7oG3/m5syVPpXoD0aeg1/3HDDI8JFUrD7P9mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267173; c=relaxed/simple;
	bh=VG0JGy9V9Ess42oO7HJ1M9+yUlNIwa8iKwJ+GuLfhQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1FgNAR2GjLFFtKWa8/r65wobrDSxsLmntA7kyxIoKpPVmVV5RCXmutX6mfp4XUfzOkAspIam3rZFaIqFJ5e/RtvuahDkE1MHMbazensTtsfNZPyVGZwsBjZhy94S1uPX5KTXOTiDsGaIKzdiweCg4e0aeQlaMyXFSNJn7UUC9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APws7sjm; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APws7sjm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a6143cca69so1401685a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788267168; cv=none;
        d=google.com; s=arc-20260327;
        b=si2gMjaec27qRPu+JT9RLQx4qX0rDflmJCG8eQR5wvwbqBBc8vIIH6H/BVreYBmsLB
         qvj4wBoz2wFIRK6TJU0dH63y7BffI9RUrFO5ONE4nrzNTdW5FvTDsVOQVqUcoPec+lly
         0GKXYhlX46B3TLN79Xj/BqYPGn2uJU9kkvk96EVBhPJzJSvwmp0HW3A/szhhxudOm34D
         NwQ9nFVXKJtyV1KNL1995/aMYF+gKWseGJcGKspfhmZf6hFJ7j0bP1OqNFlNrFoYfeK8
         wD6kFZt1/xiuNC4xarWsOYUKZj3QKS4jKXsd7PcxmvQWIVdSJJJCBiE0PysSzYuxxdSb
         vgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        fh=gZLg2bouWwhk2CaGVf7Rb2ZjtrbxB8SoU+A6zUXmE4s=;
        b=biyYtZoUWOQUHJm09/p4kpGAnQKvghAERry9rcpqDsehA7aAkZAMPdVVWQH8J7WVSs
         7+HRC5bvdwuN3Dxb01ULHvI7xhZwdkqrcFSoQ4mR5/7vX0EciSltGPVGeVVBywYCZqo7
         AN1gqy+e40tZY6SknPC/j+czEisIkh1+jWrJNfrdo8ZmvTUpgVsLIAKUtDCH/oeXLXvz
         hmI7g3JNUTp1fVntgyzRSTFfklw8/lMF11fjyJunMhM73/dZxzN3in+v6eF1WovnCtnm
         UjPJGemG5nZmcLPRuNvuncGAv2YWq3oWO+x7xWHXVJS8nqynp+Hp0vhr+ctCYyVf7ab9
         pMiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267168; x=1788871968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        b=APws7sjm7FGRX6eDqzMDTJ6cLbEvx5rf0JczDmKeh6lwitsuvAm68EWNBoHlcj9TZQ
         ryXUqotI5ZY1D783wL43Eqz9xwj2S9Ho3jCdeo2in8E+GMEDFdRa69LUAnc5UA2KwjzO
         HahJHGS0h7NSTdJ4fTQJ4AikeQWZihGAZwL7nEDnrjQNo0/3+OGPHFPoKh/R6H8v2k79
         YnnjDF3ZMrcQ9gfRiTmtODyPPoNCMiEcaDb/1ZIhjPr9an0sNK5/TgYfz8BsTOleITAt
         VAzFDN8mZUuUIqK6xijgMDpq5UXwiKPesyLA1o2p9BmtRoaZQ6OtUiOMcDt2p5o5Q7GA
         cDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267168; x=1788871968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        b=SC3z7e8PK0HP9KY2CjOPt8jNYjk80gOI9R4J9+bZfVuqUt6j+iGuFCRYXJtfc7bvn0
         ddmUGQTtv6HzFPX3ayWSVfeAlPtEDMioVdQHlFSV54M1q4Ze7KoNnz/xV3l2e5gtjk6C
         3kwOuPysHYgOitOAh1Vy5FBHAJ+gF3C6t8va/lYom7SxhWQh2yXi1BU4u1HUBdJpUDf5
         qX2yONbDOio+j9uGDHVU1pzpkliuKaQDjCHSruVIfthH2rOfOpXp5EyK5RK3calZmSRr
         nuhLofiEgukQvz4RuDrQXRJiKo1s11qJPHFuXVII08LBdptAW/QdXz8ekQXmJyalvCw6
         COaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwY/UjkYx52sAYW0HkVjQgV7T5FYp2bHcli7fhga/uzAVVNHoaIv2jlU8TE/H+3b4vf1qz5F1G2efT0Tg=@vger.kernel.org
X-Gm-Message-State: AFuF++niBp9rjif41Rt7JfFSmQuMgzvs8RsFTEJJk8t1LTKwjdA/X3v8
	NHvpU0kYt88sxhFSZMf4fQDnBdm9566g6mgh1l50aRWJhkeNjXnAhgm5b/wzZD8ThTqGsgV2Kih
	3TF1wA6t9ND4VfR9mwlFDu+di/sDFfYk=
X-Gm-Gg: AYBFou0DVFeD68meVEhJeXvAkFXLsrnd0ZoYoVxuP60YqptMwZ8vu3NhgGv/z2rbRh5
	usQfWxdaZzI8xi2M0rQnGCJuOz5qVGWuzIXol4CXyVPNkm9dSwHspAFdfWxQwpg2kD7QuFNRowZ
	U21RrjM3WTUzCRZa7a3xYvURuQpfUTt/VSgzw/Tbl01skWPRLH5teT28beHNW28njudAEkFHrO0
	5+callBNUhL3cFuPCZBTz3IRLkXTFEwqCOrjXZpuBFlfaj/nHQCXhL3aNKFklCk513H+R93CqA+
	SWz4GP5p9xyVXLN/lcp1/4ii6aviTZfVt7NE+EXYVtceKvI/EpZM23b3usbkWAE94QO/HMJTol1
	5xKU=
X-Received: by 2002:a05:6402:44c2:b0:6a6:32f6:c with SMTP id
 4fb4d7f45d1cf-6a632f6013amr11282461a12.18.1788267168126; Tue, 01 Sep 2026
 05:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com> <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
In-Reply-To: <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 18:22:34 +0530
X-Gm-Features: AcwNN1U55mxl5Buv8KaT17jt0XFpq4P8gD6bW6R2dqKayvNk2vS1r-azwArTaqc
Message-ID: <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com>
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

On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 09:24:35, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved memory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > Changelog [v9]:
> > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> >   Make all clk_init_data instances const across the driver.
>
> You sent 3 versions in less than 24 hours. Please slow down.
>
> Give a chance to the reviewers to have a look at each version before
> sending a new one.


I apologize for my actions. v7 was the intended new patchset. Unfortunately
there was an interruption during submission of patches, only 08/12
patches submitted.
That's why I submitted the v8 patchset.

Regards,
Sreeshankar K
