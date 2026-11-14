Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657198;
	b=qCITQBa7f8EaXmeOUIPaFyu72V5DbF0ICNotE53KanqnsigsIatEctGfBcDzv0Y2Bowe
	 u/YzvKsxcfLLWPSeybvkS12MAxKwSdi6tMTlj3IdZCvtVi5BXG/MT5ykyHnBvrXOYYNDY
	 BByloYkbUYz1U386xMWZGq5zSdAkJyiNWixObdtHcXqvNI6IjFAvXEAF3HevveNb7QxFg
	 d3f2ewPmY9CJ/W9iAh63oB3wR8He69QLb07KuuLk23NLUCvxU4orgwBW2JBql0NTXVvlF
	 mM1xHaNMzKmvNcbmxdD/5axyGfUAPz7dqTqOEIJ/7oPwvTEpC/szZZyc9n1L/UVZ+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657198;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=GkA59AC5tR8jcVKW2hzbbi0ExZqKB2ij03gHKEgL6Y8=;
	b=yXYm8c5vOaU/zRTFCci5nX3uhXkupjC2wfdIQPrQENrQKVWedG7stXEi/uDweMkZZZp3
	 sAkJlr9z1VVTDTqNXexStZirJoiZdx5TGFyBSFeOvZAt57JfyTRMbe1wt3uIU4hgcLcpa
	 u2LxK+uETkpcW416lExlY7qhrx1IrnkShGnXfGiLfNg3RJFgIOiiDqTix71g1l1vGGTG8
	 SeerZ/GpL0rm/USCVMdL88p5+ZEh5V8js6wPcJNp5ey/r0AIiKia8M2BYWK/t+PIiyC6P
	 AOGzamjd5nah8NcVmRl84EQKBjVuBH4R4qmvjWK6BTl7AQHfBO+ZWIO+FqSKeu0qjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bHIIqGg/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF37C606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHIIqGg/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0995F1F000C4;
	Sat, 14 Nov 2026 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657198;
	bh=GkA59AC5tR8jcVKW2hzbbi0ExZqKB2ij03gHKEgL6Y8=;
	h=From:To:Cc:Subject:Date;
	b=bHIIqGg/kuI7T1RsUvsT445Md/DhH0lp7KhhvG6OjEvAk1yJmuotB9WfLH9qV37Tq
	 S0FSpeqtDQL4zJgOYOH4pzPsy15QJdcz49iwBlLWfIFWC+7vNeiDFXu6tOQpm6ywdZ
	 1GvCMdaR2Wx6PRgITKMGrNnu3jIsU34tUKyCtWQl0MUf2gai3v9n//Ay9hqQbendFD
	 zlBidq14FMxYATAsIhq498BoHB6yrzhOcqKPTEyNw97CcCQRav4iN7I2d2TqHSwzjY
	 f2M7LlFSn/MYZrrMOL9hEi09OhHOhq/HedU2e/5QtmvewcZnTXnMWmYYwfHAsHJ3FJ
	 ypwuk7VGnTNLQ==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Christian Brauner <brauner@kernel.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] init: Use strscpy() in do_initcalls()
Date: Sat, 14 Nov 2026 12:52:29 +0100
Message-ID: <20261114115230.30345-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773; i=blum@kernel.org; h=from:subject; bh=m1XMu/TmW4nUs2n8hU2n/vQjktSQe7Ypf1S3MVpixcw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk/vOuc5fYpBWtx33WQlxI4u+fT5SqnNzv/Lf+gdXHhy S2NX/sLOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAi560YGX5OmKzrVWja5JZv PsnL/1pNyU9Hcy6NB0X7w0+vTLbt9GBk2L8kJPzEerGTyhd2c4ooLlKODPr3NPvtM+NSlielXTv KuQA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the deprecated strcpy() [1] with strscpy() to bound the copy to
the allocated buffer size.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index db8fb6ebe830..93a2b12976f0 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1481,7 +1481,7 @@ static void __init do_initcalls(void)
 
 	for (level = 0; level < ARRAY_SIZE(initcall_levels) - 1; level++) {
 		/* Parser modifies command_line, restore it each time */
-		strcpy(command_line, saved_command_line);
+		strscpy(command_line, saved_command_line, len);
 		do_initcall_level(level, command_line);
 	}
 
