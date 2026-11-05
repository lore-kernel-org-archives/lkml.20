Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904961;
	b=bzx1W//zcqWFryaaF3BEJHxX9Z3ZTfWo+pAl+BX8cg+0LOl4kvFybO+27NCEBDR56TMr
	 NBPnAmlpvyXMH6Zjdut+v+uyC1ehFyEsqJVxm7xcEouHXQj1xy7+717uTxmi5BDHPl/7X
	 WozxS8PbH8stkyr8i9FmzDEs41ocatyfimsraZhjrrfuCYt0mlZG/AMkGRDGNs5kIsdLG
	 rxfDSWDCjwRDlOWtAlbZfspNht6NIZXE0euT1Wop3wZ9uVAtf++A3SyR1pO+Zeax3Ivsj
	 8sewJmKs9am9op18ZpRlhEBEt85DLOsrV2bHXNQCpf04ZcZCcBRu7OAZECn5QONX/7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
	b=L9RHK5woS/is51D4ORWAHcpmsxr4mVfd3DlJC293KyrI2/5Ui7TKkdllIGhC4yIEWbUg
	 XWVjpOs2Ju6acmrw6P1IrAopo9pvQ7AHzDjVH8NXYgS6X6nNjgObsogYyXsJfvwxw1z1l
	 ZpSAkvVvS2JCQKTCK2sVdEyT6H4V4VUiATLBpbR9+DsS6fz7ReoYVjACtv716eoLRDs9A
	 6ZSE41bBMNs7zX62w21OO3O1stF2MvF9TXFVBbU89Mdn9xPkIUiNZzw/qcq0MlXTzjpQi
	 +BcxGMuXZBHpD4fJ1I1ejNshpvihKboUWmxU2pKHIRHXxXj4G9l2poNCfw1wxugc/+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GB9tIId3;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1234B6083610
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1234B6083610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GB9tIId3
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716d052dc23so686131eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904960; x=1794509760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=GB9tIId3+JGtHdpSj8+SCUC05CYMqrh2iNDHeefPkLPhwIlVQYoGSLLXzN62bIvE5/
         VQfKsVQ4nrrDLEiHvv3uhnIZ18lyeNQIHh3j3dX7lMdt26zkvyuDBTUDwC+j9dcXiuWU
         sW9cotx2d9rXGJTTqFBtowipegZqAoG/LqADcpJOgRgdHGdIx5IOqyYPqYo2U5Xeebq/
         HnX9MLADFI38vZrnfeBIsTQtOhu/9iYMuOd2L9cGqjUBoZav4enZr/BC6vHqVSxD7+YC
         m47JblqnuWPMFX66foWioU2EoVpailTF36iPZXglXidZYHtV/wZ0bL+SqPqvC2th9dU/
         G02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904960; x=1794509760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=d/GJTDnhNEnGpXogEpdmg+walsZG3YUUJn2hcu7RqqmXD1K6BMX4rlKY7P/aPnEHbi
         hh6xp1Y+htjuKzFoFin28ETpuI3VOP1svzZAgubBu47CX6WVsqZj6lXiCYF8Hz5Hn+78
         LAwEseDV6mTOFJn74j0DMQRXxkaTB6+3kuo5tN05UwDSCob1yu0my1eZl1Fr9E+XNzro
         39339Kf8Swrg7MmhEEDwWYup3gpEi5pRkzesG165+4/0amY3YRLUBV4uVeOLMeaxHzQ8
         Guhojn5nEP1qkp67+4aEDf6W/dmim7pMo/4Lwdh6JveIPqGLo5cz5v9bTfk2Fpj3fMDL
         jzXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwna3BhVZ1GAxcCV93b+vHyu2ZMnDejEr3F7k4d0Nmx3EYxPQow02tnF7Tyi8P+vaIEa5zTNqYNKhqsEyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QwNDaDMqwbIR8nNi9dbZlFo6rWBrzPkHnmED/e4qdqWCwqDjq
	d2sgAkEb/3kiN3mBu80pRZTyS73OLFnLFxGXlTMy+T+/0RVQivD93EWM
X-Gm-Gg: AYBFou20iDPKxSZidSbkxE9B8+KTlQF/2Pkgcm6vmSRwRxH+1Tv8yGhrDjJxQIT9BNB
	0F19Xu8KH//8WyJdBuEQv7owinm1bcXHOgMLrHdSFZQ+xL07JKRnlAoqiTBzbNuBFoDokSZh8a7
	nysc05shbrB/sPmhfUsACLOxwEEAMhzw8cqtHmOsAZjeY6pxbISY8HZ8NFsMqQnixbi4mcNMlkP
	/98bZYHWpfMzyGCT19Xuk0kddLAbT2Xn9C1rtE5TNz9IFCom4O8gn9Ur2NY5t1mM1ffhAra/j8b
	WfwRhVsekyTlRSHtMniCC+IbYwfri1Lis32M9gpvBVlTsgZhYLn0dzIKmuT7vcJyJgDe+C06dSE
	f5XihmEeENqyH38jcP5r98SsrYxLMpahgebD4nCpD1FhtjZSbhzbZalnEw2OcDdkzv0Kc/f2Ju+
	H23v27sTdw77DXnkg6Oekb7wI8DzChygCcknWjF/wOqmxX6jh1ZQKE7HcT5uPc8b//88joYdU8a
	yb+SFdMBoZ0FOlKexzpSvkgaaTumhN+1ECMgEhlXczOAeGFOrBvYgkOJLLgssAyqrO/PviEpo4c
	boibnaUZm/pf/KYsLXE1tdgivhtt3X9bOFrUmSJQdvQmqEDPlL7KBcQoduGP2Hjvn45r2rc7xCJ
	ztv17vqSfsrioarH4Wk+44xsAA6DZ6NezhI0O4gqqkutrjH/IqNrZa6EsE03VoUidiEwuBaqOGI
	crhLht5DkQLfQaA35OcgDvVhMPLQddedTOmQaCqEJVfN1aBAFosicF
X-Received: by 2002:a05:6820:160f:b0:70b:9b1f:e8a2 with SMTP id 006d021491bc7-716e73de95bmr322359eaf.3.1793904960035;
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:34 -0700
Subject: [PATCH v10 18/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-18-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

sunxi_nand_chips_init() scans every child of the controller node,
including those marked disabled or reserved. Neither the chip setup nor
the NAND scan path checks availability, so these children are still
probed and registered. If an unavailable child describes an absent chip,
its scan failure can also prevent the other chips from being used.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 636a04f49418..3de9ed6795fe 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2771,7 +2771,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0

