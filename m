Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794504757;
	b=uQRZPz3G7SxV735GYKUy/SBZ4DN2twegR8zdBxNwxUKj7KYeFscnRvb3iJLm1eE/X254
	 U5d5H0ANBlCl4MBCxu3pvhToD/g79o+QP98c52mXz3CGaZ2SbbkNfjr0XROqCndPrEqBM
	 l7UQCr8mshzbqFlYz2iOteVR9Oebt0cOnSh7ZFHYJaVbemBtcJOVPh7IpXuxPP1vuwHgR
	 kLpaVl1Bf4LbC9DKiLFJqAQI7f6c0oLToWE3zPoY6Px5fxip7VmpizkY+gl9ywmoIX4t+
	 9HmBdQK+b+MulYw8uc5viPk3wvQHLPfsENtC8yW9qrKFa9P5E2CcyPUKGRCgq7HiXMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uvlpRV6PcTM08/lEakwe3Mf9uWtn57n5IAUH/fdgelQ=;
	b=Z6uRcEz/qEc2Of3imh0WzUQm4GAe+2e01cJvfO84zezsChNWhwFrbF81NKP2XiJqGkJl
	 lsV+Gvi90bB+EcWhyl88qxl3OmrdWi36OEGAvkkuA1RuIXVtBbC+Xtohn0bAh9i25FeY+
	 OHFY94TV3MBrfvW9q92EldVY/Hiv2ktvpwaJvR7e3O+SBizMIABSnmKw6N+A90sPUQmOG
	 rx2yCqjudL+FUgzoaudJyap08qbm3qTj/FWuy7vZ3e8kQ0zWsvjJRXpVMAoh5g4rDfkzP
	 ARVaFOsqR2TZCqSA7GIMjeajzptcHzWAYPxtTNQXLclTy3rSUsnyMbVsIEa/WpjP6SA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPYgXY+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFF8606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFF8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPYgXY+E
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adf222704dso1908001fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794504755; cv=none;
        d=google.com; s=arc-20260327;
        b=cFsqqKn2ItDYsfo5a0lrDWhOZtyG0ExHmMueBX6be1TCz8325bbswNYIG+WoEiPfHH
         5Ntidqp78nYdkfESVdhWuYLLOTWbYGYr33JvVWw75XfRHpPmVR5EUKH24TvR2TgrK3LY
         Y+D4iud/Wm0sHHE+VnsmoP4qOfq1C6gAP8qQv+TFrZJL6VsZiDxNNxhGJmEhFlc5W2RF
         u+F4imZfOjLgPTkUXkNNi0qelmQpQVQKi0iSWtEiSsKQQyO2D9ngUIFVLllYmfOpx/tG
         ZouG6FfssByTavrolVdTvynn0xQeZCHZ5Cp1HExyn0wFc092X8Y2On3NDzg8NDcK05AN
         tyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uvlpRV6PcTM08/lEakwe3Mf9uWtn57n5IAUH/fdgelQ=;
        fh=t3msxd4bEwjXEEpMUk+VABZZLm9LOLPPV4gxFrSm+w4=;
        b=pgmYINq3tQdK7toKDBdYV5jN5nlV//vyX3hAEoGNTwRpDVNA1L8dj762VxIue+qqBQ
         h6R0xZrHlLaiNYau2Z8GUszMYrXWbRa8O1QFqysGplyrSMphFnPUNNxln652/pbXspGt
         aqsj5OAYydIq/XacHgehG19LyTIOiCiSlJ1Ia7cgp2Gn8P8E2WMSDWLh3cTouCEuYryj
         +/cLIRDE76Qev8gPlR7gxzDPlKDP90zZ/JpanpKhEM1UWX/AEyW+W5I6DaJyOVGQHB5/
         cA8EcmIEdRxRS8uVUHwQ0/L8NZSms1Wj1Qsq8rGMl6BZhOaMUputDIgg453AvxoFXPjt
         jpuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504755; x=1795109555; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvlpRV6PcTM08/lEakwe3Mf9uWtn57n5IAUH/fdgelQ=;
        b=cPYgXY+E7vomXUXiemWyiQitJ8jT6w2ZLe7bOXWEzdEWJS94K5FgEdC+j00BRJeUuk
         C36z8XglLt3Bhpy9JGLe1SD8KgMGBjK7qulURDLvHYBM+pt7dwbpkAQZWyYaz7aCk3+d
         FE29rmRQyOJJOLGci7tIyAWGAambKQJhElA9pyZ2JmYPlZ6/oKXEgkNHihpt/dSxFhfw
         V28x/gsoDAXdfjbCAF+Bby5x3K4v9sgtU54H5jb1BMGYQCD5lDt88fqHRs7UE69ZZR6s
         +12A9ZV/AA9AlZ6vG9CVlI2E862CXkHOHhGtDbakt+WpxKFh3T9mto/7COtk1K23IhWD
         tlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504755; x=1795109555;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uvlpRV6PcTM08/lEakwe3Mf9uWtn57n5IAUH/fdgelQ=;
        b=VxrIv/+Nflk+QI4mRURl0QvxxZx4NAhAv+m3+2mdQVYrkHQGo3pgf4FOKTukMw/dOa
         AIMqxipNRowM9xNjCYu3QG+FAj4A9if6A+e2NSfx9roPZKv3NgbAaTHK/yAU5Ig3f/A8
         z6Qof1a03C+GAJnxO0cUssmr0/8/O06/YR/aSf7/Nnp1VLy7CtzTmhZCtDNnS2TQb4Uz
         ddVgu6u3J1G06EWQ6KqUuULoG8mDKA+yrYIYBgE350uEV5JSm/SJWluGBl6+FLX4UKY7
         O+Qwzf29R+llEpF9JFtWBGChf583NfO/wKJk/fZItDTODRujH0IKHLzEwktQaTPHk607
         IJqQ==
