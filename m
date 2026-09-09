Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A2B471CE9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942666; cv=none; b=KPewbNpTaEE/inLbQWswbvGLJQjL9S6WomOExanHHMBf7jmPocYpTQf/kiiAQwGNY/h0034hef1ug+tRXT8woq1n0qqQAD7+XtZFfMgvYb9eFsAiI2LuVKjRhPILLktn6oj0LPoWQxqxDQ9eGu+ThR6gtSeku90RivAh2KIAy/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942666; c=relaxed/simple;
	bh=E0Hu13NVGjVcdOOasuN/FpRSk1aK5eY3ouDDcya/TIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiOSOYHYHIl9NSvkan7rPzj8x5uKA28VKPQ4ERzqgAnhhsV3cZGy2F8apgELNLNao0D6LemhLk43cVxwCo5HDlNoWpy5LlvGfoPDVpFPmYfkZi/9sqNhsiULgxXoX80S6zp+1+Lj+LMUZPgAO6UyPsrgyjaCMQUMVAq2w3EGaCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+BQpDdk; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+BQpDdk"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f5a781972fso3769281a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942662; x=1789547462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=E+BQpDdkE4FdCIXjPuvlVP8rPJwkzu+vd61j221VllIWWCeSNT8xHOMyRbL/rJfwSn
         NYLIJqEymlC6F0YI3mpDIcJ2Ye0sMtsu1w3q5HGd5UfyhU+U4sF+Fg89d0SSKMhHp0Wk
         vujhNH7HdVCkKPYBodTjUXjZ0mn326D4q0oUwlZXFo+xZXwb8dl1nplNhT5nqDSoYgxk
         6NQy6FrLIidNWlbyuCSLM/kO8uEWjTV7qWuI606GR01el7S/DHvJNgr/dg2GNQ3mbN08
         6K0GSvxrA4zM7/Xo0b2iJlAZsE9TaddzrQJNitgFMnbZxVGJxlRp3k21pcGlaxqYOHe4
         secQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942662; x=1789547462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=E9yUrD1G4G5Q/IkNbzdPXC5bst1HNrTr1ZCiPTTWUlsZPGbwodSxBWJ/SyEbvm69cx
         rimfDO6ikAJjZwRfR7TnFr/Nmnj6W8U3KiJVeF6EOpqs22v4kh0bbeSq3HpAvDvT8QPz
         Q3l1YWZfD04/fT0iy9yngiz5tXlwVql28rIXQQqW/b5sHXMslkxP7bwlH1ncFE206OzP
         cs2gPprQBT+E0lgycMVxZBeTfOGNPJeLkQsv5U0q3aD2dKE2OrVeyuYXpIjfWL5Ql6Xb
         tBnUyt5WJS1tbFWepN06swb9Y2KZklxO4edKQdzKbl9AvUZlh/SqapoQL6MqIG0n/mmY
         Cz3A==
X-Forwarded-Encrypted: i=1; AKwUvBxjMN/oScED2OHpDaq1aQClV/nB0FkRiN3epC3kHaCNmyuKVuscoNWHshFUyQxQq9o0kQ5z8rtsbYt2k9s=@vger.kernel.org
X-Gm-Message-State: AFuF++nsY5UvrLm3H4IyQaAquJgXILpJzEmf9eCAKg1veDwCf44ho4xp
	xz32bi+Q84uLhqKRiFsHw29uBD7uR4+z3AZJSWpVFMD8p3sdxizvCniN
X-Gm-Gg: AYBFou2Pq0jfnfF4rEUFZq8hnsDB6vH0WtIVrVXun7VNyLMkBuJjmcrcnLtuJKEr/az
	inlZ+7YbJhqThcySCqImwzgifq0yb90j+0es8Wv2BukJjKJpk/1lRWJgFThVup1UG51JHaohiB6
	kDl+Fzb99tEeEboWrYHFze4S77kJ5v7m+34DmJ/RPABniuy11tWcdUkgAPUVgIxV6iu1T6hP2QS
	qLKMInCJceCmpQeKMfts11tepOV+N1tR1sc7mvIo/ougSNitjMjG+jGEzbSRXnZMItg40x84x/o
	R7TmhH003JkQsqtUfQiIGHVyKr5BfvRbBcAJkKEE9OTUrIJoGEEvMhDhRJjsV/la/0+alSgOeLO
	Uj2Uvmjnv5SjJLEIBcK6yGVar2xYRNPFSg7Q13R/mc5h4hJvuHKIw+6pFJKDD5RPJPOF17GUnkt
	ruSeszQmxFHVMQc76EkhGHkstT4EkpeXpA0+8iw5j30AA0czQhuEjwIEdE2viNKz5QMLGKtW6Ff
	zQ2KntWQ9UUXU6Q9EKZasynUlKomUx8hHKikSW7wJbE/4ulRiLFixkixDDm5VPyjTVJE9VZR7Sg
	HUIDjZ0RBKYcivO9FXyPC2XgMye//xIJJwjmsHWotw9fbRv4k4aeZPOcTh3qXdczW/ZJI9SnQjR
	HQ5GMY8Zu45WptisrucbHeR43/z9R
X-Received: by 2002:a05:6820:162b:b0:6b6:f16d:d672 with SMTP id 006d021491bc7-6b6fdfb6581mr30282006eaf.16.1788942662447;
        Wed, 09 Sep 2026 01:31:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:40 -0600
Subject: [PATCH v3 07/15] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-7-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
index 545da54b8908..16b2b39524a7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1497,7 +1497,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

