Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89836F434
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521128; cv=none; b=E1bcWUOCnHPTLEY8NgqPQQE9MI2IfD8U9uFcw3IbBxsymVimlXwIb7K75x02dw1g02alddUppAcDTVonWLaj2NE/10qQKXiTcTUlgUB2fFrPngAhqE/+B4nwTlNt9G91DtI2mqbctcTysCCmYQTMRZNGll8DNh2A71JSOEgiO2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521128; c=relaxed/simple;
	bh=UQOkKbJM9JUTtC35Dr2+z+1Yis2OZFg2cwvlP91yyAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kiMdiRUBeYwegbKBcefB6vh7yvCR4Vv3oVylLZ+BSeyTjWjH17Dye70WskeysTodLcTENrmX3R9pr/ZRGQvhl1oM0J9snEQDqYO7KUTF/11QbSfG9/7dIKoEY/Nxa/QANjsVoRofVW/9JSfroAxgXBqexkSuBmJ6MvPPq08fiKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPuXmmxY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPuXmmxY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38511175ad3so750880a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521126; x=1789125926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FHA7XgAegSQgPQA7w25EfA+LwW53PHzWtMqnEhIYDw=;
        b=jPuXmmxYi5V37gL/TE8BDcZ6ZUYPtOXO9wg4LxlO5uQX+1+GK91VsMoRr37s8REvL+
         tjwtRifHejvGaAHjGftlEKmdAsdWn4QBxZhguXsQLtfqr/Un7tZK1cz6QV0Nb9jTeXdJ
         nCiTnVM/Tt8VBHZmYEx8hfH/Uc3UExBSAYgJXzEKXrd3GobaIvf/pt82owAi7l12iNpM
         xh2j0KdW41185sknxTA8fwjjQIjx9Zi8EiNG3q9BIuH5x82Iv+SQMmzGib6JBzzt/ztk
         2mtIsC0NZdSzc0l2VF83NzLAvQ4Nrv5eZEuLkhD95oGKBq83uDOqbI87DGfxA6r2pTfN
         8MHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521126; x=1789125926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FHA7XgAegSQgPQA7w25EfA+LwW53PHzWtMqnEhIYDw=;
        b=HuuBrwdIPqNoAWItcBhUiIPtyT13IzeJTJ8OkY6AEy1USZAm/UVAuWIxHzO4FfzAvW
         zu9G3I44lHd6ZaiY+rrJI8UfzBhKOtE1yhF5dTInhCMFfju3Jozxm6TmNwfybJUmqPCV
         vBpIhzg+yBOS76AVbZ0dV292k0OuozDrUBJZBbo2kmtZ1JPoRSL5f2Se92zjhGK7Cckn
         F7B7ZhYl4dZlsnEyaQ2ENi/UkUNYjCcIhE0nU5oFlP9za0fXP0lKThTCdFH11/63Xbbh
         k70abiWAvGfV78xrKpihQcB3OkZYWrxDRUcizzlaNmGb3DR2WGZbpxqteMMeKBz154LH
         XjmA==
X-Gm-Message-State: AFuF++mq/QpokGcpcGt9e8RI/+ZYWlZzbrxlKB1B7kcKTEmUl7o0oOB/
	Qx3Pj2qJ3LGzTQGiTDC82IDTf6RlrX2BMIIyATKylLPU8OMZyOqdOsfyaC0r8/MUQds=
X-Gm-Gg: AYBFou1jjGp82JU68kZihAA5SZTNxkw287P2KweI83X90tN+jrTF56HjjQJji4w6nUn
	WmIJHINPqW80F2+w7bzKS+79vnA04IzwWdnSZaHkf0sCZ12MECpGscKSLWFrD45S8WBTZap07pu
	HRxSTR0VIU69KUNY8/vw9zHzZH/PDOPYUAeR4t4hkOVa7/20W0VrIxpyAHzC7Jr6GBZOm6OwkuR
	iaqjAX1gfdKomtU1PtOPTvHfVaqJGYyq1tnJFI41k0qDIKaO0N0UTxUe6WBaG+pyF3wrg6gA/dZ
	Co8vAc36Fb/nXOVwedbILjdS6bMZkovncDzuQLUqvW1zdvQ0bFc99Xt/M3l3DsBrpnNvVAuDYNF
	iaGFJzjBqYjy1PfFqHkOwfmEXrXdPNvsN8jJYw95CqChNBZAPzM0NNScIqnr0h3qZG1Zi8wLMh3
	HagexY/Cakq13NOi7Fj6AyPVUTBNF1v78eYK50Fui+KmqG+xX4IMz8y09zEZmVy+GtKKltSlcBm
	e69P4PkJSETXgg0t9RxjtjW4Q==
X-Received: by 2002:a17:90a:e7cb:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39b2624a3famr7110125a91.17.1788521125905;
        Fri, 04 Sep 2026 04:25:25 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm8970969eec.15.2026.09.04.04.25.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:25:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:55:16 +0530
Message-ID: <20260904112522.1426-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  ARM: fix typos in comments
  ARM: fix repeated word 'there' in comment

 arch/arm/boot/compressed/head.S     | 2 +-
 arch/arm/include/asm/uaccess.h      | 2 +-
 arch/arm/kernel/cpuidle.c           | 2 +-
 arch/arm/mm/cache-l2x0.c            | 2 +-
 arch/arm/mm/context.c               | 4 ++--
 arch/arm/mm/mmu.c                   | 2 +-
 arch/arm/probes/decode.h            | 2 +-
 arch/arm/probes/kprobes/opt-arm.c   | 4 ++--
 arch/arm/probes/kprobes/test-core.c | 2 +-
 arch/arm/xen/hypercall.S            | 4 ++--
 10 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.48.1

