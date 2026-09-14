Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B63E4A0F0C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420211; cv=none; b=AhW+cuQ+kZ16D3fY0Bjq58zovNvNMsihm66mzy3k0N+pMwI9SPyhXQl+UkkffDQ+D0eS2wfhDPE/4X38ZET1x2L+jIUhr4TTYIbhrwksEQhbXld3pL35TU9Pm971efzJvpVbE8BMeSA0NTmrByxnmNDFRlzr9WKHkXjuoWcSDog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420211; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AL9+ObBvOgdc3cCbOA648YiypEmQetFhFJcXq40VBmmBQOW4EVHDaCw3efLLtTSpVQMUpPLIotrEGtaoWxav5VDWp3GGpKPowQV49XnwoTZ4sfbjILSl7+NDwcFF7Jz3jnYF7PnKPWjFD4i4R9XHZvpsbK8wuJgaef5XJpXTEGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjFsGnUE; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjFsGnUE"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6bda350b708so911200eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420206; x=1790025006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=OjFsGnUEbpAqGya41cP7mMU4oHk4Nxv6gUrg4eYoUERC/WZGyNih53fnxnGH7KOUT5
         sdl/BUlYPnM+W1MYeTmrEqRSCH1/8LOqdmUix7uUNot9/sk1bfytZHZQqkXy6nW9IBz/
         dDN5v7ZR2b2Qnp7+Xw5wDGRwNQnh0jwRK14fhZLWtPm8d/Szgz6hKO2vLsNE6skyJBrq
         y+vLYGVzQ5LPdwTu3iDfqKY3zDM93jAy4K58LlxMrk/C8RCYx/1kqK7KYMhEicSNZwao
         MCSpPip1VsfDk3qrtfNmWjRXshfoIxM7wLgCAMyc5t9TnUx3+4mWh8iiZTzQW/fz2HPC
         DRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420206; x=1790025006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=hSpXOPA4f08BjaO0UM2/9mACS29/EWadNeo7vMMf7Ldt5N9srh9qxuNpoOMMD3umPM
         lOEG0+YUy1ey0uBU2w4hzZMzFn1frtNbnby1PZuPyK0/H8vX0SgxDMuUGSJVPrOMHxQR
         4bfo5Mw0Mji8SLl09KQLd+rCzaPLta7rPbBYEQBinhDqfMzQanpmHjd1UcqWDJjZaYvZ
         zdZwVlAY2HsGt4Q3Xz5K511DlQKrszpjEA5Poa0ZuqdBsg7JT/SmJ3k7lLQb9Q+kmqLR
         D9g0SVdEqqRTGaR2WHHambikpHtojDMkvtUXpXNO77OLvNsx/eXLmJWkVYGB/P7RTRGY
         Z/Gg==
X-Forwarded-Encrypted: i=1; AKwUvBym4HH/ricNlTu1WHqcUko5jg7VMGQhtVfr0hM8PdUrktZRS7lfRt6GfqX1Y0I7Wvbh4ge6QP6ZZpwJXwk=@vger.kernel.org
X-Gm-Message-State: AFuF++m2/XgpR6FSlQHsP4KIqic42Y19ym0xZNm76ckavdkHOKElAQet
	S3lFXoHMGj34RiJwXfshcX7nkGuOi/PsVS2jB6ONrPKafRnuuC+/rwvP
X-Gm-Gg: AYBFou1wER0ljeyZf1k9elqqhyT1ecMezsymXC+bzUAV96keXN1Wpx8F/IBwHZ+QDSQ
	nbyltlQZ3BCPFsE8lmUSMRgeOrTAvmZAeoNS2WcjY81U8Rcg022G4z45jP1AgS6fqVUq3cKDNzd
	40Zf3nZx37+yQHtZQLKF2/k4VhQzEMusRFVkaBFCoidMIYphoK7loSfBdBS7O0GD+mbKdqyoi3M
	MGiRpY8KluDoM2ZWcH5MKqkgoft5wBm1sRZupe8egPO2QP/Ocwbk/epg0rTrRHqoKOcYZ9liNqR
	NuaqxVnjvRzEqeG8Sb0MM9yDRkF2zlwWBQF0l8vG1I1KswkNR7JWI+fpX2ssj+LfG9xEQzXKGXn
	+N6ymVmkSYvD/g8Sv+vwDszbQV9me0Mln48TLAEGWCJOr0IogyvRpa1KrAK2/A/5emg1oAjnKKW
	tdjqOP+WlHGqI6sEIrX06RK2fLcBr4Uj6n+13kWsav1LP485nbUnb0orMSwzs0CSY8DO9wGJTng
	rbflLM+NeD9ObdREnd2qSZWcaPFhMepfx6cqroMbbkTwDPDJn53v7q5oYBGUDYAGvFE9DoSBNb8
	EmVY6qRMVqwEyBNET7SjStcGHLNNmNQ4ULaeKZDvYtjd0CHJgaFxBnSWxk+gjEjyqNGeGxLCgOY
	qpgpxzZGAsyG+h5oSz4oDdAfgHcKc
X-Received: by 2002:a05:6820:c85:b0:6b7:8396:f3c4 with SMTP id 006d021491bc7-6c541457fa1mr2615579eaf.38.1789420206238;
        Mon, 14 Sep 2026 14:10:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:54 -0600
Subject: [PATCH v6 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-8-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

