Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028846;
	b=TNXrQPnDJXO5sj32vKsKj4ZLJMI4JpxVNbacTcHM4sajRoNC7o0wxlLzsLIk0ZvoYuv9
	 N2aPqjNXozMCZUbWuPGEwBTk2MJGs95OnohdegSmCD/S7CS2mKFlPx1JJf+KqpZt7ihHq
	 +UR/Gr09y+1QBONb2zHGCdxiRvY8GCGOwBDXK0EPDgAcoJFHM3jNZvpY6kOf3vOLbqOcP
	 AWJeY1R0QV5HjYVLRlKvevrzOUSGyYrkh6yozHcFypRywJmtsgeqQYoP7xlby1lXNDOpV
	 d3PZX0Ofmjh5ML3kBIrbXpoKJXcCWqInnC5oab78qkNUXjJ0jmvuzfR/FcJn+YlPiIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
	b=IbRJuCssB54pZ4bIMTimxnnZ5rbq8g1/MzjqktwV2GVsOHkgtOoJAnlxSsHaqSfi5kzX
	 YxCUmPFVU3oChQ5cCliWsOBGZKn7kwvO4jTZxuHcjOVj0Xn6z2B1TC9vZ/zRRuRj20jU2
	 bdrdLScxqcrj/Rbzh645iDEqBZuurLVGts1i2tDHZOKJXzCN6QHNkhUFjK5li6Wa4OmpJ
	 +BpFABSww2Uhi7NOlNfvx+zHGWAjeUWeSOVrAqLr50brusJluaJBLh1tcJult6C4ZwJPC
	 GfFB5DOpPuzKtl2wSkfh+TUjYiHvdMLbXHXU5XGe3t3kOyx/CjRU8l+XQ1AxPknpShg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s7SrH/my";
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE129606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE129606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7SrH/my
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-563a0462094so643240b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028845; x=1794633645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
        b=s7SrH/my3/aCBubYnKNX6Vr1kLtOLjg63USFilh/1DnLB0dMpLYbFb/EaAwMPcVnvZ
         OXYnfkRuRx+8eGqEr7x+rujQ9NY30yWyA7PIccWIn/EP2Loa5IFWTLtBGT5N8DfXNdhS
         UnnYEbRovoChfQZJAsvFszCQk+0v5qlTuH8Jtm6Sd082bSMRI6no30r5SmZidxvrF8Mg
         +iwRu3HnY8naxMqezJKDnRnLUjAniN0J6THfyfMJoyrM22P3f5B7PmIFAJCcOFSHpfzR
         CFsqy2nyKIKfaIm/QnJcmtCjlMxz5NRChb9vnzGvw8I20hRAJdWhntDy92pWD/3mGuHN
         NRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028845; x=1794633645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
        b=r7C/pUJCJkAZVMTLhoyHvybhPtVqbLgxZ3eD5ZFBo9AVrfOZsJejupK47Tv6RrzDGj
         1nkGl2wKobik9QFV0wsaW+1RGE8dqBpVy7yhBiKtR/Jq0/UB8+AGghR8o52670gM+c0w
         fZDpE5IBb+kdpEJagPzt0SS690u03+pXzFUGPXYCZFtRn5f0jvxVQPPqXMFu7BiXm2pJ
         xHhMa7uos+vWLzP+VLbf8y5pe4KoU023uejEXXesbiZAzj3grd5LRieIgdTQBbaSx/xa
         UaWEH1H9I6wtLXIGIsOeyaLceMWugNuxvpDMBiQZzwf9cThR3spP6pIOz1eLv4NLseAP
         7cmA==
X-Forwarded-Encrypted: i=1; AKwUvBxzClDqe5dbbgQpgWcWHVj9az2lXSK7KaHEhRBg+ZqrABzVAkz9IpkHmJ/JBF9Tq10/LPZPiPqMGcQ2Bj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LrwpPlH0NntJHJhIjmimFp+z9ZUmFT86gbgj9wtEIrD6GcrqY
	Kf24SpHz0G8rgZwM7iwP+RxlM6moQ0mXrTmQpJyYsaHQfNxhq0H2Pz4Z
