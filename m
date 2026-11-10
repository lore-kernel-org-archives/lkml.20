Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279552;
	b=gIAA/Fro300fzWcxsGQVp4iz10gh2R4193e+DtqPnfF4Rq7Zx8RpJKcmW5UfB6ZCXwQ9
	 HCkYHTfyvdAUWQunqSf4d9ydEfR2p54pgQ6tvGqaTunS96oLHgdSXYFEOKdjh7EQmaw9o
	 DeKnmPZ5BKpcZdMNI3AlHzDY3bNJtYvEONBqgujSwP+Lz8DqZUP+9/b1oN7AbvFpdKEaW
	 pAd3tkgRnCV3palmmjjb51J9AO1poEOOdBslLxpKvdCW8rkTS4YKMPAHYEbzGKk/zvwTK
	 i/33ml9e5e88GsdadHyoiWwjgtjWYcJ3plDZMQPnvdpkp2phYkYr41Bx8Sn68nPOuxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
	b=vSZgLe8WbmYa9WyElDZhaEDQ2yAIp++bsGTkSukExOwFNoT7Yma5+RbLLitb3gayUXkH
	 M+GyEkQz8hqC+AVjlovyOHozORZqrAtmOfxPb4eBO37+QVjj1OAgOSp9hQtGU2C7maZdM
	 U48uKKIoMa+fbs2dBE0FAm7YpGJKHWjZ0eCGEVbi6B9734TdUPr/5nETR8XG+aj1wAoS2
	 KKpqsz5xUW1dk27mnTRh6v8whsyVf4vZOMpWXx21YtGl3SK7RH0ydVebzQ8FtJUVGc27U
	 2Iwa9SWW8GztQt4T112Ms+ceaSxXnj0hL62uAekFacMH4S2RQTVSYBwAxs7rjzz2MIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naWTOGU2;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BF5606C6C0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BF5606C6C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naWTOGU2
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53bb57f1310so17071281cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279551; x=1794884351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
        b=naWTOGU2gSjd6fPilXqbw+pukxzR5XvO6U4Mrjw4nk8Re85wpSrdZEuq0RNODlTjSU
         9f7MW/awKMO8QcHu0p7sRT7MJCha/AkkaYl4ZH78a5vNjaspLgHy00QJv3jb4ySbeO86
         BMRZU+Xed9gwxgfh9dHbCaq/dw0TqaW2lmEEyLBs4B3tHXSrKbNwdOFJcl0HL+q3Iymw
         Cz+mLQh+MyT1gPGHj59aGSf8cmpQEWJSwWSeoE3zq9mEqLEsKifZMS16ycm4SF6mcKou
         OmdYtb8iCEMjctoNJyuor4nsiclIuzog0qauuwHXqlMdKtWsV9hlc2cEHpZW1SgjLiFx
         jHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279551; x=1794884351;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
        b=ueIFQq1AFn/HfGdAsdG8NRRuT239gd9ecWJDhIWmEpSTrmxfUXeaccTjufjluiPhTD
         n+uZJGzXJQv5Syg1+ntV0tHz2I9d62Q8QCNlIrrdygVt7n1JcfWLLUSqApMczePkah0k
         61qiYmPouin/2rgzfB3nT1fIWiT6RPTw3YPtdGjovTQeq3odhPeddL7g4FBtudgLHHGv
         8SYc9QpI/Tj5GlHPSd2/5l1YC2idYr5wQUUCTlw5zrIZT4kv1tJuGZbvSk3SEm2DPlDM
         GKWe3GwynnS3AKLXQUsVYp53B8cO6dyfz1xj9ysT1XWQdUK18wY6Pp/7Acmma3I186ib
         jX6w==
X-Forwarded-Encrypted: i=1; AL+hErFJ0Yaapuo6cD6+uSbfuDz5dYzWTb9EwQekrFH1KklMQqOC7MgP8ciipnsaXNMyVOW3dFQkP+1/Nt1CvYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GZDAffbDHtYw/6Gv1HOczmzmHqb8m5/6l9vOwNTgIDGwf3vMP
	grED7olDZ+RwEz9neUxqGpb9bh22OLhhMIrN2FfUjwOoBvgHeBUduIg=
