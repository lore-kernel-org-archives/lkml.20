Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210AE5013C4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743182; cv=none; b=p3xshr1qvPRRen0Sw0YqWitg7IhImoJ07u8jwT9AW4axFwcakgKQsoGJMQgxzeTLw36WSBhfCoKoVsXKe2d25Sl9yaXUQqur6r4oDhoJjfgtfCM/5lqptFL9WHBzIMhIXEfcCW1lfFTsqh74eX7AjVGlE94dYUPnk3R39DZ4+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743182; c=relaxed/simple;
	bh=Ajd9XQ7gqxce7lvKjbOPNw7VgVuVSkLx4iuc4BFMZBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjWZ/Aath6QYNdILde10weaJBNVCV+2KrOs59UofLmz9I57UAFamuxc7ZZ48+N7tJPOIN5Dl7u6l81q3LlvP0LGHvMxBVJAD9cbc5J5NustX1liK+lEd9BxpETIBO8MGIVVkD/E8oI+fEkQHlov2Rww1JvXREkIoBbKpev23F7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imnPClmV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imnPClmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50121F00899;
	Fri, 18 Sep 2026 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743179;
	bh=3OEyPLUju59/39dkHiKB7wvauJx00RLbv2DdCx5WdsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=imnPClmVGdWUmAHuP36XywZkaX0YE7MeYpDqPv9GvSIIU9YAgIeuz1hp/uE3BnUtx
	 wlhcZonpXMDSF4P5j/9RwZ34w8zo3Mgw/P9Gfe1GsK+cxsLigNzcR+msofZGoiOBi4
	 793iHZvHcBeV982XukUfqKsAh+Pee+or0XO0uUSQuVG4v6CAYYEp/JtD3vW8D3pQYP
	 XpNiUmzhC/JPefbD9WjBvDfpzYdPIFBwXtMlQJ3IvhSGmVLElZhm8QJd0+LV8O8At7
	 ZIF8Ay4KLBmfPjS+YPTlRrFrIzHJLD/SyTHYir+Ln4WKyAe2UpQ70Zzn4hA0tzwzhS
	 gcud6zHV0L48g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Chenghai Huang <huangchenghai2@huawei.com>,
	Weili Qian <qianweili@huawei.com>,
	Zaibo Xu <xuzaibo@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Kai Ye <yekai13@huawei.com>,
	Wei Zhang <zhangwei375@huawei.com>
Subject: [PATCH v3 11/13] crypto: hisilicon/sec2: Remove check of CONFIG_CPU_LITTLE_ENDIAN
Date: Fri, 18 Sep 2026 15:52:13 +0100
Message-ID: <20260918145217.1669-12-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hisilicon "sec" driver targets arm64 but can be compile-tested on
other 64-bit architectures. In preparation for removing the definition
of CONFIG_CPU_LITTLE_ENDIAN for arm64 (since it will be little-endian
only), invert the check in sec_set_endian() so that it behaves as
little-endian by default.

Cc: Chenghai Huang <huangchenghai2@huawei.com>
Cc: Weili Qian <qianweili@huawei.com>
Cc: Zaibo Xu <xuzaibo@huawei.com>
Cc: Longfang Liu <liulongfang@huawei.com>
Cc: Kai Ye <yekai13@huawei.com>
Cc: Wei Zhang <zhangwei375@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/crypto/hisilicon/sec2/sec_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/hisilicon/sec2/sec_main.c b/drivers/crypto/hisilicon/sec2/sec_main.c
index 752565200c16..03523cfbb28e 100644
--- a/drivers/crypto/hisilicon/sec2/sec_main.c
+++ b/drivers/crypto/hisilicon/sec2/sec_main.c
@@ -484,7 +484,7 @@ static void sec_set_endian(struct hisi_qm *qm)
 	if (!IS_ENABLED(CONFIG_64BIT))
 		reg |= BIT(1);
 
-	if (!IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		reg |= BIT(0);
 
 	writel_relaxed(reg, qm->io_base + SEC_CONTROL_REG);
-- 
2.55.0.1082.g2b9226bbc0-goog

