Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228561;
	b=egrtLrOAigcndw4FGf8EKW+h7EJxu1/OtQBpaGGMPhDyqr3cXozWqY3is4TcqCoaOK73
	 g/VjK7OYv2H7hGWwBgli+wBI60hM74qZ0Jp7CrdeSO7DtOV/t3zb8nWP8pfAyMSsu8VzG
	 YgdGNxzSXqBTYv3S7eBks7ZJ/3aFWsf6RbSEFDMyuvAnWp1IXKlmKijxUVvkxc9es9Tq0
	 FhWbMP/kEAodX9ITDaxvlmCfwNmgIAoW3+3L1swG8X9KAR3w8ZAbqCq3T/V1D7UlOIgfS
	 TZbnmnu/NwZevPIZCYhwlDVa/nA+e5bCyEuclCnpAPY+TDebOwADLIX23fpfFPxaP9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228561;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=5MjXkTr81XHjJXC4XW9odEr71wejmTyaWWO5F/Vmk0c=;
	b=qEgT4ewVK36oTLVb1HPReaukvfws/QBz3jfXXL7Cx41kd7bOWlbHu+WuLBGLIsGY9DFS
	 /mSe2JyBHmSXp0tUeGTpw/XuEfeb4S4gAZVjhOYdoJNtY7+k1o+VjqT2bx2OgeIaN0P+G
	 SPNiQS1ImUcfworhJOrUl40lI5zdSiQ17YCBeiD7FCGXqFz5H0AK9/JMPcLB+ubCYSAUa
	 r/TDSqwo0cCiewe7vhowOI8bfJiOvJI5tjDEqtX+sBEW9kqQJtJ1xDajL5qFc6qkSoEft
	 +K+oQstg7TykboKOBXiwwu5wcVLp+zsm64xdum7jiZRQcTVV9xnDOzHW2+IniySahZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmTWS3OR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22E606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmTWS3OR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652511F008A6;
	Mon,  9 Nov 2026 12:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228560;
	bh=5MjXkTr81XHjJXC4XW9odEr71wejmTyaWWO5F/Vmk0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CmTWS3ORVYMw2uLiRPHXaWL5mptngfXWG5StnNefHJsQCxO2W9w3OCu3Vbx9NV6AH
	 6UaKiE2i5DkZWyspdLQEvf9C302uhNbCSksMfN0lsXZqW7u1muAdLNDy9vP/+BeQMN
	 zNfoorjWcGlloIxeLh0FraBcY0XFYg2rP44Dm7iPuMQaV67IJPDNi7dvIKtcBO8IgR
	 9gvHbgmXe3vQwyhQtvY6l/iAVgYwNhXwJgxC/+HR/8hY2zFFcl8XQYer7iZWCeVSS3
	 uvanNQEJrcYTV0Wg8/PfjXhLrmYvRpJpaDhXqEvpaHCpzMo+Heroqm+B92+V2ZFKMh
	 jZbU9z5X0oUww==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nicolas Schier <n.schier@fritz.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Jan Stancek <jstancek@redhat.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v4 4/4] x86/boot/compressed: Enable -Wunused
Date: Mon,  9 Nov 2026 13:48:21 +0100
Message-ID: <20261109124816.61438-10-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109124816.61438-6-blum@kernel.org>
References: <20261109124816.61438-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=blum@kernel.org; h=from:subject; bh=5MjXkTr81XHjJXC4XW9odEr71wejmTyaWWO5F/Vmk0c=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfD0qu9KprNFgSVfrz4eX/r9TmvMhoE/0U6OoeOkd8c VxyIb9JRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEyk6DUjQ4/A/SkByZ7nn7p0 L5LbIxjuyv/trZDEzOS1+wT+yNpOvsPwm736XSPv+avqmtJ16zn37y88JfcjLdfyguk6iaYXV38 +5AIA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

arch/x86/boot/compressed/Makefile resets KBUILD_CFLAGS for this
directory, but does not re-enable -Wunused. Therefore, unused variables
and static functions in arch/x86/boot/compressed/ currently do not emit
warnings.

Add -Wunused to warn about these, and -Wno-unused-but-set-variable as
well as -Wno-unused-const-variable to match the W=0 kernel defaults.

Reviewed-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 680ad803cba7..3ff75bc2239b 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -29,6 +29,9 @@ KBUILD_CFLAGS += $(CC_FLAGS_DIALECT)
 KBUILD_CFLAGS += -fno-strict-aliasing -fPIE
 KBUILD_CFLAGS += -fno-jump-tables
 KBUILD_CFLAGS += -Wundef
+KBUILD_CFLAGS += -Wunused
+KBUILD_CFLAGS += -Wno-unused-but-set-variable
+KBUILD_CFLAGS += -Wno-unused-const-variable
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 cflags-$(CONFIG_X86_32) := -march=i386
 cflags-$(CONFIG_X86_64) := -mcmodel=small -mno-red-zone
