Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601442;
	b=SZR+vDQGsCvRjPSbJ3NQN/IzMY7GVHM5eaO7ayo9P+bBcGUUeJMKWrVu7mDZlbUVZ+Lm
	 LXIQxrownRdIsWecuMfIixYu2Zx8HB0l/SKR/d4HvK/QMiFViS5fINUDMeydq5NAuMTvZ
	 VAlZHVnCp/QPnJl61IlwHDDGHvUHAI7CJNZ1SkdqSGGt4rfoE60j5uY7IXuTi0TYHN3DS
	 CFNZFi+u5F+eJjCgGiiuBfWnyjXi6Oyp0samU48NXQBQUg+ULJz4lO/dvBGehJ0JkdLoI
	 LzqX08A4QSltaKgCvLgE+bHIWRKT7QYApprG2jrcfMcIO2vgpJfG57ZNifAvcLO4J8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601442;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=gvGQbP6ETRc1YFadaN4Cn/I7a8GioMVFPwodhSVUsyM=;
	b=A///VnIW5Sw7U56ZK7pdjoljhRJUlRMfKit42JNE4f9Aygm/LlNKtAuELNV3m9gmY2Mu
	 LveHprUN4moKND+ADURosFeGnPYVjhWfJHog8X4KDcWiVap/4/I7FjtcmbdYq3/iJXoiN
	 aVXvFmIUK/xMRJoBDa77v4m3a3nsjp0+61+tT8dBpzwofje+0U5qwpxO9mYWqA+fbJhqs
	 bwefbCgxdmXqsbUR2dT77pqJHJLFH3vB8Wc9G7PekXjEdtNIM4vZHTR6ZiL/4WW1pV4m7
	 crHD8SeKFYq7Pa5q7O1tUS8LIpF0JyRhi3eHc2jhsojrRcHqGUOMHAeV9beOLxz4GmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLuTZbeh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92384606A8B5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLuTZbeh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21A91F000C5;
	Fri, 13 Nov 2026 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794601442;
	bh=gvGQbP6ETRc1YFadaN4Cn/I7a8GioMVFPwodhSVUsyM=;
	h=From:To:Cc:Subject:Date;
	b=KLuTZbehS11nhSKR1LKyY2xQY/5POlOiHSHwBfmEMWM5/O2j1rkNjQAhoG8Eayho9
	 iU+VHo5oLB47CzIBuKfv5Alt5MGJo73GY5JxbCiPwPzXi49NXwjtzG/Rn7XTnMoc/F
	 UkXhoQrCnN21Yvu7r22ZceVx8MuS3TRJkVU1AUkbG6DGn0qMtPkY6s1X1JQXjHexCp
	 oqYGuP7LG4O8uDzy5oI5BhQXockt4CYZ2yVs9L/UKHW2amwBv3bxX6SFciyusqBFKP
	 9cJeSZiNQ/z4pD/bFd5eYTBIP3b/6QnT/MLVCq9QwHaOZc3XMKIsmm3cHrR8MwlrHh
	 svaHtIfqpU54Q==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] init: Reject bare rodata parameter before architecture parsing
Date: Fri, 13 Nov 2026 21:23:19 +0100
Message-ID: <20261113202321.91770-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=blum@kernel.org; h=from:subject; bh=LUCIKh0tLlBSkuCNfyZ0BD6kdCGayGoi86s1CKCWuek=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnfC3dOEeMzvGitHG3mGsM1LZhvK9ORkro3W78+Dw69/ mI+o7RzRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkdx8jw22z043poaIs+/eV ruz8wNz3y1Jk08L8sCD90keWJ7d/3c/IcOiX587mTucJDTfn2u09NrXGaGr2q7iiE9nRkyf+065 t4wMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

When a bare rodata parameter is specified on the kernel command line
without the '=' separator, early parameter parsing passes NULL to
set_debug_rodata().

Current hooks already handle NULL safely. Reject NULL before calling
arch_parse_debug_rodata() so architecture hooks always receive a
non-NULL string.

Return -EINVAL to report the malformed option instead of falling through
to the existing warning. Also remove the now-redundant NULL checks from
the "on" and "off" comparisons.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/init/main.c b/init/main.c
index 7b0c8c34e6a9..768b65f2498f 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1566,12 +1566,15 @@ static inline bool arch_parse_debug_rodata(char *str) { return false; }
 
 static int __init set_debug_rodata(char *str)
 {
+	if (!str)
+		return -EINVAL;
+
 	if (arch_parse_debug_rodata(str))
 		return 0;
 
-	if (str && !strcmp(str, "on"))
+	if (!strcmp(str, "on"))
 		rodata_enabled = true;
-	else if (str && !strcmp(str, "off"))
+	else if (!strcmp(str, "off"))
 		rodata_enabled = false;
 	else
 		pr_warn("Invalid option string for rodata: '%s'\n", str);