X-Gm-Gg: AYBFou2yc2MFpFDI8SWI3TjRWuHMljcmC06mZ5CR6ksGR+cl+Mve0AP8nPiqveRLKRu
	pGke9s0QvKPLpaYaDHxA7NLBVpH8QrsHxBtpa5PCrO8mlFzgbWXvCbPd/ft8dYuEY7XD3UX+9Ch
	sLdN+988PHN+TnD7brxd0hKm88peyEPz2fybv0nQ5KT0IElJ/bMipUUjTP7BZ1/ZtRwzXNAbnmo
	tb27BXkgWo2x9x0UXK/jRvjuELJsXY7yxRlQpGIHS2Md71LF4PVbeTOB7ENcbXR10zsZ+0AsE0f
	iPKASTjw7JGGIPnANLNKYt3oO5jQ8039Co3DOi7G3jzz2MQhQoAHlAVZNTwX7LhH6Wxj8dBEU3M
	CWlOqoJtvMi/t4khnhMAFCs5Qs8T0yJd1Epqvj6gVMy0I5enyx3R3ZbIgDZJKXzlYhvkHS+//Ih
	ehr+GxUixu64tY9KxfCzaSGsHTW0DJqDBTHtKrqf/thIkII2sb7MU6b1A7C9u4Vmx/mJcGIYKYB
	9UcMBLHVaSnkaHMUEGixACA7RoTTi5eUxttmokm/KATIKfETK1RIFRU4UexrQGowkWz7tryHzSv
	XJJdNn6H02/HainPBEaEhICwjSyzl1pdQOjQUe5+5qFMRMH238LF5PJnLmM2gHdTSfaynMd0c20
	fim2qXEFOtnnpjulZix8u2/Osrh4SwoCKaaFyD0LqlUry+sCr8dI9/c+UQbWfcEIyAt6n+ONW9R
	EAiupaOcDrKGE=
X-Received: by 2002:a05:622a:164a:b0:535:20cf:96a5 with SMTP id d75a77b69052e-55524dffe9fmr21124881cf.7.1794279551084;
        Mon, 09 Nov 2026 18:59:11 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm12601771cf.27.2026.11.09.18.59.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:59:09 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 2/2] media: rcar-isp: distinguish absent cores from probe failures
Date: Mon,  9 Nov 2026 21:59:05 -0500
Message-Id: <08f232218753608ed1a95744d6de14c70a3104b3.1794278853.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794278853.git.mhun512@gmail.com>
References: <cover.1794278853.git.mhun512@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

risp_probe() interprets -ENODEV as an absent optional core, but resource
setup also returns it for initialization failures and deferred probing.

Reserve -ENODEV for missing core MMIO or the renesas,vspx property.
Preserve clock/reset errors, defer until the referenced VSPX device
exists, and use -ENXIO for malformed VSPX data or failed RPPX1 creation.
Convert remaining resource -ENODEV errors to -ENXIO so the parent
rejects failed initialization instead of continuing with the channel
selector.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Suggested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v5:
- Regenerate for git send-email; no code changes from v4.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 14f3c8f3505..0a322014f3d 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -800,20 +800,20 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
-		return -ENODEV;
+		return PTR_ERR(core->clk);
 
 	core->rstc = devm_reset_control_get(&pdev->dev, "core");
 	if (IS_ERR(core->rstc))
-		return -ENODEV;
+		return PTR_ERR(core->rstc);
 
 	of_vspx = of_parse_phandle(pdev->dev.of_node, "renesas,vspx", 0);
 	if (!of_vspx)
-		return -ENODEV;
+		return -ENXIO;
 
 	vspx = of_find_device_by_node(of_vspx);
 	of_node_put(of_vspx);
 	if (!vspx)
-		return -ENODEV;
+		return -EPROBE_DEFER;
 
 	/* Attach to VSP-X */
 	core->vspx.dev = &vspx->dev;
@@ -840,7 +840,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	clk_disable_unprepare(core->clk);
 
 	if (!core->rpp) {
-		ret = -ENODEV;
+		ret = -ENXIO;
 		goto err_put_vspx;
 	}
 
@@ -860,10 +860,15 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	core->csrstc = csrstc;
 	core->csbase = csbase;
 
+	/* Keep channel-selector-only configurations working. */
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "core") ||
+	    !of_find_property(pdev->dev.of_node, "renesas,vspx", NULL))
+		return -ENODEV;
+
 	ret = risp_core_probe_resources(core, pdev);
 	if (ret) {
 		core->base = NULL;
-		return ret;
+		return ret == -ENODEV ? -ENXIO : ret;
 	}
 
 	ret = v4l2_device_register(core->dev, &core->v4l2_dev);
