Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8062C1788
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 21:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788729307; cv=none; b=Grnz7rXtVDLTON36sEKPjdFP7vhtMRjqPIEvPbHlzSzynPY5ThdencULk9vO+M9oFiJ4LprdQhf2jTWg9daUwIUI5KBb/pMfjUVzGaVNWP2J+W2hz6m/cBqnT+sUWSmllKL0zeEe+j1JuvS8s8dVOfVOo1lrBqrjS2k1xeRFL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788729307; c=relaxed/simple;
	bh=vHHRUN0nu/6JFyn9S245jefHltW7+qiKnMMQksi7KP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elZmzHCbA9BeBWPbWcIf0d/oIhj6N2s0baCuzGtivB/y5WV39S38+9MjmrNDyrzfTxppolUhDoPEZMQe96CqptfRtxJiGEbLgAQ85vfo7ghBhuf6b7kb89pOcRHjWBODOn7blzUi3PUFyrZKRhvrxass9rPgELxQZ+tFgiQSEMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5wKHEZN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5wKHEZN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6d28aa26cso16215575ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788729306; x=1789334106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUwZ4TKhPngatBg1HvsgtjPHLyp35oaMbmzVwgRy3+Q=;
        b=F5wKHEZN1VVU0lDIm1cHkUi6b+atwv4MeOszDA6jv+W2o8DYs6p21FXxh3z9ph+EhK
         zGlzwtR8VGGtn4YTTscHLdjiXlX5EsAdgcl9vqSGJnn4eFKi6qs3Aq1//JaPFjuapB36
         93Z6p3rrgwd3BRAUhNOfD8otRez8bXRAuqlDhcMZc/tyva0eCzyZ2LdXKAj4lAnI2bT3
         +xn/kBITsBPGMjwEI9eQGuHzpugdIUJ6iM8hj+TvAxhlUwQuc0OKRpj+lCZhzYyOg/83
         owmLGA0BQtZnyFE16/5brEcjzic0CvJG0ui2qQWlw7ewPiTOWBNcMDwcithhOa87BeUR
         dpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788729306; x=1789334106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUwZ4TKhPngatBg1HvsgtjPHLyp35oaMbmzVwgRy3+Q=;
        b=Bjmp/N77b17xPF+y2wZzOlgextDjitUVFWH2ZTTLd6Ldmh2Iddbc8KUah2jjkRZstd
         ZD+bSafMteXdI5ZtFukzqx9O0Rr8hNNG861cIXpW9IPU4S58C1JUxCKlIQCisN1GbS25
         aTjfVoDXyPQ4ElHgdUU3AfiFo+BflUAMKbZh2QShRX5xhye8TvQwGohDlrIwP8Orv3Li
         GHVHxR8u1BtqD7EbwEsxSbIeUlQIpZV47vw/kLS7HXbiIPcmjaxAb2/7+7RP/9V7/6fh
         8+w4qRFGQfp+snGvUkwr+eJCAJBhOpgZetxXX2EECz/tSEPOri7zIE1vzoaTgWLZwlrF
         ETcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdTMBdaIP7UoKbPFaQhFpY4PZyzIyUaaRvc98pJMG6l588mqLm+mlvxeFe/wkeQQgLC8O5YF1tIynTQdc=@vger.kernel.org
X-Gm-Message-State: AFuF++mc4iNFirGu++oCaeGK2ferF26elDGZUWU3DcymXY9iE2MHff0g
	LItdqOvw91gZGBT+JVmKQpjEkOXuvO9S8Vq7ogkBB2FrbtKxB4URhVPL
X-Gm-Gg: AYBFou3iT+WvgSynm/utcnv+mqzoqzpJW798+s6CB/meGUKWpbRlcQD4UwuP9WRzWcH
	jTu7z/iKevYwHfcyu7Euqa+XFi5kmMJWxPNArFQkIkkeLwD8d3Bi5MnKISp4DhR77RuGdJImeE4
	ptjnWUwcS/UbuPYEct4osEqK57QZfCG5WmflOW856DlLsx/Ictxc/F/jyyFz9nM8P+ak4guAsAG
	odaMmPBAX6vuV0A5QltDu5LDcIBDBu7vKp3AUD+4EY7ckwb1akRacVB6DLoJQg2M3LQOeeqs35t
	36wNAOcwXDp7F0tKi9XdUccH4VrVcxdRTPJ/3oiBZ8kMGIKmXgSLjkECSsodmPSRbsJAk4yzezy
	WsIHSgu9/LuG1VcGS17MIkdHwcWjcMSAuV1ZASeHJC1G0OgsGDK/PBaVQdFXD4R2TFhkXc+Bkd8
	GLtKG0C/+3W4OByAUiEo7BBrmI+Z0vM8XjwzvSGiCOnGgQWvhOn7Diig==
X-Received: by 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr31172440a91.2.1788729305628;
        Sun, 06 Sep 2026 14:15:05 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm9617207a91.5.2026.09.06.14.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 14:15:05 -0700 (PDT)
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
Subject: [PATCH v2] scsi: mpt3sas: fix nr_msix underflow in _base_assign_reply_queues()
Date: Sun,  6 Sep 2026 15:14:54 -0600
Message-ID: <20260906211454.71432-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906202236.53346-1-skunkolee@gmail.com>
References: <20260906202236.53346-1-skunkolee@gmail.com>
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
plausible queue configurations, which would wrap to a large unsigned
value and silently break affinity grouping, or hit a divide-by-zero in
the following nr_cpus / nr_msix computation. Check whether the
reserved queue count meets or exceeds nr_msix before performing the
subtraction, and warn if the reply queue budget is exhausted.

Fixes: 432bc7caef4e ("scsi: mpt3sas: Add io_uring iopoll support")
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
v2: check reserved queue count against nr_msix before the subtraction
    instead of testing nr_msix for zero afterward, since the subtraction
    itself could wrap an unsigned int rather than land on exactly zero.
    Thanks to Sashiko AI review for catching this.
---
 drivers/scsi/mpt3sas/mpt3sas_base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
index ce5a5882acc8..3810038dc2ac 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -3275,7 +3275,11 @@ _base_assign_reply_queues(struct MPT3SAS_ADAPTER *ioc)
 
 fall_back:
 	cpu = cpumask_first(cpu_online_mask);
-	nr_msix -= (ioc->high_iops_queues - iopoll_q_count);
+	if (ioc->high_iops_queues + iopoll_q_count >= nr_msix) {
+		ioc_warn(ioc, "high_iops_queues and iopoll_q_count exceed available MSI-X vectors\n");
+		return;
+	}
+	nr_msix -= (ioc->high_iops_queues + iopoll_q_count);
 	index = 0;
 
 	list_for_each_entry(reply_q, &ioc->reply_queue_list, list) {
-- 
2.55.0

