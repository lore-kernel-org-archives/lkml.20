Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC403397928
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856788; cv=none; b=nCSTffxAPtnlllAOnLjz63o4+GpdRuXznah76Tbvts3gTzbp0hjNRKKnU7o5pev5rMQ9VVoT2MTAyVWQuJ5LeSt38TXSQdXvjCSw9Y/5MAHHLYIoXxPzpxWL54pEZChAJrlBw5VkMs9OwDRS9tMKmH4N0sIwxYHRLV7i2sOvyY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856788; c=relaxed/simple;
	bh=EhdLnzzAc5TdUIMAqbDDPh8BUtueMtNVdBdFvcaW01Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJo9jdHHdZUBwDedTM06k2l4W39zM/38EDyVPYEHL+BGVmUe1Bys5GWaxQ2sR5qjDTGJx6lVWAoWF2Kl9v/HCM8mvm7yBz9cA6ZV1O6XF1y3a5+T4l/ACrbnNWe3JM3qYgTWzEHhZ6bBxBg6dxlyJ1CoUIH2xfWFNkRm11czZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlUXIYWl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlUXIYWl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a147688bso1949897a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856786; x=1790461586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UROJ2rA2pOTAq0U11/K+a+sFTni9M+0S8RdMLsEoDQ0=;
        b=qlUXIYWlFm8eZNYW3MZ9sT4OpbJBe8Emc75urx6VDQLq7fRMnuyOIcrjkUQhlu24xG
         XJLCyYCw2MJJL1Og066jkhbiokDL5dLU5vqErvqrJeWfe2Oz2azdiYEtzV21w92q4sLZ
         BUo6iJYblQ2qljR3nVeub07Aib92L1z5+trlj/21wZHYv2PCAuI9Y1w1HfvF21IfBn02
         dez6ddKhkpoyE2N284lOLwVz17EeVDQsl+LfbZD+DxyyTQ09vZjSns1rABSkTusWOM5A
         9WIcuD7uGp2n2kcRzbiZ6WPM8MW5kr0CPiGWrW2GIpmYVOKQbRgPkjvpZrI3U7oFroZh
         sKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856786; x=1790461586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UROJ2rA2pOTAq0U11/K+a+sFTni9M+0S8RdMLsEoDQ0=;
        b=e8aRyEHapR1ALcac+a8ydoQ+MQeHrStsuVwvbkoHPuoORK4GZA0tEEsoLj7OTt0grN
         EPYNb0fIbnh953Bbwu+8Gb9MGALWhVvkOwDaEtGj6cJniJ3g0m1aiH+KiVnKLCkoS/Xf
         8CPGHzH7PZ/LYPVBGXRm+d63B82HCfALeTmgvOldNfXToEWsXt8Dr0VjZ+ZBLIZg9wVk
         Ftw/tGy+dYUyFq6ADgu6z0rgGDX6x7Q7Rg6b7vZh7KFtfv0Nu+KTvxfWWVVzpU3mjUog
         CtsgeKftfmoVHoNdOf2KqsIVFMvryuwgCSGfrCSI2rStR2oQgdTADegXFMg8k3Pl53aB
         s/iQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLXV4K07ngcTJuNuQykaXzSEFMgUruTDsumSXrU6iOH6XaQNs1WWy2tccYX18bGoxrQxAMM+Pv+bcLSfw=@vger.kernel.org
X-Gm-Message-State: AFuF++lL15MzAsnqiOtV/YWpwfUZdMMYgxwCw7dUKkGLsyhA1Yf9+H4o
	QeOhH6mx3Xp9CLpws5KsKajhCaR4avWZjiLSKDoG3rHm1lVUNryG8uQ/
X-Gm-Gg: AYBFou1F4N4h1fei6kj6jUYev0KoIU8ouh5gp9KrjBG6wj9npryETLfFifFtTGdnpNZ
	hpro4fT7nOPQuT5Iytw2bi23TP0a2VmPk16Ogvs5+UqkxdmioS96Wn3udY1AgEhVa6i1B/b7YZ+
	bc/JQLMmfpl5jCzF8f+gPHWSXp9i/8BMuTZFVCZD7aSZEOrL0LynB21BHJ40X1e02Iz+xfEBB+w
	y36gW0/kXDFef5WOibU7pEXCr8iAMKjPrl0VWzhaVfP2iAHEax5Mb3qV47qJT0jgLMArxdSU/rW
	IAoyZiU8BEJ58DTGzRJXXaIiCPF7C6GQwLU9YEopuZ1lbj5zk0KUjvn8ji44MvvtiBvkxCw8+/v
	PJyEdze8krabgwN9h+k3sCczDErbLnf8E/zp9I3QuyfZ0LC3wudFAqeOEDhJmzsi+AblmWJvlsT
	AV7g9plxFvEnPjQhBPe38FHSO/O6bZeyp2lNOEY8NyK/L/r/sI9ZNM8ZN94v0UQEFmuxZ2zRo9y
	7vaTNc5UQonmigQD9b7cpqNpJJONdiQU83yYhBbdck15mCfYg5D/OvI8Q9NSgTrXxgpEhqDlBlr
	6378D4CekA==
X-Received: by 2002:a17:90b:2709:b0:39e:6c69:9b8e with SMTP id 98e67ed59e1d1-39e6c69b257mr4682971a91.51.1789856786307;
        Sat, 19 Sep 2026 15:26:26 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm6166605a91.13.2026.09.19.15.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:26 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: dlemoal@kernel.org,
	cassel@kernel.org
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ata: libata-scsi: reject multi-sector taskfile commands when dev->multi_count is 0
Date: Sat, 19 Sep 2026 22:26:25 +0000
Message-ID: <20260919222625.3797581-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ata_scsi_pass_thru() (drivers/ata/libata-scsi.c), issuing
ATA_CMD_READ_MULTI / ATA_CMD_WRITE_MULTI / ATA_CMD_READ_MULTI_EXT /
ATA_CMD_WRITE_MULTI_EXT / ATA_CMD_WRITE_MULTI_FUA_EXT via SG_IO when
dev->multi_count == 0 sets qc->sect_size = 0 and triggers a divide-by-
zero or WARN_ON in the ATA PIO/taskfile path. Reject ATA_PROT_PIO multi-
sector commands with -EINVAL when dev->multi_count == 0.

Fixes: c6fd280766a0 ("Move libata to drivers/ata.")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index b3666519b648..c99f2845d09b 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -3507,6 +3507,11 @@ static unsigned int ata_scsi_pass_thru(struct ata_queued_cmd *qc)
 	if (is_multi_taskfile(tf)) {
 		unsigned int multi_count = 1 << (cdb[1] >> 5);
 
+		if (!dev->multi_count) {
+			fp = (cdb[0] == ATA_16) ? 14 : 9;
+			goto invalid_fld;
+		}
+
 		/* compare the passed through multi_count
 		 * with the cached multi_count of libata
 		 */
