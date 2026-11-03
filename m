Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717972;
	b=1hMGk6OhD+jOOOS3iJm1dcueVZGGXBlnPaTGHOS57iy3WezzhbN/cXxewOLV6+lK9vmK
	 tz/GtDYmX5pXlw7Wd7Q7UCuCfSCXzTEw0E3uT/gzmhYskstg3bNwawciCzrriB1E1hTIx
	 w1aAirKWm8EhnOuUssnKwYpjW9jrXjZ9eNWKPxx9WR6l4/7uAgKA2XPdBXzkymHja1pgD
	 +6gNO38MkgFf9vkolQ9wqJJVOqttyjh0zKttt1sPnueHRkoaourULPFin9F6Ax8Zza4Kc
	 f95/IYy5Jmw0eJzwpKbnXS+2H0gDb4K6HjXhE4d+rgPuu+xTQt4sbyv30rJ4mwRekGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717972;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=GbntQKEvlhXxNlhy2QXWj+xhaVgnnTUEgCuGSk8ZKVc=;
	b=PIH94SI7mAsMbyWayMy0p/0Lq7f3MMOpJ2lygoD2E5JL6hn7M4gw0sj3jrlc7aj80aiX
	 BuZ918FvtWs5VyscFB2sKNymB+Bo1C9MvmZK2L4sSKO+iEItbNgQI9hKpo7MLqttC8pdU
	 qR/SCqOT8mUhDolOJIvTLDoNlh4HIA2sJHwGi+C9s2mFWb8OI/3HPkqN6Q6pxvPEG6nfq
	 JT4dTFB02ZQwqnitPZqtJCOaLgl8zujTXDwT4IQn4B7e1e6CJK/iK85JHzMaL9xm9Rjsl
	 cUvV7pNEgtckfHdOU/cHgBaa4M3ZDTIa5HG1yNp2oAvG74TEIChndUu+yCcUYSpyqtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNmoE+em;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151546071A15;
	Tue,  3 Nov 2026 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNmoE+em
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DEC1F000C1;
	Tue,  3 Nov 2026 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717971;
	bh=GbntQKEvlhXxNlhy2QXWj+xhaVgnnTUEgCuGSk8ZKVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SNmoE+emblrWvwUykZbBCTFbNZCRHdK8DC/Ay4S/o18hSzqUMZc4iVjKLuSF2K5pr
	 HRxlV/uBVmwzv5kAAgZ1PxxkvR4rN7gsNPauRjuW+3Ua0aOH9IqCwHe7WEUrSjOssX
	 DIXp1Utx1ix7VMkOnBoCiLdl6iesQuG71OR5P2EMBC3FnhIzH+CW/XE5oHXu+Zc4rM
	 /tn/UoxhZRazaYow1ZuGmgRK8xFF3kOURxSBjeTnZo4hjIKyuUAy7duF6l1JyPJI5N
	 6ONGdHBi0cD7/D6uLX8qtlMMI+ZPd5sxCe7CAadjPgfZ43owgtiuVrzVieOgq/Ctwt
	 Dok8Y0XGWxlxg==
From: Thorsten Blum <blum@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	x86@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH RESEND 1/3] x86/vdso: Use kstrtouint() to validate vdso= boot parameter
Date: Tue,  3 Nov 2026 15:58:50 +0100
Message-ID: <20261103145848.427309-6-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103145848.427309-5-blum@kernel.org>
References: <20261103145848.427309-5-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=blum@kernel.org; h=from:subject; bh=EblFhRIe2mw5ShrwkG8VppCB8GG0zmF+3AyLWzgda70=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkvv21UXWp6lkeiUFe2KnNdyOWvXlfCaqxYOncp3E7gN eKq/ybUUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABPZmM/I8LiYNWz7Ve6VLi0e RVPtAspuz+E9rt/+ZP6CoLJf7JN7CxgZvjPOl+B49DDP7IX7qoKelwKTP7nO255p2hNwzm0D7/k kVgA=
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

Reviewed-by: Habil Eren Türker <habilerenturker@hotmail.com>
Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/entry/vdso/vma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 4bd3b22beea9..6e59bad7cf01 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -298,7 +298,11 @@ bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
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
