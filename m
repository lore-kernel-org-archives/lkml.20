Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCD13DD85F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790416784; cv=none; b=ZDrmHQIWCBoEBei+vX979iSSiwCps2Pt8tULLcvpZxqOSW4pN0u1kyaTvemdDqvzm83C5kin4sKAqDK/4kEF5kABEquJ3G3iaVTi1c6V+VBDrxWSaIAScQEWKR4W54vABSGIO22Nb+9Ki9XUwXkx6pJoXnbYHbKvczq0fIuZ060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790416784; c=relaxed/simple;
	bh=9ZZ+x5hkD/0mxZXJpd66ErYLDuF7UKdZxcRaCMgFe+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fTZ/2/WjtK+dljEP/hcV+QATKrh4+IMyaJDrbuvxKYyrCT4FblyWNuH9Rm2Ntk1RKrCFv9Ic/D1Zd8WLLPA5LPgtSa+3H5q1K9pIUwGV4M6nMNoef6aAFWO9JxT4BEMcaf6pioxEQfXVwqPv+Fp77MzFQBucoCTKGTG00/MpisA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAcQXAFT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAcQXAFT"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso1117192a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790416782; x=1791021582; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kUiyvyXhITScv6LZw2RrZkQ+8/ZN40BHdOZkzQnRKMo=;
        b=JAcQXAFTHCpeAKPZOkXYY9JMAUHuN82T8hqCcbla4DEoRIZotLtKIoSIxPxJflHuam
         GwMsgVVGMT0HHoKk91LFylQ2bwTet+pBUVFHAaV37dtclhUrITWNdpRCY6i8ZAcj7lQ9
         J5bfpt7Wh2AcQcdqX5XhzW4tfr8pvKow9S29kCkUy91DFffkVU/P8yWKs4rJs4ECR9h2
         +2OtFrB21hnxpS5zwgci519LTTbM/RsmGEmjYgxBLJIRffpJKrFmYMNzBs98EyiHQIbj
         D00HC5BaeHPDb0hb7fjNXm3iBugVBzAMCsymtIPcrHm7ku67TgLY3zGc3p9J9oLhEHNH
         CxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416782; x=1791021582;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kUiyvyXhITScv6LZw2RrZkQ+8/ZN40BHdOZkzQnRKMo=;
        b=VXSsnqb56mIKLOurbf7H8prH0CkF38jAj+HQy3csxS94K+l/5Hc74DNFSvTKPkMEFY
         et4yw3juwdMbrVCzowda1kCDXV+7HshDT+2O43r4Xc9AYFlpULB4kS1sGB8+nXnJKyyu
         SJEvyipyZIEYPZapWp+9T+aFyzxBQt6BP6FJPQgL03lJ5pkSDpHd7RwtyreDasRKVnv/
         fHx/aouj/8MxusBkQ1q5ywHE+udr+EJI5VZy9hkK2Vym6lVUv7qCFyps7wbh2+g7/fcp
         PhSD6ufHKtB3lOatUIMSwbPNZ7q8CHFaTgk7zZHMG87ly3UxHFhEiqKjtRBAav3FlcXZ
         jilg==
X-Forwarded-Encrypted: i=1; AKwUvBz8krwAB1A18pcioZBM5/k6QCzJv4mSyuYMUjpbnUlOr4RWTouy8PWrjdiiz8ziAd3wzJNODwAnFkJVkWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFxAUWNpMG+X84Fr0lTYzZPY1AkFP55lkDD4Qe9owp7y6MLLWj
	qFyi58AdZVmyozRlFos4zQELxuNG+ex451vCvGhScjTwZlHQIMSAWnBD
X-Gm-Gg: AYBFou1fY3jPJshmg8+agyI5DqBMymSvjtz1ApGzGhSxjtgt/0WQPs7SOXEEFKbJpxw
	cLzhGm8cuL7wvyQWUa7xI5UVveNOzeNDaGIO6AH3ecVWBE3bJKhep9hluWbYsNCi4rAvv3ThKWi
	54sEjYkMGCd2ewb6qpncHJXLidcIgHMSXwzrMuxCI1P01+2YeDkyAraN6/S/c+SeRSBFp1kUG9T
	/NGlzyy+zjFbNRI1PWNpC7wKObUQQ7pisv2nl3TvprZHyB1oguG0ABmBbuxMSAwNwA6Y31bGFlV
	BtMh76Onds/OCkZ/UsrhRRtUSvWXbbtQuojTY4BO3T0znTUcWTtlDt2RnjBlYQG8ojk5xSj09eo
	Zc2Rji4U14jmI1jvSflPp38ifAP6fVWUPAgwKCT0xguZmq+G86A2KqMc8NUmr7KRdb2MCLZvZGT
	BW/jADBwSiSgv/tZL7vmnGqhs+PIX0wvJrKmNd6RVT5PU7Yub2HRJg0okkKy6+PrmohVsyNmAv+
	N3ggo2/4w==
X-Received: by 2002:a17:90b:4a45:b0:39e:1633:d29e with SMTP id 98e67ed59e1d1-3a098d43634mr7056631a91.5.1790416782257;
        Sat, 26 Sep 2026 02:59:42 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f7:25d7::3c5:1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09766210bsm15033663a91.8.2026.09.26.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:59:41 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 17:59:28 +0800
Subject: [PATCH] pmdomain: mediatek: scpsys: add MT7629 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBA0auQWTuxVlPAqxAXbRlkEqlkppoaw
 t2tLt/i/w2UhEnh2mwg9GblZ6o4HRqIs093Qh6rwRrrTG8dhgsuuXW2R42rfhS7bjRxOrfRkYW
 arUITl/9yuFUHr4RBfIrzb/Tg9CqYqOTj4jWTwL5/AfKwaoGGAAAA
X-Change-ID: 20260926-b4-mt7629-scpsys-88d0cf37c6e2
To: Ulf Hansson <ulfh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

MT7629 currently uses the MT7622 domain table through the device tree
fallback compatible. Attempting to power on the WB domain triggers a
warning during boot, and powering off AUDSYS times out.

Add an MT7629-specific match entry to register only ETHSYS, HIF0 and
HIF1, matching the domains exposed by the vendor driver. These occupy
the first three entries in the MT7622 domain table.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index efc8f276ffce..2b5bd8d61cb5 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -1073,6 +1073,17 @@ static const struct scp_soc_data mt7623a_data = {
 	.bus_prot_reg_update = true,
 };
 
+static const struct scp_soc_data mt7629_data = {
+	/* Reuse the MT7622 entries from ETHSYS through HIF1. */
+	.domains = scp_domain_data_mt7622,
+	.num_domains = MT7622_POWER_DOMAIN_HIF1 + 1,
+	.regs = {
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
+	},
+	.bus_prot_reg_update = true,
+};
+
 static const struct scp_soc_data mt8173_data = {
 	.domains = scp_domain_data_mt8173,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt8173),
@@ -1105,6 +1116,9 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt7623a-scpsys",
 		.data = &mt7623a_data,
+	}, {
+		.compatible = "mediatek,mt7629-scpsys",
+		.data = &mt7629_data,
 	}, {
 		.compatible = "mediatek,mt8173-scpsys",
 		.data = &mt8173_data,

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-scpsys-88d0cf37c6e2

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

