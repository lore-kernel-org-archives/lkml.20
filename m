Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C383C10A0
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128737; cv=none; b=mb7ZD+rxbCb/vhHAyil7kuV+wO022M2liI30oy66YvInGdRdR1Ef8sohheJozJlV8PbIQzp8n3NP9vGHWdXzcfiTpkBm/utUycv8MMbApkcO45uCk5XeFccuq7GSmmV1Sr+UPF4QiB6PYWDhLiE+NtOZAtKxlsUh3ASQJL5s1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128737; c=relaxed/simple;
	bh=JJ5PatwUf4+x5mD73Hv8f080y8YoRVgQwuJkNNfdR2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZA4lKhBipW5CCl4OlAp4fzzwNvwr/XhZpJlt4Jd+IVC5zhLLPUPIa7ac1UHhpV14CTq47pu8IjyTwTRtm6Z+odc2KfIX6gfscHcquKVdODUhSZzMOjUKaRh7alqBseq5M8+EW0Ggl9E2VwnPeU/WBcHBO05nqpC9uiSHUvF3XLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCnZyeyS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCnZyeyS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3743205e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128731; x=1791733531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWjKgA1ht9vd7gcEh0QJP7aH/UymJT1EXVYifgzXx/4=;
        b=PCnZyeySB3RFsYezf45VSoZj/PgX0Ol13DPHxK2goT0AoTDHwcXNerRApDPy3KRe5b
         RGN9WgAbYUXci7AAAHMvFwS5yEJ1osSeMeCYSDo04DLPtzgcwrDyA3cGx1lgbtKmnQPo
         8ohvjlvCHYiABfp6RZc/6eIpqMNxrJfTskusTc+6U426IPKEQtK8SIQYFaTmOkMoQW/h
         fz0tFnN34a30bGuVbIa1TC+/p1U8rLCYsJl/xhX7hm70owyaD8wvou2kFogECKKo8OCC
         07bWHK/ibe23Mms8Lr9Sa4wh7GrN0WGXMqZ+L52GSi3SSLNqVR42qCzYrH6DeKEOLrQM
         4ERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128731; x=1791733531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWjKgA1ht9vd7gcEh0QJP7aH/UymJT1EXVYifgzXx/4=;
        b=MLwdtDTxmtbh+q94y+KraAKs74t8y+J2ggVMRrfaX3twnIx8dg4s8DL32LrurKbteS
         KwGSAhNvA16ve0RZcrEduA1hNpD5ICvyiKoIqx0xmM+IGPsJtoBtC0sk4M6QNFUurhO+
         nCOVqA1Yf2LjSyd8aivrZW9NuvImVVImDLpxEEB0uDFkxvzsW44HjYxE8V9Jo6mdYCzT
         wl6NAb8Jk+CBnVeird0eHlu05audC6WbAPMloaQdpfS/pj3VjSfLy6xPrJlMQuYvlb0p
         eb5JaipmFVnMd8VdAQMfKdaNudS0Qhv8at3MUcCaM+40yzL/+Zp1HIKhfPL1pfMY1oLW
         E3Bg==
X-Forwarded-Encrypted: i=1; AKwUvBy1suYXgHVrqUqpr/b2tJi72ZslW8xUPAJzTJT1WeHKDU2x5V7Awa6tiKvKsEMXj2HNLhjZw/odjDPhtzc=@vger.kernel.org
X-Gm-Message-State: AFuF++lpoT6gKoVqWbmRY3xF+azmZDGdF1cl46ojh4al5hOrCMglMn/s
	Xs+Ol9w9O6CzQY2+JBzPLNClqj/7b9+OaSCaawQ3D8ZFTZ34TpEN26k7
X-Gm-Gg: AYBFou0WPtw17EyExcxKWBeTg6Or9ifeXjtn89XLHz3x6YmIH7nCtlwxw1S9g7UkQ+Y
	3c5y0n96TdoWpXmcCa8rdV77TbjxMdhZRPw+vYevgEduLPwObTH5m6RYBecZKJOv1kUr8Q8qH8f
	oCrDBW2oM7XoSpjQMDfok3PGwEBcdpEzN60pOn/dHgI8ZIYf3TPDx2RZqXwqH8QhmNFKCCDLuE9
	acBVu4gMpBYoZNHbVK6R8yVew9g73bqCkjXd1BKWGYCAqLQMz808GBZ7DdLbu3MDoPOrA5n3cYp
	98+1HlVUxdea/TYWywOAMvo9uY+JignkmzynM4I59k1CHXmieWMqcXHdWCz+chBJiR1DPVrRlCC
	e9bSK83fTTfSmYS5EdQiPCbq0jVv/xeRoQe8zOktcpA6hDTp745i5eJT5exdHamUgxlzlEDutW1
	7u2Gojr8m/rGHdKYSf4MTa1AwnBrM5K/Ikkbpgt1DvwchdSt/iOWymHnHYY+llVKWKB5naMoRlW
	rkZeBGiXyxMrrHGzWY=
X-Received: by 2002:a05:600c:3e19:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a027534b98mr143954955e9.3.1791128730435;
        Sun, 04 Oct 2026 08:45:30 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
Date: Sun,  4 Oct 2026 18:44:47 +0300
Message-ID: <20261004154456.145362-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for recently supported device (ALS, LED controllers, haptics)
along with minor tweaks and fixups.

---
Changes in v2:
- added USB configuration update commit
- added p895 power LED trigger update commit
---

Svyatoslav Ryhel (9):
  ARM: tegra: lg-x3: Adjust WiFi node
  ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
  ARM: tegra: lg-x3: Lower supported suspend mode
  ARM: tegra: lg-x3: Add light sensor node
  ARM: tegra: lg-x3: Add flash LEDs controller node
  ARM: tegra: lg-x3: Add haptic engine node
  ARM: tegra: lg-x3: Add backlight LED controller node
  ARM: tegra: lg-x3: Update USB configuration
  ARM: tegra: p895: Update power LED trigger

 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 ++++++++++++++++++-
 3 files changed, 127 insertions(+), 10 deletions(-)

-- 
2.53.0

