Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A7361978
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265436; cv=pass; b=lOJAt2DDiWJvI5c/S+W8Tqok+/MCEzxSSG1X9sRGbwn6Ynkoy38l+iBNhIPh5oZqnpkUj51q6CP6AljuYQk47CmabiPw4E5qer4F6jpXWUtYf35aIGTo47R5cclBRpHO/tszrGqNkpCYdDwbGgS22cHQ99zde1oAnuoJ+yB1SSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265436; c=relaxed/simple;
	bh=Ht5cATAfleiy5G4DRiReKjHxLRj7wcDPgpE6phoygGA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GR842HgkYUHX7rgu1ZA1g6sPFxgv5wx5MvFawsfSxnVrGULwm/0cURGoI7bxKsBV6f7dVgtRgBskx6lp1qb4nm4JBySE/wuDHmGeI6wHLxhbqB3V05InDjiGvqdwcyaT/N+JDlGyIoBYyw2HHXnYpxQHABkH9CLYbDaWr4wc9hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CuRCfc4T; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CuRCfc4T"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52fac937235so171331cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788265434; cv=none;
        d=google.com; s=arc-20260327;
        b=Ub/h4Wi/zF6Hr447sPx2QFdqXRuUudsRrvc/zvRRdEqOhdPpTsgMFmLHueFwgZdFVH
         BCKz6tsN32Jax/YerOg4LEIQ8/ZtZ5u06mIhUwvhb7JxNxw15+SIJw+DMvf0EKsUwCF3
         QOLE6pWTMZbVvpng3yIoucWYleIFFM8jxxfjtsMrlDWP5ir6Tg0L0qIvxCXT5WsQWLd0
         OWIZbGkytsDUToVkPmh728MD/b9vOmgMBDswj5L6hu4GOg/FiWPQKcPbaE8ketcer/jS
         q1UiXC2yN2DPs+LtLdl7nP9VVq1zOgpSIgAesLFROnxvI89KfbZMSBzh/SXK4vVcCiQM
         Tsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xs/nVb2M1FK/MKYSmvmte6+x7BswjnCwSS6fAm+oyTM=;
        fh=7MvmNZ6HWF6hRwwRwQrCvS9mGp7C6IJGVTAbXXWI42U=;
        b=B9EU7qQIsbQzNnjU82mG+rdzkmCfp6GBvBvOg0oJlmjf51dfIlhHqPmZs2sKlYDMJM
         DlZ120JZJrEOT/6splLlSvGWe5GGKfyJz00QNHzKZyUxFohAHNqxlQ6AxD2xprxLRIwo
         cbTPIc7VCJehSJMYc6ZknKL1LIeODGNHKKvHKSKxhYSUcq+EFHWRJFczsvBnixiAg6JT
         AVruT7w3jp1QKPoTPQUPv+Ux+TcYDXt57vE0HBnxLKuppNrZcYLWxr428wrjJjUa2AzM
         wyVFl24lU6+xT/r3eqlTkUgdaQA9vkll97N1H34AKJWt/x5aLatmTj46SXg8xjwHgErJ
         0K8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788265434; x=1788870234; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xs/nVb2M1FK/MKYSmvmte6+x7BswjnCwSS6fAm+oyTM=;
        b=CuRCfc4TLjb1itnOPdeYgIB0vWu/Fzo3XOaYzQosePC9QjJLm77xrSfwt/qAC5a/e3
         gfZfa4aJY7syELE9RYB39QliNIQKDroKNr3/zcg5kxPKjOrbbRnHXKdDqs9CSUa/qFoT
         j2aSB6h+PvQddNkJTCEjGQ16D9n2+hRFRntSYWzuV4VBtfoJdEs/YTdc0zPBRTXftnR6
         biFG2xYDMrYncsUIhqz0LieJtw8DzBnIZ9ke9EpTT5d+H0LtnJCfTrfxPPgnG/Od19wS
         CCGLCTr4UW4lkx3teU/wuRfhQwwHUSGFWCMS1bfYJQDPZq4Ks66/MDMayI9hlNgtfnXN
         kvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265434; x=1788870234;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xs/nVb2M1FK/MKYSmvmte6+x7BswjnCwSS6fAm+oyTM=;
        b=nMwRAkdeyl5kFz1ZffRxC71MCSbCBGmQvc8MwuBtGvKn2ACRDWzzCD6aXanb80BCfD
         +RzhE/4mfMhxsdu16CU6u3x4UjY9dYmyH/PZg2/82rAJ9dy1Vt2N7E1ZkQEQGIaqgWE6
         d2NmJJUYtbHBMriilzude0eyPaEA3yDVaAQkS+0Ia3h/yhzJPaJkDPyIotmU2jbkpwzq
         5sgiIPh3i8oyodVlAK30xpk+M2tgbuXPG+FM883CqBmd2MroYXDiCLvaUTQ7bzbUbqlR
         0n2tq6DZfkideoYZ83oM/yHtq+2PL+lypu856Li/c1sO0FIq/IiHFPPNyB4vPUIX/Q+a
         wq0g==
