Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180933;
	b=P5S+Wqv87Macb7JeLwI+Jj11UNjS+ZqY+wlW2h8xOVPNYOw1ow55+4muM7ITkBTA3zGj
	 DAOYqrDXBD03/n6jstwm67ITWyTwtaTPkufBDtRWA59PPeu7bUt6c1DGbOz2dg+n3OMYU
	 /XceRnVArokOqXTIW/av85EVYV3+aaE5tMtmDQX/GGr6d6Qtvd3nt/V/V6fyVjmoMB21p
	 gcZAPLNtv7z0cxNMyLbVdxajXe1UnjQnjsyVd4XU6awZS/zVi6vyhlU/fn3mClUEA2gq7
	 15mnY86irenhD9ChKhY2U0D7toYSjWn493JVZDvA1wFIEsS64znLa314oPcDNbJ9HyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OebIWyDu5H5QPYFaukkWYKptPQKpBLTLxWfsT6Qb+f0=;
	b=uRzCoJl4tUnJJd3DYr4Ydq6QCudsy17IdOZtXS9bKHfCwXlEqSQj5Lz3O0SMyQhCkg/D
	 rKwlzAuZwNCjHK4N1hYN193H7NmDjbaxLBmOn3s33ZH4UE8tylgDctr+Zra9CFhencVIe
	 BKvj20iM6kSBs5JRG2cwM6L0e2rTBXjZiN+1Ug/UxMAte0lnk3CwyGW6bUmIFlz9c3HAW
	 eDV3yzvG8gzXQuOBpyVncUw6R2OI7o8vu2SX8c8zzbKj5XPBpS8NvBmVKdEXJoRztvjVB
	 V1EbTkgXFnn6IxwspKjtMhM97+I1ZQnrT9ub9HNli2kXby7975BH9bc1meC4d3HfrWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tf0r9BbG;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D215606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D215606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tf0r9BbG
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so6454775e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180931; x=1793785731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OebIWyDu5H5QPYFaukkWYKptPQKpBLTLxWfsT6Qb+f0=;
        b=Tf0r9BbGY6oZUWx/Dy5LSoADIeHFJOdyzTeJHWx5PINEcMdtWc8HH4+0x2v3EoJ2s6
         FqjnLUu6uoBa5nDekNzdv1aFmTQ8DSpE3Md1ebx+qyIfCmohy8hhEAD4OurzkDr26HTo
         T2BvteiiudlmEUnGzZ0Vhf4HyNxH6AwOL8c/4j6K+LGk0gADKKaBshoZZVdil6BFY/jj
         YDINOuSlzcAjP2wG+XAhK6pkqB/fhsgr7GxJMgiqoUn9IZ3NswHa5uIaCqCu1UW0/1ba
         rP5W13M1jV029oNtFKJz34ZKEcYHG4RyIzqg7RN49xmnOTRNSVyU7o8PJeaKh2ezwOZM
         gsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180931; x=1793785731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OebIWyDu5H5QPYFaukkWYKptPQKpBLTLxWfsT6Qb+f0=;
        b=AlRTgD1GR5AnGz/vXZ6uBDxmAUTDGl6K8raR/l5MjhHA6ANfLp9ayXiFz5uAtQLoeE
         OeVLK4MlZMlVCAn5hVrcc4xbPNzZUYUir3NG4JqecGDWEfWs4FfBFlJOCvvgpZJHy980
         IsUow08/jYGDokiPbO02mh1erQhKIB0nYnJl/RsKuQFQ+az9fx5ZfibasjUlYQUwh43g
         ySVIbJboPPCG+LfQ+Hr5o5U+nEYLolun7Ap70XlZ+5ooVMiEOo0oIdfIy3LqnDQd7UjG
         /EsUZhAKjv1DdQxXrkBPjp7V5JA6TX1OIXpGlWs0pQ6FkDcI2qtMXGvUE4UP5Y1EFHsl
         ikkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyPrl0ILJJzzBxRoUOoPj3kBNO23k4yJcxsRgZOAiR40d5qjGw2Er+sc/2xP6HY4oRYCa31hMYsra9VOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHxb6c0XqDvkJq2Y8AD0XGSTi07LNw38/YUMjh+D8CchIo/QO0
	e9ZvSz/UYiC31URnzWhtrg75CQDXReXd7kwZde9gjblMRDus7u7A41i/3/3csP+oVUo=
