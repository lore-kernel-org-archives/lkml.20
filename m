Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25923CC9E9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816213; cv=none; b=W5UIbQs6Xw3/C5R6lhxo8LGRe/KZ4u1WSGdVAiv1KjOVas6LDB5Lob8pSGLadafdBi/2qvLAzLIq40W559IGKZ0v7dvHSUvf0/drkTLuAgg0uA3L6AXkCCXkVwA2Tv34+HWJmolAyKSsENoBg54qHLCnxCXxAMGcp//nv4OxjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816213; c=relaxed/simple;
	bh=ORJG5RZBBKDF5w5yXgfyuVNDj922KNo5P3ZNmNwwYkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3zJaTPP+aPxOjXdJ3XDY6oFzuzxrkQw9g7C0drMck3hVOQP2ejnlTndZLkPPaKlufiBzF+h7LPXFOquIZWG52M0JDCIRCdw3t0RzkP2H4KUb3RrxWW0z5NCmtziB8DGyhEGTdTx0hyQ5eo6zsnX5bVV77PVRCcG4EBPFLwa/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=XL/CPr5g; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="XL/CPr5g"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4859245e493so1850041f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1788816210; x=1789421010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yL/LcatQKBPIKGEJBi+B7MdIyWnp6MwRkzotSVxE0II=;
        b=XL/CPr5gLbcxMq7loio21J39o6oTJIFwaWwt2z7Bfsj1wmz27KfS9bDKmrbBLnG8SM
         J9u8zgIO4ANLcXEwfLGvD3D4vehCWnZfJPl3YiagMFwgdTNASKCL7aHCb60VqJClCcj+
         dKtLihuIiqM0q6KNuNpjc5nLT/pTPuxeoWxMt8TFGoNJQ8R5Y8qxo7ylDm1hSyM/O1VP
         hAHU7ni2slQorU2bCznq7XYXPfy5fdW8uZnXuIfogDYW0qalIPkRRKUZwFK16ii3RtX8
         450ILBQPLPDNOvixqVPC2tQRTrpdNVmFUGgEtwIGfEXZiAHbh3fFiLVMf89v8r3hoeiA
         FLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816210; x=1789421010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yL/LcatQKBPIKGEJBi+B7MdIyWnp6MwRkzotSVxE0II=;
        b=mexPNknADW8EpdoKyGLVQ4k/UA/WC4rUPrGv62K81600dwaqIQTMpsmWhpdBna9Wio
         LJWcwVbUM+RVJpl3Tq6vGgWMxl+4ipgl+/wOh4BbiYL5OJswWvzzUkxhUu/GN4OVRN9n
         61C/0C0SWIMg1aq5pmPtyYj5kf9yyacr7LfDLihcqGWW5HnJn8SLGyuhVZx/ygWpq+sl
         AatNaTpDNtDBZXHlJNzCk8BsNNhM7PpanvSOAz0Mdq28YtT40FCS1TW1nmvDzUKo9B8s
         moxsm3nne3b3p7/U9uDBjsfIxxVbWzI0i1zGvVab4l9ugGBeIbsGdB6QuIqury/6ZhfH
         igSA==
X-Forwarded-Encrypted: i=1; AKwUvBwXihbSb5Z3jhtz3r00UqrxvM264Vg/LAfHG+guNvqhONPUiP2qnx/ImRWs8QMIYnXmyYn9QtnGlhaHNDg=@vger.kernel.org
X-Gm-Message-State: AFuF++ngHfmkInvIQgikNMNpg8sCoaVgyF8AHYCdu5i9+nqG1+4evQvU
	3bQvtHbNvc6UgKNba93OuhHk7uqnoAEzGyuP++5xCkEXWonc4sXox/1K9HSp27FME9p1XEoYN1e
	WMKNiOkc=
