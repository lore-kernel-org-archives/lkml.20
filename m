Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D840D481A97
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525718; cv=none; b=DX8XFqSOLAQgw9E1GJ/5t9/OODRhkHO8wr6m7255LwMTLbVnx7mpV1F1NxYOBORhJP6837x6eR4A7dCMh0PT4ZzP/AS7BHoRTFf0wqvcatiOsZafJthRQYqhYNjlbP7EtKLEpZZfwia9PMv3JeukpGCDzHjzjpSnO0+w8i+yoIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525718; c=relaxed/simple;
	bh=p97xN+yxFG2kxLlLHkXwPxNJGFfneqahwIWA6jc93L0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXrIjBCQMI/+CQ5rv/tYouXbEctDRqXMvQ943FWC1dGTeDej7JIW5vb+W9Lj0LNn+WqA4v8UBGwTMo0oIMYMFk19fTqkDHJW4reHhQNPtL0MBz6wC2gbcYNG4NXQkLwcAFjVMmCL8PQyrnUX86gdgA9qiiXL2v4SMM4/McMV/s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2RQBz0E; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2RQBz0E"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b12942ed04so770930eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525716; x=1789130516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo2cB7c43fEdTjQDwRU3AQpuND6TClsVlNexnSMYtm0=;
        b=Q2RQBz0ECZrz+Dp1itdysg2mivekYGX+yNjkyY7nsAnqBiL8QerOnwJKmYWYVBgm64
         ftm53vaLeocqE8WG7Jw0Hr97q4u9yd8gycmJWYeSt9iIMg4Hc9vnpV/fL5sWfQz3B/8n
         z3R8Mq/tmkDRROgfwwwtVlRqQJ3JTrCUBmZvH/fFQwEJUFVGq6nira9UVXowIBv7ITCD
         xWpmkDDUt0PS8dMyE5RWyUPI+CrW6C8JaU1ZucigejeVYyqxb3IjiKrgWHEIdIjTMEIn
         TjLUUW4fGuG0n20sf3MBTv8QnOHKcCPgNq1N1SamCkuPcC56gxbHGFQfA2A0q4LZbtwf
         xueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525716; x=1789130516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fo2cB7c43fEdTjQDwRU3AQpuND6TClsVlNexnSMYtm0=;
        b=Lx63qRn7jTbkR5KxApKeFL2boCDVBEg9ZHC8BDMICJ4uCWDba22DX/jIMuflMxHH9b
         WS1Qy7yOlVGWnHsx4BZ1MKyMgSzTComGKfZ+Ny/f+mKJ8CS3LekULDQhFMg75h+fdnMP
         vPrWZI4HIpyFq9KW4p/x7zWMRVWxe64PJNgU9gTzJppH58tpCshpeRjs5ob6pjcYWAro
         9wdhDFmC83ZZTSaA3PnGP8cl2t9+ggLflgj7kgmGv7VNc6mpO20MBKButHwRp6P7NBOC
         wqj5RaKdqYP4UyQq2lhPQe9UOoFuwkWlM8Wn0jViM2SPsIxzvmcmqAzx/mlOPO5ujc6d
         zgUw==
X-Gm-Message-State: AFuF++n7coqdiRyhYuVVJIlGkzib/Y2WF2Scw/CvTltPPrc6nklP7zUX
	+AZswdg7OJMv+3YBMMuGPN+XoC1fMCi7hHahZSd0Iw4SIS6cXCyH2ZfwYL2/tM4M+P8=
X-Gm-Gg: AYBFou2AC8IBpkA9mypiQ3P1dG70cdx4zw7UdPve+JBBobg32hjFyKe3w9VoEDrSJ0O
	uGG8+qDz/8EeVOUqzyM72Z0Z17+DRMx7II3r+3xgqI5hICtidSRhYM6oluJfU83CsEOXXrMvsng
	8v1++FGgGa2uhez/AhviTH2/bk6WLsRFKaehBFiollQUb15+41wxl0HxmKf7Y5DN4kYY1Vhnvwq
	qnoKlPzW2cAipFHTXJNTmz4WXBf4kTQ79YMonbQ0OEnewNq2/mVmrZrW/zH64mX7Tt0vkV5kTlh
	iWqe9eU4f6wIWYwBaf1E5r7oPbI1mz17sskP0Kt/JPfIZesFXEMWDjWMVW1mn7LCCV7FogU9H2L
	E73ELe4hXo0KTQz8yHqC8pidaKbNDrUCSHl90ukMqoEBfMJL+NpVRfP+6TlEcB2gnDw24py1d2a
	KwNBnbIwfyvw8caSwK9vGUF5abLbPkfT53xE8TE4UrXAKUSAnzD64l20oURpIqEAjFoEJr38foD
	f4JA2g/DPh1TNlPTjyAezmgaA==
X-Received: by 2002:a05:6820:1c87:b0:6b5:ff0a:d336 with SMTP id 006d021491bc7-6b6f98d0013mr4299740eaf.6.1788525715601;
        Fri, 04 Sep 2026 05:41:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6389550eec.27.2026.09.04.05.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:41:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 1/2] sh: fix typos in comments
Date: Fri,  4 Sep 2026 18:11:45 +0530
Message-ID: <20260904124148.4575-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124148.4575-1-hemanth.selam@gmail.com>
References: <20260904124148.4575-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sh/kernel/relocate_kernel.S | 2 +-
 arch/sh/mm/cache-sh4.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/kernel/relocate_kernel.S b/arch/sh/kernel/relocate_kernel.S
index d9bf2b727b42..deda2f60a8f2 100644
--- a/arch/sh/kernel/relocate_kernel.S
+++ b/arch/sh/kernel/relocate_kernel.S
@@ -3,7 +3,7 @@
  * relocate_kernel.S - put the kernel image in place to boot
  * 2005.9.17 kogiidena@eggplant.ddo.jp
  *
- * LANDISK/sh4 is supported. Maybe, SH archtecture works well.
+ * LANDISK/sh4 is supported. Maybe, SH architecture works well.
  *
  * 2009-03-18 Magnus Damm - Added Kexec Jump support
  */
diff --git a/arch/sh/mm/cache-sh4.c b/arch/sh/mm/cache-sh4.c
index 8bc9ce541c14..0c205923e88f 100644
--- a/arch/sh/mm/cache-sh4.c
+++ b/arch/sh/mm/cache-sh4.c
@@ -354,7 +354,7 @@ static void __flush_cache_one(unsigned long addr, unsigned long phys,
 
 	/*
 	 * We know there will be >=1 iteration, so write as do-while to avoid
-	 * pointless nead-of-loop check for 0 iterations.
+	 * pointless head-of-loop check for 0 iterations.
 	 */
 	do {
 		ea = base_addr + PAGE_SIZE;
-- 
2.48.1