X-Forwarded-Encrypted: i=1; AL+hErE2DX1f3FRhrmtHPQTDlNFggc9EsUviXkMkE58fHtSHquK9G3z5Zyy6QPkpLEcHih9qQc4+hhS4ORfyCwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mUBgukjKzzSIuTAdPAhQpr6Z1VYm3cwd3k8yydu375swClhzu
	p8FAhxj4enGWIeoJCQMeHEhznrMVAdCOZtS8baC4tlijL5RgABGFr1Pe3Q18p2Xbj5YLHN4fgSU
	eSi5otwM/2lwFQivI/Kb2QuWfsIJc558=
X-Gm-Gg: AYBFou3AvgJ7yjJODPhwuIe+IZ2FRJcfjrQwh1l8aH8k8y5VC022BT+u7laXnz93IA0
	wmE+1kjgvdttErQK/t1kzH3Fqoj67b3CDgrCL2iGRSshntHXKkkvZw9T/CYjHC4nH1BBwe9dvpV
	pc9kxS9yQ/AONNBDVKnHupalvvOHUMuMwZcnEIFhZJ6x0kt1jtbI3jPv5epq+SJ0mwygsYZu7nm
	HyRm8YwWsqTu3LlTO4g57JNuVvJhmeUMnjjkRr90kc+khPjx1r1Ckl5ZH00xK7UJvSjBswkWFJA
	w/XdvYokrm0LQuSuC27curX0rhglsxc/WN0y3DV90VvZx7KLPQm5iowbB3uSbSAjL0GQZeykaRx
	RvdgME5BYRrZbz0uqsK41m6R5v5DnWr3Na+asncfyJblT9/qOUE0TG8PmwNb7stE5QWX9H7Q=
X-Received: by 2002:a05:6512:1288:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c170a00a41mr22428e87.6.1794504754625; Thu, 12 Nov 2026
 09:32:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-iommu-probe-race-v1-1-8c0b986b7e6e@gmail.com>
In-Reply-To: <20261112-iommu-probe-race-v1-1-8c0b986b7e6e@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 09:32:23 -0800
X-Gm-Features: AclHuK9Z7jBSZWw9Fn8TnUnk2iUH3q-Sin-aeWc7hO6RSzhS2Undt4qpZ9_1474
Message-ID: <CAEy9hNXRwH9qD-=Gj3NiY=ZVrVq02hAj0dPU+o8YfEmCcbSdNg@mail.gmail.com>
Subject: Re: [PATCH] iommu: Don't let a driver bind while bus_iommu_probe()
 still probes its device
To: aiyengar1990@gmail.com
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Please don't apply v1, and it should not go to stable. On re-reading
I found three problems:

1. "A fwspec without a group means a probe is in progress" does not
   hold on ACPI. On the driver bind path acpi_iommu_configure_id()
   creates a fwspec, and nothing there probes the device or frees the
   fwspec. So a device whose IOMMU probe failed earlier would get
   -EPROBE_DEFER from iommu_device_use_default_domain() on every bind
   attempt, where today it binds without the IOMMU. OF does not have
   this, because of_iommu_configure() either probes or frees.

2. Drivers with driver_managed_dma never call
   iommu_device_use_default_domain(), so the window stays open for
   them (e.g. pcieport with a modular IOMMU driver), and the changed
   WARN condition can then hide it.

3. Replaying dma_configure for a device whose driver is inside probe()
   is wider than I described. It applies to every such device on the
   bus that has no group yet, including a client that went ahead
   without its IOMMU after the deferred probe timeout; that client
   would get its group and default domain while its driver is probing,
   without a warning.

The race itself is as in the commit message: the client's dma_configure
sees the dev->iommu or fwspec of a concurrent bus_iommu_probe() replay
while iommu_probe_device_lock is dropped.

For v2 I intend to mark the in-progress probe explicitly in dev->iommu,
have of_iommu_configure() and acpi_iommu_configure_id() defer any caller
other than the replay while the mark is set, and leave the replay
condition and iommu_device_use_default_domain() alone. The other
ordering in the commit message (the client sets dev->driver before the
replay check) would then still warn, although nothing is wrong there
besides the warning; I would look at that separately. If you would
rather see this solved another way, please say so.

Tudor: you are on Cc because this is the same "!dev->iommu" gate on the
readiness check as in your thread
<20260323-iommu-ready-check-v1-1-5f6fef8f9f59@linaro.org>, for a
different case (one IOMMU, concurrent bind).
