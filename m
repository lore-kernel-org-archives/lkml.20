Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CB840B0EF
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266800; cv=none; b=L6iTIDRwFavHD53UIFhNXUxcT1Mq+wURMBkIyiM//0uCfDOCPUPss5JJ9EVFncW7NF2hGPwYwkbzdxP4SDtkyD7naCpgmH5TI8CwJNrB7KGqwAccXBmylvF/1m4kbeHXGj++6O0E1cY24DUIpgnK8DzREzrEWZQCD57m9vRsvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266800; c=relaxed/simple;
	bh=53QYWE27UsXxj+fYmOb0Pfq2oxCp5h+os5EvQeG7UFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMoPwPwSTALjE4yyM1FCeBWtuJjSOBJIsftV2/xDgEYibXdmGO/tjwKPF598gp1AAUT3/XjnzstCer3cIbVIswm8f+PS448gkxhKWWc//He3H8Bv80YF4oIJ34Wuh6Zy1L99Fo974XYg0J/UuhV9Nv9IZy0/A/faXJxrfm01/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgfIDVPv; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgfIDVPv"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b19e291cc6so1044933eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266798; x=1792871598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=;
        b=cgfIDVPv8+fFuLcDNp7nzcOx9Vk83VmXpeUGGWjbmFs9j5zznVLMycgZ+Wa4B6CUbm
         3rGeEUe1PCMip2r89xsjIwEDuvpl5munu5+vub0gIH9rFunMSt0RBfYzr2ud01MAW+l9
         tdIdrE05KyavBU1cFEn+lWyfWZ49vqdPnfbPJTCeERwFbYB1zypy9GBj3RTMgUcyjoNZ
         zYaHndgmlY5D2XxlP0yJdATVHgbI72++c+daZqW8+h8Vp2yyohpEL2tGMfDjgTxhXPkC
         FEKPqyjY+MKAlJdliEzCs980oxNaFtT2QMoWURiweGesl8KYI/FYAQ3i529DjJIhuzgH
         p5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266798; x=1792871598;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAeoEq6yHDKt64XU8PioOz0s2+K/90/TohU+qG8Q+p0=;
        b=SI9e3QOVn13tAhXtGXNnvK/uHARY1XQydEBbRFywgem+jVBCUnIXMoa5lXvMyCx3cH
         7OqMFNjy9yM3Tn579ZkCu/1EZP0WoJ2q1O8eWK0gdAtt1EDZnsYwHmSdk90QTtaU1OUT
         vi4KchplUdfuQ5M2yaT8e/4fmyQdlHhX9lwT7mxh3bmjPAQRR+GW8Wl8sMHLm17FIRAT
         Qr4mie9kAjw5xigkI2TAXeICf6LilmTJa4XVWyUdPp0sv1AdRH4NQi+emR4mpbqZk49G
         mHTZ3qngt1epEQEJaGMt/2Jl8W6slEuuxwigT1lq4ckEewO6KIoRZ7sUmeNuBboKz/GF
         jLzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD6SPdch/VMrgexOLcUZCp1EQFGLK/CcsQsiN9ro1NyfiVuI6B/9IeOLuuOM5eOe5IXXZVZuLQaMiXzPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYZJ8yi0ZEbYk+KLNbX3EWgqAx++ELYRz5qqHvzQhCS5OJqxmo
	arZNRpBL7E5AEBcfG3W1Ba3wFAuHFFtkb3FDk4zLcLxmZgOAzyQ/psG4
X-Gm-Gg: AYBFou0QjIbV1whAfVupRwJprE5X2SnFs194D1eZ4Ftihr86+pbG1wNe17wyqAd1/TM
	50fftlW3pe3BG+kL6OnJX9MPftEbLB4D/5u/FpFjYSQwFmjOV4N7v5UOYxIe7+HfW5p0HrOMWno
	50WN6f7x+wFbKq/5BX/O/YBSxQ7Bln6ACUi/FG9jDEmC+Cr3RhS+NBkBxXnNhZXwB6dda6aqH84
	TaamMSPzLItZF8asLR3jbghsnHQGKAcMVj0IK6YzAUyovFsfT20DhGA2ArD9romcfzeoRldWYHV
	WMuUaVDNm8sEPdB0OciCW7B/1cHYwDshvb09ENxD52YISUmjZV92XAJ+oQT0C+8PVgA3E+iES7i
	KBAmYFZeB2Dl68Z8R73TJAkUm6k1KU4xOP84MZqQBHSLJpQzw632BfoENbZzXdJ//6B0INnVodV
	L9+Tk8/DkOPMNTeccB7A7t82C070xu9S7xAtix4VZ/iBk6pBEXjyM2EtpIzsdFCuj5uHfMCSVsm
	h30I63WJc65RZmhPD6DhRaq59HOZo225O4IYoqGf+PqLMs1jqWxBE54tr9ObQ3+YD3ldNG+Ujs4
	7prw2t1bqZNnMDIcV6U7Z31Q4WKAL9vVc5TtzpZx6Ev/Ii3DRWMK8nEYgbtn4sPemE0ku12DUbO
	qfY0UOoAqZraPahfIPJjPTUbswMOi7WrTa5ObQMdgYJ550JV1jU3Zmg==
X-Received: by 2002:a05:6820:c2c7:20b0:700:da68:7396 with SMTP id 006d021491bc7-70357791d36mr1496668eaf.67.1792266797756;
        Sat, 17 Oct 2026 12:53:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12dfasm4829795a34.24.2026.10.17.12.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v9 14/18] mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
Date: Sat, 17 Oct 2026 13:53:03 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-14-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a12ec60c63b4..993e2efcee04 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1655,7 +1655,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

