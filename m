Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25F251477F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748067; cv=none; b=SOveDLpVgkP/OdSgCpWfRri7j9xYSkcRrMbPrR5I5icPdarmG9fl4Y9J/DtZNdk99nFPut6Cmr6ql23Pc/yelaDbxX+3nGoOQFbDsz6E4stvUdzphD/U7rieMQCVDA6f87bjRIyGHBFz8YfmBzdFrk3B3HJrsjxlRnapXbbiOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748067; c=relaxed/simple;
	bh=SjZ18QX/2N+ATPjK2ecF/18E9fYVn7LnNkzfiyyaSpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFc+6hB3s0rm7NJP44o4vwJK1nPMAjuH2lLF/eXfnWihYq1qkenGDbUcswb1+ae8Oh9oRhpe7VRQEAeHzvPEeFPeQt3g0XRN2WgjPiMIC8eDq60PyPkxXwDf7HemN+zw5mERoj28CeJI4GmH/ldS4w++2Ux3VUBEo2tNXLfCvAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYefk78/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYefk78/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3291F0089B;
	Fri, 18 Sep 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748066;
	bh=lbrobJz80vYx6iQgmyTnPoDjm5gh3FY+/PSyqHaMdQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LYefk78/b4y9UWbTdqqO/keF41dagr6o96GY1C4WOOV7R67uxQXxrUKS8tTbN/Kyu
	 Hs6DLLoPzOkR+P+iHexhfDJL4GDd8X4us/9HbIL6hODwQ0GH3KIqd7bORm6xD7K9Xe
	 vkOCUDo1X/RElORdScxyUerbJgh8vLKurXlLstcVK51hh58CwCQ/8JDo3kqOD2qzPN
	 SoJeozoy2NERbXs8ia1k+PF6RqrdK4PTEoGCGiYzDaoVyX9Z1gUg5cFc+VYxY3mfV5
	 IXaZRyqIBQsbtDclwqjpAPldl0sXXetkDkloc2e+UcVoke37rJc25s+DzLWXD3qb+Z
	 9Nzu88fR7MCwA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 03/21] arm64: stackprotector: Temporarily disable per-task stackprotector
Date: Fri, 18 Sep 2026 17:13:47 +0100
Message-ID: <20260918161407.2300-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per-task stackprotector relies on telling the compiler about the system
register used to hold a pointer to the current task. As we're about to
change that around, temporarily disable per-task stackprotector for now.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..b8270b301809 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2455,6 +2455,7 @@ config CC_HAVE_STACKPROTECTOR_SYSREG
 config STACKPROTECTOR_PER_TASK
 	def_bool y
 	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_SYSREG
+	depends on BROKEN
 
 config UNWIND_PATCH_PAC_INTO_SCS
 	bool "Enable shadow call stack dynamically using code patching"
-- 
2.55.0.1082.g2b9226bbc0-goog