X-Forwarded-Encrypted: i=1; AHgh+RrlCeEP8lVCnfzy4b5aqhupbfcfSSk/HgaDMG3bd5ge4YXbtuRwhP+rJ3X97lHWJNYxPWEJZ+AAipUF4wU=@vger.kernel.org
X-Gm-Message-State: AFuF++kOIssXKTq++uxKWbCQhlAstzleFeBs14isX6FE2OKX/c+bBICu
	yLek5t/nQyA7GNwPULzQ87K7Bv9zRJ3xBtYLkqo/CKuD8l6ALMcPeF3dhLjkKRhip5v9F5zaJUt
	vclXi1D4etI1usMg+ivOLjq8c+if5njOTg3tVYpd5
X-Gm-Gg: AR+sD11pcczsVYyhcvik9xkqmRoBGXEksdoI+gR80uvxbcd2WWsGQNS+KuOVFdpavGn
	5J22sq5pld85f6yZOLOtBpoAg61uiC16Q+6FAw1M5Cyv7B4BvKKmwHSBn0HwZ3RYddaBy2Z+MXx
	uLe3mA1aEzntsnGwyGtdoY4aERGmUNAVhDPgUFPbkMrVFP2Kcc1oCM9aAF13PsUUmzphN0r/2Qz
	8IAhaX4s52QzUI2EbIMNZUwW5fWz2dnfFoJ2Ws9T26v3h4pLYLOIrIJxI2ylkLPq/2aEKlloIpF
	EnYK2B3tYU2fhRFQJB2WYv0iMjAaukizQoqUSAI5AadZ
X-Received: by 2002:a05:622a:550:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-53024ed6209mr15248401cf.14.1788265433232; Tue, 01 Sep 2026
 05:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stanley Jhu <stanleyjhu@google.com>
Date: Tue, 1 Sep 2026 20:23:15 +0800
X-Gm-Features: AcwNN1WpJB9_YlNn1Oe8v1rf02Ia4P8dBEY00QCfQskFb3n-rTKkMqg0dRw3YE8
Message-ID: <CAE14pdek6ynze+muDZrK+yNX-3ioe3vprxOA4W22qokg352tJQ@mail.gmail.com>
Subject: [PATCH] scsi: ufs: core: Avoid unsafe MMIO reads in ufshcd_mcq_compl_all_cqes_lock()
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Peter Wang <peter.wang@mediatek.com>, quic_cang@quicinc.com, 
	quic_nguyenb@quicinc.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reading host controller registers (such as CQTP) is unsafe when the
host controller is disabled (HCE = 0), as accessing registers in an
unclocked or reset state can cause bus stalls and system hangs.

In ufshcd_mcq_compl_all_cqes_lock(), all completion queue entries have
already been inspected, processed, and cleared in memory, so the
software queue is logically empty.

Avoid the unsafe MMIO read of CQTP by synchronizing hwq->cq_tail_slot
directly to hwq->cq_head_slot in software. Upon subsequent controller
re-initialization, ufshcd_mcq_make_queues_operational() will
reconfigure and re-zero all queue pointers.

Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs-mcq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 8106d55f4041..0e1f99c8d77c 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -349,8 +349,12 @@ void ufshcd_mcq_compl_all_cqes_lock(struct ufs_hba *hba,
                entries--;
        }

-       ufshcd_mcq_update_cq_tail_slot(hwq);
-       hwq->cq_head_slot = hwq->cq_tail_slot;
+       /*
+        * All completion entries have been processed and cleared.
+        * Synchronize tail to head in software to mark the queue empty,
+        * avoiding unsafe MMIO reads while the controller is disabled.
+        */
+       hwq->cq_tail_slot = hwq->cq_head_slot;
        spin_unlock_irqrestore(&hwq->cq_lock, flags);
 }

--
2.43.0
