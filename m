Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDA244CF2F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518832; cv=none; b=B88pYEZa4ZEj+e4NqTig+BnTYpRPrlXcezCS0ol6xWn/KEJ+ytospoArBZSdwCuCP0sv97jy7M/c93uSmz5rOZSh4UccTLzAjkHBDXOhRn8JJQTUMShey19c0crvqgBS+/PfORMW2D+syOrmzLo5Dzj95Cta0hkYuT+kxhnSIs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518832; c=relaxed/simple;
	bh=yi+FepWxeu6LVmVDtSEdyaN8QaaRpUnrPzNqGjVeuhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USBatzn6fLpP46hcwmoQ4lGr49EmqdtZVRuFjGf12/94IT1ZxAOh3WTRlP+8BWBnapGR+iXdHQXTNwzlGTtwOy78Aq8nr8gEKgLmvwV5YRxgiV629M7fDAX5htswbpbJSDCR/KcmvQl682z89E+a+ycuEotV2D2RjtQts/3Sqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMu7hul5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMu7hul5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3964e480f76so1026922a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518829; x=1789123629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jackm3HLNnhKhQBmklNsyS193osVgu3fAhWVal1jS4A=;
        b=LMu7hul5E3s8h8LmQRQ5kbtrPzzuwYPbbwilWDx1lu/zsFoA9BdRHiHfTUP44lig7a
         PYbReteinB+GwYhVy/Lz6jWhHDVhuqyLJTG47e/dD0zyS5g+/fopgq4UPmvS9eidkf3x
         n3lnOAiBZbA+GGFBmzPNWsDHHcsv3ieT60rmxAo2Wb7beyibfvicygOws/Zfxr17IfZv
         eoaMH/KEmnXKoPCD+bRjbUqhs1P64li/W8GndxhPIaYAqeTT6D9v8lH6w7Sr0nIWSsW0
         vs1YqMdV5iqwU3F2INdKybNHM1XJzEy9bY5MijhVNgjcY9eqzeKi4Zb5qjY1PeRrt2sk
         LCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518829; x=1789123629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jackm3HLNnhKhQBmklNsyS193osVgu3fAhWVal1jS4A=;
        b=XBO/oE3AxUzxPiflHkgn+HYkD0tg5HF8GXQ0L7S6Yr0AkopagqWkjRrEsks8xUDC7i
         3WF1VIn6l2Y6hmP3swnRfGTlCN6YvHFpmF5wvtbOVTGVSQzk78V9BeroQe+5mYUZHBgm
         lo/PqhhLjiGxz+hTafaUafGawMGHxEGozxe7lnWQVwqc9ukHuJ+BM2Mp/xTm0UR8nWiR
         T8mFZ7dZZvGOCmmQpAVf+sdZuZOLKWyMAZqFQkzfyHKdW04kRvTQ+UgD3rXk0ILh5svt
         /icFG+MkHP5HtMeYa3vMLeCAOV5Qq0II3lIbOQXYHHOPjPR3c59cCFYGqzAULaYoY6Am
         4loQ==
X-Gm-Message-State: AFuF++lDwKx40Hb5iIg8jU4KiBqyMHljZXgPk7+GbXbw1WZX0Jew1rfI
	x7rqWiinVNHV0wHQRfy+avRPjZgy966Z2pkjYZdkFRn2a7ktEsXSKX+AaLc/bWaGf5E=
