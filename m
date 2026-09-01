Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7884749CA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279732; cv=pass; b=HsUwEKaZ8fbJjePgrH0gPdN2Yj9b297geM4qzrDW4TIDrFxZz74bwVFk5QUNF3p41sF5PGqTsBiOrBLYMfr2y3QQ4zNurjT43JBFeVh1ffDFGqO0D4N9k7gIfNkGNPbQHKajmpS8zL1xDxBscl/xNRY39cME0lVfcthYCCjZ4Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279732; c=relaxed/simple;
	bh=Zh9Qo22DVdgyIWE9/JgEgDmjV2v+axogH4c+ynR+9BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brf66rXj26MkXFr7lkuHcI4Ht4v5pvPuIiRAwWW1rvpbRddS9AgYaRxbq6rX7i2H6k2WMR2xXO8ACOBcQQi58BoN1M7ojFyyXruuHQt4cOf7KrqZn6f0+o21p1EbmxrxSRg3eQrJCiGrGIyuJgnWhH6Sg4aBf1d46IPiwjdsv9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVrFmLqc; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVrFmLqc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso786660266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788279729; cv=none;
        d=google.com; s=arc-20260327;
        b=S8GsJWr+Vv46b16EnplVijTtKIIY0zuNbx+GyJP57Ky5oM7rZCDwGt2B8ZPHo7gRxv
         Gy+AxZs+ynLNw7pjztQyJlW+oY6boiOo1Ig3/Vpzf2ERYq7+6+sqeo72wkt0lTi5zJL0
         x+L4WNLfRUeQUlMB9EcsWuoZOHYTjsuZVilRkAhrtfBf8d+yXFqqQ8OZXRtS59QHXoPs
         dl83OSHETi7UvNICF1EgmIhf4YUq/k9FkvXAcfQdLRe4zn91Au3lSseRekgCf6/qoBSi
         tg6d9JwlbOhixO6g2mgfpiY9fD6nV1NojmmtHtIUACdKO0QhDkaylvelqTIT3n0r9poI
         0PXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        fh=A/QaeRtrK+9FBXRodAI9++YMu3JN4sltEQcdblgbWwg=;
        b=Tbp+KzdI1ca/EnBixl7NkrDKYdMYaLDpVIadfXG//p1Do9v4DvvePk60MTL+Nf1yA0
         Z88yo7dZ/v8dpIWdj+8XAnq0ShnM8dOerhGXrsuUuUGV62hd7OanaoSKNaudtn6L7/TR
         rhKCebRP17v88Yecb3mlVhnpkUE35XotNFy3ADH3Ken2nTArbFYKUMGhyjfdTsj1l+Hg
         b3qztv+H2usNSetc8QSU6oxnoZolCwhb36sM7vTAjoepuXhlI1uyGcC3V/5eia4fVnSS
         CY+zqBkv1jeINNkSclN6zrY60wlfRHpGQnaRcO3pSGKHiFlOqNUFRy1APZ+n7alYEnkH
         fo/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279729; x=1788884529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        b=rVrFmLqcP/25rlRoRXtjiedV7T4N4hODM2cU6Ep1ojhMUJDRoEyu/7YGgTeF6sfrfw
         2ihIUl6g6LSTR59t2HrqEEeBpT/JdkSyWio265iHlpmFu3UPy8Lt4X4VjxsO3w24ZrTY
         2w8AMtpbh8k/PGr1huQsXYbENZtS29q/7dQ8FWqheoyWfYrChkGWMGWGJj2gSAdwhKiF
         TjfJ8/1VtG50+CBNY9umIUarJqMywld3MHG0ECsWY70eYtgcp4jDHg+lZUVglRPjO6aJ
         ktlbJ1SVHw9TdZkIm06pDrhx+m05zs2LGDURPL76lXdUDXSSEen1n9wAoa/ap71VPymu
         eIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279729; x=1788884529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDsSPiNh2VRclC95pMtLDgKaEvcqJRxEZ4xEtdWkdQg=;
        b=DoT94zTRPJBeSafCB1fZIXOUX1HLnZsHn0TYPkJw+jaRouQHFb5V734Oq3y3Cf4bdY
         ZyxsLmLClshkIBSuHNvTE3FxvhemQrNfluJW6GCAxxc9annIxekIxf/TtLC7XvZ7m4Wy
         Suy747CUMXJtK5E4qFfm4BJyA3pX9dpdY1KUAsqmqk7qmEqyPmi+LoQ6pWuQUXjTcfbr
         pqTsneD/o4ZXSdOG2pAP4i3h/E7klGxuVKFyjQg9roffCUF2UD5YTprX785SKoirEUph
         6IvaI7zRDrtjsY0nlLa0NH/GxSrnBUuJBUWrs1rAr39yAkpvUAmLxIGpJsUjaTmSktWF
         2Q2g==
