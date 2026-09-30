Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5A3F1643
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750531; cv=none; b=eyMoSd/i8alWnmYWsMDi/ISOWIyotLiTpI7atobude08gmmugU68YB4JahjT50PrcfZf4xMihWfNx5FYEs3jCTIcMMNVmmVNdr/sxWqs+9uyM9rrOHZ1sd3hFh4XkJL2Sb4gfkr33Oec9Ye8wRnqrl0PgbZzzq3J/bd84HbZJJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750531; c=relaxed/simple;
	bh=GfgIRFKZNhh0/z1g3l0O4prYCqwm9q6Fgf0MfRZNg/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=El9rqy8gaVZQV4WSKmsLGsfVrq+2SysIsxqS772FaXy005MVPU94vnoiQ0hlNVOsDsqyyB2xcWgVqlflUqHmhggQv09r1DkniuSyD+mL1PVRuPZwRY0D2ZjGO1ZXkBNH7mPila3VQgrrnknGAwhw2ciTbIAw+GCGXDk4QOaKAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20251104.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20251104.gappssmtp.com header.b=TuI6ccIN; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20251104.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20251104.gappssmtp.com header.b="TuI6ccIN"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso23614805ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1790750528; x=1791355328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2bOGTFWV9+cmfJzIAoMh3VDHw7N/QaGZFxNBjbDgjpY=;
        b=TuI6ccINWr6nJxabQ22G8ckYxuMbjl3ZZ3iwZKHsI0zDVtprEqnXwhC0HByzz2WlqA
         NNbq3QNoJo19dxEHu6HYVUr3HUxR2yt1J9hstzIj/OkPdWJu7hFMu5hAE7nvv3gqEtNn
         FcPaGJh94fGcPMoFhz2XIUkHIF+FihNe82dgGEvT2jGiEIyQjxdLoENMtqE89dQCkG4O
         9B7tscRw0am7aK3DKRrnTVbr0ooJrFYNcdFB73S/nwIFEDYgmIqgx6SDqVSWcl5451qW
         GROjX8WKzclFXYwCRAaIGHIda7n/LqZw2LD6mBFGin+mbvOhtx/99Xxp2mdVN2LIe8MY
         Numg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750528; x=1791355328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bOGTFWV9+cmfJzIAoMh3VDHw7N/QaGZFxNBjbDgjpY=;
        b=ljqVRVAafN1H0/KbddCtV4l3KF7GuK5PDYj5m9/WUFeAN8yfOUpZXudE8kYCrQzlY3
         Q1RJc/cOjIv9R/2/9tbcTXpd0Wd8L/uXUcT1soccDhSeVAEQ+Nk3Q4DQWmK22aD5t1qN
         AmJl8qJJftQLGyPbntfXpNF2hC/1XbbjwAKGeV64QOSkdCD5ZAPjqyk7JEqOc61sjLPA
         1as+AL9XPAErM/PZFe/NiXScm2/8EoNUtobM1OtTASHgt6rLlaefqGjbsqmnEvbMpdYi
         Xad6soSIa+mbYJybkvvue6lc8hPkA4OiU9lKUpCUdOx59VXhRxhPFc2S8UhGSJ3IewrQ
         ad3w==
X-Forwarded-Encrypted: i=1; AKwUvByxUJzaIMmoNtxoBpWrZQwR/do6L4LUU1+6O08otPxd0w70tX65cmKbVgmY7Q10mHseYo0i3i2fmtWe+VQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpjdwLpLOWYFrI4K7J9ePNyBRFp4p/9qEnRDUjkF0gNAu17l67
	xoOG7YMEkrOb6YRPwTezCN6Ztb0YCkDa41kjYFiSwMVTGFLXHtMbCNy2RJD58NBjnlI=
X-Gm-Gg: AYBFou3BIXzqc3NoaEbIiWXIuP9drGe6MEzya1ScRUfZjB/qNXvh3N9wu6Ju9o174qx
	mv6LQuJpcMvfPqQ94V6HTs1O2+z9sjBdbO4Wk8QaHBoK9B7KGcMa2yfiiFkCeQGQ6dvua3UKW1S
	j4FVFs8MlYF3gboD/pIAVDwV+wZT1qEDP7CFSYu9I33oMh5G8IC6Qmky1JOIMgKu9UOvnp+Ykdm
	rSlQnTs3KOYYeDEDIGh1snGbgccDiY+W2cpifp2oG1QGqGg7KUxC6wUin/DMCl5/6kbd8YLpZWu
	ILp0MyK1dvpaT68qAhs6iQvFwlcOXvAVOEqFQQZUj3X3+K9O4cOvL3RZVwrTlzgS5ZuVVIC6mf2
	BTL0fkhmD6BQAkPzDT50ZJ5yV0Ze1uszFqcR3jT5erv6VmvR/KM43UiQVEYN23PH2/4GWIV9OmV
	qCQlT6QK29gizXl1vedxrUky5AxsxEMSdS7iXvEdjAl77Y39JVBu2e06fKxy/Od/zggzxI26Kno
	t/edOcm4sJEzLhZ51FFvwabBm6yBwWG/acppZdg4Y5/Hhb7dkg=
X-Received: by 2002:a17:903:3708:b0:2dd:c100:80c3 with SMTP id d9443c01a7336-2e2e4ba957fmr4040605ad.62.1790750528322;
        Tue, 29 Sep 2026 23:42:08 -0700 (PDT)
Received: from zhk-cbg100025892.huaqin.com ([103.117.77.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5be5d55sm1940075ad.50.2026.09.29.23.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:42:08 -0700 (PDT)
From: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Support NV140WU2-M70 edp panel
Date: Wed, 30 Sep 2026 14:38:56 +0800
Message-Id: <20260930063856.183763-1-zhouhaikun5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NV140WU2-M70 raw edid:
00 ff ff ff ff ff ff 00 09 e5 ae 38 00 00 00 00
14 24 01 04 a5 1e 13 78 07 7a 95 97 5d 59 95 29
20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 24 31 80 a0 70 b0 3c 40 30 20
36 00 2d bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
4c 10 01 0a 20 20 20 20 20 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc
00 4e 56 31 34 30 57 55 32 2d 4d 37 30 0a 01 35

70 20 79 02 00 20 00 0c 9a 0e 00 ae 38 00 00 00
00 14 1a 00 21 01 1d c8 0b 5d 07 80 07 b0 04 88
74 b9 5d 99 85 95 97 42 20 02 35 54 b0 5c b0 5c
66 32 12 78 22 00 14 3f 66 02 85 7f 07 9f 00 2f
00 1f 00 af 04 3b 00 02 00 05 00 81 00 15 74 1a
00 00 03 01 28 3c 00 00 53 42 53 42 3c 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 8d 90

Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 251e22ba90adf..cb2707cd98790 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2179,6 +2179,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x3879, &delay_200_500_e80, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x388b, &delay_200_500_e80, "NV116FH1-M31"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x388c, &delay_200_500_e80, "NV116FH1-M30"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x38ae, &delay_200_500_e50, "NV140WU2-M70"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x38ea, &delay_200_500_e50, "NV140FHM-T0A"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
-- 
2.34.1

