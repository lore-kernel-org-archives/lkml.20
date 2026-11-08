Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181787;
	b=bJ3bHaihqNf+qTky4VonHQGQxVKFK6f8Em5VW8sIXqTuCQF0J9A7J4cgH4sTtYHhHCpB
	 46vNsyZDq9cAaFo9IYepQb1scLAv1wlwpHTTv3wguR8/2UxGw1DeCDJ/AVOUZ3OEqaxBO
	 7bQgHrxHPXPTTTRtJuGXcFTZM7QRAwzCBWf9OcLol034w2yKlBjYxP6bXk3K06yAHUYLe
	 JbgeVdTkFyxN3iO5PsD9XknT7bGcByJdjnxUdICWSHL/NGV/ildVfQnoWa5XA8uuUhbFM
	 eHconHvaG3/V8tJy8EOrbznaAQb8q5lPWvsMxD7meSz8engOFZKM1Fd+SMBOYf/SN2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
	b=HrwNxII6fy5mFW6D6fYUJprmTVCwCeFMNOrX8sF3VoUGs8jqZQ1ZFV/H4jlFi/rbbyNZ
	 xVuQ/DfgteXihIv9c8efofwo4iyoIyLYWSTc4wBLKPdZY4aNb9gtOjPvg5Fna9KwURiCZ
	 AHJWuReOpfyYmNr/L9reC2E/CpgbLzwERWN+v4IMLTIdkBd9sxyzeMX294iqtds01DKgs
	 vvp+ELAQqEIwcqSBB1zRV8nzh3XH++OaATmWDPJ8xzgQ7xRq4oMvLYN3tuFV1RXlSN3BR
	 Kb4b0gx5z/P+samTqgks1ZmfzZK1zEIOKKQUIRckCqxszJSLAeagmiwXO065y8hO1tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewze5ooo;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBAB606A33D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBAB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewze5ooo
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716d052dc23so104134eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181786; x=1794786586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
        b=ewze5ooo5KzYuQHzCcGtVbT4jSRGv21SoQ3xYorBJLeN24N5pCG2tV5Jy05srSrsm0
         DGw6b/5TqvDmi7nTDgKFIEMy6g0JFkPvJYecV1oP9JkIbbVPhaETKopo6lqc6LKuQDak
         yLmYtZdExb+aqye9/A735J2zBPjKcD2y94cBAuYAI3hnJCVrid6H9H7vdKZWf8DMnuv3
         GUI6lum2TB8kQ9xagtXAuGdd4fFbpNp/cXsY6y4uEs2tobtIaunKl1AitGi7Wjff6i8r
         gEOJuIVuvGQ/WMUVIo3auTcj3lS8gWJ3QWQv6B+An8La3JB9oJBg+1eV1wNzDN2ThUeX
         /E0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181786; x=1794786586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
        b=0NRtMimrW8yWBkRM3ZlrOT5hacXksOfat0e7sMyF8rp3Lxny1FVlS3tXOH8RtqU6x+
         18Ryu6GY+HQOhMyI/QWgvwFpOmpHQ00708J99wQvVosRl4lIhBtv8mWc/+sRYD0xMz0r
         nEtCaZsvGiqoQ7v57QdbXrRAv9GFJ0oyz0OF+Q1jydZScqOCGcEisYvZn+i20lvpqVJM
         ibE0kYvMzPxyC06MkaaozCdVcrKhfncawO4CHigcU2Xlh1+4WDLerV5ltme1R/aMHXFt
         XId5rvPjcV7uz5s+moCq1F7vOeHHeCO2gGhUskwGdoV6p+BTCFScftjJpMbNNoUv3Ixh
         yy7A==
X-Forwarded-Encrypted: i=1; AL+hErEKgvnRKF2mFNGdL0joVGOJF3QXnQB4QEZRpfH2zS6o5sFhEKBgGp7glBGf9VpRyyiXAQEOyEmmDenJJzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z92aVUKfajwnq4O2lJwE69EfQ2Wezy4hnNwZ2iBpbJbh5kbaGvG
	QH4twdeAePSW2GDv/ZaxMktv23vwe4KtgLtx6eZHTmbAgDpniy1Rdf0o
X-Gm-Gg: AYBFou1siOfhK6HlvydvsMt20LCjPqbSB7UnxJE7YUf/u/2nl0v74EvgwOoETM/+dPi
	genPuMuaCLgI1S6LRp3GEaRHhyoqOFyg4hSgjX+gut1ZIFEw839f56HSgZX9SBaiK2ibR38Y9vA
	dTS7inTitSrVspHtIjC5pMJH7BWA3w9FNDshA33Vy2eTsHxh9vjnC2RZKYNSdyhMegDQd8wEwGx
	pRpg9do8k0znIEIC3zWbIN3aihbDyoTkb8fOq2gXkbFnXvQ/wbk3i7mUGGBoZBMpULdX/JbGNMv
	9tbw2oxoUP1vvI3Ph7WXbj7cNczpJvkltN5EA2R1W9Ufks5RgnP3Dtbh7rRfCubcnkqArxXjXem
	BR5shAi/gjSdzF/9LgUKtumf2ftmsbeCnBaLV5Y1oDS/hVq1kksfg+JU4u3s6emYcvPyEdQc0MI
	z4o/9QWXiZjSlnyAYgO5l9VvGkcO+ts32Hh1m9ZuEcL4T/kPBznI8X+dxHQwGNvAu5iauCLuhkx
	6UZrNPW6uY1w3Ze0M/z/ENADOhBmNfTnXBIpkOmrov2Cw2eIQiikyC3gLRJDNsyTo4IBolKyV6b
	VG8ne5JL5fdWV4R+4Y8XWN5pt8xCFIausSucMys7P+X3K/GkEMCXPhDyblE0WTJx8UE4VCKXpii
	/ryIAwMIPJjQWpPOUuYox72pFgPt+GytVYUf+0BibCS87sncP5ZbXzJ58+rwOfYdWiK1GVWQmM6
	9Qs674JkeTaHdFXKd+3Cxqxzs8zD1oCIV2nUf+KKKT547L7bdER9U=
X-Received: by 2002:a05:6808:4497:b0:539:596f:6623 with SMTP id 5614622812f47-5681464c020mr1356594b6e.64.1794181786514;
        Sun, 08 Nov 2026 15:49:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:49:13 -0700
Subject: [PATCH v2 2/4] mtdchar: bound OOB reads to the data in
 intermediate chunks
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
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-2-838cf8934ba6@gmail.com>
References: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
In-Reply-To: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
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

