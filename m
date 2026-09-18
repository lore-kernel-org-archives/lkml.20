Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6552B5172F2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748096; cv=none; b=L3fgP9IW1RrhOTPu1O/gX427IAAf9LeCU+xMZPe0pzx9P/w6jzK0QXEdzNDqbFTgH9POcmkGFSv1kJPbs617+d59uB91VSIOIPti8XAOHgYn/n1y2QiVjxAryiV+2CvKRlUzV/ac0Uo5pQLIXuVAHMGBDd8ZIl0ksMgemg2oDcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748096; c=relaxed/simple;
	bh=0UvJYpoEn/TY4aVO9CwMQRLah5Bz+jNMBvjhtIhu+tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzhOPE9K3s9i3tXoumXSOtn0fzYj7FF+nrqmxlAYmHcwsx+FknVg2ZuZBq7q8SP+MxKNVItCD8Xjm/UiZhwf3EaD4uQthsWzzGarlFmMsGwV/rGLRNitJnw9QsfyoevbLVjyEWdxF4lr1ljxb21osD/qIN7lKyBbnMc7pOLhFq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9ViQKP6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9ViQKP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F871F00898;
	Fri, 18 Sep 2026 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748094;
	bh=aA8vLI7MAtOEMjRIQWw1T8YssBKmDitylE36RcPCelE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U9ViQKP605sp41Kl+OYIXFTMHNkjsPaN2gmL80+h0GHT4bi0XhukSKAuCSKudzw6/
	 mNbemGeBBrsxCsLMXXsm6OTFprr7uZGpyNidrH8gkohXkQgyfCSw9azU3Owq1X01pZ
	 alemikg424ug7GwLvdrtHnzWS8vmSx88qc3pvpjedEiXydpPjvY5UZOwvyN1iyIShg
	 bCoYirL5Dx6eXBb8efux4ufgjE34cX11PprEfTcSMG4+kNSDIDCPJCL2H239Gaho+E
	 AZbEBytGNJBIo0AnucpJq525EwCsHX07AFmmPOyz2QCzPGYwoB8aMKeRD/Z4cczfkq
	 mPcYCVUXFieYA==
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
Subject: [PATCH v2 11/21] arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
Date: Fri, 18 Sep 2026 17:13:55 +0100
Message-ID: <20260918161407.2300-12-will@kernel.org>
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

Allow the use of per-cpu variables from noinstr functions by marking
__kern_my_cpu_offset() as '__always_inline'. This will later be relied
upon to detect stack overflow of the overflow stack from noinstr C code.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3dc7291b16e9..cb9ae8a1ae87 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -21,7 +21,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 	return read_sysreg(tpidr_el2);
 }
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
-- 
2.55.0.1082.g2b9226bbc0-goog

