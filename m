Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259C037C108
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324856; cv=none; b=epU2esY9cbkCVCxa8N8VwDUIpVCtc8RvQanb3g6wrndi0yzwbQQ9iiHkbDh27yvsngwch6QimN4VIQ84a9jKQj7iIBHba/yhWFD24ZPFv/5TZ0Q9HUwt0B3AIQBpomMwim/fIpH2/lqNJHrL+LiPosUzyrNu3T5WhaMdUZjB754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324856; c=relaxed/simple;
	bh=5CdDIjccNPKDkIYkK32+rcmVZd05GDIDDwL8M20/R8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DEko40BSXSVQOe7PW9YJ9DqfsEZR6XW5XazVRzBIUVVkNXXJA4Ai01OMrxkzqMv4FbwZlUu8OyGTYDNKjwuxaiQJ1Q1FgHyCnIRsdFd7U8psVWZeJ6E6/FPrtX13hN6lWUoOxNCbLL0cfZ5wNwlkG5Fu2LwZgyNJ/SSnA7uR8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=bM1oVZyG; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="bM1oVZyG"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6cfed5dd071so778640eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791324854; x=1791929654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4x71umo7VvmNzzHlNr492KsLnbcHO95/5Ekj2FJ6tCU=;
        b=bM1oVZyGqB2H9frIJxe84baDqxV7T00F2ycFA+X1Z8/dCJ6g8n9KOuxRePX/qJ2dof
         C4eRLabPBa8Z5GLoC8zETHo4WfkNiuC4CJ9wB+8G9Lliiqm9z50ApBNP696xPKSN7zaV
         bEyOyHSt5/DRwHwQ2y6vF3G4s/U/7ci49+gI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324854; x=1791929654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4x71umo7VvmNzzHlNr492KsLnbcHO95/5Ekj2FJ6tCU=;
        b=ssqkpuTbtILuE3cI5ow7NOQqG1lEZQv/s6FtTFVdSU8otbry7xSLO5CchROszCl44Y
         EpMJ5q2hRSQV7OHxUeCFCM9JPPBUqFMabpRrj+rDwL6nYEJg8vMy0y2oYkRbOYOwz8rR
         BBsJpOuVQflz6DwnPiNqjFrRAGvzT+ftGax1i+t9Dr359nhrL5jfmrB3giI+qFIGFRvN
         2VQrm8RnybYU+eNRnTU9/D9jWcN/lYh98NUtFOD5laaJJ61QOfC/IrUciKxNRGf1Vybu
         KmwTymU7ZXANdF7fLkMWADMkKFADPf36YsjPKdAtqnchuE18L1PGw/pzFCMCEFDCMAyY
         Hsuw==
X-Gm-Message-State: AFuF++mziwigK2Pud9+1S0ROGTvrgoJ7dRuOPGc7MeJQ18RZp9l8fy3b
	brVPFglyZ3YmR8qKA7b1hb4P9kWCHFpZZYfcM4hAP5TJ0Xc2++ZuMBrx4rzDn2PCGHjQaGNGiO1
	9IZXhLzs=
X-Gm-Gg: AYBFou0GSjZCzJ8LnEzEoCM2fTXl8x3IXu0i6XWPH5voVoEj1KQv56C3HSAXXYnkaXd
	+mq5/pwOF/4/3oF7CtK5RX+NT9e0HoWeXrZflCMCJJumB5Qm78s3EIAgBsSiovgCwdeas5033rb
	XQ9cM/prDONv+amCaqvb5aUByG1IY8gTQUUzwITXASzXZmmn/iLB5KZPZHpqom4+iRlzGnJICH5
	jdLe9lLOax1GfPy7T0ihbWO260LD4M15056yzd96tY9X5gL/eegjBLhYflXihGfJumfHIKJjmtT
	eqwmHqlVK+V9jYRjMacOM1SzYzhkl+o7RkNNSWcRg13uwqIip/1sY22YWfH0l3kzAIBO70970ua
	en39mbBYNcIqRWWBzsSx9459wL+dDbQslWAb9gP+pBaE4hR0Pt5M2WmpnFMtFhlpHB/2dVofWet
	j5BY6Fc7cBKAgun31M1TaK1KMoSt4+O7lLryibSYB3pwq+0eyo/KckGNINqvcV8a2vZdk/kg5zE
	86T4JqVij9NqLXFGzMNwQB4LoJ8yKseZi62hGBzLDsFw99x63KOb0isnrhjRtbk82AnZAl6BPM=
