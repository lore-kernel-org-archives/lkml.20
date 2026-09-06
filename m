Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A14382F0F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788726183; cv=none; b=BnxD+395vaEG2eMwE4b6wnvVnThq/DxKzIO0HUfW9rbvEMYKCRk2CYgl1HoYRSLjrl558nDETebus6d2Af62R8styUyVvGv0CmLBx+fHeqZqRdvolvdnLXQE7QrGggZARdWjCSZHLd83W/E+jEqxikJoVpG8B9bdifA6aBf/Lnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788726183; c=relaxed/simple;
	bh=5mxvOsv8nCII7gEdYfav7bjQqgxjWLiZKvu4xBlOaYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cvsAw54Ttu8kzhpZxGBKpr3jk0c3R9skYXFtBlNp+i9hTOWo+vNhBPgQZ80fdac0gWY62SgjZkLtJQLOAviC8fvxtTeXAPva5xBOsZkF64keSeFYYj3L0LLPolqgLyQfX6dmtvzZQwd0v+hPv5AbvNYUTojkUleQHHOB7Hd7C8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUs9T3VU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUs9T3VU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d9004f39d3so35079895ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788726181; x=1789330981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2SYgP+pKU8rLYSTxOYL/j57xs0a8PDs8sQOKP3s3I0=;
        b=BUs9T3VUEB9RmW/eeZw9IzxEOC2Pa0sfcGBZdtHT6rLunm/uQhCTRbIEz8GSQeAj3r
         dfF+bpth2QtM7H9s7nYcu+7NdAfHi01G22ipgIav56j8RqweOTdFKm5TDkfE1tlX8J1T
         dGzUt9HEBgpcbsXEEP+IV74is3oiqXTB+/U28ymv5KqffgkOw3U5z2haSj4AubDJKQKF
         1fz6vEf7ocxIJMA5wEkxT0eyepO/gZU8Di0oPQHQ5dDhcm2PimQk3Dc1dyS1aUVGiWNK
         xCqC54aw6GalBoxDfVG1qDHfcWcxF3YYh36lvF79feZh8TyzHFpWFdEJeNL6bhmDGDhj
         TSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726181; x=1789330981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2SYgP+pKU8rLYSTxOYL/j57xs0a8PDs8sQOKP3s3I0=;
        b=PQ/iOlbQ0bqfaT1Up+OwNiaz016Di+oIsKRcWH5qFvytb2etMyi2YGhddX+f0457Q/
         Aef7wG93RI0Ar6Il0tjs4tzTml8uXo45YKsikTBzKijRA8IsralthA4EQojXFsYLR5Z7
         F1oVBq5FoTaMSprknRE3FNG1kryYxREYQZJ9JnmH5Ob4PFP/H9Rl3RvHy3Nzng4+Djz4
         l9sk0x+fgOeR77am6QueIEhDIvJmkd5iB0UGWuDXHTo4pHyxW9w8SrdaRBcJvaFVUB4i
         mPNlut97i5orBVUIzr6GgTRvQqTWydiBktPkNFkcwRlP0wqIKsfHtGIc/C/BXWr9kQcS
         SSGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWsqLi8SlLj7lkj0z6d/KYm1gekBhj71fMkyz09p+WR8r1LrdeHrwKNF9zXA0PFWFvTT7EfCuPitxgcbE=@vger.kernel.org
X-Gm-Message-State: AFuF++lA7U26DHajfKfmnigAZ7UGsLrEFVGzoQuf6qDCUhW/EA2ZhyC6
	3ekAP/kgig4K4hN7O7d9zhBI2CWW+mJoGn/nyoeNJheFueNVoev9biUl
X-Gm-Gg: AYBFou0sUoFhTujcUXilg2m3+9LcHqw2rM0MGpXQezCtvsE83nh2dQ7Y8QElr6fMNhl
	l3Xxa+5Vc3gSxWDJ2lVFXN7MzTB+Z/7s9SsccBCRyHBMSQkU/Y+cBV8ME36K1KnXTbs2dLvroLh
	bErjpT8KaEJBuFTQfIhYWOjbBZrPmlte1+OYT8CwNIcxhPRIUqCM2zQY1BCz5Awae2OWP/vpeJf
	9ukMLeDsKj8hzt6ydFDQJx7UfG+ehki+o0I0inFsH/U+gqRElL/4FH2Bl/XzbWlWIPNWABKnYoU
	bD49Xb8CLS6EUUoEioCcYQDw4vAlb9w6r8olR4J1uh1R0JjpPgTEwljzTVJo+enhyAi/Em5tGs4
	XT3QgE2PTfoBNmLoSTiGyMgdfJndRNfUHz+ZOxqiiJxAjYIxNQrPCJEqA/Ye7SotNIxr8x6uI7Y
	NyQns8Jj2rqOdVOHdHKdKA/Yf+2uZf6qUWja4vMlXrO4vOdOFEPREz2g==
X-Received: by 2002:a17:90b:1d45:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39b262995b8mr28336253a91.25.1788726181467;
        Sun, 06 Sep 2026 13:23:01 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm16736906a91.0.2026.09.06.13.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 13:23:00 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: sathya.prakash@broadcom.com,
	sreekanth.reddy@broadcom.com,
	suganath-prabu.subramani@broadcom.com,
	ranjan.kumar@broadcom.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] scsi: mpt3sas: fix nr_msix underflow in _base_assign_reply_queues()
Date: Sun,  6 Sep 2026 14:22:50 -0600
Message-ID: <20260906202250.53653-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fallback path incorrectly subtracts iopoll_q_count when computing
nr_msix, when the intent is to reserve both high_iops_queues and
iopoll_q_count reply queues from the round-robin pool. Since
iopoll_q_count can be positive, the current subtraction inflates
nr_msix instead of reducing it, leaving far more queues in the
round-robin pool than actually available once high-iops and iopoll
queues are accounted for.

Beyond producing an incorrect grouping of cpus onto msix vectors, the
corrected formula can still drive nr_msix to zero or below under
plausible queue configurations (verified arithmetically), which would
either wrap to a large unsigned value and silently break affinity
grouping, or hit a divide-by-zero in the following nr_cpus / nr_msix
computation. Add an explicit check for nr_msix == 0 and also warn if the
reply queue budget is exhausted.

Fixes: 432bc7caef4e ("scsi: mpt3sas: Add io_uring iopoll support")
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/scsi/mpt3sas/mpt3sas_base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
index ce5a5882acc8..31b80ed6ddec 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -3275,7 +3275,11 @@ _base_assign_reply_queues(struct MPT3SAS_ADAPTER *ioc)
 
 fall_back:
 	cpu = cpumask_first(cpu_online_mask);
-	nr_msix -= (ioc->high_iops_queues - iopoll_q_count);
+	nr_msix -= (ioc->high_iops_queues + iopoll_q_count);
+	if (!nr_msix) {
+		ioc_warn(ioc, "high_iops_queues and iopoll_q_count exceed available MSI-X vectors\n");
+		return;
+	}
 	index = 0;
 
 	list_for_each_entry(reply_q, &ioc->reply_queue_list, list) {
-- 
2.55.0

