Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3850D37F8B2
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789207942; cv=none; b=s9/yY5aIxhx8pOLkSHU6NS46VbcqPymuzUwnheULCuDz9kiM80GSvJ0N5uOZbdg9YhhH/xA9Fjsk08+TlzVX0DQZRet3rHa8dU/50iF1+hlN7iDVkP+7mwQpe8DMfQEivRDMw3YoOFPHmFCzJRLFx3hHXZ/nwkCMbmFtGkdynbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789207942; c=relaxed/simple;
	bh=L8wjSkw2EdjFBnlgcl+3U01kSoAX8Dldlk2sgQF/G04=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JvTXcUIRVYSv4CQbb5GRPcFPuRclU71KiIh/n24FHttAHTwnWc0V94wlqJ0PYGyX3TvVnBGUG1FfAxza9jECOpjum/NLZeU31bRE8wYpH+gK4z7PLxqA6f8yiJKDrGCTBSBGeA0fpu2RsC6OLktcxEUH2ZCvHzB4WHINB4Gn15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbeSUtFe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbeSUtFe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so3629315e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207939; x=1789812739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8POLFJQtP/wEzujshVuV+6lnugcRc54DgfC4qYT4MLw=;
        b=PbeSUtFekITzd8hPMLqr82xuImPpASHzYmLZvjN/BrAulCugBZuKvME5fTOqq5MSwk
         lotEquikNEresQ9fxlOzTY8kmegEbLZbPLKBITx7ldRgVBMugiDZ2oqF5Blm1IqH2kRZ
         /i8dKtNQh8Unp9l0V0RM6xPj60WGhMqipjIsNGJvDZtGwo8fYQ10u+y98rU8FYBUvDSt
         RkkuTBgeJeyGyq9KAQN3lXruFDxliT7S3o0jGkC7P17xmHo3Xyt8wZYN/3k65EosVQYG
         5nTYMdegz4mjUNZ4YWxbfPzdXbBrYpv4yDvvwkgNNjoE0/lWsPPzTL62PukgH0GHzt2C
         8ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207939; x=1789812739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8POLFJQtP/wEzujshVuV+6lnugcRc54DgfC4qYT4MLw=;
        b=ILD/pRM3me6QvZSr6RViT03mTMthEtkoUAdkXV50E0eX2KIzNkDmFZcASZMWgFsf2y
         85W86Nr1OouGkou3OA3HciGhZzsurByeQphmvFmDFLWMSGapJIj21EqLG6BVmSsErcPP
         xI0G//ur+ccBfFGglpYLTmIl45QEFjOn9pm964wgyAT9FRRoHrbhpdFXQFDkhkLed02R
         D2FEG0X33zG6vnSr/XhU/KUCPEJOHLabbHq+w1gbiRlcLc02ANaAshlDA5cF44N2uLJl
         i+C2Ia6gg2oI8KQ1iuublPNfMTzZx0xzjEMUyeDvyCxjlZBty94Jk/2pFLxRKDB/GhY9
         1IYw==
X-Forwarded-Encrypted: i=1; AKwUvBwaLog6+FClSN6kI8XvDMUXXeoAVC/gJto5vcwauMmZaxatWWgY+LSavdGKpgzLjJ2/8+F2rLyq8Y2OIyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k/dKpkq0ikapD4W18jgBHU44AyT5OE2zMIs2LO9u82mpsS7LZQ
	2eCIsWdq43UpEnt9KTpHYqS98lQq6Gu1OsmduGlE9SaE3Lbxc3/rnuyF
X-Gm-Gg: AYBFou03+hp95f7G/h76i6CoKjp9mPPjb126QfgSuKaPDB3poRLbvvuHBNU5PikYlzW
	A3oCHiqeSrGPYJDMNZHZ4DM2f3aUZ8A3ObLBwjxHKgBVmJfWrH/XQn1TM9+cP1mxnZ52vxv/4zw
	k9rFZmeiUweIL4Zl7JZu88O1PkTPerxI852O65OFKAyAiWa/0lba9wZoiqZUttT+OdAbgRVyt8k
	hRA8s/b6zHxrBpCZ0Tkv5G4/H8KUwBOSu7wJDjCvbO1QodA21jTwvUyH6Yn8hS7pIrb1stEz7DX
	9BOHoappe1JO4gHDd9FrlcenCdQcqtWrBOelcvCfIsRElpjVQej3jv+sTeaShqdqTYKYZVLH4Dk
	OvRpNGQdZddM49Pxg3KU7SD2OtdSsUjwqlwErc7+k1rPOMuAEvFCUkQxb4JfskbYke8F7Mm+4NP
	IWitOoG1GvjvLZNZuFURwiOiyfXpTKJYWfsWGZPg2K2XUgpLqHm/mKirEVkQvyO/ZzjnQfSHUbx
	6Q6qRxJ1OCZNbwNiSC/GoJVYyIaDXWGQLkBy6t5DShnmr/4eNNRU68wo3yz0FfXk8VaM3TsIzVQ
	e8xWz4IdUEFMcHVBWPzz6vdywdlP7MnTkSBTyWewSjMof5YEqetkO8yzL3TynGBm8XoQ0rQlvqv
	5EA==
X-Received: by 2002:a05:600c:3494:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e619aab42mr205123835e9.9.1789207939001;
        Sat, 12 Sep 2026 03:12:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e63c9a7c9sm212687045e9.13.2026.09.12.03.12.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 03:12:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ata: libata-scsi: Fix ata_scsi_hotplug() reference in kernel-doc
Date: Sat, 12 Sep 2026 12:12:15 +0200
Message-Id: <20260912101215.86413-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ata_scsi_remove_dev() comment misspells its caller as
ata_eh_scsi_hotplug(). The caller is ata_scsi_hotplug(). Correct the
reference, which predates libata's move from drivers/scsi to
drivers/ata.

Fixes: 580b2102327a ("[PATCH] libata-hp: implement SCSI part of hotplug")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/ata/libata-scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index b3666519b648dc039b1f85938f3a5b7ba201b1e5..db43fd7b6418205ca8e882c6f18a89ba3af9acb7 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -5382,7 +5382,7 @@ bool ata_scsi_offline_dev(struct ata_device *dev)
  *	ata_scsi_remove_dev - remove attached SCSI device
  *	@dev: ATA device to remove attached SCSI device for
  *
- *	This function is called from ata_eh_scsi_hotplug() and
+ *	This function is called from ata_scsi_hotplug() and
  *	responsible for removing the SCSI device attached to @dev.
  *
  *	LOCKING:
-- 
2.39.5 (Apple Git-154)

