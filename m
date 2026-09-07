Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D934CCDF3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742105; cv=none; b=W1vodk3AnUBKo8xlMl5/5t5guqKU+M1s4xUMgJ27MuEV6xM7OrXx/V3YzoRekkNr2uXo/JHNnrcFGUrVNkYyKpv6aLIJ2PXc2mS9DrcizdW3xEgERddjWA3mgWaPC4f5Z5SuHy00CKxTmITI6WFqYugxeKm2V3jG9QMeC7+xY24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742105; c=relaxed/simple;
	bh=UmSJIiGt72f7w0q/Y40fxXrOQ79vfVUF0J0WY6HywFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQb2aR95Rb2gfZTOEdZzoesPDbi+tqyiT0vXL5IjpZQImrnd0O6T04jPPv+SDnSLwwoaKqv/38z8tayCNaJ7btREOToet/wxy0z0ckvVzVCEdcP6X6fDF4uzAfOmXe+b33x9sFseA2wESwM40XtevHowhySyFqNuLP49D0TbI8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3s4LEfZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3s4LEfZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db18e5cb56so26063125ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 17:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742104; x=1789346904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjzyVrQd4HnZ/HqhVkU3Ug/THJKIvvL7NvTJ9zdzp98=;
        b=c3s4LEfZRnCLX+UMaXUYON34tyQd1oE6rJAHpr6DkhdDxycrqgEAI0BNdYB2iweis7
         4LOljRXyaVGoUQHvLQZxox7cJTlnpUfwrJTJLPjXAdZBt2kW8mwHLBoafiV1ai0EeuQN
         HdO/GuFmDOZ0ZvA6maro4QBjWGDP2a5Lcv1Vf7jQG7Nt44eVtmtsbJZ83pwdMdpdAMnw
         smLW65HddHIm5+1C4iLmJ5R5K8UA2gqTGWO+SUn/eObkgEMlCO72mbQ7ckhNmt/jzZZt
         x23lAXzVbY/Ces6fxwVHbxS5Q+n97YexP3f7neRqK8Yeic6emwG3/mFRytJFfENDKAv/
         dNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742104; x=1789346904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjzyVrQd4HnZ/HqhVkU3Ug/THJKIvvL7NvTJ9zdzp98=;
        b=hEyOnrlicqmQtaJP2m3BeyVylSk+g2WD/Igv4lEEx2wo0/6b9xgkxIWxfo0E73bJU3
         MCgys5euosZ7LPpEFFxE5GAO6cVaZ8QXlgIbAXxUPMKXD36cUhWClJPhccpIQHnUsckR
         AJXGBOB92j2oKN/CUhq/kh2pbTUYVFdM6hP75ZYkOvI+3s+wq0pz6ZUbqfl8R747p+rm
         YCc0+uyToYhmC9xhe9OdDjidBFDE4B0cicd/luTATkx6Gi+y4jrwBfFiz39lHYeqkLzC
         TSP9zKx7Rh2xgM9JGImiNrx98Y4OKDLC0Wuv9OdWB53RxvR23PCNiwvFUFQCbyGtiWHB
         +XTg==
X-Forwarded-Encrypted: i=1; AKwUvByHTA6pEhskyucIYEqylnTvUviQRaSxNXdOd0gX5UJAc2rWV4vRv43chvMrPr2fG1Yh7HnYv1W5Mb1tyDk=@vger.kernel.org
X-Gm-Message-State: AFuF++lx5/N6EUSOxTTDbrkuTHTDAISwh+eEn2Vw8Ufu/rk7EXSmGFt+
	VPmBKnCNcMjwDDPkw2gMrBMK35MaKSMyN0lViFvL7U5brM9aWMaxfURu
X-Gm-Gg: AYBFou3JDRHGb+z3/LtBju78i5S75KREU0K3s8kxBJLAJvGJGnuBbL0oC80JcK2/HhP
	EF/8PRkvupSedbbwxr22XbJ2/wUD8C6a8anhjg6OMzf7dpi7FH6veB1zF1FRttHJPeiDxtuLDsl
	zL8NKO4nxnIOwkSHOuAaysE2mUg7AkWUrf70rRS1kjxclngbc4HOybbj5QEGm0KAWcFu2eLbKA2
	h55ubvogRXK926EJ5WPXW0N13g4bxiRJ3XsC+dYXXLocJYB8hCvU1mFcLXh5CiFGw3rfDNMH/kV
	oUMgrOCqKC4EFRt+KaTwDsPHziEOssB1Fsv3rSA4hkp+JtHEyhzQTnL44XmtooqrJeW1nAT3REU
	0knKDdHAopJhK4eFAdr72jvQ+La7wZgN8yTRWqOLCMo2LVayVS1NoMdn3j8F+Hv7E2ytxzcHLyh
	R++4foguzLE6ctGl5b5RUq03aQ2wWWXDkeQbzBB2UW3U9CDwTm6RTv1k90asdyVA9fkANB3rBX9
	brDJ6UsRr1dbOLrzLo3rA3jQW275KSHIZZ3tBeBpWJZ8GDrYPA+oFguI/Wkp/Rejsrz0F1jlbmf
	5fPkogfMasRA+sSpinoB1FhcTkfohz1+DkABKg==
X-Received: by 2002:a17:90b:4c03:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39b26130698mr27921852a91.11.1788742103701;
        Sun, 06 Sep 2026 17:48:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm20043166c88.3.2026.09.06.17.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:48:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: powernv_flash: fix kernel-doc for powernv_flash_release
Date: Sun,  6 Sep 2026 17:48:21 -0700
Message-ID: <20260907004821.225576-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is powernv_flash_release, not op_release. Update the
kernel-doc comment to match.

Fixes W=1 warning:

Warning: drivers/mtd/devices/powernv_flash.c:271 expecting prototype for op_release(). Prototype was for powernv_flash_release() instead

Assisted-by: Opencode:BigPickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/devices/powernv_flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index a12427d9e20f..fe1d6684d0bd 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -263,7 +263,7 @@ static int powernv_flash_probe(struct platform_device *pdev)
 }
 
 /**
- * op_release - Release the driver
+ * powernv_flash_release - Release the driver
  * @pdev: the platform device
  *
  * Returns 0
-- 
2.55.0

