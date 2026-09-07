Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23C3ABD82
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762476; cv=none; b=aMZQRK5zQBpMLMo1+kVkBOVOnrodm2Jj7rroSIChIqt68fsVt+5qvKr8IaFzmPZHFBsF5KoBMGg3+/Ne7iKCjEBTU2yyEZqEkPFp92T0eT2U2XammSjaE33cBssVbzJrhbWKGOYjRaG6MbFciIfi/tWhqHVysZvqlDrfM8J6BHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762476; c=relaxed/simple;
	bh=9U9N2TFAyobbl39UBzSh+qCUn8LwDTzjtPGM3Vh1Y3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AgoaBlsgia1qdKcEQRUIi9jLcWGCk6fGLcBUbL9TEyH7KonsWRFTHH+9GuGBJ8A8oBjJxgnYsRWmsgPBFR6jlmp0JNzQ8rOeHOwVfdrH6ewwkkm8BWjAB0okHI+2XsZchbp98uqXlSmZ8dsKpU/cdhTMwYU+NG6c5AzN7mmhtPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImHgqB32; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImHgqB32"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so1912018a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762474; x=1789367274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NIbvHaaScRJefKeUY/awHTyPuZNGAgS8A74dfXyR1QI=;
        b=ImHgqB32HNTtMi2WtfbPkFXTt4CgVHePK3ZO3h5CkhtWXTB3vS1Pil1qzeT8+GjzQ9
         jWe6FcchQ0HpSi1De3mFPWOYhNlVf9j7itT4Fs/gCdx8Omq0r0A8rwPM/hXE/QPFzsIh
         XWC+o2HQhF4hZZvmDriupSV33X7qCR1Oes8/GvgPWiKHwtgt+DPrXR3AU56qWfokHzMh
         BqXwQPBQ2u8ebch0Yg22my5cTsrpbxU8Onm5j1RhL1hvrahGQmOTP5zMQ9oAjPmVzjbq
         TufFoUrXieloZgaRLK0IGudmXkYxr48CNulQHvfm0VrBovcA/18L0uRbRYIOWxu3YPaE
         FORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762474; x=1789367274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIbvHaaScRJefKeUY/awHTyPuZNGAgS8A74dfXyR1QI=;
        b=dCT/vuzcRnvmR+tsMd4jQ/kfO52Lcaw6zK36Lpb1+thUAaYSZwfrqYHI4UI1pCW3R+
         k7IboFjKU06YmmutVNh603pzCywgVcHjSBSNqnUf0ZC0ZCV91EhuUF/iigQCLVQyazxH
         qBMVR4isGbkBULVjj+hyu3yu8ZaC3ZBJsYX9mg771mug4AjlhkR6gn8mpixCicwhlVp6
         HABEm0JGUjV9hcSeKGrK1YYNRVuCSeMpQzFAgf9JFqY+C7n/aMe+GD+0zPapBmaz6dGb
         YrglJFiR1X+eqxYJK8Q33Iam7bEiZDbupZFjUUF5H2YxEd8KwyFmSEAc4hALqyBTUcD8
         e5pg==
X-Forwarded-Encrypted: i=1; AKwUvBzVj24yCfVmRLpAtoDykwwJwfqL77R54y3X6TO5jormg7VE9fya7a30OIomUV/sN1HgrOaCTL3f6q0NMts=@vger.kernel.org
X-Gm-Message-State: AFuF++n7/VeKiaz5urJZSzK3aLMsfJeYTs3Aqjk7Wktb8FfoG6pbVWUC
	UiisWcLd7zC8IdChfiMSlL9pp+0CrInyFoKuUBbcBfwp87irpjMBRDpr
X-Gm-Gg: AYBFou3LXHz2H3gFNqs8CRI4kdOYPHwMyFXE83OeCkaGwF3ms/ye9jkCvS7aAff8ceq
	K8bQ+c1NE9N9aSJo0mtVupa+1DcEWRILkUG5YWUZuX3zZXb+JsVhE61eey/Hmi8AGjGo6NNzjA/
	nu2n+80/QTy2oALdcsO+2Ncbou3PMgxKcqg7QUm4CntBn8CGN7XVpTSShF3LO3PXFBwURwSoWTp
	5y6i6AlZtfxHln6fWElnJUyIPCw3JBlMLgrAZtDw4qSxdHMQbMjsrsTEmK9yfS/G2PHTkK97h4z
	r1VAkyTXLKpNC0iD0zyRD1iBY2055t6f932dK98X1Un4grwVUkHkhHeSwem1AIR+ci+UZfZnJXb
	gjPCdkq02B1THa2rQOV/rgBHZMsmDnvkptNoSmUshme1ZoXFAJrhp0z1ioY7FBaJi/xGmAGytKM
	oAetmsv/diwfIsLmROmkq+hByazhQiQXNPznIrjLdVVSuGCRpCAS5EVxj+Xt5bo9QTpdsgKlq8C
	pyi8kfkiLKd/g==
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr32789988a91.7.1788762474538;
        Sun, 06 Sep 2026 23:27:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm28507059c88.5.2026.09.06.23.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:27:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] um: fix typo "hander" in comment
Date: Mon,  7 Sep 2026 11:57:49 +0530
Message-ID: <20260907062749.16397-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "hander" to "handler", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/um/os-Linux/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/os-Linux/signal.c b/arch/um/os-Linux/signal.c
index 6c993bc8c78e..57f0a5e46afb 100644
--- a/arch/um/os-Linux/signal.c
+++ b/arch/um/os-Linux/signal.c
@@ -453,7 +453,7 @@ void unblock_signals_hard(void)
 	 * call _within_ e.g. vu_req_read_message(), where we observed this
 	 * issue, which loops. Thus, if the inner call handles the recorded
 	 * pending signals, we can get out of the inner call with the real
-	 * signal hander no longer blocked, and still have a race. Thus don't
+	 * signal handler no longer blocked, and still have a race. Thus don't
 	 * handle unblocking in the inner call, if it happens, but only in
 	 * the outermost call - 'unblocking' serves as an ownership for the
 	 * signals_blocked_pending decrement.
-- 
2.48.1

