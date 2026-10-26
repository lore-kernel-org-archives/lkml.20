Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046094;
	b=jSV4kcBfwwfqeu81XT7pckfqtclS2R4MLZhif/Bl0B9ynTO8wHCp/nwzCcGbE7ll9vjW
	 O6RA17Up/tu80/lxmKqIhtvFKKZ8jnVZjG7jp+xoO2cFwABm3JRjdgF21XwD3zhPYgIQq
	 tQhzclTjSRWsxKh0/n0Qb+gZxX9pks2OyN5JKc2dap+r7apH50LEwJSHW6Evy1dRcmMk5
	 F3vdjdhmRuZXV/dHA4kuBCM1T9DX2lUBiJbpfB1fhSlVs0raO3O5dFVd9D2rk67K3BSrV
	 tIJUI9jOuRjLAUmRvzkj22W2L/hlliHuizgawc1uchSv0kLGnmpt49EOhITZbhkyE7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x6Ir9qU2xog4QfeMmCenRIHd3uFmt4x3r9jl+UO9buQ=;
	b=spnInkYGkh6zaYfKqYZmulKPVlhD0zuiRIslSJ8+DbYfwBFHHECs0FKC5KMeOiMe7Efz
	 Kh/drUPG+34QOC+5GRzEoEXgrvBbNyCNSVaRxph61VuKuiMnLDtctOxY+J9avlr/l+bk4
	 0KD9oGh32lVNaOP4N4XnTRbcrhSXKEqffoZBzAUO5lDl5wVcSNRZ+LSe3uMNsjvYZ2krz
	 J68tRRdO8kYfzvr0ZKqbp888rBVCLJRkMVU/DqcjtdNbCWFIoaHhOAqwYpEHBg+9Nhu7c
	 Pi/fa+DXudDis0YsoahcDsxsb9YKf2EYRzbZq9m4i2rwOm5wD5Jb7ip3m+ISRciz/BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rJHNclSh;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F339606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F339606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rJHNclSh
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so1350622f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046092; x=1793650892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x6Ir9qU2xog4QfeMmCenRIHd3uFmt4x3r9jl+UO9buQ=;
        b=rJHNclShInfy+ZLUiLttISC2n55SbLNGJEM0L+D08yC8yetnKCdtZkcarSkGTk1wX2
         R3awMvbbPNCQK8pT8zGAqyPG+R2BuTEvhC0xTKMA0MQcjCLIajJSlLV560EF/ByGXd1H
         N7ed4ppqvPxsG3o2+x3wXvTr3+T5aC9qZBHaGGwVBIrbgnkdzF+vmYplRwWoMEEhxagB
         4xQ1ZQRLYl87psMxmtSQg+RF90yQ+c0HRyaEAwwoccCAEJ9WgMcMHxlhl8oliy4Gvr4D
         23AP5yX/zVnXEUkbHMxpiErVq5OpR8SnUYrcg45+PBQDYREqkA58Ba6jqhszDU5VqmR4
         U20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046092; x=1793650892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6Ir9qU2xog4QfeMmCenRIHd3uFmt4x3r9jl+UO9buQ=;
        b=tDpDcDntElSmKNeUrIKWSYxxdzG5VnXgK4wIZ+4SzxUhBv5IxSLY9Grqg/BXpjhiD6
         iqpwg/hSvWqKqsmdtbMFfxVdT81mHDIxth9zUW1RI2LMUBFGBZjk1H8RFx/iE5uAurNr
         J6xTz0+QN+a6gtQg6pgoNgXdc83uiEChFgYtZ+OwGnkXMnSYV7K5JuRnzUuD8iCLus4l
         LuEF8VbekpvNauB7Ildnfcj3QBEIWLAaE6odvvq1Bw7euPf1Iyy/X9scClEb3iTw9mbX
         WnZwnbJKRLqtuQLRRnvaqiUv4y+N0ShZYnQCkB2mj93Ax2+Z/FJmZ0JhAMLSTaE2ipNT
         2fZw==
