Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173037;
	b=gIq47lgu/c5CfLgshEa87JdnDHlFC4zSJgfHpL/rdc5XqDGDMITUp5Aj0NdGAYUBIhUt
	 cagp+W57184zM765CzvF7NqgpVRWxm7N91UeEaTKZDibipTQJYATlmF7yxeJ07u+WiPe7
	 O/e6PJtHS/DVAlVU/govyHgYaR6FDAbW0g8Pt5G597DVyiPTE5tvSng9tuw0tcRnE03o/
	 tRHd1rp4+kFUlZOJGuMGgMj07mcg6sz86vWrZRpWYhzVnNqSjVU0LpOFqYBESBl6eqQl0
	 75VtCvjnCNS3YAfuqZklHX5ugmVTuqA+LWJVn0cprfuW9ru3rxuJchLJUG9s+wYG2kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZzgA6XGsC14IAPU7geG6In3ud51Yu9iRbZaXfcFbd7c=;
	b=pOmJe6UOZjtn3IT/E4avOV7YzsWeqGUYkuEnFBuMcw7++L9Q9iBdiPy9sLnvbxUQrqX0
	 Zq09THx3QFpatLQUItZrdOljsQ0n7k/c04o6RNihuDIo97nF2lN4crK6vcktd5vCmcVr9
	 Ibm6bQleADy3g1FvAwbn7osGwGvLgQha4TpbyXPZR3a3upYxfP/dDS9tyMP9CbgoAdL6d
	 r+sTK+kfiM7nH/ChNHLGTyEc40OMSCCjkbN7kYQbAeZbgt7zNFjb1SKBciaea1SlxJwHp
	 r34oaTnojb6J/HTWvjj4RXcWj6KVRqQFlQ25HM7RDB3KjbwDiuuRC7cHC7F1iWWPuoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKzzqonh;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B01606A338
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B01606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKzzqonh
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70059e4dab6so151198eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173036; x=1794777836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzgA6XGsC14IAPU7geG6In3ud51Yu9iRbZaXfcFbd7c=;
        b=nKzzqonhuTczE+W9bGIwkLJyyKjvwX6yUNWjBmlV+pC3fMUC5Ndhus4phkjHf1o7fn
         h0gvh7IV/0PbOM3GmRndI9HBVX8xf3p71CgqL5P5y391hdDBj04MqgQCO52yQLtmiC60
         hk7DhnWuSgijVsq4bubMnr2LbV97AvnDSUjAYYxiwxtKU5JIlrQh0r4vEEnmog/0+snH
         R4WDYedlHd5MEKgniXVTg6h3xYVAe2U5I68e3KqsnyQtX6GcUfWvVw+BGJWhboFlBzvz
         0Z0O4Dn5Irnff+UChxmR8kr/EgddIpheahTaBzhf76YdhrpInUObe9tj5Fw+kShZklIZ
         s/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173036; x=1794777836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzgA6XGsC14IAPU7geG6In3ud51Yu9iRbZaXfcFbd7c=;
        b=Y/YBYdSSS18x1F5haw4My/Rf1WCbtQYYbnVZUSHL+2sKYIfB9YWvQZjq9EuqWyWcXe
         W+SfKT2qtcMDYcqESwsX/d+LCCRu7HL9ML+qgySCDkS7ELepxOf/41SbChto5U9o8Wh4
         9g+mJMSsCz1+TZFr/+ELjq7a6W302iu6YQwlk44v7LNRvtus+Kt6VFAnDe46gb8Csto8
         vi0Wal1/B1dB39cm/2zAtjBDCYdEPOgVcoMUdX9f68D/x9heJsCcAp1xHr7T07xnQYkn
         qe7MN6Fk4zl8ldcmZ8EHi1iVSfpESUUwJknDpLcfqse3ZfQ644psssgWUL2AjXwHiU0G
         gCUQ==
