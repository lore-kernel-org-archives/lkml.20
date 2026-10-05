Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4147989E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196880; cv=none; b=O+saMA8yxGGWW8uHH/+Xcp2z7r/J3KZPxAL2V1JXreHJuhGMw5bbyh5kYztXg21PcoX+7qwOkUNpBHFJp6sSWKQAWrGb2Qu5sUn6QSoWYoyrGYw79AHz+vV19sPr6aiRJFHkTMscieea53+e3UEs9qCdD04ThwtPW4hpwOQ41J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196880; c=relaxed/simple;
	bh=lxTV8zb+/ah+Q+pD5ZPJo6Fkfw+aRQuqeJEmjUazSpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RnLFhfC1cAGP/33HLNZJxRbZBdOuItRfeup8uNNmp/0peJjg98QRDqwvnFFlVTfyS6lQYBTtggtSFObrDUzR7o67vhtR4d+T69ZARrgK7keD/SHR+PyRwSKIvYqRcB9HjqDEnUWYv0fWuoabl2mwbo89zFX4jz4MWhVjoGo6/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdNkHIKb; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdNkHIKb"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6cfed5dd083so1306001eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196878; x=1791801678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1qzV/hN8nZ4Hd9bI8LartapyGj4b5NFK++8dr498H8=;
        b=IdNkHIKbPE5nDR1pUz4bk9/1RNrLyLvEefiYjTYsib385TLBZkBYkH6RbIVBx92gzL
         lbOxIRfyyL8wMnOW29TT3auwHLkSCKKc5zkWN65mdT5v1pRKYUYjTN9N++zxbGj4j1IA
         vtZtymhLCRnqSwIPIw7Kl1Vk+9N3qoQMmVWAzL13WH3/DyrNMoBj+n/B7joLMa+ts+WC
         h87yVGp7GD26W1kNElHfbfYvrnTlQToJq3zGWTmL1tQG+80Hw/ldiBRZQgly5CNxN2/R
         FMxiv+EPr69g3c61XOm/uwNA+nJ8hv8ITdTur/0N4G2IxZmL3uFzBT29O5pMx0LelY3u
         XUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196878; x=1791801678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1qzV/hN8nZ4Hd9bI8LartapyGj4b5NFK++8dr498H8=;
        b=KmJsKN8FqZzOW4gXbjjjKwINK4sRdRRlV0WtK63XUKCm/re7sU4Bsf1ukaBStspKg6
         S7yOlNvXljzycjzPDH3kvDKyFUeR6miL6GT7YzHSdMGyFKWawi/Po5IT/HDMgpj3uko5
         25kP6OSlmhSA5yic0eHhCb+lQQ4g8zzyzW+XhJnWfhlmivBWBY5pYHKdPOlhQU3wl0pt
         AlKR+OnI5LgoHj6wvzCQNNCHr7KgVSHMDOG0nH7yJo6NMY/mIm3gaXl3rxZbbhHtMEgB
         +XMVDgcPIV8X53c6gSzQJcLp85co30kUljjEEhNdjv8V1pcCsO8BViYWvvQ1Au3iCgdA
         imfA==
X-Forwarded-Encrypted: i=1; AKwUvBwVQ+qt3LZ64YTlzkL7X/7UgZiPJ1Dor8DNBGIk0S9P2e72Bb7FFp5Cp+m2jIQ3GcSsfkz2JX/iYFwSPJI=@vger.kernel.org
X-Gm-Message-State: AFuF++njrUy6/MMyL4bYKHKiheqaRQkNkVvksqKHdvAGfSsLZNW7zixY
	fz2rbqtamKjeM+mgjKj/CUV7R0GNT00wNiYcF51NBCpk0tHoo5NAy61tvPU76Wmd
X-Gm-Gg: AYBFou2k5R80x1JVlxcuDEt6XlK2yTnQz1TWzYrmNTp8876LlqQM81V56X0SRN4eBZe
	t/wIPd+tSQHd7pNyI7EXfCVz6Pi0WaChXJI9ZUSWaRw3/rtDKmkVzrbtJQWl2ONt1z5hA0Mu6Aa
	ocT/Ffows+gLbtNqbeQA62YuUV79HTaJcykbbF02tbt+TNxWgOni+LKlKZaNC6seQTdD8hq7GZ6
	CzhhUbfkaweyONgRt0tHhbkdvr0W0w9Pcde4eAFPfgpRNMLFwKk9Y2ScJPTyUeqwvQ8/0jugyWb
	FAHxeMtgeBjZbNb+uBM0YcarMbdJNHGKtjocBqYMFjBm3Jt1P0zp86jiM1D3KZq5bWB3SNQ46/P
	swqiduIyzqWcFqC+Jehxah2of7JuOTpHcpyntXtZp0igkk/4LYv5nvcygHlo1igDohZcOUDvINp
	iFlbSpLNHRPsliewaOF6wwbGAlLJeUv0qgBrC2twFn21k2LhDGRysZ5d7ltdsyFZq/UeCZWl2js
	J9WTQu+kU09
X-Received: by 2002:a05:6820:184c:b0:6df:4bc0:384f with SMTP id 006d021491bc7-6e09e18382amr6405291eaf.50.1791196878033;
        Mon, 05 Oct 2026 03:41:18 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:16 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] modpost: fix pointer arithmetic on NULL in parse_source_files()
Date: Mon,  5 Oct 2026 05:40:48 -0500
Message-Id: <20261005104050.1786222-8-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

parse_source_files() checks whether a dependency is in the same directory
as the object file with

  (strstr(line, dir) + strlen(dir) - 1) == strrchr(line, '/')

When the dependency is not below dir, strstr() returns NULL and the
pointer arithmetic on NULL is undefined behaviour. This happens for
every module with dependencies outside its own directory, and UBSan
reports:

  scripts/mod/sumversion.c: runtime error: applying non-zero offset
  to null pointer

Check the result of strstr() before using it.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/mod/sumversion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 3dd28b4d0..4c59e7cfb 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -364,7 +364,8 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 		}
 
 		/* Check if this file is in same dir as objfile */
-		if ((strstr(line, dir)+strlen(dir)-1) == strrchr(line, '/')) {
+		p = strstr(line, dir);
+		if (p && p + dirlen - 1 == strrchr(line, '/')) {
 			if (!parse_file(line, md)) {
 				warn("could not open %s: %s\n",
 				     line, strerror(errno));
-- 
2.34.1

