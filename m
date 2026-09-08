Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1449890A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903221; cv=none; b=FTkshHzN5jRdqeamPRaPwfb8dnpcilqQeYnPCIx+vlbGHCVw8fpRO9P8zfFlqH6e6l2zh4nDQiwHDKUBJh8QVYD9yCtwPuVXN3psh5Yloy54oHDbjmmDp0h1BGa+b9qDr1wYndHOl9VUOZg4mO4vVsiSvZkIC2f1p7ziIUYdIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903221; c=relaxed/simple;
	bh=gQYMQIZ0a0qQpuJQGl9sxe6tSFIiwDa+pVKYc1H04vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKvq6BLD4XKBaf+/voY+kwKjJFcMom/X5bBQZOaDAoizxVqJF9gl+gQs0Drv1gIjglC8/ejSq6GfKEzQiJbMhUBZgUBwCf+YXsTJr3UxZ01UbC14XGZmsLTLzYCBCYXkyis5paU9j8v3ISVq83t8+wkRH6J3xvQ61q02EIQTx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnxykDN6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnxykDN6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceab75934dso48920255ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903218; x=1789508018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHiWJUkqXIHHnljOBGvidp4XfKDa865c5NPgCl6nJgk=;
        b=mnxykDN6MG7lKokO4lIuXto15ET5eg4fZ+6tV2sglQPz2txkLps9M06CHFBSVsXupR
         EX6t+pZA37xFldmE7Yt3XCEATvl5kAmL0cpMGuhNVkv+aa8LSrce9OEwVfr88cEhoX7w
         mCJ4Ld4F8BeWPwkVV5agP1SQRw7k61LIA0C3pn2qx2GpfWYixWteqodoJub28k+/ngt7
         402sNcEr4EV9hMj9nasdR0fM1ID0MUX/J0nAgURSN/epn5reO8GBu40Z0M50Xnbx/2ot
         yRZ95c4j0rFNqXyy4VI351vl28RSXOUHiCqkklJIR44SwitSzw0cvicTGDPAUptMUcz3
         0vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903218; x=1789508018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHiWJUkqXIHHnljOBGvidp4XfKDa865c5NPgCl6nJgk=;
        b=OeJptS7VSBpK7QfYZBMAFIkQgC1BC7smSr5H7latFDZ7GHHHyorExcu0ZnvvAnCPZ4
         RvDAl+r/g782FKpi2OCEB/GsaezO7T5J/Izr5mXhTkqgDej/90hf+8aD/zPOhZUrjllq
         MxBop4mgvw8ntRIZlZE5wQwRhwm54XlrCdhJtHjh6gYNv9ToRjzARBqEEbc0dAiy2Ecj
         K58cmlWYYt8AwxXl2RezkRfhMKTikI/+rtYCqI01EJtCA/R/GQMD8V+KwCj2Rq0DHbeR
         SkcXJMIuGTZXYCB4XuBVf0wKbAMuOWhU2vUKR52dYm5C8ow1IWNzgfUptw5qDw184XT4
         64ag==
X-Forwarded-Encrypted: i=1; AKwUvBzeoycS4GYrT2TwmEdHUw7WD5yYA32jDer9woV5dZlaPQHdSerW8L6ONaOPThKQmLD3qw9Y+y5+buSxXFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kIWKIKiD9w0NQ15l6tElGQ1Bd4qS4ZOlh8hyR4dOIWHOO/cUkB
	vMQd4abbSgaLZdxGoofUBHcL0cWPvyx2NJx1GdKihv7idurebstLziq+
X-Gm-Gg: AYBFou2whU2gEIdHesVFTQ4JnsmpFTxZBChN03bSlVivtpK8k+/g6U2yRGLSC/8IX35
	eFiZW+wtOlZRxNF/xdhB4L6K1E5M1rCk1PggU0K5g+HTyyVbK4mNCGVUrClvQEh3g8gzNKkfDwD
	zZFcGJT6D6AxNvLAuLuXpsynWgBQtfRE2RsRjOClojJRZPXU+Kxr5OvpE73RuMnDO1upJxN9fFi
	fRNQcc+N+No4dpDxJI5Xks2u9HRUkASsuEwO54KpQZJTatgIypxp4u21fS0fHc788XyEBEI53pL
	ffQOtYo9CdFVzv8TAPi6Wvc6nkKedoyVQknbAVN/b1QQKGaR61jVA4gV7AtoldVX53ljLO07lgl
	ydCuFD88vU4jwLB7eMqTF+I5TqOub8OUZvZhhVGIWNGAx8VY+wmELXSH9Qn7O0IzvoOjJiTIrAJ
	vdf2K6ygMjk6PigAI5HNJtGsgfQ0p2/zQ5l3+DoO6LL+XuW7EDPE8lMxHLge6DsbUqJ7+CufIHN
	YPTIgZWvG0E9QQSDa6oafhR+6bnV5m5KLqZqOjsXKbmLbhrb901oxQladNFlEGBIOF80WXMRGCg
	xmkf2vFrsGqyPvDkvPfo3joHwWBO+l08PAQL8Q==
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr46132348a91.21.1788903217940;
        Tue, 08 Sep 2026 14:33:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm28700771a91.2.2026.09.08.14.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:33:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] dmaengine: bestcomm: ata: drop unused local variable 'inc'
Date: Tue,  8 Sep 2026 14:33:34 -0700
Message-ID: <20260908213334.593584-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_ata_init() declared and assigned a struct bcom_ata_inc *inc that
was never read, tripping clang -Wunused-but-set-variable:

  drivers/dma/bestcomm/ata.c:58:23: error: variable 'inc' set but not
  used [-Werror,-Wunused-but-set-variable]
     58 |         struct bcom_ata_inc *inc;
        |                              ^

Drop the declaration and the bcom_task_inc() call that fed it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: use suggested title
 drivers/dma/bestcomm/ata.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/bestcomm/ata.c b/drivers/dma/bestcomm/ata.c
index 502a45d76adc..40126f3f189e 100644
--- a/drivers/dma/bestcomm/ata.c
+++ b/drivers/dma/bestcomm/ata.c
@@ -55,7 +55,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 {
 	struct bcom_task *tsk;
 	struct bcom_ata_var *var;
-	struct bcom_ata_inc *inc;
 
 	/* Prefetch breaks ATA DMA.  Turn it off for ATA DMA */
 	bcom_disable_prefetch();
@@ -69,7 +68,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 	bcom_ata_reset_bd(tsk);
 
 	var = (struct bcom_ata_var *) bcom_task_var(tsk->tasknum);
-	inc = (struct bcom_ata_inc *) bcom_task_inc(tsk->tasknum);
 
 	if (bcom_load_image(tsk->tasknum, bcom_ata_task)) {
 		bcom_task_free(tsk);
-- 
2.55.0

