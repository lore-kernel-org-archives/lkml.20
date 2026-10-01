Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9340B372
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877482; cv=none; b=DkhB9zGHw9T6u5LcHYt21uBMlp2k/16E6C0KwNcLGZvKnLU0AjZCmZis7DCe0m0a3IquM9Y0VVJU+vw8tLjqOJP2zxUkCpFht0bzfNSVjwS8vIrPdACpa5s2nfUQDfSkxolwggJZOfSkzA6WSZmpaLGwyCPzsPSJPPyCsOmILQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877482; c=relaxed/simple;
	bh=jpJ+Su3Y1yhm/gM5Dhwlk3M8DvQgQBJXozNtOrhbmY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrOsLYBjsj/LUrQrYZN2WERi5w8epQvG7RMllCSF7fxvcji5QAT8Y51+5BL2KvainkNyeAKMQWyTXpRDcr/ClpdbaWt6oR6tjCczTUXa0k6CRJz+Ez8M/SBGKJFBRzYrZlMddvsAY1xq53fARcw+bpAhlVN8HFfXkJfDcJTeRm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNGs+jaV; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNGs+jaV"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53315c1a1d3so75682181cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877467; x=1791482267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axc/agQFuJUMgO0JWETHJcM/R1Xc0CldGQrnTgdLGIs=;
        b=SNGs+jaVfW43SM1Zgl6aMZN+jyG4LJHlDbCqUHj/SM4aCLKMnDVQIuKCoCnpLPz7le
         RxIQ4Z1qlRrYx8VsITrwpLd8/+1pSR5/OfbB+qjsB3fCkm4QVXaUB7Kz8QqSR97Bkm33
         L25YAi79gY2Y89N/UY1hVrqFeZtSY45ue2RvlRqANFPgq0sYaMr9oXAuBM4M9eTVYscX
         SXk9BktaXIdrQkF6z2NFkXdRLmcijYdcLmpNV2scAxtmpIpiTUvlLEDZl+2om1+ZTLHS
         md3mSVfNJrMP/awCNVVjrG4lC7RvIGxlKkX2sUxfCpMfCvOjYBeKdZ/E27pLJ9ywNSF9
         0Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877467; x=1791482267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axc/agQFuJUMgO0JWETHJcM/R1Xc0CldGQrnTgdLGIs=;
        b=0otARaeGFHEhYuy/LiOZi3gmBHGx0uOWAsvHLiXzpz/GDcRkdpMkKyAlIS3DtKS7RD
         wq49ScsIByIDghCb7abKeF9hC/X4gU84HiOEMN+Y4wBn9u5Glsh7suWSwRBNGSiO1Qoj
         cOgzUIE3PUN4wOiGy7o8WdEh8TYFm28zlckhPopuPBTqGyRq10tKYY/dk5yTXAAXW6tc
         KnXnmIuhRKfEXv4kLWLKGnfPxa5SSQhJzBtkTJAgzSg/akMzdc2Iw+HBP1VWEE30gyin
         L3mdoCopjkW8pfXpw2fnQ3DOq1Z0XF/EZqrBRpHJVLG+0Tr3eBoJ8NbgkygqkdOW7oAA
         INTA==
X-Forwarded-Encrypted: i=1; AKwUvBx+EekV8thNcMkK8P7gfgvUd8socNWrVk8yfyeGaFa04AUnqiqmJ5lfQk3o7WEA5n5+wGc9HZkkgtqzR1U=@vger.kernel.org
X-Gm-Message-State: AFuF++l3r2SksQc8py9TdYpQOQLh2ZZ/W9yoxEICTv4sC12R0zYr2TbB
	AxtE+Bc4njjd7/LtSHk43Jz+j+BpRSX6ZWj0H1AG0A9wnwnpqoZQgJs=
X-Gm-Gg: AYBFou2wBOIe2B2FOcLHlNjLtNz6fLBUigkTBA0L7bV9NT9p4aZ4aK3rvCsJy1/NCHF
	hK4Bygi9X7E/51tq1lyv1JeLGUth360NX5HLsfMhTCf4OzBuk5CMNkXcIVfi8rC3JfdJv9sj+EN
	1V/ch2Lhp8Q9AQRYvGjcazOfkMxtXtk6W1ro/3h80+a5XWQ6BqXCgXduAKV340HV+lDT0sV2TUb
	yvtIE9KWz+FGdbXKXQTfM8wrmx//KwpCaIagXj7GvWU0avDR/cIgCmrbt2r4xDTFb8KCb6KqWDg
	vYMO4jKlWhfrRLR8CN9iS4UE0dgkstPqrP9rjfNH/doHHNvDxc8RG4o7iaPQZJNMQ5ICEskJzLJ
	6kuG6RnzRZLLPwC+9OHNywFxjKMkH/MbXF3MWk2VAJYDwQRnDgsH91bSHU76WI6hhU/gqmvwJQ2
	RMikbKwbOUuvHTDvGiXJnIdNyhuAxnWlPL7jGk9XpD03PUysNRS3w0KTLI5t1PhrM0SxT4qdCQK
	1vuwgiZmwpaJzD/04YrwvQVSbm6IZjCCNzvS1r57BoehY6jlGmCrKZIGhkbwWa3gpP6kh79ZOTg
	bJaheWpxMgNTJYZZg+aPYATNwEUy
X-Received: by 2002:ac8:7f8c:0:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-5337427ea48mr112168181cf.10.1790877466953;
        Thu, 01 Oct 2026 10:57:46 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a9800dsm31853976d6.46.2026.10.01.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:57:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Shijie Qin <shijie.qin@nxp.com>
Subject: [PATCH v5 2/2] media: amphion: prevent unbind while video instances are open
Date: Thu,  1 Oct 2026 13:57:37 -0400
Message-ID: <20261001175737.4048254-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001175737.4048254-1-mhun512@gmail.com>
References: <20261001175737.4048254-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An open video instance holds a plain pointer to its devm-allocated core.
Unbinding the core or its parent through sysfs can release that memory
while the instance remains open. A later ioctl or close then uses the
stale pointer.

The video file operations pin the module, but sysfs unbind bypasses that
protection. Suppress manual bind and unbind for both platform drivers,
and warn if core removal ever encounters a live instance.

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_core.c | 3 +++
 drivers/media/platform/amphion/vpu_drv.c  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index a0c58ec97a42..2e8e08e05de7 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -696,6 +696,8 @@ static void vpu_core_remove(struct platform_device *pdev)
 	struct vpu_core *core = platform_get_drvdata(pdev);
 	int ret;
 
+	WARN_ON(!list_empty(&core->instances));
+
 	vpu_core_remove_dbgfs_file(core);
 	ret = pm_runtime_resume_and_get(dev);
 	WARN_ON(ret < 0);
@@ -846,6 +848,7 @@ static struct platform_driver amphion_vpu_core_driver = {
 	.remove = vpu_core_remove,
 	.driver = {
 		.name = "amphion-vpu-core",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_core_dt_match,
 		.pm = &vpu_core_pm_ops,
 	},
diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
index 2cca61f41bea..9c6f32c5eae9 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -205,6 +205,7 @@ static struct platform_driver amphion_vpu_driver = {
 	.remove = vpu_remove,
 	.driver = {
 		.name = "amphion-vpu",
+		.suppress_bind_attrs = true,
 		.of_match_table = vpu_dt_match,
 	},
 };
-- 
2.53.0

