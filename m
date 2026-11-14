Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684038;
	b=kmVv8lIwolWp1stouaSqKu1+xDrJDHTM6O+GGl1koGQnmpTB5scF69T99//JFivQyfPt
	 LBhQ1yG06hNHXI/a2mGKZtGDNcFF1d6lq+H43+SZIsQYhriAtTDI7xRDnbq1YVWICyQZp
	 TAnUKRVyiN33JSCTRX7B3GEDpUx1O0eBuDzW+SljNpuFl1RWu4mGDgbnl6NANNpaPxkcj
	 0wriwOkj9P5VZ5eyaxApJLxNVPmmmX05YZDkiR/fJIAoscATWcWaOmgOvJMV28utAeEdK
	 syxdO1NfksZnJ4OcDhdufCATSR/cB34XBFtwHY3KidFOw+1HXPK/Y9uXEbWy4KQ6yPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
	b=0hCOVzcEjOkBiMO4y3Ds7FrWnTdF1LCYDHQFeCFYqo7C3OhtR4+ACptXndrg/w9q4HT2
	 StsKz1ZvJiPg48EvxoG3FRfYMeewjwc3IL1SaBaZhP8Rsv8ih5NBy8tn7QjGPDd8bXJ3v
	 idQHhK/OU+gYDblvPwdKtNgkgOwDh72Z+7PCEPQCnQGfx9SmiS/oGhHW1joy1tyBcSXnb
	 7PBsmm5aE8gHo1O6NsshJai09dd4jzfz5CAO13gLLD9pSCm9mxkjQoqTySNthQtcQ4FVn
	 DnaGIOoJtYXRWxLVUXieQzrpCwC2hJVnkMvxxN+hjOdylJILuy19mn2kKxiKcZa/PqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrVUmBy7;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A58606A337
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A58606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrVUmBy7
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91f0ab17747so32775216d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684037; x=1795288837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
        b=NrVUmBy78iNPNb5BrVC+Va24C/qCF4P6LZMzxOFcKjaQ7aC4QfReRg8hcyB3U2Pmww
         fGreUls6onWxU5PVD8HdKVLwOIEVcl/pNAAorfkTjDS/IF4JYUooDDKQX18LUBocbuBv
         dUEUH/Xr+ihqHPP/XdNFKBetMZqt0+DUi+mbirfwTb8Ap8liWt2OkxzZJERN9k0l8rsu
         Jy6rPTE8GPBEmtvXKzf/Qks6SNXXtBz88leT90XNGvZ4+ybMPGjF0rDDZ20F5Do8mmgw
         L0sLCqjWuds8VjoJgX6RtKZrzhGfNB4xDvr5mwhwiNDhQ0EFnn+vkLj6owJf0oPcsKdh
         iJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684037; x=1795288837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
        b=n+YN67zK3Aysgv6b/UDQ6k//iQ1seyh6OticFB1cFo5tvHybvHmk+Lk0jTNX7j9+6x
         2oqyhgsTU15eq721I7V3DfoDupPXArVP0RwUi1NMhNWydPpgee60CPsw8pv+b36sSdry
         naGuNZKQBh1xgCYg8vWo1Ul8/+oNGTlnAs9BHVcJBPePmN2y7a6XHK4jTcJ+KPsYyOGe
         +kYF+Di6C+IWhZsVpP+vde2BVPsQVDyJmTJuwZBC2OVXTLZGWkcvEZEuO3fAq1UybPno
         RldTZchzRPa6Ysk7iR7hncqv9qmfAB7LCqYvSinYR3+FyNtuY9JPkQ2KhrmZX7/S7tTG
         V6Yw==
X-Forwarded-Encrypted: i=1; AL+hErEH8uO9M/ehT4c26VHcpiwgH3g7v4oaCOtefW1BFleguz2RFXc9UYV14cdq+OBqcq9UbEdWLp7vniKLrNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B0dYUwBUd/JJetLb8jUi94Y3DTr5keI9sj/feEsbDhxhnUPpe
	8D1sO9/BTmGpcjRC0NLUG6Noy/x1I6q71YOGNUd0O16LbIlBwwtAcd6V
X-Gm-Gg: AYBFou1hpwl5vzeW91iuRpyF3qJ3DNCjvcxUEDXbXcE5kIoA6hEUFYEx62TjNsx7s96
	ssU+Uf7hGNfAo4gKX48jt/EVhf0FFzbKXZjBIqsqquj/MAmAHM9fK1CaTGYl4GoHjHBzM7jxt+4
	V5AOrINHvOXCGckujLWAJovgrteJWURyoi4lmG7as9mn200vbpI+8I8kyxWTCPc1OHqNEpcTT6U
	Qw5rwfKZ3ggdyhH+NmSVB+rKKZAoiWYbiOhp12RwQ3ysoVq0YgEINZ/3AnDoO5YGiAPlCl/yIrL
	LugLPRntJiutbKtM2jitBgKDU7FJsLFnI3095zkCgeijywgwjKUdvK4ZLMj4rdXLwF1mRX6l1Xe
	z/UxZ7YF/ABHXk602skayFFvUyG0nFIdWx5N6tSHLWKvdRs7CjaFz/leTSRx6d3M6n+Nf49AlSI
	wPnRsZTIaJ+bKX7BrToYYTbwQHp2c6HJK61kII3y6qNOFsqj8JxN8VPvqF0DnJX/PySBiTSPaCt
	ARSnxUh8on3sGktJrtTjm6/Bflhb+zlmG2F02BYS5JT8bJwWAV1jQIJeP/lQi42i7Qu50ZBPNmE
	FPS6AVdA6vZY28fSSGma8/ahYsyQwe5A80k=
X-Received: by 2002:a05:6214:3913:b0:91c:50af:f6ad with SMTP id 6a1803df08f44-91f24262a8amr97318066d6.50.1794684037579;
        Sat, 14 Nov 2026 11:20:37 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm48544256d6.44.2026.11.14.11.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:20:37 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 1/3] mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
Date: Sat, 14 Nov 2026 20:20:29 +0100
Message-ID: <20261114192031.959376-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114192031.959376-1-mehmet.fide@gmail.com>
References: <20261114192031.959376-1-mehmet.fide@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The ECC page write transfers the page and the spare area from the
controller SRAM, but only the page data is copied there: the conversion
to ->exec_op() dropped the vf610_nfc_write_buf() call that copied
chip->oob_poi. Every written page gets the leftovers of the previous
transfer as its OOB, and OOB data given by the caller is lost.

Copy chip->oob_poi into the SRAM buffer as well. The NAND core fills it
with 0xff when the caller writes no OOB, and the ECC engine overwrites
the parity region on its way to the flash.

Fixes: 1cbe30b0ddc7 ("mtd: rawnand: vf610_nfc: make use of ->exec_op()")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 6ab3c440eac7..acc9ff282083 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -637,6 +637,8 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	 */
 	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
 			     mtd->writesize, false);
+	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
+			     chip->oob_poi, vf610_nfc_spare_size(mtd), false);
 
 	code |= COMMAND_RB_HANDSHAKE;
 	cmd2 |= code << CMD_CODE_SHIFT;

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

