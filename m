Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181786;
	b=Aiatuu5MKW04lCKw820WOBPcDorMpRz6o6P6tkmT2YmP85gz23U8UyzSTlKABnmdoBME
	 +YGT4pWtvjU+bDuNZ6g8v2PBJ+b4gUgRn2ZrtwcZpM10BREnO4aXoZ0agjfpdr0ulyOsf
	 uFSHziumuAhxPreb9k6jll8fY8YFPm0J0vtiquIEsUEezJ1eVz8aB57edHf/p4EePv4rV
	 HEULjSw2edvwO2QD9zXkz1GFniJEWmj3bYjQqnP/MKW0QKWOfO09nKG3cTLIqc7JsvvvE
	 C3Buk67C8qPOlubWhJO8bueTdyQyy7MFJulj84N2m+0UCDYd6g8vSTw/GA/TSfZaz2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
	b=t9JnJw4RTZNNSTtTxd/87u6n0JJprLqNPcR2UBkI4KTuV6uLYgH/OynzkpZYDECo6r61
	 3LCK5xlBamzF1sahgZ2Uuv8wJZvz/QqfNKyBGc2xGJg4RHOH7VqBqGnDOjerWBbw7mxh8
	 Xxgre4YkanTD+dNS+3MrrXdqehSNsGb/bqFmLid7PKnQiyxE7maHqPITjh1M/5YZOQqR1
	 ayR8fuPyhXKDvMTrAsppe6wsMFct7EViS6XbCKNv982rqObk0xsoHQ//MgECyKqWAEI42
	 Rwe/AoCCG2hkYXQdZ4g7QrYP1UMpA9LMNWgOhICDeSR89FjgngmHpfZ0aQgIJWq14hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5VW7LxU;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE87606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE87606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5VW7LxU
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53ec2cc397aso161824b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181785; x=1794786585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
        b=Y5VW7LxU5czAXIcMwAz03usdAUAkxiK6F1BrQZz7yrHYfGz7WVPxklzOcNEPeY5/B6
         Af0x3LhS/LxDHgUblalhCDDI3sV7xCp+RqKiXjYB7+6ElFnx1DKsCHTqggMcJhYh80qw
         vPlaakyZ66yNjD+1sbXX+x1ccgWi3OJLmBjK5qaaETxOmc1tYiEkHWT4ErK3xSnCTS8V
         CmDhqlwi8kdohW4EtVd0S3JSEz3zZ63PBaMmeZD8xZzUDsf2UGhB4fl5u0krN6gUFJOC
         /v8aeS7pDl0BR2ypAyAcHGepf2B1FY2O9HkAmofZZRthe2JnQ0HC49jgln5UEyeHt8y3
         BGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181785; x=1794786585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
        b=QGm/fpAi8oO4JCeb+H/mU752JVnGoMT17rB1C8ZVSPlDjfB2FEajYESiIo8xWnn98G
         TPbL2NZ+f4on19uGvi48CmEkR0zKvgaCS0SUnIEyKQDpJg+6Ofp4OPlitaGUCJyjhgQ8
         JExyuK+G5DAEWFeY0LTWLVBbEEK6Wm3Jqh/6Qa02J4LcdbfAKidLjcK0uqmCfkNYOe+c
         AZO/srpGpb/CCeUskjori9YXB7C4HBReYHZ/fLDyPyMPkqlrqxmEYsgkJP5hWSIx4dmK
         1L72FoaKjMknNsm02/jvs9/3JRIhLSdJY5WerR5uKpysDk5hmfDRAy2yMzx1o2BD7CUn
         oqnw==
X-Forwarded-Encrypted: i=1; AL+hErFE01W4jvtU2WnBinvZ8FXBgWC0cqXtx/YQ7Z23W3AjhyI7y1O4Eemn4W/Gzt4EcbEG4OZqgeF9nF/kVNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jtwyn+rExSbsqhvZHldiUKOTF5N5gjA2DlQE8yH9zcx+Ear/i
	Np2XfiwK+GIWCMCCzQk2qew/MmXgY8MlsYHlev4E6L8Q70+h19qVU0WnqtPXfw==
