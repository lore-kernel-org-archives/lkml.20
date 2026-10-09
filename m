Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558843B19D8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568734; cv=none; b=pRHOczvcOL2mFHqgDxgl2lbFjlKrcEoGCfgQ8dkm+tfhaGw+rptfiQInaiJjGGY4GPn8pRSXoOxRQ8qG7cH/0LDeQ4Kajd0l8JvnBS9BsxYC2wBipUqb39nSDeYl/w2KKbjXAu9h4vxWur+DC47Qy5eVK0j7/WvFSl1bPZd45o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568734; c=relaxed/simple;
	bh=TRAbFOmIuXO7lFa2+5mHt2V6HZzH9UnQ+dCDMXHXAdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmeSANeKij5VVIPovmvazfifa//zr0PT1Lhx/XbPtLufMtrDdU7F5cImCErELoN5TL3oAqN4ZeYMe6cWWoXakU6t9y5A30QpKzbHq7FY5MCfMzBF4YjP4Oovuebdr7ks9EJXjM1eKb45nng5Bk/jdQra/W2g6uPvYspu7kuyhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akfm1XvL; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akfm1XvL"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so265337a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568733; x=1792173533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFMcmEx2+Bmb7Wycj6pYJAy5yt+ElDaMMm24XjvbUJI=;
        b=akfm1XvLyOQ4jtlxookXLAzwE/Y24FOt5MXTJ8ml42M4qBDQxAm9notKBI9bkmaPDz
         NLWqKb8hTUn+SusPb/XOviRJU4IxJB4rhKPA21ejPvi7VyFTIi1/gkOB+s2a1oYkSGjB
         7l6itukZ+uk+iWLolJm3EkKf7dUaMogBHdVvTlH/fxTY5iORSCyY6pdb0DDpcrUuX8NB
         7gkRWbfEIFZ7VCJzdmGylxs1T5O+l/fWpVKir5kU1L92ZKKrPHZ/Z2Dovqo+8KGXR5Q8
         CNPkG+ZyAljUrirFcxdnKxhqvCxiaGsVUxNUkrhy6ih9SVdmE+8pCRiZO3f1IJ4iEnTp
         Becw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568733; x=1792173533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFMcmEx2+Bmb7Wycj6pYJAy5yt+ElDaMMm24XjvbUJI=;
        b=fw7V3fJK+wbh3WASQAkdK0usU5CAQhCOtF5ubtO5m4h16MYEtpfagACXRu3rtwh4ux
         7dwr9nASSL1iptRTxSn5LJE/voXrgiJS2YWLVLRo1UiYlBbThUhDniv83HxpkP0Sc/rW
         6IIa5bKCtjgOMhqzZV4rNaoWEX91J7tzQIlirPCMWWYOzn+peOfaK4BKsh+oRkseoJEf
         AZqAfM9xAbQH+k1Vy6uAqvbSqEOSGYEfjg8YaTK5WT8lOmhoxz/aU6i95qRyPyc9TSvo
         tjVmgqz7fHlUXXWQ9VdARUhkPsPY/PZAK5KIK4vR9HulpdnXrD3rX2/EKRXaHFHGwPzd
         xbwA==
X-Forwarded-Encrypted: i=1; AKwUvBzvehu7rBdYYqCt6fGF0H5igVdy2J+cDmYgPQEVEzWOjgLSOmDifAU0LFxyDdYdQFBMZq+vzFF8XQk8+hE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt31BDQtjWyrxwDl1lrlJ+ZouU8zF4EsX96C70FCwz5MfnH3Kf
	nNvN7gRIBxK9wKUmCbKmiqr103R9SjcariOqANyTwcIhj7J7/24PBkNq
X-Gm-Gg: AYBFou08RG9FFlfTA9Zy8/6ulhiW/qpbdYuiXDfpjewwT76JW0wGjLo6jc/LUHbA2FG
	H05jGCV4h8w7iI/qNnTsP2UZfFr+p86haf1X7O8Cnd6oZATpS6jBTKsszerVsrklmb58eux9ZwD
	Dp4yY9bqVYxfCTGa6gUqqe7gc4w550Le8HgJxxHab9ZOKJiqyD0hMD3AnWcsYoEe91WiQWHvMag
	ZWtpaxcZPTWI8YF3BFzfvFOyBbuxlCL3EQanQq8FCC/sVQ9yAfhLU7KRj/mvb+7kqBAxNt2BRhL
	Bfp7nzAsBzNhG1P0rgzzSYV8dq9cQg0Dm144WHJM8QhjWue20cnNjd3nZ8MV8LVOogaDMg+fTf1
	wRwEqAcA4PnddoMLxOGPNjyQVsn5/1iT20WlaSEdpW040OWW5wo1HaTItOqfqZkS/wQjP6RSFl/
	7jIN5BduEX4pJWUeWV5PvEhQkGoiqoQXAqTy85IaQnpGYfLIP5mTDRBj27DTM8MuECmtAsWrPmX
	MfUuPMQ2An7VJ/g3IKh1Knx8InAe09I5QXgycW12Th60OPEiTXNiLzK19H5Ncpocdch52gwvlEH
	aDTcyL8T5x/O1Tq2xlY4vAde0Gnv2wKIO9kyrM/hCXMuveE3gH28GVsp1I6+oFd8fGOkyCnygG4
	G2CqWInftvpssjd7pTw==
X-Received: by 2002:a17:90b:3c8e:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ab3ae696c8mr1964314a91.51.1791568732651;
        Fri, 09 Oct 2026 10:58:52 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:d58d:323::50:f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm4415918a91.11.2026.10.09.10.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:58:52 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clang-tools: Import os for broken pipe handling
Date: Sat, 10 Oct 2026 01:58:32 +0800
Message-ID: <20261009175836.2277-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Changes in v2:
- Drop the regression test and adjust the commit message (Nathan)
- Use my full name in the Signed-off-by
- v1: https://lore.kernel.org/r/179017337986.52388.7943687183785012868@gmail.com/

Sorry for the mangled resend in the meantime; this one is sent with
git send-email.

 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index e78be82..79d58b3 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys
 

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.52.0.windows.1

