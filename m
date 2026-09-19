Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EE345ED8
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856258; cv=none; b=hcK+TWlLsayyUZOPRkGp2lXO1VIRW4JXpAY667fH5NLzNi/mM/JD3i6rQPZoi08BoyeoBTuZHqHW/ZIIhv8UaxqJSpqZ8U0wNXuYtg6LfVHh0r9rExcltVe6okBP0TtVcIApf4djUfW74wEzhmHLbqd8Wwy0V/7hGFutJ8Mm1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856258; c=relaxed/simple;
	bh=XTGPByaKTox6U5aPZLCDWKzv+Lqm37WB14EuUf1lPpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqAkj5woaOElY0ZIMsWFSbXojfzJZNNsgsnLi3idTWssvnqqmfk//rA5uFd5Mewk0ROpnVHtcikpfEybscBN+Z+NCzdrHx9aNen+xFDJ5EfUb2pJ50NHgtqd/e+P0SUvPlCyIxKHkbBbewtcC8GzPHUO+ciOoCzCm5EIAkSuSs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKUPOabA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKUPOabA"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1861078a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856254; x=1790461054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AhYczpStxgsCjFPERIhNOclR7G+/Zd8P+4g7a+UCi8=;
        b=YKUPOabATm0wS32UB4uWBuFFgSBF6zxSei67Z2xrSXxluZ7hTjhzlxHCk7yPEARNwO
         PRtk5JHJh2cobXAthHmlI0lMXszqhmNmJSpvfffTXNjWu+wdxjrTlOWRZU5vtGZSzuuk
         VxFcCtTZE9+/iedswzCKKNi5hDot3WOWx2txxNFae+1udFX9vkz4VT+928csExero8CT
         rZRMYQUghO0ptj6j5yuUvjoq96dXE0lyGZ9+Av2dR6Cyf3elQZcHAZQx29SxEsEuId9j
         YOOPqHkBjyLiemhbQ7+E1Q2yRkv1xREL1DLWbvRXNAtvUkEXvTas/FWnHi7TKCOaGFEt
         OICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856254; x=1790461054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AhYczpStxgsCjFPERIhNOclR7G+/Zd8P+4g7a+UCi8=;
        b=gFgJWK6Wd9PsFihx06AuD0Xz1SClTaLlulTcX0NcTNjPjRWs701TnGFlIfk94OnqQP
         pugSvQNEOBjNu2yZ6ZoPLN5zyECGg0rDJSKTBaPhm/Rg44Xm+j4N2qCkhOFDMR69sk8T
         vt4s8PNql3I75DZdryADFoiIXnZejfV/jbJJLEKPCCTCO7pDULnDONu4E78n4AiZLCQN
         fjSiuhu7qsT5YX6G68QtGlWafJDL/H2aRPDbZzze2BCCNRiq5L79ShkfeYBXsfiLYy8S
         eGXGEX0MptozbfXiZnC4fo/5yc1+TXo9stj2q750dbHqU6OdLVrdgg/1/6WteaEdVD1I
         LZXg==
X-Forwarded-Encrypted: i=1; AKwUvByv76khA8udVTQo2cUBvpQqTY1u2r90GodY43wGbOEZa3f8uuyhHL3uL1TOkOxcUQk7dvSnKBV/18u9uVo=@vger.kernel.org
X-Gm-Message-State: AFuF++lpEU72osjWRaJio1O22U0OUDB90dVSUf6oS/owm1aXA+doJwS6
	euzab9QquyH0uvU5FW52vLPzkNrOdkMVfQRwYwyA7bXv2RTX5bWlO7AnzENsn/AS
X-Gm-Gg: AYBFou1JfsyaQJ/s1NgmRvLBpNAv7k/o9GcBKO753ZYY/vLLZMZvWuL0axAqAqYE5Pg
	TGzJN9YdsYh3L6wpZ0+rnsnQIGzdtFR+FVjNekZiFct0PD8yTQyppfCypVroIoQW9hYBDt6kcTz
	3eMHI04QAmowltaQ+UmKdGdLvRo2ApMXZb/efN/F99UcKR/CO8deWJj9qbp+XjnPTpE9WIum+5b
	R68rMsrTKR+iKKK2FblLkvdBFh6XdZEzxPyJEkO7VQPJjn0f/s7bc8qs1a8OyO66HKQClw9WgcK
	x9PFJVzyAFjjFhr5HDmLqkCeCoBv7PN1NYuwk+LkutLnFT/uMocNBgdMu4V88OANHUaF3titkau
	OH0EaTs3+RVSbU3hELF+Fgp7t8DN9mtB/ywrMmmQUZsxW6G+b5JsqZUPo69FqHUxER4+UFlaHWe
	gNUB4pVO1zibXmBSr+WiZb6tS6wamjSUnS/aVv/+Jwzz8Cx+9y+XMXEg87WrDcPXE0onAFWkTTI
	m/S3uYRE1n67lEnerq0PEfezGFGqWCTvCJYUaKuNbDj2tbcs6y8R14aRnAmY/L6QTnbO5kzIk/b
	9dEtaYS9bA==
X-Received: by 2002:a17:90a:c105:b0:39e:6a81:f350 with SMTP id 98e67ed59e1d1-39e6a81fcc4mr4701834a91.42.1789856253908;
        Sat, 19 Sep 2026 15:17:33 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6fb75539sm5863046a91.3.2026.09.19.15.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:33 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fuse: validate folio state before pipe_buf_try_steal() in fuse_try_move_folio()
Date: Sat, 19 Sep 2026 22:17:33 +0000
Message-ID: <20260919221733.3707924-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fuse_try_move_folio(), check that the pipe buffer's folio is not
hugetlb, swap-backed, or already mapped/anon before attempting
pipe_buf_try_steal() and inserting it into the FUSE inode's page cache,
preventing VM_BUG_ON_FOLIO() and page cache state corruption.

Fixes: 394244b24fdd ("fuse: support copying large folios")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..121bb1f3cb05 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1147,32 +1147,32 @@ static int fuse_try_move_folio(struct fuse_copy_state *cs, struct folio **foliop
 	if (cs->len != folio_size(oldfolio))
 		goto out_fallback;
 
-	if (!pipe_buf_try_steal(cs->pipe, buf))
-		goto out_fallback;
-
 	newfolio = page_folio(buf->page);
 
-	folio_clear_uptodate(newfolio);
-	folio_clear_mappedtodisk(newfolio);
-
 	if (folio_test_large(newfolio))
-		goto out_fallback_unlock;
-
-	if (fuse_check_folio(newfolio) != 0)
-		goto out_fallback_unlock;
+		goto out_fallback;
 
 	/*
 	 * This is a new and locked page, it shouldn't be mapped or
 	 * have any special flags on it
 	 */
 	if (WARN_ON(folio_mapped(oldfolio)))
-		goto out_fallback_unlock;
+		goto out_fallback;
 	if (WARN_ON(folio_has_private(oldfolio)))
-		goto out_fallback_unlock;
+		goto out_fallback;
 	if (WARN_ON(folio_test_dirty(oldfolio) ||
 				folio_test_writeback(oldfolio)))
-		goto out_fallback_unlock;
+		goto out_fallback;
 	if (WARN_ON(folio_test_mlocked(oldfolio)))
+		goto out_fallback;
+
+	if (!pipe_buf_try_steal(cs->pipe, buf))
+		goto out_fallback;
+
+	folio_clear_uptodate(newfolio);
+	folio_clear_mappedtodisk(newfolio);
+
+	if (fuse_check_folio(newfolio) != 0)
 		goto out_fallback_unlock;
 
 	err = lock_request(cs->req);