X-Gm-Gg: AYBFou0EzgmB/NSZQcsyoOYn3X9h2PMJ1UbvO4duBOVefnSYq5KV4ZC9WlCG0FYX7+3
	BkDsO7vZh0+bTJD7k9yfAFSeZxFxn5l4pT8qv5z3fkiyYX41abYad99LX7B5j10YTvXKjfLZ+vt
	BrwItm5tqnvV/DtNbmy8CNJOKNffaVd7M4va2NMCSf/M2L7YtRK4NqY2gWiZnE31RVhL1A55mAQ
	0XKYWADrGPV/GrCejHqJLh5iEIf5X9afssQ/AKi2bj5A/AerR0rctdwuEINBzhN5jI9BfM9MqaD
	8qBTvWE+3ao4y4Y5m1rQknUlce2tcJiotD2F2UFCcIAiCunbkDK4c50LRWxdllXDv/LwDN/kLQL
	TxMPRBmdGiNnTDZHz+RCqG32FWY48Rl1B1UCcJnhaJOSDkz94Z/Ysi8ewUpC5AXR2oWKMZtCGNE
	wwuna528doYDM71nl4HDehSb8noA0J0jiJ8cjmiPWG4/K09g8tGff6qku23oycz5R4OSayBf/HJ
	iA+oIXpuxreAiU=
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr8337409a91.9.1788518829307;
        Fri, 04 Sep 2026 03:47:09 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm8536223eec.15.2026.09.04.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:47:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] treewide: fix repeated words in comments
Date: Fri,  4 Sep 2026 16:16:26 +0530
Message-ID: <20260904104639.21537-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104639.21537-1-hemanth.selam@gmail.com>
References: <20260904104639.21537-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/squashfs/cache.c                     | 2 +-
 include/linux/folio_queue.h             | 2 +-
 include/linux/platform_data/emif_plat.h | 2 +-
 include/uapi/linux/um_timetravel.h      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index c1a83bb0e519..36baa5f2632a 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -22,7 +22,7 @@
  * It should be noted that the cache is not used for file datablocks, these
  * are decompressed and cached in the page-cache in the normal way.  The
  * cache is only used to temporarily cache fragment and metadata blocks
- * which have been read as as a result of a metadata (i.e. inode or
+ * which have been read as a result of a metadata (i.e. inode or
  * directory) or fragment access.  Because metadata and fragments are packed
  * together into blocks (to gain greater compression) the read of a particular
  * piece of metadata or fragment will retrieve other metadata/fragments which
diff --git a/include/linux/folio_queue.h b/include/linux/folio_queue.h
index f6d5f1f127c9..1284625002b4 100644
--- a/include/linux/folio_queue.h
+++ b/include/linux/folio_queue.h
@@ -206,7 +206,7 @@ static inline unsigned int folioq_append(struct folio_queue *folioq, struct foli
  * Add a folio to the tail of the sequence in a folio queue segment, increasing
  * the occupancy count and returning the slot number for the folio just added.
  * The folio size is extracted and stored in the queue, the first mark is set
- * and and the second and third marks are left unmodified.
+ * and the second and third marks are left unmodified.
  *
  * Note that it's left up to the caller to check that the segment capacity will
  * not be exceeded and to extend the queue.
diff --git a/include/linux/platform_data/emif_plat.h b/include/linux/platform_data/emif_plat.h
index b93feef5d586..53057713c9fb 100644
--- a/include/linux/platform_data/emif_plat.h
+++ b/include/linux/platform_data/emif_plat.h
@@ -98,7 +98,7 @@ struct emif_custom_configs {
  *			as type, bus width, density etc
  * @timings:		Timings information from device datasheet passed
  *			as an array of 'struct lpddr2_timings'. Can be NULL
- *			if if default timings are ok
+ *			if default timings are ok
  * @timings_arr_size:	Size of the timings array. Depends on the number
  *			of different frequencies for which timings data
  *			is provided
diff --git a/include/uapi/linux/um_timetravel.h b/include/uapi/linux/um_timetravel.h
index 512ae9b32ef1..55b643fc292f 100644
--- a/include/uapi/linux/um_timetravel.h
+++ b/include/uapi/linux/um_timetravel.h
@@ -153,7 +153,7 @@ enum um_timetravel_ops {
 	 *	This message can be used to sync all components in the system
 	 *	with a single message, if the calendar gets the message, the
 	 *	calendar broadcast the message to all components, and if a
-	 *	component receives it it should act based on it e.g print a
+	 *	component receives it should act based on it e.g print a
 	 *	message to it's log system.
 	 *	(calendar <-> host)
 	 */
-- 
2.48.1

