Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236173;
	b=EWo0quLnwLoTWUVvV0b25VP9BFPRKKYjnfDy5Wk2tn6mUu7/yJ94IAhjitu7bM7wBFTE
	 2kHgjtoBf5alSLvInE3Rp0whlqX2t21diJsiunuskK9e5ziNac2rf6l0xBIrMnRSWVglh
	 wkWyQ6rr2sFvBZh9M5HNO613Fm/sedCT0PB9Ce1xejBb5cgBvyXneDMgIxeRM9NF5dA//
	 65LRYjSnZCjO57vvqHd8Gl/Dt+LFq0Ls0jJf6Zm19CevDDpLDAtFIHHaO2vvHaTZMDerV
	 G30cLA+5DsSMhah7FfAP9mHGD8wHIjeQWTWkyuk2sxGfPgdq5nDLL0cRmjnQxqr829g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fa3cWEpno319wkUWKX53/JP608wR2XPrIP2o3Tz0eeE=;
	b=cEXNKw0c9FYDdAT1eWHsZU2Q/p6pXCcLRZgJOFI2gURtH1o7iorYLcoid45VzkD/zoVo
	 and+uI4tyoyAgx9kSePlsWVkk5SxJQL3yalukglmbYwAPQe7pNMNW/YWJk/XMCwGMZ2vs
	 GbKT1mV/rDGpAQLgHhqKYvsJlgPo7XHLE2vCik+rtivenFffocLIIF/pkv1NjTuesJma+
	 vw8oXzNU9H/qQmHN9YokS1BEUheFLAWVyA6COlMZ/UALW4an7wYBeEKxf0K0hoVfUBjX6
	 8YFmT6OW1wf1gSmrtekMmTMAIaa7Noc9TKu0Sjn1SxA/RtTE/k9Qs+cbhWB3TFvekKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PKuPwZIA;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B8606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4B8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PKuPwZIA
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91befe703c4so14369286d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793236171; x=1793840971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fa3cWEpno319wkUWKX53/JP608wR2XPrIP2o3Tz0eeE=;
        b=PKuPwZIAD9J7uJNwVLLAh5a+uRxdTqTyqR7yO9KwTAAybdFVOvfQS5w85EBad7vegj
         GQQ+sMEP/0oaNMX4Zj5LCb8p6wJ7F3n1fkarGVLe5xj3GIwtmAmJSGUnnAzthKOIolKJ
         9as6jW627nx7cf0Q1BcqtZ5G1vh/xZ9IUT3d12YgJqqZcOoRQoLIubomXC3ZDrHyeceK
         xZOGHMeG23kHxNmwBIwlvenAyz9ojOqftR10Pg3GQFb9dLwLU101x2hs28R/kvUgTQ0Z
         GP3LpEnGgglp/7/RSg1Mrq/gMG7Lqkv8t0rsci5z0v9kTmhwVMYLhiO1t4mRuzQ33D7W
         nwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793236171; x=1793840971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fa3cWEpno319wkUWKX53/JP608wR2XPrIP2o3Tz0eeE=;
        b=bwuTbO8K+gx+bYWJXGaxfUc5WBr3k61niiDqQxj5PZCkgiKdupN/EeHAfxrRB1vZq5
         hcnzWF/1xjIxZoofa0AdBJr6/XWTR49LmdUO36GzTFREbEqbhwUlfB/A7FLWO6v9vZWm
         CFueugBRVJAhChTcoFOZ/YqJaR3tiQps/aPkQYFeyNXb0hbqoxTCPoctrvdVh69IV1Mw
         oYWEfSHpENS/WBk5SYfkdvzzTBZkHliknGYpVgz+gITIfuEfF/ZP4XNgvStjuRB/MK5W
         w1z4aFxxRLQfkPUkQsHOTtDREFFyflLsinTPDWdRRsRaSwMCdUtNxGS8dTxM4IbxIOxs
         x8yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzopSGCA9wyrEK5GdE5G0K395TldTULT5z0p1kCk2G0Q1Bd8UsxDiSEDbjwYbues9ytfnUAvhubSlBlDF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL9h4qqqvzGi3wM/NtT06t7cpcs145uKD0hIEmeR3VBYCX1x9G
	eUOdm5gfgsKh2BaM49fjvrxvCr31yzZyXFt/QPDwmGAaAYWT1m7RCl9FQMvWjimhLxNgQrUYo0e
	+J59W
