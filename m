Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1B3644A6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907229; cv=none; b=IjOPxFPfDyELQgqZIsS/CoTe3FQdrwjBrum+nx7ChuM5IAyChncUYkLFOyST10Rf3mnyyW8nbtYq4xTA/59pNGJTGguDX9iTYJBiAep+xlxrRheTlomecnqhx2mGkrUxRjsShbCdscPfxEwnHMyqoM50EMsMKB1bo075EH7gLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907229; c=relaxed/simple;
	bh=ZHXtmFDz751JN8F8+QNbhqwcgKVAc9qSbBTHt9zr1mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrqdsY8LbCi+su7KQAILaLGjGH7C1BE3CgsA/ZXSCNFN+xLsqWwbyCGPUM8ko4t1OThwHJ4AkElmo1ZO4uaerf/emAiNY2K2SyqjhQ/m4ccvyLH3KoftHWiyJ2yiyyt5hOMUPQlX4mHIu8V2Zgj+l2xsYa3ceozR/4DRItv4npU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCtyIVvL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCtyIVvL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b965570d7so3659695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907224; x=1788512024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtwEXzyI/WEatI7C9Ufc77ZLEa/MCSb7xNe3YfRc2+E=;
        b=UCtyIVvLu1A/lNvyZYrAMrehrmkaB4KmFSCG4b7LXri6wnGQch9lT4RJcDd5NBBTgr
         osTFlsAZcSgsDX7bA09Eq49EZoP4AemzZgAhGuXZjm4DdmRPCvMpVTS9Nhw5DGfsmb8d
         Mwl1qTv9o2AXD34fUaOmDAMgQ00TzHPpvL16zsuK8ULACCpQCgrVzHLtG7Yf/3fINaSu
         L/GpK3+rU/U/c5JzTOb5b7SgRkxiwdine8OwE54Sbz54jY3ZReoLh1N7mehL4Zs51Cn+
         1C+lCx8n3GuJzbUHLr9X4dSKql4h/GB2G7bC+i6K/vRn77OeaPEL5+CzsvxmNztjTvMJ
         Uh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907224; x=1788512024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtwEXzyI/WEatI7C9Ufc77ZLEa/MCSb7xNe3YfRc2+E=;
        b=KGczAQnARC3EPkozyGjjSkfXSdZKuTKXN0qb1dnoz6rMcGxiP8i6/FFm6UayY+7rXp
         2KTo1iUaGXm695pnGybO+k3Ae+wd7lcl3UAuBu6SoUlYlgFvHFy95W/hy31Ir5s7GvdB
         10WKbsZO08sz+uIGNcJYJb7bcDgvvT/kne/j99pGBrKYDLHNvcKlhvsqwSGFkm505SbQ
         URohNVDu8dw0SvzZLEw+lNbWCCZ5TCwxplRnqRn9LrMLjNVHNfhrb/oac2l+A1AkNaWz
         bxn7pl7EvtAwzwIjtywMr9G/ZS+d0VsvYzxEn91Dot1p8rzGbKOcF69IL2hgqjlcDPDH
         3V7g==
X-Forwarded-Encrypted: i=1; AHgh+Rrd+AzThzBuS/ho8l3FOS7385wnVlnkEVnTSCtAZ6ysdfIkapqmC7LQt6EsvUNoJ8gSygx9eDZ+/74YNqI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/LoYTGTjegqAioCwysRJUOShgANmSGSfVaM3QX8OqrtbQpBNk
	0TXQug70jWJu2jasfcD6lTqzCbLKGWfH6Yf0wVWf78Nxp6U0s76mA8/C
X-Gm-Gg: AR+sD13IlNwJPWrQ1UF8UpbpCtimnlx4yhJa5DnL0p82dOCAdH5Jycq2tJFwS0lgIAL
	obn0wjD+dxoY3MfwAa+VQ3Ol2Ehj/VIDwuGcw8MbHocLlbN51hJkvRY0l6WfE0vGX6OXwaNKlmQ
	Ie6u+ZDMvaozTmkrtp+IV7V2QiMLGZlnjqbjLvqiQ8Z0Tju0XzJauGlSRcLpIma3osVgMJ5tkFP
	dOXZep6QAJzZmkvvvjjgKzpEL2iCaJozrhgSHxso2wh43zYwXnSMaXBdstSnbpMq+cDtGzpnEVJ
	P0tyhhFvvj309WpFiXGwZZKuL+NHPuF5ohuVXWphGWaNPI3D7pTJAfmZZs8plJKEFQJvgFo/1ot
	E8zyYvlS4T50lX+8mNaQ84nuL1Nz8f3CSrNmDjTpXpkJuuMHnBAc5Jv2YAgu5X4HovQ8jtKs67K
	u0dOTpKt9gC0UmikFLWz4b4ibINBq7G1sC2pNYUBkF4Sl1PMKshVChHvzPSNlRTY8Ute00cUjE0
	Ogt
X-Received: by 2002:a05:600c:4704:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-49b91c2d8femr69750805e9.5.1787907223642;
        Fri, 28 Aug 2026 01:53:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm43155175e9.4.2026.08.28.01.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:43 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Bill Pringlemeir <bpringlemeir@nbsps.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: rawnand: vf610_nfc: rearm the completion before starting a command
Date: Fri, 28 Aug 2026 10:53:40 +0200
Message-ID: <20260828085340.3916239-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828085340.3916239-1-mehmet.fide@gmail.com>
References: <20260828085340.3916239-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When a command times out, its interrupt may still arrive later and
complete cmd_done. The next command then sees the completion already
done and vf610_nfc_done() returns before the controller has finished,
so the caller reads the SRAM buffer of an unfinished transfer.

Reinitialize the completion before starting the command, so the wait
can only be satisfied by the interrupt of the command it belongs to.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index f831780d6fff..f88c7b45bcbc 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -291,6 +291,9 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
 
+	/* A late interrupt of a timed-out command may have completed this already */
+	reinit_completion(&nfc->cmd_done);
+
 	/*
 	 * Barrier is needed after this write. This write need
 	 * to be done before reading the next register the first
-- 
2.54.0

