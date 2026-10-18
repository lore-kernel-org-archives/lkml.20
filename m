Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019FE3B47F5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320835; cv=none; b=BiRwR12GOL9mX2wzjLU8zIRfLVQ3tUE69Uax385rAU36GchpnK4XJtOQNMRxarXmTWGYsAIj+x75yFO88RfWqy6jB6G7XwxXVMYxthAN/uxY0rEcl8eSPVbV9OoJ8iW5cetoWYZdJlD6/nto7yG7nLzt2tPYgwcNB5Qxhd+4VYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320835; c=relaxed/simple;
	bh=ZpLl73PA8Cbd2zdEP5nrmcuiNcq+nTm02LYKg1Lw7Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h1xNUeGcHyTBL2o4oIRyAkq6cuP6AVwzBjZi1i9eSitdB49Q4NzgrOHXV52YIMAE2lySZ75L9Rk02Yf98K5lqmcCcwXfunjaBGj9jrs6wC/5hkh1iQMvccRdruC5hG+dkOtY0Eym45T7BJrP3A1Ut/E8HXESsDlNxy46SCAW4hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=bn92qSP6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="bn92qSP6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so668713a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1792320832; x=1792925632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SH5ZbML0mf3XpG6mwY1nvDJXB8WyRxliwG32GKWkl/k=;
        b=bn92qSP6+L512in8U/F3iga5HFoZbThhunhCLODC0b1nhXZoSBLTyU+Kr9zGIom3Pl
         eNfYqYT8GOq65k+9bOyFqC4iA3FGFIEoa7PlTk9Sqxa1eoJDwO69QeYCMw8O+gL4zU67
         o6slL1sbIEckYFC8fopz8HE+4JiD18k5wexOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320832; x=1792925632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SH5ZbML0mf3XpG6mwY1nvDJXB8WyRxliwG32GKWkl/k=;
        b=DQ6xX5sPyi6qI8lNX8ZR5mOfV7c4hLF/OiYRlNnhmigGqs9RMvinido/+XVbRlVZrb
         PDUVaSFi8fK+j3UP7WrD/HBVzYXIT2qLVkr0nNdWsl168hFEVYgn/iNdXEFytR4C3zRj
         4zSGTCbYs1dfAGu71QJTy0O/2AN42eweYfo3OmXev1ibOQY2zAdPs14jLdfg7x6f6iVV
         a5T2utaU5iS0ujmQ+20ho9/Y6ce6DJcd8N6GE9+Vnx3ho9SqLxnBZWUUrrys5jcmajyF
         4+v7zHILT1G+lclIaXCyw4FMm+88YTWjM+ETnpjuyZCsUUvfhSTymwZaQP4I8lscrfGs
         i8xg==
X-Gm-Message-State: AFq9FYJlUkGkknu0xfMZKma8kk/ND641MoLwVirQxAWOLJhqCrltPJT7
	eYnM9Xhfz9dR9oY29z/a73rNUgQNew7Z+nJoq2kKd/kQiEkJEyWi8aNsX3cvZFcm4Es=
X-Gm-Gg: AYBFou1TsBN1lStHfa4Sl8fZmlduPT/sCgt4/9xZhvTSrNBa6iXjH9O2wO3n7pD1gJ9
	ckcyzr6uJVcCKu0fPYB7L9Poi0golLP3+nqNCUuAdDB1Ak4oOM0VvNV4BhphHzj9dk1mKKcdz3r
	YHLCbCUMcnrq8qqbQ/Yv/VZWyYGlvgOXcnanzeHhov4uhOZJIMciC3049v4Z+2xatm1B3+5Ql5B
	LESiI6EnMYIwvPdR5qIUMIykx9mWE4d99TJVk3A05699w3xDm2755bzR0DTdduzCh+ms9fMJNOc
	8UvN/DmehNP+0IE6AmKhdqY0K0+VJOLXdlPqKYC85DiM631BCMEaEujy0CBlz7jAAS2BaDOhqRq
	GhT5zTp1zMjaNVWj76sbh+KXxAdAB6Mg3WbBUnP1ju83sJNTq5MW+b9NsmbiSFKo9Q8+vK+By1M
	dys/ZjBJOnQgjnlRdU4NiIaSzAfODE7Nr/P7v7A+a3mMSv6Xho1lAgZD3EPkzkvuhhnj0VbqsAF
	X30yLJsG9ILlJrs5ikZlH1GrAxKrIBqBfJAr3UNRgoB2mVfzTvP621kj91nKyo=
X-Received: by 2002:a17:90b:380f:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3acee97ae24mr4212947a91.4.1792320832120;
        Sun, 18 Oct 2026 03:53:52 -0700 (PDT)
Received: from kinako.work.home.arpa (p1722188-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.142.188])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm16805152a91.3.2026.10.18.03.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:53:51 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] tools/nolibc: Fix WIFSIGNALED(0)
Date: Sun, 18 Oct 2026 19:53:41 +0900
Message-ID: <20261018105341.243797-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WIFSIGNALED(0) currently returns true, so a process that exited
normally with status 0 looks like it was killed by a signal.

The macro uses a trick of checking whether status - 1 is below
0xff but is subtly broken because of using signed arithmetic.
For 0 it computes -1 < 0xff which is true.

Do what musl does: mask the status to 16 bits and use unsigned
arithmetic so 0 wraps to 0xffff and the comparison fails.
The mask also prevents bits we don't care about from sneaking in.

Fixes: 8c934d4822c7 ("tools/nolibc: add helpers for wait() signal exits")
Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---

I'm putting off sending anything else (dirfd and some other bits)
until after the merge window has finished.. but this one seems like
it should be fixed sooner.

I found this while debugging an annoying issue in my homebrew nolibc
based shell.

 tools/include/nolibc/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index 8f3cb18df7f1..d241629b9e67 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -119,7 +119,7 @@ struct timeval {
 #define WEXITSTATUS(status) (((status) & 0xff00) >> 8)
 #define WIFEXITED(status)   (((status) & 0x7f) == 0)
 #define WTERMSIG(status)    ((status) & 0x7f)
-#define WIFSIGNALED(status) ((status) - 1 < 0xff)
+#define WIFSIGNALED(status) (((status) & 0xffff) - 1U < 0xffU)
 
 /* standard exit() codes */
 #define EXIT_SUCCESS 0
-- 
2.53.0

