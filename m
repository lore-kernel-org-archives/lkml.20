Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932449;
	b=n57Q+XdSqyHQYh2XGgWq53C31NmFkcAjRGujCoDJRZSC5uGEWXxicgNvTyIJPFls4hcj
	 FJrMG2Dh11oEyWY6/wT+uFNd/PD3OMYIsyKALXRL4HG1ZZ0/bvLm/jdz1xnMeQptGnv1S
	 pT+RyIgsHSeYaZQV4/iZcAGQiSo3eqBh+qBjEJfeIZGg4Zxt8LVH9gp22dXAk2foH8gzM
	 dhu3PFguWuWyORPsUj0RZnT8HvbHzZGUCJ0QWWBd8DWQY26oAGnhpxhJnxGDHrLK8RaX9
	 iTqAzzwR9azfMV/lyhp2TU8GeitoXcJpNeNcIg2bkBjiaLUYND3IfefHlIFV/BKqlGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=FRdBK0dChlQbRTj5qPhb7tv/PXLs2yoPzatxUDU3hFo=;
	b=NaIjKAG1xgrj4oUX02KZ96wnkbb7tUsU0hu/OPbO6Iq7DzkLlGwdde2hzpk0gWaaTWDy
	 2ww5BMdA6RZqwbXXOFeEjzEbVLcbF/wL8l9r/gyXIjbu1wbNyId+q/jd5TSB/PDLSHyfi
	 xpwMkecSO2JQ6NOdSUb9VBkwGplg6pOU1ZaefPutY75Wblh15mt/+YeLLXw9zEKzUhEJD
	 FQh3RCgTtbc6kRpfNtwGWso6k0++Vg0bw7WIVpqLB/rKT0NYET5CZLQ3cqjQUB1X00J+C
	 zJETxH46i/TMuVDIqk5P9YUv78woF1LTXP6AmWs8shfhgqN9ahE+tyPVo2MVYnCNy+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTX+35Ph;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B9D606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B9D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTX+35Ph
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb606491faso255895e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932447; x=1795537247; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FRdBK0dChlQbRTj5qPhb7tv/PXLs2yoPzatxUDU3hFo=;
        b=fTX+35PhnBwcaP9ulinUnTTHb4w3p5DVsDir69pdp1q3+JZBGoNa/GfkS8arsZlGDU
         NiZ20S70LgVyMYjPkpKjbvoBc+o8qyDDXbsxGOGsikf1l2ENmb9JFTE67JvzD/KZvTc5
         9X1rzBQz/OrUmNXHRp8dAm6La5DbDJlInAvrA6WfE0wYgovTnoHuvJnvPbSn9MIpoH7M
         Venn50nSmxcpx23Upz7rqNKyv0bN6mpaLH4yn2KImLt/tgbX15uWQb7mCr6k2vHZ7YD5
         WxcnISIvXxIZh2f+DkMrDTzQVb1HPh5e93UFUdN8xVUb9Lj08JUwlYR6HziYsPpL+wEk
         E6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932447; x=1795537247;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FRdBK0dChlQbRTj5qPhb7tv/PXLs2yoPzatxUDU3hFo=;
        b=aLZsFowdVIuEtHScYJ8MqsOMjj1+6ak49iBmA+f1kSP5wyQ5Kt+NA2GslseXk17FI5
         egKiAd0YAiMaAE3ztHRu8bOdOkuMGJ/RqfkGJR7It3sBeX4UtbN+JEnwuyh5frT41DiP
         h0qy5ICEW2HoEQrg5FtQfxr086LkNyELbc1R0vOZjUIewEIAWMi9dpAa2IF3sCMfaPXG
         fkG4ThEhV8TUgxqG3XH7u6AZl7j6wT4cilFO1ZKuqz2c2IqO5HVPv2S6PJlrrETrD4Wz
         9gm6lYTfLjaAioUohKmrNVfa8UG7QcUnKgq7xfJHdIDLFaxx+JjBks37vz0axoQ+VDDA
         BdzA==
X-Forwarded-Encrypted: i=1; AL+hErEuN5BLoPas/mRNZUCGJyqkVwvYYvznraPK8drYUFQ3M/TpzfFHSwzDrb5SsKEPrRMkIuH7GkU7s1kcJh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cJF/D2g+JenBRSP2VnczEPcqe+ybtdGHqHm98V2Swn9ZavsyF
	Cah9M1Ne5UC1joJnUz/pqEK1QcEDIvES+bO34GOvcnNw50/80rLqwyQo
