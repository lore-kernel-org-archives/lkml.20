Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604034BEE4B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163900; cv=none; b=nOfEo89wCMBoZ3K0lLl095RgkxqMaMpVOsB6fNi0GC7JDr/pa+AJe+/D4RRY5Op7HS5D1bmzkqerOeHJ0c9jjLJ5N2p2E/i5YNvNf8UPOc2PK9NHW8SSzIC1az+BEZ06AQr83YEZZ2OCoI3qboAj4l5rTp+pnmIchQQ+zepM5sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163900; c=relaxed/simple;
	bh=YIVQyKPn/CBMnrhhj+UCbVR1srHzuqCej98pzoG9yWM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=orIeh+iVjtUBprP1ma+VUKD7vv2ruFPvgnJzHYg2znaeKglKf6wt+BWnJmJDNoiNFw1rJSqgv2mMEwHk3gh6CPGOn8sPDmNRDwxKvpPY6/glEUvGcnAUqYY4d/AxQlhTlRRh6bK+q+swVN0Kc2widI2x2jeT4exqzSx/rLVVAHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oc1RZvR/; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc1RZvR/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so245153f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789163897; x=1789768697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaSVO9+YGIhuTBYfjaMR2jUcLg/dQarnG6kYgzM1U+4=;
        b=oc1RZvR/5pPRfmhB2Zd2ajOUhwkjSqx62+XvNmGrWZA2RFvITZH++tBjxkUtL4zFHT
         lH2ci6rRcjqR9KQRbn6OEvXUtCqMWW2AwqyRabV7K4Sym2AJy+BO2l2/K2aMVF8gKq22
         G/xMNXlFp5OCqt1pqBaoUGTbQRb+5NcDjeDAM2cvcbbr0As50UvthXnDFjrbreJWwAro
         43SZlALmV2FimXpWZygEy+TA3PnPnFDaOhaCZyf99EFkMm/hXfa4eqkajKXB+KEWOIux
         PcQ1asqirQgzj9bS4+0iZhKvWDwCi3Pv/M4wZh5FJJzPexPERMHJw+PNCrFQ3n3W/M2n
         13gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163897; x=1789768697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaSVO9+YGIhuTBYfjaMR2jUcLg/dQarnG6kYgzM1U+4=;
        b=Mqmfkonycq+ABKLg5cxLvNVui3iQgZd9sFgtTX+zk17Uq8gVBpu8r3M/lTr/lRoVi+
         C6GXghUD9A7wkNskXlkCp5wD8/hzKQVV3LOo4OMekT+euy6Mjv0WNCSWCM1hCf2GRgzJ
         p03NDpY5KwzsAGwm2x+3WMr6iTolcptGD8T+n/Rv1Cle+h5w/pezV+f3nS43nNemefC+
         F/lkP5Mafy4EuxeKyrOS13+exHZs4I/eUP3lopArlaAvPhofSglYUoK4cACzPQAJ5B5o
         i3gkiL2uAHdYFEnn1YvG+gzTwmJ9h1PtvsWhPgjFIUdMeU3eXe3pGwLj5/xaUP2V2pAT
         8ajg==
X-Forwarded-Encrypted: i=1; AKwUvBy8ZQPjTIDohCIqXd9QoyGMqLRFXXBSkaZ/82e775sbWBU5BcEpHkozrzLvvwoQSBcbhTD7P911PT64qqA=@vger.kernel.org
X-Gm-Message-State: AFuF++ll+0UaOBSFTrKC5ypkAu4BTu4z8rpL19dhHmgAkE8+mFAIegkm
	14kQ5JsQyJY3SP61mK2Ly8+WRXxmEamk/JF8CuDnsQiLRDvw1NP8kg85
X-Gm-Gg: AYBFou2DPJuerNie2+hrh9ZLmiFomvUXeqYWfcdVZ7FlkfLztFzZEgX7EAbFuJ08DBH
	JMyL4CCPfaAcbKUt1l4Yega5bWpiSrRfNgKW1KclvkSjy0CVCH38jmlwU1az0Sago70T+7a9ncz
	650jnitMBQCyx5O7c3AtZmf1LP+7RpMIvbTQfvHYbF6BgL8dK6mdkOMeCHFJBFq9rHBELlylpin
	9CUdLtGEA6EYI7hsNZv2jaaAYUKme3+dx+qsNDIWxtuxsYMBxK3MExe08rjWBChl3WtpoiieV4U
	vT2swE3R98qzlFjFVS6XijjdIli6cG2kO+4aIySP7Pbe/gvGQTP14YaAyzd0007aUfm12KeAvDQ
	pDSONXNyOEK/bKMt43/mXMU177r7hvYgcavpnSsgtwNiHZD9mN+6aVbZQmPGcC2fZYW7T/fBGL0
	p9K/C/W3dgb3+XSzFqTFQeOdMb9Mk7LurzCB8QGozYY2RFrC/cnsUKuIuPLZydBgJIjvxAUXEQW
	pus6gEsqcrfCEwdr0+jKeWPSxqhpVyF8M/FPlEtkxkJiuTQJSYwoyf4GOTVBbBZCINRLqXeThh0
	ZUSvJIu0a2z3GogK9wk3uvlXnF/WIm/Wf6GK
X-Received: by 2002:a5d:5d05:0:b0:486:e5f7:89c5 with SMTP id ffacd0b85a97d-486eb1d85b8mr14381315f8f.1.1789163897207;
        Fri, 11 Sep 2026 14:58:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm9058919f8f.23.2026.09.11.14.58.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 14:58:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] futex: Fix futex_do_wait() reference in kernel-doc
Date: Fri, 11 Sep 2026 23:56:54 +0200
Message-Id: <20260911215655.6557-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of futex_wait_requeue_pi() refers to
futex_wait_queue, which was renamed to futex_do_wait by
commit 93f1b6d79a73 ("futex: Move futex_queue() into
futex_wait_setup()"). Say futex_do_wait.

Fixes: 93f1b6d79a73 ("futex: Move futex_queue() into futex_wait_setup()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/futex/requeue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index b3f4a4bccb12635f8e621420cb22511ab2c75ad8..6979cee4b69d9ed863bb00583942138227f20720 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -768,7 +768,7 @@ int handle_early_requeue_pi_wakeup(struct futex_hash_bucket *hb,
  * without one, the pi logic would not know which task to boost/deboost, if
  * there was a need to.
  *
- * We call schedule in futex_wait_queue() when we enqueue and return there
+ * We call schedule in futex_do_wait() when we enqueue and return there
  * via the following--
  * 1) wakeup on uaddr2 after an atomic lock acquisition by futex_requeue()
  * 2) wakeup on uaddr2 after a requeue
