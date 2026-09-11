Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680024AA3F3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151095; cv=none; b=DAWdMHd50sJsNkBcGO+FH9OAXxTCbRuoymllmX+mLuTpQ2U7zYJDFYwgL3DFUgczaIEEvECMI+AWR+QON1AmdVi0Vp654h+wf1WCiXzOXg2tdYGZQddn/HbiYdeSwsqbmWyaOeXm8+VuvjSr2cmizs9EwGEaEkZS9/afRmxiDyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151095; c=relaxed/simple;
	bh=1LM1njdi12j0PGJlFDlq2HtxK5cpMY8FwY19TyBMIj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nPWQLQ0VAbEhJGc9yQjPh4Y3lWwNLHtKs7FHi+7lratpjeLkkivsR7jTMUm6j+xR5RhTHZUw3BpVjGtEhsWUD/3DcLCsq15ZF3jnKs5LfvXkeLsy7oaEF6ozslrH04fFcq0Nid1W8y26CPRQ7+sp0VJAftxzOtCyWXUFPSPvQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRNuRvEI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRNuRvEI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48436216a98so782690f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789151091; x=1789755891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54zB5CgKeOfrsrOhVVVkcG2Pd6Kk/5fQ65j8geodZKE=;
        b=GRNuRvEIQBVhGQvZGXroLC9MiHjbDInW2prMHl1jbc8BakQUl0ypf2JW85vdPOmfHS
         FbhPJTkeDST+emR0wZYREGpEFV4of5g2D3lYSyB0AwuWBOAVxb0LqMHsMr8iiGHC3dGC
         40tD2/Mbf/fQ+7ZMWJ/SCKpFkDB5laEVOFLjcXyqU5Vl3NPiYvBrwVN0DrNr0IUv+9vL
         kp+MBVNpqhdj1py3FpEr7BbgyKyaWleqlvHaJ3fpCGCnZQxQpftxna4bdA3x0rKriNl2
         5qvvk7YxtLiM6Z3IR+tWFx2u5iETzhbzjufTrR2CmMu36JCrwSXt6HO1M48hG7lkqiyb
         8Y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151091; x=1789755891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54zB5CgKeOfrsrOhVVVkcG2Pd6Kk/5fQ65j8geodZKE=;
        b=Ed+a92W+gNFclEfG+dFtMXDbkRwVX4UFUXYxbrEJtArFQBm8x6qA8r2EbBtSTfcyag
         od4VWJiw+Jt/l4LwVSykyBOR1qpa81WT8Y7iqXKGrYsDw8x6TdtYepbM42N+2tOq3/H9
         ubj5gae9k6kWO+zwVC+ubgSGXJYpzB09O6UnJUnNhLC8wQM/71zfiUmo+ZzI9HneKmPp
         8Q46hgmOt0tcd3y+8e3jDZeo1GxLAgSaAnDo0JkcopE8+NQKgDHnHlXhWZN15Rc9b7qY
         dCMfOZYKnIbgfed2+FKteg8xBtZgnOw4EtbjCiy8YferB9QU3XEDHoEhU+pXdieMs2fx
         BUKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2olZqzF+43bNtf8aEeIUfIYEI05rDpS49QXi2FUzbg/mQzpGg+20EHWp2M+jvdkOjknL9a8uXQnYX6o0=@vger.kernel.org
X-Gm-Message-State: AFuF++lINDqvAbnD3AMKKLxG2bVn4l7uFlV56MyQXExSo90oALBc8PNJ
	rjffcDwYyInQ1QMwFN+b8dPHYSyQdrO8GKtJUj6VQ0f8DrmShbQNN60B
X-Gm-Gg: AYBFou2BIiwiriPQcu27T0nXbqAPtfs3RtJ/X5eYCtIXiTGwWU+KFWTPTEaVX0OYcE5
	WzcEkK9rojK7oeaJ8VVJRmCy4dnSEcO1twVLdkE0ZY6Ebzs3y3yBar5jiHXLqbYjnNVaSUmqWE9
	G2XuyBHrghZW2oD26Ro+LyjP0WR9rTkN7SCsS7+RdtGY+1wEOsmrtj+0XY3wycRXiOWHxNX9yWI
	1okKuw3wwrr93y4db/AcHrjFSsm3z3x6ysCbbEFOAxhF+/8/pW/IRtw34XX9N2Rai+bF3k7xdo1
	wLnjNi2RuFk4VoDOaKHYn04XcQGBuo6yjwR/5EU8TnUak9YjiPzc4thuniVGxwJIuNN8pdDVwIz
	d+Z4tL75OevFDYIF3IDoHHuC/AisUtayIp86WsUszLejWpx02Bv3INcNnIQ9x1kqqnTIik7VyuU
	8yOxwKm3NJyB4ABOyEqpEA3UsJdsnMLSBdEbvSvnVxVNdAe9KlGT+EPiVFH/sTL30p0cdZ3QzPs
	H0dzsYreAFyE0H8SO/dQhYyI/g=
X-Received: by 2002:a5d:59a5:0:b0:486:f4cc:408e with SMTP id ffacd0b85a97d-486f4cc40bemr1428270f8f.22.1789151091444;
        Fri, 11 Sep 2026 11:24:51 -0700 (PDT)
Received: from fedora.lab.notiustin.com ([2a02:2f07:7211:b100:4ff4:568d:f2c6:5ab5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm7810131f8f.20.2026.09.11.11.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:24:51 -0700 (PDT)
From: Iustin Ivan <iustinivan2002@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Iustin Ivan <iustinivan2002@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3 14IWC11
Date: Fri, 11 Sep 2026 21:23:28 +0300
Message-ID: <20260911182328.9267-1-iustinivan2002@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal keyboard on the Lenovo IdeaPad Slim 3 14IWC11 (83RQ) does
not work after boot. The keyboard ACKs every command during probe,
including ATKBD_CMD_ENABLE, but never sends any scancodes afterwards.
Booting with 'i8042.dumbkbd=1' makes it work at the cost of the
CapsLock LED. Adding the atkbd_deactivate_fixup quirk fixes the
keyboard and the LED natively.

DMI: LENOVO 83RQ/LNVNB161216, BIOS U2CN19WW 03/30/2026

Fixes: 9cf6e24c9fbf ("Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID")
Cc: stable@vger.kernel.org
Signed-off-by: Iustin Ivan <iustinivan2002@gmail.com>
---
 drivers/input/keyboard/atkbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index b9ad2381f885..923f77808381 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1938,6 +1938,14 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
 		},
 		.callback = atkbd_deactivate_fixup,
 	},
+	{
+		/* Lenovo IdeaPad Slim 3 14IWC11 (83RQ) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83RQ"),
+		},
+		.callback = atkbd_deactivate_fixup,
+	},
 	{
 		/* Xiaomi Book Pro 14 (TM2424) */
 		.matches = {
-- 
2.55.0

