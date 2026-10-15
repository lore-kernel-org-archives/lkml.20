Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FC33DA7E4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031270; cv=none; b=pugMSlse0vNuGaGflAKLxaYzM1NSOEOB+MYnIOn0Tbv4RFmD93etPhJFqoOAJy5yzMSMF3B6QNYirMVMEL9o/cA7ApJyy10X1DNxo0RTKx7KkXCt0IiABQp/tLF74N99gkQrmnXPxzZj4ItOFKqPTGQeH8ww27rL43DYa77B2Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031270; c=relaxed/simple;
	bh=d/UWuIDLttRptXRjgPCr2gHnKIUlkWJphZ/F4/3NVHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXg2xmHXPF/RWf59J2A/IHo0nP2zK0qzZAU2IOKRstPjx6rugkSPorqBmD7RGS3v0H/ZNl+URGD/psRX2fJ0ffVuVL8Oy4q8JvQriiCazrzPQOV64tfFMu5gCLH/TOZFjjYkIJ9PDjU7a84vquIjeMqZWlWU5eOBENZt0HRtbN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=WTOgaCM0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="WTOgaCM0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so2698350a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792031269; x=1792636069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=parD2IM7xfaD1K9JnqVrI4SVPT6JMErPe2GlYkxbGxg=;
        b=WTOgaCM0KXikHo8bMsZcVbnNRMP+dv/pzuxJWU2g2f4/oq+3rH6RCkTU35P0Xc6F7T
         MgRemDkf4TepZwy3GlJLiUVLQ8m+PRV/GD+ADfVoHvzWgQH3UnkTQNEXr1LJ+6/b78uw
         VzyoPHAsG8JvvsImU+FS99KJ1urBfG6vfux6ejbMHD8ZVbxpJl1Lze7Oaqz4+/FH9o6f
         Y/IeHrdQdF1UbBXJYhz+jXv+1ERMXj5m8uJSEH1kfbDOOK7Hx7jBr+T2FEnrpUFfICga
         PZn5OZC/b2kBz5n/ilXzA/8rMfZS5M9ZeXauFBES2exfPMbC5P4JdrBf/6h69pdXq+6Q
         Sfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031269; x=1792636069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=parD2IM7xfaD1K9JnqVrI4SVPT6JMErPe2GlYkxbGxg=;
        b=PvUzyxQhWPLBCJmqspT4Kd32uQYCm+TbYxV9PccYqifWqlGeJIQJCGGE1HwnUjweeZ
         jNsimef8U4m4Nhb3zRABbKL5WSnojZu1ylSr5dKiqWLmN9DPbJjoyapUDidON3jn7VaA
         tvoth3gxHRfkhURBlhusbdAu+Qk18gThfvxu5mLP6koXjmiqf0eQOjQbaly3NUDHsfjJ
         nXTfP1i639WY6l8nsbXIEKXvKGeITig3pNt6AvN8GELE1G6REtL35Uy+ZmpxE8as8iQe
         +EuKJP+X2z03jjqi3spheOxpvZnBPFLuHOG5pYLPEYadaFbF/42LxhrrziPsS78or+BO
         hgYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxuZf/fOsvGKDbyu6uV7/3sQXb5pWczW5RjW1+46muEsiw/lnM1rSav3VspQVsJUqFLRhMxObblMXJ4pU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIImqCjyLrOv6wSUSVzuYapA6A/UW26kAGF5N2GbEw4utZauer0
	Rvc+/Ol58J0UIwRuZBhoWagg3HfMbGE2/TluhDOUkBX6PA5Eir2fLQwMTx6HxUz9E7o=
X-Gm-Gg: AYBFou2utIRRc0FKLVppeI5nPc4AbM9u1sBR/q2CTvaajs+eEzLyEu3JZOFdoVoC6nB
	gj4cFIn72pv8K0vENj9we6jF0plydGf6Msqmr1Uqtenhbe4FxvntvcOPZNb2cfi/B5Dc88x1/ME
	I6SkkJ8pzS9hoF8WKB4743WXgSvIYvGorD1MXr8lHCFtA+Ta/UEgVVR0tf3Fegd4hDH8X5CYKpV
	7iHWqF5y/3RnIzmLHi3AbrmcvPqPhxdwoJeCBQP2ySo9oJsj8ERCrm8hlcP7BttCkHf5qsz8gOM
	2/b5CJx415rENVkK3uF+1ontixmC7gePMYi3p/83pluEcws5qW2pgY0sUa0hQUCFjBWjigUre2p
	LN1XAzmQC/3+/AzHvWvZZkcc49noEu90mSOo9BSVS1OM6+JnjNvpst/u6kx9/e9769WnU9kB3Cj
	O8m3g5gOPyWjBpN5HKsTjMfElMXKhe1eS0eMPDkdWyksfqoy2Hslh5e7DFpOrjCNhgnQowV28OE
	ZpcvA==
X-Received: by 2002:a17:90a:4ca2:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ab70412990mr9433766a91.41.1792031268777;
        Wed, 14 Oct 2026 19:27:48 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94375f3fsm1997383a91.4.2026.10.14.19.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:27:48 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v8 3/8] scsi: mvumi: bound the hotplug event bitmap
Date: Thu, 15 Oct 2026 11:27:23 +0900
Message-ID: <20261015022728.3936714-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
References: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
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

