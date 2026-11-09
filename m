Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187769;
	b=jDVJ3Ym3tFkxmo9n1V//D0zLtFn5Iz/55w+ym9AiIjI2dfHD4rjQjT2nRq6Xp3x94gOB
	 gbjN+QFIF3Lh8e58zIg0immU+E3Jp3m2KmksdxP908GrBl9psOXi1G9Sn9O5HyZ6RgYY9
	 YQEmYyryMiPeUlYmENmc6SPnM4opKJ7GxwH06ZdMJ2FfW18gkRDwlOkOkICE7RBv77HNy
	 10R89ew2nKbMfpmbdGnSA/HUa1+uCmdAvgqzb8upYWGotbzS4g3bdwYs+LVDCg04KCqen
	 5GFTT/pV0+5qgrB4TwtwhWteuKpF7VKux+Sr8yuV2uPtWjTFG3xxYDlJl616XPqQ7qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=muo/8VOQynEi/OPHvo7a1ZNTOIrWbQuTUTCZGRNs7Fw=;
	b=TWm2djeRFWx6+IRC92VeYi44xqh22i2NF/0pcr5cGMFRwRFKpk5oGyV7Gh3uI6+ilVlG
	 DiMX+V4re/E1IN1fZRBG9LDL+S7kZ+6P42MiaAf6iQOuiYgOx6c4e3GGDnWL39zJkiA6B
	 x6jDBCqf1znpYqTh6QN2+lveoqOYXevwmfi68VLDJek25bXIDfvCqygXW3kMdQ8+nvfrr
	 9AhYdZD2onmWNnOA1q5M1guyQmG0TpMCkm3hHxoQKvOJDvPyo789OJO/6886bzwGPGTfl
	 J6ph/lKgcjk8FJS5exeBPbe/5z7scfld+6sXHLUno7UQZ2iGcGekCixaepPFMrphw/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8d4j5lX;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4040606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4040606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8d4j5lX
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-85ac281604dso229646a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187768; x=1794792568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muo/8VOQynEi/OPHvo7a1ZNTOIrWbQuTUTCZGRNs7Fw=;
        b=m8d4j5lXOI9CMBXNOhujJKGTVlIAlnDqKU8974XfAExPHOngZHQBsg/ViG2YAJ3ts6
         lPDV1nCJn68sUubpoJf+1W/Pmmy8KF2w84ZFy+zegO0liwDIzfMtNJKlg4i7etx8Eyr8
         SfQSYzII2qS+mrQ+ddOUdvNVDkaaQJgZiqJDb3Ud5b1lDOvE26BK7QfEh3T9KjmplT9O
         nIq6B0i0Pm4tBgVqj5VT6yH52dgDRWI/UW28SdsuXZSjvlh87vZKECjHizXB8Sj+EIMt
         yEzt0CKdaftj4OtByAhKr6za6+aN6VKzIKzM42vgfxmAjRZou753g/oSlJXJ3SBwlKHe
         LLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187768; x=1794792568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muo/8VOQynEi/OPHvo7a1ZNTOIrWbQuTUTCZGRNs7Fw=;
        b=ebcKMQD/z/45Kqj2VREUAmeeOBOg5YUOf499hCbb/Mpd0oHHqVwcDkepuXDiXxFZR/
         H0lJnILBnE75q377BdO/7++iFeiW9lnYEx/wi5gt6iim19AuaPlrJN03ZYBZWc4gH/AI
         P4pxfTj3hiX15YoptHk18FnNi5f0iuiKs+bdl9He4l/ByHgf5FU1lmNjIKmpePFPvDkO
         vT6+kOoPEoCUBKtvV0dC+muHviKfxM0gNas3LkOiYrQRIfiQD8XdS2NHiYuGa/Eimr1R
         SIiTloISLPRkH0TxJa+8qnhPmVL3smSNbJo4x3hYrWoSAqtJbwocAW+Ya7VWiWmWHaWp
         ZznA==
