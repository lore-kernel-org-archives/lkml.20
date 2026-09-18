Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6B14503EB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753958; cv=none; b=IcV5IIbPIq5BA9tmkh3h/RPyffFMeofVoD7FK0OspfgwmyEcdp+hQ14vJV4qjdEwnxXkAOfTDNb/BydaKNuBUqUvqCHytUyM/eazQmg3Oyk9fPOpH/63dEnlTeQTi7Ozw/xAAXhVdgzHxoLAbAlnDzOXqRWyy8Sqml9EqQvtDV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753958; c=relaxed/simple;
	bh=FhB3MzXvMRrT8tN3nejFN13vQ0JrcsHthrfuNz+/Pqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VPuLEJe3qqDuCV6BV7lojQ7VsRn4VQKAdrSi64DKK5UbBdkq1gT5LOZinAdvV6j8Su4G3HiWfQhrK7fKOTohQFz3ApUpTxxOJU0HXe0eP3KJ2Ku2JRFQwV0YkCgnc9wc1CVuXlrsGx1PxJmrTUdof/JxFkvxJhA7y1yBye8b0Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/Bnb0Ap; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/Bnb0Ap"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so895581a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753949; x=1790358749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kxgu93Rsz/WkmkOGG8BARMKb+vTZl3FHpJlkwcMBl3I=;
        b=D/Bnb0AptX9F1ivlBh0LoAvDI/xcCRjTSP/53jUFJtiYhAqEjfaASUMKX4pInBO2Ix
         RtRtLgw4YONzV1QHJEkuCiSLm0nhETLSx1Y3vO/Oj0gxhkcz6W3iEnHXwitxBMWmkE1s
         c44JLb0xR5oeTnzOyE9xxagB0CPQ3sGMsyhMZVyUhTK1OVYUISRH0Jgpcrnd6q6dGMNV
         VOpNX+281mXYB3A3KXJg6iPYW93L4oc87JZPqROPoj+EODklrEcweBYsbPKjarQPwYzC
         94oJqWqopH8JaB5+CRW4T8VzMuWRKrC8nAOC7ypqiWYb2lXL0SvAId7RoSDz1BfLOwAY
         exow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753949; x=1790358749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kxgu93Rsz/WkmkOGG8BARMKb+vTZl3FHpJlkwcMBl3I=;
        b=QMAQxn7GQkPzoNvn2pXCBHE934dXgrpxOPBj+BPOFKjRLCswjfyS1fxRyMAJbeR5rD
         Uo9tMJI6N0d8G12rliB7GfB+EjxhpX8rmEJmh7FFRKUBgBFYTKFfxY0HSJIHsrm1iP+1
         hVAqcbVwekECUL7PVOcO1OfmXMQpsoYwRfwVdfhy+bz1ed4SyaIL1Hdq+GS31GRoO56K
         Qq0RNeUQUfJNmJes8NdrSGWpJ1pqgv4vxv50wcCkaIDzJMmmhO4s4/raOsd3VHc89Qyw
         PorQlvlErbbrq7qFAUZry6BwgdWV2rTDTabrQgG78bgLB9Kuf434qwBc9O789FMx8YxP
         5OZg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ0rOTGh5CE+cTfsgssFwGsHiRIr4krlFkENvHEhuYD2b7EwJ232EFuupZO8n4H3ONqiZ9umRkI9BXnX4=@vger.kernel.org
X-Gm-Message-State: AFuF++ltquW7jNbgwqLM+B8elMTR3Ax2Uy8RDOT7R9p3zdRx+GfLvnNt
	u8dYxsLVBLcrhlJ408ZwWYayo0eQHRJypL2nLLovGc6Iby9KfPFBF1fw
X-Gm-Gg: AYBFou3cgpyp0O+odsNwjlHWS6QGSc0l/iVNu5ncSsDCX7pF4+4z/OmrWrVTX0OMYbV
	TnIlsCjnJn31uW3Pe3pX17h5szAlMRpI4z0G7L0FGejd+9GJ2pYhUN+R2tM2ritND0NdAkyYvGw
	0RVKgAY/QgNVumZW9bc0SxHLShsnFIWUVHdLB3q6hT/zzW6NXCiDm/GlSu7r6pt3tif0SuC/pxm
	cyJajdOWb/lJYL9A/NlNEP2eZziIYSR1o0wBYyjI1HoX0lqjqJxwJ4Ypvxket0GZ97AQ750OkWy
	LWgt99+SteSokmiLfgqeAJpZMwJTDKCwKgYFv50VdzEJ66gCpqtmI21q3uXLp2gl4p6Nh0D3Djw
	5szqiCuZi3HpPDt6+ML6axDYOymYAP8tQdVC++owh/NcaWEE0aJPVpKUFbZnqTeJPyw9KTUWfeI
	JMrQUUAtBtngxuPyC72dqIO6uMkAN81BSn0XXi3PFhnesFUk+V4kY/RXg=
X-Received: by 2002:a17:90b:2b8e:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39e54c59c74mr12953197a91.2.1789753949341;
        Fri, 18 Sep 2026 10:52:29 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm528803a91.4.2026.09.18.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:52:28 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <James.Bottomley@SteelEye.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: sni_53c710: put SCSI host on remove
Date: Sat, 19 Sep 2026 01:52:18 +0800
Message-ID: <20260918175218.3616645-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snirm710_probe() obtains a SCSI host through NCR_700_detect(). The
probe failure path drops the host reference with scsi_host_put(), but
the normal remove path does not perform the corresponding cleanup.

As a result, the SCSI host reference remains allocated after the
device is removed.

Call scsi_host_put() after all users of the SCSI host have been torn
down to release the reference acquired during probe.

This issue was found by manual code inspection.

Fixes: c27d85f3f3c5 ("[SCSI] SNI RM 53c710 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/scsi/sni_53c710.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/sni_53c710.c b/drivers/scsi/sni_53c710.c
index b504a2cc5041..7c5b1929a6a7 100644
--- a/drivers/scsi/sni_53c710.c
+++ b/drivers/scsi/sni_53c710.c
@@ -115,6 +115,7 @@ static void snirm710_driver_remove(struct platform_device *dev)
 	free_irq(host->irq, host);
 	iounmap(hostdata->base);
 	kfree(hostdata);
+	scsi_host_put(host);
 }
 
 static struct platform_driver snirm710_driver = {
-- 
2.43.0

