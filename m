Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F114EE86F;
	Wed, 16 Sep 2026 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566736; cv=none; b=HKaKzmp9d3Hc9keXqLVKRFpbExPxD4pvyq/agSYEBO/U5FROTEV23IhZo3ic4ZoPlxwGEwgfXuknqYwD9dKd0fWffJhJYUeMUbMAQediHduX2fuAzofQjYKCnp848SuH8O+KPOxANpAmCDqpvVfKn9Fjk6abCQLc6XLj579CetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566736; c=relaxed/simple;
	bh=bWKDHx4eLulGdzB3vFpKi79QtEbcNGdDFgNF3jdXlpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IGab9m5tr5f4c7YUDx9vKmp2uz48N28WV3pJ7TJFzFqlPJoIWOiBqWJdpxtBMsyNP73uvfxiHAO/fBc/vlrvRbqytFKOUF4R30cNYqMkRescu7JCzjWZRnNzpILpcoES3hV8NI7y7P9BDmykKfSQImUVlWpCp+AfMNSDpk/Fu/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T3eFheFT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ddl/Uv06; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T3eFheFT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ddl/Uv06"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hlL0h3PW2z8v1q;
	Wed, 16 Sep 2026 15:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789566724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6rZuNWOQKjvKm876svAZOYAdqYAPisi7LSqyh2XlJMU=;
	b=T3eFheFTDl4A/ecsbz8rMGkKkqCmvcNzocad0ADwLm4Zw1kVV3Oq1SjJh04227kxNO40zG
	ZjlpyNdh82EPEwLpJzQlxdLUV7zoRRgxSLpjH2rVKiqm1zWEIs1CVDxfZENoWKlrKh/L7M
	OWGcgaZeB10ypwG+nY+sr81G4amYfH5YcJF6h09/TuBDmvFXu6P7ZSfLNo4c1pnupmqRb0
	Yx9fcEKNR2HTf36Ge5j5WpF6kF7kPdtGbRia+Azz4fnhCd1rEBMpyBVvq+94Sy78Wy2KQo
	r9hmSkbk8Z4AfpYt61pkbC76t5L4OBRNRVkodftC4kIUUzT9MwHq/OL9cH3NOQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789566722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6rZuNWOQKjvKm876svAZOYAdqYAPisi7LSqyh2XlJMU=;
	b=ddl/Uv06dAnAStwIym6iQafCOcHnOR0mL9PnCPUlce406+XUvPquCJYHnXoMIXqq7Zpbjs
	MfbhFVIH7RyU8Gg8kcopOiQH4Er42huuTnw+COa80Q6LYYiixJCQXNW2BC4Nmi5BL/0bL+
	hO+nPuzGtJmnWmmQxW3aHQYV2MpOsBFTllN8hpqQ2Ai6OvVU+5MoIXjW/oW3h/tiosu8nE
	87yhfPMzOUUIMKlrMWkOzZ4FdsYIGhGVzyOf75uDY7eBZ3q52pU1gOuH0+sFEQ1jMmHKXo
	00wGuAbjgx8qq2Lzx6l6y4rBCUuBh3P+pvW9LA7/dBfN+nRF+vyJc5vsdjZnpw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] mm: doc: add bracket
Date: Wed, 16 Sep 2026 15:49:34 +0200
Message-ID: <20260916134934.323858-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: i3qg7pa45tz638jwyynw6iuq9t9pt115
X-MBO-RS-ID: de183b856e7fb99e0bf

Add missing ')' to sentence.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
[first send]
 https://lore.kernel.org/all/20260902144210.703915-2-manuelebnerli@mailbox.org/
---
 Documentation/filesystems/mmap_prepare.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/filesystems/mmap_prepare.rst
index 82c99c95a..0482c21b4 100644
--- a/Documentation/filesystems/mmap_prepare.rst
+++ b/Documentation/filesystems/mmap_prepare.rst
@@ -114,7 +114,7 @@ VMA Flags
 Along with ``mmap_prepare``, VMA flags have undergone an overhaul. Where before
 you would invoke one of vm_flags_init(), vm_flags_reset(), vm_flags_set(),
 vm_flags_clear(), and vm_flags_mod() to modify flags (and to have the
-locking done correctly for you, this is no longer necessary.
+locking done correctly for you), this is no longer necessary.
 
 Also, the legacy approach of specifying VMA flags via ``VM_READ``, ``VM_WRITE``,
 etc. - i.e. using a ``-VM_xxx``- macro has changed too.
-- 
2.54.0

