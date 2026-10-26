Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046327;
	b=dLpIQjNixf6Bm7guGdcaI8NrN75xTL4yZ95xTW5mDIfULzteU+QnuVTm1k3Cfrsu1Q6r
	 nlzb2bmq+mMorYph7Vk7T2VY1NM+wL02B1vKXKx35fkEW9zKXsovGnv2Jhc1XewrGsJs5
	 F3YYYX7QQzX7vyz65f70TetogSiyUkkaSJ72WZMUdGtSzuhN/p3ZeDLh2NAmTbiOFG9Lv
	 5tNU5SWa5ZNd3rdt07b/DI59r2OQl84Nq+CaGFJfLPyNQMumgFIJKITA9Ld6qfb499BdV
	 V2cf4lZhAMXQafd33auHkuI6KI2UKynREYJLMHr9BzT2eGEcui45TES3NsbsrmN8bVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aed4Rgnz6EIvDA20M5W9ZTUqmqT/8I65PlxJXFCzwH4=;
	b=OwKtPwNNX4LzV5KWtRvsaszfQvFwC0Fzenwi7J/AaOXK349cXBXMPZUNxbga4EHegtmf
	 TJoFSj7T2qfcXf+yWJaEskF3AxvLL68wFAD3bR8A9WOQ3dNkuiOWNsncHrUO7W2NTHy36
	 Y/1rOI9Phy2zHgMBAlc8ULPXWYz3DFrkEMuJy1RMPG2HFFpnjlFXskHXVdvSorgoX3E2o
	 OpMzSwoOX0KVLBgcjQts1oKV2g75A/KZlDNr1ajD3bfcEbCfJwwZ5V31AY+92SF1TlNzZ
	 P2Lr2z/dRQ0r5wgDr62osLKIO0I8U5gVC0B0gaa0OVZSCMDUVcz59QsZ1fl+1NV+jPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DUDTcG4m;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAE1606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAE1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DUDTcG4m
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28185755e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046325; x=1793651125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aed4Rgnz6EIvDA20M5W9ZTUqmqT/8I65PlxJXFCzwH4=;
        b=DUDTcG4m01pngZDHRm0vtPFiOHAjvOKTNBrJy4qLEyCDaX/4FvhKwMnM/B4N4dICPY
         ZN0PpluhYDZ5mz+D/aKGoBDrXZPuXdmjwcVarXDdeygPP8yCZctQduU40Y1H+kU644z6
         czhYGUD9XX4B2g52+eUdXWkWWZT1Iwjg39rB2CBRkQ3kx5H14H2EOuoJIT06bkWlxR1V
         zqOFf1kGIQnKdc2wwPUge9u5DKN2M7IXGfo+hSksdnHJRXaWCG/Ycy0L3syVwSF7fvWu
         HHPKhE8Gp53Pc9pxLqdCA/JYg+wzU1pRAdidExi+kSNz6cMUaLEFjM2M6mMpDkb3TJ8U
         4PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046325; x=1793651125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aed4Rgnz6EIvDA20M5W9ZTUqmqT/8I65PlxJXFCzwH4=;
        b=J3XlcaXJktKLmc061/6wl121dAaUGg625T+UYyYvLw6hUYTjgxVtUmmtZyIfwChbFc
         viDkdxOm+dSH46xm+ZcougQzBCgPcFZoR8vOmw+AwIQCoFEaU09acwXzU40SN3Hhsfkf
         nKKbL40mTsT57AyGsvBqSNMI7vXbFWhISHm+d8jQs3gBZhMH5bPcV8sARq6zMI7jqOM4
         yn7A06klJ4anc+O0lzzWe/wEzh7u3LdgoIkaGpSfjo5PBm+sKDQgEco1VHnCqNghTNy8
         RZGEAAgNch5xCQ0PrkzeCPhEJYLqjOXS1I9S3NVoDAyhoFomdZpRJP95e0j1H7rRNkmo
         OUXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYlJ67CEdaEL6r6ZJcZhJMNqsr3g/37ShAsyXAhGYgNhu3DlDmYexD0s1BdbVktnc9emtfsa2i0xQcQSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeoUxlBK0OWrzFGJcealApYoQcUeCZUgFLFvtghjnx+t1azxyf
	Snoqftp14RvryPLxsYhWb/vamk9bUHxGI2me9jCgvMejkDUm9zqe7Kys
