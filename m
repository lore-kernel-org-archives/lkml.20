Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677003644BC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908886; cv=none; b=sbRhVLQseWapuFHhlaxsqUpuFRF88tPkaktMNQo/1qrOlsKXyPaSGwzx6nH+VCUEG4mA24GPMYBmLrghXeOWdZXPG/wkDRj3dmwpKjfRBY7XY7wcbezTsdIlGVscIslj0Rn3CTgNMaeNRYZs/dxPDbq7i//GvjqLkux0olpYhdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908886; c=relaxed/simple;
	bh=gCDgYIAqpTUqwpKTh4+l7//IeCxLcoBCbnVmd8f97XM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MqhrbQ0rZdjqH2cLzOEC+3f9B7WG3KI2zrCxf3qb3s8rS2qogbKgxoPWyWOgVK88xQNGMXagautljMT6BAAxQ7N0rPIhBgzqFz6/4XjSejorPWUzQTGxqjo+HIrzxSl3tjnJLNr/gNtfvq5O16ZjnWc2xK6xSHTZLEM2J3qCayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iit.org.ua; spf=pass smtp.mailfrom=iit.org.ua; dkim=pass (2048-bit key) header.d=iit.org.ua header.i=@iit.org.ua header.b=JnsD00QM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iit.org.ua
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iit.org.ua
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iit.org.ua header.i=@iit.org.ua header.b="JnsD00QM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso7579555e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iit.org.ua; s=google; t=1787908881; x=1788513681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsKeJOW+Bil94wXqWOPmt1KLTCbx937cutH9eBfGqgA=;
        b=JnsD00QMv8XsWFB1SohOlyXty5hjNtl/pZRJU4BToYPAYyo6xc1TlOFSA3mGtWt+M5
         ovZzC4V/GlC99P7Tw2XGkD06rdv1gpIfFSGscDZ8l8+/V5w8mpjp1FXkar91E0pOHkXR
         0nN4X5AjvWq+MOCMU7ZS8NbG1OwltCnz4ZcJMzVklaWE3Td7pttynoIRHR7KVn4aljUQ
         5fBW19dQ599uk8qKsAxPOnJ17NAkicWX6PIXUkKJuEn3a5MqDjJ9OfqfIAAVhS0zYu88
         CArsUJ5tmJzqX1Okp6+N3C7vIoFv05rGEmB/GgBcD9HCzi1wJv1z9sVMPlHPsbv7t0Wy
         7yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908881; x=1788513681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsKeJOW+Bil94wXqWOPmt1KLTCbx937cutH9eBfGqgA=;
        b=rZi6NmSwFsOi/HCoMegRGOaycqFDN4sJkS2fB8taOvvqmfrMWVrtKAyvXpUxObd+Of
         USc5P7uhL+x5FVLiRaQJvfvJF/D7JdJBxt9GpxDG4P4QIiA4N5WWJWijibwenHsL53Ix
         4ZuN0MF+OaWY16xqmJ62HZbkcmz6KnFb+jyIoJciSo1XxpUPkwpgZZmhIbZoLxvyktCB
         vh9wt2c/6070ge2XwsaFfSfWOnyc2rHMT77dNffXQI/ly5cXpNIz7k/ftUIttRWtYb6o
         +XFyoMOKriBt3kW7rVa9EY288BjkRzMrBPjyxY7xbPFxC150G5dRt71ba//8PuMedwGi
         CYmw==
X-Forwarded-Encrypted: i=1; AHgh+RqlgpZ8sVGmPrYbc46de+2wNzwrt5Stl71dHpFJdRvwC74R16oBp8Hzf7hzY7YMu6hoczsBVAzszGaSid8=@vger.kernel.org
X-Gm-Message-State: AFuF++kfr5NEYPHRibgNSeZICFiTfyhXEGOTun8gMeE3wSm7JbH7LPw3
	Is/pARhItFXKzLTQ6+1ZL5Prnc/8kDklhsYbJ4HYxO0TQQS3y/GMByBIJNG4gkGT3uc=
