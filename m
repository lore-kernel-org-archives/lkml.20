Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4210E3C1D68
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895416; cv=none; b=gLxB/2mg5+OUylIq28ihzu4oA62rwC7Gd2Q2C69tr6PpZ9EP7Yf0C1Fa+IMfz1tOWu2uLLXvICR1fUHeG+qqH1IOX6gBuoCrvL3jZd4hLY9YdvBYj/Wg2VvpcWF09Og9yzwx+UHLitcgJimS5hc7GJS54WKgJowR3JatUoUnsuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895416; c=relaxed/simple;
	bh=to5uV5k5TOrazCBV9YJapntDtlNVOxHcGL/QcW0Vhv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vDspc/B0IDjxNbO2btzQhXwQGUa8Ry72i6MQCwK9yzdpjEDjwGeiQLa7UT62h0zXKNp62MYBAgZjaNxyymvvLE+T1NFH3NKZAz8CivqfAtAUN/lUvr+CN9Tw6gHz00cZ1OjCc6ubtQq/261EreSW63Wtrp82Moja3FS4tfYseHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmTyhuSi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmTyhuSi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e29049adso245784f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787895412; x=1788500212; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vXjynDGOZctwtTH5h5fAKF7NFOdGmTdhhXt2jWPkW3M=;
        b=dmTyhuSiT+XT02yWRXNSzmaOSi06Hf2+xgu5FTnSYYG6I6b8S5dklZtuTs2kKq/EW9
         kBvXan3TPGueSsP3BgEjdKURcrivAYJTvQZRcAa03OAXuYx9SjX4jXOO4zHRCErtFTNt
         Xt0QiSptC513jNB+eIqrMqETzyonpD+dWXZhFDoXDJz4gmy1Ta99Zsr7jM6VXL64c83+
         ynREdnHbU/qd+mR/MZv5Exi+0naLZGEMwPNzPjb66FD8Bvzmib0bCwjwenxqAST/KtTG
         kUbpbGxlF+Y0xFYF3tCrbT0mYwmOd0AyqAa16460asQKoDrXaL2q0CV5uRyRkHvePUkL
         UMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895412; x=1788500212;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vXjynDGOZctwtTH5h5fAKF7NFOdGmTdhhXt2jWPkW3M=;
        b=IoTNsc/7bAAhQMlxGDosw0qqk3wsdfYLQufyFapCJyzg/6FK3peU//nCCar8vah/et
         hAjKzJEzo83T7ADEjUOrFhTc5SJkojjTKeA2FH/Hivc4k/CY4cz+dd+d0oJJYg1Jch6B
         MRVV3IuS2JCZTjJ65vjqXxDbN6rtI+a1AnSQH1tSbXugUAmtsj1LleFR84p8dbPLdyDJ
         XlXZRvJCElaRh5ecbULXlGSJdOegJAkvnC/rIADikz8xnXdcy3GMIqlV4ecMTzqNAOiR
         Xig1FhMI2V1ltKnoE6jAuDQSmJPh+lGkr6l+LC4M865AJFvYGKE1gHdVrSt+oAJ9YbFK
         Gteg==
X-Forwarded-Encrypted: i=1; AHgh+Ro16Cx7362eMhEhPAyOM28fVKtJfO8KTvWjo0dpiB+f9c3WKyJ9XQS2upcbCIHWhC74nBXLQV4ncvQwOcU=@vger.kernel.org
X-Gm-Message-State: AFuF++kdkcwZvqwcS5qBpt5N7V7PGkOBzfXOy00JFVJYjNTcdNvSnqBC
	EdvJQdsRqVjLCpUWEhb1Tlm7pRGwhXeNI8x0vSrclSeIqe3me4S/Zfr/awi6ei8swI6v5T2xUCS
	IPy/7
X-Gm-Gg: AR+sD13pSBmp3EqT0W9GflkecTbyShghwscimc/zQP1A69M0vgWgeO7QamWeeOFEcwJ
	LGbb5zI+0f/+BsTvEANRs0gkxLWznRJjNLcUGQGZWGo2n5qlATRfpZ00yBc5RG9yBIYuaJ6mm1y
	eKqhfE/k3eiqtZDoDmbB5JZaR9Yw3rxkHu6WYfoYe9Xc1uW4n810uySAx1zKpfJTlYE4HB0WOt3
	lhYpri1HwqNmGTMqAHxfRafyuHvQrqGYz4sQ0YxksxJAwOgw2Yfm9pS6eS59sVklcMiwZIqumEr
	T9r3hNUfizMg87TkT7vUdwHHyhM3HXLe/kXacrw7qph0PL8yWFX0naTlnWR6/aDfC06jjs6OpgU
	Iog7hSF+T98759BwxnZkcruZhENX6qmJX4Oqyy8QEZ1hp8EOCcR1Wyziyjd35EuP2o5RtAv1Wjv
	cxsBCuk+MJ2B7t6gbgoGzj4HM/KQLkk6jb7XejI3uAHhbBZXnpZPyLkS62eDW0mEcFzxj9ojKxA
	B9qCqHxfqf2zAjlttloZoR4q1mBHsWnAIOdnDu8UtducLs55WwwPewOh3eYbLI=
X-Received: by 2002:a05:6000:41d0:b0:482:f344:5325 with SMTP id ffacd0b85a97d-482f79cc0c0mr6024207f8f.3.1787895411715;
        Thu, 27 Aug 2026 22:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm1410402f8f.10.2026.08.27.22.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:36:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Exynos PMU fixes for cpu hotplug and cpuidle
 routines
Date: Fri, 28 Aug 2026 06:36:45 +0100
Message-Id: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0ekWoC/42NQQqDMBBFryKz7pSYEqtd9R7FhSSjDtgkJDUok
 rs39QRdvv/g/QMiBaYIj+qAQIkjO1tAXirQ82AnQjaFQQrZiEYopG23LqJ/r6j9OvviF8KRN4p
 4k6Mic9dd041QCj7QKUrg1ReeOX5c2M+zVP/W/7qpRoFCG6F0Ww+tNM+F7RDc1YUJ+pzzF+gkC
 5nHAAAA
X-Change-ID: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

This was reported by Sashiko here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
and was mainly introduced by enabling cpu hotplug
support and cpuidle for gs101-based SoCs.

In this second version one patch was dropped to keep things consistent with
downstream implementation and due to lack of information. Other patches
deal with a few missing error paths issues here and there in
setup_cpuhp_and_cpuidle() and around. They were updated per discussions.

Tested on exynos850 e850-96 board with sequential series that implements
hotplug. I don't see any regressions but testing from others will be
appreciated.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- destroy_cpuhp_and_cpuidle() is called only if
  (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) == true
  (as suggested by Peter) (second patch in this series);
- in clean_cpuhp_states error path the cpuhp states variables are now
  reset to CPUHP_INVALID;
- re-implemented "soc: samsung: exynos-pmu: fix use-after-free of interrupt
  generator node" -- used __free(device_node) at declaration;
  (as suggested by Peter);
- drop "[PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in hotplug
  callbacks". If we get some information about CPUx_INFORM registers usage
  then we may fix it later, but for now it was decided to keep it
  consistent with downstream implementation;
- Link to v1: https://lore.kernel.org/r/20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org

---
Alexey Klimov (2):
      soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
      soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup

 drivers/soc/samsung/exynos-pmu.c | 70 ++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 13 deletions(-)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

