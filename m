Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F23E025E;
	Mon, 31 Aug 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171488; cv=none; b=ZehMSBIv4nypHsn/nfxICFPm46BU28m1RIaQxLQHR2jfbxtMR1ZlnOxAQuDuWTM2yPHTPNqPtXj67oxL9j8DTR5Dbx7IY8D5ft5aiOSZ/8YVKwGPn6f4U6s7rxQgohJDGIq4KaYYklMAHlc7WogkqQHhmHiqwiVcTkhiql2pu6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171488; c=relaxed/simple;
	bh=cmLxbjdlWIw/eE3FfCT92cbjMvhCBcGJsc3ZMrBqxY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzncnwS+aBtrT7U6Boy0F6MCNmCvWkn57oUcRBM0t7bwjCnx+fA8gf9pAxPiqigg3kQb+8bvmVBeXtqeDyQW/F9knlYhTVhWdVar9zxWb7DmdNEXQ8Hx/G+lUt2wGbT6OP/8sexC4QwHnnyO/XqlxYmshM6HKhLKEXzNvy0bfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzDOjJcm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzDOjJcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799FA1F00A3D;
	Mon, 31 Aug 2026 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788171486;
	bh=dx5le0XkmfnEd8/7dJ+rrW0bJpl7QKfeI+LxlYcrTMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZzDOjJcm/Rb1vCs8HMhJywa4Iyi+vMdEOir1TBzen6vq4s5NpxuXtjjLxJHvFDs75
	 AJsEvpwxqwIe0kJ6PnOe+4iEXIscVoe/5n5bAnwImBT/NYGG/rkbg+J2Sfk25886Mk
	 8nJRCvTT2eU4GKQeXoJcs6Dl938HAQm+bGYQT9IwVUo1yccwFZi/EryFtuuiBVtdCb
	 WuEFjC5Sc/rWWHRaNytlIKBm4DmcZpJGBzdHB21ZPXOxc8ghBpxVvEteJmAMohJKAY
	 yJ6rIn3QeJbRGymMDpQlPQyPkYoaQbhaM+gZ9xUpRxWgVDhU01/BlLJ48knGOQ3Hlz
	 kq6ELsFFiblQg==
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
Subject: [PATCH RESEND 1/3] x86/vdso: Use kstrtouint() to validate vdso= boot parameter
Date: Mon, 31 Aug 2026 12:16:59 +0200
Message-ID: <20260831101657.2947-6-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831101657.2947-5-blum@kernel.org>
References: <20260831101657.2947-5-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206; i=blum@kernel.org; h=from:subject; bh=cmLxbjdlWIw/eE3FfCT92cbjMvhCBcGJsc3ZMrBqxY0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlTQ2bxbXy4nJfr8IVexpvbRWcH98R/fS83Z7a2U2nD1 tYVPVe5O0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAi9QkM/7PnHf/M1875M9b9 84zuwxuqll5z1AzMtUtWktnJ8JhN7znDP2NuBwGv9DkfkudvT82z1HV1XSvWtEEr8fPimLs1Ym5 LGQE=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the deprecated simple_strtoul() with kstrtouint() when parsing
the vdso= boot parameter.

simple_strtoul() accepts partial input and silently converts invalid
input to 0. Use kstrtouint() for strict input validation instead and
reject malformed input. Accept only 0 and 1; warn and disable vDSO
support otherwise.

kstrtouint() converts the input string directly to an unsigned int,
avoiding an implicit conversion when assigning to vdso64_enabled.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/entry/vdso/vma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 18dfd80a81ef..c5c09c28388e 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -299,7 +299,11 @@ bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
 #ifdef CONFIG_X86_64
 static __init int vdso_setup(char *s)
 {
-	vdso64_enabled = simple_strtoul(s, NULL, 0);
+	if (kstrtouint(s, 0, &vdso64_enabled) || vdso64_enabled > 1) {
+		pr_warn("vdso= values other than 0 and 1 are invalid; vdso disabled\n");
+		vdso64_enabled = 0;
+	}
+
 	return 1;
 }
 __setup("vdso=", vdso_setup);