X-Gm-Gg: AR+sD11wvMaCtAMW+Nhsy6Yt5P05+bucD5V4JmZHK1C8XqymddYN9J7WfYMLZTyy9u3
	8vR5yMoKFIvN2MXeG7XGLsttExu14Pj9nuNH2XuYPaAGUzSgPbL1grEz5LzBpMzc0cYdxlKY6j8
	kcevl6GtIK1UjEJgkIA9Dax8WY5SHkCXh0Y8O9ooMSsYCgNhKtSwuvLUN2Hxd+WeqzIdXJOPAVa
	cG4BwdTbs0DtNimaNqrAYvqYcMkMSOWLrjp3h/MkoxOSQNdBB9pVbQgPd3t3qzLdNPAiBnkUkvM
	D6Ka0hWOau/W34X7KUDKjDxcedtCnlZ8V3DK5bA+3j6BnXOMgKPjSnMo4JcQaaoHP7ZL5rhd14A
	ArKbgFp+juMM2raM52tb32CHtGMhEOriiXvVS+YBjx2DTmCT+cselzW1SFSgIojwj8glRLK9Fky
	rSQ3KyN+9vPSKgRuA1BfZpr3FpAO6liqx7JQ15bIP5Kw+DuFAtcsq48g==
X-Received: by 2002:a05:600c:1394:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49b91c47b6bmr66784225e9.9.1787908881460;
        Fri, 28 Aug 2026 02:21:21 -0700 (PDT)
Received: from archbtw ([212.1.106.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm111484255e9.4.2026.08.28.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:21:20 -0700 (PDT)
From: Stepan Svatenko <ssvatenko@iit.org.ua>
To: Raju.Rangoju@amd.com,
	PrashanthKumar.K.R@amd.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stepan Svatenko <ssvatenko@iit.org.ua>
Subject: [PATCH net 0/2] amd-xgbe: fix two PHY/IRQ lifecycle bugs found on SolidRun Bedrock V3000
Date: Fri, 28 Aug 2026 12:20:21 +0300
Message-ID: <20260828092023.105405-1-ssvatenko@iit.org.ua>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two bugs were found while debugging SFP-related failures on a
SolidRun Bedrock V3000 (AMD Ryzen Embedded V3C48), on kernels 6.15.5,
6.18 and 7.0. Both are longstanding (dating back to when the affected
code was originally added) and independent of each other, but touch
related PHY/IRQ lifecycle paths in the same driver, so sending them
together:

  1/2 fixes a self-deadlock: xgbe_phy_sfp_detect() holds
      xgbe_phy_comm_lock across a call chain that can re-enter the
      driver's own MDIO read/write callbacks, which take the same
      mutex. Triggered by removing an SFP module while an external
      PHY is attached; confirmed hung via the kernel hung-task
      detector (368s+ blocked).

  2/2 fixes an IRQ leak: xgbe_phy_start() can return an error after
      already registering its AN/PCS interrupt, without freeing it
      or clearing state, if xgbe_phy_config_aneg() fails (e.g.
      against a non-functional SFP module). Any later retry then
      hits -EBUSY requesting the same still-registered IRQ forever,
      with no recovery short of a power cycle.

Both were hardware-tested on a SolidRun Bedrock V3000 running 6.15.5
with these fixes applied: repeated SFP insert/remove and interface
up/down cycles, including with a non-functional module, no longer
trigger the hang or the -EBUSY loop. The code paths touched by both
patches are byte-for-byte unchanged between 6.15.5 and the tree this
series is generated against, so the same fix applies directly here.

Stepan Svatenko (2):
  amd-xgbe: fix comm_ownership mutex deadlock on SFP module removal
  amd-xgbe: fix an_irq leak causing permanent -EBUSY on PHY (re)start

 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c   | 14 ++++++-
 drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c | 41 ++++++++++++++++-----
 2 files changed, 45 insertions(+), 10 deletions(-)

--
2.55.0
