Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A53DC4AB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080730; cv=none; b=rVVPinaUQVfreM54iizsK0T5zXj6TFiysb8WoqgrDTbfCZk8fyaBGt0HrB1hkiFEcZFXaG3M9sHwzlevCwg3D3BtvehtMJ/pVx4RVJ7mYXMvI/ucUvd+RoW6FvDJj2Q4+Cvy+nJaYnLI3Fxlb5EcxJKTiw8btMoIYsCms+fc53c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080730; c=relaxed/simple;
	bh=8GJ6MqaiB/hV1Yci8GKT5lwH/8wWOtZYYCjwlS41Rw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E8W48zIfCtlr6r9xywIS9DY/eUyamJj0HRDNkONyO7yM90dI8vip2c3LcwdY6/0W8zC64dZK1pmW/c+j6jSP3L+JNok9MMZX9/VaPZGrPXyI+iuc8zrH6uQw4hFVwP8ipkd/2gNuTsEds4dnuQWj/QwPh/Wc58QJKr08Nm4DZa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZai9/z7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZai9/z7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1761E1F000C4;
	Thu, 15 Oct 2026 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080717;
	bh=YQTGBfFwNel//r8LlIYPNIa3fcgK1JxEP6QLmF4X6hk=;
	h=From:To:Cc:Subject:Date;
	b=RZai9/z79OYUC0eiNxX0mHMcKQCYOVSiskf067Enc30o/eBuQfcMWQqU3KAp039eH
	 bTe28SvdHGtJmCVMbm2luhB13qUvkfbba3/J8dUCUDh4YzHo406KssBxQzMhbdYby/
	 UeERvMkBZZ2+iJZqBaE0llWiobDjEal4F5FwyqXaOqs1nytAIPXjTfNtYem+J63+na
	 Kto390FO0dz4ybAtJVDnTFgV+p9UF45XNiQ7wTjsqTfrTe3lqRvbFO5hMdDirZdAkh
	 utHpgrNSjCfZOHAjrtvWpyVYpvVn6LUU0J4WEt/G44a49VY+YoZ9szscn4wkWziqyA
	 erQ7mUFxRdUHQ==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: idreg-override: Detect trailing "--" in __parse_cmdline()
Date: Thu, 15 Oct 2026 18:10:54 +0200
Message-ID: <20261015161054.357595-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229; i=blum@kernel.org; h=from:subject; bh=8GJ6MqaiB/hV1Yci8GKT5lwH/8wWOtZYYCjwlS41Rw8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkXfvOHG97S5uI4V/nKg13ZrHWTlbHrmYOhGR2LlMsLd DS+HT3fUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABPheczIsFtEO1JFqGWruVh1 BpNZttO6eRWnpkdMmxt43j5fZYEaKyPD0xlsUzre5fO7bea+zX1VPq42/4NtstZ6F5nFwWXvE+S YAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

__parse_cmdline() detects "--" only if it is followed by whitespace.
However, at the end of the command line, it converts the dashes to
underscores and tries to match "__" as an option.

Detect trailing "--" directly instead of converting it to "__".

Fixes: dc3f5aae0638 ("arm64: idreg-override: Avoid parameq() and parameqn()")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/pi/idreg-override.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index acaf56234973..38aa28d19650 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -352,8 +352,9 @@ static __init void __parse_cmdline(const char *cmdline, bool parse_aliases)
 
 		cmdline = skip_spaces(cmdline);
 
-		/* terminate on "--" appearing on the command line by itself */
-		if (cmdline[0] == '-' && cmdline[1] == '-' && isspace(cmdline[2]))
+		/* Stop at "--" appearing as a separate argument. */
+		if (cmdline[0] == '-' && cmdline[1] == '-' &&
+		    (!cmdline[2] || isspace(cmdline[2])))
 			return;
 
 		for (len = 0; cmdline[len] && !isspace(cmdline[len]); len++) {
