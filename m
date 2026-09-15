Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE42E737D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433573; cv=none; b=Vb1O2M8bW/aKLpvTbOkeLKudNpNzuUTYuNF4znas40H+GRq92qniguiwFe/ysocTG/U7/c1l4M1ZOgsM/8fcINepp4+XCdSJP08+prv5WoWKWuwBvwE4xKLcxtqiIYucy2nGf7Bi1kxgYCz9C1+Ug0z4/MqPTyU1+JG4mjSpxRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433573; c=relaxed/simple;
	bh=E99Dz8Xkzhhbw+xuuQIQ9G+/9ex1yfLS64o2aGg11Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CBwAdAdUnd+EsnwBatqeAUKsJaroNWtP6O18I1Qjrq8lcnMj8XFG3xsj4KWaRwXsIsYmUTnZpVfYjvgocpJoxk3dMQwTNfO6CzDRqQw/RTeQ6Ap1WzZx6qEzdoqy4DqyNpkzv6B/kLL+ZPD5mWk8WnTEszBqfiq6dyoVjukpKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1CTYEDm; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1CTYEDm"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ad20d4so332041485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789433571; x=1790038371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3FqhYN8GqnOvyCCd51Tqy0N6wSmRpiZ4v7QBDM0Zgas=;
        b=F1CTYEDmcTExQNcdaz3vsmywKGilJoxn78ItFjbED8LVZnB/4daP0tpTU0Bt/2Yi49
         xvk7Hca0PAt8yv6cMTjSEHKNBHzcHlMEnRF7L2vel0P4e965YE7lKB2mDYs5Ij7ZgAs1
         +BcQOK0Jr6yfZruAEyKQqdUMXIrY0n5Hii9yc13N6Px/BCvZHBrQG6xKRSxf6DGyUvIw
         0dS9yFjlmSIu7lmpV24v68MNTi4iRBAVc0qbT9EvtxnRJlC/SazFqk7RxYdOBzb5haFp
         DH9nrawo//d3JIT2Gbf9L/raZa8jKkrydYO2yAQHCjvYcP3b3rGLSGedcpr5ld+SbDVS
         /40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789433571; x=1790038371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FqhYN8GqnOvyCCd51Tqy0N6wSmRpiZ4v7QBDM0Zgas=;
        b=uOCHuiDDhjPsXsaB0H/7OZk20GwjAv1SXsrYkMrtLcPLjtYsJuzuwQLlAw8HTsnutt
         CHB0yu6c69fUnjJninkzhqtyTirNd4USwapwfM8okmLd7Vg7IYQUhWDqRyxpjf5yfG6Z
         Tp7ME84x4h1olDvRbNHJ+/pu23pQEULvmYMQAW9BbSeU8orum+UEUO+C/MEeOMi9bLyL
         go73kkllX+r5hiJaKuDKADCeruVOOVFacapQS2oT5PgF5qqdM/sb0eGJoGD/a3QJDjqh
         0azb5Hc6QOOLxlQmDZuy9t8JxNTewmF4OentmKLx/h1gMsqJR+t7gbhx5uBcziuaR5VP
         3PyA==
X-Forwarded-Encrypted: i=1; AKwUvBy+o0aS15T/y0xHTugFDQaCYfbAw5z/ESAFP/bl9/hrak0EqhhTJYafGqon62OJzEjwF+vjcRZb72QgAcI=@vger.kernel.org
X-Gm-Message-State: AFuF++l/PJ6m2+Rgyi7ERPIh1iK0D5eLOa08CogCbpL7QtEu1nYLbEFK
	TmuLtbTi1JDFsYfp48Q/O0hFksds3h9GkNtqGT/PNY2PNj8r4I2/Fxk=
X-Gm-Gg: AYBFou0WJJfELvmm7f0/2LWauch12Mixp8VjpirkTsL8c8RH5qkenlqB6CwJtRK3+MJ
	++kt9I53291551YT+PhD6nu6qjh5XOD24kywBeRYKng7eOHwhVoLvlbvzqDfxdvN8B9hhoz9+FI
	NRtOQuOfTH6trVh3lP6RGr4YdzqLb83IqCQQ8xyU+y6vLYO7BjsP/3/X/C6kV2Y6g2WgEmWK6Wg
	dmsszymFdFGPHeKaNgQ6cqcQ0ZR9IOmJ07LhJOG5krOx+A8UDC84gn+zLWVldlD6KuE/Ss2xcgE
	7ZWHZ05TIOHB8y5tE0Lu4rQ4Pmqx/QUnuPkg4zEA6BWzGMYp44/mvmhnXfVAkgXYSjsURQIYKXO
	tfGszhgZ8vKuCqY1DEgPspMDNWgqYGuv7FoLadur0VziPWjl2VgdWJ55Cr0Xq3ozNBO8mNsqa3O
	VKqwp4dfBDBfzA57QATso/5hqiIGkmVR64n7d0Z0GCLrR9mVzNW5MuMkv2sAf1PJp/mI7pU5/i+
	7yUZPkoYVQOAExiej2jpgaNVTQ5ysJ8F1WulHVC/aovVsS6zHBWzOzu7TB2SOlm5HbLJ4bUokvx
	df2n+2W0oLozu8VHxOlhGWOsCw7KTmxG+SORgSCZodJyq+PIGcNe8EFTIIIKT0Oq
X-Received: by 2002:a05:620a:468c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a29bbcd86mr667300585a.46.1789433571426;
        Mon, 14 Sep 2026 17:52:51 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ecea9f35sm1063205785a.7.2026.09.14.17.52.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 17:52:50 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fbdev: kyro: Release WC setup on registration failure
Date: Mon, 14 Sep 2026 20:52:43 -0400
Message-ID: <20260915005243.51683-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If register_framebuffer() fails, kyrofb_probe() frees the framebuffer
without releasing its write-combining range. Release the range before
freeing the framebuffer. Earlier failures still skip this cleanup.

The missing cleanup already exists in the initial Git import, before
the conversion from mtrr_add() to arch_phys_wc_add().

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/video/fbdev/kyro/fbdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -759,7 +759,7 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	fb_memset_io(info->screen_base, 0, size);
 
 	if (register_framebuffer(info) < 0)
-		goto out_free_fb;
+		goto out_free_wc;
 
 	fb_info(info, "%s frame buffer device, at %dx%d@%d using %ldk/%ldk of VRAM\n",
 		info->fix.id,
@@ -776,6 +776,8 @@ static int kyrofb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	return 0;
 
+out_free_wc:
+	arch_phys_wc_del(currentpar->wc_cookie);
 out_free_fb:
 	framebuffer_release(info);
 
-- 
2.51.0
