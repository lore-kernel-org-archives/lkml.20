Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6B028E0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085328; cv=none; b=fP6FgTwGEMX95RKpihUXAXJAJYl5V8Bc8YGAtKEfUI1Tv2h40x88WYzazyPwJt/rgmtWpYJTXmEmXp2MQyOcUNd3L8xmEeFh05AvhDHjc5xp8ezmz+iQ7/FWSsqCG93LJZSJZ0NvDtRaBUbPEj/yg9PJdlAqQ5d+Sve9pdQyeB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085328; c=relaxed/simple;
	bh=v2XJNi/Y29xgo2PM9yU2/1tfHLxfQOc8Xy9oLXfuIbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCsJ0p2L7ckslNCRwGgxeU5pGnS4FAN4XYCL/fWgv3a/W4hXkH8pcqjXKlwr/HgqOaMdtYNYG8Z98thtn55jhruSynlSzIfXrV0l+vSCRj30CKzv6SF4mQL7Fgrqz7j0QucjFh6jE9IxT5cE5yAQcAd/QZ4n+O6dUt0yDvqiHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ton5mef0; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ton5mef0"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafd6so32627285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789085326; x=1789690126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSaMAuaPgc7+sGFbHWGL+A5HmSLpypXBziPyfL/qmaQ=;
        b=Ton5mef0H8KvHg31LiINad2ZtLRH8lkVKFPf5kVkXqOQkb5l1LPVyZlVN8T5YRvodd
         9veLYeMgdO+q/MpTZKyQQF01MBMT18EFFJK1oLtaj8AMQb0RsC2n8zcZiQn5ykBaUVYK
         GlZWx733ZIttDCqUhG0rcWQmbnUe1ne86BKWl4JyFYACyQkndQloOxl6+pbgh7YiJIAi
         m1Kkqkj7hH4EOwZfAO4x81PnEHS7C3sbdQ3uvLEXKkMTQShMT1jAYQE4q3LItcmNmBdd
         Uq9eUUrFH/MJ0AzuF93zGxUhB1ug80nPqITY4OwuzmDYD5km6dYFsBylzOs8HybYGACv
         NJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085326; x=1789690126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSaMAuaPgc7+sGFbHWGL+A5HmSLpypXBziPyfL/qmaQ=;
        b=SKGsG442hcKfs29eo1cWipTY0/gOVnWPRBjbi6lFeoXbIhCM8Du8OpKorz1Tv93QWi
         HuBiPBCmX+Lbb0cMuP6FGUCN4ELkyH5HfsaUfLTK0JNZOwPOJe2jzTKPXw4q1YZxk/NU
         b0tJIuoQ2vw5vr2jaItvaboB0uFChO/V0ci14qsTFroaplqyWFgG02GRtt/yaxyyOEKx
         v18uy4ZBeTWVME8qPEe6Qe928j7pblTWjPAZSkBd7WHJqaH8LxOq1CmsW6nyKl/w9lYB
         VDvxytZBs6xHq4LzXyXagI+DqrpalCQeSxk62/sZlHPNAKzh1fWu1QkX8EcudtVtBy3K
         rOLA==
X-Forwarded-Encrypted: i=1; AKwUvBwVVD4Nf6sT6k/NTLfGfRK/qwj9Suf2EBb0QphblW7fzUaDX/ULnhIbhEWSGh9h+e+yByYobmwL2+KF8uE=@vger.kernel.org
X-Gm-Message-State: AFuF++lnEnzbDmv5c/CzgDVbui153jpd5731M83WsWmdXdqa785U/euB
	bg40vYMugytC8sCGiZQc/qCFw3MGLFuXF9/9Fz+91hTsI4dzY/bki2y1KQOHRm4=
X-Gm-Gg: AYBFou0Dr7l66Y+ifzCrFdopdVm1yH+1tO8O89nfnN1IfflPjjPJddUjMeO+z9qRt/z
	OIlB+C4LL2afjg9GdOuefzRhNJN9lAXkvlc3/rjzWCAXXB4CGk7ucucT6i69uupwX4IT3idT26X
	mfJLtPiQb18wqceh7u7UvB/L6RAndniOatLOXI0Iz85mOUxP8mxIx3/Jd3Uar8Rz9NjHOvW/Fm3
	34NO/HAiAHZr5EnYUlbw0QpFQSCKDV+LUvW48/wjuOedSHgVAPdQbbHRTeB4SXFJTBFvjQiezJw
	QPIlctNABDaIW/pfl0fySrjD/RPsCWr9soKvX/eYOjM8RMuEaAJrV+CNGUmC/UzZ+A/h9T4KAwT
	pIGLsQCX6wMc8sSnelZmZ1LRP7pdM4i2qBVkCH+ii0yJNbl219kY8MyAqZPMavu6NlZI5Uafr5I
	zhwvDHNsSyTV+9qvYpU7ufvDw4pIz7u7ses8LoR0TDnsZUpixjYVAU4TnEft/FeLUtPPuXeqepW
	GE/rtSeK0SgHGWHC/RnIu49X027Bs6c79ei7cXxGK1eS8XNxcwGzsi2O9INfe+NmBFK8/7OUvQp
	wBTZK7FZhAvGo8KLz9fOcxZ9za0ZKcZSYpM=
X-Received: by 2002:a05:620a:4409:b0:939:191c:cac7 with SMTP id af79cd13be357-939ea0850abmr180782885a.13.1789085325637;
        Thu, 10 Sep 2026 17:08:45 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e811cffdsm106263285a.46.2026.09.10.17.08.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 17:08:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] fbdev: sstfb: use managed PCI device enable
Date: Thu, 10 Sep 2026 20:08:35 -0400
Message-ID: <20260911000835.88909-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sstfb_probe() enables the PCI device with pci_enable_device(), but
failure paths after that point return without disabling it. The successful
probe path has the same imbalance because sstfb_remove() releases the
framebuffer, mappings and memory regions, but never calls
pci_disable_device().

Use pcim_enable_device() so the PCI core disables the device automatically
after probe failure or driver removal. The driver still releases its
framebuffer, mappings and memory regions explicitly.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/video/fbdev/sstfb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index 2ea947f57efb..0496b9d5ecc4 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -1332,7 +1332,8 @@ static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 
 	/* Enable device in PCI config. */
-	if ((err=pci_enable_device(pdev))) {
+	err = pcim_enable_device(pdev);
+	if (err) {
 		printk(KERN_ERR "cannot enable device\n");
 		return err;
 	}
-- 
2.47.1
