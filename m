Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793503665;
	b=sXRbjtRr4wJKqHHNeiy7PDPvVCe0ZHjE/DkaGFQSJBUssD5KHRuy+mTOmAm/+QYCoOJr
	 Pce6zkYGZHaj14EBTp2dIaFJhnGSKxBuPinK9SZvEaoYQJPdybsevEPkYfhvIei/z7HnH
	 FV+sq0y0FZjR8Fw0v2RLxsMt+BK5AdxV4ZJE8vurW9l95L5xFyD0GBM3WggR8GS5fq3Ww
	 Afr3vTqfEp7hiwt/KqXzEX8OrVdhNkETLlMPOsaXjwn5Nc0bKsy3RKNQanmWVeT/u79Jn
	 tqeWzlbs8+9MlcvbolGXj0VypD3tL6n5QYCr7/Mwg7ZGjcsKQ4FUkbJ1K2XvXLAB4Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793503665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uZ1wu6PLqXMmPV5e2kmvwPP60bjqKeA1CATvShGwVGc=;
	b=xzr9n5FtUBxUrxulaq5LeuerzERO8VMqtjl0bfNDCJ3mPPnyRsTeHJgAMIqQTf9mt2zl
	 EIa57HaRTLsB+6YvBp1PvjkFiAE+ud6nAyG5wgmyu4fCfMPGWS9qfMNLCRsccqJy+Vjc9
	 GDsMADYsIvdRYIyr6yeWO9L8LipFPyuCqyqwLUsRJF8azYVr5BsZYTU8E6UrTMFobsAr9
	 i80EP1tCkqoXQ8ZarKUl0HUAd/5zPnbi6VwCUpZ9aZkgS/w3miNKttqZuvGtco2Hz6jJK
	 RqLzPCpjY86l6JzuUtIxZqg3tjLh/iUvXOu4mWe/0nQj2eAX1pXZalYtsuLgRBaFEQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vqf2VsPT;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7236A606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7236A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vqf2VsPT
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369f33df08eso3882612eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793503664; x=1794108464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZ1wu6PLqXMmPV5e2kmvwPP60bjqKeA1CATvShGwVGc=;
        b=Vqf2VsPTryjfqcApB1CtGtqwisj0Jp8hohbZU0ydTOtBvVJKpTgxgGGwiXlGih1cxL
         JwIIbz6yuDe5COEA/uPpkeu1JCja40Y+njZDR2lzcO4kbH7oZ/87kdIC+W2U/CKSFc0F
         Db8W98jyDjjav5dCDZ2ZNd6InA4YRwydV+pQd1lP4UssmQ8aZCbGNJWFuj776gbpVyb+
         YSU6FguiwkGBrDHYiiU4YayTxwqElZPYNeKz1FWZLxqc0kXFs5BzN8mgsPjDU/XRJoWD
         nmMvxNWlISzbggsxFw1MLA9of8wQe9YGyaUs1GgaDL30a8eBA2WDqdoCpvJTaHUOD57k
         sDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793503664; x=1794108464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZ1wu6PLqXMmPV5e2kmvwPP60bjqKeA1CATvShGwVGc=;
        b=GeGneprBof+83aVBgnl5PYDDQa5NYbdaC4dVBbN3n21YT4hzNR3YuWDS3WU5E59P8L
         LHK+SmK4vqHZCLveOm5P1sPACSgPaHsmdgbRYr+MtOxZa7Wf0SIpNu2qT2fBeVJCwzmy
         /whrENYV6rtM48NFFB7Rp3j7O6PUSmbWnadLvYegTgOKIBIv4XFtpeAs1hwkhsK5edM2
         Dcl2mpYn4GXk4MVqiig0Ly1dxse2lP1JqEGcq8J5cix+Os0UEcnGSgZh1dP/0Q9y5Ypm
         23jYyfGjKvqV5bNZO+P65LZgfAfbdPalr/OA9s53uywS/vi9FT357iigSb8mTT6dU0b5
         y7CA==
X-Forwarded-Encrypted: i=1; AKwUvBwjwPHChcShLP9vaI4VWjKYQiL6KUYank7OnJcV/37H0kflEOSeSbqTux5McwOYJEI17jR+8ISfKReFMjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z807BabXWYcvM/ueOZL2wJcVASn9vsWF/RHLtEQ/iFz2hVx7G+H
	oB3B+iclTixgxuxbMQ7g3tL07UpI37z3wWABkIowziptyFsFcTSSQSPc5wtz964q
X-Gm-Gg: AYBFou2w6GDNOw2OITGBVs5WGz1nGllNTmn+67zCSo4AT9QpB/tJmxQDy0Pj/hpQgYO
	ko0v++SFmrDCY3esTLdUW4ZwhQcstYnLHhmn2CvoyS+pXi8R2Cd3RWH6dT8semmAf4DElZ5AyYd
	csxA9Mh5JzuYjjjnWTXFHdjLx5SMfevh6xA2O7LbT5++5CSXBRd7d6UYRhg7jaghdn4v2KfIHOz
	6KzxXLbzZ9+zkByjfEyFPMLnsZESepZ9BgEzAgAom0cZ9RJIlz+tJiylhkjqnlfY0NraMh8ztcc
	bCmvG20rFwxVJe9swYSEwYGMzGuMqgl9f69O/VZpWrNEfr20f0B2OpYcKPnmTMIntRG6EY+v888
	vk33kKDeFu7gHP/P+RVp4R3dhn7YLcWeihLuISxiZschi0MGM2mpDPzuygd0/kM9qHEDLmdLlPW
	GDuSVGFxDWUPn3dDd3S9nDaf4190Rd5Drm+D3ZvW9Jffs8HC0LRDsxx0VBcj43xCcrAI+5jFcXO
	f3F6dSDKAwTWZc0DQrTqSEAxYUF6tAp89AhHImOs9TcMi4+aTSoCkLwk/A9EO+VTI85c0neVY64
	lFlsptRuWVC3qHtruQht+pRcHDqN3MKqd920PS0sNIcg8E9An6CucXrPRZEQOrkMpIqJ493mUE/
	DyWYeaNf38pu0UJEd1wxujU02a9Eby8vWQjmQmAlV7w8/bCFs034pH/UVGTiaFQs1DEbXtlKEjt
	/A0Rw=
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr8889110eec.30.1793503664340;
        Sat, 31 Oct 2026 20:27:44 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm31034735eec.16.2026.10.31.20.27.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 20:27:43 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vkms: clear config->dev when vkms_create() fails
Date: Sun,  1 Nov 2026 13:27:28 +1000
Message-ID: <20261101032728.11422-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vkms_create() stores the new device in config->dev right after
devm_drm_dev_alloc(), but the error path frees the device through
devres_release_group() and faux_device_destroy() without clearing the
pointer. The configfs "enabled" store returns the error without marking
the device as enabled, so the next "enabled" write runs
vkms_config_is_valid() again, which uses config->dev to print its
diagnostics and dereferences the freed drm_device.

Clear config->dev on the error path, as vkms_destroy() does.

Fixes: 13fc9b9745cc ("drm/vkms: Add and remove VKMS instances via configfs")
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5a640b5..ecc2e47 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -215,6 +215,7 @@ int vkms_create(struct vkms_config *config)
 
 out_devres:
 	devres_release_group(&fdev->dev, NULL);
+	config->dev = NULL;
 out_unregister:
 	faux_device_destroy(fdev);
 	return ret;
-- 
2.43.0

