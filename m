Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7EF1A9B46
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581514; cv=none; b=Dg+we4bY9X4rfAnznXiZyr+eFgXHwLKJIYh/RLMTBQa4k4znMnh4OcuscitYI4MtUhHgUt2IvBqgq3jSbLep/MVEKpO3gfDKurwLo6ucgT8gRm5XeU+1wxoR9gPKhaUOs2eOJwy+zFL06/WuT0qFiyktDQaPv9IXfUtijSCt9Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581514; c=relaxed/simple;
	bh=IF6xi800bQg70p/YOaEzX7lIbgZssVLNkfMtxS1VX2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxO12Ex1RiiuTqnr8FSV75Kvzip0E451yl4g1KhOuo8Z9XuTuP7jRogHBDOjg9X+H7ED2uxlz/HqHaruSIxl2Af6NZTKmBzz8fHd0HkTbloj8h1k6qCWevxuJUbabjS7GYi1hqD3uPMmyxd7c/pRwY51HewwrggfiBscIcbL090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=sqlySgyM; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="sqlySgyM"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6740e7ae219so114408d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1791581512; x=1792186312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fonBvjZO/D/GM9L+MsZkX1d2b3mKIY2/WZMtCJsJfEU=;
        b=sqlySgyMcy2MXgoeRZIZeJi+TKtp0IvBohr47W1UbKFK1m/+d3a8+W8U+WkVW5mR1D
         ZXSjNh2XjpjvNqHmmUudAXeTEXV+L9rt7TPuAXjCgtjHtWt61OZem3l+hSjOuW6phUHY
         IgKqz+BprwHOJPMfXjK/WzChB2G9oN+Ujbrn6dj8dRa5Rt3e/DdauzM47dheKQDWknb6
         Z0DGomy1BMeJl6jISV0+/TidRJAIV2EmgCaSMAeBJBh0R4yB0c08p1E5HkIBq0ohuJKU
         sTcvW0eUFaWgLc9X5zPQIedFXb8ZPXFtqVevw9bt7yjfBmbwlNFi1wbRCR2aFz2ruIe1
         MTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581512; x=1792186312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fonBvjZO/D/GM9L+MsZkX1d2b3mKIY2/WZMtCJsJfEU=;
        b=Cjc/jHUlPVaVTBIHoRS+EqO5OI2lUD4p09LypXd+3HcS7c1nFDJTA9SvxV5wBbsqBu
         odIbwD+9HAFCKh6iDX/br+d8uJnEVF7GrJ0hBIz3DeMdQdPV0BLc337KxlcGX8pnLDx3
         Y34qSPQtu3TN30N65AgP+g2rsQlQzfoef03Scs7RCCz034jk8BNj0+g2U1taAxdv6bf8
         9y9iorPoD11FZfi/RXHOcv7mG2HVjseyy7FK3MmlFqfxktkPSPy0o1N5akCCHgrHH/p9
         gDIsRHoCBSjTmcKZjbRaYbDJw2iOHEBRUzhfgkjzgzB0zaZ+p+uCcnu+psQBHrdHwVfu
         3DXA==
X-Forwarded-Encrypted: i=1; AKwUvBwhLXoNWke3jlwfnbRoifLl00R8k5F7pC0uxWxeLKdZ6XtLvYAn68EULyOLFFeRtWLklRSCkaRw8NaWJc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGs9nJNn2TSZE1kispXbK6q4QYrq/5PNK0+X9GM5cmthrTi7ba
	V7gyNQmIT9i/9inuAtxfpM7SbGJUTjmYqa3ZwBUrw7M33uTmBxZKIZ3jj4gm9OdH7ZV/f3rONhG
	XL8OdnB0=
