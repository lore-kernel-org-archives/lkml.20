Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECFA28851F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790209005; cv=none; b=nM4miW0bokjjLNOY2rKweVWzeVqTR1XdULTlJdi7JFQggzQvYfMOos0ohP+ASPWfHuDzQAAV71rIW3aTSZ+nJHUnR1fOo9cVksskX1QDKM3/Q4mw5697JPunbRTw+VpPtR5x1n2PCqYWry1Lp39LWSsp/vNT3V6/f+TzCzoKIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790209005; c=relaxed/simple;
	bh=zKO8LCXtSY7A/BaqvbgkF0sw+RFN7Ygdo5r8wh1GK1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0909e7f3sr1Y6rQuQzzJ/EM7T5DF4tSGm2SfKR/Tyo7JzwPvOUGCMK8EwBEbgq3kIZJbDn5xaB9eLRsfjVo50pBON9MqsxtfBw6tL8av/m7I/ZKGRhUcg3C5YhhvBo4R+p6BOk5yzDAMd22iK19AF0gC0BQ9wghqZ2Ezu1BL/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYLNOKTv; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYLNOKTv"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f7915355so1088385c88.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790209003; x=1790813803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKIfIZS8dCYaQ2CGZuSRd7REZgrG6dAK91wfVd19qpQ=;
        b=VYLNOKTvxDTFhUWnn4lZ3hXOfoyZPyxAxgX4vplt3PFkreFPnjqG6D/jZwDVetUOs7
         rNMtqE/d7+k8Swo5gjCdlyROCKUNkApepWSQzL6ciA+06Hvzlb+p8jHRh3iVoQAqlY7M
         HoxxFt42aW1MQTmu1IiNmdGSjG2JFuqAYmN3S3exH/Y5gpMg3kLD6MWfy5eOwqvwbDO0
         23WFgB1xDjjslUnCZqFuy/bOXnXSoJjlGJRPyGgn5Gts3TOl7NVHusB5r+Ris6M3OqFF
         6bFqhQW5Q1UO7qdK7nJbrCDjkrL4KXs9HLReXvBw1na3XquAYqgx8Qe+q8OeU4Hmb8AZ
         XIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790209003; x=1790813803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SKIfIZS8dCYaQ2CGZuSRd7REZgrG6dAK91wfVd19qpQ=;
        b=MKX+eA2M0B+AOj33AZ6V//XIPwFITz93A8fvtZVWjp3TXjfNb9hGouFbYL8VIaKldj
         D3VSblAdqTmQC/VX17eUL6WXaUSQIIavk6kVefaNt8Yqo/fcmBTHtz3kK3S2jtTQBXwE
         fwna9b0ps26IIb5+DlV+0NKxRPmpPscrIH70fzaWHtpL8u65kptAnhpQ8PvzRa1RWOgT
         iF/hU+BL4PDQC+smumNqXbqwZ1EXexRItKnj497FLvHeVCnV5Leh7z0Nlz/AcMWdIqHu
         DFSpOecdFXDip7tZETC6jADVkEbwakmVg8P6c8/GaO4mu7zxt5qsArSQ0W/F9pepIEha
         uREA==
X-Forwarded-Encrypted: i=1; AKwUvBxkFTIhNkJnVQBEOrE6AChUdHA+cDI+KIGPhhwXHORbQp08u5JRUGguUS2cFm+hRaSpg4lJdXswIkSYfp4=@vger.kernel.org
X-Gm-Message-State: AFuF++kEWBOU2wlKAcWbtc8KJ0ux09BXg5LuDyg91HR467Rfhj/DZ/my
	3jjuZHBlxcVtC8M6i4oullTdAVeBYdKSWKeLdXoasUqQfWvXuIkyfg45
X-Gm-Gg: AYBFou3dVeM3aJbEQxHXgjVhoJerYzl3ffhaReti2WyG9yf+XOl7+FXUvVSjre0djSW
	pItqXTqfxz6T6GAZ4Y26ejf+oG5kkXH7GSUjzStEKOMcUwan1WRrWSo2yTJcNmL26usDlAirpwR
	CG8gzRASqV4nfLqcJZuPvFoRpsoXc9HlSG3IJTwQBs7dq2k7IK8oZ47O/xrITDvtY7U03hmc3+G
	p++2lXesSkn8pVX3krJc62xOOSuVTvfGkbYt0F7UOwGXu57OucqEac6u3FOPE63k60S0RvHeljN
	qg2tBrTstx/71dGyvqqm3e29RiN0zDD0xwp/juBJmqJPPzrzIJMjiOcCSMXDn4Okl69aGFtU37/
	Lvpj/foAKzks07OEZE4MRznhIPi2f63v0PLMLapLO1KxlAa2dXdWNnjG1xhFsRiib2P7IQmCGnl
	Bxb8/tv1EegauiQSnScKTb5nk0CLK0ZnTE3I4KRvu/OJLkm48KUDIlQYn6xZSinUmEBmClKAq3U
	ymPsRjiN89p5yXJfJAIaNDcNgFiwSeLxUW7hwg8zSIBFJT0pbTXJjO4vQ==
