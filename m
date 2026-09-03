Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C925B2F4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467859; cv=none; b=N42myuQwNRha6qJcreFijyjS+XqUsR7GZeU2px5/Sh5geLyfOYidaA97zUAKpnWQVrS39h8Ac73MeasQG3Z7DLD1Y2Qa+/zxy8FCjtukdPRsB27qVyXSV41T2OdGOoOVmUvv1tSNyxU8b6+1r8dNfriuynWo2WVLuoNvrvnD6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467859; c=relaxed/simple;
	bh=O/xPPZ+sVVTaOOmEwsa+8rqbwM5fmRoimhLyr+2P6bA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NsWMypyhITx19FbyREnuBykeJ6lwEmIT9q/svXQrSApyKwvO+gG9DYhUZk8d+Z6qMUjci4b/JpENfheYl/WApF5pcYd9kD+p2ItMMuJV2/dl1CEQ/2ra4PvoZ02NzN+uN0uWsJ0YIIc/qeN3UvjvrVEOzEYVMoSj1k94+Raen+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxBNSnbM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxBNSnbM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso3338505e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467853; x=1789072653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgIj/N8oul9ZLAizfJH63NRBCwMtcxycrJMIa0TwyZo=;
        b=sxBNSnbM925Xmo5xFRsdYK75FG4jLnidv2k76p3ry07PWePFFgrckheA2t8q5A06xT
         9Dmv0a49W5WIJMfsgZt0kWw2/KNBYRU11sC6TsKn/8enZf/yVlbe1ocdNRZNINzzDAut
         YlTSVagBG+H88PVSxMp9BbLLvMkPGw+lojTgiAv9RQ6rr/alybLCjOF12Du3V0WJMeWU
         xDilYMbZgFjlv5NKAzIU/zSFQLbm9iF1zlSIqlMEsr0pPWdYRTGERvXhUCngxX0Hz/kb
         FZW2IOZsUnJ6DX/qPaAVczsxdm4t0hQYu/EBLd6+U0TX+ubjrzRje5jmztl1e9BXvlEU
         cGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467853; x=1789072653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgIj/N8oul9ZLAizfJH63NRBCwMtcxycrJMIa0TwyZo=;
        b=LUsbQiLLEdc4UR3CWXWFjVZ8emTXuYQX5T/BQs6xOKXYa5UIkeA/oZTSptAxw0gk/y
         z4TzMaoloVqASOjdFWE3CTZhcvHzgreVvgN2HWN7n1i6Nco7Io8t98CVPckqnapap8j5
         W8SGNUspCn6jps3XNkfHIZPiJ+uiRUutuvfAwFZWH19niz67nhcuP4gKV9zdCNEiFUlg
         9+yX1HtSJD/mtFwYu6pu3dD9rbyUWSjQxxCEmRp3PMlrmY4CUjBKTPl9aM7MAvzxvwJX
         CsbKnDJEBwNB10agLzzS2pLRyrvZg08zlTkNV2Rfoge2NnpLMTDL/oJxBS1VbuWz2h62
         bQ7g==
X-Forwarded-Encrypted: i=1; AKwUvBx58aC8YwsnnvShKKWJzCOLnIgDS1fElPYA/53F9XTKRDkeJCYdS3I/ND6YqUNBu3nl8K3JaaI9wHg+cvw=@vger.kernel.org
X-Gm-Message-State: AFuF++kGKn/xfX3nxVdkGqphMgsmtdAZKTpQjICbSQZtXOr5OEwxDRH5
	6DHKDNkYlrdEqLYJkxpdAOiY06wcV861Tt0AFsef1xOWOhGe1OMty5Wx
X-Gm-Gg: AYBFou3Cycb7IjISy2HHckG5yTY93cbSM5k66Coug8NQT/7I9a4nSu2hsDNaJ/+vY9Z
	JIkI+CG0V9dmXlUXoeEAAPqRtnxEwCBJTsynmnJnbZjSPQwZsVWli1kk9svKgm1/Pa96vADTAhs
	lqD6U6Y5eyY1PM4Ie+2dZTgO7V2J9DJbQvSDcrr4iUb57fMkVAKj9YXnrTb5l3wP3dE+Dgq2sZD
	wJ8xbE+yLKgtK6Ps2lYAxGHn+Eur92xKO9lYhG5xaguYgdL9wi0Rea0+QCETL2UCgYDqYilLXK/
	6orObyBkQEjjcHa2udLgK0tQR7WeFtY2yieI77NR2ilr8Em/+Rte1iXLr7CK5PDDBmiZGqSDgl4
	8PWWZ1fwnfv0zETzqqK5SVKD0IvnLOE+zY+bvFBKL9k9gXlFkSvcgAVDQPMPKIW3fB8AMQv9A39
	+VhZq5K9Fcgj8ynKAel4RSgFpgONPFdZBcjt/8knQT11rpW7krGiB40iNHiAW0DDRW540Is2/Vc
	igYmIOA1bbf95zkUlSkB0BhT6LFQ8GWa7VMD+s/kdKRKHFSbiMO82nKr8sC6afEliq6SieiLuPb
	t0NPzgeCUKW2i242rX5O1eMi9FJU79yuk4IRm/y0OXBVkOpM4IiaoAFgJSE5HazRrA1fgXd+0zS
	xeX5R0xHUUhLbZ5xa
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr8535635e9.3.1788467852848;
        Thu, 03 Sep 2026 13:37:32 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 3/5] slab: handle ERR_PTR values in kfree and hardened usercopy
Date: Thu,  3 Sep 2026 22:37:18 +0200
Message-Id: <20260903203720.63689-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing an ERR_PTR to kfree() currently reaches virt_to_page() and may
fault. Warn and return instead, leaving the bad caller visible without
using the pointer as allocator metadata.

Also reject ERR_PTR values in hardened usercopy. Keep both checks
separate from ZERO_OR_NULL_PTR(), whose exact matching is required by
krealloc().

Link: https://lore.kernel.org/r/CAG48ez05QVn6_gQ2TBrRa1a_DWQoaSSYubUsu5YMWxx-gqMijQ@mail.gmail.com
Link: https://lore.kernel.org/r/202608111716.0FA9DB17@keescook
Link: https://github.com/KSPP/linux/issues/93
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 mm/slub.c     | 3 +++
 mm/usercopy.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/mm/slub.c b/mm/slub.c
index f9b56cb439e7..027b44dd7f07 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6780,6 +6780,9 @@ void kfree(const void *object)
 	if (unlikely(ZERO_OR_NULL_PTR(object)))
 		return;
 
+	if (WARN_ON(IS_ERR(object)))
+		return;
+
 	page = virt_to_page(object);
 	slab = page_slab(page);
 	if (!slab) {
diff --git a/mm/usercopy.c b/mm/usercopy.c
index 5de7a518b1b1..c8d8703544c6 100644
--- a/mm/usercopy.c
+++ b/mm/usercopy.c
@@ -157,6 +157,9 @@ static inline void check_bogus_address(const unsigned long ptr, unsigned long n,
 	/* Reject if NULL or ZERO-allocation. */
 	if (ZERO_OR_NULL_PTR(ptr))
 		usercopy_abort("null address", NULL, to_user, ptr, n);
+
+	if (IS_ERR_VALUE(ptr))
+		usercopy_abort("ERR_PTR", NULL, to_user, ptr, n);
 }
 
 static inline void check_heap_object(const void *ptr, unsigned long n,
-- 
2.53.0

