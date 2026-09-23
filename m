Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D84B7A4B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164710; cv=none; b=cxivmkspsB5N5IbBlYP3R2/OVdsnPG9MeDVJyy8ZsZ/VijHq4hYHcqjZfPfwPW7O2wg+Yv39QbB7jNhli9q/xOm4m3JFtqhbmWE9cu5ArxpMn2Gqx3b1P2lxb2TPvmFqd+9/1WGFJjWSpBn6Yw2tOFoynWsloZXcuOWmjnAoW8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164710; c=relaxed/simple;
	bh=ifTmuhdYEfA8S+Ti9vBnBv8jVJkTFG9fKTW/c6hx1FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DPaNIYQqDWmfvMHsqjZmj0jdxQEDV7dh44owvN3spm574Xp/n3915lA0mNrLetV9k9zxN48DO0TLj8AexKQ5wYOCWNmRCt/WWKk0C5nI22ds5A/O0KDzuH0TZZx6M9Cl2AFMeqyhld5A2+82N3ltdP1JGfLgvzdq9UHCrVeHSQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/nsXj3H; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/nsXj3H"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97ea1a712deso290392241.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164703; x=1790769503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibl0MHrnxFzM837MpKxLVego5yHxJdHEFJ+77R4ZX9E=;
        b=i/nsXj3HBjJwaFiK/WvcUoe4E0BCWdtNaiOYTgdmylvpOiqzO5zCoWqYW9DZOBvZzQ
         /TgnxS2Ii2BE9zExDNiwpW4bhRvMf7q+bP5kiZ7nEtX7xZWe3kTqlqFA1ZRcEPUp5I2u
         uX6J7M0+7HHmpe7+rJJnzqz41PoSVqeFdbmctI9Q2uUgwoQ7ZaCWcbgkf1hcktGz2Z0o
         lMKXA5E8u7xMW4SHvc87aORe4hSZVyZNTn2G8byfOqcY3uvcFaJtxNAiN+EHNvpBD09m
         eNzorVOgqBsSGo5JfTLE/NOs0HDpssXfelWQs3G4RGzv+7tx8nqDQLBLIIQOkxjRBMnT
         UbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164703; x=1790769503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibl0MHrnxFzM837MpKxLVego5yHxJdHEFJ+77R4ZX9E=;
        b=CdDzmaaSFyCbTP0q0up+6uSkH+XACCyzeg7tXoOJq7nH7YgQs7k35wo2jEm5p8DWY9
         8wcd7eLcfrbYLo7iWOr23xVj2V/RnDTYUxaWB93KeTNUP00AwE+OcJdejshIo/sL/Wkn
         Nq8dH3WKKYer2tmu/SATmINAft1OcDa48+pplhlBiYrjF3wwpq7cJQz0oSHu8ACRuuDg
         La/ZWFF8fXPz7TOlpBggnXkoih8b07sPKZFB2tcV23MdYtwfQAlMzpjmFaP9FwtL6yNr
         Fflp/uP3Zaz7SZLH1tJh8tVOvxCqK5WaI9UP2ZoQgZ8h/8hkzE6aiUTnmwvhOQ6VtXSK
         3dgw==
X-Forwarded-Encrypted: i=1; AKwUvByadLRw4smS0bOvMC9P0Snu5wXjkExSiGa3bf9+tXAg3bRswQSiwvTHrWH/jyxp26al05mbyUeD26JWqdo=@vger.kernel.org
X-Gm-Message-State: AFuF++kJMXwcXqhz+gpVWEcmbmbGHRCVLOjeeoPYHEh8T9ZsH7ZUGM2W
	XoPCkuMmqMlLAZbupqzT3mMpH+lWV0aQW8O9zzSZpNHyMZnwUhCR1LYT
