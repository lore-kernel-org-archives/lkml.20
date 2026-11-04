Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772589;
	b=ezBs3TUnpbo4wEmjlFgl8qM+cOUExrlCTWVm5wbUcpKprkLSj4H+LkH69l80tYUW0s0t
	 qB4SzWKqT9mAr1r/1thzHAiR95pFChP01n0Ips4IpGU3UpaWvx0iCmIgPXfkhaYwIYcIE
	 D+jx+4FoqYbvwUU+eBuuMZC8GY4NgXlOhco60ZuxZH2lF9Kp4legQfI+ngXFSkXKFNRp1
	 g05B3G4MpvAHd1o1d+hpTYx14LL7EHc7E9DxSpCz6kJ0KY/S2qokWrQIBGNlwysfCqsJy
	 Fwku3dGir9tYbNsuWZ/QYxSPa7x5dUa0gKiBZTZ1d7+Q5IKDj7DpLe6Hbtg2F8ZE+vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Vfv2SmA+eQB/LlpP+XHmSHhdsYo4evTD9DRQtL9SFXY=;
	b=UO22Rd8giWACBi4b/KK3FXU78n62EN+OETW2Vec1ZIbkbUN+OJ2IbSrYz2QcQPfrsL9k
	 VtPCdv4c2Vw9u85Kuqiz6UH4Ahy8uP2H8cLjod4Kux6+pdrCdB+4csxqvgI3//pAk9fSr
	 8IFj2WdeClZ/Q8vOo6I7rw2ZH15k9jWv1VNzI4NqHpb98OjuVTW4Wy5yB2Tw1r3XVcPOq
	 dvwMu+PufcufdtY+P81GBjIiofwYNQ8WKCIScxDiZHwkK/UhG3mOydscmNzsnc1wBo/70
	 l1Z2hdlqAVEmv0FwJwEaiyjOD3eAHPfvdi8IruV8QOjlAvwLa+GAkjCkiEl6HP/MSng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7La8D6R;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEF5606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEF5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7La8D6R
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43bf9548df4so413777fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772588; x=1794377388; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vfv2SmA+eQB/LlpP+XHmSHhdsYo4evTD9DRQtL9SFXY=;
        b=A7La8D6Rjdgd/D7GVbwcS23iHeqkG53iEUMesJwqszeWg7eJXZToOsLogvsEyywgyt
         notAR/Drdtb+mSFyhfspmhEsbofudt8DSjOATdNvRv9SjmDxU5XMyI4HN6J0+jgRSQlF
         f9h7KksYkQDmVIc1NnSrhcQkBnHPNgwyb07tz814W+KLmSocHrLCLHsKjrfAO4mXXUcZ
         AdbzqB1wSgOLEO4PkvNwPr18Vq4p+DE3WL5apPkjspjrSOKKpAb3CC9kRt89Uh5SSSs5
         mTqdV0rkg2Y+1Dft/V+eKjOILuCzrbhbe2nInQRlGkc8e0VmckTBY+5jOsdd32OQHspf
         nhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772588; x=1794377388;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vfv2SmA+eQB/LlpP+XHmSHhdsYo4evTD9DRQtL9SFXY=;
        b=MhV0X9LbxSp9FWjqMZn7CkUtXNO4UPihajjmn0emAYnSIGJ5uumd5PQfYE05cPUI2l
         80pBob2GZZUcWib6l5HhasPjZ5YhKo239LtQ9lKYxT8UX0D8tC7V/5QXpAIGoeH63O6E
         O2KGpzJiO0jNzmo3vcqlwHM69zwgC8mbwrbnar7Qb94W/Ve79/FD5KQFmaLLa+p9mXvj
         J6OH4nZ7bXB1fE2iTflxRYblGt9LH6ewqi7p2SQoHRPV2lJqABjQidkbhX5+ltlBldy9
         0gdglIPShZ65+s+hJMJtu9fhJHLY2ewxTy3+vzTPHx7hLgTplNezYxdDQa09JryH9MVA
         iYGA==
X-Forwarded-Encrypted: i=1; AKwUvBxlNAS/JR+/6z/EVzL7GgXfhUPbyUEjLZsmGymi9zMbj91TKGt+8lRU1hgKctwnHkgQArJvmbQBjIvd+pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PfTRhZ92BY55dYdTuekm4Lx3FwNi7SW4Br6BiQGisRn7EgbPJ
	sBLzYCupbg2lJDrL9o0MZ+1ju/lvaU2kXQrHnwPUEU9bpVHLRcFI58wm
