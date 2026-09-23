Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236D429037
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142805; cv=none; b=Aai5MRy7X/buNMAMwWrEu1nKB+7EQm7SPyM7yTJ7c6BbI0P8/9ayjKIFLG23aEsPdRguVzCc694d5BuLmpRzz23kpeSj1fEY5b4I7Sg+2QyW1vg1HKQKdZfe3Z1cHHOldpw2Y4NFrc93TRSvIYF4H0D9oFwbBWcYboOY8JoaOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142805; c=relaxed/simple;
	bh=xX83Qv2GNCSFmPnn+MxtgCfH/8/LCmxa144mvyxtVdg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NOj+qnkz7FteEUS0Scj0tQUi88TyAoJV1UpcmgYWbWnkRFO9lHBjuhmwrgb8poDcnWpfdpAQEkbGLGPeaERAQMzDBtD8kJyx4feQgoWUObaVFjBxGwYuXNA3MHIz0EFDnX610ZUbcnw49mfhPGk5/UrLWZBqIc54+M42E2BKJZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wnlBdlTx; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wnlBdlTx"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so8678415ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790142803; x=1790747603; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GR47YdXkcI+qC2x+J3l7J/ws+MnB/O9JS80C2XvYteI=;
        b=wnlBdlTxED5z4Ybjn1dVsjk+R/0rQQSqhojdfCDwJYGGbJIvinpwjGXOq+RK9orgGd
         f1sTe72f799hW0lz1u4+9Kngafi1qTX6Jn0D6ZG7qxokIVbbs6TAHLK3C7aT3eUyz7/k
         8iIbupyhvi5wBSZJTOUWcnOgs/x6JhXl/u+0Inv3VubbrR5lsM1rtw6TBVedbrxaaoj4
         unl4ngp5s9aZBiWlSHLH7H5guHMdOXU5QmpvO8lEMkasaY41JyFi7KEfDrn8TaRMvhj2
         Mrr41Z6nHwQHDFXLx3SUWWYUkrqCjnORE2OkM3oobJliSpiLIGR1f8vlnDS/LtuG/eDP
         0hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142803; x=1790747603;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GR47YdXkcI+qC2x+J3l7J/ws+MnB/O9JS80C2XvYteI=;
        b=0ECM528lAqePr9Vam4GuYJ4y/OhxkEXSI2z6Vvsi0AMqhQIGBaBP2iUtjPLyqYHzoB
         xpS/O7maR65Ftjpfnt1s+qkOaos2/YGOq7DYP7BfGn1MhktsMS0DCo/vr62ExDawCxFD
         /1Hajojs458K7zL0uIfFJDIKaaWYZywv7iYKJOgo+tUoyokObnWYNXa+GHKbnw14Hbj+
         qLEeLOsW8RsmW+L6alRZHUURtxWO7tPGGwk5lck5DZnDAUDyiyW/SjqODnREUQo5R4Zb
         ULnvgU6r/nI0Ko63uzT3CY56ATOr35beV1VNTUp09AyBoffOwpesjIb6Mh81x5cRSJ3z
         BeMQ==
X-Forwarded-Encrypted: i=1; AKwUvBymBrQRXvZTm5XgNunFICbZ14lbdTDf/oJiUQm/GUZ2UZK9iOcFHuYvO58IzDHaROW9RHd6YrssO4ObfrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mZXSe3MU0tmoOycleCuqww4LGzwLwz/LTiTEjqZcCSarY8iIEi
	GzhIyh//9GsqjkTRU9UqE9TL7Nc/a6g6HgVte2uTSznWj+uNIzbzmiAqxA6Dxbn2TnS9qlOCTy1
	N
X-Received: from plmm2.prod.google.com ([2002:a17:902:c442:b0:2df:4477:df93])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:946:b0:2d5:e3ce:3988
 with SMTP id d9443c01a7336-2df69d3255cmr15603695ad.11.1790142802442; Tue, 22
 Sep 2026 22:53:22 -0700 (PDT)
Date: Wed, 23 Sep 2026 05:53:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923055320.2602534-1-morbo@google.com>
Subject: [PATCH] Drivers: hv: vmbus: annotate struct vmbus_gpadl with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Add the "__counted_by_ptr" attribute to the buffer field of "struct
vmbus_gpadl". This allows compilers (GCC and Clang) to perform
compile-time and runtime bounds-checking when KASAN is enabled, preventing
potential out-of-bounds accesses to the GPADL buffer.

The fields "buffer" and "size" of "struct vmbus_gpadl" are assigned
exactly once, during GPADL establishment inside
"__vmbus_establish_gpadl()" in "drivers/hv/channel.c".

To ensure that the count field ("size") is initialized before the
pointer field ("buffer") is assigned, we reorder the assignments in
"__vmbus_establish_gpadl()" so that "gpadl->size" is written before
"gpadl->buffer".

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/hv/channel.c   | 2 +-
 include/linux/hyperv.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index 7e4cc6f55237..7042de2dd481 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -548,8 +548,8 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 
 	/* At this point, we received the gpadl created msg */
 	gpadl->gpadl_handle = gpadlmsg->gpadl;
-	gpadl->buffer = kbuffer;
 	gpadl->size = size;
+	gpadl->buffer = kbuffer;
 
 
 cleanup:
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 9e109d91aa14..408748a05440 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -780,7 +780,7 @@ struct vmbus_device {
 struct vmbus_gpadl {
 	u32 gpadl_handle;
 	u32 size;
-	void *buffer;
+	void *buffer __counted_by_ptr(size);
 	bool decrypted;
 };
 
-- 
2.55.0.1082.g2b9226bbc0-goog

