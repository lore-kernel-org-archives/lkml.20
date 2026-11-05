Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904937;
	b=VcFKJSK7CVejNVEMfHFN6VNDxKGMGKXEQ4Dzs7vczvfvxhPfnCcu8NO5PiTrL6G7LpIE
	 9O5Tl+hqlpnrbtgircagEb5K2nUkd+f2cD2SGi7aqM2jvhvU0EedvQroykWw3tyOmh5Jv
	 giO7UH42OZXyTX2/R9sPDw+obNkT0BdaaWXyjenn9KElbXl9LbsnjPKzx6MT6xFewZXH3
	 dzEYIz7RqeMYH2+blMggdMhTZZJvU+lYJPkKvGDT3Zq6VtNkGy9XliS+wV+WnGIa4Qr8O
	 yYePdC1Dr4sxB4W9qtHWgqTQYwDszcJit53jaameSMyqtzxlxJNRME0QlCODAQpsVpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3diKjpt3Hplj9bun3k4VWxlSuPRXvr0bzFEfcX1wVKA=;
	b=GXoEyErq9dV9ykRDuf7ZK27lqV9ZgQ/MjoGMLWgwxmu/dBYZV8QftgDjXI+bBQMiuwTm
	 ff9t3u1MlakqI29xEOybSciXcJ5dxbxZtDnwrBd+/tT3t2opJKVhITrOQSyTtYZovNiRi
	 vvEGQW5bOfWo4GDV6+qfl76w3tEtkA5PDI05LtH/+AAQ87c+E7eQWAX4ntegwicn3EJYi
	 zD8praHpDl+xMR1y7eC5lUXlgGcd8pD+56Im5INndteUfI7O+OxaP0L8hGn0eO1xuYFGN
	 LLlXopB+AgQVByh60YfveyKmime1LMPuFXzgyR9Wujk7WPBACSmi57CPBePw8OluQfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iw2igUQm;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2C606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC2C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iw2igUQm
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-703be215729so1031783eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904936; x=1794509736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3diKjpt3Hplj9bun3k4VWxlSuPRXvr0bzFEfcX1wVKA=;
        b=Iw2igUQmPeBpe1ST4CmczMXSeIBReDlzUj5eOLXUJoKe6UtUf0ruYM+hz/PheAKgtH
         5dwxr7P76NzDBvehM0zg8kw7wFfoMwkCmb/73EY7VFXMJzq2xidnH9wC9YBYGXgjl3MV
         YfnrM7B4DX08Js9EieriNi4rVeOsnZYa6UoVXCnWorSBKnyHT4UBaH8FqYp1Mrto+0Dn
         LZB/pbhfQDLkmQPqIJ1FUJ1OcC0k3/ucWKucieyNkHyQ1VRlSOU1eAjWXXzgH5vWlqUI
         exyC9rWIKwyybPoCWPLd4uj0SThowF8K62E03W8Ble2tuicYkp9O+mbKvAk5kojGz0jR
         4Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904936; x=1794509736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3diKjpt3Hplj9bun3k4VWxlSuPRXvr0bzFEfcX1wVKA=;
        b=FIu4cN6SlNDhBZSjAu3OaF5CcZ9lD3ld4k/SnWl1Dwz8c2EWAufuKKzKb2Z8JhdiBZ
         /zRn39zP6kf8+CDiicYdHsGAbBC/tclk/G5ujVmIPyUT+SZHhGqJ5WU5g4J8x+lzq1Vr
         9Wi1mCPMApyrZl5LBoGItNCZBBu9IEv1XWwqb2DUsmdh74jmwbxoglwjUalE055oygCS
         Bs0scZJ0PDJQca3J8LipBt6izJnKP3fl3V1CHwzbhI1Zr9cz+wmkrtFTOioVuGuO4FRK
         RlKTi+j+P3OQmJ3uahIUhHTWLhY2FCym6kh7/R0ZUECzZ7K9mLDoC+ovNRT3XlvVnnDi
         ugkA==
