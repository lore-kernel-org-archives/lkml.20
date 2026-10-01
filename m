Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93222352003
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859385; cv=none; b=tqg6vp/oCc0klAb+xTebYwuM3uj3wuMDh0n5JURDy2PS2le9TGa6EU85rT4rvT0atSLMFvnmIZosuOABBA+6ZsqxoLoHaop2aIU9Z15kmgqDGsPcnKcYZ+HjthSwiVT/NYeVY59fEfGLN+7oycamnXye+KQF9Q9IQhrcM3m7hB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859385; c=relaxed/simple;
	bh=290lKsaMSk2xoy0s89CdnS7C0pRODC++oAp0pTeEf2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKNHdtIKi0SjC9GvgWNgd2yZYE8TS8i1P4Iyp2zthGzhPyzu/B0SMphVw8a8BH6dOxpgytd9XOxZCYpTsA7/L15Tg2WSKxi2+oa0gEMFQFl9nqk/PJcDiOu9JCiBTWUKQ2OL6PvGKWYDpDU7EZe4CZ7nQ13XHFgoc3PE5pgQm7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHfUoSiE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHfUoSiE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso48090495e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790859380; x=1791464180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=le/SmS34eEb92xc6ks5nvsnaayTnVD/KC/RwVcgyuAA=;
        b=tHfUoSiExx8r4Uz7qVuzdHDSupxPK7QJIfbOTxPtrsfrtqmkP9pJyLWAqnlYrXijGu
         ssrghLobJYiyTKKoES7Uqq9gbwr9JauoCbdLrUhHnet18RGEz6RwYyEe7AU9Rx3gA0JU
         lfcufKck5wpNcmPJ0bCThnMuy2/ldCMfBNyRvSNjEeKr8UPhGlf8XSVJWIpsDGFVreSx
         /DloVz+JpIZwfc72b9PBOl++HgO9QXTWr4+Y2C4LBGOpCOP6Iz8yvhOkHWFz0Y8qSZsp
         SSr1I5si3DnIihJcSJGY4WZbFhuztFNafvBYnHRgcFPOxkdLR7sYVeYEYHSG0kKMTPPE
         sM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859380; x=1791464180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=le/SmS34eEb92xc6ks5nvsnaayTnVD/KC/RwVcgyuAA=;
        b=wNwmNXDQQm8F/oiDz1nvuNOz4zfFH9HkmT1Su21OCJJ3Cx4izGkN7Iv8gPEu1ts0BS
         w0UKq929m1FOZc28IXzyMXmu4rk1X+7h7wun7CIhQkst7J1v90/Jx468FY3DwBy3pHhZ
         cKv90UGcuig3pahg+fgNlUqdoF1xNRmk/mVZ1hgfV/ZZakK6Xuf3dK0VvjPLUPopYywX
         RSZFNYE389Ava8iJJN6Y9Jq36+PDhkTKgAzUiV3QtL5FRg8wa+oBJ0qZEOdkEEI0rFJV
         DYshoBAyyWjxH7mJezQWIbspCM9K34/7g5/IkCfxFoFT8XnVDeBUIIvcC/G9nQwwA7EP
         02BQ==
X-Forwarded-Encrypted: i=1; AKwUvBw33qLqjSH/foViRUAJIcZZ4pt81PaYUjEtA0iUHErvY0e5z0+h+R8AB6L4Z3H5ay7OQcDBzK+pFtMCVV4=@vger.kernel.org
X-Gm-Message-State: AFuF++mX8rWFqqnPEZFy4thnQWRubhgzTxlnTOYI9HJ+Zd58easPjlfy
	Mmg7M0htlb7s3YUvBGofNPX0eNnpf46HRcyeINk+yVTrTVH3ugJK5lfa
