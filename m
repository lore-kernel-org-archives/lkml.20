Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B374FECFA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371002; cv=none; b=RUoeflc3IPmJKo4wJPXUAk09N0z9qRkiM2lQIcIF+iJlaK9SDgXruwbIlYgJYErirDDGk2QLpBmZKa2V77yE1kt0mlwz2oCneXStUvil3zZIzFswdTp9Scyv2/iVFR0WpyiMd30dJAw4H5d/rhuSKaJyKw5j8vn2/eiuR0CohTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371002; c=relaxed/simple;
	bh=ajX1sR3WcRugeisr5BSZJX76rL+ZzuRg6NSY3TmwZ7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4I6oA5/cPJFaO0C4DzARXylf1LlI0Zo3rBMLD9LgDFpnNgA1sAh4szlqo2hh+5Xh17y6JRkeKboRShOGq9ouIj80E5+xgKwlfWHIyd65SeCqx2aqrVWaRAqZndj1SPyi3xF24GdAe9kdC1ZxnAj2AmA3FmVTwz45dG7cSL1kPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QE+qMiKD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QE+qMiKD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so726974f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370999; x=1790975799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=neN1Kc42Y7T0Zlr2RHBkewVlwgt7GUHRIZZhfwmmzUM=;
        b=QE+qMiKDtG0z5HZpaWnWWSFy8+ljNQdxNaWpfQnlN+iMMopomfZq+t5o6JwuzwUFYh
         EY6we6J4mUevoKZXvVri9evQrrgVcL2ZE+IqPNO2eAUbLd3AQ6lQwS7t+BJGW+1ZlWfj
         ShT0o/nb/udvKbyukEa8FuegZvLk3bLwzYdknlB3c2BDREzOHdpNM2xmHaMF/KlSySHn
         G6v27ZjTBAHxQc3++aCgKGM54XWg/ex3k57M3vvFWKk6/3OnAqg8X6p1nkyyRsTAD9tU
         tuSmqdXY7/bmf8Vfbj2rVBwjwQzb64Q5+JlmKHVwP+AUE/M3s85ulK3znk1qgZ5+7XhC
         GPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370999; x=1790975799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neN1Kc42Y7T0Zlr2RHBkewVlwgt7GUHRIZZhfwmmzUM=;
        b=ucY+s1Ic/C4Mq4hsAuhOhDO7pluwRD4fSO/rC8p7p5rWMRkW4DefxrERm2E6yBH0zv
         X9Dqc5pZCWZDawfB6TJY8BdiDICwb1piAHvdRzudCt1wJ45wMSwnYk1bYfpFtl3xJUmp
         1sWixXxNFuLko25NKC5ftRdIFWdADlJlKORobA5v4+z73TW/wUlfh/wWzg6tC/YPmQqL
         VrXi/76NSoxB5I0C/+Si8Mhf5N4Na3JnyIo500b3S8ZxiNTherH03Af6CUGATXFZ5c38
         Maiiqu3bGSvQIzfsJsO9RqVeMsfA6IGs8QUC05UuZz0FKFvwkamaI+l/uMpmlBIn+S6R
         SkaA==
X-Forwarded-Encrypted: i=1; AKwUvByuiFZqXPrYbABxVKF4r6p0FEP7AVzSpqehBtpFKYMw+J8wHWPRSUjDSKig4RIuI52gzZf5Th64YYYcjjc=@vger.kernel.org
X-Gm-Message-State: AFuF++lBIn88+Qws1yKnAB5f88UOWL/3WcNimK0pZaHUxrynPCcFp1io
	lxWqe9F+/lm8BDPAfjuQFvoQ6yRwvgUHkUahTELUW/H90BDEM19Pn5DC
X-Gm-Gg: AYBFou1XznVT6wZCgo6Ua73F8F83DwfYNOEoHlnSD2k5L7vIG1So1PmWmX7QzD4UeEX
	CzP3HN+0O0HCk1osX1TOxYLQLl6osMpwQisCvDOHvnUGefFvGmxFrPs7HJTKRciMgvLDa2wcu4/
	Qv8PFmll8Mr7CTq0VWwy/aZwmedz1BaC1gvt5uW0sAT9+DPOpI5K+t1YPGzfbcHjdDgvslX9igY
	oZaO/mFi8NgUVaCP03K06fag3EYAykSX7tWiDJ5J36fe/d8p1vWAQETffBAqCGOB+xpxWDyptsF
	f6NEYn1NDUH+Izsp8ih2hjIUo5hLfY3GVvsiPKlYYHEteCYCiLRpYrM4KHrWgv0BJuzIDGncfg5
	bLulVtkoAizBvS4RQ2MTk/5cnBc1Vg6CyrST/HNolCGRy2PXD1Kxmy+G1cszv03Z/jdZGH4EqCP
	IKV4w1e8dP9QnWsj+aTs57qHcQDjGinnsAyhaodeJ1sQ/fGjU7QYt7NgTmGsdKiRY++F1NGQcpE
	oq/fR6GFA==
X-Received: by 2002:a05:6000:490e:b0:488:8437:b8b7 with SMTP id ffacd0b85a97d-4888437bab3mr2644343f8f.7.1790370998794;
        Fri, 25 Sep 2026 14:16:38 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm9271781f8f.13.2026.09.25.14.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:38 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH 0/3] platform/x86: uniwill-laptop: Support the PCSpecialist Recoil 16 AMD
Date: Fri, 25 Sep 2026 22:16:32 +0100
Message-ID: <20260925211635.1422516-1-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
(board X6FR57TY), which the driver does not match today because of the
different DMI vendor and board name.

Patch 1 adds it, using the percentage charge limit rather than the
charging profiles: on this firmware the "balanced" profile does not limit
charging, while EC_ADDR_CHARGE_CTRL does and is reported by _BST.

Patch 2 adds platform profile support for the three firmware power modes
("office", "balance", "turbo") in EC_ADDR_MANUAL_FAN_CTRL, and handles the
mode key. Writing the mode makes the EC apply it fully (mode LED, NVIDIA
Dynamic Boost/TPP limits, _Q88 notification). It is only enabled for the
Recoil 16 for now, but the same register layout is probably present on
other Uniwill models.

Patch 3 maps the "Sc" key (WMI event 0xD0) to KEY_ROTATE_DISPLAY.

Tested on the Recoil 16 AMD (BIOS N.1.39PCS10), with the driver from
this series built against 7.2.6: platform profile from
power-profiles-daemon and the mode key (LED colour and GPU power limits
follow), the Sc key, Fn lock and Super key lock, hwmon, the charge limit
attribute, and the AC auto-boot / USB powershare attributes (read only).
With the same changes on top of the 7.2 driver, charging also stopped at
the configured limit with _BST reporting "Not charging".

Mohamed Jouini (3):
  platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
  platform/x86: uniwill-laptop: Add platform profile support
  platform/x86: uniwill-laptop: Map the screen rotation key

 drivers/platform/x86/uniwill/uniwill-acpi.c | 155 ++++++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h  |   3 +
 2 files changed, 158 insertions(+)


base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.55.0

