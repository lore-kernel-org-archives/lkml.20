Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396782;
	b=MERCIJ+JZ2/K3xMwqBlF+3oP0BhIlocyEHEbLp0DnTfaDj29wdZFqB6Fk8pZhVf+1YKA
	 8FI8NbNMlSHBh8ZFnw2X4KLxtOtvRPe8ja4T1+CySro/Jv9UyVLNFNlZqi6/YETaP699m
	 SYwe91Uq83sIMzZoQ4rqEndhVtuZpoQ8zFteRnKhavCbseluzZjiyk4Ifqd6Pcsa+UDjO
	 RsiqxoqOjZnqLiaUjURvwwpPOph1ztU+pjWsn/5/cccAJMjpHm2+Oy37XC0sBP9JAMETW
	 zH2aYhmiUjNCbCSXSO+yrumh6vE6uXn6L0XEmK0FNApTdtB7I2z35oTGjuJhtkzUyLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iCl816dJjsFMtzXM34P9Bj/aT+Q38xCsbIh0P58fbE4=;
	b=1eOc4yCUoWpvMUmLaHpDnuns9TMAWCeGoIWoPsVMRZfPxxHaZmxaXOlCojNQPBuLMfxE
	 gCJrX6N/vKG3F3gpSeKqwA/WMhGPNHa+z1iyhb2BqJQbhHrum5s+fOBk2qw9zM7muEbJx
	 pU0nwyCkNbWJx05gbTcPhPrf9YU7Zt4j6cYcvA2GCwINT5FrDOm2zl+L7hOUqLGgXXOFg
	 EY8j6b5ikXZQoHR2rW81lVjPHPStyy6ww+hC1hKdptXzOhS8a5+KJtiVMcNTxkzMj+uPu
	 SIbc9Q9XONvWieH1LpkrP2zfzejvbyiOl7vtOKTZXdXlaxfbLgm4JmEE0MdmgVmmNuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSpjBAa3;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A4E2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSpjBAa3
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so22629655e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396781; x=1795001581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCl816dJjsFMtzXM34P9Bj/aT+Q38xCsbIh0P58fbE4=;
        b=DSpjBAa3fHgs5xi6TYeBkieQIBksFiFWXzU1BAwPYTdAavDx7l9vzIKN4wcOfJ3got
         K+aKHIEvDj4wB++gAH/BNC9bfSADGedR8M+CaxpF1B41UEbuLyWxgyuNzBZj3q4hclf9
         mB+H3+O0yLkRQNtchJTzvRckAIhYM/PVhDIdeC3LJjtRIrsCBdkdsKvtzCfdrMMLSUSJ
         epjLGvKKbkTqO+L+iNCKZiZTOUX2veLsfeXsPYUTtk9pOb4wrZY8NlDhuYpEGIPc+1ry
         imJKI5XeHKMPBZJziUut4GWUH9OLoVvHOIKPevcZycDpIUErfm+vx8kwd3/5uPppMOoq
         /aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396781; x=1795001581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCl816dJjsFMtzXM34P9Bj/aT+Q38xCsbIh0P58fbE4=;
        b=c1EoYMXXu/SyhMFaBe/h3hjFZKkiKcD/Ciz2559en9I9xEgq5GwdT5AaH5sQU2P6Nu
         PMA3AxDqx/Hzj11kC3lWQK8FdR1HsbT32BldJbQ/98cleqR98N3W7SKyURzjyMBfR1oC
         +1EjpGZVPYtSzTFIYJuefhiaqdTlqol8o4nr+u5i65eo55510HDdEDrjbl2viA7/uCaf
         OE5EnqGVPSCwfoiYcjIpwEgYNQRP4EF7BRavWF04bZMg5bXnl5suBDe/NqvGOcraKlrU
         47UOMbEl07ZsicY/w97t3DRurVnQeupFsffX965w8tkojM9/EjZH3xTr9e75xDvynQ+Y
         BAdQ==