X-Gm-Gg: AYBFou2aq9ONXwgWP5x1x5MCamRbGlyCEYnLCYX1N+jtARKsUeyPjA75tY3MxZEPJAk
	qy+q+bLBcrp9+KBUBqevku7ejmRJXuqH7oBIYNSsHswRhtfKpQMNefFY3s2AQz08z3nQKHkJnHU
	HNRRXHmxSHGHXD9OxsuvJetk+AuyRjNBHcyxprWscSyCZWOkPn/lZmWk/kRLrG2h102IzUGo6p6
	hupu+a7/51Fzw2cRAVAoEsFWdF8W6D6ztkWhB/Emn3kiDZGO6ndUJf5a3u1MqaFxrqaOMj2wuYE
	odD5LuQsVFK1eRZFs6ZJoOwR1DPCsVpMaAOxvIGK3km1/RAb2M6mc6kX+yRf4JzVWuNoLGJnSa1
	Pnz5LVBpmKTjiXWw86EWcd7McvHD1EhWFues7fgbGB1ARI438+RZE80G3sFUdxhz6yR+YgzVuIa
	7WV9zrGXtE+38oZWcj0yzlgXf3RLKQaFLAxjQ3Rfg7cD3g17pc0uPuCEJgQXsebpKMQ+oEoCla4
	pLniytkTMiZCpXqgCf5YPmfXCHXbupTI6A9JKj4QUFNo17sIXUw89jNY54BUahmlDEC0LKw+LLl
	RgV2C6Idbuvg+1fQFfhnIwdTE2GpFJor52JFaDb4J0iwat3sB+QGTKapu6zJScrzLu4rVXF7fMp
	9QNfZiJ1EocXSPTj2/j5puDkyo55L7ZXnHYiLmfg5ioqNzxx5httGx5Yv2cU4YHAQn5jJFG+ePG
	H2+tZ6WOtbIbCM2A6tl1VnLhActoPolDljyhnzH56pLzIw68OLJz8=
X-Received: by 2002:a05:6870:c2a6:b0:4a7:5508:c526 with SMTP id 586e51a60fabf-4a90764b895mr10269244fac.21.1793772587945;
        Tue, 03 Nov 2026 22:09:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad58d37b40sm196917fac.11.2026.11.03.22.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:09:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 23:09:45 -0700
Subject: [PATCH] mtd: rawnand: copy OOB only after completing read retries
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
Message-Id: <20261103-submit-rawnand-read-retry-oob-v1-v1-1-2a6a91b39e43@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTsJpVHAqxgWUxhhTGzNtICGc
 HeLbl7ybf63QWQVjnAtNlBeJErwGeZUQD+RHxllyIaqrC7GlBbj7J6SUGn15AdUpmOSfjAEh4t
 B19ZU2zPZpmkhZ17Kd3n/Lm7d37nx4D4dXdj3Lxb3xxeEAAAA
X-Change-ID: 20261103-submit-rawnand-read-retry-oob-v1-b97a735a3889
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Huang Shijie <b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

nand_do_read_ops() copies OOB to the caller and advances the output cursor
before deciding whether an ECC failure requires another read attempt.
The retry restores ECC statistics but does not restore the OOB cursor or
remaining length.

For a combined data/OOB read, a successful retry can therefore leave OOB
from the failed attempt in the first output slot and put the retried
page's OOB in the next page's slot. A later transport error also leaves
oobretlen accounting for attempts rather than completed pages.

Copy and account for OOB after the retry decision. A successful read or
an exhausted retry sequence contributes OOB once, while an attempt that
will be retried does not consume the caller's output buffer.

Fixes: ba84fb5952af ("mtd: nand: add generic READ RETRY support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..361918d11ce4 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3537,16 +3537,6 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 				memcpy(buf, bufpoi + col, bytes);
 			}
 
-			if (unlikely(oob)) {
-				int toread = min(oobreadlen, max_oobsize);
-
-				if (toread) {
-					oob = nand_transfer_oob(chip, oob, ops,
-								toread);
-					oobreadlen -= toread;
-				}
-			}
-
 			nand_wait_readrdy(chip);
 
 			if (mtd->ecc_stats.failed - ecc_stats.failed) {
@@ -3566,6 +3556,16 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 				}
 			}
 
+			if (unlikely(oob)) {
+				int toread = min(oobreadlen, max_oobsize);
+
+				if (toread) {
+					oob = nand_transfer_oob(chip, oob, ops,
+								toread);
+					oobreadlen -= toread;
+				}
+			}
+
 			buf += bytes;
 			max_bitflips = max_t(unsigned int, max_bitflips, ret);
 		} else {

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261103-submit-rawnand-read-retry-oob-v1-b97a735a3889

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