X-Gm-Gg: AYBFou1kQ7bny4eh3bYoMAkNsf0oc2b1Uo7z7AGqrVwvqj8oWr2NXa5geidiR9ThFkf
	qKBckUXbN9MlujqOur4gZZWEibd1PkzRP05kxKG+75rypBjmK9L9L2PLX0Cio5XDN8vyNv3HOWr
	47QX2JOjJ4UQleA9avScS0C9P4oQ0cu+urMP/wOjygQiDBqtMKwLNGegfTA//JuoLQP+y8eHIPL
	4zaA5uY7S/1q3/Z9HL5TzLVa8HfyIjExpaKo+dA17wY8/d4vGD2W/ZW6QJV8/SzW8di53YjqHsS
	MC2fACtFSqHCehiSywghDmDgLTpB/GBc2CeA0igdzkBiBvfr4L6UlTkori+BEB6Ox/erR4ImQFf
	0CAdKmFDGqsQ1jJ5GYLsyOY7NXpVgRUPWj5pUHaNUjC5MYFR6Mm7ikZaqrlUhq3qpYvv50edu2r
	Dzo+U/VeDyNBSy9HzJJHzVvAiKhdkNyoxg7nR2zdGsQjAb2gNCXk6Y9NxrUmABulKcNQ4jIYTFd
	9oywCb9K3sYRmmCaa1zyjw1jw+4Cq5l4NM0+ZlzC/sDBIU=
X-Received: by 2002:a05:600c:628b:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a01ab4e204mr79582475e9.0.1790859380172;
        Thu, 01 Oct 2026 05:56:20 -0700 (PDT)
