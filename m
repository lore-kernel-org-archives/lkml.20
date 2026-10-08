Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB423A83AC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477707; cv=none; b=lf4fceeVudYQ3kic5l8hn5hXen4wlesOmzaVojWqRvXA9Ql7zw4GGq9sE6x8bSimMoNIctUhKHndHmIEgEJU9DGAgvNzZv7XfPWq2JwcKOs1vqkfAO2KFN7jIyzB7mN7Ngqe/R/4KRbqUsiIMqWpTgGwnUMniwNHS2tOK4ZlRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477707; c=relaxed/simple;
	bh=Nhe4QdZ05WxGERe/2m4l7C4Dh1nyoZLPP684bAXzbfE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K2gVuYpM+hOEzmr4V3mWXxFoJsXa9YJPdJdOc1kzU/7lUQgmH6zTBUX0OP5276AoBSjqIfzDqSPAcXA1F0pXnVjJ+fL38hr66MH9WceFAIDcEZlrSzrqHrs3h1kvRomTo0/dhcVmmYakr6DITxWYVACoSIgYtn11muZbA3l6yQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jp/5jffO; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jp/5jffO"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-504ae5941faso667766b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477706; x=1792082506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVRbwfsptP26mC4/pKVYDrVCO0uNaRNaX7O0Iiwj1nw=;
        b=jp/5jffOaeTYXhVeuysJCNsvzDtGyOYlFJhcY+Bm7r6HnciFlMSbanHdrk/pi3nlSd
         cqOUNtXMwUP27zjdcyIgysl8AnZ8J9tB9Z0CAoRzuorvdMNyB3mPuCplOaqeIotRUenC
         bWXiUGbx8SxZokVE7xN645+lHrf1GHSDX57oC/C2Ch3vXIutugO5E3dDzaIu+vt9YzOF
         F1Y6UcSZjFAkCuINHtIXSs2v/9/CF6tB/jf/xh3EM+xQ4UigaI5W3KPx5O9qoJv8FKA+
         eClx2at+ji1i3Qrq7M7hp5cInduF2HmV17mfPbDQA1HpAr4AckY2aOY1vUmN2r8p5XQw
         ajKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477706; x=1792082506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVRbwfsptP26mC4/pKVYDrVCO0uNaRNaX7O0Iiwj1nw=;
        b=TukeRheTXQSIbTW1KALaR9/tedNrxEAogPhXl6LF+fopM8vn2yF+7fKmdnhrT+ZKLk
         1uSBRMBgi18GuTXsOW0uqnp9Bg6vm8x88IM2faPNE2WHD5LrUISu2farsBGb4/82I+uh
         LPnqUE4V/gL/0ZzEKNYudQaPuZKe/97CunqXfq9mJSkZZwdH3YLkk45DabeI/do79Duv
         7IsO4a/EC9XOrN//M0T/PXpEOF9klUCAOsxG/twKIoFCh46gN0rJ3XrQu3fM6iHSYSus
         JNh80m9NWTnGCtmA/xP+hhQPZY1xqbsrbbiyyweVj5ZWW0odNdjW0Iv9YJ6ky7cly19U
         4qIg==
X-Forwarded-Encrypted: i=1; AKwUvBy80ybnmLjQ4XXQv0wwNjY6fZXRyTZygozFveZsow4syTg1vecxJTqN4/cZy7jy1OsDG6D/9kC4D8A/pP8=@vger.kernel.org
X-Gm-Message-State: AFuF++m8pzmaN6ZM9GmJppZULex7vBeyG6zRCehDLdgxy1QR3LnyHekv
	SjbPazXFAZ+BH7HGTZfea7P9io9NKIleYLeAWP/Jh+FtumgB0zJkpa0Q
X-Gm-Gg: AYBFou2xyYosfciXHu77g2youmkIB+ITlC6CG2lJVBpdBufU4RFmzap4u6asTX4SsAq
	YLT6Y18oj73xuh848FgmS+ZeZMLHXcEqCK9659UtVfvjd+0HX9lQU7hmSzl9lM58AjnkyBzeg8Z
	93VgYludBfZsprhn05SlalyEokdEFG/oB2oVoJOw2zlA7OkKmSlRHg3GwfaJIWcjUCvVpSFX5NG
	nvDzr3ivhL7RJkCfRTlRRopHmtUXjTKHi9mRn/PrarAPRC9L5HlDlld+QNcNTu6oPitQY0XBwkn
	jcxSIf+Qe6vRRbheos7JjiSTmKbJjCqlvLK+I/yoJCl3qiMR9yNs69AhGUSuWRQFJoDA6wUNW6u
	wYiHscYe8XBbLr0yaBhIGDIF6EfFQYJvGJu+/BReQ6sSgX0bjI5OyLiUHx1tB+Oj7b2q5Q/uxRK
	2s9R+C8HNUQqKAv2ZM0Ztu128NkbpZJu40absgKV0Hu3VRrOuwHPLIJHu5pEjWbr9gV/VosGsX1
	bQy5h2b9Eer
X-Received: by 2002:a05:6808:6716:b0:4c3:4e34:c69e with SMTP id 5614622812f47-4fc4249bb58mr5304050b6e.8.1791477705661;
        Thu, 08 Oct 2026 09:41:45 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc484f6d10sm6310506b6e.3.2026.10.08.09.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:41:45 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: dhowells@redhat.com,
	dwmw2@infradead.org,
	akpm@linux-foundation.org
Cc: keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] insert-sys-cert: fix use of uninitialized pointer with an empty System.map
Date: Thu,  8 Oct 2026 11:41:37 -0500
Message-Id: <20261008164137.3671294-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_symbol_from_map() only assigns n inside the loop that reads the
System.map file. If the file is empty, the loop body never runs and n is
then tested while uninitialized, as reported by MemorySanitizer.

Initialize n to NULL.

Fixes: c4c361059585 ("KEYS: Reserve an extra certificate symbol for inserting without recompiling")
Assisted-by: Claude:claude-opus-5-5 MSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104217.1788155-1-lzsx618@gmail.com

 scripts/insert-sys-cert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/insert-sys-cert.c b/scripts/insert-sys-cert.c
index 8902836c23..e0bf0afc1b 100644
--- a/scripts/insert-sys-cert.c
+++ b/scripts/insert-sys-cert.c
@@ -94,7 +94,7 @@ static void get_symbol_from_map(Elf_Ehdr *hdr, FILE *f, char *name,
 				struct sym *s)
 {
 	char l[LINE_SIZE];
-	char *w, *p, *n;
+	char *w, *p, *n = NULL;
 
 	s->size = 0;
 	s->address = 0;
-- 
2.34.1

