Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81D2EB0F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789432733; cv=none; b=cOJGrU1T2eGTCjxbwuAkHG/IT5UIATon4a1Ncn/0OZawSdWjNWfOH866AlUF/+7qmQ7nKvO8Pa46bWfXJPtiNcfUmIRMYvjZPS6mACLOyIu3pwgQnRm9b/6c+tOvmYrRYVroDRR1DGQ+CsTwSDPEslo2Ccd7gtV5iKsZE2GQTTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789432733; c=relaxed/simple;
	bh=BuLaE65NQ9rrIR9C05ul8QhLWBqr+NJQ6N3lBPZiaD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0QcqdWAQprmkD1JwZsES/vYvNDzsENdv3sqXY1R4LXCe4PmpuR+qV6iwzPI4GAKXL5BuH2r8j53E4sw9TCIXXz6OMxV8NwiPn3dfLJYd57yyrr4Mu2rsEQp0EaqcrcobdMlwOZ0HkeE0z5C4/eOCh3ZlBrRvV94m4SyxabRvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3Lzl5Rb; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3Lzl5Rb"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-939fc329d35so233926885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789432731; x=1790037531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CB0/Ut2q4k6domqU+GFMH7n96krlT2PxA2EBOCoxQxI=;
        b=X3Lzl5RbOWkP8pFqklA7gOHwz56DPlU+3u2d0X64Aex/tgY8tAx7SP0vRIiuZYiC+v
         p+3EkQxOokW+Nzrsk5pWL4m9fw2XHrBvTib+Kj29sU1HAtsQWzv9ZKXB9CFM9CVcCuQ8
         GOFkIMPXKh6v4z3rPlAaiWWljqWq7zpQHFunE83NGzHTkkGrI/lGxJiBUN2kbQih6P6c
         3lrq3xH6VsVvU+O0wvC2nmJoPD2KR+ONkRU08oUzVpraZnV0+HpNIEUQdyYUFTQhtp6t
         hTGj6vKySZU2NTHdDJhzemgaiioMGmzw9i0wH7Q8pUJIX8QtPxGLUt5zsKd/GUxdL/P4
         Memg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789432731; x=1790037531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CB0/Ut2q4k6domqU+GFMH7n96krlT2PxA2EBOCoxQxI=;
        b=Q1yHDv3RdTSpNwNBW9siT8Or1dooc0MDsifwzj3okOxPMUOaeRnHiWnNasLbNgaAV5
         le0dFQplMXJUmHrVnEMCEc0LMef8LpLZdwEmHNq4+wBEzpaO167gh4yW2yaiaZlFMqIm
         /7zgxyiNJjrQ5xbea5Syixo4by/Y1CbgvnLoa1+09vZ0n9lbpAlTl9H6ZYKJvjsp33w1
         XVaEi6yEcJx/a4uk/tM7xwur1OnNlaUSqkvHT0PAKHypLV7vpQMCBJpJ3KZYcM7Hip+E
         qgB/jAGiNsgfmNA6OnozgrYXwcj05RNiVzWbTf7mqtfzMRvMXIKbUWpEOk2k4wJZCFrC
         HD3w==
X-Forwarded-Encrypted: i=1; AKwUvBzKDcCNbXbdvDwwVzefJ1aMk2+vJmDK7zFvyCy7pSJL0c7Yu53yGdgjAJYA7HDmZqzWdbqsK1+PtfG7z3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n1GJqtkRvfdplKzUblTTuQKrju0v/4ZASeayoMcoSI3mXR7yv/
	qHdb1LSPs958CaonLVEGhjEz8c1XehQXzxVyM/WTPGRVW/jwk3XwShM=
X-Gm-Gg: AYBFou1iGxjCUgaeJAAT6yS75fCqP5m1rAdiffwEwUTX0VfPp4cZOkmNAV0pIJDh4DP
	ooVw98fd/MQiLAuAR8wMXsQBYvYIsGe/SYXEZ4N3+tiTjQ71j5/j3BE2InJLkrAjgBBWpLSkRAJ
	XB2NWSj0QE02DJOELvhTzjjK8avG48zFY8Ffyk4NIVjWGLp2Kf2mKjt9A/KlhUcCZiKNcXuUzXP
	rslZbjO5/6k+LUidCfZMC4ZWTbIzXbPe0xJxQxLn2ZYOntVkXvU95xAltU/SCNiXwtO/LYjhI+D
	VGJVNvOQvpsIqwefKCchaU4lLPTxc2npiyDL27HSvt9UZjNT4l8IwUyvajqPvOq+C7SlFOstDyB
	PjxUtq+44Cife7RSRvWdK9MpwROkikd9ebBQZ92xbk1UzBpEHvUziFErSY9JQ8bpZiP+pMMOpJl
	Rwsnq0nm3N7unM/H7dtDjpSpn2L4PAmJAhBOjeSRs/+fwQYuVI9BwQhSwJJ7/sBUx3ap2+9ZeA4
	VDnEje+2VsiAlfp/GgjFdl3sDfY5VhFHleI0rT7TzKTl6uKGxCk2Lxqt5pWHHc5w+i+vNGl9dL1
	T9MQD28d0RvBw9G2TWauKVd06UdE57A0NT5TnQ6QsL1qWo03bGyZzNL0s0i0U/gDjPkms8NsqZr
	kxRFt
X-Received: by 2002:a05:620a:890e:b0:939:710:536c with SMTP id af79cd13be357-93a29a11d43mr657586485a.43.1789432726516;
        Mon, 14 Sep 2026 17:38:46 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a2db5f257sm247664885a.17.2026.09.14.17.38.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 17:38:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: gxt4500: Release WC setup on probe failure
Date: Mon, 14 Sep 2026 20:38:34 -0400
Message-ID: <20260915003834.49715-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gxt4500_probe() adds a write-combining range before allocating the cmap
and registering the framebuffer. If a later step fails, the range is
not released. Add the missing cleanup before unmapping the framebuffer,
matching the successful remove path.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 38fc4d45fae5 ("gxt4500: Use arch_phys_wc_* for framebuffer")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/video/fbdev/gxt4500.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -719,6 +719,7 @@ static int gxt4500_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
  err_free_cmap:
 	fb_dealloc_cmap(&info->cmap);
  err_unmap_all:
+	arch_phys_wc_del(par->wc_cookie);
 	iounmap(info->screen_base);
  err_unmap_regs:
 	iounmap(par->regs);
-- 
2.51.0
