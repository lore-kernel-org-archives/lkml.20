Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647438A711
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520497; cv=none; b=fHtCdK6S3J2/jPk+z9eMrMpJ8t9Wbi8oNKcwf5lxbccO1xFgTo6lmGBeuHsGMBXaPbgqqXYjRWomacv8Zh9vJjhc+C7mFdOl1mZWNxTPP83+1lY7ch5DS0/+5lCPqPjRTEG493nNYSMHq9OIMRU+5Ksfce64nH3J/kkN55K3VlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520497; c=relaxed/simple;
	bh=do2e29h3iCrpskwlYhRBdSGZ7dqx+VcFP7BHTISjrlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QGdPhN9UF29RnlOiAB1dYH98BD3NiVZ4/+1y6zCOlv6mbZnHap6O8MSriEqEimGcffr92viO7szhJowkz9HLNezgQkql4HLQt7qwhVAMOjgqiQ17xL2DQOB5rQALVFXK51zXNrmT9c4PbyR0LPlPdTT+vvzzLOJ3aM/BEB+c4jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uye77nLm; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uye77nLm"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f64ea07036so820916a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520495; x=1789125295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WIywcI+KwOnj7pmM9lMtx2mzzeZ/y4sOtXjbhkXZsY=;
        b=Uye77nLm7+3/lTFRKIexKgLPzpmuqtguq+MgJPBVwtSAwvxCbKo4Z+Xp/4kt/uQIms
         HiNX3vTgP7hNEB9TScbxd03fxTt7hCngbPOCt+UBWeFHDekzt8UL+z6d/vGR2iKLt5Tu
         90/eui/fhXXnC5YJdixx+FR+4280hm7TurL3akJPMH3ybi3xXjsu5RNb553KlfGMU/mY
         bHlY4pfk7G5WQJ/JIR3LcJvMLs2pIPLaZFqCvvnc4oAEwkOjyptTGjChXjwFAF/TjmwQ
         vyWOxCz2T0Y2DFKMwUw44jCGzUz//q4jhKO1NTmRRVjXaUSK67mCfF/hcX9FYTs0ZMed
         7AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520495; x=1789125295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WIywcI+KwOnj7pmM9lMtx2mzzeZ/y4sOtXjbhkXZsY=;
        b=hWtP9oKvKxVh9uKrmUnEwQGu6s9+03pI4EvXjXUoe3g4JfcLZFTBOmVr63ZXe33O3q
         DXYA0sp8A/qIjaOkgemj3vqor1R4PktSQA131a8dh5ls0btj/qhHPCTTAOkKagHSgCtf
         zRZFH4RMr4V+XK4Hm1woNxIE+gd5LAIGjgKlUBzKYwbRw6FjdbcEpM/VMhVej4kPeuug
         uT8OL1fQDfNciQDnX7+J3X4j4E/F4Zl8C5o+5utuMecxj1TD/8XrgqYpsr43jS4qpC8U
         GLTz0uaBrwDxX4yfMK/+BK9e0LgofFOWSclOaO41BgxJun0udIZW+86+16zIP7RR28KY
         YALQ==
X-Gm-Message-State: AFuF++m+XvOL4FqJjVuMdj17OGFLFq2V3nVmkB3DnxahEpRrLDpidOqY
	jHAPFHix1qC81qbcGP7rgJMO5HtCaBLtYE/QF4vTdVOifATcg5+mRNzJlDa+lbkyjQg=
X-Gm-Gg: AYBFou2nJlzO6Jp62ix5iRciMEj/agk+gaf+iAcWIS2SH8cthI5Ugt1j48AxKtnfwOJ
	kjHxCqppdMhBG9t1m7si0SIalPojK9tJxc9wW6wCJisR9C8o/HKk5Dw+sohbA5wVhcZTk3d8R0T
	xXjt3uctjOLkkuDlcmfrgKQF4QSqdYzrsXp+DLp49BE/xj+yiCfmCEW+eyfMIFmWeUXiWmaDKg3
	6JtYMQJZiO7BteQ+Owyh6vVZxlEuAs0cyPkRsqT75GDoG494AuoKOY323zNHU6944XjT7tkQzps
	AwrKZXSVAWkv43nM1aru+6VprpBNVI++oo+scZQa5O23SSbB1YKhHd1I1cRbCImK3KWa62d4GfS
	bglq+rcmmk2gno3SkeG2NoycTiSsUDjkNKnfuJ1edMkAVbSZIFUmSsTFJjQ7mqFZvu7kfkKFiLc
	9GKHedsEdYgfsT5Lp3RXH5hVkFoLjM6Rau0luZVFLana092Cog7P1FbuzpyHmlb0xfXE0o15R4s
	G5S+LvDR41nv9dulzjdhtwDhQ==
