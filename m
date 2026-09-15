Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F3415B60
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490536; cv=none; b=hJLMbQ4Hai/m4BMwkUj6qJ7UcLriQuyCHIwiCdheakXMLbH6C1k850sAZ2octNsYHhR8XqgpgR9i9mHLPlg/tIVlCuZlQqNJFO8b0ids9l7Ma+yJnGXD3xtwKNUVvUXXcmpgOs75gRAYQQWEkot2I6tF3S5gTTtjJ3aCO9mHaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490536; c=relaxed/simple;
	bh=DLqDv4L3+uHnbPE4PzwdZOeh+cIonxgog0eao2hxoIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qgJzOtxsGTHkFQloTBGbNgJI/zTdtZq2Wdx8GjlrMdEjXuAupK0jZAuQdNvM4cy6Y5VYT+b3JBtYRvVdiCQJkfiKs0bShTQLfD/33gyAJtVSLOeKhighwhZhclAswNYeAzgIlRzGyBD7RKqGgSZ5QwUzuPWbXPtwdcLeZ1VY3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUsPssO5; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUsPssO5"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c6so3333254b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490535; x=1790095335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/Pvtp06R2zm1FquGnmOniD1kp0250IPS76W8PSHqFY=;
        b=KUsPssO55aXnjDi9DAOxbYuxN52nKm5gJeBp5oQOfKSHtzUf6RBqqsRzULKLlWGwjH
         EFrZRYJkJ39u4TAxhOY5ZeNKNUnMCRqpWazqbLX0kF4b1tf0d/zb0oFRl09U+XujodMj
         yX6CSreNOLp7h5T/+3mFJrixsPLPDH7TrKioT9tztrIY23qg6n2mjGVJOYBVYcMV8WsR
         EBM24g5zq0jZM9vhgdQUuR9nPxHQmuCqKObC9zWSqmsuCWoP5W6qwlKmFtEtG/jCuf6S
         G9gqr+7gWWI5uKAug23bzsnv+5/zdVW09WmRNmlbTGyi3OUHgld9OqUzJ+KlDhBXM2O1
         NelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490535; x=1790095335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/Pvtp06R2zm1FquGnmOniD1kp0250IPS76W8PSHqFY=;
        b=tnAOembKP0lRwuq5B7ldewPPfZurU6CYVyO0lyAlkJmf0ShrayH55ronZfyo85nL8f
         0PkGLW0sTkn+SGVB3aaPw4YlJsqcFVSNS45vEmm4Gofaix0VXf2i9w5hiECAgqNVDMbk
         i7byjD6+lUzUq4sfHmWUiyukgyLDVYx1o59sb0/aK8O/UYmofl/tFTyiheUbVVrtXTDC
         hoLXiH/9mCIi6qNgmFBVWN2mKbZikSiRTQ4DjmsB5EQueSYL4c4mHVF/nqFSpGRuw3h6
         BFm5gzqMFrp87TveYCmWO4y73mtrOwzRz2BRXBmsxzJxF1j5EIw8wjX0SnMAoKFgVI4D
         mtKA==
X-Forwarded-Encrypted: i=1; AKwUvByl3mB2VHLo0oemmErC9cDVNNN5A10RSpDrNdFqhmEPeZowNs+tSFJx5nUuceyWT2R2LBN5ABFu8lwBcoE=@vger.kernel.org
X-Gm-Message-State: AFuF++kM22wlaX2oaPJMb3jZ5smMAX7gBVs50/bhRZQfaeUykTZ3v1x3
	PQ0hELLm/y6/KksuXOVZHO7BBHjXcV5a1YNuyaEK6+mELuZvJmHmvHEJ
X-Gm-Gg: AYBFou2KvFQ5PjeFDj+JnfJgYXdt/DaE7N/z2FqJUk9WIFqCWwNaPoh/VA3ExGHkvAj
	vxdco9NGJPeGewvNbz/A/H38030UjTPic0XASDz4vXGJQLaMXN390bNu1t20BDrQoMYHhDDkJx5
	kMkBEfJIqFIzMgt8SM+O4sx5QhSsheS5EzkTjUbztgTqpr2lj5+9iV15DDkyEGibMy8IJo6HGXZ
	LzCbswNkGWnFTSJWuRv7bevDYh+ukA22DzTA8xhSuAt9OLmCRGXk1QJHv7WxHYvUvfi4OVVspeG
	vYAk2WhE7SbzQBKxOjGFIcNisCDkxjgxTGnARFUczAKWSzuxL9oLo8m/rjxmjyMALqaLWkw3gYY
	0GhCu8g5jC1cToy8Yo4yuEGkpD3HgnV4D66hZoqt0AaSlnO8p7JuIi9YsyV0MgB6BGPhVFjdyLL
	6I1UV2FDSqxXaU7NIRd1aHAfJ5dOZqF1puKlRcbdG/D23qSjHHW1nuhw==
X-Received: by 2002:a05:6a00:438f:b0:857:726d:2e99 with SMTP id d2e1a72fcca58-86f85beb5acmr15304470b3a.22.1789490534563;
        Tue, 15 Sep 2026 09:42:14 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab8ae01sm214501a12.18.2026.09.15.09.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:42:14 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rosen Penev <rosenp@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sean MacLennan <smaclennan@pikatech.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: ndfc: fix I/O mapping leak on remove
Date: Wed, 16 Sep 2026 00:42:04 +0800
Message-ID: <20260915164204.2492099-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ndfc_probe() maps the controller registers with of_iomap(), but the
remove path does not call the matching iounmap() before the driver is
removed.

If ndfc_chip_init() fails, the probe error path correctly unmaps
ndfc->ndfcbase. However, after a successful probe, the mapping remains
active for the lifetime of the device and ndfc_remove() never releases
it, leaking the I/O mapping on driver unbind.

Call iounmap() in ndfc_remove() after the NAND device cleanup to release
the controller register mapping.

This issue was found by manual code inspection.

Fixes: a808ad3b0d28 ("[MTD] [NAND] ndfc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index a48274297d3b..0091b335b651 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -252,6 +252,7 @@ static void ndfc_remove(struct platform_device *ofdev)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	kfree(mtd->name);
+	iounmap(ndfc->ndfcbase);
 }
 
 static const struct of_device_id ndfc_match[] = {
-- 
2.43.0

