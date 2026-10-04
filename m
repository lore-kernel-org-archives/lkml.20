Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73133B2D1D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139713; cv=none; b=K4e1DZHocEaDA1mg13M8v3hbllzswhYlElt1DcSvO+ol6u90zqTjHQMS/AFYQ5/ELF//GhGDPoV3ubWw452+d3stjrdITpuIh0HxGYVXcA4lxWDRFpIYtU2ZG5aMRsly4rvbyzJc4jZDs5484rB14UClQKyQ3wO9dZqetGt05bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139713; c=relaxed/simple;
	bh=vZSS4ndJG2ibQe54acNwR+XWm8nuyKET+0i+mcCuznU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGEI3NOCQMRTzQ8RPbk3afDf6nkIn451XnDMSx3eFSr3XjUGOisJvtA2SDlp8u5gG5naU/6JDkycnELC6U8RIYzMmySVC7MF13WB5c78dYz8+XKx2S6cc6qLxVLhZT4DBnDYFLRdgCp6iSljkLyzAA2nZsRQ3LlihjuRL/pPeec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wgm9j9Ga; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wgm9j9Ga"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so4074839eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139711; x=1791744511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=;
        b=Wgm9j9GaBNP3wHMwKHn5stL2Ckt8W/3DeGDGhLJYFAsnBMGLIF7CZYcBwoW/o/K+Ft
         3yXXvfeGFTjLj2rFEp08vfcSjx2ld5U2mta8WGDCydZ8+gCy5DMJySklSghMVr6eGp86
         /WMjI/f8KeEKjccYC12cqn8vl9jRqmMlvxSHwkTtcMJEQ8DBsmgJWsiqyKPK2WfPH0LU
         aades1wnrj2eB5pZ/MnsR0/ek3TxGcqHdq72E6vUTAWvpVedrc5WtWdZ28SyGYs6/m0G
         0Aa58DVLmNY4ofBXMSC3QfNoUJf/GrFqXBskRbvFbo3YxPLIexfufsHqVn1ChCW2c+NM
         3Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139711; x=1791744511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=;
        b=xDt6I3R0GW0OFniHEbKglG5K2rrb5LDjs4uTCQ/Vu59d2kNJ+rjOYBaKd16VCqciqG
         qgP0hPfBX4g6H5mgIyf7aevWvzAeGY73q8b1V8cyQlU+X6bDiI5biJ8+CBTI/FZhsVpv
         NL6wqTkSy+uU4aFlwKvHMdwyWJDK1DmHOxCNk1yHhj7o98zh7KKEmbfCowPStlbV2w/C
         tW88vZOqwzayOZbnVqXrzLDTYLm7L5A1RUd2l0WASSwApcLtxWI9dNzSfYjE1P/pcnoy
         /fNwpuTc+2pu4Moalv+MEkRqV2F+wQ9sQj/h5MAJD6lS5xBKbtEInYRLPM4WNQ9RThgW
         BXhA==
X-Forwarded-Encrypted: i=1; AKwUvBw2cwSJva9cjGyf5wOnKwsq2zm6D3t19PHNMErlwfjdz+4r6bTFD2QFR0ugx2r10fahVbhjL+yEHXhUEBI=@vger.kernel.org
X-Gm-Message-State: AFuF++l4gjk90FT39GwzH/rLlufz+fyAuHeuVZ8ERWDA1t/x3Ves9s2I
	Em9YVIdbaKvMrGFWTfQwsMz52oKCRvV+UZUGmI2YlT+5K0pjaQ3Xx4sh
X-Gm-Gg: AYBFou1Ftd4KW8G7kaAPV+sm5k+EKsi1EtwINag5/eEEniBTxWiYX/Xzftlw5nGtCqp
	t+UkukfOdybyXpj/R9X5B+MGJJatYWIyck1py7sYYwwt4DeFNKK95zQa3ZKnbSRL6s+c71XkOA6
	AioV8OPHY2JyqYUhP7xfCyXdWEV/F8D7yBU6R8vRS9g1yetrUnzxlvsF4cPrCgOgUx3vSP6Tdib
	1Y98hMwUfJTBWhVX7aZLpz+vk41sZ14A9UJmxc6QSEa4JyzbdAaqqlURAYNL1xCBZZK0ZpECKjC
	X0jsNu/VQC8ddQbf2iJXc4asY7MiYfULMW9i++hhXZ/LBtYE6V2m4KUsxIOgP+Jj1hss3QHXvzq
	XySpe4ou/WmHoY9U9cJwZFA+ouy+M/Xv5jshPu10iQ8qf5QYnQiTUNPA0uVX/0syLyyC9W5Tip8
	9iS8VDzv5gdaaNIdvzqbKBodbSJcptPmFWDWk0B8Yd87hsPmRaHWxK2FNuzo51V4YLiO2/Vkuk/
	N3Y9ooFp4HZwJjWh/NawcneJ7dYHQS8jbR4e8hh0rRUp67YPUiwgwSphY3YNa2raXZwOqshc26g
	b1CX3Tf7Kr0uGknlIsFIwYC1Fz/MLD3k60ouCIQuGVShvQWD
X-Received: by 2002:a05:693c:41c7:10b0:351:13b4:9c59 with SMTP id 5a478bee46e88-35113b49cb0mr6822345eec.2.1791139710731;
        Sun, 04 Oct 2026 11:48:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351270204e0sm7754374eec.1.2026.10.04.11.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:48:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] mips: ralink: mt7621: avoid casting away __iomem in wraparound test
Date: Sun,  4 Oct 2026 11:48:28 -0700
Message-ID: <20261004184828.31284-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPHYSADDR() casts its argument to an integer, which strips the __iomem
annotation from dm and triggers a sparse warning. Compute the physical
address from detect_magic directly. The result is unchanged since the
sum never exceeds the 512MB KSEG mask.

Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610041411.uJXWXF8i-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ralink/mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ae7b8cfedd5f..2d10c74b13c1 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -65,7 +65,7 @@ static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
 {
 	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
 
-	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
+	if (CPHYSADDR(&detect_magic) + size >= MT7621_LOWMEM_MAX_SIZE)
 		return true;
 	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
 	if (__raw_readl(dm) != __raw_readl(dm + size))
-- 
2.56.0

