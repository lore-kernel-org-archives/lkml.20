Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4D938B7B0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524248; cv=none; b=JwdTTHSkU48TKP4T706tnDrnpAEVEZJXUwWUoX8n9Yttw4uM75zEK3nnghNJbbPIdGrMAVxq4nmSCuoG/3t2XyeYSMirqVBlQR9PUrStwF+pVCxlk4JNt33k7NMVFng0zyPbdqrHDn9Zj1PEgcvCFf3M0cs4kbOVU71xfTlYATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524248; c=relaxed/simple;
	bh=TecfBGAvKHdDFhumf+AYPFs3AHxxmquB2jC+WMzYir4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gl1H9wx61+PG5qtN3JagfMNWdx6vQ61oMX9Niw9zPCf9QHJB//pvOLXvrJbR6mKg1NGJi8wZnqM1VjCYgJdqLk1XpqHCkXB+xt9vHQ8QovFRb1sxey0ZlaDrhrXo+zFaJQb8BUwtvy6WIQs4RvxW272W+NmgpugldKAFt1lxSC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRYAlHP1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRYAlHP1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d72ae08fa1so8466585ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524246; x=1789129046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/vMjatRG+Xa1KbAjG9cSshrhcYtsz05PGoniHIQT7U=;
        b=WRYAlHP1lpF0IWr/DPjJhNnWrUI//+GgvC3TVV+5XSNWw4Wx52Ad7YDemxCrTa4EKd
         rlo1kGTIlCHU06gJa/4OgCw6cPbibg1MyTAU0r2ul+6rmXo2iMLbqW2opuSyXF/UR6qP
         NoluqikwHI7mdkjvBz0Dq+QI61shVXTJCdXegW6kAbzuqZX5imZWQdfqmI0l13CVs9sG
         clCn3ZkUmhXPgAz/FZL/zzv1Scl45vJ69CykyBP7tiRNzihUBq17Xx4xwmPw2nHKZJEc
         X1ghX84G9hUfrCLWA8sXhlgahNV7WPT1iCmLjfEW83AnBT3psPCNkC7s0SVVn29bjNJa
         zVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524246; x=1789129046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/vMjatRG+Xa1KbAjG9cSshrhcYtsz05PGoniHIQT7U=;
        b=OBkSqI3TUO08YOrtDJWOo9h/Tq2T/esc2VFhlVH/Hh36WjyOzaFSnz2XIxEOFb79u9
         u/OALDflqL9BtuE3eX07HbI9zrMpA8/vUEpYDIzUl4MwLNAJlMJRyJjrNfqtmSoVODT+
         LFtWhXjjsXWmCOXm6sIwCAZ5l+8CepsHG1gl1N5tJlMP3/OZ5tcIjs19ntuD8aKeK/rn
         5Lm/EngJoIxUpi2iXHnMF7x2IcL/IJgr36f/UepMdtge4Qpaz98hrlEGaMBkszg30l+s
         8EqfS2nFMtzoRstfqt+tXpk7XpXopCOpj//p2JvNjUMbG2AknPfRhsCMvFFc/mKySEV8
         BLdA==
X-Gm-Message-State: AFuF++kdPaTTE7o+lGF8fHCZKOT0swQAi/Z6ulj6qDizGDMcFJ01PTGm
	TKmZYm4NcNrYk1YFH6qPQ32xUNQeA7hrYbmzJnIPYspiau2StnbAay+a
X-Gm-Gg: AYBFou19qt6AoqIFaGiEgURJbv8BfwSkIiq0k87AdVht/Ok1lfnUV2UcoQZiwJURBo2
	bAzfhp/b4ByZoB7Eu9ULIZ6pisIykWJ+mKCbEYRUdMxhuAQEuf5tQ53MCZ8Zx+oE0yRETBWLEXm
	U9l3Sxd82dwzLmaAyQyO7DUghD5vUMPyNcK2k5eTBWR8AI7yEAADshxguZAx2SSI0G4cHnENpqh
	5sGYZydWMk/MIKeojol+HILUO/YpPv2QC45jv0WLE+xIm6/nMVvqWtrT5QrhdMDAKKqkm5YMaJH
	2jqKcpsfKSNF/3CnYHI8uMMSQDEWWF2SzkQwKfoyG2fSpC0cogTkJoB8Mfw53Y9acC9vwsaq57A
	CsVOmVl11IB8YteZWZ3SqNYPx/Qsm2wfNUeNq6BTK+lnByEfjglYoWqXjZjU5wV9wm14mITPFMP
	nrtXO+N8Ed+qPhEl3IS+TmhDKhTjuG1Domxn2ktMJNmz9hG+oPBDeGFcmDpNl0h+Ek1iz/w3zvM
	iv8QjBi5DjeOx4=
X-Received: by 2002:a17:90b:2b8c:b0:398:9be6:f995 with SMTP id 98e67ed59e1d1-39b262aaf48mr9514623a91.20.1788524245830;
        Fri, 04 Sep 2026 05:17:25 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf44ffsm5882212eec.28.2026.09.04.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:17:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] char: fix typo "threds" in comment
Date: Fri,  4 Sep 2026 17:47:20 +0530
Message-ID: <20260904121721.26144-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "threds" to "threads", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/char/apm-emulation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/apm-emulation.c b/drivers/char/apm-emulation.c
index 389874f44967..c1c8905965e9 100644
--- a/drivers/char/apm-emulation.c
+++ b/drivers/char/apm-emulation.c
@@ -78,7 +78,7 @@ struct apm_queue {
  *	5: APM_IOC_SUSPEND ioctl returns
  *
  *	6: the notifier invoked from the core PM code timed out waiting
- *	   for all relevant threds to enter ACKED state and puts those
+ *	   for all relevant threads to enter ACKED state and puts those
  *	   that haven't into ACKTO
  *	7: those threads issue APM_IOC_SUSPEND ioctl too late,
  *	   get an error
-- 
2.48.1

