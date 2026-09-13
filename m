Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3F525B0A5
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334711; cv=none; b=kCHgDnBiUTyBa4NoTYvOQ/DteG1Z79ec9/AQjxPV5EaTdI0oJUwUYNipXBaJkN7y30PExw6yz0IjcDtvUXQVWatt9DMRHy7DFGUf9Ehlp7ap0rPpmwf5iEZOykiG1Oqxqlzb9gn/cucyntSlB7A2hVFuDOmutYU6fmMwGlvrcYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334711; c=relaxed/simple;
	bh=AAAwelguTPfjpAnL+vqAqkkChfEV0ObjfpvLg0+5NtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nh+6v5H+q9DMiEIbQ2rYxDFAN/i3u3Vt9xM+i8akfb6s/Pg49moTU18B2WFA92eYJS4VMBeVC/RKdp9Gtde26d984FJ0ubrpNGjuFhB5m9nC08RZGwZHuJB6hrGiE9fUJgTz7WHKoLa7GszCZc9VdzwETf3SCy5lWr+w2Llm7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWSY9HYU; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWSY9HYU"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309ce58730so26323301cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789334709; x=1789939509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTFAKxEPG/XZ7jFrqWix1l3HMof1CHgUjJhMCCQjkn8=;
        b=WWSY9HYUprVN2qPVLIUXCM4/ayDUfB9dCpyKu+RLYZ6Shi5fZyDb9E7dmO6/AYH8ap
         +8R0q4KnASc8Emux7UAXuFpTXGm8r36ExMWGo3bJZ17/kkcHcfT5alFVm68qlePsYm9Q
         nRwPod1L81Hgx/FMhjZNMAtG6CaUl4BA815vxzTWVKF/b/MyaWIqYcH1zRJfAMALwt8X
         BECouX8dp70EgwWD7VzAPmxEWKUiARbZTMjdU8HNt2ShaTnSwDxNI9yovChek1udNuAP
         5seowIkMO7izLQuisnHTwjH5DKRgaDpEQ0KxCmrAwUN/je87BJcoMCGZKX0xjq/OgBmQ
         7c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334709; x=1789939509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTFAKxEPG/XZ7jFrqWix1l3HMof1CHgUjJhMCCQjkn8=;
        b=DhDMRw2/1XWihNB4x42pT2vFgsqukyub5cd9ZQTNCVCBXs+e//giCrnT+rDyJ/rPeG
         34n6vnOcwu1+dTZx0HnWt26+AP5ZWkyATm/gXMABv+z8eGcaEWyZO8WlcW2gYNVXGqK8
         T2UIKiRbulU76+dpl8OllH+lVnHmjwoB6rjueXh0S8mJXcKLi+pJv2FOu/bknoyDa0i2
         c51l0trp5ZDTZdpkHEde711CZM59vSyyQ73WkX4uUCvdvoeejvTIn4Znt26o+8V6E7sM
         9FVNwhNZ1WXX3ikoQBaHFWHumgPvNSBmtMiNaHahZGyewNFyihAohM29LPwcpQyOreo7
         Mv9w==
X-Forwarded-Encrypted: i=1; AKwUvBwifVVStaivXZthhjBcSEH0UWKRR96GWlGWhHUeN+2jvAfYJAmtincHtk4LlxPaRk9cBMSZpOoP/Xtxjf0=@vger.kernel.org
X-Gm-Message-State: AFuF++lygwKgpcCvchfn12vLMU4wBXtG7B+tM62hbDCXmBdwdH9M2iR4
	2MDJA6+CIoJUgYguWZDRezbk5GHsRLZQv1VFf0+/3xunbsdl3onHq0xPFdFA9OGZNoBV
X-Gm-Gg: AYBFou3ehizSVSNUNwizZMp2TLwaVGtq977mi8QYcPqqkJUZU9h8BhQLe4vQMy35qkL
	vA8DYrjFD1ja776HEtBChTz83X2ylTSe1hBPDJVegezSxuEx/hjpzynyGq7oB6FafygEip0f9Ml
	qhUSvZ7qcNiaP4gLnHJ1djgG/gcHbdTYx9hI6sR9isql+0J2cECfwNB4scEixOM1It2d1cXEi3m
	Kif5xlakrUG+dokCVGp5AovolCMSYP3zt+6D+8nU8tRm9DK8BRECAfjyo8ElN319U7pSwt3fu0b
	AL37+xmwxNRYho/8XCeC3zH8BdCgUkttxEmXkOkNsGwD0r2/GzJ47zIR2Bwep1e35V6WYxEAA/J
	J5G1jvvha1LDQTny5vY7fuiokDCHywPS3ahGQpFynKM9PgQm9F79esyhjNicRi2CUQCiryGP/GL
	D3jZ9GqTUJCQG2sGXxrn5CWD13O46Ze711ziW5RvSSIEmc6esvGkaFyJIeeXZeVRfOp1RuQ9DbX
	kOkdz9JmahACiJj8zbglxaF2qnfd8AUqwXBGvJeg0vrohScV8oUyf5VS5yg4YtKAfMic3l7AmeQ
	dXRP8O2qzV/j41mjQM5pGUxxhR80rJcveA==
X-Received: by 2002:a05:622a:1207:b0:531:273:b5d8 with SMTP id d75a77b69052e-5310273bb19mr34117131cf.24.1789334709267;
        Sun, 13 Sep 2026 14:25:09 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca45b61dsm80714641cf.6.2026.09.13.14.25.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 14:25:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jason Baron <jbaron@akamai.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] EDAC/ie31200: Disable PCI device when probing fails
Date: Sun, 13 Sep 2026 17:25:00 -0400
Message-ID: <20260913212500.60272-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ie31200_init_one() enables the PCI device before calling ie31200_probe1().
If probing fails, it returns without balancing the successful enable,
leaving the PCI enable count elevated.

Call pci_disable_device() on that failure path. This also covers the
direct ie31200_init_one() call from the module initialization fallback,
while preserving the existing return values and successful probe path.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/ie31200_edac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index 6f5fdf43e7732cd23d54dc8392caed4ca7990fcd..88af77ee07fe367f692a89dd55f188aefe912e44 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -660,7 +660,9 @@ static int ie31200_init_one(struct pci_dev *pdev,
 	if (pci_enable_device(pdev) < 0)
 		return -EIO;
 	rc = ie31200_probe1(pdev, (struct res_config *)ent->driver_data);
-	if (rc == 0 && !mci_pdev)
+	if (rc)
+		pci_disable_device(pdev);
+	else if (!mci_pdev)
 		mci_pdev = pci_dev_get(pdev);
 
 	return rc;
