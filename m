Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902281;
	b=PGlFh6ApKlrSEY4UI3bUpSLiEqj+BiP4VRWlLrdIazY1AEZe4CnjZyiG9gn9Bqg9ochW
	 CytNuiFxCVZWSCNIMqa9NmM9hLYt6jOQ3yiH7X4tUW1DSnJ8AvZE0TlZ6o7iCnqRcw1CX
	 J3yfEUfJ/9crsu16vYUepaGjvsJ8QZuBcCasZLXaXEG4+a1WOpJXqDDZXn3Zj/lY5dmcN
	 xvXswFKWPw8aq7ZEGVQOmARlWh9bdnRMrjaKFhkGRLsbWWdyNA2qmvX40qouma0bArEc3
	 XNbmvYG2CItMFtNfEEYtUcf4+CX4znSn+OqDrATm1vhWCPB6+qt6BZpwZkQHWO2zbcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902281;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=lTcSxcs+5eTD8VFpP4O8gvw+pPjNGJqWFzcoInTDXz4=;
	b=PtGOJVX85KqxNE1NO7d4QbY3aQSHrbBZBmqHs/mXZQrdVcrfxM1gtsV+Kgm2NtVKTXfE
	 /cGpkBZ2CKjTuW2hhhZOtXbdKs3AssVNdhBiytr9I2QefDkks0wQdldR4vbdMr5sQSgYZ
	 sWwIpo0NCBV29ez4YXugBKp1+IWA6ltIgm/iAqs6UXZrO995qDMI6E7iir8FamBCuTEni
	 pGUHiQ6+y0lnmar9ysJlFLmNgl1aHDNHzrQ6Tkbego7GeSWPWVpTzqHUuMKHp0DjIdtgV
	 bxsHLeEVvPYeIZZQpdTvy7aR/Xa+PDOGSJLKbdtNJFROgER+A+ss6du4DxWjXkmuj8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJX9A6To;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B57606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJX9A6To
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694071F000C1;
	Thu,  5 Nov 2026 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902280;
	bh=lTcSxcs+5eTD8VFpP4O8gvw+pPjNGJqWFzcoInTDXz4=;
	h=From:To:Cc:Subject:Date;
	b=dJX9A6TopAoxPaPA/cpvPP9QhB0Fw8FN7bN0PBBK6guxEEvgEmoJ61YKIyvQg7gnG
	 sFNPYm4DIOjC0w7a9xuU3W41QvtP9t/rGOzD9NH9ENhCS2BVIIwWAfBWiyI8AMKIyk
	 wiqOZSO2iqruO8Ml0+r7zJkIFdx3HoOWp0QgfvB4IKRmQN8IyMwXdk/d6PbBhU2/m3
	 p/z6rSV348VHN5gtqj7KNwjg5O7cG+QZ2xdi+WJQtXYeExyPiUKoBbGdmmFbmbowYN
	 cLPt6JphdNKCx3y8vnE/LYbKo7gs6drbOmDLcR46NwQLyPyactcsOLBul3dsl3CJ/6
	 A/LvT1SPriPLw==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dexuan Cui <decui@microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Yunhong Jiang <yunhong.jiang@linux.intel.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/realmode: Use const and u32 for embedded real-mode data
Date: Thu,  5 Nov 2026 19:10:05 +0100
Message-ID: <20261105181008.366331-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677; i=blum@kernel.org; h=from:subject; bh=LsE+varfQlFYvBtBGGeA2DnWMuv04gMNGaPUVi+Bkpg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlvjjVU+R49G/3R7G8HgzXfprkXFipr3lVwinqSVSVx5 w1bg7l9RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExE6hzDP/3jh8JFXk/1cNxf PiNXXi2hydxfvVjL7fPvi5sbvs/lCmBkOFXMq/9O4vVhseD5reHzBTscS5vcT9YLOTxP4T38KOg 7LwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Declare the embedded real-mode blob and relocation table as const since
they are not modified.

Also declare the relocation table as a u32 array since it contains
32-bit entries, and remove the cast in setup_real_mode().

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/include/asm/realmode.h | 6 +++---
 arch/x86/realmode/init.c        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/realmode.h b/arch/x86/include/asm/realmode.h
index e406a1e92c63..e48259f2e503 100644
--- a/arch/x86/include/asm/realmode.h
+++ b/arch/x86/include/asm/realmode.h
@@ -57,7 +57,7 @@ struct trampoline_header {
 };
 
 extern struct real_mode_header *real_mode_header;
-extern unsigned char real_mode_blob_end[];
+extern const unsigned char real_mode_blob_end[];
 
 extern unsigned long initial_code;
 extern unsigned long initial_stack;
@@ -67,8 +67,8 @@ extern unsigned long initial_vc_handler;
 
 extern u32 *trampoline_lock;
 
-extern unsigned char real_mode_blob[];
-extern unsigned char real_mode_relocs[];
+extern const unsigned char real_mode_blob[];
+extern const u32 real_mode_relocs[];
 
 #ifdef CONFIG_X86_32
 extern unsigned char startup_32_smp[];
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index 65110b2ee1a1..5430314d549d 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -118,7 +118,7 @@ static void __init setup_real_mode(void)
 	phys_base = __pa(base);
 	real_mode_seg = phys_base >> 4;
 
-	rel = (u32 *) real_mode_relocs;
+	rel = real_mode_relocs;
 
 	/* 16-bit segment relocations. */
 	count = *rel++;
