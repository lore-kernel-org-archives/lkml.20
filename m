Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A803D2DC350
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025858; cv=none; b=X0t1TBeqhVwSgp7Tmoj8HgZcBp0OxVSsthTmxMSJXTUuy4YkiEiEJ7hTUeTteo9nFSGIOK/m7qkQ79p/dSzxhCHnQH7d7TXSlPAqlnZ8LbxMGb48NWdVeLmKpfAfwW1XIO5iVuyHmNY5eGUB1AKPZytCp8Sf/rlpY1ef3uPoMAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025858; c=relaxed/simple;
	bh=WWTcqcrYuK6IbdrjMRhsuwFkgDt4+Cy7tBLo38z8uik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eplSOF539DE82Zo1yrrtOeSpkX936RX3JbmBJqRuXyy+L8sISEZOSYkDXOdumKz5cAVqrnOr5GxesUupSNlMcyLPBV5KJna5OJm/kO+nebFBdnUTpJLIFCzjob6WOMmakejZkSMYk5fpdC4Qq5iibAjxbDnwAEQtljuPr0JVdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=TEYYofoP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="TEYYofoP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2385387a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792025856; x=1792630656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=TEYYofoPD2E+QW1x2bOy716DFgT9UFHODVVVdpRlrD4pDfC0k4S7eqvG8cUAdhehyv
         SPGRbmUCbK39jxgS+ZWNOO4AK77vnS/sJ7hnDMOHne8swW66KePsvU0rAGJEd+zVqvxY
         mrohmmyacdp3BCfxqoKPHz2hivsnqf/zv+AtmbzhTiwMMt9t2WrCbjVsVxcAQ1ZbSNBC
         MmK9c7Ed8UcGgRQYm3juT/zAlkliTjaeZF/sVo1YV90yT4PT2JCV3rJE7585UVkMe/w+
         L5h7lAG0NnxEqFvStAj6EgWCZeXa7qaRHGqhjoc+oAv6Rr13TeW6ewxi5kJqIw3sJKNs
         wCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025856; x=1792630656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=F5S2YjJ/05OPkRRdTn1IhvyyW6Be84Mkw60laXhCNmiR/Wt3S1PPNZzGsceW5zOlGI
         +o7nIfXvvZnt2v2ACbUgWLOpgl+VXk7SU349GP5MAAkktrAPDPX8oxBLHAcKcTaiPFVN
         mDXusrg3js9ha8ns1ktUkDTb4t7CDXW5SL7w5sTLqiQYhOenoFcCwmBfK2RyGIgo4fBT
         +53+DIMrtleLkoBwVY6U76IyW/muLmjXaMNazWMAcyGuqNqDyjLtcsw6IGG+BzHYwtq8
         P/iphl+1f3LQqghn+udiIkXNmk8Gh8MULFgt7wgz5PwJo1UWgAzQijJvhSrR9tq8jOEs
         duKg==
X-Forwarded-Encrypted: i=1; AKwUvBx0QGaR9ZCkK7Ppcdp7Ix3cd+XFapeScD/wIdy4wkOjRgGdXQ/PChqTkdR87uOb1oaE5PWxh0bsZde0Emc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG/pTPol7A4zT8Dh3wMsaaadX73MmX3jdWVBDeGmGfG15eXCS+
	m8JVXSNcgd35nba1g0EDdYGKmIgvdX40WwYmcMZvrPoto2WirE63aEHef06005B8+IE=
X-Gm-Gg: AYBFou1KtrknzNx5ZzkOJ6BOzPqbj5qYodm/6a7wLvgYg6zabxb/fjRUaRtouJ7gLX5
	Jgoa5wGMmuPYz5Fm0Q1uVI11cndMTJuVtgv1M5WBrzRSBaa3zXbxNRr5eBCV4MRUWjzhIE1i1y8
	0URxLdZFQFs2dpCafXQlLtPMbFDCGqZgnbhw9VZf1nqmGcHLNsgNxXfjiYRBF0ID576GvvLsy5H
	vq1tZdj9pSW0zeOUfpUPCgNdESDVpZ4kt2vrAJkxlm5VJLNdzDg/XdGlc/geOMAKdH3CX7+vDzc
	aLjD0ePxlaQ3FY/FEdYNsF+wf75MmEmnb0ut513s/3cDbxUyE+esQTWLn8dZ/77Ce4VjvwbyasI
	y/SPSAzwNfq6ipWOH8Z/fed+ljxmiwxE4MC0vzIjWXmffl1jxdtchogQ29h6I/Ux5ohM+eDvbU5
	QSITWFoehanUYO02Ln3lNffa+Q6Wz2FEiu+/N+xrbzXdOaClLavttStTUPiWe/Nzdvm6AiBzf46
	hHXHHSsZaQrsFIB
X-Received: by 2002:a17:90b:5546:b0:3ac:4e76:36b8 with SMTP id 98e67ed59e1d1-3ac4e7636f8mr5066203a91.5.1792025855959;
        Wed, 14 Oct 2026 17:57:35 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm999198a91.0.2026.10.14.17.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:57:35 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v7 1/7] scsi: mvumi: bound the per-event parameter and sense dumps
Date: Thu, 15 Oct 2026 09:57:11 +0900
Message-ID: <20261015005717.3719956-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
References: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_show_event() prints param_count u32 words from params[] and
sense_data_length bytes from sense_data[], but both counts come from the
firmware event (struct mvumi_driver_event) and are never checked against
the arrays, which hold four words and 30 bytes.  A firmware that reports
the maximum (255 each) makes the loops read far past the event and past
the 512-byte buffer the event block is allocated in, printing the result
to the kernel log.

Stop each loop at the size of its array.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index e70d336b4ab39..38a92f8c25f5b 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1361,7 +1361,8 @@ static void mvumi_show_event(struct mvumi_hba *mhba,
 	if (ptr->param_count) {
 		printk(KERN_WARNING "Event param(len 0x%x): ",
 						ptr->param_count);
-		for (i = 0; i < ptr->param_count; i++)
+		for (i = 0; i < ptr->param_count &&
+		     i < ARRAY_SIZE(ptr->params); i++)
 			printk(KERN_WARNING "0x%x ", ptr->params[i]);
 
 		printk(KERN_WARNING "\n");
@@ -1370,7 +1371,8 @@ static void mvumi_show_event(struct mvumi_hba *mhba,
 	if (ptr->sense_data_length) {
 		printk(KERN_WARNING "Event sense data(len 0x%x): ",
 						ptr->sense_data_length);
-		for (i = 0; i < ptr->sense_data_length; i++)
+		for (i = 0; i < ptr->sense_data_length &&
+		     i < sizeof(ptr->sense_data); i++)
 			printk(KERN_WARNING "0x%x ", ptr->sense_data[i]);
 		printk(KERN_WARNING "\n");
 	}
-- 
2.43.0

