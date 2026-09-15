Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93367258EF9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444298; cv=none; b=AOta69870Zfl4i8oO8QzTJUKScsaFUEnEvGHUrysUu/BaWj3gQEQtuAp/Ub0TOA6uldwWIIO8TnPxQaL9Xw7GTtvWC/3uhEkc+mh2rRGLSJ2y+aIk/6GrLRWfRUvm+8hc1AHKRu/z36rM06cp6mG4XC+4yAzDKjC2i3rKeNawBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444298; c=relaxed/simple;
	bh=hnASxo8w1qhkissFEk6IziudaaSkxtgdxtVZOYNfFzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzVNaeM5X45fT1AOf44xO+4Upr4o0w+J/BT7rKwAE6voleAtsiS6qF09GwMbYj22x2/SUye9W8x9LS1BPJCg8z91JDelv5AbMa01oAYCW0s7w2yOf1cF2xJKxV50tGWO1IWIRIXerfHI1sCOtXLW/iaQUZt0VdmKz29xH3Se60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvqjCZHC; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvqjCZHC"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso4252866a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789444297; x=1790049097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t89rpHiNw/rNyrb5GPmXpT24rGMM1iH3V/Eh470//LU=;
        b=UvqjCZHCe89aQD3U3JpoDxisYzh48+ptG9JDeNR2BZwcZR1NPoVhwOB9OHNTcY7pgq
         KdTOJjnIiFU9R6m7LVDs6fW+SGvRUn8SL2ah6XMy3Kr6xTDxDmSPBqzVnPMJ60DtqYD1
         79nJ9JAM0qrP52nSw3+irw7cNvYJelOFQ8jtnMimUhfjpjELvSCVrenIvA1uujEhIKXR
         h6aWNoLHoxc3G5OQHDrq3JCSHS4enqB9YemI97wnYaKQJ2DePQ9yFJePx3tkbZCyoaRp
         G2+GZnnQmdQYgNeldk8NvSdDE96eHW19A/A71sVSNbO8kT/ENcdpNlNY0kSjmtlOacOR
         WcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789444297; x=1790049097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t89rpHiNw/rNyrb5GPmXpT24rGMM1iH3V/Eh470//LU=;
        b=ZWpX51cEzc0KGFoy8D0STW3W/dOUbR7kggWp6z55VGlsnMtLvqPrlwlBKDh9EsordN
         yMKbgOvZvxofdLDT1PU9DaIZNXQeeCccwCVf/CzlL0sh0inWEWcK6Xgz1yrQYKU4yMI+
         c7Cfo0b5Be8v46BeAAeT0+mb43q6jffzoMXJJOkvTNoNemAT8YTgaDAM4j46Eq1iq4xj
         /MHWM9+s32VlVzIiHqan9W6edCSmFn9qBrSXSjox2i7eSi8X5l6zQgmYgxKN3ieLDNCX
         CeIph/Z/hEDFn1tSSIjCyl4nezVRHgrPr6rGAKfF7zko7eIgsUf5C3zFIzPvSkkWCPgE
         FmNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx93SLiXNWSgOLom9qwGNXI18RMY+jC56tqN4zNV9vmb/6jEsiWHHFEZiD4gYSCSdX/OY/0km6T2I9jwPs=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Uur0L79Q2omA31/en97qalG+mGbi9W9KC3RH/LLG4JT2a+yq
	oOyCvVjuB4jx4qZsMvuIgkT+2Y1VrzvO4Hkkm8OQE2h4/Wva8eUfLQAn8tYPtQ==
X-Gm-Gg: AYBFou1gn5aL7ttzEhYiSq9TDD666eLaSY78Zeh5qGTWemUYMH/M6//P5fJ44E11UqH
	oQI94SYmXJuVVK3IrXnxqV77JRw3/5Y85T6Z4ByXpEVD+0mRfLx60AwRfTfIjTFZ1jwdXBE7P4K
	Mvnn8pCXd0/tAqhOI+yeUUzlc57ISxjaeOf73g73mHnv8+AsSHoPIYviOgZNM/FGoUCwVMsaZA6
	4yDA4xeuGtSkXIdPhNHUA1PZG0ypXbjIgcVQCllQeelnb3T3J8YmQv71ljA1y4eq7BwcatYmssY
	Pf3NEEpYQCu8dj08X/xAif+uuf9k6IlcXbetlIY0yazXckZ/8MEH5FSeezj65+QIPc8mAhaEtll
	EaICKDFCKq0rUzeusXGtZBLuhgphIqLhq7d7ru+SizAktLbni2Dewycz070AaO1QVsbVYR9Dfxp
	z7+xnQ3WfEH0DtcLjQaG5X8gTzS10fUusrpx23AfShW8e2T5pQIYAcTwTmlHAX+Ojgce4HHjQWH
	nQ+3Pjf6O0=
X-Received: by 2002:a17:90a:d888:b0:39d:f5b1:e365 with SMTP id 98e67ed59e1d1-39df5b1e47amr8246438a91.25.1789444296846;
        Mon, 14 Sep 2026 20:51:36 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd7545asm2389935a91.14.2026.09.14.20.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:51:35 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmet: pci-epf: reject too-short SGL segments
Date: Tue, 15 Sep 2026 12:51:23 +0900
Message-ID: <20260915035123.3792935-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The host controls an SGL segment's length. A nonzero length smaller than
one SGL descriptor makes nr_descs zero, so
nvmet_pci_epf_get_sgl_segment() reads the type byte of sgls[-1] outside
the allocated buffer. If that byte contains a segment descriptor type,
the function also copies the preceding 16 bytes and returns a negative
descriptor count.

The read was reproduced in 3/3 KASAN boots with only the host transfer
mocked by a KUnit test:

  BUG: KASAN: slab-out-of-bounds in nvmet_pci_epf_get_sgl_segment
  Read of size 1 by task kunit_try_catch
  Call Trace:
   nvmet_pci_epf_get_sgl_segment
   nvmet_pci_epf_short_sgl_test
  Kernel panic - not syncing: KASAN: panic_on_warn set ...

Reject segments that cannot hold one descriptor before allocating or
transferring their contents.

Fixes: 0faa0fe6f90e ("nvmet: New NVMe PCI endpoint function target driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Affected since v6.14-rc1; verified in current mainline 587858367581,
Linux 7.2.6, and Linux 6.18.52. Triggering requires
CONFIG_NVME_TARGET_PCI_EPF and CONFIG_PCI_ENDPOINT, with a PCI host
supplying an SGL segment length from 1 through 15.

No PCI endpoint hardware was available. The fixed KASAN kernel passed
the same test in 3/3 fresh boots. Reproducer source is available privately
on request and is intentionally omitted from this public AI-assisted
submission.

 drivers/nvme/target/pci-epf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvme/target/pci-epf.c b/drivers/nvme/target/pci-epf.c
index 9c28367435a5..c683450df422 100644
--- a/drivers/nvme/target/pci-epf.c
+++ b/drivers/nvme/target/pci-epf.c
@@ -978,6 +978,9 @@ nvmet_pci_epf_get_sgl_segment(struct nvmet_pci_epf_ctrl *ctrl,
 	int nr_descs, ret;
 	void *buf;
 
+	if (length < sizeof(struct nvme_sgl_desc))
+		return NULL;
+
 	buf = kmalloc(length, GFP_KERNEL);
 	if (!buf)
 		return NULL;

base-commit: 587858367581b9c55c3690f4e63382ad622719d4
