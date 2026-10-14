Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3CF55C326
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995077; cv=none; b=LsoQCHidzC9xC/UyPIFJ5t2ZzvdSoJndmsE6Krc6bdBozUOO0ZvwLWhzooB7AXIXac0bx9mc40Vz+rFkoUdla2rsmCK0M2GO6Cz4N1AUmd5r77VsdwzLVuSd0mL7nvfBOzHvPARzetz4qkEBEV/DFRX11CgxuaQDQAwGdbWy1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995077; c=relaxed/simple;
	bh=d/UWuIDLttRptXRjgPCr2gHnKIUlkWJphZ/F4/3NVHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMtlppqKfHCM+zuzhU9cjM/3gsbPM/LCr+/+EOHpb5hfkxcOP992ld79F2uADoJjbKX55kIcxxXm+HnnasREFyGIBtAZxGjiyWJxN7/2TSrlc3LQ/hoho5OI8smyhidCPjfqXDCiV7+FFQdJqOFpJU9J+Dlbjw5tM/MJzwSUjd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=DvWJlsNV; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="DvWJlsNV"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-141395927feso8306228c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791995074; x=1792599874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=parD2IM7xfaD1K9JnqVrI4SVPT6JMErPe2GlYkxbGxg=;
        b=DvWJlsNVVpl9zWhPmKnq7dO6YnFjcWmhsPp2hARYKWyb/LL443BGeZDWXz/pVjxmfI
         xadDrcFs4UHfycTCwabLWwox0ZsA8LLH//kmW7dOOeUghK/CFFnm5wR6u54mz9Uh9lVh
         GsKgH4S/31jvDBGSi4wdBqgme5GmXj1si1CaXegsZTWtUr8vrCrU4dyLHzQ0ISHsGb/Q
         YbryiPk/K7zOYnICaSmB3r/9Z+KCPuJZK/wHVUjDtsP9cgonKpHjuQnXEo2D3HqjXw4L
         RrKMy+6JpYQ+2mx+G5iyZxOYt89bMNys52OkTYUWdkOtp2mWZQjrm4c3XMsayIVcLN5x
         sPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995074; x=1792599874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=parD2IM7xfaD1K9JnqVrI4SVPT6JMErPe2GlYkxbGxg=;
        b=MFaEROGQmHDkHvlVnUPceRuD9yN5z0j/yMOBStdrXwuu5V8JhbO0a1zabJUHt9sg7Q
         A4+msvYsH5Ae6jcOia6khhyXY4LkXLlkv8Ns0GtMabGWcpY5R9VOegvlri7Yf+rzHViW
         EPqkw3XDPIcZ2uqYFUAcoaMzTUYO7J0AlwHh3IVaOfoiZxoxUyHUKZleTxFN5Rgil7a1
         Bgalqv135Cwchd5LMBMximIqZs+YwsnHVpXnaLD415oOcFLJ2naVPFpO3M3gMXQzgE4j
         69h/T2u+xJxPEmsHp/01aVlzCAk6vmFjyvCM6+3nwIv/5B6NbkubKw64TrmmmR0bnmBM
         UU9g==
X-Forwarded-Encrypted: i=1; AKwUvBz7xig+2kPlgsX5YhRmLEOKVKnIGFbi5aCS9FQbEls0eXLC1IZBXYPasxy9xRsabesYjhL04kotR5sqJ2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgvGmlxy6qtiYQKFEWKqNJZnb0HyNcc4ARgvbX7M+uEiFRJr1S
	0td2vDc3sP2B/danxzILxMTxxjxvWjay+MiLUItt9ABjN15+7XLspBkUkDdKutDaWRU=
X-Gm-Gg: AYBFou0cb5QRwidtfrbkB9w22vI1hbkAH8GffWsGXYcpN6QQf3lGHjzFT0c00Pg1Xut
	XfMXXGTBPn9MZKr8uFZjLZKKaRNI9A7MFjrA+n99TekZWwzQ2UJJ+fq4dASXL4tyODi/bOgIXqI
	zhlNsKVT5XblbxNmhiruVNqjIjOy9PKiaxr7W6rheLT05e6UFVnl56AlKrGNKdc2QbxODFoqyvf
	XdzjnbwU0tqFq+TOx+/k+pZw9+SbLF8zc40jwxB/gY9C+jn/U2YVKGJkK0pUpLJneTlM2Y0VFEq
	2pbsej2aAXy94lEqsKNB4v6/KzNV5zaPlEc5kUyUNMQndbm8LYZCF8BQvS5AOE/MfrVQi+ulH/v
	9255ObELMOGJu1h7okuVJp6YgiYz/otY2GP5fneBLurEnFMUnNd+rPJP92CqAZHI0Lu8itF9fo+
	IlM1Q1Fz+pOn3AgtMgvWwfXPTtybPAxL6FLUe9z15kBTY0gqAQ9imVXUDJFFmzkE81mWGplb7D/
	mHacst44VpSnCIw1w5iYg==
