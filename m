Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196303;
	b=Z4XV/P3G+WbNJBRCWWmaee5ucHmzFLklAHlEbtgTNYnKJdhHrqiMTIHpx4sYrX/jaP/6
	 wGNFv5clCc+wF+FwUDsSUTTPGVM9ronFGhoBLnbnNaEwOg8+FXgElkozeFamxlG9Q5xk4
	 Vpbl1fknGo5V9Ukk7dBPSmTg5i5iaLbxqFad4pFsJ95J6kqY9tL3JKj2jzEO+35FoX7tx
	 o2jFvXBKNq/KuUvXEmkQ/gL3g57KZgZdJActv6yO2AFbTHiFEkj7rLjohCUfCZ4rJmhJ6
	 FgljbeLr/BlXcgLPEYurPhH3R2zs6RVUcOgqX6IOzTaMhqJQ0chxTvrDxc7dWU4cGfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196303;
	h=DMARC-Filter:DKIM-Signature:To:From:Date:X-Original-From:Message-Id:
	 Mime-Version:X-Lms-Return-Path:X-Mailer:Subject:
	 Content-Transfer-Encoding:Content-Type:Cc;
	bh=swgirEIYnIaEZi3MwmLVcinGiwqWd0Ak1rTDVMUomLY=;
	b=EGq8E8/wmx795QGUmwk8nn74n5aZQXV94boozRGuyx4tRSjvyqpFVjVxOIwznx/QmHVA
	 p2yWYNy5JniB2AyELxgtBmNhHtFd6GbLAQchGgGwbR+BrPlX0yQakmmO103dVRyv/yiy9
	 jyEvGnftgwPMV/7XiFjEHQMGUZbaJB81rFF4sLKJxP01tYXdXo2J4jtZqrD12xoKabKtT
	 wwg2gnL+BuVeCBkFZomUfQ3y1U+ovzjYJlUHroXKVC88xtsueR1Rw80btyCKwpwegsULj
	 DmxlZQbQmTxGBw1drnaQE4g12sPVwHkX7erQNPMLkRVBASmBjxrfupf96GgmBRmgZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=iu+3Q0Df;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E152E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=iu+3Q0Df
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793196297; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=swgirEIYnIaEZi3MwmLVcinGiwqWd0Ak1rTDVMUomLY=;
 b=iu+3Q0DfiyGPYbLj+ew26pgUbHlli1un2dGJ0ea0GTXwy0W66naeUMThkSxOOtbeBLIi8v
 k2G0lSETxBp3997bmiDeWlCFez4b9itoLXSHsm2XzuL6o6+PdU5AKjwRmBiM5QVFhrj3QO
 nwWwa4aWrLCeJQt6yWD/UVBIgEo71yLxn/taolukZr5P6W1WmJjeNENdoTwnIjBtPzmcEq
 s7VdKXuPwwC7hQQmn43NV9cy4i8ab6puDusNPWQj3bJB5cY1DFnTlw7xf5ampqdV11mQlW
 lDyQoEugFGFE8FxXp3frAggpnIwjvopnP53j5DTK2FTVowsk+KNqFT6bUCQwkQ==
To: "Damien Le Moal" <dlemoal@kernel.org>, 
	"Niklas Cassel" <cassel@kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Wed, 28 Oct 2026 22:04:32 +0800
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Message-Id: <20261028140432.20489-1-zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae20107+60a674+vger.kernel.org+zhaogongyi@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Subject: [PATCH] ata: libata-scsi: reject non-PIO protocols for READ/WRITE MULTIPLE
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Cc: <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@BYTEDANCE.COM>

From: Zhao Gongyi <zhaogongyi@BYTEDANCE.COM>

The commands recognized by is_multi_taskfile() are ATA READ/WRITE
MULTIPLE variants, which transfer data using PIO. ata_scsi_pass_thru()
validates the MULTIPLE_COUNT field for these commands, but accepts any
protocol selected by the ATA PASS-THROUGH CDB.

This allows userspace, for example, to combine WRITE MULTIPLE with the
DMA protocol. With a QEMU PIIX disk, the device enters its PIO data phase
and waits with DRQ asserted while the host waits for DMA completion. The
request remains active until the user-selected command timeout. Since
the disk has a single tag, filesystem writeback and later SG_IO requests
block behind it.

Require the protocol to map to ATA_PROT_PIO when is_multi_taskfile()
recognizes the command. Reject any other protocol as an invalid CDB
field before issuing the taskfile. Keep the check local to the existing
READ/WRITE MULTIPLE handling so pass-through behavior for other ATA
commands is unchanged.

Fixes: 1dce589c38c3 ("libata passthru: support PIO multi commands")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@BYTEDANCE.COM>
---
Tested on a QEMU PIIX disk with 16-sector transfers and a multiple count
of 16:

- WRITE MULTIPLE with DMA was rejected with ILLEGAL REQUEST/INVALID
  FIELD IN CDB and a field pointer of 1.
- READ MULTIPLE with DMA was rejected with the same sense data.
- WRITE MULTIPLE with PIO data-out completed successfully.
- READ MULTIPLE with PIO data-in completed successfully and returned the
  8192 bytes written by the preceding command.

Both invalid commands completed in less than 1 ms. No ATA timeout or
hung-task warning was reported, and subsequent I/O remained responsive.
The modified libata-scsi.o also builds successfully.

 drivers/ata/libata-scsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 115b75a313..31d822d78e 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -3507,6 +3507,11 @@ static unsigned int ata_scsi_pass_thru(struct ata_queued_cmd *qc)
 	if (is_multi_taskfile(tf)) {
 		unsigned int multi_count = 1 << (cdb[1] >> 5);
 
+		if (tf->protocol != ATA_PROT_PIO) {
+			fp = 1 + cdb_offset;
+			goto invalid_fld;
+		}
+
 		if (!dev->multi_count) {
 			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0, 0);
 			return 1;

base-commit: 69be770908ae57354a41d7e1cc99ab46278d2e86
-- 
2.39.5 (Apple Git-154)
