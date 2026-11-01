Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793573527;
	b=bzqh60J5Amx/EZllmB/oKpg1ACHA0ulYW+KFGv9oXWOK3iGMaALY7ssYN2U+908IADF5
	 681pvg5EMiA4HIb8tqjIsGvhCfN72YqKZjZRmC9cTOM2FWDIhnFteizgUhhqUn9Zb7keV
	 ztQP/xJereGH7WBP/K/sduRfJJ0UwHZBBTGnquZ2JPkS973tISB9WQpeDhwRwXeNRtwfv
	 DL/F1o1rCMZolr/txcYtgboFSE7dCgO1G+bKHbK8s+R1nZGMJluOKYSceWbLpM1CqC8qr
	 akM29ivmaTGLD5YlmZyVlAI5OemFSsS/rtTVqtKoa/mBAZxb2iksuSDV8N0BKxeR0Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793573527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
	b=Yg5JazVYHluPp10eaASYUwNU6cvcVi2DxJBAL7MfsFh/9XIsN6mBwF1uoMREM351vsz/
	 6LoQOJnG9SMP6zhUcBW9FkLXiY/NaYleP0k8uSHnN00k70tzHqanrgbwX9lbXDmqCtSsT
	 Fd3WSfbwmv3ey7lK2WjQvY4VNm8MkhDofE35+VSaMfTpwcRCSqUc4XsUu3blEmUoa2tm5
	 nwLCAcOqVToEasYevUKfzXYysrLjRRd2EoAuspHM9raxFJU1O1VfVToxUdyjhuVQ+gff6
	 DJmrsh7cIFhCRiYkUOI8d0L6tbp+49rcpD0bqIysbWOSBOQa/LPUUfOPbK2+xlJIFsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ68MGIt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E45606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E45606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ68MGIt
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67a2efec15cso2089384d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573526; cv=none;
        d=google.com; s=arc-20260327;
        b=RljHPSQmWGgA7kp0eeAV8/mA+q21qRG2+7b+VAiRjHZEpCAc53GqVi1hLMpd3zwhnZ
         RMPWl69e67xDbLNS2YK0DMuJ8Y/hRcvmpNXcDOOvPRnVAIx9y1H1OKHRCzDvI8tvvRmE
         o183UzeB18WlKlhoE7V2MyrsuN5yQPSSrNOwgb4mxQ/k4EOrLvJPV70dYvPKl8tSboVt
         wwygP17qj8j/qnFcyQ/kKZN8KmhDNllFc2wlvEOtpXokzvEeRYXcRUC5Q3Fu+c1PlmGw
         XyPNEJHari8iLLSsQweJDqZIh3dj91bODs6g05PN0lS9c7FZxT9sX8xQtRRZeK0icgug
         45pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        fh=UFCRoGSOVKM+ol605Q65X9RHaGkKH6Zvm846ouRImPE=;
        b=EW7GZG4dWCroTdrYlEbN0WNCboWPbbHUFA0dsx3RblT1VS72HWr9aXDLuQl1bsYHxR
         SrbjmhBDGYNYSpfcuPV0YgqD528cxodbh+sFKUFxvdHCFHxGgUdq/fN/2e20Y96cLll0
         Px8yafsUIG7sN1z1Lzh56ABVBP5912xYkTG03KhRv3KAFJv6gmaDYu6NQO7fAbd2nCi5
         dykzI9noLhl16Et6ypKUH3cyJ/gavX22QzB+4soGaDv9KLsfmV+McqGbViIJzIR17kqj
         DrmORRRanllVxCMcgi3MRGdoX5b+4sXIRnep43ZYJy6gOmW3CIH8MrjBVydc0useHH7A
         gshg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573526; x=1794178326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        b=KZ68MGItEmtYSfdv3J5fm/2IoBnChVUSeKbq2Pa66qGPTCPZjw3TnNDR7b/HHfTnOI
         ZSBqujYvLhZYxAyeD7AOQlWvl2xFdw7h5YJjYkR/NPjxhHERs2SmsKmpXIVnrPT4zSPg
         q2Ia8TIOxDqtwOhukNHLVzi51sI/YjxQCjWW2edbHWxYb6U9wnMm+E2pZpD4SE59rzRL
         /6ygKXGOOPT09kBvGn9s7JyMMiYKF8/BEANC3gI5wCCHaOEjUK1RbKZJ9aql47PupZTh
         SxgglZnclSCWdppYicxZ/COEGDmi9VA3TnJnENbWlAKvgs3NxWelCFEKOE6eb1X67v0S
         KLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573526; x=1794178326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOzU4J0to3q5u75B4/uwG0UTHx1qIwAg/dSoR7NVoag=;
        b=z5ibFarRfmNcl0BdRJe3Q5GHX3qec+c3QbGpKOe2ZlhrJnozdUm+EsUq/217Tefki4
         7fCEMmq7Rbsc1edww6qVtgNRZFGVFEWKSaXtY4yV2SyZ1AY1Vz0L1NlziSjK8k2onOia
         toA3PnScwjrICOrDmH4xNHbCRk8jZBE2J3yktBEW/deIliCK0Pm28qfT22SYCggv1Tqs
         94EZ9wVfNzdaVD7jbyVvqDsv2iOa1uSxXqOvdqOorb2WtFIArEjJzC1cPq/xZ1LJFaBp
         FgrJBZIVfyNMaDGlVAS+fL65jkh5boyhBg8GpUeOdp6K0EWmbDqUjIjlivFPkNZi/TN8
         B8DQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1pifLv483t95FtgFgrx3hh+G4+Dz1KzO5bXLZLmiLx0LALbNnEG4nq7GseTVjlLBzIqDirqsp2DT/jHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EHhfGLOAjIMUNbEbiU/YpO2gLrpQ/wH+nZMjVlliHUEeS7KpN
	JtYNM18zHjhaRd6fDnAt0fgO4JDo8IJp/tZlW6HkjjfmTtQR46wtCSLLfUhT26JVKyJX4kvYfrM
	qU8zEGKGXu9fYYlQnMh8+DriU/tdOzEA=
