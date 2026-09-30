Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D2501F5D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776617; cv=none; b=JPNZNaeTcRsreNXTBY2Vhb7f9Z2jK5wqGbsAe+/ujfAXZznFRSoHxha5hjNIsfRLdmMJwQZa4xy8m9ROPF0wRkW1obBIhNkCOn61WtWS2j6CDjHxj+dDgIs4vflA/ZPI6iHcEZ8TLDxs7ZdEN3y2HpcyTcTZQs4O1nDcEHVeOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776617; c=relaxed/simple;
	bh=ee5L4TFSH+xrEy8uvpiVGNltqDEqeNPSyTSkhUCzV4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYxE+t7op8i9Sl0P9AzbrOazgbCk23EHYA+FDGrX/k4fxkmGwwsZ91B2mIo3smre8fcMU+W1rIuCy2oOLGLvLb8BBQgZidx0PI3u8BAJ7v5jb6QVpmkpljqfF/u61CnP8ChogqTaqZwI7bEHZQeQbsZmA1laAovSrAkdcr6tKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeg1cmdi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeg1cmdi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E9A1F008A0;
	Wed, 30 Sep 2026 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776605;
	bh=pWhYf/PBAlBJrtYtS9eILNv9A1vD0y9OBe4mhmHYg8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aeg1cmdi3VgXmX9OCLFYzSH59oaZ/Lk+n2NBk27OzbLo/3yQ5K8PmD/36wosfsK8J
	 oxDemdVUmiM92kzmeln3/sR8pmMEgCpfrTfNp7I7BCRmIkQKLFG0ECpf2eZkOddd+0
	 TsM7Lb0LpeXqzItE6FFO81KmZrHTkV6bAXsn5VnvGSydjRMnRXT7tI3PTr3WV6IclI
	 jOh4H9n+RBWdnqb1OiPpbQqQYQjgFBhIHk4kwUIxnpf2IF2U5HoWDOsC60KjZuOQUa
	 Az1PS3GSTj6dVCrWb4pSMF7jlquspW5d8O4qzubgcKdcx56MzpeLQrLBuYZ640vgqp
	 sExTtpSbZolKQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled
Date: Wed, 30 Sep 2026 21:36:28 +0800
Message-ID: <20260930133628.22093-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930133628.22093-1-jszhang@kernel.org>
References: <20260930133628.22093-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, these two vars are only used by kernel itself, especially the code
before MMU on. No modules users any more, unexport them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 6f51f265fb85..0d409acf9be0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -59,8 +59,6 @@ EXPORT_SYMBOL(satp_mode);
 #ifdef CONFIG_64BIT
 bool _pgtable_l4_enabled __ro_after_init = true;
 bool _pgtable_l5_enabled __ro_after_init = true;
-EXPORT_SYMBOL(_pgtable_l4_enabled);
-EXPORT_SYMBOL(_pgtable_l5_enabled);
 #endif
 
 phys_addr_t phys_ram_base __ro_after_init;
-- 
2.53.0