X-Received: by 2002:a05:7022:b058:20b0:166:37d2:3b72 with SMTP id a92af1059eb24-16a5fc9170cmr22906326c88.27.1791995074093;
        Wed, 14 Oct 2026 09:24:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1dd57d0sm48816685c88.8.2026.10.14.09.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:24:33 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v6 3/5] scsi: mvumi: bound the hotplug event bitmap
Date: Thu, 15 Oct 2026 01:24:11 +0900
Message-ID: <20261014162413.3649841-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
References: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_proc_msg() takes size from the hotplug event the firmware DMAs into
the event buffer and uses it twice: as the bit count for two
find_next_zero_bit() scans, and as the byte offset of the second bitmap.
Nothing checks it against the buffer, which mvumi_get_event() allocates at
a fixed 512 bytes, and size is a u16, so a firmware reporting 65535 makes
both scans run roughly 8 KiB past the allocation and places the second
bitmap past it to begin with.

Reject a size whose bitmaps do not fit.  The second bitmap starts size bits
in and find_next_zero_bit() reads a long at a time, so that span is the
furthest either scan reaches.  Compare it against sizeof(struct
mvumi_event_req), the only length the driver ever puts in
data_transfer_length and therefore the most the firmware may write into the
shared buffer, rather than against the buffer itself: dma_alloc_coherent()
hands back zeroed memory, a zero bit in these bitmaps means a device is
present, so scanning past what the firmware wrote would add devices that do
not exist.  Read size once, since it lives in memory the firmware can still
write, and give the buffer size a name while here.

Fixes: bd756ddea18e ("[SCSI] mvumi: Add support for Marvell SAS/SATA RAID-on-Chip(ROC) 88RC9580")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 18 ++++++++++++++++--
 drivers/scsi/mvumi.h |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 2378b676a7a78..9a3dde53dea97 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1652,11 +1652,25 @@ static int mvumi_rescan_bus(void *data)
 static void mvumi_proc_msg(struct mvumi_hba *mhba,
 					struct mvumi_hotplug_event *param)
 {
-	u16 size = param->size;
+	u16 size = READ_ONCE(param->size);
 	const unsigned long *ar_bitmap;
 	const unsigned long *re_bitmap;
 	int index;
 
+	/*
+	 * The second bitmap starts size bits into the event buffer and
+	 * find_next_zero_bit() reads it a long at a time, so that is the
+	 * furthest the two scans reach.  Bound it by the length the firmware
+	 * was told it may write, not by the buffer: the bytes past that are
+	 * still zero, and a zero bit here means a device is present.
+	 */
+	if (sizeof(*param) + (size >> 3) + BITS_TO_LONGS(size) * sizeof(long) >
+			sizeof(struct mvumi_event_req)) {
+		dev_err(&mhba->pdev->dev,
+			"invalid hotplug event bitmap size %u\n", size);
+		return;
+	}
+
 	if (mhba->fw_flag & MVUMI_FW_ATTACH) {
 		index = -1;
 		ar_bitmap = (const unsigned long *) param->bitmap;
@@ -1708,7 +1722,7 @@ static int mvumi_get_event(struct mvumi_hba *mhba, unsigned char msg)
 	struct mvumi_cmd *cmd;
 	struct mvumi_msg_frame *frame;
 
-	cmd = mvumi_create_internal_cmd(mhba, 512);
+	cmd = mvumi_create_internal_cmd(mhba, MVUMI_EVENT_BUF_SIZE);
 	if (!cmd)
 		return -1;
 	cmd->scmd = NULL;
diff --git a/drivers/scsi/mvumi.h b/drivers/scsi/mvumi.h
index 1306a4abf19ad..5d45f0d99e639 100644
--- a/drivers/scsi/mvumi.h
+++ b/drivers/scsi/mvumi.h
@@ -124,6 +124,9 @@ enum {
 #define APICDB1_HOST_GETEVENT		1
 #define MAX_EVENTS_RETURNED		6
 
+/* size of the buffer the driver hands the firmware for event replies */
+#define MVUMI_EVENT_BUF_SIZE		512
+
 #define DEVICE_OFFLINE	0
 #define DEVICE_ONLINE	1
 
-- 
2.43.0

