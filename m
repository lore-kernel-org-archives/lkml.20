Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DB947D450
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499044; cv=none; b=FXAMl1umXmHPGgqdRPz6O141Tr0GhGbErK9risc805Dyr1W0uwudZeuxB7DfypsCBTm6l+DxVIqWyzdO/9jClreAwiDXAgKwoixx6OkF1kouGrOuojpUceWhntOwcv1oP+E0uEJNRP/YAoKWwYU2NuqJGb3muq0R4pvBdyOkvII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499044; c=relaxed/simple;
	bh=lJ6AYpHjGOkimMExUHB9UOtA234mEYMud8tyoTmPLRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlXEWWDR3Ilk1T/rkudv0csW+rrYwpgRIov1wIim+CEOFWY9GsexVWPACpumppRSemOP2HqsQ09Zsn7XiyzEvcNdpN+mSPx44XpFv4ez5BjPBltqxDzMaKion+NRuM+E9S6gbkiN8RwiH3j1Rk7f9YmWQdsrLjMYakyooQ1YCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmt0FaTo; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmt0FaTo"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c7d1fc8f9dso76247e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791499042; x=1792103842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOpeyuGCRMACRp8m9ibObWPSIPWBOuQMlxgdPx+TYS8=;
        b=Nmt0FaToi/KWZq4wJ6LAgSt5oog2cBkOZ7xFgMILhDfY6pyURVMrYFF3iN55TFlYXR
         yNRtC60uD93YmFuVl+BadJpHyUDO7luvaqtpBcadB6QXaFGjf8yVGtSYZKFKwJX9yMWy
         SEtY6CHcHlbQVHH0ByjXH7XWU9OJNSxJxFrtFmEd3wKeDnXGqRcHtSkynK30qaheHRU0
         fmxtV75GEEN6wZJ12c8DJrN/6DAjXujMc6knKaBEkzjzZyTAOMkO832f2b7TJpVp5Qhm
         oSU42jc9YsfIVCjTmsKPdKGjJ1bPyqjJaLGmF5LhZIhKimQd4VjKfWY+h6xFoU0RZaQR
         3tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791499042; x=1792103842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOpeyuGCRMACRp8m9ibObWPSIPWBOuQMlxgdPx+TYS8=;
        b=pf25ckv5VO/xGe12r+ITJlpfldstcspFELrFXCxP+EEPxQRrnP1MZuQnyL8KBiacOK
         65vyAxZiF6lLXql2kiEdph8humX67CDDNJ3mag8SLvKLbjDQBHMXDaeXW/6SoakVhYsy
         SlTrYSrzngyq3zlFZ0FV82rDNp/O6rsv3zoOl/iLd/ekvcXK2HgnYt9TnTIyG2PvYQyV
         aJORF7xGJ46mgApCl8z4M/Fpnnsbop9nqAAyEIk0n/yh1PMMlE6Xb+xMz5uxeD9XgagP
         8/JrYWlA3QBgkJYzM1LMQo7yMwA5Yi0c8XwNYz5wXhr3OqFRkBDQ1QDDmQhgbiyI5Zj9
         F8rg==
X-Forwarded-Encrypted: i=1; AKwUvBzI1mPQg0cMfeNJATBea5Ri6VKAU9mzM03T7F8nO287NNpnodFinzlaQsiKWH2bcCFfapQpUDfgwjPmw5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHr3UB6zkAmla8hdNvAkPq6qq0iVmiBNn1emo7iiQ/v4wsc2HR
	nBsZxvgkmowBYXzoF2lUAl+YVXUdJKrbgxNL9TN/oglgTy/hpOV8BYFV
X-Gm-Gg: AYBFou2Aj525BD4OjEuC10fwoiPc6FKegdrHfzpdK7gF9Zblue/3CP9Zm2oWU+Zdx/u
	CM44hU99uj6JYkV9ZAPZ4iNz6NxOEnGKgr75EHUmjAPZE9BV5gJkwDhTCcy//5WOhEt8CJMRdvv
	6P3jY8sFqOhVa1l5whRpjMv6VWxU1IzR3KOTxk/3aFg59sESbHVAIYM+vJkZGzerrKXPSO1IFCk
	Zf+wOEJPLfIKzaErVDZpfBqbDI5DXx1KZB5SI672G4PDRYvUowncOy6CAOAIUIp4BftQmCxjhMS
	CdNPE6yRzD+XfRgqNShOI/ENqtS45gse6FoTnfWR+vI7h0izg+5MxY9gsAKp495MOELjdiY90ky
	h75dT2st4UYDojUy3ty2usEQjGpG02RKhX3bNyqNsEPKqz4KBD8vjte5nrF3S6RHg5oA3xIZ7ga
	X2f/16r1WHjl5NDqk7ZYf03yTaUNLH4CsxqZBLaVtTYMSyfoegUEqajyiEdqyA+0iFugBNlLbBu
	qtL0GdN8HtkqX1/COcSNS8He6R7JX38DHaCi/gTlPeHpBZGf+znnQlaiXdngYYSodyw2gx+XlhG
	1aVnN+VaUhmefufpeMI=
X-Received: by 2002:a05:6122:14a:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5e91f58265emr4623e0c.5.1791499042370;
        Thu, 08 Oct 2026 15:37:22 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab8c40sm393284e0c.3.2026.10.08.15.37.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 15:37:21 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH v2 2/2] scsi: target: rd: Don't invoke the OOM killer for ramdisk pages
Date: Thu,  8 Oct 2026 18:37:10 -0400
Message-ID: <20261008223712.49827-3-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261008223712.49827-1-sanan.hasanou@gmail.com>
References: <20261008223712.49827-1-sanan.hasanou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

rd_allocate_sgl_table() allocates the ramdisk's backing memory one page
at a time with GFP_KERNEL. When the requested ramdisk is larger than the
memory that can be freed, these allocations do not fail but invoke the
OOM killer instead. The pages are not charged to any task, so the OOM
killer keeps killing unrelated processes, and may panic the system once
nothing is left to kill, while the configfs write continues allocating.

Use __GFP_RETRY_MAYFAIL so that the allocation fails once reclaim can
make no more progress. rd_allocate_sgl_table() already handles failure
by returning -ENOMEM, and the caller then releases the pages allocated
so far. Add __GFP_NOWARN since the driver logs its own error.

Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>
---
 drivers/target/target_core_rd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
index 97c63b122..46698300e 100644
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -150,7 +150,8 @@ static int rd_allocate_sgl_table(struct rd_dev *rd_dev, struct rd_dev_sg_table *
 						- 1;
 
 		for (j = 0; j < sg_per_table; j++) {
-			pg = alloc_pages(GFP_KERNEL, 0);
+			pg = alloc_pages(GFP_KERNEL | __GFP_RETRY_MAYFAIL |
+					 __GFP_NOWARN, 0);
 			if (!pg) {
 				pr_err("Unable to allocate scatterlist"
 					" pages for struct rd_dev_sg_table\n");
-- 
2.48.1