X-Gm-Gg: AYBFou1QJNLbvQ8BJUruj0H42qx7Vm86uCgmAuMUQUZCkYsGVHbYsWyFBnjkZatYedX
	0MhWQ9u9wRSZ5vw/0PN7EJ9QhSXeMAzslyNK/7F/MultdorbjqAVNQCom95l2eIUScIhyiM/end
	FGvm7a7xgKHvc/0yzezwH3Y1yql0lJBFNoe/q6/Kb16QcF/ZOSoTyhcFbshzbGqY88uK+YK46sj
	aHnErxPakSyMEX9BbXLX33yCzrf6yRdjVtxZK6DdhgebSaNE6RDfxtCK1KM+PSzHPdpNyd/3uur
	dLr2oJK203fcyzBMqD5HUb3B5QkHxC4u1bJt4lQCmV/ZehDyJtxBtrjoduFLBqTw6TKrbFaisNs
	HvZxSP6zPscdESA2CirklIPdiTe7OWtBT/cUIXLzn73OrvSapx4Fd5JN1COuxLme2TwpumCvF0/
	WuCVtEA/cGC6gy47aBRoO/4IBGvM1qlkGgrnRHC1kQzzM6yZXd1oRRclZvZ/MN5BvQIdb1r5jWt
	DPVCbKbdOIEbLONacxc0QVXGWjQMSof8g0xNq1DGikU9J8Sl80rmIBfz6IM1RddJ8xpTnbmu8Wd
	SCoMDstTAJp1u8m3iw==
X-Received: by 2002:a05:690e:144e:b0:677:bb4d:9419 with SMTP id 956f58d0204a3-679362b7b87mr1015362d50.130.1791581511726;
        Fri, 09 Oct 2026 14:31:51 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430::48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1b7483sm12296467b3.11.2026.10.09.14.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:31:48 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v2 1/3] hfsplus: fix timestamp wrapped issue
Date: Fri,  9 Oct 2026 14:31:30 -0700
Message-ID: <20261009213132.997851-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009213132.997851-1-slava@dubeyko.com>
References: <20261009213132.997851-1-slava@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xfstests' test-case generic/258 fails to execute
correctly:

FSTYP -- hfsplus
PLATFORM -- Linux/x86_64 hfsplus-testing-0001 6.15.0-rc4+ #8 SMP PREEMPT_DYNAMIC Thu May 1 16:43:22 PDT 2025
MKFS_OPTIONS -- /dev/loop51
MOUNT_OPTIONS -- /dev/loop51 /mnt/scratch