X-Gm-Gg: AYBFou3G7r4D2ggfVdZGD8BKxbWx8yxMbZ4KZo2pskCVaNeZtVYlQAriGTAhFLW0oEw
	EqWb1UKPC75m1O+syv7wD/RidL7a/qJz8J2qzZgNa5MdNH1rhCBkpzbsrlLON8XoMq+9vjmxyuy
	McRb81qZ0r0OFN2E/dj5XgQ0qhBGTeG6LgjSCdXf+1cLA1mrekqV6HpWZUuTZk/LLGa4BRqH12L
	Pf75NTYJeJIQJ8O3gzSMXSradA6dyE21cl71HmvWNR9whGXhe6zXVIVid3zdU+gx5DFaZRVRqeL
	OlkUkHdzK43G34Qj+w0ZVmiuhnuCuM+UFEryNXYoqD12lK9gVrNAXrxeqcq17EUvto6d2lEpg6H
	pigQeMLJ4Axz7rxuQKNNDpDZQOdFxCO6F/MeGQoxG/GG9WZup9m2qT/dDvlABGHVL6UewFfS1SG
	2WeGrKQNf9gcPgY/oMRvv9PSGtBBQPklOhe/gxXTSBZ4H/Mxa8UqrZGwdgkPkCy+i245V8LPZHf
	oc4+886MoMKzFaPNKjzccYm/cpUdF5PzVc7iuITQa76OzER+g1BDN5Z0I4sMTeRjuAZBDadCFlo
	twfziW//hRcJOmrHmMPFnFmHfnrdYaUkSSN7wAPVttz/GA==
X-Received: by 2002:a05:620a:2807:b0:939:7683:33d5 with SMTP id af79cd13be357-94408a695a5mr641483485a.19.1793236171367;
        Wed, 28 Oct 2026 18:09:31 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f078e516sm1407749585a.33.2026.10.28.18.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:09:30 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 29 Oct 2026 01:09:15 +0000
Subject: [PATCH v2 01/10] ovl: setup overlayfs' private bdi
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-b4-ovl-containerized-sync-v2-1-4e9f08e4a052@toxicpanda.com>
References: <20261029-b4-ovl-containerized-sync-v2-0-4e9f08e4a052@toxicpanda.com>
In-Reply-To: <20261029-b4-ovl-containerized-sync-v2-0-4e9f08e4a052@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793236165; l=2269;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=74ImzQ7zpYMMINxR4xsfYw0uL7kLUXRHS98AvYSiyms=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJiHpMOMNCOFs9w7W95tCK/aAVI3EgedZVWQ/ZFj9ZzhNJq9BgBEn6uhvSgb5XAJdkagkPCa+FQ
 g2gEiMXsjXwA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

Setup overlayfs' private bdi so that we can collect
overlayfs' own dirty inodes.

Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
[josef: only for an overlay that tracks dirty inodes, add
 ovl_tracks_dirty()]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/overlayfs.h | 17 +++++++++++++++++
 fs/overlayfs/super.c     |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 92da556598da..aa6c2d005a40 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/uuid.h>
 #include <linux/fs.h>
+#include <linux/backing-dev.h>
 #include <linux/fsverity.h>
 #include <linux/namei.h>
 #include <linux/posix_acl.h>
@@ -663,6 +664,22 @@ static inline bool ovl_should_sync(struct ovl_fs *ofs)
 	return ofs->config.fsync_mode != OVL_FSYNC_VOLATILE;
 }
 
+/*
+ * Does this overlay track the upper inodes that are modified through it, so
+ * that syncfs() and unmount only have to sync those?
+ *
+ * There is nothing to track without an upper filesystem, and a volatile overlay
+ * never syncs.  sync_filesystem() does not write any inodes of a filesystem
+ * that has no writeback, like tmpfs, and nothing ever clears their dirty flags.
+ */
+static inline bool ovl_tracks_dirty(struct ovl_fs *ofs)
+{
+	if (!ovl_upper_mnt(ofs) || !ovl_should_sync(ofs))
+		return false;
+
+	return ovl_upper_mnt(ofs)->mnt_sb->s_bdi != &noop_backing_dev_info;
+}
+
 static inline bool ovl_should_sync_metadata(struct ovl_fs *ofs)
 {
 	return ofs->config.fsync_mode == OVL_FSYNC_STRICT;
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 19b6d54c4500..ce3e30235ae9 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1455,6 +1455,13 @@ static int ovl_fill_super_creds(struct fs_context *fc, struct super_block *sb)
 		if (err)
 			return err;
 
+		/* Dirty overlay inodes go on the lists of this bdi */
+		if (ovl_tracks_dirty(ofs)) {
+			err = super_setup_bdi(sb);
+			if (err)
+				return err;
+		}
+
 		upper_sb = ovl_upper_mnt(ofs)->mnt_sb;
 		if (!ovl_should_sync(ofs)) {
 			ofs->errseq = errseq_sample(&upper_sb->s_wb_err);

-- 
2.55.0

