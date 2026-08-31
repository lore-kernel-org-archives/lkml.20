Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2AF3E025E;
	Mon, 31 Aug 2026 10:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171492; cv=none; b=WM0oJcSALmNYjv4XVqqQL09tUqzb4sRRqjSAjGtRjWKonIWYiGwxBG1JhmgsqM0eC3acyBMdCAxii5MkSDweTsBH8w9NwZ+pfNKm4RzIr+Qy95TT06ZHR6SfO5mYFfeVJ5f0pNeKdYFA045ETGaBh3OqSNGvMKEKNEpNZnJz6xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171492; c=relaxed/simple;
	bh=0mLDPzyKPhCCvkaWXViaFb/YUNNqtEWp/d2c4J0GwxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOSbFdhLSmS5K817UHuH5+FxuD0cKcFudhA6UGqOV6lztBsGyrvNfcDcnw3+Qa6UEDTrVdiO4aTW1kcR8OjxROPgBQJYNYMxxjsQn4u8F3peHdYN5bsrHCkPvXmw5L9qvgDPJ3Zt3tYEGx/o9Cp9cDUT9ZQTDaNCDaw0hMpWXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eME6KTBg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eME6KTBg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F6F1F000E9;
	Mon, 31 Aug 2026 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788171491;
	bh=tKDm6NkBYuHXVCe45Wa7T6tPjflrflsWNHUHpKzMUAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eME6KTBgvIFYLlIM6R2OClAnXz22xK7o4N38qhXJl6XhBh7QhR3eBq7N2DkYX1XxE
	 /YVRFEr8lpCVIGIL2J+EZqxAkaEoOggi3bTUTgjNIJVj0s+WbuZJkxwmW3Bs5saHD5
	 2kUQVWlNlKi/0w4rRlq8ucMOaVRva1uwwmQNzNJlEyxfVM9lQbYLJFW2vYxsTHzncf
	 oRLsuF7bZTekHwvnYPF4ZlXKty264WH+GGOok9pzNlEJ4HAcrquCz6jtG415Lwl7s5
	 mXPKHGM69dJG9GFF5UCv6w72HdSQuNMmP+yNCI5nOBT52j7hrkWmzE/iSLt0CbnAeH
	 L7gbipXtcUSMg==
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
	Eric Biggers <ebiggers@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH RESEND 2/3] x86/vdso: Use kstrtouint() to validate vdso32= boot parameter
Date: Mon, 31 Aug 2026 12:17:00 +0200
Message-ID: <20260831101657.2947-7-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831101657.2947-5-blum@kernel.org>
References: <20260831101657.2947-5-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=blum@kernel.org; h=from:subject; bh=0mLDPzyKPhCCvkaWXViaFb/YUNNqtEWp/d2c4J0GwxY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlTQ2bdyPn/kbVsWdWX63vT5YOqpScr9v3PaHI64qRqJ ZpqfEKho5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACbyvZbhf2md8MQOxdlxgfpL s0s+65vkmOTdLAhK1WD7MWWx/xaxOYwMxzZENYisqnTbevu2+6N3HxnSrJcsf7ZfVKG69ajGLf3 zrAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the deprecated simple_strtoul() with kstrtouint() when parsing
the vdso32= boot parameter and its X86_32 vdso= alias.

simple_strtoul() accepts partial input and silently converts invalid
input to 0. Use kstrtouint() for strict input validation instead and
reject malformed input. Accept only 0 and 1; warn and disable vDSO
support otherwise.

kstrtouint() converts the input string directly to an unsigned int,
avoiding an implicit conversion when assigning to vdso32_enabled.

Update the vdso32= handler comment to reflect the supported values.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/entry/vdso/vdso32-setup.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32-setup.c b/arch/x86/entry/vdso/vdso32-setup.c
index 8894013eea1d..5f3e548ebf19 100644
--- a/arch/x86/entry/vdso/vdso32-setup.c
+++ b/arch/x86/entry/vdso/vdso32-setup.c
@@ -30,10 +30,8 @@ unsigned int __read_mostly vdso32_enabled = VDSO_DEFAULT;
 
 static int __init vdso32_setup(char *s)
 {
-	vdso32_enabled = simple_strtoul(s, NULL, 0);
-
-	if (vdso32_enabled > 1) {
-		pr_warn("vdso32 values other than 0 and 1 are no longer allowed; vdso disabled\n");
+	if (kstrtouint(s, 0, &vdso32_enabled) || vdso32_enabled > 1) {
+		pr_warn("vdso32= values other than 0 and 1 are invalid; vdso disabled\n");
 		vdso32_enabled = 0;
 	}
 
@@ -41,9 +39,9 @@ static int __init vdso32_setup(char *s)
 }
 
 /*
- * For consistency, the argument vdso32=[012] affects the 32-bit vDSO
+ * For consistency, the argument vdso32=[01] affects the 32-bit vDSO
  * behavior on both 64-bit and 32-bit kernels.
- * On 32-bit kernels, vdso=[012] means the same thing.
+ * On 32-bit kernels, vdso=[01] means the same thing.
  */
 __setup("vdso32=", vdso32_setup);
 
