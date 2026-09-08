Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812633C3C1C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901503; cv=none; b=qImX7Pb0135cj7sa1Ag1AeQ8CJQnJrQ07Wq+Y0BAqhJPoPcUaXyvrj89T934en8ssbzWZ7fl54fDw18KQhi2YY0u2OuRQKP8dlQelPwIwYq9dlix77vrjlEm/bY3txwwJNUe72fkgx9auZsmn21fz7IICqL4K4pDDvMTNciavng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901503; c=relaxed/simple;
	bh=OVJzpWfHSM6a6wCkK3C71K/fLknshrLRt2xkWr7HMRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pji75NKwEZEJfijw9O9hsRPPIU0QXEezpiVf58uSoa/2zPG4vtgKzBnq6mY1F6u01zUDGaZLzQKUFvLFCK+a3tZRH7dJvx4VKZ8+2BzLGIlkeX3bNqVmOWSzxHnp+Ge1Fe5coNWAx4cIZeWGFDI2pU44Bncw9EqEpMehyoHMP28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=U8+CWeSh; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="U8+CWeSh"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c7127a73dso5602845d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1788901500; x=1789506300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUa9GDJb+Q4jhCXihDpgFN+RTSjVzxtIFk+RZAxtdhM=;
        b=U8+CWeShrP14rgd44xgUXmUiojOa1fT3Mhh3nlczkGv1oipwxynmAEQEqNxrMtp4m1
         LHp+zbkug6yh1QwpdXbI3+jBIehKxHKKtLaLh+MTKxaQ50cfrDLUfCPUFzxOjho4dnSU
         8F08P7LDTRpP5d0leXwrRILcSSYwztvT/eNCMQgbU0NVwLU900vW0bfAjtKjYn7Zob4u
         egwRy9ZeTOHMkyQRgf8eK2dsIPC668Q6Gicavzx6dBznLxqyJ891EuKeaqpEcWTb0Sue
         TbfzF+PIxtytl6Sd72GiyQrX9yplM/Iwo7iY/RyTNrgvrVIVjNbLytph4ZfzltSTe1un
         jpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901500; x=1789506300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUa9GDJb+Q4jhCXihDpgFN+RTSjVzxtIFk+RZAxtdhM=;
        b=DCFbGZUQ4H38HRqXHpb1cPGGxW+j9ngG9f3VFci+A8TI3qEezFFCs0q8ROKXKLvm4Y
         HXJXEO//2fyXEW2oLNOoZ+D8ARtSvxye/gjmn0uoRvwFpTp/1Lnd1cSRwzU+CiqX7+vk
         /oDPO2yoUcyV4ovHc7bwUcrftRC0raX+t5qMi67vxF/nKIV22JVOeeUfLQ8tVWmShG/S
         SI+o/w/+kYydZR3LmDCFO9+COvnmLwdWQmOVDzuTK8qh7G0Ut9puwc3kdnPIQz4zJ9V+
         +VNvvzPHeqUSWek0sEHcQgTHgRt5aC9LtZT62rAX1/3/C0T09GIHxTR/osFTJd92W9p3
         QeZw==
X-Forwarded-Encrypted: i=1; AKwUvBzdpBQU9ts393jWsI87it2sei/rPt0bpzvq4fk3PamiQiInVwk3SYs4C22IxurD0gYvH0mkqElrn3mw67s=@vger.kernel.org
X-Gm-Message-State: AFuF++krfG5vhuqKLjXwwbPZ+TRIX/APjeyb96EXPY0SPjBhmlEbsPwe
	ZeqWNPOHwgMNjBNN+sCLtagRfkwmOfKp0C1tZrmpEMydDjqP1nXGNgUUEfJesSZiXemIAff1NVI
	T8PiZRnAIAg==
X-Gm-Gg: AYBFou0dEDr54t0iSALHwBa1azssYMVj0o51AHjyeEf+9BkPEZe6O/T8vimLOGWwkxa
	461hbdZFHtuu3MoMtceNV8YAftnAWjtSo0FKfdgMVi6/YazRPgQLxcTS9TYSnaBPeo/s6DxJHtW
	Y6IvVqgPXGtfNNtGsRf1cHzVQNy/22rCSi0QpFHCRO2KnJTGqrUYZuCNSt3U4e/+DpFC69//fmK
	lAI88g6yKJMmik/CUX9lm5+tElB9dG9JPH0EzCyhuSVm9AWUallzGp8O2R9EzToEFFfmLwEdVku
	rUREtI7t0+HByzz5fj7zOJ9Jv6AhuYU7NgoWoe4tIL7zGTBN5genWT1bHlGLlVJL3LJZ0e4tyxe
	H874m39NB7y6lX4ChjYOEPNvRskVwj1zOVR+brRxduU6a/hgJiAFrS8ro8RYRCk9yDiwg0T/3Og
	sZI5HbjKUnFHWFI5agFbdhkjfzZ64/czDV5nT7gUB8Or4554RXsWC7tusXpli13DPdUwBM0UIOE
	Ka0F5ckgYdgxTD2EXNnq7dtPy7f2B6pZLAI6LlfRihuN7oYa/ly8UQkpdgZ4C6io/0eoWvmF2XE
	dgTDq1s3yaNgyU3+
X-Received: by 2002:a05:690e:2599:b0:66f:c1be:84c9 with SMTP id 956f58d0204a3-66fc1be8d51mr6688418d50.55.1788901500408;
        Tue, 08 Sep 2026 14:05:00 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:1eca:212:86d0:4e87])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb495eccesm11078129d50.18.2026.09.08.14.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:04:59 -0700 (PDT)
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
Subject: [PATCH v3 1/7] hfs/hfsplus: exchange hardcoded number of extents on named constants
Date: Tue,  8 Sep 2026 14:04:42 -0700
Message-ID: <20260908210448.296772-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908210448.296772-1-slava@dubeyko.com>
References: <20260908210448.296772-1-slava@dubeyko.com>
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

