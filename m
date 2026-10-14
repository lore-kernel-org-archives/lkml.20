Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9920DD51
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791938567; cv=none; b=CVJ696iwOy7EJXrStf3fvubeaUfbuqoweIlqW1e/COHWABvDWTvFZX8VE9L5WCJp+P7maZii0pbZKORB1ZtZYl3UmmzmjWi3pBsiLnjbVfHXTxh/Ox8KKDP7GZf+3xPtcl4RowRVQ++FMrSnEc54DF5tBw1mUJ/ipCiLDz7ub8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791938567; c=relaxed/simple;
	bh=7HcUK1CTNpahJarcDRW/PNLN4S+XdFX5l+dOxrBeiwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clhQW2pqXvZmPZ7HlrsAAOljUW0PhVHhdR3g9ZB/a0vAQu3N1stDiVhQEd10sfnQBNOK/jm4MBbzyYVbaxejc+Cr1Bp1FOvYK0pKI2NFHycFF8s57v569leMUQatBy9JKtciQvkvgfkQcXKkZjA41LHaJ+YpPe9tT4KW94FsxqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=B/a1jyGC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="B/a1jyGC"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso186246a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791938564; x=1792543364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LySGsEgkXXlREpE9ITg3+XAbVmPqYYJKWOIEOpJmtB0=;
        b=B/a1jyGC4kVqHhRUO62V4xQnJGh7D370CWqXbo26VH8KINX0odsXelgLHAWTvg1w0T
         7p/Uj8QVg5/OWyySWbNzqhXZVhFlXQ6BlnGyPPtqn+MQDDbO3enLWtw+l+FxGLkW9gZD
         b3TxHsY0PA8M7qal8Gsn7Sc9ckaVeL8CMvsa4sQrmBvJMWBTsGJL8Qgaqlbdq5tf1LSA
         40+YHdeMxpf0azPX67qLMUKtIHjLUt97vJ2CMIaqi7SbeCzlXIa1RR+9062Duobtvy9f
         KstNdc0AzWj+qMr2tyOlE9OVACYplyEnRL2YTJ36TrubogogBFEY5F1nfivOEwqXj7Yq
         f3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791938564; x=1792543364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LySGsEgkXXlREpE9ITg3+XAbVmPqYYJKWOIEOpJmtB0=;
        b=Qo46zTUPAWwRdO6tKN895w/pCLNdJIQXwYLOL3ghasXHK5JKiZBK+VEy6Bk8zc6p+l
         fDxJgX9PDzbWFg0hi+hQdE4XCRVgqPGw22PjRbNjVnbpH8PAlIvq0iEs9gitt3eYaN/9
         5wmTpabCpGDhuzTEe+UxBBCjtBXcBTVPs2ZBeMMngqYj0B8Gus7P+t047d3PgDK1vTHq
         DwB+19DXJA32TOOg6FllQFkV5p/CFptAl2d0+e9ehzlr6C7ps5NKC7c0+eT5Q1YPu6aU
         tqFJDR4GTJQdHcD5M/avOMgo9OIPKdDt2OpcVPUZ1bWJhPL1F/O0q2r+1YKFTtQF6Ujb
         n91Q==
X-Forwarded-Encrypted: i=1; AKwUvByiOoV69mATj9eqLk70Li9yXOdRaZbwqjd2aqJ5NtA3kZVo3djEFXpa/EtZ3a90NqZ1kIymuwcWdnC3GNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv794S15gAeWROE/Xa9xz7fzRK5NzzpLO5PQCL5Wlc7zngV017
	v+GT2LYmlIexVo6W8QUdM+2mlESvZ0PgAdlHnd2sYR10rQbENZ/SEuRzys7OE2UOaoI=
X-Gm-Gg: AYBFou0ZBP+SW0ZmOh2MDlgl+0LbKTPf0/ZNwQ4Wr4rdfnB76hlkT8nOkOPdgynYL45
	SvTWpr/Z3jVlwtlTzo/4mQYB0ljNlGhj14rcaHRqNEDxLn6xKhwoe5oBAkv1WR+PN80O04judiA
	ON1LtX4JQZAUtSYQeMRgfu7jjJECfw+KhNAOpPDOyRrNCCjfvgGGKxLf5gW8nL5hMqB/IzJ8PUY
	Kc/mdLnPzhXw9RvIWX0oH9YNjRphZy9AuCjyWzohx/8Ut7hFrjwtI0l2+X0gAGddnwV0DC/0Qi2
	qyMKk5urdUe0CJe3IS5HFfVgnMXKts7KW65nz8c+J1EbeSysXVpev7hM5vB6UugTY8GoQmEDsW4
	PIGnJ/NnS7NmPnlJHOAnmwOT3MO+QX4fXsj8taQOdvE4tsrzoQ/4dy7kAmbGMOSIAl3Swnp6H1z
	iuQvbSdRmRGETKJ7UbswIJBaoGSO9P58FDPxcxTh2dWM2BQBv1sM3GVMZmWKlmtIG1sKZFL/e6N
	Dcuoby6HknAOcBdxLZQdA==
X-Received: by 2002:a17:90b:28ce:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3ab3a79df67mr12125184a91.29.1791938563588;
        Tue, 13 Oct 2026 17:42:43 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac7321cc5bsm432716a91.14.2026.10.13.17.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 17:42:43 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Wed, 14 Oct 2026 09:42:25 +0900
