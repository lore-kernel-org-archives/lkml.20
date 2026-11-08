Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794178132;
	b=r/hrYMf+NObABDhKwyVAdeCsuaXwodH99Cyw/FkPXnc17CEx7Bum8u8gkOClEoyzt9Qq
	 nIwEvYowpa/CA9GoBnkM2nsYibM1ygu4mY2Suh9HvRF7TH1+GV31K4vQhriNR0RThund3
	 /hOAafRCPxYnf38s10HEmIw5ln/t1tbBTg6/OGB0Xpc335UUqVjirebpwJBEk3fIBYxeg
	 pPGqNN2iJaDqKOP/kcdYFxaCW1qT9DafyZp6eXuvlTuD+mExD/6Qg0eBVDp2BUyeqHGxH
	 2HWc0rNEDIVlzhcXzwM0TJZqZxq4RHJlyVXR06oj6ZoIc3dT0tM01Dpn6NVaWHOnXRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794178132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=3bI4CTK0ibSK5GiKKc2cJRvX2UBB1MrQ+kYcnJge6oY=;
	b=zLrOkFsgvZw6JEmo/szqbySbCjzQEhl2c2BGxUSJHGjPnQKbtcvGnnmdslrUd7PQ2C6d
	 uWgrxYi0JUfEnF0fmZ8TU0nyGG0U8ydl2qG05IIx7bOtGZy2BCIUptjLdfYb22pvttzMq
	 cXwAnwNl4Kc0MXdtTkJiEAFIxuaeSg8JNLZyPPE9kgc8J4SUrnoZmU7D9tGYTx8A3R9jY
	 J7vTXo1U81HC3hm80azDwUAszvebU8KhHaCk5pzQj1NzLreosVAv1+6V/TQvqO3u8ckYR
	 dfwbX9GTkiUgB7yTdfgwvKds1+izj2tVOREAu0oTPi4ey2U+FPVglXULEbrlqe4cCQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQZxFtP5;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9D0606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9D0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQZxFtP5
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4f48d91ba7dso143278b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794178131; x=1794782931; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3bI4CTK0ibSK5GiKKc2cJRvX2UBB1MrQ+kYcnJge6oY=;
        b=xQZxFtP5SDxqO3Ghrn8sQ6P2ZLxpry8nrmAlesZdNno0KD0xsv+L5HXRftB3Op7ao0
         rGEyfEMmhPP8SAgv03VaxGGIAoLVnbvOpn3wFZfvptQWjY9655gCzhZpKKhbD3X0BYvZ
         wsdz7MFb4xHsIciqZgpiJgXh+indiuMermFk0ikOEHzc7xuHbuNz/aHqtvRDepiIhnAR
         2ZOJtFQ82zZ1Z/wc9qNZh8DKnZlaBebTpc2WuJXvbRhYEFdIpnnvOb3S+hX40odJTQiQ
         iUtCtfkwsPM7sV1pEtzyb/PFb0ygVZmQpHBv4LXBGJHYqWCSezXx0YRBWuQQ7eSK11og
         s04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794178131; x=1794782931;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3bI4CTK0ibSK5GiKKc2cJRvX2UBB1MrQ+kYcnJge6oY=;
        b=xPyIU+MiSALfjwaDoT2bqvrDzxoS8vhn11mAvdQiJIJ+dSNSNVDK4x1Ni05xr/12I1
         PSQ85vZMLKiISLrIUzlbEtRB47Nvxv8SHXI7zsX9u6p5z8C+IkrDsFWHKbvjb/JrPLyv
         XojieNCFtjcbBqGfCU8a9xWVS3gqrQ+xlRanaHtKXBtkYATnD/gWiXOPSKfUDmffoTnO
         25TtqgmV5FcZ7iBGfIGc3ejDJNTctcIvqtXqAoN5ZvcGDuozH2oyF5VZOOmzmqcm89/l
         3J2LYiS8eBJtsz2t7RGqFJGz5wfhBhlXg5figo6ePdbvjDTcpdB7UycT0IU9PCp9Nm5t
         B+YA==
X-Forwarded-Encrypted: i=1; AL+hErHmFupko5jJm/2LpvZ7HtTqcqH71ZH+Ed1dYnE1INobspfLiFW3zENUG1/+DmoSCdFDiQyRwQyBSm3CKdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fzVhTFXXqaOL/vOcpx+orrsTLXEjhYmm/8gmmSnJv06U5lRmC
	kAq/eS4xsJT+igR4QBSLypejnahM9SYIw5/+A6pyEMpch7nL/x0ZLw5g
