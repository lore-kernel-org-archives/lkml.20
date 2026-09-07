Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E573F1071
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753090; cv=none; b=jdHGLaFDQWhuW2JCfX9bGFldpjLAZyu2iBlaQQ6Ofyo8IjX3tOfgL8vK0jAv3CCtGvaQSEwhBsY4CafRKbjg8vQU6zBPxc1H1284SecTI0CNDrln/ao9AKwxKoVVSnIhQ6zKifuig/xnGIa97hdcaZptCvg7w0hXQH61n2JVsb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753090; c=relaxed/simple;
	bh=DRbiHknfTdWf8cVd0fa3aHJlkJRIF0q+njt+T0kU7e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrUMICG125H4ohZQKsAx7H3VGgqZrSJoD005a+hIlbL+/fUyyyt0RzvKUg2XQQk7xvPtjTjXwMc8c/ycZ2C3fEvz5wVVKNUiaMAVNql8g6zBN92anEtpv2P2qF2oQ9ABqceKBcCfaP46DGMUkjhELbBNCVO6pWSbx8cO/gVBmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m0tE0bqS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m0tE0bqS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A0B91AED;
	Sun,  6 Sep 2026 20:51:24 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 419D03F7B4;
	Sun,  6 Sep 2026 20:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753088; bh=DRbiHknfTdWf8cVd0fa3aHJlkJRIF0q+njt+T0kU7e4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0tE0bqS8kuL6E4xKkXdBndaV9dmrJWnYtayuHMG326QpcoLZLpPAb0/DA1T8G6jb
	 DXnz+appGHYQ202Zmp2YaMc9Y2T4MHhlynyW2ZLMvNFmRT+PlxlR+n/SRfOqFkxe12
	 bGEapHLRVCvTrQK4XwEzjd8xDQXlHnUjs2nsVrK0=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V2 14/14] arm64/configs: Add d128.config
Date: Mon,  7 Sep 2026 09:20:29 +0530
Message-ID: <20260907035030.2839978-15-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907035030.2839978-1-anshuman.khandual@arm.com>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a slimline configuration intended to be booted with ARM64_D128.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/configs/d128.config | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 arch/arm64/configs/d128.config

diff --git a/arch/arm64/configs/d128.config b/arch/arm64/configs/d128.config
new file mode 100644
index 000000000000..e0a2d7bd8f20
--- /dev/null
+++ b/arch/arm64/configs/d128.config
@@ -0,0 +1,6 @@
+# ARM64_D128-specific configuration
+
+# CONFIG_UNMAP_KERNEL_AT_EL0 is not set
+# CONFIG_VIRTUALIZATION is not set
+CONFIG_EXPERT=y
+CONFIG_ARM64_D128=y
-- 
2.43.0

