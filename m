Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946820;
	b=38IQJdAh34xWnjVjIpJxilnZ7Fp+JXlKT/XDPx3onAUc0aKv0wb9GFXRGVzLmkW5GgTY
	 OC3GYpxbZeXQiwAU/UH1A0/zp0I6Q9ghpValKk+lmTxaISalMcWwXod95ec9he6Qd/htB
	 xQ7AGQ2FddibvRWRpaVu6c4nOx5Nxo3z3VFLrc0mfw6R6GoKQFHdoKuU0UvYroOQsxUsK
	 p5W7x2ZvEotbmkWiTwP54Vtr2oq0t5Fd+G4QCsl+bSqOzumaF3AzU8KpITCzT1Z08GsEC
	 AXzW+p6l4AQjeA9bT6MyoBts3WDqrQV9xodc59M2BMwiUSya+Ei5BDleZVVUE3fJ3kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OfgFlzGjw1v4HVRSf59nbvbgqbjgCU9X1s1eTDVI2XE=;
	b=STODIBuRYHBiEybDKUvwbsM6TmU2kHWLpDuJ77dx4cKgE2gfWHLm9YcDwYmqCnziN4DN
	 NYYcSanvLrYvwo9Df7yGygBhKEKPQGQUALOXFdkHWjTg3DYkdkE4OU1hVRHexp4s7rzFy
	 a/dlPuSvDhdTKBfnuT2Ry8e+nvBmL71Sa/7YCsJYDr4KWA87JRJDLJ8YZqnq4/XVIsI5a
	 aRXmP0tBSd6R2iw7wWCAXvxU5d956iplMi6+iClzXIr1YIG6f8TUGp7ssM5N9366uhd9L
	 8160uvyeU1206h2uHH2beftBMbhAbI+4SAjdWN/ulB/QYT6b70aWHzOichiLt9exgKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VCv791va;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0679606A324
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0679606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VCv791va
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-35d0be18c71so3945446eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792946819; x=1793551619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfgFlzGjw1v4HVRSf59nbvbgqbjgCU9X1s1eTDVI2XE=;
        b=VCv791va/DDx6T+0REGuHSoMALzbLBPo/HVx/Vrqkf7FavqhzQVkwz8+nFbWw36Tuf
         wbxmpvQNqrAcylPxj5mODVndmgHb6OejeUqgQIsCfR/Co2uNij4Hy4dWhrCCgzU0uaBN
         j+zLwqFzgAB/A74IVd7Kluoc+1/KT9SkaIMkAFhvc+wpIm7uNhLZXkSU1+iybMFgI+fD
         DGAdV9InLzXxDFiOOY1zJeB5rCjMTIU0UGi0ORRyidPIeMxyTS5qGDqfFAb5uDHqb2Zh
         gPjY8fwspN4TWKgEphlzFigXt2nsme8tjW3MtI3IKNAeKpdhMqJ2uAYtkKlbTSkKwc7W
         aE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946819; x=1793551619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfgFlzGjw1v4HVRSf59nbvbgqbjgCU9X1s1eTDVI2XE=;
        b=YjBxTLVcfcjUer5pgYiO/lCzEwboR/vsNup0ShhgVer4LPAvqN11IDAAFbi+ul9Dk2
         2bYJjUNH6z2PMJMu4+qM4UZbujHRn6dhW3JBugtYO9HBG7y6hOEfbPosqv7wYrsZNIHu
         PvfMPBeSk86BRv8P9vnuGIYWminIvys/ymDskTe190fqu83Z61Mwa4Iv93hmjZsW3+kt
         Egha6Di7FRJNQ7WMP3axJR5hpmEEkiAMN1EchnMgzyElKmfvFBTqMw9Zwse2MkhBMLo/
         H+FiDChIOCaSzXFVN/d/WS7lYE7aDaDsfDTEZyffYDnuSG/0bK812PDNXWF/lnO9MJ0B
         nqfA==
X-Forwarded-Encrypted: i=1; AKwUvBzyZfBu2/fz8qIzzceEQSZ3l6/ikCW08GEg5fUL+KWEHuGGLRw8uRT2pX93FT/jgpDvgRIJqFk6tbOPkIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyKiMqgcuwtplf5+Q0PyrSgWNm9/eKrtV/fD3mpF7DTFFTShe3
	ssvkssu7aZKazbJ1WM+wKtKWqjx7TM9CxeJjAG6EXZElXOmZKT1a0Buw8gx1tcLc
X-Gm-Gg: AYBFou3GmANPRx3uVckrF34weY2x0qwcatREZxaFsqJTPwhZzULWvJJClap3Gn/5EMB
	UBtcK0U+zEldE6MLZtVkWFfceYN1HGSkm8JXtpXK1rZRy3n/QDSKEdCajAa9A1g4GHNLdXFzQau
	xA8g7pWw+K3gdcvVAs8hFSFzvM9WmCUOmsps1e/mOUKukKgjCcDzxG0xkEfmyIhMU/DkLLWRu3m
	zgl/qVDblTK3PZZiGWIWEBoir1weZVRYtRMa9FfAmz5PcPbKAk3HCk2qMYNgMRcYr4Yi8CvWsPs
	LBYiTnG3aOe26FZssHf+UOn8+7BxFrmxJZhFUdnKyWvT2nVY+Giqv8W5aWNR4Tp88lDiKyq2BNK
	JnUOt6D2lTeOeycG7UuxiSI7G7f1DTCk+k7kbRWqWeMEUyUBUkO6AaIHsrfnG7UX9s8I4dlfWbn
	fr9mXtt7zhOMniqZ/rC5t7Lm8976FT1dshiBK925kXPWto/FWK4DjzQAnIryCdy1pZwf63RQVwt
	/BmF3RERc2/NI/ftTkx2/wUuyAsiaKUaZrdpsvaZl7ykbIY0h+s+scJqk2Faks/V8/7MyyAC2re
	UqhvAw8=
X-Received: by 2002:a05:7022:439f:b0:155:734:9cc9 with SMTP id a92af1059eb24-19935be7f99mr9441348c88.16.1792946818717;
        Sun, 25 Oct 2026 09:46:58 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm18320531c88.9.2026.10.25.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:46:58 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hughd@google.com
Cc: baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	dave.hansen@linux.intel.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] shmem: do not extend i_size when no data was copied
Date: Sun, 25 Oct 2026 16:46:19 +0000
Message-ID: <20261025164619.89992-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shmem_write_end() advances i_size to pos + copied even when copied is
zero. A buffered write past EOF can therefore extend a tmpfs file
without writing any data.

Moving prefaulting to the slow write path makes this easy to reproduce:
a one-byte pwrite() at offset 4096 into an empty memfd, with an unreadable
source buffer, fails with EFAULT but leaves the file size at 4096.
generic_perform_write() calls ->write_end() with copied == 0 before
trying to fault in the source buffer.

Only extend i_size when data was copied. Leave the existing folio
handling unchanged so successful writes, retries and preallocated
pages retain their current behavior.

Fixes: 665575cff098 ("filemap: move prefaulting out of hot write path")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index d97fc32e7c94..55287c370c73 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3487,7 +3487,7 @@ shmem_write_end(const struct kiocb *iocb, struct address_space *mapping,
 {
 	struct inode *inode = mapping->host;
 
-	if (pos + copied > inode->i_size)
+	if (copied && pos + copied > inode->i_size)
 		i_size_write(inode, pos + copied);
 
 	if (!folio_test_uptodate(folio)) {
-- 
2.43.0