X-Received: by 2002:a05:701b:21d3:20b0:143:26f9:becb with SMTP id a92af1059eb24-1450404c846mr514565c88.35.1790209002687;
        Wed, 23 Sep 2026 17:16:42 -0700 (PDT)
Received: from bazzite ([138.122.221.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm8311140c88.12.2026.09.23.17.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:16:42 -0700 (PDT)
From: Davy Felipe <davyfelipe34@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Davy Felipe <davyfelipe34@gmail.com>
Subject: [PATCH v4] hfs: handle extent B-tree write errors
Date: Wed, 23 Sep 2026 21:16:23 -0300
Message-ID: <20260924001623.1765392-1-davyfelipe34@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c569d5f8ee542e5c86a7e4dee23df99f4ec0becd.camel@dubeyko.com>
References: <c569d5f8ee542e5c86a7e4dee23df99f4ec0becd.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_brec_insert() may fail while inserting a new extent record, but
__hfs_ext_write_extent() currently ignores its return value and clears
HFS_FLG_EXT_DIRTY and HFS_FLG_EXT_NEW as if the insertion had
succeeded.

Propagate errors returned by hfs_brec_insert() and only clear the
extent flags after a successful insertion.

When updating an existing extent record, hfs_bnode_write() returns
void. Validate the extent record size and use a reusable B-tree node
range helper to reject invalid write parameters before calling
hfs_bnode_write(). This prevents an invalid update from being treated
as successful and avoids clearing HFS_FLG_EXT_DIRTY in that case.

Negative-path testing in QEMU confirmed that an insertion error is
propagated to the caller. Testing the existing-record path also
confirmed that invalid write parameters are rejected before
HFS_FLG_EXT_DIRTY is cleared.

Signed-off-by: Davy Felipe <davyfelipe34@gmail.com>

Sorry, I missed your suggestion about factoring the validation into a
reusable helper in v3. This revision addresses it.

Changes in v4:
- Factor B-tree node range validation into a reusable helper, as
  suggested by Viacheslav Dubeyko.
- Keep the extent-record size check local to the extent write path.
- Preserve the error propagation and validation behavior from v3.

---
 fs/hfs/btree.h  |  7 +++++++
 fs/hfs/extent.c | 12 ++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/hfs/btree.h b/fs/hfs/btree.h
index b4c3f2a31471..576412e6901e 100644
--- a/fs/hfs/btree.h
+++ b/fs/hfs/btree.h
@@ -84,6 +84,13 @@ struct hfs_find_data {
 	int entryoffset, entrylength;
 };
 
+static inline bool hfs_bnode_is_valid_range(struct hfs_bnode *node,
+					    int off, int len)
+{
+	return off >= 0 && len > 0 &&
+	       (u64)off + len <= node->tree->node_size;
+}
+
 
 /* btree.c */
 extern struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id,
diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
index f066a99a863b..ece782205b47 100644
--- a/fs/hfs/extent.c
+++ b/fs/hfs/extent.c
@@ -121,12 +121,20 @@ static int __hfs_ext_write_extent(struct inode *inode, struct hfs_find_data *fd)
 		res = hfs_bmap_reserve(fd->tree, fd->tree->depth + 1);
 		if (res)
 			return res;
-		hfs_brec_insert(fd, HFS_I(inode)->cached_extents, sizeof(hfs_extent_rec));
+		res = hfs_brec_insert(fd, HFS_I(inode)->cached_extents,
+				      sizeof(hfs_extent_rec));
+		if (res)
+			return res;
 		HFS_I(inode)->flags &= ~(HFS_FLG_EXT_DIRTY|HFS_FLG_EXT_NEW);
 	} else {
 		if (res)
 			return res;
-		hfs_bnode_write(fd->bnode, HFS_I(inode)->cached_extents, fd->entryoffset, fd->entrylength);
+		if (fd->entrylength != sizeof(hfs_extent_rec) ||
+		    !hfs_bnode_is_valid_range(fd->bnode, fd->entryoffset,
+					      fd->entrylength))
+			return -EIO;
+		hfs_bnode_write(fd->bnode, HFS_I(inode)->cached_extents,
+				fd->entryoffset, fd->entrylength);
 		HFS_I(inode)->flags &= ~HFS_FLG_EXT_DIRTY;
 	}
 	return 0;
-- 
2.55.0

