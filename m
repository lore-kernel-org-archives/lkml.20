Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A8C41DE19
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747273; cv=none; b=Cdd5RzMoE1mw8NpDw4fhCpjR37ac0so2tC+9eB0F6Yz/ND2X7mPElTeiAkZla61JWNmAEXsMu5uxyM+9eDeA+X4tPBzFytHlrTfpkoNqoaodQDr4/hYfJZoenHNfW+TuT0PXc0/LyOSO8Jj+DRUhS3L06KQrtOaSPIKJ6TwkYQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747273; c=relaxed/simple;
	bh=+g3vEkdNg7C0/O7vW53BPoY9M7RNqcD2+kkLYI2zPOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGFqgV8eQq5hzl2ivrDE1aoA7jKrHa0lV9SCsL9JDgyv6cNzhGuJL3ntLQW1E7PwTVE6atYFOR5qKsMqbUTxE+UqBwFWirxf8qxZ8G4uPAUtJ9iPZ8YiU6bq1CuiaYgGLNvqLT0mlGUd6xMsGYmVCa77M1yfyrnefAteKYreOTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN7RzZZf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN7RzZZf"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c197e7e4e94so130808766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747268; x=1788352068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fRB6g9yGoP8wZu23NCaO6xBgrhz7xylfs1BpMSDQR4=;
        b=dN7RzZZfoVADy4GUHd8VhiCu/ZZJ4tX78JI4BVKXy/r6urN5T5CsgwyzKHx2JsJm8G
         MhhAbj5SfyyKSYHV72OSpJl7fRLAzo1cwjQqg6EFd8I/+Lkf8I0JGzqciTtWpWG153D4
         6XnNlilg/Bavjj6g2qrjbbdwasauDOOcelDOsWjEMJWihS7YRiVT3pK1dcItKIvODmaW
         KAYRftJ/4iUICpObnTara2tl5q830YSlevx4iLF8vqgkNLpY8pviUBzZ9pO05uXQECY2
         7OgloW33PltRsJBxxlxClKen/OnaH1P7ZZOa0c0gWXMRxmnTLZgZaZ2VQfq8h4q7qtIf
         NScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747268; x=1788352068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2fRB6g9yGoP8wZu23NCaO6xBgrhz7xylfs1BpMSDQR4=;
        b=H0flxWaeiQ/csbQHpq8C4sgwSPknXpY9D36KvWMixk6vX564EbRN9hXIVkqe30299V
         qZLl2ntmJp/CRhOifPnLvgjGSd8eJp0gH8i7QgkE6l4CXiQ1d+qE16C8f1fD3ZaXQmpT
         egw2t0N810k7zIJ0HCaTT5NkHco7qsyBupgBbnwfN53SZfffiq3vQaFosw/37bDRoXM7
         DOypTs/79mfjPlaO6vqaa8MIU9gYkiTzQehLQynH1VZuYN1SItck58ongfqjXOGI2bsD
         j46YQSNQffKneftoLAfYogSyxIK9oJaU/F1dDCXRy9nxeQuGrAwY+MgiG8kgD0zZ54qm
         7Ajw==
X-Forwarded-Encrypted: i=1; AHgh+RrM1qQgEceIP7Uuu8YWgx0HFWcEVAeU698iuXRCiW0xMQMSFiQJYGHKj4aChb6N9G0/OQuNWnALxRR8Uns=@vger.kernel.org
X-Gm-Message-State: AFuF++mn1fzlcplSNllPCGySF41u/i2ebkDVI5k1IsF1hjB0GmfkHKuV
	0JjM927MDIi20cQ51xVTHcm8X3AbXBY+aOX6QuktebsKPzflQixpJKOj
X-Gm-Gg: AR+sD13BOdl4titqqgVYC4rGjk5kqkWxsGeNxrfAaEG+jZtzsbqxYl9DCVfbYj3ozYS
	EKhllzVDhPezX8vPg96RswoBXJJny9yKQ1A5hlPo6r/TCG0AWpJsheM0U2rrcW2bVHUEWwGc5qk
	Ij/jvgXHkQIEfTlZTsay96C1Bsn+nKsXNYSQj0IrKASX6gnwCPYBk+K2Xlp4CrO7jassTXno/oX
	/g5AIPLViudxm35sknDCf+sFFXD/iz+9OBvFLmb1c6GBKMRLqvC6DG/Nc8C+n/76bGRxD/9DHZY
	PuaAt4EJ3TDeqDvLp5xFu14Y57TwD3W5IwxEBilelLU1Wm38752ZAPrzbepZCEjtozXf6Q3S/7w
	/cgen3nR2l9kaK+RT5urRAm1ZqEJQ3FrOIXqkaXjMIUHRMLaUsYgM1nHzAmsNaYTUeQ0fpn4n18
	RuAzt4lgwZaLirECa6gWE0wbBhXCXclZz2ivL7OwsBTpjQwDxrckGpr/KE4a3ohLm/YZXtQ3+MA
	vWeHtk/BxtovQ==
X-Received: by 2002:a17:907:6088:b0:c21:35d0:f435 with SMTP id a640c23a62f3a-c250bc0f8f0mr808974366b.10.1787747268163;
        Wed, 26 Aug 2026 05:27:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b4e9csm504890266b.54.2026.08.26.05.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:27:47 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 2/4] power: sequencing: Fix build issue with COMPILE_TEST
Date: Wed, 26 Aug 2026 13:27:24 +0100
Message-ID: <20260826122742.153643-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The POWER_SEQUENCING_TH1520_GPU driver depends on
(ARCH_THEAD && AUXILIARY_BUS) || COMPILE_TEST. This means when
COMPILE_TEST=y and ARCH_THEAD is not set, the driver can still be
built even though it requires AUXILIARY_BUS, which may not be
selected in that configuration, leading to a build failure.

Fix this by dropping AUXILIARY_BUS from the dependency and instead
selecting it directly, so the dependency is satisfied regardless of
whether COMPILE_TEST or ARCH_THEAD is enabled.

Fixes: 1a7312b93ab0 ("power: sequencing: extend build coverage with COMPILE_TEST=y")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v4:
 * New patch.
---
 drivers/power/sequencing/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..226c62704d9b 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -29,7 +29,8 @@ config POWER_SEQUENCING_QCOM_WCN
 
 config POWER_SEQUENCING_TH1520_GPU
 	tristate "T-HEAD TH1520 GPU power sequencing driver"
-	depends on (ARCH_THEAD && AUXILIARY_BUS) || COMPILE_TEST
+	depends on ARCH_THEAD || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Say Y here to enable the power sequencing driver for the TH1520 SoC
 	  GPU. This driver handles the complex clock and reset sequence
-- 
2.43.0