Message-ID: <20261014004226.3469868-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_hs_process_page() takes max_io, the two command entry sizes and the
list depth from the firmware handshake page.  The entry sizes are u8 fields
used as shift counts, and 1 is an int, so a count of 29 or more makes the
<< 2 applied to the shift overflow an int; a count of 32 or more is
undefined outright.  max_io is a u16, and the sizes derived from the shifts
are multiplied by it in mvumi_init_data() to size three unsigned int
allocations, so a large entry size wraps the product and the loops that
follow then walk and write past the short allocation.  The list depth is
used as a shift count too, but only when the firmware sets
HS_CAPABILITY_NEW_PAGE_IO_DEPTH_DEF; a count of 32 or more is undefined
there as well.

Reject an entry size above 29, which keeps 1U << n and the shift that
follows it inside an unsigned int.  Then compute the worst-case allocation
size in size_t at the top of mvumi_init_data() and reject it if it does not
fit an unsigned int.  That total bounds all three allocations: the inbound
list total, the outbound data pool and the tag arrays, whose sizes are the
same products plus smaller terms.  Reject a list depth of 32 or more on the
shifted path only, so that the plain assignment a few lines above, which
takes the depth as a count rather than an exponent, keeps accepting every
value a u8 can hold.  The shifts also use 1U now so that a legal count
cannot overflow an int.

No realistic controller is rejected: a controller reporting 4096 commands
with 64 KiB entries and a depth of 12 needs 513 MiB and passes unchanged.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index e70d336b4ab39..b86d954f3576b 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -912,10 +912,23 @@ static int mvumi_init_data(struct mvumi_hba *mhba)
 	unsigned int tmp_size, offset, i;
 	void *virmem, *v;
 	dma_addr_t p;
+	size_t total;
 
 	if (mhba->fw_flag & MVUMI_FW_ALLOC)
 		return 0;
 
+	/* These are firmware-supplied and size the allocations below. */
+	total = (size_t)mhba->ib_max_size * mhba->max_io +
+		(size_t)mhba->ob_max_size * mhba->max_io +
+		sizeof(struct mvumi_dyn_list_entry) * (size_t)mhba->max_io +
+		160;
+	if (total > UINT_MAX) {
+		dev_err(&mhba->pdev->dev,
+			"handshake sizes too large: io %u, in %u, out %u\n",
+			mhba->max_io, mhba->ib_max_size, mhba->ob_max_size);
+		return -1;
+	}
+
 	tmp_size = mhba->ib_max_size * mhba->max_io;
 	if (mhba->hba_capability & HS_CAPABILITY_SUPPORT_DYN_SRC)
 		tmp_size += sizeof(struct mvumi_dyn_list_entry) * mhba->max_io;
@@ -1051,16 +1064,24 @@ static int mvumi_hs_process_page(struct mvumi_hba *mhba,
 	case HS_PAGE_FIRM_CAP:
 		hs_page1 = (struct mvumi_hs_page1 *) hs_header;
 
+		/* Firmware-supplied shift counts: (1U << n) << 2 must fit. */
+		if (hs_page1->cl_in_max_entry_size > 29 ||
+		    hs_page1->cl_out_max_entry_size > 29) {
+			dev_err(&mhba->pdev->dev,
+				"invalid handshake entry size\n");
+			return -1;
+		}
+
 		mhba->max_io = hs_page1->max_io_support;
 		mhba->list_num_io = hs_page1->cl_inout_list_depth;
 		mhba->max_transfer_size = hs_page1->max_transfer_size;
 		mhba->max_target_id = hs_page1->max_devices_support;
 		mhba->hba_capability = hs_page1->capability;
 		mhba->ib_max_size_setting = hs_page1->cl_in_max_entry_size;
-		mhba->ib_max_size = (1 << hs_page1->cl_in_max_entry_size) << 2;
+		mhba->ib_max_size = (1U << hs_page1->cl_in_max_entry_size) << 2;
 
 		mhba->ob_max_size_setting = hs_page1->cl_out_max_entry_size;
-		mhba->ob_max_size = (1 << hs_page1->cl_out_max_entry_size) << 2;
+		mhba->ob_max_size = (1U << hs_page1->cl_out_max_entry_size) << 2;
 
 		dev_dbg(&mhba->pdev->dev, "FW version:%d\n",
 						hs_page1->fw_ver.ver_build);
@@ -1069,8 +1090,14 @@ static int mvumi_hs_process_page(struct mvumi_hba *mhba,
 			mhba->eot_flag = 22;
 		else
 			mhba->eot_flag = 27;
-		if (mhba->hba_capability & HS_CAPABILITY_NEW_PAGE_IO_DEPTH_DEF)
-			mhba->list_num_io = 1 << hs_page1->cl_inout_list_depth;
+		if (mhba->hba_capability & HS_CAPABILITY_NEW_PAGE_IO_DEPTH_DEF) {
+			if (hs_page1->cl_inout_list_depth >= 32) {
+				dev_err(&mhba->pdev->dev,
+					"invalid handshake list depth\n");
+				return -1;
+			}
+			mhba->list_num_io = 1U << hs_page1->cl_inout_list_depth;
+		}
 		break;
 	default:
 		dev_err(&mhba->pdev->dev, "handshake: page code error\n");

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

