Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C643F8A5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277900; cv=none; b=cCOeSZx5tN0Td854DkhXU0KN6Xqj1a87eQxebUp/2z5nVo9XWRuLuXnteePeXqQWeOoNBFiafv0VDtjoWb6E3wQt7Zf11beYTke+pIl/uIhtN61XtatW9Gsq3YhPC/PaZlX/2Qijt4/Y7hR9YSrAYZytXtpMnE44WHYplLxWL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277900; c=relaxed/simple;
	bh=hdl+OTB1yVSH9JDm9Gsa4MpjZfNwEkwTNc5VP4tp/Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NY//FN/iiRyDxIQQVqfxkysP6R8GaB+Z3WfKScc/k9XUB2h7q/bKspRcopL/qMN9K+5NTicIaXOfsj4aytNkJ8BbQJVcw8csxjLCFIa+buS6FXFTxXvoxBwrCGdKFm8k1ByiyRcGfpr5I+bHNAatC+Fq3rNFACLLEvKTqLyeK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em+ZiQgd; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em+ZiQgd"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-865bdc6ed72so1113207b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277898; x=1788882698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usbV3+3pOtvfEBv9PQmV+IQ3z+lbp/nmOaEabXXhASE=;
        b=Em+ZiQgdH8evZL7lECXfuy5yQ9F6kyaJ/nTw0djSb/HyRGDyy6o16sBnQj6uIzPdU6
         T1BFu/p81atYbHHZ4h9cpyc6ny9X17cycgkgjWZXCn4ZbE36nuD6/nZbu4bSW7L+Q+S8
         JVpvyJmmawIDXiIN3y15j10c46ZJWlA5Me53u5z6VxBM94ps6z1/rUzKLXUOdUIozAbT
         yhzFtg4J923v7BVi5QklD6dCGiq8dPrx1z9YQPXITc5wZZ7rMmb/XM6Oj3sFWNDYGly3
         JLbopQ69VBqfLGx0M29JnIJzJBaKJwG2ChTc9ElRMN9TtMCk9Wkuf/mG/aC3okDz4dg4
         iD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277898; x=1788882698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=usbV3+3pOtvfEBv9PQmV+IQ3z+lbp/nmOaEabXXhASE=;
        b=O0DVthkAJFTGHTgUJ4EN7hOo7aU2NxV82+S4H5mv5eS7hmERj9N+dbvz6rJCxYmoNI
         7zYUTzNyXy+X4ECiq8JKHZd0and989YGjKUp4s3VJbuc9LxedTJXubTJJO8r+9mY6ZXY
         GYya/vhsKZDF1Ib/sqRigAzdbdu12Twd2k+O8bDfCVgyNUbPsPLWAqRd1SQUJTGJQHU4
         ksiFofdVqKHT7Q/QmYG4oHzOasjZlXwjUS83gF6vLb4Whhwfx32mZR6Brwp+aDXT3rLW
         QwQvAWm7kZvXqLc54wdoSsLqyDe8kgxO10olG6hCAVfup6MTFVpuvAp9cF0l0DSRm28e
         kY9A==
X-Forwarded-Encrypted: i=1; AKwUvBzR5EprTzOAnJ1lpnVy9W8xdSBWCKWnQOHjc+nK8tx3wMR5KzHCUZBEW/q88SJ/BbkDLBA4YooNCSk0tWM=@vger.kernel.org
X-Gm-Message-State: AFuF++m1SrCm+Fncvu8tL/cOE9xuGBiXGnlWxFKXI1mfSkMjJ0nJ/7aj
	WgMns4eMrXpxXXe+6YCT6O+9M2onsUpkcNC6SiF0g2Eh5IRjVMTo6FsB
X-Gm-Gg: AYBFou17dcQHR0ZXjOaLmImvI5mik4ImfiH7hZoGGOchYuDRzJMLDBtebGv4NTD6U0A
	ZrVqq8EjTyjS8+Nb5hbcVo4y+DoZPtEEMCNyIa7fVkla7IwM4vMgqNr6idOPXubXzOQFary9PW+
	MlwBuSBQrY0+LJZ+eia9ovN9TQrlGAPe19X9nF02plk3iWb17koI8ph/ucGnYmJ3NsjJUHPPB3L
	w7Vqt0wcItqSsCNg3niEGECUkjvALD8th80D7LRRkIFdaYDdp8Q0c15C7kQnIU7WPEXo794sG3N
	cBtqOPBEmbwwGUHvrCntNEzosLXtxLb2yxYghgqSXB1CHVS/0RxMHQaKIIfJVSj+L2x3mrNJVYy
	fEAjWNf0TMz03v3SUpJiBgIZjfZTYwzzkJXUXgL/eM925YkXSwlYElkNNL8hD0eonwcFFVzslPr
	y8H8b5uOR717hdEs1KUbgNKZMyK/oDzNIdorNcUkINfuBgP7b8W7kQF0tA3ENx9bUAgNa2KsbPc
	PG3Zme9xEBTj+/ff1C/e6SEnIrSo3Oo1IjyoLf+
X-Received: by 2002:a05:690c:4017:b0:85d:42c3:d00b with SMTP id 00721157ae682-8686f52b910mr40076987b3.9.1788277897397;
        Tue, 01 Sep 2026 08:51:37 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5e181596sm78013697b3.10.2026.09.01.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:34 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/24] alpha: select HAVE_GUP_FAST
Date: Tue,  1 Sep 2026 11:50:29 -0400
Message-ID: <96d45353c7c29cc3aaa3234bd960f38d2ed8889f.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lockless GUP fast path needs the architecture to distinguish PTEs
with no struct page behind them and to keep page table pages alive while
a walker holds no lock.  Alpha now has ARCH_HAS_PTE_SPECIAL, and it has
selected MMU_GATHER_RCU_TABLE_FREE for a long time, so both requirements
are met.

PTEs are a single 64-bit word on Alpha, so the lockless reads that the
generic walker performs cannot tear, and no arch-specific
gup_fast_permitted() or ptep_get_lockless() is needed.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 87fe81bc4709..352615956b1e 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -26,6 +26,7 @@ config ALPHA
 	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
+	select HAVE_GUP_FAST
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
-- 
2.54.0