X-Received: by 2002:a05:6820:1694:b0:6e0:fb60:d5c1 with SMTP id 006d021491bc7-6e7a4b20318mr631832eaf.11.1791324853944;
        Tue, 06 Oct 2026 15:14:13 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82ad9eeb5eesm831673a34.2.2026.10.06.15.14.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:14:13 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] assoc_array: preserve shortcut prefixes when splitting
Date: Tue,  6 Oct 2026 15:14:09 -0700
Message-ID: <20261006221409.35477-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

assoc_array_insert_mid_shortcut() advances past a parent node's key
segment when deciding whether a pre-shortcut is needed.  A root shortcut
has no such parent.  If the first differing nibble is at bit 4, the code
therefore installs a node indexed at level 4 directly at the root, where
assoc_array_walk() starts at level 0.  A successfully inserted object can
then be unreachable by lookup.

For keyrings, a user can turn these lookup failures into an oracle for
the pointer-derived index hash and recover the KASLR slide of a known
kernel image.

Only advance past the parent segment when the old shortcut actually has
a parent.  This retains the prefix before a root split at bit 4 while
leaving the non-root and bit-0 cases unchanged.

Also preserve the last complete prefix word when the split is
word-aligned.  The unconditional zero-bit shift currently clears that
word and can make both sides of the split unsearchable.  Use the same
partial-word guard as the terminal-node shortcut constructor.

Fixes: 3cb989501c26 ("Add a generic associative array implementation.")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 lib/assoc_array.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/assoc_array.c b/lib/assoc_array.c
index b6c9723e12ce..ee4f3994f494 100644
--- a/lib/assoc_array.c
+++ b/lib/assoc_array.c
@@ -841,9 +841,10 @@ static bool assoc_array_insert_mid_shortcut(struct assoc_array_edit *edit,
 
 	/* Insert a new shortcut before the new node if this segment isn't of
 	 * zero length - otherwise we just connect the new node directly to the
-	 * parent.
+	 * parent.  A root shortcut has no parent consuming the first level.
 	 */
-	level += ASSOC_ARRAY_LEVEL_STEP;
+	if (shortcut->back_pointer)
+		level += ASSOC_ARRAY_LEVEL_STEP;
 	if (diff > level) {
 		pr_devel("pre-shortcut %d...%d\n", level, diff);
 		keylen = round_up(diff, ASSOC_ARRAY_KEY_CHUNK_SIZE);
@@ -865,9 +866,11 @@ static bool assoc_array_insert_mid_shortcut(struct assoc_array_edit *edit,
 		memcpy(new_s0->index_key, shortcut->index_key,
 		       flex_array_size(new_s0, index_key, keylen));
 
-		blank = ULONG_MAX << (diff & ASSOC_ARRAY_KEY_CHUNK_MASK);
-		pr_devel("blank off [%zu] %d: %lx\n", keylen - 1, diff, blank);
-		new_s0->index_key[keylen - 1] &= ~blank;
+		if (diff & ASSOC_ARRAY_KEY_CHUNK_MASK) {
+			blank = ULONG_MAX << (diff & ASSOC_ARRAY_KEY_CHUNK_MASK);
+			pr_devel("blank off [%zu] %d: %lx\n", keylen - 1, diff, blank);
+			new_s0->index_key[keylen - 1] &= ~blank;
+		}
 	} else {
 		pr_devel("no pre-shortcut\n");
 		edit->set[0].to = assoc_array_node_to_ptr(new_n0);
