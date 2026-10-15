Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C1336EC9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028076; cv=none; b=JjTTu37uhe1sS1DkWHAzPyLc56U1aJXqBDntGNCqRlX7VAfIYyFsO8ZaGVxJvHW6QzQxCKLBQ+UtYgOo+jhBUJK+K+RRHer3QggYZ9Ejh1CSXeip7iix13+k8tFFhB2pZ6owQqh5sZAmYzi9vTHNBXJRfBDzPc4u4lX+gJCscnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028076; c=relaxed/simple;
	bh=N6VYX2y4jRer8ibxun+86X1ICDnbdaEYXj+AGFjjsL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+lCAyoRKfOKkEtP8uRg747Sw0CYtNAlGR0D+aNLEnC1H5yz+3Cw3kU8PR5zMx2Pn+nXRfh3NtNQRjrumCD+4QebdRt0h6cUQXqAbzKHfnq4K2QBNwjwiyojbQTDOK1KPfTEsquFwo5HOdZpS+oj8KA7cS49TRSD8mZwOkR4ChE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyUTG1B8; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyUTG1B8"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6df7f544919so3160869eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028074; x=1792632874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=;
        b=VyUTG1B8s3ZNWJO+J4GZONVY9mU5c+06lUQvq5UaJR+mBAfO0inYau0/8NfkS41Gir
         JYDNNS0354JOS58FCTf3Q6QRfxUWdZx0atU2I3lzjdeQsKR4DJe3rSWFjix9NNY+iMGS
         OwP43OzyrP0L9Jtn4hsLD1PAATQK6eKUyex0dJhLy9J9U9E3fzJVefienD1xN8E16xhl
         8PGb0RrB8MXW9hRyS1vSru51hCOFByC+jzQ5k/QAqBsDuVozijFabrGJspm+4u14on0J
         88smIafnXDHDdf5/LwFaEUw5FNGXF57x4eUJhdQ28Vp4AnTANgSaBMD6+tyl5q76rYLm
         PNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028074; x=1792632874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=;
        b=m359Hj19CXX5q7fpseafgRy4Q2BHGE26HTGzHLBTDDUFfafaAhcF8+qPCv+Xh1V9hw
         wYf2Up5udm+UQ8EqPdX3VIZLNdkDVKAieFNBfD2GVhEFvlAABKWCSwcv28gaV1ftnH4a
         FCQ+/1Jip8H+n7IB+aONPhThsoOqVqA4xjoxK7x+bdIbqfr81gFD8xizaJ66GczoS4z4
         0aGMMAtc6o0jthqoU8kp6LfCg2yxsb7jLAm9B20jzvFF0FeCO3yYEM4HT9NNcg0PhcHC
         u+ldsA2+S2vvNYgQnl/lhq+BDI21xzh1uO1MKAZRcNnil0T5g2dzUPAtw6bA6o/xwUqN
         hjAA==
X-Forwarded-Encrypted: i=1; AKwUvBwqoVJiTFrKYrKYGht3RnWpPCV7iO0nkVjBRGOHv5uE6w9E05OJf5fDkis2a0POMWKq+LuDAglhX5jLpYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYFtYRb+9nV0S6vJyBpU01QxpmKt4BBdJKtIGsXy0wPtoljNS0
	uLSad2iC6fd4oRNlcQ2V6PP9J9Dvcbmks7Rh2+E5VUDgdEKmeEXs8tLLoQ7qB3E3
X-Gm-Gg: AYBFou2gt2mMdwlDq/3CUq4nce8kVCf4MMkOIIAFUV1aotwEU2Y9a4SFHE9W0eGNfTQ
	mlHrD5vAldSWGqiEPUz/OW9VoIU7aOvZJCk8zCd5V8UrFSUE0Op+M956XmjrdoDfZGPf2JvjlA8
	/S0DrI13Zt3CVjgZate+2iteps+mXerQ4kMx2hgrDAqIfmgkdBbkQbiyEj7ihooSq+88GmmVufV
	4FMMmBMDWbS5A2Hi23YS8dn/QpRkAoEhaYNYzwf/NiV167l6T+upaONvQeGvRw71G1kuBVjFE09
	BvovzGbjI519Pos0eZ3DXJ9etwycnoAgmRjdKW0GkjBf0YqC9qEsOtHf+fJ++SIUm85ujf0OjD2
	25frmdFwxyQpDRYouFJCjZ0cwGYRG6bLaZOCn/tz+fHhmV+aU3GKavz88eU/QbbWtiaKvAECX6V
	fA8NBow6dJdKhoj4lHIZpukWLQkAlQsn4cte6Cf1ItLibetn/HmGA9D1EAuJZMcXg/BQMFMO8kQ
	PhugJMW9KBM7YhScPjRjy4BjtB8v0SNuKqqPIherKiBxrNHqjjWCGTsjS1ZvQkW7BllT+YNYigD
	AuKmbvNm5D/l/BIZEjP7Nvt3Y2VmJaAimmSk+u2oScagn0g8i8obnTt/pc3GeauIkzJt3BCt1Dl
	RK2uxO9scop0RIjZzYStJ
X-Received: by 2002:a05:6820:81c6:b0:6de:1071:8b18 with SMTP id 006d021491bc7-6ef107958eamr11840974eaf.75.1792028073754;
        Wed, 14 Oct 2026 18:34:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:59 -0600
Subject: [PATCH v7 12/16] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-12-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

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
index 8d83882592de..74fdca27ba10 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1612,7 +1612,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

