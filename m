Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810610;
	b=f3zV5QQkdwRMJhUguwjPcqrgkkIue07wOvUnjWyOwuluBiuOXRs7K3x/qgeqcMESja3l
	 yXKjHKi+R+jneMi8LUEqVpB16fSESlKeSEAMNbz0nICnR2Fzt4XPK+Ax8p31fxV6DMG1K
	 vpPOfII8FveWr0rtHgXfxWLPPNEHKi4VzianoExwYQKkybOtXQxFO59N9ohPMojbNClCH
	 U/NvtuJQVkaAINiQRvrgON1gNq+TpQVHi4bXIjMOthYqdNPDQJCuz/Y0E/xS/fn6+OBis
	 CkARRPqWHCYazOwnUtXJNhukULcDWeiftY+hUKFOqvC3FYFqkCHm0Nta6JSyNzJVALA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
	b=NHHCxaMTWA7lSgY0W+tkry42l8O3Tt2HngJ7l4wjGn0+CZIwHicRBxYTVtI7r0jZqiXk
	 WaDDem2hyyZBZc6ZGxPY0+avV/xAArjTcdtxLWQ4/ZwoDR5QSuugtP02HG1NBoPH6K+MY
	 CLQKhBsnWit0/CrjVokuFfJzXIxGDgyXqSCKe31h33jOOHkgjlXlfWaDCX4vEwIXRgXZj
	 7LVAnsI9qfbIE2rVlgsLAAgWFtkOef/HmhLu1sfSyn+dsWM2KdzbcSFs3188RCK2Ikn1H
	 fPqOJEpFQpaCMBSrr0OpmA0aAWAg6LmloVg4AFBF3IjVS6yp/5oKijM1HKaiH3JAMKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQpzKrmI;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA02B60A3815
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA02B60A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQpzKrmI
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71ae5389c00so642620eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810609; x=1795415409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=pQpzKrmIS7O6Ouf6YccSsTVGxmRX2oJVYwYpB0asliJfbkevS2T0YxfqVmzGZ3uoca
         X6hAhLTE4rnUzWDljTQ9SbH6rnT/MNPl0uvTMqT0G4JeH2L7RVp17KhRFBGlhK7u9k7a
         HkI6T6G589kux6Ht8D67fSLgyRDP52q0nThnnkNbZCvH9iL9CSvqrrFntZIKaP1UXCPK
         Il+ulGoqxVqOBJF8axsr11zL80TOzWlZN6PKsDu+4tE9yyfx/HbbwIuNj90Q082+HOni
         dB6+oUBCSos0w+C+JhAc3iKTX5P4ZPjAHoueDxK94wJNAoCkjtFwGU+fetNmqLU23DQK
         Q2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810609; x=1795415409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2R2i8BvEwSPm7T6znyq7xHaEOSsHeKhRi3LC52Nrjo=;
        b=ieDvQjK/nSCReif4RBwdh9WH/CSJERfCC0RwrFCf+ai9eYNODQRPN3IRquFSMnOjB7
         2SHnId7SQ3pftXHOfdt3FwkkwGLNJR/A2MHd309anK3yvcGoW3BACFaoB2aKG3uNo8Ye
         3ksSVgkD4UWFjC6sh2jL99qnnXBjypRnqa1kGqb7KvFeMIsbHFBHOA7ZcicoeL0vWKRY
         2RytxWBTSrGQNffoKwc3T2X/C+NaoxSDXmxje12M4rJUC/JkVqKnb1o5Gf4wfZf0wJDZ
         +WKb7oK5RHH+FzgHqTuAdB+HLGumsk3QoS/ZPIjOKtiJz0g9fVSMcDo7oNaAsZjTBWPw
         zdPw==
X-Forwarded-Encrypted: i=1; AL+hErEiVJJ6psqL/wG6PdRdXCybB6ZDrTq8tWJSssXgXkjlsjr768nwek4mkSToLENGQqa0rte0Am9yG2qc7UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k//yQBzbArvkM0nycwNJljNv2VLn4ruMVp38Cls5HDy0NTYAs
	GBY16OdEr8tBDaDMj1FLm7k9q5MuE3wUr8SZPgq9nghNPjL6pOrrdTEpog3KI8t/
X-Gm-Gg: AYBFou042mz/7jzCMQ3QfIJOmofGuNecgmfIjLfSoLATm94rXTypwJCkQwoj1W5HOpX
	GcX4IFZkK0j8F4DOoLecsmGNiwDh0rAVZHa4jTbs9iGsn9jHdCF3yZtNOQeARYmyEb8oFZ4y9ka
	Mn4KifTLSw8MLV+M4dxBoLdE6x+iwWKLTwGdGs3uKbttoxhQuTaHJpb/rHTPk541vzPFE+OknSY
	rmLvTJ/rBFZLII6LDMMOi1JQ39C+HAcji3tXIS7xBcYhZoAsNVPBwO3bM7WCgcrH2zvtwfqL72/
	YrCtU57zU+venzpWI7xbcrrLU9tz73j9zR23EfzJGIUvoLbu+YYtAjPFgArCuLGKWaRIWK8fLhI
	kJ9FwW/QxvFE8pp+0/VFH656guFf0DSIH0BoUYeC8PDjukaTyAJUnetlq6bVvoi91Ftma0i585k
	3hnXhON3HN+LY9D2gSP4vTq7n0DnCRV91H9WLmKC6SpLDbK1nrCvdIUJ6Lobbbs6KPHNGcDNWrk
	oTURECNPBEhcIM0K0dAnYzi01PsN2l2p9PKhMRuLEMmRE9Hx/wNnThohlQpo27vHnC27MXWVIwU
	O9nR/jQ0dzP3a1e+3/B6lq4Z8NrrI1VEaBaF7jsyX454QoKiM+jCBzR0OyzsAyVFweOXAV/Y/va
	9q9PupjyPHriaMgaFxanyzwxPTE0hL9x4nWfL+87uZVuDd/HmoHA9ZfRD2ah6TKc0h4pKlqvdBB
	Bml6pR/1Afs2c+CEPoC8yA+Q+zJ0Iin4JDxtyCrdhG0LFI1u/oEMY=
X-Received: by 2002:a05:6820:f025:b0:71a:f4ed:7027 with SMTP id 006d021491bc7-71af4ed9bc1mr1313029eaf.2.1794810608752;
        Sun, 15 Nov 2026 22:30:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:34 -0700
Subject: [PATCH v5 19/58] mtd: rawnand: orion: retain open-handle state on
 removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-19-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded chip and its copied name through the shared
allocation.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 6cec25425710..1b1cf3b31fb3 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -106,15 +106,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +186,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_lifetime(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +209,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