X-Forwarded-Encrypted: i=1; AL+hErF90jOrJqIoKgDmxSUyyAYCGtwX3LfigwW6VjAlhFUfW71z7Amq+wmuaM3siVuWqito9ljzsjn46QkrxqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mAtZdliyPyA9PicvWcpSGLIzxdtktMMPF7gHIuoMdD3fVw6Jg
	3wmFYja4KVx3Vb6/xgp1xyzwqN+4gTRA7HUBdMUXvhusf0O35Jfoz3Dl
X-Gm-Gg: AYBFou2l4s/33RGZf6qDYFcDDAUH0hxsJrFh7g8Jb5WfSodpNHorAlcURlz9GZpdEOl
	CFkm9SCJvyr3pY+A9QhvZ9Jk9UGrqHtW7Khj/Gfi3sRhrkQxtMrwhg/kxJdukY8L7BrCjwfWlir
	d1L448M0EacUxDaCpx5/wxjDv6EhDa+ErQkjIew+Q4hKZLX1494Y5XBUP0u39SjT0wsHIVvIyNm
	tTk4kr/qXt+1BoQIh2OYYwgE2TwseAqH81I8R4N2BEjq6bqtMpS7bAsyS36T44Q6l9lhmn/1n7a
	PT/SQNeVWpWVDA6GBt/MZ3TR8XXODEGJZcyxp50PWVWBySaRoBrfoJZghBANeL8f59SrqTdK99j
	EsPxlB4sWQcVn5tD+ML9iO5z06im8L6Mchc62EJEEaVBly/OhWXeeEORpqP0xSlkzu8WJ8VxXJV
	u21wdxqPkZC6cjzIPwVmEPMIAAcQic0CZx9t12OMsdED0yL/8SYlnAkH7/6vA53YzGBZrImv2Jc
	aySNQ2WqWSjcqBvUY4gHByQr6xqYX1bUU1Aecmpq9JWqrdQ4vGQf9yWqsCf/LfJ+giHpfJcBQi6
	RJejZdwLJUuSsHSdwIP6gZokTZ82r92wxtJkygM1h3WZjw7Eur1maES8OlJhIf5ZRgJFB2IujVk
	3XKDnM2oFY29KWtOU8N0NsAbTMYpugyQWTxLCZvWrnTmnisp+cLNPEBEjj7/wm9A925kKY9cluo
	I0TZNToh7f
X-Received: by 2002:a05:600c:83cf:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ba0935cc7fmr37812795e9.11.1794396780617;
        Wed, 11 Nov 2026 03:33:00 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm159274795e9.9.2026.11.11.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:33:00 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4] drm: renesas: rzg2l_mipi_dsi: Remove redundant driver data assignment
Date: Wed, 11 Nov 2026 11:32:59 +0000
Message-ID: <20261111113259.3334619-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

From: John Madieu <john.madieu.xa@bp.renesas.com>

rzg2l_mipi_dsi_probe() calls platform_set_drvdata() twice with the same
arguments: once immediately after devm_drm_bridge_alloc() succeeds and
again after the DCS buffer has been allocated.

Drop the first call and keep the second one, as it is closer to where the
platform data is actually used.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
 - Updated commit message
 - Dropped the first driver data assignment in rzg2l_mipi_dsi_probe()
 v3: https://lore.kernel.org/all/20261110114622.229608-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
 v2: https://lore.kernel.org/all/20260501080818.955914-1-john.madieu.xa@bp.renesas.com/
 v1: https://lore.kernel.org/all/20260425022857.2382603-1-john.madieu.xa@bp.renesas.com/
 ---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5b257f5adf06..65f26f889a67 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -1532,7 +1532,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi))
 		return PTR_ERR(dsi);
 
-	platform_set_drvdata(pdev, dsi);
 	dsi->dev = &pdev->dev;
 
 	dsi->info = of_device_get_match_data(&pdev->dev);
-- 
2.56.1

