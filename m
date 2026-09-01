Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD08431B10B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281029; cv=none; b=VtTb6BURG1Gg9uDD2nDVKPs0AXWK2AMrM215Cg+66BfpRTP8JIwkvC2xVTyEGPssU5L6cKUKPEbXTOjuPA4qLelV+1I6OLxGW1NUPU5cEnwbhRy9Yrx+D5ffq//f56hV2ZNogfc7J7CDLdrEGgPvIE2XUgRf4ws6SmFCofCiQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281029; c=relaxed/simple;
	bh=E3HmbXbL0OGySKM+F47OxsndSAxWaWRPHLhdTm9M3h0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qE67IhfOoZ1Quepxsmq3ogkkbdW6yrrJlezfkxt7wA5GABexKT9r7JLC+PmJxchauCgl5nn0Pq1OHWfW7dXUwqqNQhvA6IqL8IKaKKGabkH2LowUK5bz4pNU+GhppObqb5Y0P02qYhs0ypuHDrVPx+HG1XNHp7bOuakzt6Gk1os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b3962f71e7so73511b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281026; x=1788885826;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oZrOCd2MQLknnqGCQBtHjj9pkhJHrGXGzdD1AypnqS0=;
        b=XypkxPxkGrh+bBYDvS+voHK1fIsAXKuWsWdFeYW+XYdmk1NcMs/Q8ohegHdhb72O/8
         ZMXUFDhO0ADE6G9ucdeCXwCajqop1eBT0ovVyhgKqACt+8tmLTrtq8YjYwHeRPS9P0rl
         VtaNh1EWtDjzgr+hay9nMAeu99f/GT+1XOWXM6mXfSz/AemTp9O6A6IB1Q2v7pSCEv/E
         dVNZUl9gveWAj7YKnZVCPc8JRrK6Fk/zdskqC+CgyftfNLCtaJ81S/p57b8MBlFFxnrq
         GETCRLVdjwO/SwrHL63ts/anA5aySu0BhltpYbjp7YRqENN6a3WJUgFnNp0CATgT51XG
         cVzg==
X-Gm-Message-State: AFuF++miDtRRKbPxZ82TdXraokT7qM+x78w8GMWgMO8Rs6kdO/k3mj6u
	UBn8LOJ84lI/SPIHrTo5PQOZ8weCXfi2/6FkZGl3WqZqCRMSFfSQtQ1YFK7UohJQVMIdz+IYdtW
	gYGsbpbs5GO3JWEfs/eORw96jcfo5V1BWU5Y3MD/EaUDuFA7f+KYI9bI+7dk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b21:b0:4b2:98a3:a567 with SMTP id
 5614622812f47-4b5b7f732dcmr9210955b6e.4.1788281026301; Tue, 01 Sep 2026
 09:43:46 -0700 (PDT)
Date: Tue, 01 Sep 2026 09:43:46 -0700
In-Reply-To: <6a6b0c8c.57649fcc.360844.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9700c2.99c12218.408a8.0008.GAE@google.com>
Subject: Forwarded: [PATCH] media: vidtv: psi: fix memory leak when a section
 exceeds the max length
From: syzbot <syzbot+597f53f8e81b2f87620c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: vidtv: psi: fix memory leak when a section exceeds the max length
Author: godanaemiru@gmail.com

#syz test
vidtv_psi_pat_program_assign(), vidtv_psi_sdt_service_assign() and
vidtv_psi_eit_event_assign() take ownership of the list they are passed
and store it in the table.

All three retry when the resulting section grows past the maximum
section length: the local pointer is set to NULL and the loop body runs
again, storing NULL in the table. The list the table was holding is
dropped without ever being freed, so every entry on it leaks. kmemleak
reports the pat_program and sdt_service entries allocated by
vidtv_channel_si_init() when this happens.

Free the list the table currently owns before overwriting the pointer.
On the first assignment the table holds no list and the destroy helpers
ignore a NULL argument, so this only has an effect on the retry
iteration and on any later re-assignment, both of which previously
leaked.

Reported-by: syzbot+597f53f8e81b2f87620c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=597f53f8e81b2f87620c
Fixes: f90cf6079bf6 ("media: vidtv: add a bridge driver")
Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 1b6225d65..0970c0cdc 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -893,6 +893,9 @@ vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
 			program = program->next;
 		}
 
+		/* The table owns the list, so free the one being replaced */
+		vidtv_psi_pat_program_destroy(pat->program);
+
 		pat->num_pat = program_count;
 		pat->program  = p;
 
@@ -1432,6 +1435,9 @@ vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
 		if (service == sdt->service)
 			return;
 
+		/* The table owns the list, so free the one being replaced */
+		vidtv_psi_sdt_service_destroy(sdt->service);
+
 		sdt->service = service;
 
 		/* recompute section length */
@@ -1781,6 +1787,9 @@ void vidtv_psi_eit_event_assign(struct vidtv_psi_table_eit *eit,
 		if (e == eit->event)
 			return;
 
+		/* The table owns the list, so free the one being replaced */
+		vidtv_psi_eit_event_destroy(eit->event);
+
 		eit->event = e;
 		vidtv_psi_eit_table_update_sec_len(eit);
 
-- 
2.53.0