Received: from env.. (dynamic-176-003-078-112.176.3.pool.telefonica.de. [176.3.78.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9a7650sm68298735e9.15.2026.10.01.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:56:19 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io,
	chengzhihao1@huawei.com,
	magiclinan@didiglobal.com,
	xiao@kernel.org
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Subject: [RFC PATCH v2 1/4] md: add uapi definitions for the md control device
Date: Thu,  1 Oct 2026 12:56:08 +0000
Message-ID: <20261001125611.943731-2-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001125611.943731-1-abd.masalkhi@gmail.com>
References: <20261001125611.943731-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ioctl commands and structures for /dev/md-control, a misc device
that manages md arrays without opening the md block device. The device
itself is added in the next patch.

Every command except MD_RAID_VERSION takes a struct mdu_ioctl, which
names the array by name, UUID or device number, carries a flags field,
and points to the command's payload. The commands mirror the existing
block device ioctls and use the MD_MAJOR ioctl type, with numbers
starting at 0x40, grouped like the old ones: status at 0x40,
configuration at 0x50 and usage at 0x60.

The payload structures are new versions of the old ones with fixed-size
types and explicit padding, so they have the same layout on 32-bit and
64-bit systems. Fields that overflow in the old structures are 64-bit
now: size, ctime and utime in struct mdu_array_info64.
struct mdu_array_info64 also reports the number of journal disks.

STOP_ARRAY_RO has no separate command: MD_STOP_ARRAY with MD_RO_FLAG
set switches the array to read-only mode instead of stopping it.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 include/uapi/linux/raid/md_u.h | 119 +++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/include/uapi/linux/raid/md_u.h b/include/uapi/linux/raid/md_u.h
index a893010735fb..adc62b5e50ec 100644
--- a/include/uapi/linux/raid/md_u.h
+++ b/include/uapi/linux/raid/md_u.h
@@ -12,6 +12,8 @@
 #ifndef _UAPI_MD_U_H
 #define _UAPI_MD_U_H
 
+#include <linux/types.h>
+
 /*
  * Different major versions are not compatible.
  * Different minor versions are only downward compatible.
@@ -30,6 +32,10 @@
  */
 #define MD_PATCHLEVEL_VERSION           3
 
+#define MD_NAME_LEN                     32
+#define MD_UUID_LEN                     16
+#define MD_CTL_NODE                     "md-control"
+
 /* ioctls */
 
 /* status */
@@ -61,6 +67,29 @@
 #define RESTART_ARRAY_RW	_IO (MD_MAJOR, 0x34)
 #define CLUSTERED_DISK_NACK	_IO (MD_MAJOR, 0x35)
 
+/* ioctl commands for the MD misc control driver */
+/* status */
+#define MD_RAID_VERSION		_IOR(MD_MAJOR, 0x40, struct mdu_version64)
+#define MD_GET_ARRAY_INFO	_IOWR(MD_MAJOR, 0x41, struct mdu_ioctl)
+#define MD_GET_DISK_INFO	_IOWR(MD_MAJOR, 0x42, struct mdu_ioctl)
+#define MD_RAID_AUTORUN		_IOWR(MD_MAJOR, 0x43, struct mdu_ioctl)
+#define MD_GET_BITMAP_FILE	_IOWR(MD_MAJOR, 0x44, struct mdu_ioctl)
+
+/* configuration */
+#define MD_ADD_NEW_DISK		_IOWR(MD_MAJOR, 0x50, struct mdu_ioctl)
+#define MD_HOT_ADD_DISK		_IOWR(MD_MAJOR, 0x51, struct mdu_ioctl)
+#define MD_HOT_REMOVE_DISK	_IOWR(MD_MAJOR, 0x52, struct mdu_ioctl)
+#define MD_SET_ARRAY_INFO	_IOWR(MD_MAJOR, 0x53, struct mdu_ioctl)
+#define MD_SET_DISK_INFO	_IOWR(MD_MAJOR, 0x54, struct mdu_ioctl)
+#define MD_SET_DISK_FAULTY	_IOWR(MD_MAJOR, 0x55, struct mdu_ioctl)
+#define MD_SET_BITMAP_FILE	_IOWR(MD_MAJOR, 0x56, struct mdu_ioctl)
+
+/* usage */
+#define MD_RUN_ARRAY		_IOWR(MD_MAJOR, 0x60, struct mdu_ioctl)
+#define MD_STOP_ARRAY		_IOWR(MD_MAJOR, 0x61, struct mdu_ioctl)
+#define MD_RESTART_ARRAY_RW	_IOWR(MD_MAJOR, 0x62, struct mdu_ioctl)
+#define MD_CLUSTERED_DISK_NACK	_IOWR(MD_MAJOR, 0x63, struct mdu_ioctl)
+
 /* 63 partitions with the alternate major number (mdp) */
 #define MdpMinorShift 6
 
@@ -146,4 +175,94 @@ typedef struct mdu_param_s
 	int			max_fault;	/* unused for now */
 } mdu_param_t;
 
+/* structures for the MD misc control driver */
+struct mdu_version64 {
+	__u32 major;
+	__u32 minor;
+	__u32 patchlevel;
+	__u32 padding;
+};
+
+struct mdu_array_info64 {
+	/*
+	 * Generic constant information
+	 */
+	__u32 major_version;
+	__u32 minor_version;
+	__u32 patch_version;
+	__s32 level;
+
+	__u64 ctime;
+	__s64 size;
+
+	__u32 nr_disks;
+	__u32 raid_disks;
+	__u32 md_minor;
+	__u32 not_persistent;
+
+	/*
+	 * Generic state information
+	 */
+	__u64 utime;		/*  0 Superblock update time		      */
+
+	__u32 state;		/*  1 State bits (clean, ...)		      */
+	__u32 active_disks;	/*  2 Number of currently active disks	      */
+	__u32 working_disks;	/*  3 Number of working disks		      */
+	__u32 failed_disks;	/*  4 Number of failed disks		      */
+	__u32 spare_disks;	/*  5 Number of spare disks		      */
+	__u32 journal_disks;    /*  6 Number of disks used for journaling     */
+
+	/*
+	 * Personality information
+	 */
+	__s32 layout;		/*  0 the array's physical layout	      */
+	__u32 chunk_size;	/*  1 chunk size in bytes		      */
+
+};
+
+struct mdu_disk_info64 {
+	/*
+	 * configuration/status of one particular disk
+	 */
+	__u32 state;
+	__u32 major;
+	__u32 minor;
+	__u32 padding;
+
+	__s32 number;
+	__s32 raid_disk;
+};
+
+struct mdu_bitmap_file64 {
+	char pathname[4096];
+};
+
+struct mdu_param64 {
+	__s32 personality;	/* 1,2,3,4 */
+	__u32 max_fault;	/* unused for now */
+	__u32 chunk_size;	/* in bytes */
+	__u32 padding;
+};
+
+struct mdu_ioctl {
+	char name[MD_NAME_LEN];
+	char uuid[MD_UUID_LEN];
+	__u64 dev;
+	__u32 flags;
+	__u32 padding;
+	union {
+		__u64 array;
+		__u64 disk;
+		__u64 param;
+		__u64 bitmap_file;
+		__u64 arg;
+	};
+};
+
+/*
+ * If set, MD_STOP_ARRAY will switch the array to read-only mode instead
+ * of fully stopping it.
+ */
+#define MD_RO_FLAG              (1u << 0)
+
 #endif /* _UAPI_MD_U_H */
-- 
2.43.0

