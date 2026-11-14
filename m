Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657203;
	b=NvaBWd3J/KoGdvJRXR1wB8tOcI5YyIQc3RPCcetpj0eWWxMoTioEsA8cJDltQZsVcxvZ
	 BBqnjp1xkECkiwjBroDfop0RU3AHlesVZ0XNfuUxblFpv6tKY8GKrUoCIacbADfdPnLPZ
	 Hp7Nflez+BhGk+WlC3iMRJslV+SPlta1PIiLB6/1/7CjLqKQFWRgqP32Dws19swLcoKkx
	 w7v7fEA6lG+2WQhm4quZ4eplt3fzMYq9BXKa2qCxXLK1dkE26I+RazHwGaI90U8YxYh+R
	 g2bmvf+VLzy7v59kYhb1R2shISSx99WiyoR2N0mWZe8W5lxh985ybagheCR7sKrBooA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657203;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=QtpCsnNaA1v7bvbGBR9fj4uznrHLhQy+NWr9fdpseYA=;
	b=3r6Ols9+Siwufvx11rbgDRgXMPXOYYoIObvpu5TET6bcjuZ7dajx7pNT/m1M/7CsFtR3
	 mXPHuGC1oqZv2/5INsPxca/BpCnnmAgI7RCga/jSLfi4bwHnLNpno1wnd55RKsr3EZDX5
	 ae1Pja/5djHUbd/NrE4j3X+pZOYkPVY4dfbx0ESQQxAQY9eNnq2wQmupkA6zbrIeeYhQ+
	 49nCf8HCrLafvn1jw/raA2sj7VLMvhGbhbm7NZ2mK+9xLPp7FEdtvlnjZ69LkfLXFxFNJ
	 r2DYsnFFnGP948yEMAnEoSvN118w3t2my/iu/owbK7BOjLr7+fR0lNM2Z4D9ZyfJjcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2tr5DCt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC5606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2tr5DCt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82C41F000C6;
	Sat, 14 Nov 2026 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657203;
	bh=QtpCsnNaA1v7bvbGBR9fj4uznrHLhQy+NWr9fdpseYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F2tr5DCtAOxAyPNw8akjryObQibuLPwIwijxNC2Nc5W6/OAd3KBX5IX7zJbyJPuZm
	 Ns+UqKihlUuyuafI9ejMJIT17SHQO7LCVsh8WSF9ZqX60PkqDA/d0nfgf7iA6t6kuw
	 2H4Ai4PESoyL8XyhZ0zz8uPTsjGFGf0Kezqw4mKqOMhlM4fa59Gv1QVmxgRObwss/g
	 OHV4Hs+8nHzEsDRgRetivsTFyNJNXdjkUBSSp9yRANbMJvSnfKTxZ7k2v7SYyuceqG
	 XT8iRoxkOSwCYb5SEJecidk18qFSdEKIJQ0N4ZXnJDGQBGuUHDi9QWE8V0iyYylNpI
	 s1tL4iBIhNZ7g==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] init: Use kmalloc() in do_initcalls()
Date: Sat, 14 Nov 2026 12:52:30 +0100
Message-ID: <20261114115230.30345-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114115230.30345-3-blum@kernel.org>
References: <20261114115230.30345-3-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=621; i=blum@kernel.org; h=from:subject; bh=Iw3B7TAuxZfPVxS9XTaS3f7O8MTIjISyc8ij7Gw3N7o=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk/vCcyriqW9C+/b8uZcS7NZZ1Lx8laudW5T756Pn7MU bdmv9zdjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiIXiLDf3/z6v5Dth4VjIHK yqr75349vmHyvH2T+NWXbeJZVa++/TIjQ1vN/No9h3rjz9rKLOb6/bk1fPl3maSN4q0H1xnN3D3 5BjcA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use kmalloc() since strscpy() already NUL-terminates command_line.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index 93a2b12976f0..7f52a1b00c0f 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1475,7 +1475,7 @@ static void __init do_initcalls(void)
 	size_t len = saved_command_line_len + 1;
 	char *command_line;
 
-	command_line = kzalloc(len, GFP_KERNEL);
+	command_line = kmalloc(len, GFP_KERNEL);
 	if (!command_line)
 		panic("%s: Failed to allocate %zu bytes\n", __func__, len);
 
