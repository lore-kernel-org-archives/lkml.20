Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F41B436BC0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447485; cv=pass; b=hGKgest1rZTZ/xV0yDgSnc00CIMVEU4620ldp0tOX7AWrzwPg6Y388ydRvg3RSUPyXv2nF6qUMGrgVUoDq70xiEN1hFEJFfeA4MmuPGjTZ09ucDMCE5pgpKAiq5w0bgwPiw73cnQhvl9msQ9OIxXNBar/4JAxU9B/BmiBpZIfrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447485; c=relaxed/simple;
	bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnI0hMcgiqldaqf9x6sm2pGhKbPOFmCo/Hjp9SWeW3/ythNPNEqDHhobyb15Hc+VV/IyGDQXbkXBLS/oMCKdy4ZgjTvZqD+YVxmzRLHcZBX+YJmuJUIzsc0dh8O+UVdn1YPM3/znIakSoVSnmHwhz9zvMzIzPHpIpmfxoTBcFEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZyfek/v; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZyfek/v"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so373469866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447482; cv=none;
        d=google.com; s=arc-20260327;
        b=hkTfD3PeNTGeEFyeB7uvwdFM3wEVp6SrMtPiNd25KXQafddAzZMfP6AloImh8S3GR+
         nHGDdSiNLaWrn/zBRS3R3BeLxyQWxmH3NeaPER8VZS7GVANrzJ/6K2nlw2wQH7ivYThB
         wMaaTD6QGmIBwkYUndqtDTc6KwWqC+nK/j3GOQIkzwN3dthWEBY5t5ajnwISgIDHKkYh
         xg/5+4CN5SZ4zbhW8BS0EhknKfRs94tXg88y7rvP8lq9jQ4fglm3281eYmKmHZLPvY++
         511u3BPxgANs+3ZZm2AACC6gZeaa2s00pOy2VHFbBxv2R5nktcAuACbfQhvhotFVPfwG
         NPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        fh=xu1DXqfeMKJIIEJWPunc70UveegzMNQWkWnBFr6kXaQ=;
        b=Il1ickbDrf+ceV+EoVRW88OkDyJp/iGinyLzaINLH7iI9I9+qnonBoYM6vWC/Levt4
         iMhpY1BRwlktn3kzKVpKtsl5t4HHtbGOJ0rNCG5XxHSwc/5R9uMWHpcL0sKkDTYkXsmq
         dB5CWyd/OllPs0ykYwoXeF40sRaSqwLp1Pky14AhLrO/7DMvrMS9k7M+OTrdt0bVfIU9
         fj6aYJFlAFxH6r/UYVTC/UagMHsGsG37Yxe6kT2l4/c+Kq+/wRY6AyMcpOCVqoTh07wy
         TOAMbqwItQuoVmq08Fi1KFj3EBiQc7M/0mLv5zhH01UEgIgiw6+OuB2M52VZW3BY1c2D
         Bu4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447482; x=1790052282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        b=WZyfek/v0y5My/4Go6IzmI693eIU9JC3pQ7MpNoRTcFL6MMm4Qd1ROaWIa8qv7tuOp
         zMqQqLd+fGiv03FI5L0jmfdNszWlJSB3Tw5mFonuCzYUjdwWJ5n7PdAXKvZucmNJtdMu
         5DsUpPF9H6YoqH8dxVC5hq+cotHi7qUCI9SGgWEOUS+QhWObJrX6Idhf/XviUjQiFCE7
         IQx4WOaIEDvleSTmlrQJsC9oCXSgvbXbUyZW0WtC3Iu9/uq18fvChD4nsO6UtC7bn1d8
         MA/m1Xoopr9AOdvaku7r7qsFMRTDegDVQBB684gXzfCBUr4bhVkMpc2G1e3vAqBUGG8A
         0vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447482; x=1790052282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        b=hm7zaHRnFRXGEBjVVth9GGrwfz46BoZhXe3Su/C6kS3AaAetmJ4KQjYSROeZGTUc9a
         ou0KFogQfD/3nEuhTdzN76vr4PCrB25N49Oqx/fDuyRwNe6Nrs+At6U8HInsI4BiAggw
         m2nOoEdxijs5V6MpqJscl3vc0wRajowVZeJuZQXinPE3FNqp1uG+DKeykQKl8Y9hM58f
         XD+a/KYhG1vmA9mqi/ke/jJQWumiXuupSwjbb6EQZeJOEoGjndF+kpx9gQfbJpCFQIRl
         72LSdQbEVeH6zOlMO5bpE6lut/FnvGDVoL/J4duRY6N1XnOWuWfdN265Csx3yrmefX9a
         po3A==
X-Forwarded-Encrypted: i=1; AKwUvBxcNywUjQpQlUItFzIGPY9xWotLncqf6YZC8HR2HxrY5+hxMuOaeUSv0OLY7bImNRgNBT0a2b1QXfpfxP8=@vger.kernel.org
X-Gm-Message-State: AFuF++m/G5W6Ic5qmU9xcFV4x8p23ZHSf5Wkw6g/tJrvBbj+l6xtpZON
	fJIUpnubJOVQYVi9l9SqXiuG6G6yAwflmVo5zj4R83l5CtJqAXnFuNlu6aC29raRokhRgOePyUn
	ceJUVFJb3UfetlQxRJoNzD42oB73XYHSPpdzB
X-Gm-Gg: AYBFou1bR3q5UQqO8nbvT119F73uZXb3jI57x+cNfHfUwegiLBOmsn9ULzFd3lb7uKU
	YhnI//7/pjoRkgiEYySM29HhsnLM4lzqB9UAw9n/sx8Yyw7nMFpDlKYT5BhZaSnpljC7Suv+P0d
	rgRNufbV3VJQXE/EmMrrCbqOAYUPrxYoQKZBWLVNo2/wLBA95/Enxg0CnG3lA40uEOI7qWm2QD7
	1D9Y/3mP2RRtB/Qrz6iBZp/REl6nr/Y7Izk0mqELb3OQqaTJLWCYZdCtyuFbABsaoETjPgcfqNU
	Ol0EaLhOyBj1eCxHCCplz6ePkCIjLZ4WocBn0BCKqCYj6mawYyzh2A==
X-Received: by 2002:a17:907:3e07:b0:c25:8c05:902f with SMTP id
 a640c23a62f3a-c29b86b7559mr700042866b.13.1789447481668; Mon, 14 Sep 2026
 21:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-9-linux.amoon@gmail.com>
 <8d547f65-a260-4b8b-80e4-4695d4422497@kernel.org>
In-Reply-To: <8d547f65-a260-4b8b-80e4-4695d4422497@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:14:25 +0530
X-Gm-Features: AcwNN1UE0alxnYRR3jtRD2u3dEd1ayGXdU2bhjTuNvTUC-ZbJLtS9W7X8MU3WLY
Message-ID: <CANAwSgTEJf0gYQZKPQm+=90S5i2dRpJzOLv0gkyt+4ZmUTWZ=g@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] thermal/drivers/exynos: Add missing drvdata
 assignment in Exynos TMU probe
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > Add dev_set_drvdata(&pdev->dev, data) early in the probe function,
> > ensuring that the driver data is properly registered and accessible
> > throughout the lifecycle of the device.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> This is somehow confusing or completely incorrect code.
>
> Either this was needed by the driver or not. If it was, then why no bug
> is being described? If this was not needed, then you are doing no-op
> changes.
>
I was looking into other SoCs that use this while debugging the
device-tree mapping issue,
so I initially tried adding it. If it is not required, I will drop this change.
>
>
> Best regards,
> Krzysztof

Thanks
-Anand
