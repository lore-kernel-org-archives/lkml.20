Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787233769E7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939026; cv=none; b=lSXq3za/ocR60aEiHD1sFWXnDTVHF+ROV3xpADAJOsv97Np8wu5Yva9hTFY/n4mzO8u+m2GZ0aKpAj7h/so5KWW8xIKQfwLf4TGHqdo7wW5XfCvjef7+4+OC6TxizIxOSmOQW/BTs3VU/gNFTqPmmOv6KOKVGjlIm4rK2Nl08g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939026; c=relaxed/simple;
	bh=PhSOdsaAAVkmJ5P1BfxxinDG10PlYR3SU9zRPIU9UpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q+lEMLWPD40QzYhXjdEhwWnGRoXuvQGuttVV4gda5/u/8R26xkjOrwA7Rbec9xxhJ7t66e2H++RC4mQTBnqLZA4i6wC1M7FtkjdaBiRxRbojYoTa8v28SiLK981Lv63ex7JL0aCeh5ZCJwCc0F5Ne4TPNf5g1KBr/rgkkIm04t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFXQbfrt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFXQbfrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9BF1F000E9;
	Fri, 28 Aug 2026 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787939025;
	bh=VH1Zslua0nmO5TH2U4lJUlBAzyJfRBXVKj+2KA40iVk=;
	h=From:To:Cc:Subject:Date;
	b=TFXQbfrtVR0uOuMsTmEhDSboK4wLyKaTgQCDEwH/OiMqWF87Jyk+Rd4bMMIwf4WRZ
	 5Yl8ouKgxOh0akYzBDWBJINY3ofcDGiwkuPe3k1ERuju1pcPwak1hZBRnoAqLqbTDS
	 nIwBobG5vAyjzI10mkpKLU1iddRG40i3bXlgwjpFB9QI5IpVFHSBYK4JG9v3dWd7l6
	 jP+1t3qotnwaUu9B6akMVmTeXr/k/60WyenHUnsj1PxOc6E88q2802Z73sHVFbTSPd
	 8yHaBP8rn8uY6D+IB3q60Ku+6Ii7SBlyY9/VOJcbHb2WmVvHLnWq/gp9/Lmoaz2bUd
	 v+iiQxpuF9zVg==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] init: Simplify early_hostname()
Date: Fri, 28 Aug 2026 19:43:37 +0200
Message-ID: <20260828174337.609333-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=blum@kernel.org; h=from:subject; bh=PhSOdsaAAVkmJ5P1BfxxinDG10PlYR3SU9zRPIU9UpQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkTT5zkD8g52n9oaw3Hu+OZUVGr3+5ebrWqdUd1h6l4l vK/bOaFHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjAR+U0M/ywuBDVeeSu7eK0S 71OmCb82OIhy+7S9P/r2M0cTt/tWQzmGfxZX8+qiv7OfU+Jk4D/6rZD55pRLHdP7PjfvY1kUkTL xEB8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Inline the strscpy() check and remove the redundant arglen variable.
Use %zu to format the unsigned maxlen argument and add a newline after
the truncation warning.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/version.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/init/version.c b/init/version.c
index 0bd5c45aabc4..cbae11b6f768 100644
--- a/init/version.c
+++ b/init/version.c
@@ -21,16 +21,14 @@ static int __init early_hostname(char *arg)
 {
 	size_t bufsize = sizeof(init_uts_ns.name.nodename);
 	size_t maxlen  = bufsize - 1;
-	ssize_t arglen;
 
 	if (!arg)
 		return -EINVAL;
 
-	arglen = strscpy(init_uts_ns.name.nodename, arg, bufsize);
-	if (arglen < 0) {
-		pr_warn("hostname parameter exceeds %zd characters and will be truncated",
+	if (strscpy(init_uts_ns.name.nodename, arg, bufsize) < 0)
+		pr_warn("hostname parameter exceeds %zu characters and will be truncated\n",
 			maxlen);
-	}
+
 	return 0;
 }
 early_param("hostname", early_hostname);
