Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110D635C6B2
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789205912; cv=none; b=Po8BwM9f/e+GKriUFV71qri+5qCJHCCFCMN11Catk1ZR/X+ZGZOlGyXzZwBaVdzmMWT/UxcFqPjL2SG4aaqepAJQjNEdPt8V+kueCi7AJsdENY10PuMe7LGIOrX++TGD1ADMs0uu/ygYWw50hj5quJk0qhsdZci2LyPKw0fJf4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789205912; c=relaxed/simple;
	bh=DMlf7BX21e26FdJU3jD5s4qhG0lSZXtCtwncPmUerlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnMPlhiYhqlSizZx1rDGYXe1azGSlspjRQOnAsdIMJVtHNb47qmuJb778FQAIzlrQcTWL8HBi8bSJcI36OF3lixpXtLX9C8SxCZ/D/8KkGBxGdkfW43bMuKT+Kkvec5Zymv0hDq4QYZntzEF1K22sMMjM4u6XFy0y1SHOxJ57TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9aTkZLh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9aTkZLh"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso652561a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789205910; x=1789810710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sv8E4eydRaPEzHxJrkeiEKfp359c2ql+U5LVMcs5Vns=;
        b=Q9aTkZLhkaVKmepnLMtAqCEvW+sFYWVEdXWJBih5YhL6Rhf+8OBnJaJ88WUn+z3461
         MIXp2eWu/YPxhwLpEK8YYGBgptmkcU6IqbASwvDjHOo9aGi6Z7T29fOKsocBpRTrsptv
         uaJ/qyz7eHQzZzJkTB/ALcl8xNshHuUejL/c2h8ZYKS3JSFkX88fr8QcjliJu6vt4/ia
         QgCiooIUhPeJ0p0ZaFuW0LvFBhbl1o4hyLEC09yLnXdC4n9ETzlWrMkZKrdnRNr3Arvw
         2+pVtafJI5HRf2e+bB6GRqxVefalFGho66rKS7xHQd0VSzRQXPmJp9DF3SzAIv+bCDSx
         mPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789205910; x=1789810710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv8E4eydRaPEzHxJrkeiEKfp359c2ql+U5LVMcs5Vns=;
        b=ULMOzIjVdibxhnk56afp+nmDXN1+P9PNkvC0+Um6k1cNy8wbXoHkytfO8UdGmRvTWU
         j2y8nMi2BQyqmvcWBATNnIdqZiYxsspvIj9+AdSPKLW5NX05uZalO5ro/nTsYdZjlkQj
         OczKwt2JtzLTov3o9U17nFeN1EG+o7qQAsw0Ds1apPdHFP2UNuVRpxYAUIkmN+PNb1E6
         4T8BbpFaWgogEpWjCKtnCtcJHGi4Ah8G0PywbEYUvsUJu+8tL6/6fi5qVUhs3bi7hi6Z
         QQNc2VP12Tt4lPAds+rNmZNgltw4eLglllYNoPH9V65v12E3eaSJlMa9fcsDGB19/SEh
         fK3A==
X-Forwarded-Encrypted: i=1; AKwUvBxYmSGfMJihx5RstPBmtlKnjo8UX5mflXaybj2aim4waOowWMboyGa9Yn05CkosffOiL8SWtifAZ81xlQg=@vger.kernel.org
X-Gm-Message-State: AFuF++k991Z4xVO8wOP7juI0RxChmalgUZ28byah20yUWSYrRkK3jRkI
	7fI9i+heVzyrn/OCevTD6TVgUjwGTFWGY6VCkspLS0zZ8qTg0oVCP08N
X-Gm-Gg: AYBFou0Z2Go67/UH/h2Op3ptjOjdVO5dne4seBH9Y+DH5QGrhToAQxVVxLF6Hx2cFoJ
	EeQXb+hYXDKKCiiyILubbreuhXeaDvyaL4rZM98rbLGODQDAcvVBHEVJrlDOSfcM0byK6vJHZSA
	oDWh9nxmbZPqUpVgMHSt+mM0nKN6d2K0hlyea7gym8UcF2vwb2ijUg5pyYEtnnEO7YJECjl8zV0
	iRWzVZOm0q0vCODILvErz6zS9m6d3OyxwObsGb/IYN+1lOWbRT8rE9FMqE0DDfkIf8cN/0DmPXY
	hJ+bmZ0wgOXg4NMMTdmy7n1CnFxvzZQJ7UJlpyBCcZDzESFQaizAuS76AUWObz6JmRXMj7gECsm
	mKxqeeS2BaYm1oaeQaSOdybWg0z8SxVqKONQarKv5p6VPJyY3WDBWAgFBdWH1Br/Aij8s1Oa5TZ
	ia3EPYAUB/5rvJKyjkPopKc9sAz/amtYt0e4ESz3uEumIYoCgsB5PcUA5SASe00W511kkOSOHWq
	VGO3rflNh0zqIvPaC/kVYcEIkI=
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr13349887a91.17.1789205910259;
        Sat, 12 Sep 2026 02:38:30 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm10928052a91.2.2026.09.12.02.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:38:29 -0700 (PDT)
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>
Cc: anisa.su887@gmail.com,
	benjamin.cheatham@amd.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] cxl/events: Return IRQ_NONE when no event is pending
Date: Sat, 12 Sep 2026 15:08:15 +0530
Message-ID: <20260912093815.14455-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CXL event interrupts may share an MSI/MSI-X vector with other event
logs or device features. Consequently, cxl_event_thread() is registered
with IRQF_SHARED and must determine whether the event-log facility
claimed the interrupt.

The handler masks the Device Event Status register to the event logs
supported by the driver. However, when no supported status bit is set,
it exits the processing loop and still returns IRQ_HANDLED. This
incorrectly reports that the interrupt was claimed and prevents the
generic spurious-interrupt detector from accounting it as unhandled.

Track whether the CXL event handler claimed the interrupt and return
IRQ_NONE when no supported event is detected. If no handler sharing the
vector claims a sustained interrupt storm, the generic spurious-
interrupt detector can eventually identify and disable the affected
IRQ.

Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
---
Changes in V2:
- Emphasize that returning IRQ_NONE enables generic spurious-interrupt
  detection and drop the Fixes tag. (Jonathan Cameron)
- Check whether the event interrupt is already disabled by Anisa Su's
  patch; no code changes were needed. (Ben Cheatham)
- Rebase onto v7.3-rc2; no code changes.

 drivers/cxl/pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index c7c91e8dc51d..8b560cae91f2 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -515,6 +515,7 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
 	struct cxl_dev_id *dev_id = id;
 	struct cxl_dev_state *cxlds = dev_id->cxlds;
 	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
+	bool handled = false;
 	u32 status;
 
 	do {
@@ -527,11 +528,13 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
 		status &= CXLDEV_EVENT_STATUS_ALL;
 		if (!status)
 			break;
+
+		handled = true;
 		cxl_mem_get_event_records(mds, status);
 		cond_resched();
 	} while (status);
 
-	return IRQ_HANDLED;
+	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static int cxl_event_req_irq(struct cxl_dev_state *cxlds, u8 setting)

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.43.0