X-Gm-Gg: AYBFou2vRRv2SSyDEd10zZGgAH3eKly4Q3uUXTxeZELOgNvvqd723girhGpbI+UPVHN
	o6msNNa+fRjsFBTu/CnR8YjOGh3IL4FP6qG7++KmG3qqrvJlAG3jPNsbw5W0DpEIeMauaCzXlCJ
	Umbd74zzLE58X63Bkukfu3V6Ug4GY3VV9yjwzIAX/QtdTDQ+XfdCqwCUK380vTzVbVWMiiaUv4e
	kCX6M+K5wveE77Pr4GYkb4x8JOyHEDF2FIgIGR+qPrfkNZjB41ZRDQ6lWjx/hJQfWB62Ak4FLhx
	pZaTreTJJHFT8yhOXaraGgZnaET7/8oL2dGONDAJonNwSfGnleKpuuQwEJ2ocUWzuo5ANtlVsxd
	YvbyuSiFZ71l/BKsUKl3wagXTDkfy/gIwdHhyRB01H8miDycNs7CHb40lOKKCbsgSTotoW88C0t
	mBI8q6z7gUtpdqcveWkYCJ5AFI/xHd8rITKHhqMOSV+EHdl9/xrb2ynvcsV1UgvlEeAtlMkyeYK
	UKDBJqoQ50Fg8trxiCULIGZ7StdmHw0c62126tQp7EIRuEOBx0TQFNr0ONr6N0X0iijiH5Xa50d
	ya+qVxhxjN4pcGtCdoW5x1TQ3ToCnP2JuPpO2JFPKJsmtW+p0IMVk3wZROJqc6VRFwZKJMegNFz
	omOUW/+3dpwVl4co5PmsDyitG5d9NoDdBZ31FtnxfbUbPRs5LPFXjkGzIrwBNftx3NMV15cCRiU
	iSX33UcI3qhcDHAJ91TYpewDyfjtIGBIxvxhzFsQSi9FtTJ4QBeV0=
X-Received: by 2002:a05:6808:c1c8:b0:53b:11c7:2da0 with SMTP id 5614622812f47-568146ed248mr1427843b6e.21.1794178131013;
        Sun, 08 Nov 2026 14:48:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813c71b08sm2885540b6e.3.2026.11.08.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:48:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:48:48 -0700
Subject: [PATCH v2] mtd: leave the device type unset when naming fails
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
Message-Id: <20261108-submit-mtd-devname-retry-v1-v2-1-09f576bcc51f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OTQ7CIBCFr2JYO1pA28aV9zBd8DNtMUINILFpe
 nehvYDJzOK9mfflLSSgNxjI7bAQj8kEM7ks2PFA1CjcgGB01oRVrKa0aiF8pDURbNSgMTlhETx
 GP0OiwPtGSYa6rVpOMuHtsTffjf7odp3jT1SxIMuHFAFBeuHUWKxMPZfdU/k+mhAnP2/1Ei2c/
 5rkoSDqpuecqetF6/tghXmd1GRJt67rD5XGa4j4AAAA
X-Change-ID: 20261108-submit-mtd-devname-retry-v1-3f7cb2ed8083
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Edward Adam Davis <eadavis@qq.com>
X-Mailer: b4 0.15.2

add_mtd_device() uses dev.type to reject a second registration of the
same MTD. It sets that field before dev_set_name(), but the failure path
for the name allocation leaves it set even though no device was
registered. Retrying registration then warns and fails with -EEXIST.

Set the type only after naming succeeds. The later registration error
paths already clear it before releasing the device.

Fixes: 6697dae1e2da ("mtd: capture device name setting failure when adding mtd")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Correct the Fixes tag to identify the commit that added the
  device-name allocation error path.
- Link to v1: https://patch.msgid.link/20261108-submit-mtd-devname-retry-v1-v1-1-a67f332c54dd@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..4f62a13dc481 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -798,12 +798,12 @@ int add_mtd_device(struct mtd_info *mtd)
 	/* Caller should have set dev.parent to match the
 	 * physical device, if appropriate.
 	 */
-	mtd->dev.type = &mtd_devtype;
 	mtd->dev.class = &mtd_class;
 	mtd->dev.devt = MTD_DEVT(i);
 	error = dev_set_name(&mtd->dev, "mtd%d", i);
 	if (error)
 		goto fail_devname;
+	mtd->dev.type = &mtd_devtype;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261108-submit-mtd-devname-retry-v1-3f7cb2ed8083

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

