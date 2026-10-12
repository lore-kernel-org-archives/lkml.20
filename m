Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D1634F24E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818346; cv=none; b=P0SLdGBd1o6MToaHRyaSu2J/nDLgBQ9wwCpu4Vhr5/OKdqP+pV6HIEfJwAXQ5OamsAdVJbyIVNMnE88xZZJ6rP8sqwLNtMIXIukNOIZmdeNneq1O5QqFbknqfZT6Uc3sJj9w/KKObC6jHeIKWWGF+oCsomvvp4GteUPjoioGs3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818346; c=relaxed/simple;
	bh=zCThCBQHEg7zoILpu1wZQQI8Pc820V1e/n5FVw5TliA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K0L8AylKguV9VDl8gOnbdpXaQif4be8osFwaXLtWAgXtQKks/1N9A4ka25JEOCwlIbA2dl9QoqJzKcVKfMOHjWXBHYrqlW10PgYZYtQsAqjaoL1kPKGVK6sWUM8tGSe7UBUfP1bA/lZir9ppHEknIOb6OkO37BdlG94zwD1yH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4Z2jh8w; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4Z2jh8w"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-881269371acso1959322b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818343; x=1792423143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Smdsi1BCXFX0leS6t8zLips+J1KQ1pukbcy1pEKTRmY=;
        b=a4Z2jh8w8IqAYly6Tjkzo55Wf3S/+kjfqshh5BFpINuDnQb6tsjnhZwIwDII8w1qZ7
         z1bcwgJcFi8Er8D5jji+1PKO0VCeD3GTgKulnkrgOsafJhcM89wY4l4l3EOVdikrh7/E
         MOHrqUFkpH2w72t2A3j6ucSNoKLIhlN8ip5Yrnu55J4fqPIVFeRaqPobXVqWvu1Wb5+R
         iXiQSXK0GYIf5mC+Ed9D+C7LO/4C7LUxWJzATDdB79XcbKUEM7BaxcU/J8UsPASb7bhF
         AmXlI9Hr5gi9ymVzAbWDjv3n1xvV8bAzMyJjnGTVh+mZJv3tvdHOst1jk5A5r3WA/0w0
         Ih+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818343; x=1792423143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smdsi1BCXFX0leS6t8zLips+J1KQ1pukbcy1pEKTRmY=;
        b=sAM6usfeSDuQGDV77QpRLG2hfaTfZ7NojtBKfYAsM9GNbQO+39Mb+BnKqe1oEZ/mvQ
         OmxPcxbtuZPFXbQO6qT2sBsT1JrnEemReMMPtPPh0jTah/kqdAxTMBUV+sZFzlgvsz1A
         mExrNEk5ZyFXYxmg/BPVx80Y1GkRue/YL/+B4ixQYe7QsLC4+P2NXMQX53EOKFVrjUhG
         tnUOZ48sh3AXXUiOBzXt5Kf7oqF0Z3U3+myRJfI01CoeuXBlw4iV7LzlYfhLXpWBnDT4
         Rve34JkrqcuM26qXq03Qo4erGuQ4eKmWUzJObOgKgEo2PnDyUd1lfKu9CVaASEDfk25o
         TS1Q==
X-Gm-Message-State: AFq9FYJA/sqOTflI0JgFKwWLcW/pfR059457L0erYHoZhybZIvIgS66W
	r63eymtD8tTGkvjd6ZhAKm40Dm1u++GDrUTf71oNbb7y/B1f1QpIJbG2395NxIsQNsX68dH4
X-Gm-Gg: AYBFou3swI3iN4GL6Lb9MVfJdCMflk6mihH4+z3kddu4AaV2WWH3+4Qaf1NOkZ298s/
	Sg9N0hXoge5nKfhwx6hSr+7Se2a6vAHCOdpYvMXoIRnLnNvuec9kJ2BjPj0XNyqzClKXeWa+U0E
	Vx6Weh+Y+iG9IK3AjrJ1x0qx4wVQLL+EJhVkwWYbvmnNcgvD/im1WjhQyI9rTNImTLI9AJmA6wi
	4GhDT4cXEy5IIUqe85oZeJ+PPpjA4He1SsmbhLm8Zxb2CsGSTnBV/B/TL9SCnJeWUdQSOgOpKqX
	hWvBnHDYTC1HGj0tRgzFc1pPO4Ba+bO8NF3VBOOZlGQCDKSQjAU8NJNeTJBA2pu54xmkQUqepF+
	BnHToR+a7v9DKZaZ8eC1hXfELbO91KZVV6Wvde1a+DKHKcyggCZzgpD9FnwjmRnoS+lqwr1DvAo
	PnrcER58585e2Fyk31Ks11sz5R07m4sM+zh4J2SGb1Onxs//taaI3kulgkAIumB4xMAEQapffEE
	PWEbZdMq3Ltyxv0J/n8Mp4uh9c66NrmCa6OeKUFyqxazX+8mqTlxphFKoA=
X-Received: by 2002:a05:6a00:c08e:b0:898:776e:eed6 with SMTP id d2e1a72fcca58-898776ef151mr3214615b3a.34.1791818343199;
        Mon, 12 Oct 2026 08:19:03 -0700 (PDT)
Received: from localhost (ec2-13-231-150-91.ap-northeast-1.compute.amazonaws.com. [13.231.150.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896b68ef2easm4191976b3a.7.2026.10.12.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:19:02 -0700 (PDT)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	stable@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev (open list:DEVICE DIRECT ACCESS (DAX)),
	linux-cxl@vger.kernel.org (open list:DEVICE DIRECT ACCESS (DAX))
Subject: [PATCH v2] dax: fix dax_core_init error return code
Date: Mon, 12 Oct 2026 23:18:57 +0800
Message-Id: <20261012151857.22534-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianyun Gao <jianyungao89@gmail.com>

dax_core_init() mistakenly returns 0 on error paths. Change the
error return to use rc so the actual error code is propagated
to the caller.

Fixes: 9567da0b408a ("device-dax: Introduce bus + driver model")
Cc: stable@vger.kernel.org
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---

Changes in v2:
- Drop unnecessary goto label, keep direct return for dax_fs_init() error
- Add Fixes tag and Cc stable

Link: https://lore.kernel.org/lkml/20261011132017.31131-1-jianyungao89@gmail.com/ # v1

 drivers/dax/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 45f84b0eb909..210f4af479f0 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -738,7 +738,7 @@ static int __init dax_core_init(void)
 	unregister_chrdev_region(dax_devt, MINORMASK+1);
 err_chrdev:
 	dax_fs_exit();
-	return 0;
+	return rc;
 }
 
 static void __exit dax_core_exit(void)
-- 
2.34.1

