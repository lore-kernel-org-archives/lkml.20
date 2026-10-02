Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C45480345
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936057; cv=none; b=Mbz8A2uJSTZgjGE0esWlBwMIZod/C3JZ+q/0V4dWS2RbSlt8f4NquQnynTDp3UrTde0Y30XUtAc8Ggqqdw20qA1LBTZnicjr8V7MHvNpQcmKAI72NKW0WXeEdyKc5BbUhM6PUTVk4BrgBHO2jgN0og6JNrClDGet/RWXiTYDiE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936057; c=relaxed/simple;
	bh=jRHxfKExzJ0RhQLUCZgSRqYeviIR390q9cNePRowPHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLhbQR91SBRuznw1tG77a/Bom73vzkqwvh5WZMfPO909jcMevKDb/3zP/r9sYd66SQZuF7kPT60OvzTndYTrMetlEHc/KcVEgfR6WGShtmGC6fFxFRguNrkcetRAzjgdnqRmNj0Ia78a+L3GdM56kFAJEkNqoMJGDmuWDAM/wco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRv6qwPv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRv6qwPv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FCC1F00893;
	Fri,  2 Oct 2026 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936055;
	bh=rLZuNWID/fpUSRzMnmbL9QLBV7bJ81D8XhIMIJaLm/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PRv6qwPvRS3qDRMwRzLiCV5ErnZMVHsLk6lvP1W3V6M2aOD9FdkFc24Zlr2LigHkg
	 8cgiHSfXNABMBSuNj/EZnsNfLbaSZck0H9Q5ccbERWeuFRDDIRHylMwFQFikzqkLam
	 Cc/Ek46N+jIkjc7W1R8TIw7WEBx+LE0dvSE4LY9hsMXgytdufBNTxEOqMqzPtQWBSs
	 xRFZO744cz2BgZaidaAKLfaFJSL09+2FxARPAAQzktHJtpgIU6bEfF2Xr8IHWMtDhi
	 glPSIpmxfk/9+G3nLrdGQ28zi/2SeI6vTAXQ1+afKt+yNVGBbpQ8X84lA78JKIDt2C
	 gG5V11UqKH8bA==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Judith Mendez <jm@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 3/9] nvmem: uniphier-efuse: Enable for K3 SoCs
Date: Fri,  2 Oct 2026 11:13:46 +0100
Message-ID: <20261002101352.1084447-4-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101352.1084447-1-srini@kernel.org>
References: <20261002101352.1084447-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Judith Mendez <jm@ti.com>

Add ARCH_K3 dependency and set to always build for K3 architecture.
The uniphier-efuse driver must be builtin to support early probe of
k3-socinfo during boot. The k3-socinfo driver requires the efuse
provider for reading silicon revision information on AM62p device.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/nvmem/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b..df65e7ecfa21 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -541,8 +541,9 @@ config NVMEM_U_BOOT_ENV
 
 config NVMEM_UNIPHIER_EFUSE
 	tristate "UniPhier SoCs eFuse support"
-	depends on ARCH_UNIPHIER || COMPILE_TEST
+	depends on ARCH_UNIPHIER || ARCH_K3 || COMPILE_TEST
 	depends on HAS_IOMEM
+	default y if ARCH_K3
 	help
 	  This is a simple driver to dump specified values of UniPhier SoC
 	  from eFuse.
-- 
2.53.0

