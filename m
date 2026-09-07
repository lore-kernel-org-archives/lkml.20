Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AF451FCB1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799391; cv=none; b=p/EtCRwyoOtjaWb1NuM/8lg+aT8OSH0XuBM0IUDaSIq8I0LK8iF6ymgi1xvYDLQF9sU6f+1YXwD4QkPg+PHiecExbY7+F+GFdqhZt8GRuKShBb1jLSdpGJFSSLXjLuQdJocDror4QLhPXYotBA/cgQ2jpTngQOwSktGQ7WwTmyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799391; c=relaxed/simple;
	bh=2xoBQrYiLQhwyzzjlC/Rrs4JE7nEyMXez28Fj2eF4ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiX8DpAjtVIvHltMT1V1NgAdqOTdm2bEmdgVs/183t4XkfheKnF14bzYzefSznFzBl4cbNwzs590+lmcUpS5TtbpcQpP+LNoQ89Ggzk38d/YYiMCWveqa9P2XU70zjkksLL45k1jHHx5/J68lgD3kRaPnJ69rQQBCsp8gnrOsgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7Tw5X7w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7Tw5X7w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C05A1F00A3D;
	Mon,  7 Sep 2026 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799390;
	bh=Fp1WUkxnhvJ5IR2eKQ3SMHt49du3trxxPvYQkmiNNK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n7Tw5X7wmPClS1PfidWlMSSGzwE56Vyb+K07OW9TKFGgJ/1QxvCFZoKgfDEo4IsKp
	 uPIWzntXgAWLL4aYjmXCXMiCzDQ9zEN+mQWDVqzPIqoYMhnVduceRNdLEq5GbWglKm
	 3wYOGEQcyfNEC0iyBdCqh3WErPszKpUEgaW/42wJmPP7KbFvHFB/k8kuRoAaYQyExa
	 BsJekbPdn/amcdakWif/SD0mswbdTyZxn7YKG1MzCx/dMhvX6zof29YelMhynlQ+Yf
	 jADdEkNMyKYC+WvGrt/bNz9WDlU8EM78l7YYkczXS4yQqEbsizmeYBNCrP6+T1obHs
	 Gqwi/u4rn4gtw==
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
Subject: [PATCH 03/21] arm64: stackprotector: Temporarily disable per-task stackprotector
Date: Mon,  7 Sep 2026 17:42:28 +0100
Message-ID: <20260907164247.17223-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog

