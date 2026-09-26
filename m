Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D8B2F7F04
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383956; cv=pass; b=gnjDU5uuP39wM5HTkFNg5tWEOMdGvXssl967bHg163Zv8WuZR+ARLxMaGfClvyqh+MwEEGm84DZ3Z+3P6WEpXSv1FDUF32fOT2ICdA8W1rK5aAO2pwQLlxKxy/Y0LDfkmYb3w35vkyKi7kUoWv6PtzBdkLnMsf5GIui7MhcTWr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383956; c=relaxed/simple;
	bh=cxL8RY8wdmdsnxOD6Ni6qWQL/8tWTp4bkAuJvPRW6kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hiq7L/ViP26Xt0nqfWLKuN5fUAeV5E12SvWI7Aa6itcaeZF6HcrPogcIVr14d9emGHqZdufJoFjsDnxjEH6qvaavyfjh21Qsc0wWfFHWiXMy0MUCOV31NAANwSl36zykHroBsiV4V+fmzOpqrhVB0bsHufcpvSY2SrvC4qlwMsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyHT+b62; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyHT+b62"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-533245fd18dso1104861cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790383953; cv=none;
        d=google.com; s=arc-20260327;
        b=ERvzsPNOr8phu/KnycPsibPnbAlxbaieyiBeiUkFsK4aoYUyyKMXgFsFZETaofqPR6
         +rR/BS4e4nTeunb7dxDpQy3TW4atkBOYc1XqjEsLwTpopaOX99tRhOgXQsTyweSZJIVj
         qNw/DjWHuKyFl5GBlV6z7LP8ElzUhy0A0WIQOQIloEDnSQAQfnecnXhKqL8xMVVssxwB
         a8k50UOwKEHNq3RbjiiCRLHuE+N5smH5mv3EBnTcD2BK2lTcQfGDpEjl52LuQvZQojUO
         fWDk+G2U/UT/5cOhgKQTxKt8wEPfFiuX2IiiyZlvHhtz2MXyZDi/bB3Tqq+y7itcsS2H
         vdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        fh=r2lyeKYL25LYq8sOJ70qshROGx50B2nIqyYhLID7pvY=;
        b=TOqI/bot+uoNiSVctY47x7rvpovOkc4a1yR2l8MgyzGLyB2S/yAjVj8hMFNzEjP6n9
         ro054yA8/qrzzT7WFeQ5kg5CpcjiZ2K8tsOdtfwSfDqZEkYbWqdecPtLthoDriHvxpAh
         zBmOfkWBFgZ6ox3pDRp4RQuEK/DXLinjCQbMFyjgo8zcxrFGInQ26P+lQzDGGMwRVxIc
         H/N8Ge9vFKVp8F+ikVAmtomAZZFWCkF+Wz2ZvWTkmtA1gfMUIKtH2zygEtZ2nQuExvSB
         3Zfg5D7QmDptIIB6lp1JojbkuJ9kab3fjF9qrrUmA+KkFwkXdN2+TEfpfd0IWMZiytuk
         WaLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790383953; x=1790988753; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        b=SyHT+b62yEl5GBC7zQ8CeA3RKlLUvz6rNoSx0R5fXC0fi+KQgVpgqmZCHXQfNpprIU
         LAn8zFD76t71h4G9vu6BiFr5uq/8y5SJ9SVrQOi+6XRf9eKJ3KFg/c7E6jPrK/sULkgf
         IoEZav2HnGXatHzyXEmDD8VHnukJsXRoh24GwyzPhaW3JWXGwlBJ2ktOK5UsBmTaZehe
         tWuSW82rFpKamQsUIh7VNlB+aqXJ0ecnayEMxhNiRxsOkSrEwkTbDFBpJFwYcwbc9kBl
         UH2WWoaf3nA+GdBQeYRsoCROI5S66E8b03Ymi1Xxh5Z6bWneN77562MfluCAh4zIpJ0D
         /aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790383953; x=1790988753;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        b=zHU/rOds6a3ElzPyWLQwB9Q/CawY4vL3pprzGfZ2HvKMb0+ttkGUFxgtVPoUWoGscs
         QyBwCeRtExkdMbntz5J/YgF8nvMFKgZKenY9yvD7sD70ZsiNL2T1rh1r/gcsHA0Sc/dY
         GwoYV6Xso36a1dqoRPMaCxg0Eu8z6yQnGwnKhEDp/DHNb5ACp7IRzpvo4nth/6QOu/59
         84+YwelIaHaAk0niy8mcooQj1J7EHdDXAZqbR6ccW/5Bmji06BuwjeUgU73m3f26EJjP
         lxRdWjccPw3f3T2ISMhBVh2UmwPBbmksXs/R0THSZytAY4WFLEZJrscdTHcBoL5kfdg4
         AGtg==
