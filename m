Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717977;
	b=Bj4OcCMYDqsRR/8s70eJ7s8gxNfBubxyre70p3FmKDHFoHdVTG4Zc5CUcifj8dj03lH1
	 LOgTOulARYy2EcBhW4R5yhhi+pehfBqzv6niMqPiEWEGuQ8pVakh0RMzSH/eDOz0jGzvq
	 XQRPuLPDblIPXyycVuOajORDlt4QVH2Y3PzahLFuQ6WMINFgnx4xBLy4FUTwXzagZKjGG
	 kl9X3oXbUYhguOyeU9kW0fHlvlzUvHuLJx/I30eDZcYfC6s90pFdZXC2FYXlpknl0hOxk
	 6WszBr0F6aHlLyVX3cLH3GUdwKQDrNMuFKgbW4BC9MjFcGBbvVzpTV1W/uWjPN40yqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717977;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=9BS4CcCKzDzXPo5GCKxgdH3ONKLRuCUTExcSc6aqAKk=;
	b=Dh/+AeFx/M5cYCJj3ZywB87BQsDwEuXPpGfC6+DedatX2BZTaHBtkGCXNkXuZLCwzBXE
	 YBTMBtQFaoVxOfSkVi1fzvdqA4Iu7G31KJeCI5ZtgTGIBYn6rrxHE9pqVxl6BJFVwbwFc
	 2tpKOc2s1o6tAx2DBcdTLJi+pik9rYPxIku54GYYUV7MvLYWhz4lslS5Nvm2f4QtdJQ+/
	 AAy92J8Cg7uNl022vmiIaalk692LavcaP/rHN5KroRMMkvCQ8AtNg5fgoDlD4UCIjIStn
	 XadRkmgxXzJrMeoADzBK6mfT/boLtdSyQCQe9pCe7XgCf6+FR4jyI7UbaFajt9pk1pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVa8msh4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648916071A22;
	Tue,  3 Nov 2026 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVa8msh4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6201F000C1;
	Tue,  3 Nov 2026 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717977;
	bh=9BS4CcCKzDzXPo5GCKxgdH3ONKLRuCUTExcSc6aqAKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EVa8msh4QzyC0U83ReEig42W+tUBMXi+fRjw8kwmHa5Le+pLm7wfoYbHC6Tnccj9z
	 1q1Eh5ANm2zRmMQyMGt9WwtYkkhW1IXmnIwsB7IyGGEcy01ofmPIvnVCNvANdK9sKv
	 /BQLm6wXpW1X/7dmq1aUX814gAY8DUv7IAbcmX0duCePQBEPIW3A4ePZzOvFq4q9+G
	 yiQljN/ZOqH2DBloIWI+iK9NsWbbRFr8ZsmNIzS9r9pT5hquMRnCf7b7Hj3JtLbzTV
	 BZKavvuHmH5TDleHgeXIPxu1bJ2kYXRcg4do3QrFCSBZm8F8CEC0mdetxFgGZttAs9
	 /rGtYtHnzUqWw==
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
Subject: [PATCH RESEND 2/3] x86/vdso: Use kstrtouint() to validate vdso32= boot parameter
Date: Tue,  3 Nov 2026 15:58:51 +0100
Message-ID: <20261103145848.427309-7-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955; i=blum@kernel.org; h=from:subject; bh=TrG4DTj7gD7Eabq5yf5whHaxNU7EpNpRtfrx0kXs42A=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkvv20qfZZ4VfIRi/SUxQ/rpqWVqmRfVbjGZsZjfiYiw KTG44hlRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExkuxMjw8SlEa+YAyqVNyY9 Z96y01xG63pYjcbpA/lM5TEBxgEvKxkZrucWbj8l/WfnmwttGduDm5q2vJY7ZRKvUSSwTuyqlNZ 5dgA=
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

Reviewed-by: Habil Eren Türker <habilerenturker@hotmail.com>
Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
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
 
