Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BDA29BD91
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914134; cv=none; b=TYxhtl69sMty/6AkehlKfCW3EDhhoPzvxkgav46F2r9P9FZ3V5cwqIdEvvKBKbb8/xWAx5n2D9UXN6dBmNRobqLQTNzM8s+L/BWKjKq2Bbe4z0efBAN//5hnTTxZP3mtGkIx1KBAftxu9X+4kqwLEGFOJMz0pFbdaMRTxP7Or10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914134; c=relaxed/simple;
	bh=qgQ8o9DjvH6ieIOzSmEYyyIFGQLoskqnrUq7Jp/a0BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNne0149f9DVnhb04zgT8brkxFK81WEDmojxOEOneS2BB+uWpriENLcIht/6NC61M8c6C7EoPISLN2oFtpVF6WBjV2I9mfR5Btsw5NIwu53W4TSi4FjGQz8ul65sPOukZvmuQZoQ7RRjRjo3yRfGfWFZvbhGAb36CJFCuxL7iYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8vO6E8s; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8vO6E8s"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2db9f927cso17151965ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914132; x=1791518932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr3tkUjUJP2wlDJBZdeQAQPJN9CHKV3kl5+7OASdaKM=;
        b=E8vO6E8s4e11RUmevWzNzQAqSGa3esTOD8Ial//gutNvxx8anAsBEpv82VPLNe/pXk
         Zxa4BsRW8Dl0zQ4DRKNyZLXtfFm3Ytqxw/egsawl4fzcE1MBoVnY2cpclcNWYXmEewff
         s0Vd72nc34H0ZSl7KUmpWuHbLcPkzUD9WCqOcEvqujQFgdX4ZIXXFqRdlk+pCISW7D+j
         2VixliFsTFXBfVSiqUzkGBPrLFWbfWHMICcA+wQT0sZVLj8c4nbMIz/ToFd9G3m04mWC
         oYFJhp2Dg2J3XVeYClFuBOKtqpSqffq4oeYSDFIEmkel9SIqh97mg8gu3RFEDCMauXjy
         YJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914132; x=1791518932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wr3tkUjUJP2wlDJBZdeQAQPJN9CHKV3kl5+7OASdaKM=;
        b=yepFVP193jr7q+F7Nr/xI34zOpU85W2L5a3vcQ+tjhHhpWsd2MTrVN9IWHOLNt5eqR
         jJJv76Vs11zq+h/mwTj+vM9QPpZPbblX2wJa8gCM/hhxBQ0j/1OyEoHhBG6pDd/wK1A3
         KogUh80CLMLA3RTU1m5IK72/sGzye5N+4InojMeM6u4Z5MMiva3Vx/xTkpGzj6oI4XEe
         1WvWtZZPL1VMWIjtWlHqQzUTThVbb+r3FFeyVjLiaa/MTBUsbI8BRgw06dnQrKV8ojC1
         QsFUpRbRZZt8++E8BqLSMlb9UhngHUYOTk3/vObxd5C2QkW/y4f4HfFH7w0tJGO8Nod+
         l6EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWIqaAa8/rvlj65GJQR3jNfETJPY91xdq4Z9AwT/YNSwrFn/eaXiQucBrgEVipbkg+cS6VlS4m9gp9zNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaWMcUA5CA7VvPTyPhS8hn8pYqOY3DFoloVmp7hmvs8bHObsl3
	MSuN60pyBMONKv/Vrc+w9wDKn9Po6kzFMAqZL1MMVVkLO1i5QvHzDPhb
X-Gm-Gg: AYBFou39h9GLWL0huCjIdUEw8KIc2ZXgcH17kyDig6j/0MN4L1nk1KQ+cQN76P4/fD5
	5HZrqiDuG9EY6rjC6m/q01/APZRPhAwXTQpzQmXYeAOeQtoAFOAij8asfTVjUXbaBTdcLb5Qc38
	92vJzjggu4Wt0hwuDYg9ETcXHZCMZ1pyjLPUhD7U/xKdBhecYviT2969RtN5TowRq17k7MB9dZg
	9wfd57CtgjHv7HVsEF+pwQS0hxJ1sOKocbCRbyoDfJnaHwcoaXuN4dykegrlw9BYA4g+qRUybVc
	q4lJt9T9JCXX1A+bPlOZCjZIG6lnGzKO31fTuqHjbHJ8Kr6wguF8A8CL99RW48uHS5TwoAaz1ud
	nJzTr+23AXIKD7Yhx/b/gT7QYlpkbulLqT4WfYqXZYVTMVAnezqueyerLWKDHAl9LWQkBPtg82g
	VOvop+FfAwiU910nM9Tqzgs68A7a10Tjxz9zb0+xRFM6SlxpwuzBM9giwsd3d2P26a/6xGP9shr
	4F5CqTT84GntYT9ZFaokIYj4wfW2uASOx8OrRuP5BWKU5lhD5lwNqKRdDk=
X-Received: by 2002:a17:90b:3cc3:b0:3a4:c673:7636 with SMTP id 98e67ed59e1d1-3a6ce77cc67mr1445077a91.26.1790914131522;
        Thu, 01 Oct 2026 21:08:51 -0700 (PDT)
Received: from localhost.localdomain (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ccc92646sm2119079a91.1.2026.10.01.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:50 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cacioandpepe <artem122novak@gmail.com>
Subject: [PATCH RESEND 1/2] sh: guard SH4 no-FPU compiler fallback
Date: Thu,  1 Oct 2026 22:07:59 -0600
Message-ID: <20261002040800.131862-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002040800.131862-1-artem122novak@gmail.com>
References: <20261002040800.131862-1-artem122novak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: cacioandpepe <artem122novak@gmail.com>

The SH4 compiler flag selection falls back to -m4-nofpu when
-mno-implicit-fp is unavailable without checking whether the compiler
supports -m4-nofpu itself.

This breaks SH4A-only toolchains which support -m4a and -m4a-nofpu
but do not provide the plain SH4 -m4-nofpu option.

Use a nested cc-option so the fallback is emitted only when supported.

Signed-off-by: cacioandpepe <artem122novak@gmail.com>
---
 arch/sh/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 7b420424b6d7..238c701ab14b 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -36,7 +36,7 @@ cflags-$(CONFIG_CPU_SH2A)		+= $(call cc-option,-m2a,) \
 					   $(call cc-option,-m4-nofpu,)
 cflags-$(CONFIG_CPU_SH3)		:= $(call cc-option,-m3,)
 cflags-$(CONFIG_CPU_SH4)		:= $(call cc-option,-m4,) \
-	$(call cc-option,-mno-implicit-fp,-m4-nofpu)
+	$(call cc-option,-mno-implicit-fp,$(call cc-option,-m4-nofpu,))
 cflags-$(CONFIG_CPU_SH4A)		+= $(call cc-option,-m4a,) \
 					   $(call cc-option,-m4a-nofpu,)
 cflags-$(CONFIG_CPU_SH4AL_DSP)		+= $(call cc-option,-m4al,)
-- 
2.55.0

