Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A993B27FF;
	Wed, 16 Sep 2026 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562337; cv=none; b=nrpjb4VfCHaDz7lkWVjENRnQD0bk0NAbHiLa94hV6L3NmcETGER06u4qCmcKqSNmYlbNGT90O1G+olIwlQYXmGdwfBolgL/Hti41HKvYjTeaj1Ih0UC01q4QfXCbmjazYnHTlhEdvW3/cSLWYT6kRZ4Fs0B80q33iJAsJHvlXeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562337; c=relaxed/simple;
	bh=Wr9qrYgHpaG3kSB+9ETulq+p89xkbR101DMTpNc/Ttg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLfUD2djm81iwEOZIrStk74PL+zdr6m/9seOm0WTkwBWsQ66ZYWUfUqkEXaKE07JiwVuNKnaHDW6JDcuzBodFqYfUcRadnRfg5+TwKQd1gpbm0lGKv75Bg1aF7/tJCsJkh2c2XD0JQwMQK79DA9j7+xgW42KY6QD+m5mB7c0/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EgVkeDv+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tOm7ZwAH; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EgVkeDv+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tOm7ZwAH"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hlJNC6PQxzKn5g;
	Wed, 16 Sep 2026 14:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789562331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey+d4DJMWaeuXF7cDRc5tsZETDDro6Vem6UKPJ12SGc=;
	b=EgVkeDv+z96bPf740iO4dyGMixbwnCcEfyAlKr2cSxE5Y1ffq6If8BXeF+1ZdlvSvPTXXL
	wnQrrYToYiqLj8nVmYpzhvu7X/dS8vf3SlSRQxkoQrMTw3STFuS4q60M4SY9SJpzBJ6+K3
	468KlTrFesg4gNmVJ83Eq6Ym5J18ONm2A+f6yBaDGNYil6OmDXPaW3Ee+8cwJz840+b3rL
	5V5Nc/M/Cs0eIWuc3SyhbUUZYgxeWsI2pNyKWksThU0+PusQQbtJ8u4q/L+/SV4c6nB+80
	5kMjSoMTGuzn0qHVv0xWHJF8YGRXy2E08n5IdO1GIOIRaU4e8QgmjREw5hPujg==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789562327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey+d4DJMWaeuXF7cDRc5tsZETDDro6Vem6UKPJ12SGc=;
	b=tOm7ZwAHysem0CXsdIRL6/LVjzDU5PkIjGqQjKHwvSHmP0EhQYRmx1hzmCyZ/PVHU4C5KP
	2wycUg0T+49kqHhSwJn42av4qM4NubSeMsGIHrsxsmkRz9To3OfxNdqgTRfhHUh6Q13pVQ
	0lRim+WBR7NmTLOCORba568G1lZZOG8zKuMYUSJo0d/wFcCAQoSKzMNGm0ZERqcESqmKTX
	czM3zJqxJnPP8Q2zJ5jTy+UWa2NziVXXFp9o39Egjieyok6s+h4QFr+YFyHQtUNzlmS0KS
	4iwFJU/E2vLJa5uKazodIRBZLYZMXy8y4eGMLyDifCn4YCt961H8yRSU71PBrA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: docs: aic: Fix brackets
Date: Wed, 16 Sep 2026 14:35:00 +0200
Message-ID: <20260916123458.314458-10-manuelebnerli@mailbox.org>
In-Reply-To: <20260916123458.314458-2-manuelebnerli@mailbox.org>
References: <20260916123458.314458-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: r4muagabxzrd7kcpits48kddpyp6fagw
X-MBO-RS-ID: 4066e8ce33c1d5ca31f

Add missing '}' to lines of code.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
Would it be better to remove the '{' and replace '{{'/'}}' with '{'/'}'?
---
 Documentation/scsi/aic79xx.rst | 2 +-
 Documentation/scsi/aic7xxx.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scsi/aic79xx.rst b/Documentation/scsi/aic79xx.rst
index 071ff5111..ba5299cb9 100644
--- a/Documentation/scsi/aic79xx.rst
+++ b/Documentation/scsi/aic79xx.rst
@@ -292,7 +292,7 @@ tag_info:{{value[,value...]}[,{value[,value...]}...]}
 
 	::
 
-	    tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}
+	    tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}}
 
 	On Controller 0
 
diff --git a/Documentation/scsi/aic7xxx.rst b/Documentation/scsi/aic7xxx.rst
index bad0e5567..117cd55fd 100644
--- a/Documentation/scsi/aic7xxx.rst
+++ b/Documentation/scsi/aic7xxx.rst
@@ -308,7 +308,7 @@ tag_info:{{value[,value...]}[,{value[,value...]}...]}
 
 	    ::
 
-	        tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}
+	        tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}}
 
 	    On Controller 0:
 
-- 
2.55.0

