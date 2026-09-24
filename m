Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B352EB10
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212443; cv=none; b=NTtdSDVnsM7i4vfvVVzrTWk5m1nmGnUkziLcgKigdauBW/5IuPKHlsrK0awkQuQwnGFvibpI6MkZe91cJ7ufwMzYapYiJGhouc4f4wQHOTwBkJOGjCDfwn2dC66MwvAf7uOej5Hk9sGe4P0CaukQFUYOD4HZMyjXJD4RHHblo+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212443; c=relaxed/simple;
	bh=5k0iMuygLlFXQn9BbSXp9oE5JmPJd8WYIsrUNr6cbXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NRtYPx7HT77Inj1A3jeUkFm3phYyuRdXgAh8uxY5ykX8p5TS0/TS4s/vGOP8nugRzjMIXRmFUAgcnv7y/B64HLTkBu/kxTxHFSam/EGq4+Xgg6e4DjNsSQmnfxfjtHG9/RmW11j7vkq9o/QmBzR+H76/SupnukTrYqPEl9ATBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHt8JAeT; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHt8JAeT"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93a40a9a01aso38374385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790212441; x=1790817241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/tOsz7lRmLwRWBhmFynbfnzkjixOzoIc2AF6i3L4yA=;
        b=dHt8JAeTPsRhBdE1bhXc+IW7qMbodJePmzAE8drY4kjnakNUrPIT37N4QFClNv75Gr
         jLKRVhvYq7ysi73lTO8KJ9863XCf1uqjAA0415KS8Y1I06s9AxWP4RG60TsoKevGltXO
         IB0ZFSqUR2yEJDgG2J8mmM/d02OHeNJIn3QDo7Nc/oiaUdDhFTWGfOg3YS0rVur2l80H
         UTKA7IS60akegNWc8xANxsEc9ep1Z5BFnwjPgt9sfEd+MlxbaTpkCd2Cs4M2zrXB7BqH
         /Q9k8Y6l7X8qh88EO7Si/UyVrnH8W5Tlxqz1Bm2n//qh/gtZqSkF5LMKZtgo8TvK8mt0
         /g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790212441; x=1790817241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/tOsz7lRmLwRWBhmFynbfnzkjixOzoIc2AF6i3L4yA=;
        b=VfCiXePrFb7qKrF/w+7qLCi6Z5Gzq2F7pJUSdPYn9G+E8xgMhzN2jSGRjY0m+QGznL
         uqIq0h1YnAlzjkus0DqQrXzMcGi2QO0TY3BWTz7fakxiEFoVNWaPAuFsHL+14kpIkveA
         7pjRXBkqFTO2KrR4Ek1iGh9aIOM/xQVCA9SCJHQbOomrNoquMnaDQMOTzrvSNEZAfLtW
         QxmbOETxkDjLa9R0IvCGSHfaYzXiMCk2BKl1BemYW/30QeK7FtNTWtVSbMtrQJqcJ0dH
         XEY35mDi69QGQuwbMda9DulwaRWZyBUjjvqDOBNIzythDPIBy+ilOqGjYhgvbCXmiRfW
         FzGg==
X-Forwarded-Encrypted: i=1; AKwUvBzLiI2yPZ0SiSmSEpedRECpogMs+F5QP7DvpL6f0DoFQlUObYZK03p7Wf4JxUABBJ2bfOJrufyNGjynZjI=@vger.kernel.org
X-Gm-Message-State: AFuF++kcng+L392KePZlzDxDF6rRUOuHSa1yQM/j2UVyMTXg89sK5YH6
	g55m78MU8lqJbnJcG76FoKd67veVpYOmeWHHH9mG2aAuDqA+NckB/J14
X-Gm-Gg: AYBFou3dvtoF/ZrIoMdALAGbkqVH7/VkOVTXFKttdivkZfyawYHs89ACJ/vhfOEC8c3
	3uqTZcrH1A/VqfUAq8QaODCPQr9vW5TiNNmC4J0Uur2pn0xj/wEyIDxf7UZoEVke5cnhciygtiN
	kklsjNAiBp3ZA9/rTiFSHqHiIgiiS0r/e6y1/P0COiNwr7a56PerNK+AMBQANF+UMoogZhc2Zta
	2mHnqyHXv1ZZBWaKHodQoX8q5Xh/+e2t2Dx30GTf7UpG8sSWw3L6PUBCgzBCE0sr/I8NOGDww9J
	BKodToZf6J9NcjsNSK+qckb1g4Cb48AxIW9uFog5I/prUovuKW2foQTi3sf/XKaf1TyJ0ea/J2e
	swDHtOhtg5Osp/43rgOvZ3Ay7LjK8h55AIhegLTWN/Rro6YAKJ5bc7Ei3T1Rfav/18CJAv5nq1K
	NUedbytGG+vZqaM5DA2gcwd4OuGyImETM5DFVG8Rk197nUB8J+zhvyoVjaGd00bhEhsn5Ja4S6L
	XFhgah9J9gD4KULSFfXng==
X-Received: by 2002:a05:620a:3187:b0:939:a1d0:b5b3 with SMTP id af79cd13be357-93c36670f5cmr55343585a.11.1790212441496;
        Wed, 23 Sep 2026 18:14:01 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24822e3asm349372485a.16.2026.09.23.18.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:14:01 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] of: Put coreboot node after compatibility check
Date: Wed, 23 Sep 2026 21:13:50 -0400
Message-ID: <20260924011358.734722-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a referenced device node, but
EXCLUDED_DEFAULT_CELLS_PLATFORMS used the result only as a boolean and
discarded the reference. This leaked a reference each time the
address-cells or size-cells warning condition was evaluated on a
coreboot system.

Use a helper that checks for the coreboot node with a scoped reference,
so the reference is dropped once the check is done.

Fixes: 8600058ba28a7 ("of: Add coreboot firmware to excluded default cells list")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Changes in v2:
- Use __free(device_node) in of_coreboot_present() (Krzysztof Kozlowski)
- Switch to my oss.patchbox address

v1: https://lore.kernel.org/all/20260802023821.494178-1-dbgh9129@gmail.com/

 drivers/of/base.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d71ae0449360..f63a9486b130 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -96,9 +96,17 @@ static bool __of_node_is_type(const struct device_node *np, const char *type)
 	return !strcmp(match, type);
 }
 
+static bool of_coreboot_present(void)
+{
+	struct device_node *np __free(device_node) =
+		of_find_compatible_node(NULL, NULL, "coreboot");
+
+	return np;
+}
+
 #define EXCLUDED_DEFAULT_CELLS_PLATFORMS ( \
 	IS_ENABLED(CONFIG_SPARC) || \
-	of_find_compatible_node(NULL, NULL, "coreboot") \
+	of_coreboot_present() \
 )
 
 int of_bus_n_addr_cells(struct device_node *np)

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