X-Gm-Gg: AYBFou2AJ8b6WgDsXaa9jhalBSsCu/iSydCTOiB4M23r10r84x9vVCifvNQfBk+a9p1
	R1760bhiNsVgQT+YQ9gqGVOs1tpUJ73jGnRRPOr9qIIkwZGh2bDSoUlCWSBU/FX631/kf8tnZLz
	XSGh4WzwMaLlQuuOTk/WfJIl0qzOYfzYrDOaRMv7lzfHJyTlHQFpEv2WhjWoZJBkt6AKdlpFp25
	ryllUyc2koMpONUgi9fj9YqAqt1cXVyFmLWAQiHN9RshN0wigjHdKRjW4l1f4LzAxjquwXIqepS
	siD07Q3LFlwO5zq4r+yOgCFt/a8YHF6Au3mzwV5LCj7sGS95tHF9gIezP5vrr+CNE+620xlBeWf
	z5dBKXMyKYFSyYgR9APZ3DYy7Ox5yKkQM1l65Gr1Sa0Au7zoUeh87Z3kZCV59RUrj2eptLHFgQx
	K7/N0lloRYHIO0vT1b76jjeq5HrGiHEZVGUtt4t2IvjEZEG/ndRT0srrfzmyfO9p3/hLF3kuWS1
	kPsz+Xq98apVlGIlKPdazM5eXz5zJbVn/rrQBoXhl4n2kO+7BVFhI+Zdt6MU9F/nt0=
X-Received: by 2002:a05:600c:3541:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4a35acc6a2emr148103215e9.33.1793046325020;
        Mon, 26 Oct 2026 13:25:25 -0700 (PDT)
Received: from unicorn.lan.internal ([2a0d:3341:b894:4600:8f9a:af38:72d6:7c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a046fefsm276685585e9.5.2026.10.26.13.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:25:24 -0700 (PDT)
From: Giuseppe Piscitelli <ooonea@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ata: libata-core: Check device support before querying power state
Date: Mon, 26 Oct 2026 21:25:11 +0100
Message-ID: <20261026202513.669084-1-ooonea@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The standby path queries the power state before checking whether the
device accepts ATA power-management commands. This sends CHECK POWER MODE
to ATAPI devices, including the QEMU DVD-ROM, which rejects it.

Run the existing taskfile initialization and device-class check first,
as the active-power path already does.

Fixes: 9cec467d0502 ("ata: libata-core: Do not call ata_dev_power_set_standby() twice")
Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
---
OpenAI Codex investigated the QEMU DVD power-command failures and wrote
this fix and its local validation.

Earlier validation covered 1,536 source-body dispatch cases, a Linux 7.3
build and two ordinary corrected QEMU DVD cycles. No exhaustive ATA/ATAPI
hardware matrix was run. This base was checked for applicability; no new
build or runtime test was run.

 drivers/ata/libata-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 92233fb..c644e2c 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2047,6 +2047,10 @@ void ata_dev_power_set_standby(struct ata_device *dev)
 	struct ata_taskfile tf;
 	unsigned int err_mask;
 
+	/* Issue STANDBY IMMEDIATE command only if supported by the device */
+	if (!ata_dev_power_init_tf(dev, &tf, false))
+		return;
+
 	/* If the device is already sleeping or in standby, do nothing. */
 	if ((dev->flags & ATA_DFLAG_SLEEPING) ||
 	    !ata_dev_power_is_active(dev))
@@ -2065,10 +2069,6 @@ void ata_dev_power_set_standby(struct ata_device *dev)
 	    system_entering_hibernation())
 		return;
 
-	/* Issue STANDBY IMMEDIATE command only if supported by the device */
-	if (!ata_dev_power_init_tf(dev, &tf, false))
-		return;
-
 	ata_dev_notice(dev, "Entering standby power mode\n");
 
 	err_mask = ata_exec_internal(dev, &tf, NULL, DMA_NONE, NULL, 0, 0);
base-commit: 69be770908ae57354a41d7e1cc99ab46278d2e86
-- 
2.54.0

