Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05A14734C6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521024; cv=none; b=P6xaIVI1BFOE8Eb5e9YUJAPpENIVnhaPLpdx5BxvurVKk5q/w1OsdcRoV2yLfcid4cW5lUS3h1nbJQSHAXN5FnR3Y7E/LLb2fUhrz4lNoTCY36D5P6tVEB8tg4sq14m8HdttoUeJXQwzPmZDsMGUIiDSHUc1XWbRX4DdGlsq6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521024; c=relaxed/simple;
	bh=StVBaecbw/qexkMHKMpQQDVlI7NiRrCveI6gIEwSx8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7GPsUxGAovqsjzo2/qeJUbvCXON0I5A8JuEmPaL8BW+Xm3dlWd3TcQxFoN2b+bRwPwu+7pDD0srbM3zvBZlOaUjZtctoEfCzhuAfrMroulIlRfrAziRAo3PSfiNOAOZj2nBCnpJ/x94JwnE5mn3FStysgr72J0W0diym4GQ2WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+CCiBAT; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+CCiBAT"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-46add2afca9so518574fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521022; x=1789125822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsCUz8jN6OIGBgaXNx4RZxVRR29356V3qQ7t6ouu5Tw=;
        b=f+CCiBATNjjJ2baJzsF/VwpNf4kWZBNs2kJW/dpEspPbAJG7a4lRyMGsjBNf8g+b0D
         kUgbytDzb7DY98nxeKZAtBcBwq4dnc8sETaU5WxBOo0jlwz44CA8yfe6kGcmnN2jLZuz
         VSI+azkTobznyquRCMyKUYDNw0yGrTleuELnAXZAKnldON5Btf4rOL3a5ojpyNHn9BpB
         7wTkr0Qx/eIoUgHr1a1Bb0KdSIR3YNAS8+gyMA9xgA38uYX6mn9PslXxJARLxU3BdTeF
         luEmb3Xvh47fArjka05kfJ9OciNJnJ58xcksb+bZU6pf/su2mdGtZ7J/ESZ/Jtn4ASKH
         LRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521022; x=1789125822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsCUz8jN6OIGBgaXNx4RZxVRR29356V3qQ7t6ouu5Tw=;
        b=TcG37SYeCzR2XPk50dnnWKq4bMTREPVFq+SwErGFCIzorv2EgkzouO2QWOMJSwkAz8
         xnVXDiKY1d8xBPbjpKAFlyHiO5WNkWmtVA7RM1PwTVzCTS7PlX06g5CUIBc2GEEULJ0I
         nWkAxL7F0iZQ0JkVXuDxrNvlg47IRu+IByG8EXK5/CYqLX7G+S9e445T4pZQomdRc1g2
         Rx7LYNRGwnB+++d3EhJ4HzafQzNrBr8r7bXW3FbalOc1QtvDqkmNUmnv/PwOaRvL2ooX
         huEZmduvlqntEdITgtLuvvmwxNCBMThF3eZiDKO9wAz6CJX37gJFAvY8xJqdabkcZ9Do
         GaqA==
X-Gm-Message-State: AFuF++nXcJ+c2IYSz2MGbfrTLQNt3McGaWYZd8PkrlQjE4IJUwT6mDgC
	Gaslr+pYVZSloYujuzzhXnRbZMxfhor6fk/dBcNtSXpX0n3YWMBrKjYo
X-Gm-Gg: AYBFou3Uv1Sa6tBEr80kSNekh5E3ZxRV/wf44tIRjiR5U+AwhqR/ExEJiaX0rHjFihY
	0YBjfDFyDk5cEkmXknjMpOim0NVMLiMrFVjeBt3zVTCoo2fRzNa3GAfFuxPqDdvJeOhW6m8toQh
	FhEatz2A9+mqOkHfKRBwBFmamJpiMWuyneD2SmEzvC0qt3sVwX0gvuPoaWYo/QxZp7Lk9ojA8HY
	+xkn42TqwIvnVFSY3ExxIYVcuRlfQJTAdNt7ijNvPQNfl2zJnPVHMj29VNMj7yV/fjBK6jBI9jt
	dLL3b/awZY9wt27Kx4o/uFXqGFwaYjqR7WNXXTfDg0QbJhp6sK8lRFoKb5OnzWbg80q7WEaFOWx
	Yx3TN4XlRm+MupeMOyWJOfiXfdc1FbLoftW50k29AnS8olzRtbk60aB3hs8lzPVPNCjmjXkcVVC
	dUKclsq1gz0Hy9wpHvgL+N9lpLErnBH6EeyhHeYZl0cMmqQW/JxnT+bd5kC8zsmO/x9iXBL8Ami
	SAw6aH1NY55Uj4=
X-Received: by 2002:a05:6820:60e:b0:6b6:2de0:8616 with SMTP id 006d021491bc7-6b6fbcd0a77mr3870489eaf.20.1788521021600;
        Fri, 04 Sep 2026 04:23:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5457281eec.6.2026.09.04.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:23:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH] m68k: coldfire: fix typo "reseting" in comment
Date: Fri,  4 Sep 2026 16:53:35 +0530
Message-ID: <20260904112336.38497-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "reseting" to "resetting", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/m68k/coldfire/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/reset.c b/arch/m68k/coldfire/reset.c
index 6e5f8ab39f32..9507d7810d98 100644
--- a/arch/m68k/coldfire/reset.c
+++ b/arch/m68k/coldfire/reset.c
@@ -16,7 +16,7 @@
 #include <asm/mcfsim.h>
 
 /*
- *	There are 2 common methods amongst the ColdFure parts for reseting
+ *	There are 2 common methods amongst the ColdFure parts for resetting
  *	the CPU. But there are couple of exceptions, the 5272 and the 547x
  *	have something completely special to them, and we let their specific
  *	subarch code handle them.
-- 
2.48.1