X-Received: by 2002:a05:6820:4d04:b0:6a0:f44b:1265 with SMTP id 006d021491bc7-6b6fa8e0837mr3671210eaf.4.1788520494911;
        Fri, 04 Sep 2026 04:14:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5397869eec.6.2026.09.04.04.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:14:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	dm-devel@lists.linux.dev
Subject: [PATCH] md: fix typos in comments
Date: Fri,  4 Sep 2026 16:44:46 +0530
Message-ID: <20260904111449.26892-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/md/dm-cache-metadata.c               | 2 +-
 drivers/md/dm-crypt.c                        | 2 +-
 drivers/md/dm-exception-store.h              | 2 +-
 drivers/md/dm-raid.c                         | 2 +-
 drivers/md/dm-raid1.c                        | 2 +-
 drivers/md/dm-unstripe.c                     | 2 +-
 drivers/md/persistent-data/dm-btree-remove.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-cache-metadata.c b/drivers/md/dm-cache-metadata.c
index acd9b179fcb3..179b76173255 100644
--- a/drivers/md/dm-cache-metadata.c
+++ b/drivers/md/dm-cache-metadata.c
@@ -49,7 +49,7 @@ enum superblock_flag_bits {
 enum mapping_bits {
 	/*
 	 * A valid mapping.  Because we're using an array we clear this
-	 * flag for an non existant mapping.
+	 * flag for an non existent mapping.
 	 */
 	M_VALID = 1,
 
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 9e170de50ad3..013579a3227f 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2365,7 +2365,7 @@ static unsigned int crypt_authenckey_size(struct crypt_config *cc)
 /*
  * If AEAD is composed like authenc(hmac(sha256),xts(aes)),
  * the key must be for some reason in special format.
- * This funcion converts cc->key to this special format.
+ * This function converts cc->key to this special format.
  */
 static void crypt_copy_authenckey(char *p, const void *key,
 				  unsigned int enckeylen, unsigned int authkeylen)
diff --git a/drivers/md/dm-exception-store.h b/drivers/md/dm-exception-store.h
index 061b4d310813..6924d673cf45 100644
--- a/drivers/md/dm-exception-store.h
+++ b/drivers/md/dm-exception-store.h
@@ -135,7 +135,7 @@ struct dm_dev *dm_snap_origin(struct dm_snapshot *snap);
 struct dm_dev *dm_snap_cow(struct dm_snapshot *snap);
 
 /*
- * Funtions to manipulate consecutive chunks
+ * Functions to manipulate consecutive chunks
  */
 #define DM_CHUNK_CONSECUTIVE_BITS 8
 #define DM_CHUNK_NUMBER_BITS 56
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 8f5a5e1342a9..ac019a0f5a92 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -1784,7 +1784,7 @@ static int rs_check_takeover(struct raid_set *rs)
 
 		/* raid10* -> raid0 */
 		if (mddev->new_level == 0) {
-			/* Can takeover raid10_near with raid disks divisable by data copies! */
+			/* Can takeover raid10_near with raid disks divisible by data copies! */
 			if (near_copies > 1 &&
 			    !(mddev->raid_disks % near_copies)) {
 				mddev->raid_disks /= near_copies;
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index da2a5e2002ec..36516338ca6f 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -1393,7 +1393,7 @@ static void mirror_resume(struct dm_target *ti)
  * we have encountered.
  *    A => Alive - No failures
  *    D => Dead - A write failure occurred leaving mirror out-of-sync
- *    S => Sync - A sychronization failure occurred, mirror out-of-sync
+ *    S => Sync - A synchronization failure occurred, mirror out-of-sync
  *    R => Read - A read failure occurred, mirror data unaffected
  *
  * Returns: <char>
diff --git a/drivers/md/dm-unstripe.c b/drivers/md/dm-unstripe.c
index bfcbe6bfa71a..770a9958def0 100644
--- a/drivers/md/dm-unstripe.c
+++ b/drivers/md/dm-unstripe.c
@@ -33,7 +33,7 @@ static void cleanup_unstripe(struct unstripe_c *uc, struct dm_target *ti)
 }
 
 /*
- * Contruct an unstriped mapping.
+ * Construct an unstriped mapping.
  * <number of stripes> <chunk size> <stripe #> <dev_path> <offset>
  */
 static int unstripe_ctr(struct dm_target *ti, unsigned int argc, char **argv)
diff --git a/drivers/md/persistent-data/dm-btree-remove.c b/drivers/md/persistent-data/dm-btree-remove.c
index aeec5b9a1dd5..2357ff9b53f3 100644
--- a/drivers/md/persistent-data/dm-btree-remove.c
+++ b/drivers/md/persistent-data/dm-btree-remove.c
@@ -31,7 +31,7 @@
  * least MIN_ENTRIES + 1.  We do this in the following ways:
  *
  * [A] No siblings => this can only happen if the node is the root, in which
- *     case we copy the childs contents over the root.
+ *     case we copy the children contents over the root.
  *
  * [B] No left sibling
  *     ==> rebalance(node, right sibling)
-- 
2.48.1

