Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C3470426
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522733; cv=none; b=NmA0GGkQVSf9w1HWe6Kpwz1kNX+dtgMFFcap5XSqnroOzfhK12SM5v0ZiM2QU+eigbRLb2pzmMZkLmnElGd4Do0g3g/e5zFIqZDFHrvmlqrhBrEf/6yCuiMui2YgPD0I95p03AVDNvqu5iBKrl8LUGUwBc/QSor0ciyVvsDeqWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522733; c=relaxed/simple;
	bh=CVTyLq7Jb/vOThcuoPEHxQED1fBMqRWMlb24y0vRUdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uH8qRjAeHOVAIwiNtO97sK0UkTAE4h2Cr1awaeYLxLrY9f7CM2PQBB4FmPPAOA9YPHL5d+W4IcqqpueqQfzScCLDMnlkwN5hJPoQTMuyOUduJWO/cchFnw54n/AUK9eXEE5UHtsKIPttCsPSHPbIgYlJdfQR8cK+28JvEF0ePOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okN/uf3q; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okN/uf3q"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f0167e59a3so632483a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522730; x=1789127530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VFEC9e7xkVwyJIpegSmzIwTQpMzbBRL6sf+8efQTujU=;
        b=okN/uf3qOjsSGhOYBFXv2BHXg1Ty5YCQSAMndzp/EY0sYzIoWNdBVTE61HX/v3L0pj
         NJQINbYC9AAsBS0XMcgIzCtksgaGY8Hgll8wL541gankF7Lt+fP0Q8S+UPlUR+S1B7vQ
         35uxwcXaxcKVEiCRUqbuHquFPv85bMor6LrCM/JhVvojGBEhdOSz8foK5JBaQTGYMhZ6
         Z2C6t66xufLHjw8TnwxQ0+ERzSwLptwK9ztaoh9sa8K9R0b5ns8uyuRi74ggt98AJCdd
         mAgEDASm3XJDC1zJXy2feE15PstndYX1X/ulbg0Va/ndpN00/WYteLrcYF05p1pkGzmx
         vaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522730; x=1789127530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VFEC9e7xkVwyJIpegSmzIwTQpMzbBRL6sf+8efQTujU=;
        b=Aza+yny+BzxSoNxPVxoon8Pq0QylcANegw6Qnmv6X2vgx32vNi6+aaoo7DF8vQ+V0x
         /UkgaKiWdKky8aAKb3ycT+nWQim2R7V9cVvlH+PlOBDYsAt4jHnSvObM/R9j7olwhYsg
         aBDwCJg3J63vm+pk/D/M4D1ycH1rKC9ILUlu1TdIZfxZrlEDDTyESCm7qTqXfHHJgfVa
         WWqpKi4T2oujlHJjQv8hqaG1QklZeqpDlykmoPlQhstFs/AOrfG7ow4YpRL9lpOCbFux
         R4AILHBK7Gs9Pl6ytfVaaio/1eMk0u2QcFy4rWWDsB/xasIe9+kKlm8Kq6UtQhKOe0Jc
         VaxA==
X-Gm-Message-State: AFuF++lMFkH+JkqS40tCdTMOwaUVVVw+1ElAH7EWaCOwvkBjGWkRqd45
	neetN62tNKtAMe/0s5/yylh3r3wpxMMj1Gll0VItwKnS/1vMRjA/aHKB
X-Gm-Gg: AYBFou0a0WPl7pb9pQKGugVI2OyD0zm0XPUPrEZcm8B6gs/2W6FdcClwBNGrc/OVM1V
	jQ0bL3Ycmii/PVaZOFxnaEQVEL82voPaOBuWh2RAjiqea+XJ4jQGeVd1OuDBghyLZqSI0dVjznB
	4MCTW408596hxjRlH41ImWed2WVdf1Cl7tGRVwQEAjV7ubb6a+It6GPfy8pm8uLqfV0gZ90LaLb
	uX6inse1H3eGckyMH5wBsRnY1RnhEIOMZXh/dp98YlXM2Ry4+5Yt3SQ5fNMpbfeVGMcB7yVQU0x
	9jTIYm/N/8WYvYcDyxg7S3xq9eYBaHfyW7NkEPdm1E5sboLe/JvaYcCnMI8xm7jp6UhyB4thtSH
	ArrGE48TRKb+xyiYLATGXVsqfsKHrr6hYag+Zellkw8i2GxNcK4T2tWf3xxi4eP2O9cZQBTfDSz
	pDgiU15xUWPrNx/DgR+WfFHfOKt5Kw86Po0JbO1kJY3G2Hv1SIbfIQfv1drSFIal0QK1AVKFr0f
	Mbo5r62zKpbEes=
X-Received: by 2002:a05:6820:16a7:b0:6aa:ea7e:1dac with SMTP id 006d021491bc7-6b6fe79521fmr3946413eaf.33.1788522730227;
        Fri, 04 Sep 2026 04:52:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6162943c88.13.2026.09.04.04.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:52:09 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Subject: [PATCH 1/2] btrfs: fix typos in comments
Date: Fri,  4 Sep 2026 17:21:59 +0530
Message-ID: <20260904115202.7113-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904115202.7113-1-hemanth.selam@gmail.com>
References: <20260904115202.7113-1-hemanth.selam@gmail.com>
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
 fs/btrfs/block-group.h          | 2 +-
 fs/btrfs/send.c                 | 2 +-
 include/uapi/linux/btrfs_tree.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/block-group.h b/fs/btrfs/block-group.h
index 69d56864d4ba..b349f94cf929 100644
--- a/fs/btrfs/block-group.h
+++ b/fs/btrfs/block-group.h
@@ -135,7 +135,7 @@ struct btrfs_block_group {
 	u64 global_root_id;
 	u64 remap_bytes;
 	u32 identity_remap_count;
-	/* The last commited identity_remap_count value of this block group. */
+	/* The last committed identity_remap_count value of this block group. */
 	u32 last_identity_remap_count;
 	/*
 	 * The last committed used bytes of this block group, if the above @used
diff --git a/fs/btrfs/send.c b/fs/btrfs/send.c
index dca3570168c7..dd90da2859b8 100644
--- a/fs/btrfs/send.c
+++ b/fs/btrfs/send.c
@@ -7016,7 +7016,7 @@ static int changed_extent(struct send_ctx *sctx,
 	 * get modified or replaced with a new one). Note that deduplication
 	 * updates the inode item, but it only changes the iversion (sequence
 	 * field in the inode item) of the inode, so if a file is deduplicated
-	 * the same amount of times in both the parent and send snapshots, its
+	 * the same number of times in both the parent and send snapshots, its
 	 * iversion becomes the same in both snapshots, whence the inode item is
 	 * the same on both snapshots.
 	 */
diff --git a/include/uapi/linux/btrfs_tree.h b/include/uapi/linux/btrfs_tree.h
index cc3b9f7dccaf..127aabd88639 100644
--- a/include/uapi/linux/btrfs_tree.h
+++ b/include/uapi/linux/btrfs_tree.h
@@ -243,7 +243,7 @@
 #define BTRFS_EXTENT_DATA_REF_KEY	178
 
 /*
- * Obsolete key. Defintion removed in 6.6, value may be reused in the future.
+ * Obsolete key. Definition removed in 6.6, value may be reused in the future.
  *
  * #define BTRFS_EXTENT_REF_V0_KEY	180
  */
-- 
2.48.1