X-Gm-Gg: AYBFou1U6V06BwHFkYVNK06Uv4Ct56aGuHFjbCNYGMiBgf5/+cR+aqq0+VUcT65pEGl
	S7bWWW3seKkPWUuyV7ha0H5gnmeeL46xw4oW+yjb1VLGyQjbPs5wroh0OmmFHYGXMnV29oaWdDG
	ydCsx/P4hJKK/K51sqog0y61BYGjoKEfNzHTLbz5+qb6ZvVO6pXpJwArcoAKy+NmzPiUPIvcxEb
	WhZllc20oGLZXP1KrUaLBk1xzAJ0wh+JtniSHCvxuFNzYe5fg/RMGI16+68HXQc9718cVX15Kc3
	dmnCOnyCSiTJx33rrFSBXGNu3U8nv39tL0A/zlyBphuaXHi5XYNf1jD+CaDurmXWCFPGSF7+oma
	weM75OK0VlSBYFflG9nh0T8mQRq5T3hTgjV0eDkZ8zy2UYpsulqj3evUWLcAUTcctvtoliY4G7G
	FEnQfeLSOe08daAzjoFaeRFzSKDbTCQ/SHoQ24iUSL7SEp7u+2T3EjIl9VIGAkoavxxtu3+1HCO
	KSSTB8k0kF/l3YiSDZqUilQm8Xb8aWhfcrKttDAFYdSWmgia278mGgGp6Jk6P17m5qpE+8DGeeO
	HWwAjUCPVCAg7/5AapQ7qnctJFRG6QK718+jlClF05uQQFf8DEjXwFNBA7pbOanu80MACspvuLQ
	mRPc=
X-Received: by 2002:a05:600d:2:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb55a57c2cmr230733695e9.10.1794932447000;
        Tue, 17 Nov 2026 08:20:47 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7839cabbsm73217975e9.11.2026.11.17.08.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:20:46 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 17 Nov 2026 17:20:41 +0100
Subject: [PATCH] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
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
Message-Id: <20261117-spinand-set-req-type-in-bbm-functions-v1-1-f46d5b3b8cf3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDQAwAvyI5GzDWutCvFA+6xjaHptvNWlrEv
 xs8DgwzGxhnYYNbtUHmr5i81YHqCuJz1AejzM7QNm1PRAEtiY46o3HBzB8s/+SO4jS9cFk1Fg8
 YXroQrtxH6rgBb6XMi/zOz33Y9wNpZ/BsdwAAAA==
X-Change-ID: 20261117-spinand-set-req-type-in-bbm-functions-34775e6c14e0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Commit 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
added a 'type' member to the 'nand_page_io_req' structure and updated
the request iterators to utilize that, but the spinand_{is,mark}bad()
functions were not updated by the commit. However in both of these
functions the new member is implicitly inititalized to zero which
corresponds to NAND_PAGE_READ. This is correct for the spinand_isbad()
function since that uses a read request to get the bad block marker
bytes, but the spinand_markbad() function does a write request so it
should set the request type to NAND_PAGE_WRITE.

Change the spinand_markbad() function to set the request type to the
correct NAND_PAGE_WRITE value. For consistency, also update the
spinand_isbad() function to set the request type to NAND_PAGE_READ
explicitly.

Fixes: 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/log/192383 # See "**Investigating `req->type` in NAND Write Operations**"
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 18bba02fbd31..35bcb4a8861b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1105,6 +1105,7 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	u8 marker[2] = { };
 	struct nand_page_io_req req = {
+		.type = NAND_PAGE_READ,
 		.pos = *pos,
 		.ooblen = sizeof(marker),
 		.ooboffs = 0,
@@ -1148,6 +1149,7 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	u8 marker[2] = { };
 	struct nand_page_io_req req = {
+		.type = NAND_PAGE_WRITE,
 		.pos = *pos,
 		.ooboffs = 0,
 		.ooblen = sizeof(marker),

---
base-commit: 760d2efe91a84363d25c1051a10572242e75fe86
change-id: 20261117-spinand-set-req-type-in-bbm-functions-34775e6c14e0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