X-Gm-Gg: AYBFou2Gwl94/bg16DqnVe1P8yQ7IW3pKfbpx53BvXQa6F0v//7i/s3cMTV0/v4qzOf
	7LxtuuAcfpbQa5aXWD5grjtRnyo0R6vzLDZ5C3tanyOLZU6gDUS9RP+uddgwrOSwWawXWJyP8DI
	kScBc1+gNVqL9LAEUv0MKbyus28qolHS46IisQBFrmbUtBcDItubPuHN2l37uk02oFh9Bq+g7Pb
	r4bFtPwIdMRdSGJs1R936K6yq2WUZgXXw7cK7r3L4Pie51szyn6PGXFuw2xPO+mptMGqvhOOsNX
	dmNMES2bZut4F+UD/jPLNiNrC25Y9gYO3wmMSY0WNbsoa4MLjYS+d4VKBgeaqGrbaZ2DJYsU7SX
	7KDiBxqQ/XHaPxLT8objPe9VzldrvnjiXEeCI9XNXiDyPoLMC60i1XdVso8RSIeSeT55YIQ==
X-Received: by 2002:a05:690e:d8b:b0:679:c17e:407a with SMTP id
 956f58d0204a3-67a8d6465a6mr9056359d50.49.1793573526001; Sun, 01 Nov 2026
 14:52:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H> <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H> <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com> <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
In-Reply-To: <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:51:55 +0100
X-Gm-Features: AclHuK_A-gwxcDtkBYM_gQIRYpVip7Aj0wblI5gGxYX_krXiPxYiKaGZaOCuxQI
Message-ID: <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, christian.koever-draxl@student.uibk.ac.at, 
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chuan,

