Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EC83A9610
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412019; cv=none; b=J90nNNw5hjj/Y07uDe9jt+14N1llwsrDXVOg1zDrAoxyY5dI22aVt5kDMSlv8ar3Q1ltslTG1bD1sO9cdjIA8DS75cBAQ3+MYIKJDSwl1vml0rHXdRcBaMFAe+n7nMUNJ4yuW8mcD9KojSzexcbJfb86e+tposcl/4YXFQHscK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412019; c=relaxed/simple;
	bh=ePPCsoD0eRTBS6t96YpWTMjkH+8fm6mlOUnAJoCAQTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tf3gB8MXMXqmMtCzoZEU821ViBPCoAgZ1hYv7NxB5oUjYye5xmQXaXq29ZN/AcLg/N6iCs4RW7uS00vhqCuwVROzZqoUAWsWg6YnWUQ9WbqRhAZ4cwZ9eQZ3FEMO2VXK8q3qLaGENMpDfSdSQtLdR4Qu4Ns4BleKAFIXn7iFr8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsXhEvmr; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsXhEvmr"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3425f2b24a4so564804eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790412017; x=1791016817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wrmq3LsiUL3Royo673LJkZAcfu0ZIAo1VS53Nr3AWQ=;
        b=gsXhEvmre/X2YawVm4hi/liBrklBalVZS2giogdvp94tFjM5Lxdj43roN6Z7LCRiBY
         CJykf9X+tyTRUqfqwYWK1TCVq3QsBUMkiHfYu2aqx05bFCg9Yl9beS5s9bhglsJZ0RVN
         LV0BZga5KTna3+1u78qNYYXl4Ow23S1sPvuIvowl2YZSUXN4YT7FeXZPwQML4whE9mf0
         AyjuCdhdG/Blbcz8pXrPklQBaQmlrEod6u2k2B1H0qewgyUO42H0nfYwQI57tnOTeBDO
         qcNlWhgiwmpzXlniciJ0f7PxQwzGkR1kfHsdHixlTh7pjVD6LqZoMVfMH7vsUR3EQVWL
         TIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790412017; x=1791016817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wrmq3LsiUL3Royo673LJkZAcfu0ZIAo1VS53Nr3AWQ=;
        b=V6HQujL26NY8V6g5WkpO/PFwsJfGB3WCYSwZe4zRqdP45Mf+5tySh7ULY/LjaRW8mJ
         85QcimBn2EuDEGldUqhH4VYiODm87F7s9ZTer1e7EiysuGz5whjpmPR2GUYpqadqpls4
         vN3WRFY1ZKE1y1Xkd/op1DVgValiJf0xg6vIcrSXhjUHSNhqHUdtLRmWlTEjECIHnDaE
         MafPsrIsTvRCNRvqijZ6lSBNjp1O7w+rA4aUXmGnSK+rwVXHEoto/LbKhsK4EehoMIQe
         v38KrtdT2geQ1eiAXmMmlewctJchRssjEdHGx6l7HX3G7lV9MAXPepZ/+VhPsdIOGuyD
         RUyw==
X-Forwarded-Encrypted: i=1; AKwUvBySu4Qv7KZueFVbmFMCEhPjgax4aO5Pvi8KpcUSJVs8EEl3dKbOdKo6Q34Q2BTuJ/FkXyMOJndx8ME0V5o=@vger.kernel.org
X-Gm-Message-State: AFuF++mZrx8EB2TE44R2OAwThTupJrKtAjYoZgetA089PQyn1ourQh0h
	mQxggs6J4bfoFOQtQ32y1FI6LbFTtpMgyEbQqJBR9ERhmqj/NYSDotsT