X-Gm-Gg: AYBFou20DVyFtEPL7wzPa8q1Xct2e+VUOSXsNYuEkxwR1Qin7uDEJKOWaZeHAQaVu/f
	g6SaVxEXr41NvlO2UKZHwou0uIyn1NA/w1FK1rmV5xsbEQoTuupZLWfahAQdq7G+cFsJhzF7IoS
	CWjBfB7TBjZp5txdh276uzZ/n5Kx0E70+nsG+yJ8kQzx2St3XxzZGXewbE/uAt2z/ThT2nhnEWk
	23l7K56r+z5K7xVpIFMtk7CA36DWijaHV0MkePulKPMbfRlFAYNagl1HMOPOyKo2PkDDvT8jfAI
	ISmiTv6njh9aEUvohNQJon1pHZxPsR73GNy8VJ5UZfSBKR3BgLLPvOC8fACxA9/c4IGDxDyRWap
	skC+L01orvMeUSXO1pFABNZL3VAiDbWvX0urO4MI7sR/EZZZtsNMesETOpNB/4HI9QAafHBlZPk
	EdbL9/zxUSwpxz47EgUJPbPJ3ZpXdJMVgaMy/YB5cUzQ/ZGqAg1ZWCqA7zjAa0cBUwzzQ+4iBl6
	jd3AEVcwQwRE+nVNswjbwicrLqyf0sOsgO0D820kaNRGYhC0ZfbhxE1wNc4PRrm
X-Received: by 2002:a05:6000:2c0e:b0:485:a1a1:446c with SMTP id ffacd0b85a97d-485a1a1450bmr4325820f8f.16.1788816210120;
        Mon, 07 Sep 2026 14:23:30 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm26232785f8f.19.2026.09.07.14.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:23:29 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	xiubo.li@clyso.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] ceph: skip alias lookup when trimming non-directory caps
Date: Mon,  7 Sep 2026 23:23:25 +0200
Message-ID: <20260907212325.508739-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drop_negative_children() only does anything for directories; for
other inodes it returns true unconditionally.  The d_find_any_alias()
and dput() pair around it is therefore pure overhead for regular
files: an extra `i_lock`, a dget()/dput(), and a ceph_d_delete()
check for zero-refcount dentries.

Only look up aliases for directories and prune other inodes
directly.  d_prune_aliases() kills the same dentries either way.

Side effect: a non-directory inode without any alias now counts as
trimmed if the iterator holds the last reference.  That is okay,
since with inode_just_drop it is evicted as soon as that reference
goes away.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/mds_client.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 085ae0cfb5f7..81cb1e9b9769 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -2315,22 +2315,28 @@ static int trim_caps_cb(struct inode *inode, int mds, void *arg)
 		ceph_remove_cap(mdsc, cap, ci, true);
 		(*remaining)--;
 	} else {
-		struct dentry *dentry;
+		int count;
+
 		/* try dropping referring dentries */
 		spin_unlock(&ci->i_ceph_lock);
-		dentry = d_find_any_alias(inode);
-		if (dentry && drop_negative_children(dentry)) {
-			int count;
-			dput(dentry);
-			d_prune_aliases(inode);
-			count = icount_read_once(inode);
-			if (count == 1)
-				(*remaining)--;
-			doutc(cl, "%p %llx.%llx cap %p pruned, count now %d\n",
-			      inode, ceph_vinop(inode), cap, count);
-		} else {
+		if (S_ISDIR(inode->i_mode)) {
+			struct dentry *dentry = d_find_any_alias(inode);
+			bool prune;
+
+			if (!dentry)
+				return 0;
+			prune = drop_negative_children(dentry);
 			dput(dentry);
+			if (!prune)
+				return 0;
 		}
+		/* The iterator's inode reference is sufficient to prune aliases. */
+		d_prune_aliases(inode);
+		count = icount_read_once(inode);
+		if (count == 1)
+			(*remaining)--;
+		doutc(cl, "%p %llx.%llx cap %p pruned, count now %d\n",
+		      inode, ceph_vinop(inode), cap, count);
 		return 0;
 	}
 
-- 
2.47.3

