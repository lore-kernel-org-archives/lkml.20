Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572326;
	b=TO/awc0y+6HV/Hb5SjRCp/W26sUSO28bUTinxHPXxlXIgwPyWokxTI5veqs7km4XW0aV
	 eVoif/qDeEgJNDvIqyBtNiCHBu2MGEtF2nw1h8uR0X08PlLcjaVQ+xdzqjanzQasp1taZ
	 rzZ6fIYm8o92d2mVy7uTL17BwnOdbpTJcS+6IaBVf9cyGo03MConngrFWZ5OesAFJSFaa
	 AGgYUiiAK10eCeEkXX2jXrdWwv56BvU5d3ufU1/yeW6+63vu4ew1a/PS6OeOPlZhAhkKS
	 fawze2+jO2tn5WE9CUI6dKpgwsMATeWb6dSLLwUMDU+j/DUqnAqFD+kkTgLA4YANxBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oYiJNCm3dPOIvzBQ4ij7Am1GRKzxdtfe/iOcs8mQrc0=;
	b=bfzjcG3jQ3UM8zQKUOVAYGS9cms0LcobAp9tQANYVcPPrf/l9c2u/FTb/Xt2OFfJKuU8
	 LqGKnf6KTVOw589uuAJnwq27zc5LgHlZsB+O8L12evWCP6C0CHeAfFKhCYPmVPID47EIt
	 pB9nnvAW2O2juX+hdzYm+gVu+HpqqhpOlbbhn7Iy5Uma5CO1ZLAUdJahI2eCjND2U70WY
	 gTyVeid3wFY83B7zXcOW7D/ObpbMPyY/wuJURAmWhkYqXwnpssBPus6rHRAF3z2JG88p2
	 F7wKWuGLe2DjG1XLLjROe1KksawpWUwQb88t09n6eHHdn4K1YW/ZFnBZ4CKFr7zH8Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I2ooZpGI;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2775C606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2775C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I2ooZpGI
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1141264f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572324; x=1794177124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYiJNCm3dPOIvzBQ4ij7Am1GRKzxdtfe/iOcs8mQrc0=;
        b=I2ooZpGI2PqeKBO+rDDiTvxGNOBwxhL5WAyKdoxPI+oFkvWSgdN0rDu1A+AHvzMrjc
         KEKrCi+Ck8AxjoFFVjg60rrzRfP2VbJF/yJByjkjZ658zgoE2qN+1k5WsBcuKtk2mR8H
         U0Xd2bUF9uHVsPP4HydVk2NK1ya66j/2LJzP5HXrbL17iRBl4d2Vg32tQ4ZVoJ+rgKm+
         ai5kH/uP4gicx5UcBq5pdeWS6i/7IciORQRoU/+fqzujO8PBGc3+wATTkyc31MOKoCU/
         89MQOYkmuac2Gr/6Hnr0BIHUGUCzVVPIyz/FzCOLaA5a1nM4oT/3jiR0O0/GAFji8S0M
         7Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572324; x=1794177124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYiJNCm3dPOIvzBQ4ij7Am1GRKzxdtfe/iOcs8mQrc0=;
        b=eEunof7woOmZplvghzAWJmALWYgvYI7y91dcRGSTwjAZTIv9FAsVs/OAWZyM1hj5hH
         UgSs+kdJ/IAYDzSMvI8M0U0fwL5Ak48IHK+kByP/ZHzhUJWVmMzwNVa8VWSuTuE4Nfkk
         yLx1q3pwta4YPc5CGub1vVY64kt0Ow190GuOvux4BN+OyxE5DktY1Zx3Wi0UEjpM3wlv
         sOnf/JVr08Q3mdgO7gcblpWCYuFKfU+jBxBycStgQlu2iPUA//V+HBvj4sBgv+4OOUvT
         daGE4oAIF8ysRa9sopgmvi4OdBiefcWM1qIC+4yhIsoxOOQfChJCbyaDeLDDOLzsR1qO
         cdcw==
X-Forwarded-Encrypted: i=1; AKwUvBwMHrdJNi4phRNdyy0ZIk3Wnz9IRPCEFysRrYaJuJhAEy2ZvFBiQxk9lytHswwp1GlD3T9ZuvQbtCvc9Kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/mB6EhMyZ9ZDA6mwMisRD9UUvG4GTczLCOYPXDpPeR7EQA+4u
	Ra0mEmxtpZMUa54p7ty6kEpRsiEgHBfCf1/6s3TODcTkqiGviGosOmgl
X-Gm-Gg: AYBFou0dKwpWEqOT45yeWCwQFJCjSf6hqRyTfIQeORxUfp5qxMOE3UW3H5MTplxJNI4
	plUo1Jr00G9BruzXmvtdUvDyb+Jmcf3tN+SpkaVar525E5mwan1CnvjCCPR/95u9JuJ4nn4Hqw2
	s5onrkPdbAZZclxWzSUZjuwyh3fRepSRYQfgApWx3p9E+w3cZixJpR1eEHMwqvBPegu+XQ3wcBm
	WLFXY5yc1fJuXyaYJqeMW4VuWAbbuqfbCORVkEr5cXzVsQSVuyaJKlT5oIaP+oA1pWOJ/v/dJ/L
	uSWhjIg17jexUOwIsIRuVYFsyJA4z1NpNcnkJTjb8tr7th02BhPvU4cIHq+NQgK9hfAwaIgMAlo
	ydLFhRc/Ebhcsa/jScuXyeo8fq8YjrhVzUIfZdmMC/ygA1EQw/RHvbdZkNaIHcb3KmZD4Wvh2cP
	5xWqM8GJjSx0hHinvV9yf5S9UP2iD9wQJ3Ie0AuLRuiGGrnTLK78tNilYn+gCNye/lKQD7Gt9Ap
	v6Ve0jfj9CpuapRVWxTtE6AGCSRkzavUl5C7h1/F4xuGjqghL6WbRpgIj0CncmfepzZX5UM1iYT
	EXds0cuHBJQlJTM/v43kIlMD64DirXN2Xvfi6gjBTU8+dTtm7BOjhI+PcE+KpTo=
X-Received: by 2002:a05:6000:2892:b0:48d:eb44:650c with SMTP id ffacd0b85a97d-48e6e309f40mr19426940f8f.40.1793572324516;
        Sun, 01 Nov 2026 14:32:04 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:03 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Alistair Francis <alistair@alistair23.me>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] regulator: sy7636a: fix the chip name
Date: Sun,  1 Nov 2026 22:31:19 +0000
Message-ID: <20261101223125.302001-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
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

The driver header and the Kconfig help call the chip SY3686A.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/regulator/Kconfig             | 2 +-
 drivers/regulator/sy7636a-regulator.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index be6b72daa76f..88ba2770e378 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1623,7 +1623,7 @@ config REGULATOR_SY7636A
 	tristate "Silergy SY7636A voltage regulator"
 	depends on MFD_SY7636A
 	help
-	  This driver supports Silergy SY3686A voltage regulator.
+	  This driver supports Silergy SY7636A voltage regulator.
 
 config REGULATOR_SY8106A
 	tristate "Silergy SY8106A regulator"
diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index c44c445ea139..015227cb113e 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
-// Functions to access SY3686A power management chip voltages
+// Functions to access SY7636A power management chip voltages
 //
 // Copyright (C) 2019 reMarkable AS - http://www.remarkable.com/
 //
-- 
2.52.0