On Thu, Oct 29, 2026 at 6:30=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> w=
rote:
[...]
> Regarding the concern I mentioned above about supporting a unified
> cpufreq driver across S4, C3, T7, ..., A9, let me explain it in more deta=
il:
>     - These SoCs fall into several hardware architecture categories, and
> I'm wondering whether we could take all of them into consideration and
> implement them in a single amlogic-cpufreq.c, for example:
I think the main question here is: how much code is shared between
various SoC generations.

>       * S4/C3: 1 * cluster
>       * T7: 2 * clusters
>       * S7/S7D/S6: 1 * cluster + DSU
>       * A9: 2 * clusters + DSU (the 2 clusters share one DSU)
>     - For different hardware architectures, the resources that the
> cpufreq driver has to manage also differ and are coupled with each
> other, for example:
>       * S7/S7D/S6: the CPUs and the DSU share a single power rail, and
> the DSU frequency scales proportionally with the CPU frequency
> (typically dsu_clk =3D cpu_clk * 80%)
>       * A9: the resources that A9 needs to manage are relatively more
> complicated ...
>     - Optimizing the cpufreq transition latency:
>       * Clock latency: for most S4/C3/T7 customers, the released bl31.bin
> only supports configuring the CPU clock through SMCs with discrete clock
> rates. Frequent set_rate()/set_parent() calls in the kernel would result
> in a relatively large clock latency, and would cause the sugov thread to
> consume too much CPU time, hurting scheduling performance.
We also support a few more SoC generations upstream:
- Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
the CPU clock to XTAL for stable operating during clock changes (which
should go into a cpufreq driver that implements target_intermediate).
There's no secure monitor or firmware involved for CPU clocks.
- GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
we're good with what we have (meaning: no custom cpufreq driver
needed)
- G12A single cluster, no DSU: needs a cpufreq driver that implements
target_intermediate (currently it's managed on clock driver side in
kernel space, no firmware involved)
- G12B multi cluster, no DSU: needs a cpufreq driver that implements
target_intermediate (currently it's managed on clock driver side in
kernel space, no firmware involved)
- SM1 single cluster and DSU: needs a cpufreq driver that implements
target_intermediate (currently it's managed on clock driver side in
kernel space, no firmware involved)

[...]
> The amlogic-cpufreq.c as implemented here can indeed cover the case of a
> single cluster with no shared resources, such as S4/C3/T7. However, for
> the upcoming SoCs where multiple clusters share resources, it may not be
> sufficient to cover: for example, on S7/S7D/S6 the CPUs and the DSU
> share one regulator; on A9 the two clusters share the dsu_clk, and the
> sharing relationships among cpu_reg, cpu_sram_reg, dsu_reg and
> dsu_sram_reg are even more complicated. For such cases, extending the
> current amlogic-cpufreq.c would be rather difficult, so we would like to
> make an overall evaluation.
I think you're making a good point why it's fine to have multiple
cpufreq drivers for Amlogic SoCs.
My suggestion instead is to name the driver in this series
amlogic-s4-cpufreq (or similar). From what I understand C3 support
(maybe also T7?) can be easily added to the same driver.
For the 32-bit SoCs I'm planning to implement amlogic-meson8-cpufreq.
I don't know how relevant DSU is on SM1, depending on how tricky it is
support may either go into amlogic-meson8-cpufreq or (a new)
amlogic-meson-g12a-cpufreq.
And for the newer SoCs like S7/S7D/S6/A9/... I trust your instinct on
whether they should be in one driver or multiple.

> We have done a lot of optimization on these issues from both the
> hardware and software sides, and we would like the cpufreq driver we
> submit upstream to cover these optimizations as much as possible. For
> example, the bl31.bin for S4/C3/T7 has already been released, and
> updating bl31.bin may cause extra trouble for customers, so we would
> also like to balance this and see how to minimize the impact.
I agree. I my opinion it would be best to allow the OS (in this case:
Linux) to manage clocks so (closed source) firmware binary blob
updates cannot cause any trouble.


Best regards,
Martin
