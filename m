Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC32D781B;
	Mon, 31 Aug 2026 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171499; cv=none; b=Ld99ARnVmIRsYS9b+5RZHjyWv/sGi9kQnQNv9vv1Dvur+FhOtzqO5/ML0X2I2E30dCotSQ/1lZYJAU2HWVcJ/9FRd8AlkaTTFi+rUmKhUsVIYVC010+/IRAb/DDPNxE/oZ7yFTMa7irOSRxxw04GD6qS58KrmMoXTyWvPAgjJ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171499; c=relaxed/simple;
	bh=5s6EUyxh8JHFqaodDHnqJiVh1EiqM58/P6lkzAvGh/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axsY8EJS3YsPbXYRPI+cQhmV7livnLLQ2B8uklfRx85rXCnxAzOs+2YiaDAuRA5g0s85sOJjeiF+6ehEnZQS3s1AD01cSXEqdSPKxuegXrNFhMNI0nfk4VlxN3tkD8bdPi4ltPD6/499WuwMkR3zlxSa5RVPO2yD+nOPYEWrptA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+F22cQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+F22cQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC6E1F000E9;
	Mon, 31 Aug 2026 10:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788171498;
	bh=/USldvh6G0OAtolKZhKp1OxbNPDmJWwJbKHQDkkNUSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b+F22cQQeyK4/WnsnM1ma9HFib/V+v2Bz621TQ+SAg/lZ7X3LzgjY7LoqKO000+sj
	 sz2odA0dSasiaFigL75kHk7Y4MV4bGs6w4iJp1xxn1wh6RTMqnXBVbsV/xxIdIE/k3
	 n43gDFJHWtaM4dB1j7RBvD3UkEN+u5KBQ82tooZWP9nkEUcPO+j44/AmTrVuUHvesX
	 bQLs9GWw57PDx2T10wbpIvqXv84iXUYeyrvgYpFTmG0idg/WjTRFtvLDPZhJKOXio0
	 /RtkAGGMDR61BWBIF92504Ew2ElchV6QGrR2lKPiKUm4YSLYWcKqk6JC1SSVxkox7Q
	 sq3oMcJnl2Jig==
From: Thorsten Blum <blum@kernel.org>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Jeff Layton <jlayton@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH RESEND 3/3] Documentation/arch/x86: Remove obsolete vdso32=2 compatibility note
Date: Mon, 31 Aug 2026 12:17:01 +0200
Message-ID: <20260831101657.2947-8-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831101657.2947-5-blum@kernel.org>
References: <20260831101657.2947-5-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=blum@kernel.org; h=from:subject; bh=5s6EUyxh8JHFqaodDHnqJiVh1EiqM58/P6lkzAvGh/k=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlTQ+aIn7Fp+7h0xbcOMbnIpIpDf23uxL1tWrByR+oGE XPzyAtqHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRLC6G/7GK/OlNml+6p/xe oPqzaOPXdu8TvgveCshkvHzR5/NNeDPDP9u/DLET85n6d1kvagmN0Ii0XXsn8wjH0l+Zn+3DglQ 3cQAA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Commit b0b49f2673f0 ("x86, vdso: Remove compat vdso support") removed
compat vDSO support and documented vdso32=2 as an alias for vdso32=0.

However, since commit c06989da39cd ("x86/vdso: Ensure vdso32_enabled
gets set to valid values only"), vdso32_setup() accepts only 0 and 1.

Remove the obsolete vdso32=2 compatibility note and document only the
supported values.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..793a85d879a5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8339,15 +8339,12 @@ Kernel parameters
 
 	vdso32=		[X86] Control the 32-bit vDSO
 			vdso32=1: enable 32-bit VDSO
-			vdso32=0 or vdso32=2: disable 32-bit VDSO
+			vdso32=0: disable 32-bit VDSO
 
 			See the help text for CONFIG_COMPAT_VDSO for more
 			details.  If CONFIG_COMPAT_VDSO is set, the default is
 			vdso32=0; otherwise, the default is vdso32=1.
 
-			For compatibility with older kernels, vdso32=2 is an
-			alias for vdso32=0.
-
 			Try vdso32=0 if you encounter an error that says:
 			dl_main: Assertion `(void *) ph->p_vaddr == _rtld_local._dl_sysinfo_dso' failed!
 
