Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45358246BCD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789099396; cv=none; b=uOsMJnu5KJ/eICxsrCyTDxSUd07Yswt+NIJegWOkfgHSfee+Wfl2NFshFcWlqhbWE7DKDvudgX7+ziRm6NuzIL2Jhv9bPU+E7CBQYTGGxgEnOS/YBwAqsH8tRI+nd/51BkcHKqFG8OD4CEVW8bY0r9+BCqnGJNaYJYIhDVAvo9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789099396; c=relaxed/simple;
	bh=OIgLDadHm6v3Hhfp+LeVPKY+DdMyNj+RWmDObrAfsfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ids23Vx67+8n8opo12W3Pgiu0ZWA/xtBl10Bw2d/aXj8Am8j23LN+/Q+GXBGEijClhdlMCeWL/bwvEP3wkvwg48OW7K4PWf1YBA2IKFXVY0l0tEEW4mOBu175yL3FF0xWFXsIUUTzewxqRTf95UCRSWq3jh+JMjd1VcmPQUqPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ql3etVol; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ql3etVol"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eefae4so1018645ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789099395; x=1789704195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMNMLyka/PxRqW+FEjSX/JhUiPb37rME7mEkb0i98KI=;
        b=ql3etVolrH49pB+DaUji8O5wrQ7ZYcxX0M4OAsmr8ZpYvHTVSalzkNFA+hV30eUClo
         YBaZcY9fiTnZxmgaWq1uJSrHLtQ5RGj4sw12dZ6H9RZ0h2WPJ0BMFwTIq2dvZ0WOKRIs
         mpUbsgDw/McnJk4h/t4LoBqo2rBpNrVpGY5kT2kldPhDjEw7AlzFBISNp0UcOdzO2tQX
         /7nmYrd6puNRtnEHZ1N8gVbXJbinswg8Nmjv+XMFi2DxTX8sdbI6gJcuUw7z4D4es3OJ
         H1saLAKVyz70m9h9oCi0wHlg0KC+utF68FRoyBLfyCoxFbAmiy7WlT5jSEhZnzyGsQOB
         4xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789099395; x=1789704195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMNMLyka/PxRqW+FEjSX/JhUiPb37rME7mEkb0i98KI=;
        b=D9WuEkdB8rDjZ/5jcamRuTigCbGEzdx/ctecdDY/YA016YRdZHIouOrShcdMqgOvK1
         rqV1l9Gct8bWIY9wfuL5h0XVhaffsEqWapBatb/QzOFy6HiZnMgrtoHIuAB3ikNDXoyB
         9F+xOS9YAHtMJQXWxvZOfjN3p8GXh8qo33sgOn6LbeMoIvPM3slp3z/UJJiPudKV1Lq7
         hjOLjPo9FpC6jxryJeVedxoqY2T3t4VMkISNeUOYAyPbJ76G18hNwNpNEGZCJZszIog7
         dEcrYuy69gPXfakzBRNXmAeaLJdCuviWictdRwn903EvhsPHwqvBbYB5wO5tOhOVGJQs
         t6hg==
X-Forwarded-Encrypted: i=1; AKwUvBwveD03ooESq0ELMT6FkMiLQc4tvhSe+79nZqPg+rkuKUrPUjjfqfwSfQUGexN45nxLxtecTYrYiUlwuQc=@vger.kernel.org
X-Gm-Message-State: AFuF++kZoKvitrLmOGDaIDaqOHL6oH+zFKGkWs4pNzUBsTi4GsiUkmfg
	0pntZAk4qM57TpQL1mA0YaP5tednYyau/0hkHwmd5jJWWFDF+MlrtClNaX7vTg==
X-Gm-Gg: AYBFou20O3Bl1f7E0OrVeJqgHbHyf379WEBrTWdHcRzMVDS8Ay/LmccSJk+sA3Y1r+e
	29xsmi5+yvkMLtua7zS8wOxM71ho+yK2srK7qj3UxKzPjSd4owsLPVG5VIr5PP2iXYubIEUWAcZ
	0x/TRZ28YVidl6AUymaPEvy+dmL2OH0w+ObvNuPzAP8duiB3H0ns4AESxrDWEGpgiU8iq9PWzMJ
	vvDCcgnLgcX3jOXes5d8s1fSzLCl0i+alT/3ieHsOHwqDeAvzOKnwhI7hOLCizdYTvdYCruxE3/
	AHOFLr28rTOnSqbwE9/AnoWeAHtKN7zK5BVQSq6ZGURM7KCn1+OxCj+6aCgxUuzq5WHpV70UjMp
	ISF9pR8sTQLgN/wNItinjn+UNbH/A3UOlwHujb+cxhY973YMYQbSXCksWWyOJgYPObacofht2dk
	eIQbUyuoAUbgjqRqksUn6mGq2y7aHq5fzJDBNO/T2yiTWLhg8n4tG0zSIU+XhxG/N+NX025n/uC
	0P8bT0Vj1BrcnoDK5ASgjxWareFgC6YvMuGMufeQ3FCRQRTQ6IDPPY7wy18YkeyWSATpgIPmzCx
	wgvneoCgpKqEMiih+b93JaiPK0k=
X-Received: by 2002:a17:902:ecca:b0:2d8:d4cf:fe49 with SMTP id d9443c01a7336-2dd2a4550bcmr29793865ad.15.1789099394759;
        Thu, 10 Sep 2026 21:03:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm4670925ad.48.2026.09.10.21.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:03:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v6 2/2] net: fec: Handle optional IRQ lookup errors correctly
Date: Fri, 11 Sep 2026 11:00:21 +0700
Message-ID: <20260911040021.12289-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911040021.12289-1-phucduc.bui@gmail.com>
References: <20260911040021.12289-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Handle errors from platform_get_irq_byname_optional() explicitly while
preserving the existing fallback to platform_get_irq() when the named IRQ
is not available.

Propagate errors other than -ENXIO from the optional IRQ lookup instead
of silently falling back to the indexed IRQ lookup.

In particular, silently ignoring -EPROBE_DEFER can cause the driver to
continue probing instead of deferring as required.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index c6e29b5c2abb..f7636f23d1eb 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5397,12 +5397,17 @@ fec_probe(struct platform_device *pdev)
 	for (i = 0; i < irq_cnt; i++) {
 		snprintf(irq_name, sizeof(irq_name), "int%d", i);
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq < 0)
-			irq = platform_get_irq(pdev, i);
-		if (irq < 0) {
+		if (irq < 0 && irq != -ENXIO) {
 			ret = irq;
 			goto failed_irq;
 		}
+		if (irq == -ENXIO) {
+			irq = platform_get_irq(pdev, i);
+			if (irq < 0) {
+				ret = irq;
+				goto failed_irq;
+			}
+		}
 		ret = devm_request_irq(&pdev->dev, irq, fec_enet_interrupt,
 				       0, pdev->name, ndev);
 		if (ret)
-- 
2.43.0

