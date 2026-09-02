Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5BA3EC69C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382920; cv=none; b=cDclztjYtO2Z+vJSnTNVeB8fL2kt/GTEfq3QB5rPD5kSvPczdXy/R21FpgmzNk4xrGME40oFIWMevC5KBVhqoUd/FbNFtTFexvE4Es1ahRULeTOJFll09BAihyc7qW56hfbpZ4lLhlF3yuUctLtN8W4b0Mpa7uq02v2yexuiIh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382920; c=relaxed/simple;
	bh=gq4kjcf/C/dd4dpRmzn9Mq+VpkBb4cxOn+4FIo7f0E8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YCg1qzBtZF56ejVADZqbNY+hlB+16cG/TU3FeMSaVlmHYS6zfQF6nn6wuoukM3WK7DdArY0xZehzfBHBUxFS16LQT/P5QBwhLqQbVYtoqri+t7DANyrRWC4oaFMddWEwb1nkuk1Fo6xPz06Y458VWqmXgZw2OsmdNfHb36T2DHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9Uyu8Uh; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9Uyu8Uh"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1827738a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788382916; x=1788987716; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8LP+AgpfQU95pkQ4A0U0JkV/VZeB+yKww2C95uXxms=;
        b=D9Uyu8Uhw1X7aBf7NQVRkSHZ1umibqMZCzcIKQJI3sWB5wgYuyC2L9SMcbI6FwhCAb
         HDLrK4vWG6xq6+2qiRg6UjQtwo+M7/7+CT3kNqwo1YCIH2v+RjBG148V7qUaVzqe8m9J
         eHr9qhut/Kndx3L0Rs8iIRSrv5rXBx9r84lA0Uammu7FVflSYDDkq8Te+CVWKLYrXhKE
         Bq2jQa+Ngh8Gqf0DFCXQqp7hoNRA+CzjQIiBc3OjG5yOp3FIkeHPXsOwJKHz2+W1OXNN
         sKQr5ptbRz8gKT+Ih1Y0kkyGu+w4C7qPGvHltXx25Myyk9xTOBjVyX0GZBgzG29JA5nL
         wkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382916; x=1788987716;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8LP+AgpfQU95pkQ4A0U0JkV/VZeB+yKww2C95uXxms=;
        b=gbXKX28BOarQL8Vj0X/hyN1LRKPq/QLD79b+lm23NmsZaPPbsRS9Uxz10crzsHgkH1
         y2CNcwdMFTAnfZqEQzj1ox8tZrfAIfMtYMxvEH46pbVdBADItyY/+BLBmnFoc4c3vPrV
         0ZiA+9VThua9l2u2zQPPoyx8unezZZsoELtIGkf+/zX6KijFfY7g1gXqqHcRdWT1jJgt
         fGgUxJWVtq+dLr7j3CbCMCmbpqOi4Vi2KBkfuNT1oP+Tusvs/2GnMFNhi17b+SLgQBzA
         +VZ08Jo3NJwq+1Sdhkow3wVm2qyF67P1pcGQtPWOcQTirbdmGlBcR2iQfaFNJ46H2BRj
         7FXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQKgvJp04uHt+ar1db9SZhEUU+1ZlGR84xPsl4PU8rYPcdEgxE7QrRwaMq807sMvYuzGx3jylZUlnP334=@vger.kernel.org
X-Gm-Message-State: AFuF++mYzdmiK7JwCX1S+dXCD92FDpIE2A9fdlzSDLhYW1WvS993a6mP
	x/apPBVLUA/zM11wbYADrtASHzAOFRKH/36p14n6bce6UOI+5T4H/y7l1ybrTLZsrZTTkaMUd9R
	f3JQLUj6GP5R9Vln7lfduVQ7etisBsA==
X-Received: from dlg33.prod.google.com ([2002:a05:7022:7a1:b0:13b:8289:9a55])
 (user=ndesaulniers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a8e:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39aedf73060mr10160241a91.8.1788382916176;
 Wed, 02 Sep 2026 14:01:56 -0700 (PDT)
Date: Wed, 02 Sep 2026 14:01:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMCOmGoC/x3MTQ5AMBBA4avIrDWposRVRKTawfhtWkQi7q6x/
 BbvPeDREXqoogccXuRp3wKSOAI9qm1ARiYYBBeSl0IyPaKe/aH03C7LtbZ7N5lztSzjMk8xMYW SBkJtHfZ0/+e6ed8PJSl6GmkAAAA=
X-Change-Id: 20260826-checkstack_llvm_objdump-40653e1d7a6d
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=O0COsmvrvggwIeEq7bAuRbULbXScoJmbNMYaRi6RFIw=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788382914; l=1872;
 i=ndesaulniers@google.com; s=20260611; h=from:subject:message-id;
 bh=gq4kjcf/C/dd4dpRmzn9Mq+VpkBb4cxOn+4FIo7f0E8=; b=EJh/KS2VLyFue0lj8LwiVxwj/XEC0g8ttHV+j4VKiPE2AWW1oeq3VQ3mETSpw0OAgRgjfZHZs
 jZp5vWI0QPzAa+MnNVYC8CPcWGQbP5tiyluG2VQF1RdSy9sN8O1JfTc
X-Mailer: b4 0.14.3
Message-ID: <20260902-checkstack_llvm_objdump-v1-1-edb4eca5f163@google.com>
Subject: [PATCH] scripts/checkstack.pl: support llvm-objdump disassembly for x86
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

When running `make LLVM=1 checkstack`, OBJDUMP is set to llvm-objdump.
llvm-objdump outputs disassembly with instruction size suffixes (such as
subq/addq/subl/addl), tabs/whitespace differences, spaces after commas,
and trailing comments (e.g. `# imm = 0x...`).

Because scripts/checkstack.pl used rigid regular expressions specifically
tuned to GNU objdump format (e.g. requiring exactly four spaces, no
suffix, and no space after comma), checkstack.pl failed to match any
stack adjustment instructions and yielded no output when using
llvm-objdump on x86.

Update the regular expressions for x86 to match optional suffixes,
variable whitespace, and trailing comments.

Assisted-by: LLM Gemini
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/checkstack.pl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 14ce31f732ee..f8011e789a9b 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -66,8 +66,10 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
 		#c0105234:       81 ec ac 05 00 00       sub    $0x5ac,%esp
 		# or
 		#    2f60:    48 81 ec e8 05 00 00       sub    $0x5e8,%rsp
-		$re = qr/^.*[as][du][db]    \$(0x$x{1,8}),\%(e|r)sp$/o;
-		$dre = qr/^.*[as][du][db]    (%.*),\%(e|r)sp$/o;
+		# or
+		#       0: 48 81 ec e8 05 00 00          subq   $0x5e8, %rsp
+		$re = qr/^.*[as][du][db][ql]?\s+\$(0x$x{1,8}),\s*\%(e|r)sp/o;
+		$dre = qr/^.*[as][du][db][ql]?\s+(%.*),\s*\%(e|r)sp/o;
 	} elsif ($arch eq 'm68k') {
 		#    2b6c:       4e56 fb70       linkw %fp,#-1168
 		#  1df770:       defc ffe4       addaw #-28,%sp

---
base-commit: 502d45774af09f1c681c754c4b7cdfb5d7f72fd9
change-id: 20260826-checkstack_llvm_objdump-40653e1d7a6d

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