X-Forwarded-Encrypted: i=1; AKwUvBw94Ei0vxhqyfY9mQyIXSIpfU0MflZKfugbP2xFo2/ez1kyWLMcgIXfqcMNLheDw2eOyRAmQE+KC3l4P54=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IGvGxjMfAAuvrLTy7k3n81/aN+DfwpY1j6P9WzmGO8r71kZ6r
	78egbD2qYEeQcE/PVIbRxoLgIH9MlKMnQ/nROyu1TEBKZaFT4F8GNwYi
X-Gm-Gg: AYBFou3vKBGGaOTnB/QdYvm9bTUEpXdMO52mbkYGPawyul7pgmaGDUm6kf1mTughOtn
	8/hh99xg+Fqax16JyUGx1XEXy59lHNqlHgF73by1L4siiQbScQjUlwLgntL5JHzl/IEQPKXoEkr
	N+uscI5bq/YpJ1xw38gELd8qB2q6lvoc8XwYv8dmiMI6S4BtvcCX4vUPZu5aX4cz9fpkv3W8ydO
	pNyknazkUsrNBEe6F2Oq8uIqH8UvGfVEjzW5iplh5llEXt8eRqRK4Xi+Pud9PaoEPV2UsIg7jl6
	1c8/0yFDiVKuhdecLr4wV/hkAmWzJM2nhwWIFdzVSB7W27lDq0YISb8pS5qBKOHqfFez6On1aJs
	eGDg6BMojPSpryAAhSnresr9gc4LK0Tf9+gI1KxY8fwilT9pU49egOS/ukL8E++rDibucibHWy7
	7l0depq2j8ihL6e+jpHnGp0PlB/ATCaqaMJoJTifdQf2K0bAAHXnozo7zUaCeO4GCzr+BWP8px8
	aeHZI90x2N5ZEuXk+2eYfrvJpOHztfqL/9CsUMEmnA+z9nds+EsSTcFzox7O74ObMF7nVZgWN4c
	Qmp7PbFo0RP+hYhCj8ckTAjqsRzrfAxDkf3/PXZ20Y+HAwrCsPex0M8OEOg5I61LFOaJ1yiXmXK
	d/wKXQYcP7hnjEx5uBM+PPzyjIXuyide+osx2+SyWs/P+bvXq0NSJ+WcRiaq2CbaDOFKikbnmPy
	8qemr5Uarvr4OAlesPc9nrgLubNW6CDuJdeXJlgSGVwG1duzCd8VIR
X-Received: by 2002:a05:6820:7408:b0:6d9:8a4a:7114 with SMTP id 006d021491bc7-716e790c5fdmr232093eaf.48.1793904935633;
        Thu, 05 Nov 2026 10:55:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:20 -0700
Subject: [PATCH v10 04/26] mtd: rawnand: sunxi: reject pages exceeding the
 ECC step limit
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-4-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
Hardware-ECC setup checks the strength and available OOB space, but does
not check that the page fits those slots. NAND identification can supply
a larger page size, and the NAND core does not enforce this
controller-specific limit.

If enough OOB space is available, an unsupported geometry can pass attach
and reach DMA code that indexes status and user-data registers by ECC
step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
number of steps must fit the controller even when their user data fits
the register bank.

Reject excessive step counts before allocating user-data lengths or
installing the hardware-ECC callbacks. Check the final step size, after
strength maximization and the conversion from 512-byte to 1-KiB steps,
so valid geometries retain their existing layout. This also keeps PIO
fallback from accepting a page that the controller cannot handle.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 662d96fc2535..1a61f608ad91 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2223,6 +2223,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
 	nsectors = mtd->writesize / ecc->size;
+	if (nsectors > nfc->caps->max_ecc_steps) {
+		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
+			nsectors, nfc->caps->max_ecc_steps);
+		return -EINVAL;
+	}
 
 	ret = sunxi_nand->oob_ops->init_user_data(nand, nsectors);
 	if (ret)

-- 
2.53.0