X-Forwarded-Encrypted: i=1; AL+hErHgtNrUNYS6wIbOjf42nELSYU2biw7gm0nNjsa7FnT34sZPOuWX3DUO+/6lV37WnEvINT8qto6Gzsg3h9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dV6pNNzRuIr3w7ydG1ENWljwhNECIAdOOm2gkjD3kHDaeI59c
	Ep/H1jk5XlUhqMLNY4N8XNr0otYs/iEk61E2h/dl0QXzR/wVaLdWAvMt
X-Gm-Gg: AYBFou3/RjZUSnzOA4b/Zab8cR0uycyapv6hO0nF4GarM3FWglRUJHc5Imli2c9Drqe
	XmQrRDU/1HS+RNEtKIbksnPXrpCUFDzc/gPWl49i/zXgA/+eeTfWrCQ0Xf+2cQ7bkeP1ezP7ewS
	hjO99EHQRu3fIaR/IBQBMpQ+7+TrYH+/NaeN4E7Mr/yEDID2dPGJsWZfDsIYFKSEgccjfdPl2i+
	X7jPI0ASrDhQcaRWwf8vY61VWQRRzNRH9/eYhbzEj7rYGA99xAAXV1I4MzvgkUwpjKhc+eklytj
	XyqMcwcTxAzqZGeTHrC/oKZZY75ML2SPPjit8An9Kwuj95QdBpp8AbjcBXwA/RgsowJa/78W58c
	FY0J8MBKJz1b1l/SskzKKOW7A/udF0MnbWLotwXkvLGrApmWDDbNa2blDpMYbq+EAFKyn2EQmsM
	GUvAQYM1YWVbo3BctO+w7Ya02lJkI4qVoHJblvQwX7QM5gaZsDIB6goRzEHFaYNO2heeZpqv8Wb
	PBcBhIx1jzRHB2kzeJwKffbuNf5hG/BxDzvebQZAgdk2bTXiBVoyHLTyZUvSsVwL3V19Bfbk1nx
	7Vhh0sLymnOfN0iovicwch7tGQx33D0cSdoLxuQIfpmjjCgfEKaf/25bdXG0hqf4PJoAJ1RsVDU
	0up9vk1VsdL+tdmorbuRJ4/p18oc58+yuc1GOjHR4LnolzqdjV51MbXeXpTH6bfvLhInJ9DPgLa
	VxnYiHB5HWMKBx9YDz89Ra45JxUckrx/XVcGgoGMT1hBlvARRrjFc=
X-Received: by 2002:a05:6820:a29c:10b0:717:f38:c6aa with SMTP id 006d021491bc7-7170f38cb27mr789245eaf.35.1794173036399;
        Sun, 08 Nov 2026 13:23:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1908138eaf.12.2026.11.08.13.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:23:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:23:23 -0700
Subject: [PATCH 2/2] mtd: rawnand: serialize bad-block marker writes during
 BBT recovery
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
Message-Id: <20261108-submit-rawnand-operation-locking-v1-v1-2-565010fc5f8b@gmail.com>
References: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
In-Reply-To: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

When erasing or writing a flash-based BBT fails, write_bbt() marks the
failed block bad before trying another reserved block. The erase and
write helpers release the NAND locks before returning, but
mark_bbt_block_bad() calls nand_markbad_bbm() without acquiring them.

A BBT update triggered by a bad-block marking request can therefore
issue the recovery marker commands concurrently with other NAND I/O or
while the chip is suspended. The chip selection and shared page/OOB
buffers are not protected on this path.

Take the chip and controller locks around the recovery marker write,
as nand_block_markbad_lowlevel() already does for normal marker writes.

Fixes: 10ffd570f117 ("mtd: nand_bbt: scan for next free bbt block if writing bbt fails")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b0e7592a2ab7..51fe991358d6 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -720,10 +720,12 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 	loff_t to;
 	int res;
 
+	nand_get_device(this);
 	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
 
 	to = (loff_t)block << this->bbt_erase_shift;
 	res = nand_markbad_bbm(this, to);
+	nand_release_device(this);
 	if (res)
 		pr_warn("nand_bbt: error %d while marking block %d bad\n",
 			res, block);

-- 
2.53.0

