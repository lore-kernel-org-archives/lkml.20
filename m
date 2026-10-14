Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412AC53D0C7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995072; cv=none; b=IcHJN6f5qgevAKxjbIb62TpAWcgLBg5QtB71jf8bKWanHj97bzZMiZW9XYOTXJgyHvcZninSycjakyywsQ26Zpi4v06NkmT86fuCymBT/PMSbq4Z1mrMSX9l12dBVpwu58evlu3VqUPpvnwVKuyDmIDQRgxPPMg/4TBOVTBSlGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995072; c=relaxed/simple;
	bh=WWTcqcrYuK6IbdrjMRhsuwFkgDt4+Cy7tBLo38z8uik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qG1q8RcHGiEL2/OCoqh/J/VTuGIhk+zNzsGScypb+m/1UOGPaCseSZYk70x1BU7WQcmi3rkOgJ4j3FPh71Vgqd/WAuGlFusSxhS4xBaf3GmvfFx3krACmhFW0eOt89BADj27fKT9jtoIu6bflw1/Psm5HG1L1oHNPa7sdzajUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=vSWfdti6; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="vSWfdti6"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b6dad2382so9995406eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791995069; x=1792599869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=vSWfdti6fPSLkpyQefSfo77ewr8kocGQhokzuWFFhfyphRvyP/bdPb91Nx9DV8GFXZ
         TKbDCVqyjnzQlY0d++l7fZylBHv2h55i43o7ul43hF62w7EyZVmYUQ6iYWfe+c5Nv/GK
         ZLKwEDRai+djWDWoVjwubT+VtsFc/dgr3/qOxD9/DtBjW2RbIlW5ydb8UrbC6WI4A1u4
         qPABpSI1A1Ks1eoVlOaQTSu7gNHYY2GyUIvRNaZ75ZatmsjRT7CY0C3unvKi6VYUErnb
         In6Oxhh985kBHq5LyUGanZcd0oZln0j5WxpzqMT52pCQdBKjp1uMvQoZbrGYiFWsbxoh
         Z0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995069; x=1792599869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=VXHXRQNfUfGTzJB7Cgs2lV36esgjNSMrynv6J2H+iAOagfgWEy6t7/I7CQfyPF7MI0
         pwpf4YwuN2n62hEj3N452QJGj/fthe04jO60drXSZJ1mRMSsEu4eLjY/nluWkkm45Ekt
         2IQ87OhU30s86+CcuNHTOgTSnKyxdGYD6haEyKNqyK3wjl3Sf1QGcg4OUkzSVViJMJFd
         2VhQxmM1WC/XHGOpa2CZQc78s0PEQVGRA/geOfSiU4/mYeKqzNf5CC763vzt7kxpICxk
         iRMjQXumEHgChKmofqC7QlmXPHZjb6D52waNSZRt2BMVJIBLxDaWfwale57Q5+hs0QU0
         cTrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc4bPR1t74T6wp2m//gpjB6H6qy7jzm3kPcqN+lo+SCSs3N62iNVTbsq7cPF9e+l7ZnmrANkl8/U/WWPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsoQ4iHL4hRuVT44YQeoTNq4mH6TnIUqxeOoW5YtN8S8/tNx4Z
	e6icaUw94yY/cY5RAxSo2LoxIar8N1iwNrqH2OwxQhEvBzG1mksKXUlWEY1oN8CKxXt2ayRbIeK
	cHVNp
X-Gm-Gg: AYBFou3FNHy5A3e6Ulr17LPr0pEIW9mQQCUyXngtGI7XpdEAGSQAubPAvMr+aQtXflR
	/5UZbcWDZd+U+N4CjULCV2Uoue2+l0Tv+e/4+P43mJCFjm62BbS8BL1vwrC6WQWl2m48Bmpqkt6
	sxwjSgaRh+uAQT5vFTzIONe8xRPyifSc/PfFZUa3msNbRaVUYQr3UCMvxjprgXOmttH2bnEBKi/
	9LWuLNJON2QC24doL7ta+Njbpx01vYVS12B+YVTBmyFSBeIvg52yh4HsER4m8AdHn9t8pt15sEp
	sw05dxnI7oEjxqcW3wnpwFxH9XM8pmzMkMPH62Lv8Qc/WFP0lI930nFfE4fIzZIPjntkZOcuYU6
	p8yYFG76R1Yk26/21pK615D3cxAxJzRJKZstluAAE/sIjpztPxotnDboe/ET+kuyUYs3TIXrN1K
	aKZ2SQvvhg6t9y2HVYayK+ielhFeAUus6rqxie8cI1jXqAtGMLc7Ri2en3LJTbUbOi8J3mx75as
	o9/ci62nyl1YeZFo6pC
X-Received: by 2002:a05:7022:5f14:b0:168:6ad8:e89f with SMTP id a92af1059eb24-16a56c9dd9dmr21327771c88.3.1791995068875;
        Wed, 14 Oct 2026 09:24:28 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1dd57d0sm48816685c88.8.2026.10.14.09.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:24:28 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v6 1/5] scsi: mvumi: bound the per-event parameter and sense dumps
Date: Thu, 15 Oct 2026 01:24:09 +0900
Message-ID: <20261014162413.3649841-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
References: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
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

