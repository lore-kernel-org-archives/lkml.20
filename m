Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898565678FC;
	Wed,  9 Sep 2026 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963312; cv=none; b=HRx73hhFLPoxv5GIfD1JvtYF3FBq6asEj6kF7oQP8TMiGEjA4bFkg86ZUS46foN0CAd0lw52NR0cTU9waVvPAHq4fYV/VzgVKA2Hq/IaLqoWcrOKvjrl4qYkvMXeksCMxUS1S+GuoYWiXgT85p4N1P3ATyYtq/pCggOnJjg8N1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963312; c=relaxed/simple;
	bh=qLidu9+tvo2aLuRdzpmx7JzB21xwTaNQV4UaGLTMvXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gg+yuaxXQzjFYSV89ZUzI1VeBF8cxK/+a92UUsQXxtepY35y3hGSnQuORaUaoD7rwM1V+EHTWgCGVxLKTAza5BhljnGEDIBrXDvF8lfMFkeyDICgTplVvNDzqj+ii3V8vMleOhzz+pgQ5R83hm5cLQ5PB7VOWvSmq7tx5DVdV9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JJHZp7MN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ruGXWRah; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JJHZp7MN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ruGXWRah"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hg2rX3nKczMlHT;
	Wed, 09 Sep 2026 16:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788963308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N2W999bKnCOzRTmwBAY8qmUKZ1hTQOjdGb2422aSQXU=;
	b=JJHZp7MN5O2vkb6Pyc9rvKRO4J+SoEd6FP/iPtMxrGydL+UNbJmFNE4QoctBd1ORr9WVKf
	1Di2c+4IZwoRCrdempi5JCkQjmqndo+kddouSAbUeTr59fp5BOMVWkrYc+CbPbnzG+Ootf
	wE6sBjzpyPiNA/iiyedjfQxQ9KR9xqQXkaKVCZJLrh6hSoUzvfskpAzfTCGHxIgNZvzE23
	InwyFVtsaw/7qwAyG7+JTqGkuQIGdpODxXiVMHupxyRF6KXBvRBeGR6+ZYQORST1cpJdRs
	56OOVPNyE9GeWyyqRz0MfrjdCd6HIWGKE81tKeAwgNDr1U0Dm5JPv4EiPCfSsg==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788963306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N2W999bKnCOzRTmwBAY8qmUKZ1hTQOjdGb2422aSQXU=;
	b=ruGXWRahAFFWALWGYobdNs6dc5/coFHa/50tbLBQykFxRTCqopnFYqomtonSzKoDW9z3JX
	2BloDjQMut36D1YekUJ8Pc9BqKV8t0nO5NnZXPfDBJp9n/i5qifGq6HZrLNj3hR3xQykq4
	cKkbebMqANqnClnpulvb4p/SJvXQN8T1TRcAcRof3/LAIghwDIszeEAkUS1Xr224cYUwH/
	x60PrSFqKmK+YAKgvZZ4NcWzNySjqW4ZvnrXlrv84scSdginQIeHtpVPIWyhEozllqkE3/
	GN9hcpMHBkaKcm73Q57uP1/2Li8SyZwQ9O96k4DYrdHNhvC3ICV4J4HYVy/Ceg==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	SJ Park <sj@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: deprecated.rst: add to syntax highlighting
Date: Wed,  9 Sep 2026 16:12:54 +0200
Message-ID: <20260909141255.1367539-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: roewc885im3yhw6r1ed98nzfn1iuoamt
X-MBO-RS-ID: 66f7fa071db24387d5a

Mark key words 'gfp' and 'GFP_KERNEL' for syntax-highlighting.

Suggested-by: SJ Park <sj@kernel.org>
Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
Suggestion:
 https://lore.kernel.org/all/20260430010332.114100-1-sj@kernel.org/
---
 Documentation/process/deprecated.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 22a5e62c9..4d4d29b97 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -404,7 +404,7 @@ become, respectively::
 	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
 	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
 
-The argument gfp is optional, the default value is GFP_KERNEL.
+The argument `gfp` is optional, the default value is `GFP_KERNEL`.
 If `ptr->flex_member` is annotated with __counted_by(), the allocation
 will automatically fail if `count` is larger than the maximum
 representable value that can be stored in the counter member associated
-- 
2.54.0

