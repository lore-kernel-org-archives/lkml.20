Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173036;
	b=h9wjwU1rsKpcGD6e8Vj1QRgJHHMAz3rTx5caNMXYtnPpFt0+1ZZo41PdPWZTxUVIyhTt
	 IpPwMe9iO28qjWJBhbdOdUPSKykO0Tf5bJV8qeD8afMHF/+D04mp80NAKKgdcU0kB0U3W
	 wKp76/nnXOMTY8QnzVNg7yRAynVvYMF74vC7HR1bjxAWFzThY1F/EH1acqe3hptrMMvEo
	 ekOyiwW3AHeTGSPgf79Nx3L4ofNQ1JnfGtLOzx6RsoEjCNrvxjwAxOtUFWuI9gGNZUQBs
	 W0RHq78E1qA0Dh1pKcI20p6CgGQsNGOBtcyDtFHwJQ39Ojplr6WLvk/vZBcfqu3tQ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V99b1R97qH/1vch1IDRgvyZu2Doy5l4KvwZ7hr979kc=;
	b=2hw4H5PEwlPqT+epBgLkiQ2LMVZljhU53MTE62YeyOA+Ig5A63DvyEpYHAiVzHHw/ts9
	 G6SIBxdScA5dzxvKtNGhO2cjRL1g6JMB1Ony9X8ouUV9a/r1dCR5AL14trknGOtW8J6O0
	 XDqB8SCq4A8eOFCfk3FUwFZVXTZf0UkTxIBAjEhO8qpDLRCq6NUQ3UwRv+H3BO0LLLRtC
	 qpuab9lsY8ry+GeYkMdwAvfbGzk01ndM3j61SMO5Ttnw9FuG43vvV4kKisEA+BQMtyjVb
	 jJj6u0jnYHlGquiiNsB9je6hvn+XqqI5yJTjTo+aGYNJYj0Gj1+xZqmVHzfsdHGMdNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+NzeIvt;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F109606A335
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F109606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+NzeIvt
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dd7070699eso162150eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173035; x=1794777835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V99b1R97qH/1vch1IDRgvyZu2Doy5l4KvwZ7hr979kc=;
        b=c+NzeIvtN5CpBoxOmvMnL1q5N37MXUnz3YsVvwCdNJoBEkkTdauZKzhQaWDoJ9dLQP
         RbjEyrcbCsSeBcDBfQfH86dMtBunEqVH3U6YIaOuV7Ez9mqd+R2M5ryh+6mHQyaN+jP5
         C1uguHgO4U6hPbTFtV9b7V8yMPd8hikwxDpR0M2VKFfmQpIiE9qJ939uMSf/h9Rpirja
         VbVpC9TU2CPLi8JEwmU3WNpyzc1rBMM4jowg8gWD3n1fS/dDFwQgUrhrpnNnren8ve0F
         W/RbECINKa6wstr9TFL0scqjePeTlleN63U7X3MdTCCobzD9wBlesPurt/dwDPiFOo5O
         /gyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173035; x=1794777835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V99b1R97qH/1vch1IDRgvyZu2Doy5l4KvwZ7hr979kc=;
        b=jv2xXL1L2URSYBe0v8gEX1RWdAUzrWJAmqUb+Pj3ig6j4ntcvUyGr8SGn0E5UJmfvU
         MPjYt8JSZmwzwwZsclLih0w9xXrfD/HvT85Ru3DRXKyLl5rva6mU8VRs4aztRFBkNpQD
         P4a6KkYu4EgUBJv06TrzFrm26AiSOAf7POo1LtCBGowygU36TLdwnqRd2Ezh9oGL4Kj6
         JIFEMOOAs4AD4aBn4pQIj6/aCO23iMCP2bgtPvFp2YREYfH38vG1r1tDXN40m4mdO0aP
         3nmKNqI2aDAYZDlMaG0ssXxoFolUnNvgzpitagubcs/JrKj4v9a/r3kntTt4GxLQeQ5S
         skAA==
X-Forwarded-Encrypted: i=1; AL+hErFJWvRRHo5/Wu4dqigTt5NyE0IDaXOCgSw3lcACHbEfaG6h5gO+A6y1qiGJtXUJ685kMqCF81C9UclW70k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ps3gay1uw69MX7WPoa4/Zld8gQH6aLZf9hNy9FrJhz8JV+y3f
	wCRCPjE9ZV8TtXM+kF68E9oX7yeecbGBaTzU7id7cB8eUHJfYcWSgqKj
X-Gm-Gg: AYBFou2GgBS6FYldcQnLzw2mnMg85osayzwTi7SAss/yamPmqQb3b9lB4OJ/Go1c0Da
	KfU2EVj+bRMQdyaZ2jNKtJKNr/8TRzCHlpDGiTS4LOPj4L0eFPSDnrBc+DN625RtxPjCbRlU0s/
	dMlZoFHYXCDZ6g/MHe+w1kKsh7PH2cTuPUzQGf2T7pnjQe9PDvIZpWgxMazQGX0MJnmYW2DdE4s
	FdbFYemDPBq3pM1XLHFj5BZm8Ke6RKux3dgt4rt6r3NhP77eX3hk3rDoeKAc4m3gJYemv5yNwt5
	y5o+OA3V1mHlT9UUPfOy0GlFQpRYgWiASbZqf1agi0iucj/w60osGXDY2bOESHTozVdbiiFSu4I
	zQn/+dhiuJyeTB4rmjcjNUmffVYZTR0ZnofA9QHFEd2Tj+fiPOXdUMoefPsrSl9YQn2ZkrhUF1y
	61QMn9E2OOEXpve2ozijm0Fi/utibF7OvvnGPM69N3OZboS92B93zFH+B2eMqfHX99H6DqyTcj1
	ZBWqEPz3kIuvHA2Y7Wg32PfofSEqAK4PdoHD4F2KWis772NFndACVWnLxPynxKO1msXqoaaSlV5
	zPqFONv0iG6SYMYnnefv8aiXdHk0uDIYVWMKoo2nh6V3/iIuHR+9pBcbW/13o9imTxhZ+u88osA
	gU9ZO/E4jdf9p6cr/hZ7160IGJ1lyh/cX2/aToWg0/wA8ICEvk8tG3L+YZc9u3pTOokuCavysQ3
	Y7k8ut4myS1+nbYyY4zX9m8JZlp3wwKlVzSELWI7nFIE1hOoq+FZ0=
X-Received: by 2002:a05:6820:570a:10b0:702:f7c2:1937 with SMTP id 006d021491bc7-7170f35c361mr769608eaf.83.1794173035037;
        Sun, 08 Nov 2026 13:23:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1908138eaf.12.2026.11.08.13.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:23:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:23:22 -0700
Subject: [PATCH 1/2] mtd: rawnand: macronix: serialize OTP access with NAND
 operations
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
Message-Id: <20261108-submit-rawnand-operation-locking-v1-v1-1-565010fc5f8b@gmail.com>
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

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. Normal NAND I/O
can interleave with these commands, use a different target or access
pages while OTP mode is enabled. OTP I/O can also run while the chip
is suspended.

Make the existing NAND serialization helpers available within the raw
NAND core and hold them across the entire OTP transaction, including
restoring normal mode and deselecting the target. This uses the same
lock ordering and suspend handling as normal NAND I/O.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Cc: stable@vger.kernel.org
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..2668f527e637 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+void nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..f125c529c62d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static void nand_get_device(struct nand_chip *chip)
+void nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..4fe7036ae992 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	nand_get_device(nand);
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +427,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0

