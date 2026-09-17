Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D20B4D7D47
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645891; cv=none; b=pV79Q5bFqRU0H24omc8zxEKOzz1WwSTLoT4eLs4oo0cdkjN1RvuPeld31XZB9D9DfOMtsnUpKgF0gd0fWLtguh21EoD8HbA1JieJwM8IpiQxrHlGB//fKFbmgz+P104KuDH6i8VXMnre5JGxQPfvI9oO2Jh+QhqRYz3wJpfa/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645891; c=relaxed/simple;
	bh=ZGuK+RdDE4VlcEBl3r68oeZJK+ZxoXNDTqXuopCC5Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDCvGLezEzNKMA3wGL6XySxnAiUSNTsjl020MHZbWLsB1BYPxB9u0PgexQOHX7iq/unccTEG/rHgu2aVgtbhj0rP3DS+UVQynpmW/O1nuGK9YRXai0Hkat52iZ/q3BeCctCktdmwnSLN9HE7mDXb4SUdUhvI6eGLhZlEnJiVg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckCJys7t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckCJys7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64111F000FF;
	Thu, 17 Sep 2026 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789645866;
	bh=vkWUE382XwfOTzr8qVE+/qyk5FqbibvSU5oZ3vayoRs=;
	h=From:To:Cc:Subject:Date;
	b=ckCJys7tkFA3xL5K61RWbyZvrDXdNjNPyoODiDBh+8cGdwsTv6e6OfUw/CZj9yTnh
	 s7xQutRhyDaMqr4eltGKYiZiEPBzJG6UiLpJQjbgDUoSjmszq/0LDpjhDmUyHnK7Zi
	 yRBvyRglqhmOl/uz2W3uUvj5Jt1fCzf+80WQF2BeMGIbcoUI+d2sekOcVsacgtCUSo
	 ovntMwQd7/ibf91tRCKvNHdV4aVJOc/8RjbUOn47gbpp0UjzH4L+Ztp6QQp0mQb3jn
	 +YtBgjmw19+8kWaPA/OPPFe5mCpOqrxPUhIM1q/9IBJQZ5XUJu0V8v/a+pVnY1pbIe
	 83W18jpm+af6Q==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Cc: Thorsten Blum <blum@kernel.org>,
	"H. Peter Anvin" <hpa@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/realmode: Pad the embedded real-mode blob to a page boundary
Date: Thu, 17 Sep 2026 13:49:27 +0200
Message-ID: <20260917114928.213178-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=blum@kernel.org; h=from:subject; bh=ZGuK+RdDE4VlcEBl3r68oeZJK+ZxoXNDTqXuopCC5Xg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmrL5/Y8tRlj+MevUfTH1mtnrt8frzDKtl3jz3vRTf6Z h36r89R1VHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQAT8RRmZDhVGX9hsl68JFeX T4dL46PeLR/PZWxZt1VP4n224eJv6VsZGZ4aCsj4bn+9caak6tSSNptG+43ZHxtCf7JLJOf8WKF zhBMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

setup_real_mode() copies the page-aligned size of the embedded real-mode
blob into low memory. However, real_mode_blob ends immediately before
real_mode_relocs, so the copy includes relocation data and potentially
other .init.data contents when the size of realmode.bin is not
page-aligned.

Pad real_mode_blob to a page boundary so the copy contains only the
real-mode binary and its padding.

Fixes: 084ee1c641a0 ("x86, realmode: Relocator for realmode code")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/realmode/rmpiggy.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/realmode/rmpiggy.S b/arch/x86/realmode/rmpiggy.S
index c8fef76743f6..ce5350241238 100644
--- a/arch/x86/realmode/rmpiggy.S
+++ b/arch/x86/realmode/rmpiggy.S
@@ -12,6 +12,7 @@
 
 SYM_DATA_START(real_mode_blob)
 	.incbin	"arch/x86/realmode/rm/realmode.bin"
+	.balign PAGE_SIZE
 SYM_DATA_END_LABEL(real_mode_blob, SYM_L_GLOBAL, real_mode_blob_end)
 
 SYM_DATA_START(real_mode_relocs)