X-Forwarded-Encrypted: i=1; AHgh+RrsgghQ+QvhxNeNWR71wSjXbSIr3XFa0ijFe86hWBVj1C67qF6GPST/hc/6cPFdaLMIlBCPT9Zr7LCoMco=@vger.kernel.org
X-Gm-Message-State: AFuF++kAP3wYBSDObeCiREGNWg2oFrHeYC4uOWlT1Xs6lrGIVyNhLbUa
	Pi8aXV4+oghId1PFwjzmU+KiQF4g5aAH8JtFvePkp8wZ2bsFhxgXSYlE4ZsLHv4YlsRFUqO/TNn
	lBL1VuE4owSxKUd//h4qXNPKyZbLgp5A=
X-Gm-Gg: AR+sD11+mmXFEcYrpIQTfolbQgL1NxDJkdTjl6xLCsDCkyPsxLjR3gT7TT2LnYJFawA
	giGTeW+eklDuQ7FQ2y3zmNycIrVQLMoeGPY3Lr5sv6dHp+vNWLeV4udh6NN2XQpm0E2VrLe6CFk
	pf/tuEmNdxOfODKvVRghJDwEV/s0LgqMo8mVrMw0DScDHG6USpOt/v+FC5MWe08r6AJHN2ecpg3
	9bAxyvIAJgYhtQ5C2sPdHfHcM28/rkmXuqAh/dMa7SH9mcNFryTi/W1vl5nEpNoo7RtKUfTBwG6
	U635Jey94LXIdH+VeFRu/UtQc0QAZGARk8ofKW5xCQKeSTsE8jaXJ5x6Kud433edGqwE1Dh4clC
	SW9rBNKzM4TZBJWsVJJNSVI+yKb5RCo4Kr5M=
X-Received: by 2002:a17:906:c108:b0:c25:c979:e76a with SMTP id
 a640c23a62f3a-c25c979e7fdmr216147466b.22.1788279729382; Tue, 01 Sep 2026
 09:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com> <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
In-Reply-To: <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 21:51:57 +0530
X-Gm-Features: AcwNN1UgmlzLO2QtgDmTIhpoG6ElFAFHl1rN8oIvI-bmMKMW8f6_U29Z1lRdz4I
Message-ID: <CAA-+ukLdb_98Fx8PCNesvg_-4BmCcU3jxy8QTL1-a46MCJu2ZQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, taniya.das@oss.qualcomm.com, 
	danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org, 
	robimarko@gmail.com, linux@gurudas.dev, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 21:16, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
>
> On Tue, Sep 1, 2026 at 11:25=E2=80=AFAM Sreeshankar K <sreeshankar0910@gm=
ail.com> wrote:
> >
> > This patchset introduces foundational upstream support for the Qualcomm=
 SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featurin=
g an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cort=
ex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, P=
DC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved mem=
ory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-kr=
zysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > Changelog [v9]:
> > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver=
 for SM7250
> >   Make all clk_init_data instances const across the driver.
> >
>
> [...]
>
> Patch 7 and 8 applied for next, thanks!
>
> Kind regards
> Uffe

Thanks,
Sreeshankar K