X-Gm-Gg: AYBFou0U3bcMzZRCiIKvvBlorV7EK7Qj42pIXmfTiD5Ca+ba9vQxzPcV9yy8UyZGNT2
	P/sNEOHKQBNv5POw+aISJMvhIPvkpSUsdG7WJgZh8yDAfX9g/8S8vgaJUyvUqjXjVXKF5ZbrqlM
	2rZ3/2JROsxelXe0BWITZwaFOmvBDTDFcmFwsoansD2TcWnWgjUbDOSaHVeJecZ/SShPF8pyVxJ
	KbVRw2Gv0B0Tt9muItZBvK0LgtaZbuCY0S+K+pAJD9RfLEd0SBHN726jvu73lR5NptOInqQD6Wl
	DyBA+MVgifCM9jzXQ4ujRj7DHvpwXae2BO2+5YFZc93MU7vBlcM9qNzxo/7pCMdIQvQyBqWRBQH
	ut3WGwdJk9bsyvOaJRrCBqvlWJ0gij51qRGSLiNAZEEOIW7Mf0ADBw/axpDVlUSJUsyR+7vsWTi
	cAigbFos2xGo2K6sw+6vWBZ0uiZamXaPZW89dWI8miy5sOdQzysQAqR3uWNnsrZvXUPInskdpQc
	0VhQxpbxX0WxiPImpEVy/h/KEVmq1uJhP1+g2Y+vvxtRYuKYgohplEz6SC0g7RFzhOeMImvYqzv
	TIM1kVanfNUSU7K8qX0qK8E7n3y77fpuMdEVvbx6N5yR
X-Received: by 2002:a05:600c:848c:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4a966b4afc5mr40262095e9.20.1793180931151;
        Wed, 28 Oct 2026 02:48:51 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4115f496sm26408389f8f.5.2026.10.28.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:48:50 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] spmi: mtk-pmif: retain controllers for removal
Date: Wed, 28 Oct 2026 11:48:48 +0200
Message-ID: <20261028094847.764747-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

mtk_spmi_bus_probe() stores each controller in its private pmif_bus
rather than the parent arb->bus[] entry passed by the caller.
mtk_spmi_remove() checks the parent entries, so it skips registered
controllers and their IRQ and clock cleanup.

Record successfully initialized controllers in the parent array and
recover their private bus data when removing them.

Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

 drivers/spmi/spmi-mtk-pmif.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 833c2b30d09f..17c0f9ae977e 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -708,6 +708,7 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 			      struct pmif_bus *pbus)
 {
 	struct spmi_controller *ctrl;
+	struct pmif_bus *bus_slot = pbus;
 	int err, idx, bus_id, i;
 
 	if (pdata->num_spmi_buses > 1)
@@ -780,6 +781,7 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 	if (pbus->dom)
 		irq_set_chained_handler_and_data(pbus->irq, mtk_spmi_handle_chained_irq, pbus);
 
+	bus_slot->ctrl = ctrl;
 	return 0;
 
 err_remove_irq:
@@ -849,6 +851,7 @@ static void mtk_spmi_remove(struct platform_device *pdev)
 		if (!pbus->ctrl)
 			continue;
 
+		pbus = spmi_controller_get_drvdata(pbus->ctrl);
 		mtk_spmi_irq_remove(pbus);
 		spmi_controller_remove(pbus->ctrl);
 		clk_bulk_disable_unprepare(pbus->nclks, pbus->clks);

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