generic/258 [failed, exit status 1]- output mismatch (see xfstests-dev/results//generic/258.out.bad)

The main reason of the issue is the logic:

cpu_to_be32(lower_32_bits(ut) + HFSPLUS_UTC_OFFSET)

At first, we take the lower 32 bits of the value and, then,
we add the time offset. However, if we have negative value
(timestamp before January 1, 1970), then we make completely
wrong calculation. The reverse conversion has the same issue
because it treats any on-disk timestamp under HFSPLUS_UTC_OFFSET
(January 1, 1970) as a time between 2040 and 2106.

This patch corrects the logic of __hfsp_mt2ut() and
__hfsp_ut2mt(). Now, the on-disk timestamp is interpreted
as unsigned number of seconds since January 1, 1904. As a result,
the supported time range is from January 1, 1904 till
February 6, 2040.

The HFS_UTC_OFFSET constant has been moved into
include/linux/hfs_common.h and HFSPLUS_UTC_OFFSET has been
removed. The HFS_MIN_TIMESTAMP_SECS and HFS_MAX_TIMESTAMP_SECS
constants have been introduced in include/linux/hfs_common.h.
The hfsplus_fill_super() logic defines sb->s_time_min,
sb->s_time_max, and sb->s_time_gran. It means that VFS clamps
the timestamps that are out of the supported range.

[1] https://github.com/hfs-linux-kernel/hfs-linux-kernel/issues/133

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfs/hfs_fs.h            | 13 -------------
 fs/hfsplus/hfsplus_fs.h    | 17 +++++------------
 fs/hfsplus/super.c         |  4 ++++
 include/linux/hfs_common.h | 13 +++++++++++++
 4 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/fs/hfs/hfs_fs.h b/fs/hfs/hfs_fs.h
index e250f87a5e33..659b0ba733d4 100644
--- a/fs/hfs/hfs_fs.h
+++ b/fs/hfs/hfs_fs.h
@@ -255,19 +255,6 @@ extern int hfs_mac2asc(struct super_block *sb,
 /* super.c */
 extern void hfs_mark_mdb_dirty(struct super_block *sb);
 
-/*
- * There are two time systems.  Both are based on seconds since
- * a particular time/date.
- *	Unix:	signed little-endian since 00:00 GMT, Jan. 1, 1970
- *	mac:	unsigned big-endian since 00:00 GMT, Jan. 1, 1904
- *
- * HFS implementations are highly inconsistent, this one matches the
- * traditional behavior of 64-bit Linux, giving the most useful
- * time range between 1970 and 2106, by treating any on-disk timestamp
- * under HFS_UTC_OFFSET (Jan 1 1970) as a time between 2040 and 2106.
- */
-#define HFS_UTC_OFFSET 2082844800U
-
 static inline time64_t __hfs_m_to_utime(__be32 mt)
 {
 	time64_t ut = (u32)(be32_to_cpu(mt) - HFS_UTC_OFFSET);
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index 916e6552e3f0..cd51afa22ece 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -525,26 +525,19 @@ bool is_hfs_thread_record_type(u16 type)
 
 int hfsplus_brec_read_cat(struct hfs_find_data *fd, hfsplus_cat_entry *entry);
 
-/*
- * time helpers: convert between 1904-base and 1970-base timestamps
- *
- * HFS+ implementations are highly inconsistent, this one matches the
- * traditional behavior of 64-bit Linux, giving the most useful
- * time range between 1970 and 2106, by treating any on-disk timestamp
- * under HFSPLUS_UTC_OFFSET (Jan 1 1970) as a time between 2040 and 2106.
- */
-#define HFSPLUS_UTC_OFFSET 2082844800U
-
 static inline time64_t __hfsp_mt2ut(__be32 mt)
 {
-	time64_t ut = (u32)(be32_to_cpu(mt) - HFSPLUS_UTC_OFFSET);
+	time64_t ut = (time64_t)be32_to_cpu(mt) - HFS_UTC_OFFSET;
 
 	return ut;
 }
 
 static inline __be32 __hfsp_ut2mt(time64_t ut)
 {
-	return cpu_to_be32(lower_32_bits(ut) + HFSPLUS_UTC_OFFSET);
+	ut += HFS_UTC_OFFSET;
+
+	return cpu_to_be32(lower_32_bits(ut));
+
 }
 
 static inline enum hfsplus_btree_mutex_classes
diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index ff7d6b3336a6..657dfa40bdf3 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -511,6 +511,10 @@ static int hfsplus_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (!sbi->rsrc_clump_blocks)
 		sbi->rsrc_clump_blocks = 1;
 
+	sb->s_time_gran = NSEC_PER_SEC;
+	sb->s_time_min = HFS_MIN_TIMESTAMP_SECS;
+	sb->s_time_max = HFS_MAX_TIMESTAMP_SECS;
+
 	err = -EFBIG;
 	last_fs_block = sbi->total_blocks - 1;
 	last_fs_page = (last_fs_block << sbi->alloc_blksz_shift) >>
diff --git a/include/linux/hfs_common.h b/include/linux/hfs_common.h
index d6a615e74b26..d4e91dea2362 100644
--- a/include/linux/hfs_common.h
+++ b/include/linux/hfs_common.h
@@ -667,4 +667,17 @@ typedef union {
 	struct hfsplus_attr_key attr;
 } __packed hfsplus_btree_key;
 
+/*
+ * There are two time systems.  Both are based on seconds since
+ * a particular time/date.
+ *	Unix:	signed little-endian since 00:00 GMT, Jan. 1, 1970
+ *	mac:	unsigned big-endian since 00:00 GMT, Jan. 1, 1904
+ */
+#define HFS_UTC_OFFSET 2082844800U
+
+/* January 1, 1904, 00:00:00 UTC */
+#define HFS_MIN_TIMESTAMP_SECS		-2082844800LL
+/* February 6, 2040, 06:28:15 UTC */
+#define HFS_MAX_TIMESTAMP_SECS		2212122495LL
+
 #endif /* _HFS_COMMON_H_ */
-- 
2.43.0