X-Gm-Gg: AYBFou0htyaMQ26/wUJkEvxoqeHrJ7y5ZXuwtQtIoLYX6Y/RjFE+70XFzKAMHzSq7tH
	MShsQrKTaySJPUigm/x76mLQLOo5OnipvAh2sgL8ueixNe9XygVXnWxYCxAlBJQXk5VFs2ubAWI
	TnXpYII9upmPljN7/8s3ZUTRzqOAeJfm9ZrPHU3be/J23/SHZzUaRZMq2eobxh6sWHWR/Ui5ZLD
	ytSP4HewfunOTUf2lXdUQjwskaGFgKZqqiPsq1FnuktJ/8XRMcyEccUJ/Y6T9mIZkNR7Y9AHQEr
	ZXSByapRoC81F9+M5I4dfUJGgER0tKY3H+kk/Mt+XQRJ5LV72/uxRiK3QdfigA59Lptd3UxBfgV
	SOZTi4GE4M6K7TPO3UM2QnONfv5Y5Po3deepCBwMO8qZdOm9eEjHJB3tg4/HY0niWW/7+jL8nLp
	hyuP5XH1edD3gKhzkNzJOOBuU/Zt7Kf506hEtn8IaQbRU0/KKMu0MhBJnTf7W4vy7C65qtmW0up
	t9+Ada5++NOWTtLphl4ZNGC+BfG2iyV+7cOrIxRSuFkjzOVqOhGFUPcBAo4fdNdlh2UbFnmvLqV
	WBJiGpnjSZwP95nEB/+phpnTobYj9qRI0SmEsnSqh/84sMbtrWHdH009bBp9mrv1yw86sUQ2fdT
	+5oYbs3C0HGRm8rjMdhxo1fGza/l/iMVkoIYHzHEFomqbZhAvjhZrjbm/zsdzXRx+Q0XnKEulBs
	KDx7atXQBj7Hd7I99sPklC57pelDeYSyDHjEhBWuFHuvhJ71S4DmY=
X-Received: by 2002:a05:6808:50a5:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-56814451b9bmr2054982b6e.18.1794181785525;
        Sun, 08 Nov 2026 15:49:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:49:12 -0700
Subject: [PATCH v2 1/4] mtdchar: calculate OOB capacity from the starting
 column
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
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-1-838cf8934ba6@gmail.com>
References: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
In-Reply-To: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

adjust_oob_length() needs the number of pages covered by an operation,
not their absolute indices. Calculate that count from the initial page
column and the data length instead of subtracting absolute page numbers.

Use a u64 product for the resulting OOB capacity before limiting the
requested OOB length. This keeps the calculation independent of the
absolute flash offset and avoids narrowing the capacity before the
comparison.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac7293..19d33dacb62d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -576,18 +576,17 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 static void adjust_oob_length(struct mtd_info *mtd, uint64_t start,
 			      struct mtd_oob_ops *ops)
 {
-	uint32_t start_page, end_page;
+	u64 pages;
 	u32 oob_per_page;
 
 	if (ops->len == 0 || ops->ooblen == 0)
 		return;
 
-	start_page = mtd_div_by_ws(start, mtd);
-	end_page = mtd_div_by_ws(start + ops->len - 1, mtd);
+	pages = mtd_div_by_ws(mtd_mod_by_ws(start, mtd) + (u64)ops->len - 1,
+			      mtd) + 1;
 	oob_per_page = mtd_oobavail(mtd, ops);
 
-	ops->ooblen = min_t(size_t, ops->ooblen,
-			    (end_page - start_page + 1) * oob_per_page);
+	ops->ooblen = min_t(u64, ops->ooblen, pages * oob_per_page);
 }
 
 static noinline_for_stack int

-- 
2.53.0

