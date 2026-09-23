Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FDD443311
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178821; cv=none; b=Jd1xZr58QtBKIZQNfXu5JKFbzzimMVeUPA+spOdO7eg2zlqTW6yFX7H7dlt87P8AhHe262Zs1YBwcwURSX5QkZUDE424YiUl+xfgYrItlR5aqTyXDgthrJ/cqfvqcjYIQUYqDUkFLdHGcnOVJrH6pjfdLoJi0YsTFdu1SicEfe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178821; c=relaxed/simple;
	bh=XiHxmRhF//Sc8lw0GeHrf2mkkRn2wmshFyT7bRDBSuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcsp8fHtgLZGNgPi6EeXT2a/w+u2c2ljsz5giXRxShIYbUnyGhuOFOFGdppxIScbXHqnHEK+cstPwW6tY0eyAJYmm2VotEA33d5cbZL3rAf0zEL2MlA7SD5xXXEbC9oqc8+MbCO1Ij67pwjFORcUk5yUbtb7nqB/yqGSWwEAPCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JYbst4MR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JYbst4MR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so12583655e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178817; x=1790783617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hk0sQ453lNEysdZfourfxsn4kfTAj/appBmgqJA7CQ=;
        b=JYbst4MRDZjcBBj6ATSCVPY1pLSS5LgW6PF6SGluQBoBMQcLZ0SW+aSwh1P9HcRpjY
         pf3uY5WTmqN2veWIFKjy8l9VTQ2AKt3BXk1nYn+zPF6YHUsXNSt8H/p5cKV2g36vXCaa
         FYxGj6MJ8jRjjs+UJGEN9xig37gOYBHz/n49A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178817; x=1790783617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hk0sQ453lNEysdZfourfxsn4kfTAj/appBmgqJA7CQ=;
        b=vc/Vo5EOf6yR78VjhHXHrLduWuMbzRFcNGjQrPV28u3JcZCqYJvbfpq2N1XSzjurfL
         1FKWpBZ3S/iwXoqlx9p2zKkHQs5h3uy/OZWwMOWDuAuDmoxspeEvrTxrrosG7TmfkDdK
         38RV2rAJ9bogpKWGvl+bCS7/SVKTYi5RbqT16G0ZXLE4CqB2n09Yefh2Tiqj+7b+J7A2
         jw84Ugy9Zxj08yIpjMy7ad1xOdNMrxbxWeV4X8gyMAqzX4YkNxkLOGICs9pZqVu3ILON
         7dmwwxTdSJvx5NrhsRePUaHJgt6aTTQFj9So08wIduJ5iZZydjcwYiTbiZfcAIDJpux3
         jGnA==
X-Forwarded-Encrypted: i=1; AKwUvBxx1Oc+xxDuWY6ugW3B86AsPiFCaPvPdVKqhQPsMNQT5tO+hbqohp7St96AWfY2NFuFjjaLYt22HDaf4wc=@vger.kernel.org
X-Gm-Message-State: AFuF++nina7aPwVn4/twEO3Lw4b4kMk/y86pfz1pIxq8aI+kfUZbix12
	v6iYAFfzuAPRADvbb/7IWAcILsYMiTP9nh9c7LzrEBBKqN+gL0ad1mvMWOWgBRr3tzo=
X-Gm-Gg: AYBFou2JuawztLENaGBYJMu6eICuZ3twi/FZ1E7+Ji8ZcJKYkfaSnATsWxYYMuXplBj
	kp5Abmr7tiO3ycw2wc445HtS/ujusKfbT0HLxTso57am7ppbegHbrr4MYVSO48HuH5eeeY953dV
	gvdNLy4wPaeD1pA7tHn2o4QM8ZVrCuXvBq8PrZ9s9fvhcz2wQaXo5DQZKkEMDUhza3liATGeAGT
	vMpIJcx4vaxrJmJNnijUsL3HObEujCVS/Q9H5s3GgcOqnae+M2jCiDD2l1xydwILTCMbdyGCGQg
	lDlLbaWIZWddR5J2oOsHA2K8VmaG84kJMPUUx6g85RKRb9UtKpNtDOXsuNss6UE/Ry0OEYn2ehP
	T/0T/pjbvRap6Pl+BkFptvfFccHJPL0/M8JHFSv6I7ZqWf1NiDCPSNhwsUAPbyhtUCZ+fvT1Bpa
	1GYKZMfV73as5sqyG+kyifcxl3+6tjlMimwW9x4zW8/ic4WfGYgmdvK8XTzXShHhCbMFR+KQypy
	IVOWXx3zkqs08U0UlSKIYpkSnCxmML+MEBOda1ZLrZjMW3+I32hwm1Bj3ROyyyzlDY=
X-Received: by 2002:a05:600c:609a:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fdf0f9fb7mr45229825e9.14.1790178817000;
        Wed, 23 Sep 2026 08:53:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 0/2] arm64: dts: st: add display overlays for Engicam MicroGEA-STM32MP257D-RMM
Date: Wed, 23 Sep 2026 17:53:08 +0200
Message-ID: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The board is produced in variants fitted with different displays. Move
the current RGB panel to a device tree overlay and add one for the LVDS
variant, so that the board dts describes only what is common and each
display gets its own overlay.

Changes in v2:
- Keep the full cs-gpios in the board dts, the overlay only adds the
  panel node. Suggested by Sashiko.

Dario Binacchi (2):
  arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an
    overlay
  arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display
    overlay

 arch/arm64/boot/dts/st/Makefile               | 12 ++++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 ++++++++++++++++++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 68 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 48 +------------
 4 files changed, 149 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

---
base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
branch: engicam-rmm-overlays

-- 
2.43.0