X-Gm-Gg: AYBFou3BRqj0juNb1sD4KF7pBhrGknpMMbF/HoX5q5K9jKR7moJWysey8tFDef7Tupr
	4XuuJhYXanYqUn5F6GEKyQeyXENaieNSfKKC2hkCZfiNtvL0ovBMK71fGU+AQ2M4W7YNKb+YT2y
	3bBkK0K6s3ENW7oioTo0V9wIEfRm5ksr9nkluqQuwmBl65GigxNuLDvcPWHNV18/T1rZ8hQubuy
	VxClePu3LvHEKdE13PWbQzwgyPCdILc2zohKhpBEij+WcNe/DHONgKt9mFsAbzmf8WTj5xfS4/r
	cY4GGsbIVgB/A9zHzaRiAK0JT1XFqOmPd6hB6LtGTwQ35SEmvzEmJEFkxdyBnNh7VviprYqlcWM
	N3f96GujH4KCJYzLuuy99BOnoFJKOONhn1TyUuIALAAjOT56WrdEejf8BEareFz4xi39URqNPLY
	8mKwKel8el8LTz61BH42LHrWPBB7Dy7kj1sjPGZh8XVJeaRCpRzI5nc3Ys03Q2/81L0Eh1AZfws
	uMSDd1a/0bOzIJxmYLUmwc+lczjRNUQ58MHv2IUBy3ja92vbvB+7CSMrJRM5qU/tAgahtd5eTdZ
	RB4nRYXUvbUHjiriedNGa9qvE3OwrSq60QPOqLPdOoL7GbvZhLHPmcV7pkaH7+GhUOg2v26BJlM
	JPiv2API/ifikC454SdFVbx0PpCCVwskutG0JnrI8Fg4RsOOYq6rPyrkiEtn6f34aHyhyPzFCih
	ftDvbXWBuxXMQJRcPv5UmGRbsEaPGptp2a1a/zZLyrXMC6J/hfW8n4Sw==
X-Received: by 2002:a05:6808:1244:b0:539:4d53:1708 with SMTP id 5614622812f47-567e15e074cmr3293716b6e.49.1794028844621;
        Fri, 06 Nov 2026 21:20:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7ebf4edsm3059846b6e.13.2026.11.06.21.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:20:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 06 Nov 2026 22:20:40 -0700
Subject: [PATCH 2/3] mtdchar: bound OOB reads to the data in intermediate
 chunks
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
Message-Id: <20261106-submit-mtdchar-page-chunking-v1-v1-2-2973a03531bc@gmail.com>
References: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
In-Reply-To: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

MEMREAD limits the data and OOB lengths independently for each call to
mtd_read_oob(). A backend such as SPI-NAND continues reading until both
streams are exhausted, so an intermediate call can read OOB from pages
beyond the end of its data chunk.

The next call advances by the data bytes transferred, not by the pages
visited for OOB. If OOB remains, it starts again at pages already read
and returns their OOB a second time.

Limit OOB in intermediate reads to the pages covered by their data,
as MEMWRITE already does. Leave the final call unchanged so SPI-NAND
can still return additional OOB pages when no data chunk follows.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 19d33dacb62d..189e462a9df0 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -769,6 +769,9 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		if (ops.len == mtd->erasesize)
 			ops.len -= mtd_mod_by_ws(req.start + ops.len, mtd);
 
+		if (ops.len < req.len)
+			adjust_oob_length(mtd, req.start, &ops);
+
 		ret = mtd_read_oob(mtd, (loff_t)req.start, &ops);
 
 		req.ecc_stats.uncorrectable_errors +=

-- 
2.53.0

