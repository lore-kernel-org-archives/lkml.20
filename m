Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904949;
	b=RLqZIJIH2FECf0lVNTO1bUX6fCFv9H9CQnXmCPIBmCx4KY3qWtSO9XKjgIWE0ZY3dY8h
	 VF4H08Pfxhw74mhEGEWheZDocIWy+rDNjyJOhkDUleM0gjFMJ1XByCk65GcmrSAsnBh4R
	 5ZU4tpIWcLcEk9Ra/3rxf0nQsv6YgVrVqX/SNJDaGi0HFQMgoO0W6YjC0FYruz6v5moDv
	 1fGh1J8jfVAKXTj3Sjzh28KgF2OZgcCxBzaILB6uPxbNI4JR+Bl0cjV3tqAvbtEE+rW6M
	 13Q7SxjiytMMD3aywuXL4nwxIJjvsI6HPjCHAMFcpiTk8Ew38hdHhLEuj4R4oVdpOzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
	b=UbgQE9CqeesUvnNHEahPZxCP97EkQHX1J7wVXsPvtBH+zDEBvku5uGv3JCgi0ZpduqCV
	 dQ8LnxVjYTOIRyz85mJOS8Q0d06urLqoNMnc23OQkUMdR99fwMw363XVJ7ql0TRa6HFGv
	 kLPTkxUl44OqBdHHI+tVvUxzoou+lZ7sRi1NkvKSJcoOo7UdHl+b6tpU96X2jwFLUxYlD
	 +wipq4Xd7ORApozHfC4Kior5DbMp0Z4QqupcmaSyPF4eMgnn4bVvTUfArXaKK4kw9CkYw
	 52gMrydmSzrV5kP4c6+eH3rQFpZKBaX7ivtdx+X2YI1FX2jj++zRmjtxcS8IzRrZrHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IOci829T;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ABD606D826
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66ABD606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IOci829T
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-716c0217635so977605eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904947; x=1794509747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=IOci829TO81PMrWPJBj2LZ9u1eWY3RsuENPwu9zrvv9WxrplG8PeUaSqxmYrqks/n4
         pqJffyWy6dauf1gkN/effxjU2ZY2ZabbUBtjWE1Z9ke1KK0xOikfb3V8vGZh3myX9JlF
         IHWnA7+gQZxOGspkJeHEidMuHZCVW6uwrVU3HNeTxQ4vUHXWtiP+hxtYu4NTI4AQZYKk
         ZC5AGQN1NyzLYv0+Q+q96NdBijqSgoCHkUnsOk7NvkwSoA0F47+u0EJAKAFf3/jdcYVJ
         I+3iYEtmvBcXnIbZsRE3eqyGfKkOAhq/msq9zLNq03tc/cpqiRKSzttFRdm6AlCv4FM4
         EMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904947; x=1794509747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=cRattalZSTw75fUU5uOCcdHY6IwF7IaNWxLs+dHauKZQbPLXF8XdaGT4DwSjk3obDA
         H6cKLPJKQpli6+WOLTXyfdMijdCAvcUb+QaA+eYAGeoR98H+ZzGGDdYeiWIMmo6MM+Mr
         5GX9esXw4e5NzKIyrVX1vDc0Fn8tz3ryhss4GGq+J1XKQvRA1r9/6A5BVFXx+ZB+5gK1
         UjtfQXxqlQleHlormIBiXoIVmLWC2pfJA90UiAqxJKWDmTdwB+eBTUQSk3F62d3XBvi5
         aDIjbTGu3JtH3d+wfVpgCTTBMqbGBLUjy1IXknmzmcbERdaWov2Z7Wdz0Nu/cJeaAT01
         Vt1g==
X-Forwarded-Encrypted: i=1; AKwUvBx20JHBtg+4oZtZ/N+un2ILUt/jOKP1b98JrqUnH9KHUIdRa03C9/9SWbh54iqajHHX/MFNey45wQkEJnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1c50KZewg5RmLb+7ZgGVGgoIVpcrEM4yOAH3J3TQISivrEGMK
	2xDnEfK8Iy4HFjZCKX+jjZoHDjF3L4nO7ikrw2/Yd77s+++yhc8QZXBk
X-Gm-Gg: AYBFou1nc2gcD0rRLyJeyEbXgS+18UD668lPQ2EGaOMjMeES2rRHRUyIxwr6bHk2I7z
	CFdYHXA6Sl+4we+5Sb959FjcBwS0KOu3BQJlUhCCQ7pyCy7+6i7n8YBiosa3dj88kaI85iSK0rG
	tQk+GB/hZU727QvIKy/AOVsYTcY1m5J6VWZn+nR0sMWBif24ZmFNqxCyb8raaod0Qd/whMgQpI3
	GKo5X9ekhvDQw75p+Fsg04MWtuf5laDCwKKVogtrQ1cfHb8qIIpOLKWHURrBUgfsN5D1fzQwww0
	lTxaA7yQlcMETUbgYq3vRESh6EwUjx9WwQ9JGX83kiUKPt10S3EyBzPNGM0ST8QQGHqb7voi7xW
	iC5npo2jLX9K68J0PxBNuIp+ALz4xtRelgsE6mm9WOxxbyWYFpIQU0uydrIYOCIeVUBkiKfkpQ7
	fbIWGBvKa4iwLqgY7QopJZ7GOVxwlYvO12Bqd9tEmSAEVsXWatwM/vFgxGu7BmByhb4VeGZKVdC
	Jxy6c9B8P8+iFgWCYMl1JXmjzyLQMILl49I0gBxk3lMb13yNCq1a/Xz9VPWwuIYwUEabeMO1rr/
	bS8BAhyxrEZTsxHA56F/1U3U/pL9CsS84EYSzXpT4SfqGy7wKZsTiwumGMPh9kIzrZmxGDsj4Yp
	8ycVvu0S8MN18OTccAQL7AQiCW+uVo7zmsxprcLBRQ1IIrnrLC/ZYenbgt7nlCGBBySDuD7TKPu
	C+XnrLCxjbCGz47tIhwgoj8eMkQA8qWYl1GIJy7PifaGGuvof/hYjb
X-Received: by 2002:a05:6820:2308:b0:70e:177b:eafd with SMTP id 006d021491bc7-716e78881b2mr244556eaf.16.1793904947324;
        Thu, 05 Nov 2026 10:55:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:25 -0700
Subject: [PATCH v10 09/26] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-9-dca1f6ed29a8@gmail.com>
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

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02aa02d2cdb9..e952d7f6abef 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1125,7 +1125,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