X-Forwarded-Encrypted: i=1; AKwUvBxciwUncW3Z8mYEcJ3FNfIql+0ZeoTJxjLCG7dEX1nLYBhZEpBRu4lytWLq27+0ZEfLUOHPX7xIvocA1Lg=@vger.kernel.org
X-Gm-Message-State: AFuF++nA/qrlXUXxxS1Kz71Kg/xE5LPCVATGdcqyc59t7U9TqZwoEVxh
	9zjRtm6eAM1FRcGE7pCyjhvwIK3/kMbIfW/6YnRZSDHXE13CGPgY2ZxnLfUi3xkF88q24yPQBPm
	nD/zkne1kmuVhj/X0192eyvPEX2EL2V4=
X-Gm-Gg: AYBFou0E7GOnSEOK2a3yM35YAF3id3aPWbbH4wA6Hg0cGq39Bwhl+QSe2iUtvIzklbM
	B8vvyzqYuLulmR0uPhzFGlFrJcyB1MipG73if2H7yNcOgyssQB+I6QiRxXuo+IVWzX51fqQECEC
	vD/uzSV/ZUbMVloTUvD/ACWhMiQqQst78zd3+9QgN2NrB29yyZvGAmIQ8iFRjmmNZK0dzhAL9dD
	JvIypimCLKp/JCZItwmVo+pg75LIF1T8+kCt1MVRiQcr4j02jyZ7I8y2NmLtHhobwBxYpdGGROV
	JiTRQ7vwZCFHlPAT3Fzdazqve+g3ulVWuewfJaBvtTW3US2a3nrWrA4p6aAR2vBw2VTKSOsZ6O5
	uRTaW5xtTXcKLvjfxZiNGprsAfuLzToUsnuD0K52YJLc+CYaKRgr07RI89THjX3jpVS+6ArbmpF
	g/BIbcqtByiNl+BFKxXlleD18LmDaFFrhYS5l4XITULlVzxcd0xnHpF2c7YEDa1SXcO/n6cs+xK
	L7annPqY3m0sgMxUpYfU8Y=
X-Received: by 2002:a05:622a:1818:b0:533:a4a:8826 with SMTP id
 d75a77b69052e-5330b5eed0emr80806541cf.19.1790383953335; Fri, 25 Sep 2026
 17:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179017337986.52388.7943687183785012868@gmail.com> <179037565553.3985470.12035061965740287126.b4-reply@b4>
In-Reply-To: <179037565553.3985470.12035061965740287126.b4-reply@b4>
From: =?UTF-8?B?MTTkvq/lu7fnv7A=?= <ue081723@gmail.com>
Date: Sat, 26 Sep 2026 08:52:24 +0800
X-Gm-Features: AclHuK9Ua7kqnIr5kUYr-Cnfwv_MkcNfJmZDDmk3ND4mcEnL1T_GfZSWuwa6lP0
Message-ID: <CA+NtrhRdnuZOOFpBXvnfOXFs-HA8q+2sLvR0BxH=BjzVAEZBzw@mail.gmail.com>
Subject: [PATCH] clang-tools: Import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ting-Han Hou <ue081723@gmail.com>

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py
b/scripts/clang-tools/run-clang-tools.py
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