X-Gm-Gg: AYBFou1atPLD1jBQl7D+FPcKJpw0BonKY0ZcuEymStMGit7BEBNHQzvrisJ/trp3KNy
	b6kcBjE8zKt4DCw9JbfZdnJq9npPHBneXdWZ2FdRjkYdReo92y9NhW4stiyPbv1/9pN18mHBy25
	jfXh+i55KTWBLxsadt3ibCB2eljbLfFZSLJXqkKHnV2D7B7KzRuBOw0CMb+2E/SgFmKTQ05Sc7+
	rh9Z9ucn9qUc3PXtFP+BN4AZp/bG7SMuehUtasPh/vKIRfOmkEFPg5qJnFkId7SA/PRoLIYXmGB
	AvK0LsISUgkgvwk43dk52kHLHwxqlEm63KmwSRcrCI+tda5ck1u/ONps477+7c/fvXAPzeGD74U
	VcXJayx4HdV55iqQfuStRoCfqcs+zg6It+ykO28JqojTs4myhf/AuG1zGIAsu6EIsIW07JVsXzR
	sab+Z/DAXAJGeib/oDICGzX8YuJ+he/qSwV0L1R1CxW/cXyqdloTSehVPmNT5pGhpBQB58/u6mP
	+PqINzWedZF8CwcQP5brakOI10sm9KLYVL5xIjnZecSPQWNXtu7uUpMxLowtxzAWe4IxybbEx0H
	U/N/L7USqYysJ4zqC4TjbI5oLd+DSk6/Si7AO03/8mur9nkinerS0Y/LP78=
X-Received: by 2002:a05:7022:108e:b0:143:48d9:a0d4 with SMTP id a92af1059eb24-146cb5025ccmr2243720c88.0.1790412016539;
        Sat, 26 Sep 2026 01:40:16 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm10487044c88.0.2026.09.26.01.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:40:16 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hfs: bound the partition-table hop in hfs_mdb_get()
Date: Sat, 26 Sep 2026 16:40:09 +0800
Message-ID: <20260926084010.569552-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926084010.569552-1-matthias.goergens@gmail.com>
References: <20260926084010.569552-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_mdb_get() loops "while (1)" around hfs_part_find(), rereading the
volume header wherever the partition table points.  A partition entry
with a zero start (pdStart or pmPyPartStart) leaves part_start where it
was, and the loop reads the same blocks forever.

An Apple partition map sits at the start of the raw device: the boot ROM
reads it from block 1 (TN1189), and nothing Apple documents nests one
inside a partition.  Follow at most one partition-table hop and fail
with -EIO after that, as for a table that cannot be parsed.  A zero
start is caught on the second pass, when the loop comes round again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
A partition entry pointing at its own table hangs the mount forever
without this patch and fails at once with it:

  img=hfs-partmap-loop.img
  put() { printf "$2" | dd of=$img bs=1 seek=$1 conv=notrunc status=none; }
  truncate --size=64K $img
  put $((512+0x00)) '\x50\x4d'          # pmSig 'PM'
  put $((512+0x04)) '\x00\x00\x00\x01'  # pmMapBlkCnt 1
  put $((512+0x08)) '\x00\x00\x00\x00'  # pmPyPartStart 0 (self)
  put $((512+0x0c)) '\x00\x00\x00\x64'  # pmPartBlkCnt 100
  put $((512+0x30)) 'Apple_HFS'         # pmPartType
  mount -o ro,loop -t hfs $img /mnt
---
 fs/hfs/mdb.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/hfs/mdb.c b/fs/hfs/mdb.c
index 277de712f9d4..1704f332e28d 100644
--- a/fs/hfs/mdb.c
+++ b/fs/hfs/mdb.c
@@ -134,6 +134,7 @@ int hfs_mdb_get(struct super_block *sb)
 	sector_t part_start, part_size;
 	loff_t off;
 	__be16 attrib;
+	bool part_hop_done = false;
 
 	/* set the device driver to 512-byte blocks */
 	size = sb_min_blocksize(sb, HFS_SECTOR_SIZE);
@@ -152,11 +153,18 @@ int hfs_mdb_get(struct super_block *sb)
 			break;
 		brelse(bh);
 
-		/* check for a partition block
+		/*
+		 * check for a partition block
 		 * (should do this only for cdrom/loop though)
+		 *
+		 * The partition map is at the start of the device: follow
+		 * it once, or an entry pointing at itself loops forever.
 		 */
+		if (part_hop_done)
+			return -EIO;
 		if (hfs_part_find(sb, &part_start, &part_size))
 			return -EIO;
+		part_hop_done = true;
 	}
 
 	HFS_SB(sb)->alloc_blksz = size = be32_to_cpu(mdb->drAlBlkSiz);

base-commit: 6812ce4e4379ffc99c52401ec28f0d7ffbc36206
-- 
2.55.0