X-Forwarded-Encrypted: i=1; AL+hErGUBVPk1P6j7iq/iOkydyvscrLE9g55WUQsNm8bGc82xtTJoba977jDAOF300Be/91UhoM0WUlOx+mv1oI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Lx33/DJwdQmORo27/oKtiIKotdraedtp9aWMPNq7Mfqx4RRvz
	FhDIJsBL8oQwZERJHaMP14DpCg6P+/HEd9GMtKP/72qRydgRcqxba+zC
X-Gm-Gg: AYBFou3vBlP5bgtEMrrzmhDy1YrXPClfdm4MdvycP9iBsypkOZtDxufg0xzcq+h17Pd
	Urh1olAPjVhvGu+kIf6v028/H9PEnxLwiPejcTxOy7HSj9+ZxEbfRkerDTSUg6m2RzPVHliUffW
	aVppAR9UHl5pQOmello2GTQb3zTnLt6+JHcVs0Hc7uWVVTe3+ujqKX409CjBZnEA7LMVRQgeXmZ
	uwZYUTfnM4BMkw5aHcqGSe4rcYYNfNzbeWj5n3ESEbZ9gRfJ/I1QsKF1MQvsPZ/TDUNrjX2Vn44
	mXwhJJzJBZa8RYb35R/nC/blmdt6qy629Wb4BDUXfIxZERGuLoGPZiXmmWiFJ54p0e4Dd7+42n8
	YZBk0vdO2FRJNNrPWFRcXM7FE8Ak7xvu6GZU++fzXUEpx903L/Ipj7a9f37Do/TnrDT/xk7vs3j
	m9TuJ3NXbFdBVN+fh4U5CRz9DG5Pl4O/TltJWJrLwYSMIPqbpKBlxE2gCJGSkeDPOPd5OmM/cwF
	nE/MAEOxXbgYpw5dKJEvymMX7DeS4GcNE8Vbz3/w4euwsex9NT77fyuTCmdDj2YIiMfcTNXrfR3
	l5xok8QbZxojWRFavtdhJbZ3f8HgQAyErRclzvQhvv41FsPOpPW/bbsTUtSViRG8STwrEiaenqu
	e5ioMbXNXbeeW/1zheYmWAtN0StmyRnLYoYRgmvsM0cYiC/O4M79+kUyiooK7W+vYm/L6izvBmJ
	/i/1PnaNwctL3eznD4BF8deVuqNdqrcnRHN3KKu/C50XkPMKiTwm5J
X-Received: by 2002:a05:6808:11c7:b0:538:d44:aaaa with SMTP id 5614622812f47-56814428c0bmr1663265b6e.63.1794187767780;
        Sun, 08 Nov 2026 17:29:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 18:29:20 -0700
Subject: [PATCH 1/4] mtd: rawnand: sm_common: restore the first ECC region
 offset
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
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-1-56d08c0571a2@gmail.com>
References: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
In-Reply-To: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The conversion to mtd_ooblayout_ops moved the first ECC region from bytes
8-10 to bytes 5-7. Those bytes contain the bad-block marker and the first
logical-block address, so software ECC writes can overwrite them and ECC
reads use the wrong bytes.

Derive both ECC region offsets from struct sm_oob, restoring the original
8-10 and 13-15 layout without overlapping the metadata.

Fixes: 987b913c2b7e ("mtd: nand: sm_common: switch to mtd_ooblayout_ops")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sm_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index e238784c8c3e..a3a3a05cc5a4 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -16,7 +16,8 @@ static int oob_sm_ooblayout_ecc(struct mtd_info *mtd, int section,
 		return -ERANGE;
 
 	oobregion->length = 3;
-	oobregion->offset = ((section + 1) * 8) - 3;
+	oobregion->offset = section ? offsetof(struct sm_oob, ecc1) :
+				      offsetof(struct sm_oob, ecc2);
 
 	return 0;
 }

-- 
2.53.0