X-Gm-Gg: AYBFou0kv0zLDeHCGOLg+GTTZSyLX/JmNH0W57Ykgrwujs1JP+OasBa00CeB1R33O8/
	0jFdraWcm1EanXea9RHtLeT0BEZDuesuSUfnlRPXghVz0Z1I5U/oy9XtLP2c6VvY8z+TgAY6mda
	/D0GUYHGa5Vwfucb/8AeSlbyem+5fp2+ofpI7tcETMMfi3sauboj5dYAktescHi48pSFCliMX+y
	Yj/xbx11VJMCtNPgFKc6Z/k3dLCzINuuZznzZtqEM4qNA/3GV+7tK0Jql0sIsGjx8tPETinwRXZ
	Bbt/pAh6o6BEK3dZEQuDQKQoY+QxfzUTFCKDdTdqseKBdOJhQrdWRaABCgQ8+yrUsUJIjRZ1TOm
	FN2Ga4LYyYD2EAI1QQV+KBzcZOC7U4YnnF0yRF9xe8cnkS29/DjMSGm8BSDUvb4bvtTg0/opuyf
	2wkTBqXNdGAanQ6NifTrFH3EgghGPns2Wulge0awizUf5zAHnadeLwYOEa2/aJ+wI=
X-Received: by 2002:a05:6102:f12:b0:79f:45dc:118e with SMTP id ada2fe7eead31-7ac1acd5debmr2043519137.5.1790164702882;
        Wed, 23 Sep 2026 04:58:22 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca2876229dsm1091399e0c.3.2026.09.23.04.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:58:22 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: linux-xfs@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 RESEND] xfs: bound da-node entry count against the correct geometry
Date: Wed, 23 Sep 2026 08:57:54 -0300
Message-ID: <20260923115754.3196232-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xfs_da3_node_verify() bounds the node entry count against the larger of
the directory and attribute geometries because, as a buffer verifier, it
cannot tell whether the block belongs to the directory or the attribute
tree. When the directory block size exceeds the fs block size (e.g.
mkfs.xfs -n size=64k -b size=4k), an attribute node buffer is a single fs
block that holds only m_attr_geo->node_ents entries, yet a crafted attr
node may claim a count up to m_dir_geo->node_ents and still pass the
verifier.

xfs_da3_node_lookup_int() then indexes btree[] up to that count during
its binary search -- an out-of-bounds read via getxattr/listxattr on a
mounted crafted image.

The buffer verifier is the wrong place to tighten this: it has no fork
context, and the transaction-less read path used by getxattr does not run
xfs_da3_node_set_type() either. xfs_da3_node_lookup_int(), on the other
hand, always runs on that path and holds args->geo, the geometry of the
fork actually being searched. Bound the entry count against
args->geo->node_ents there, before walking the entries.

Fixes: 7ab610f9e0f1 ("xfs: move node entry counts to xfs_da_geometry")
Cc: <stable@vger.kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
v2: reworked per Darrick's review.  Do not infer dir-vs-attr from the
    buffer size in the verifier; instead bound the entry count in
    xfs_da3_node_lookup_int() against args->geo->node_ents, the
    geometry of the fork being searched.  cc stable.

 fs/xfs/libxfs/xfs_da_btree.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_da_btree.c b/fs/xfs/libxfs/xfs_da_btree.c
index 9debb95d86fa..95ea3737eb33 100644
--- a/fs/xfs/libxfs/xfs_da_btree.c
+++ b/fs/xfs/libxfs/xfs_da_btree.c
@@ -1787,6 +1787,20 @@ xfs_da3_node_lookup_int(
 		} else
 			expected_level--;
 
+		/*
+		 * The node verifier cannot tell whether this block belongs to
+		 * the directory or the attribute tree, so it only bounds the
+		 * entry count against the larger of the two geometries.  Here
+		 * args->geo is the geometry of the fork we are actually
+		 * searching, so reject a count that would walk btree[] off the
+		 * end of this node buffer.
+		 */
+		if (nodehdr.count > args->geo->node_ents) {
+			xfs_buf_mark_corrupt(blk->bp);
+			xfs_da_mark_sick(args);
+			return -EFSCORRUPTED;
+		}
+
 		max = nodehdr.count;
 		blk->hashval = be32_to_cpu(btree[max - 1].hashval);
 
-- 
2.53.0