X-Forwarded-Encrypted: i=1; AKwUvBy5UtqZb5S0Ls699bh/SaKiCpSg1a7CApqzMLdZO3nft/vewOfn7YQR+rp9ucE6NH27T1yTpqy7JpWK5o0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3LtKOXCptTDa3ksWacVhHSRBK/56e07+OcuCla+t7EC+TSCyL
	0419t/rXRUVMI9mE10QrZiFTH6CvKlrNWAa2YPXhGKearvxJQEYuUCDRMpchXx3y
X-Gm-Gg: AYBFou0YdiHKeB1tj6pdY8A2yrKOh88n1z0BOUy0INWMeqDJFyHyDGki7dKSrfQKcb0
	x1ZVkwuAQ9yW/2Aw2FHa0NyU/Z2GpBskLuXFz93W35DwUiCOg7rwKo8JXs8GMY+1hJ3HhcDzJTY
	eML/cVjxZpGlLlddaQ6YSNofHLWTfpbvpOgSRVkGe0G6rBPu/O7AasGPaXTyNVHmA8SHfIijYZy
	X0O5MPfGn/W4JH4VXeookuJ3tyoDTSIEBaQx5cs62zJCHrckBhH164dZ7VHIpbjq+POzuLayBI9
	hbWdtbt9RwpRNX8rNEpNbnpaulwAitmODRucSz7W5hOGMoL1yHiaeVaIMC1Bx5tX2QyNGhFx2pN
	MOrtscdEd9xx5HFvUxL7orDMup8FlimZAPEhpYUFeOzcI0V5ke7NsaSAnHmeFdjrEr+/bOV9Bev
	ek5pRZKVtxUbttLsDsMHPnykCYcteiGGhyhKz3jCF0hPe+poKh5avbkogBoCIgI18Xqkz8mvtHT
	4JNGc0M9lIdOcEWHsLe3vxlzs7RbjiGEv+xzdZdt7l2MIMziKZqOBGh84ZZks5Vysg=
X-Received: by 2002:a05:6000:2312:b0:48c:557d:ab24 with SMTP id ffacd0b85a97d-48e3eb2cdbfmr14854413f8f.4.1793046092473;
        Mon, 26 Oct 2026 13:21:32 -0700 (PDT)
Received: from unicorn.lan.internal ([2a0d:3341:b894:4600:8f9a:af38:72d6:7c0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm18232676f8f.53.2026.10.26.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:21:31 -0700 (PDT)
From: Giuseppe Piscitelli <ooonea@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: core: Balance the pseudo target reap reference
Date: Mon, 26 Oct 2026 21:21:17 +0100
Message-ID: <20261026202119.667348-1-ooonea@gmail.com>
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

scsi_alloc_target() supplies a reap reference for its caller. The SCSI
device initializer takes another reference, which device removal drops.
scsi_get_pseudo_sdev() drops its caller reference only when device
allocation fails. On success the target cannot be destroyed, retaining
its driver-private data and its parent host and adapter.

Drop the caller reference in the common cleanup path, as the other
scsi_alloc_target() callers do.

Fixes: d630fbf6fc8c ("scsi: core: Support allocating a pseudo SCSI device")
Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
---
OpenAI Codex analyzed the teardown warnings and wrote this fix and its
local validation.

Earlier validation covered four constructor/reference-count cases, a
Linux 7.3 build and three ordinary corrected-module lifecycles. This
base was checked for applicability; no new build or runtime test was run.

 drivers/scsi/scsi_scan.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 0f0f243..90e67f3 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -2156,14 +2156,13 @@ struct scsi_device *scsi_get_pseudo_sdev(struct Scsi_Host *shost)
 		goto out;
 
 	sdev = scsi_alloc_sdev(starget, U64_MAX, NULL);
-	if (!sdev) {
-		scsi_target_reap(starget);
+	if (!sdev)
 		goto put_target;
-	}
 
 	sdev->borken = 0;
 
 put_target:
+	scsi_target_reap(starget);
 	/* See also the get_device(dev) call in scsi_alloc_target(). */
 	put_device(&starget->dev);
 
base-commit: 6a53f401e671b75c129245e371ca6e9d47fc3c9a
-- 
2.54.0

