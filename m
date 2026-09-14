Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3B53B3C14
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429207; cv=none; b=DkmQk0p0pdBlfqHTC0eFRetJEzp31hqu3XcL35yWVT3M9Kr1ty/QGElVN6GJYAmRmaNZ/1Khw1/1CC09/zzpClQh15RFJscRresd+tR5/dxYHJ7SCqPqFeDo7hID4SmaqvUEQnvz8xl1Pmnm4uRXUtZAdxOAqH9qEf4mb4ayRtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429207; c=relaxed/simple;
	bh=OVJzpWfHSM6a6wCkK3C71K/fLknshrLRt2xkWr7HMRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNt4DWt8kIgdqG1LMu2KsZc1RWOYTczseU8ev/q4NoF/KnKBl3aN+mSPcFfOdQjBi/0WnM2bamGCYaOV9fzN8xWSQLbi3UgoR3JviMKr+xvxoWmxYFgy5C+irfY86DDEAyV7PJEIJeA8dkoS4LRHSnBCdSQIsDpO9lftFtVPO8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=r88D3JeQ; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="r88D3JeQ"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d881so2457465d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1789429204; x=1790034004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUa9GDJb+Q4jhCXihDpgFN+RTSjVzxtIFk+RZAxtdhM=;
        b=r88D3JeQL2P3PXHbbiXZ7raadkNh4voYOcmqymra7LA/7tEtn3kohXpUfTVIVb8eoD
         5P1xcVOENJtkxzHusw07f/9oLWSpqD/pZHOwEt9vLarrgG2XNfdH2yUJ39r1SGQjFgUT
         OwIGoKP9CHO5u/k2VXI5pdp5hd+iZN0odEvMgCb5LO+OhC0d8mJpDiNcEdUNoVlKvKC3
         6XZyG2r4R8FtFR3V62vV0QBINPOueOqpLt+Cpy4dFGXQtQOsgVubJWxYFzC0cgCJzD/z
         5BcBPKplJRoWiQ7rcv0Q9vZa5ES3XcSwpcxcFHQJ+VT44PX+USL6NogjtTh4lZJDt/Kp
         LOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789429204; x=1790034004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUa9GDJb+Q4jhCXihDpgFN+RTSjVzxtIFk+RZAxtdhM=;
        b=FR7+4mgCW/C7IUshxvw75I2JxhnRIlpo620+CxlvKyVPu91BEA/VqNGSbuqFBY92Pt
         gDyPB3pzk4+K4lcBMh0tqcrehTtnBubW6fFU5Jo0uCpQV09MrCDsa/djlkWEPleszpVl
         Dl7ezbfjgckUI2sFTmTHbkKHqahHQZ8k0AztPnk/ppNszlhEUO4MuDE0+9B+gZZhSuZP
         BnabGjNPtkokYEyWA5Qojr4UZoEanTgGJjB9fokQTw/usVnnf4aWmkOOTrfSSWQ9nbXI
         28VMKPCQ+BHx+pr/YBm7cN3/Ij1BrKQQtCl0UUl/IT1Hkm9bGSGZEkE4Iwcdg7vV/Nh7
         LULg==
X-Forwarded-Encrypted: i=1; AKwUvBwuzCz6hQffVCWP00B49pOtSCvzOvGOLDgWowEYwmcaryXR+T0/l6G8xzS5ptV4zPWh9WC+KXOvEzMhQtc=@vger.kernel.org
X-Gm-Message-State: AFuF++k9ug7LSsC0SpogNCdahuO9HQhvxPQyMqt533yq0myXKgfQiBV0
	87HUf0pKb0iVG7hfPg+wQFxScs2QLSVB4iG7TnVg3de6CqpefUEDnK9UClUnsSW5Efs=
X-Gm-Gg: AYBFou2AHQ/R7+PhlBNnYoBOxUpyHIGY3oFqU1u8Cjgcy8ZkHbKOaZP3RVCzcApHgYn
	expV1V4EDXQsmXOwm3wkcQUvD4XZ5oODViETQCHJEliX9Jah550vm059WMSPQiRjsUhSv7/tlze
	+QtQnStzo6b1g4/lEf80N93u65RDBPKAaOhHq+9nxfB//eNmdla/2/39FsnnRt7Cw5MHHvVDQBv
	rN6nBghFmGl8SZ3AnvUO4o6yj5hcQVC1YLr5k5u43GQQOWBsXPeZ1lmLuGxjH2k9GXwPSEp9La4
	wS/xYhk+S2R4agJhcdZmfC9JRfC6D0Qpm6Bg6L3IJ82CjzEeJZazplsDkcPG/Wz+lP4RGiHyVlB
	3DyeSejT5uofi6qN1cDH5r/MBVB5zq0rqEmIs0VBA5nfSMVbucfcX/H17jbIocAQ5acQVM03VhY
	dl03rdQawBGQL9PPuoIpF9Oy/F1SOMMv98KRP/gDes5f+ic3z8+1qvn4FEyunflKOGke9A1b2Q9
	lIOTwIaVb5jkuXlB29AAOoAPJ8ux4L5w6I2IKZJj3+6VW9S4DRDDK7HqLABszUmwajXPwB2jVmT
	jJkqXVRZ+z/JrdtDZBCDhj80r+DXAQ==
X-Received: by 2002:a05:690e:bc6:b0:671:1406:95ec with SMTP id 956f58d0204a3-6714dfd35f3mr1369775d50.11.1789429204257;
        Mon, 14 Sep 2026 16:40:04 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:df87:8743:655b:3824])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125e3fa87sm5207804d50.14.2026.09.14.16.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:40:03 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	hch@lst.de
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	willy@infradead.org,
	brauner@kernel.org,
	djwong@kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v4 1/7] hfs/hfsplus: exchange hardcoded number of extents on named constants
Date: Mon, 14 Sep 2026 16:39:35 -0700
Message-ID: <20260914233941.2966421-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914233941.2966421-1-slava@dubeyko.com>
References: <20260914233941.2966421-1-slava@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the magic 8/3 fork extent-count literals with named
constants (HFS_FORK_EXTENT_COUNT and HFSPLUS_FORK_EXTENT_COUNT).
No functional change.

cc: Christoph Hellwig <hch@lst.de>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 include/linux/hfs_common.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/hfs_common.h b/include/linux/hfs_common.h
index d6a615e74b26..8673933bbee5 100644
--- a/include/linux/hfs_common.h
+++ b/include/linux/hfs_common.h
@@ -171,18 +171,22 @@ enum {
 	HFS_XATTR_NAME,
 };
 
+#define HFS_FORK_EXTENT_COUNT	(3)
+
 struct hfs_extent {
 	__be16 block;
 	__be16 count;
 };
-typedef struct hfs_extent hfs_extent_rec[3];
+typedef struct hfs_extent hfs_extent_rec[HFS_FORK_EXTENT_COUNT];
+
+#define HFSPLUS_FORK_EXTENT_COUNT	(8)
 
 /* A single contiguous area of a file */
 struct hfsplus_extent {
 	__be32 start_block;
 	__be32 block_count;
 } __packed;
-typedef struct hfsplus_extent hfsplus_extent_rec[8];
+typedef struct hfsplus_extent hfsplus_extent_rec[HFSPLUS_FORK_EXTENT_COUNT];
 
 /* Information for a "Fork" in a file */
 struct hfsplus_fork_raw {
-- 
2.43.0

