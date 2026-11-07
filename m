Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057871;
	b=Oe4vva6zIFDeIBEB3SW1/cIoPciGkcSk4B4gxl+0wNwavmGCJScKhBtUiorol30tPhnX
	 IfpcGjzwlUa2pzSszwHmK1aeUKD453NQYiebdytaCi8gffvYtx4rF5ALN3V/CKDtCL+uZ
	 AbqmTEWFFf3ApcRisYGmw0rEpzG6BBB8FX976eqDkblsB1+OH58ezOydMhe3HQOYYfjbs
	 y/hjpaGHulx0nMYMVcUkEgnxQ+vPXEvJjzdgcfWvlCG24qhrYY9sn0oGxxVaTy4ePfadc
	 6BsMvBuocGQpiurV9z1iMO5YqYP3iTdwA7FmI2bc3VuYSL8xi7xL1BJKo60J5QfyCuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057871;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=w5/HjRxfEws1ZhLacX/MfEaZ8CSoKsLn7i3uFe0iH2E=;
	b=l/gagj6WKc7satdHa6Z30tOLNiltTUt8nz3Y73k6tvPGW8P2ieoRZSE23uFH1FTySvv+
	 BRLVEXbnj4vZHC7ZtYzw/4PY3CGu8Xl/NeKNHsLtWrQP95DLVJRjOcT3m9+utA9FeaqcC
	 FpAXtH8Hkxe+aCvb6zMZc6POg4/1d0dM1kwWcUrJ3eO4XWm8mG4l7z/UinhR2/3Okujmo
	 WxlK0XpxxBMoGrXMiXhwHQjp2d8AcEHyq9vJwwI2JCEN65BdzlvZihSanfCmyXkTMX6og
	 IPkITUGerwwq/e8HSXNTJ2RESvki1nhYQ221x7POV5PnXP9Y4Npw/uakYaxOkxY2cew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPgIMQHv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C528606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPgIMQHv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693721F0089F;
	Sat,  7 Nov 2026 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794057870;
	bh=w5/HjRxfEws1ZhLacX/MfEaZ8CSoKsLn7i3uFe0iH2E=;
	h=From:To:Cc:Subject:Date;
	b=EPgIMQHvfrEV29OCwu4vFqA6j95c8YcPIMJCvB0f2MODYlxds6Be+Q7bLE3LunJ7t
	 SuUQ+Vh0WJRzLdopEaUrK7twiY6kTPNYiwYVEvjyMrEC9jeLZ1b4S8MUuZWJg7qNT4
	 Qcfrc9jR3Or1daiWYKbkaONTl/toaRoPnxg8yX9Oyqa/Ofh+NvwJDPdo9laJXLIo1a
	 DQq2+lRwL6DfYndiF+h+36P5LayRLoL+Cx1NurkWtXPM23dCHXp51Wn7g3b7JbcwNt
	 vG1h0jlZC2/JN6bGVJuNgbfr+oYgsPMNj4rMiq4mDeKzrIRKRA5tVlg6lwBLEkpA+0
	 hhdfsfm9kEnZg==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: amiga: Mark amiga_model as __initdata
Date: Sat,  7 Nov 2026 14:24:06 +0100
Message-ID: <20261107132407.340796-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=618; i=blum@kernel.org; h=from:subject; bh=4zvtpkv2oO0GKzkZ98n+/esaTM0D5jd2GoWdYySuqao=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnv1crPLFvwpG3xkps9e2RW+s1f0rTS4Hnh6sOcieLda 67e2SNg3lHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATafvK8M9MoH9L87aVN8yD hW7565srLhdc8SSxYrqkwCO/MgWjcx2MDL+6dA89Z7bgmX96qX7f8UvPbgpIZS319rR4vc1um1p yAQ8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

amiga_model is only accessed by amiga_parse_bootinfo() and
amiga_identify(), both of which are __init functions.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/amiga/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index e2869bb4bf5e..df00f2e33932 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -39,7 +39,7 @@
 
 #include "amiga.h"
 
-static unsigned long amiga_model;
+static unsigned long amiga_model __initdata;
 
 unsigned long amiga_eclock;
 EXPORT_SYMBOL(amiga_eclock);
