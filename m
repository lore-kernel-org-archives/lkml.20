Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EB13CC7CE;
	Thu, 17 Sep 2026 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633539; cv=none; b=JBJ3eRr8b8KBxsULvMo7/mNRzlU0Ln/lTVyFgEPYRIDBP0apOEjucx5ccDHpXWDCdo3pyzFrbJHWBDfmaSJzfwB9ZZyqk3bfnk/2WO2oLd3AKhT/C7PPm7tzBKvj56K8TA03MHWXMJbwP+akREItT51kikA8S0cycaQQCX2pjsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633539; c=relaxed/simple;
	bh=tzbg7uK5/shkC8bFSCg25CEDhd18zzycIlQF7Bl7Dm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OluomYWU5fTOxlg5w06NmmH09mKDcqpwqEFprDToHR/JFIELmhlxCu0iUotvZTUZwIdlzpiJNWXET9ihLFcz0PhwhWkfgJ3ov3zT4mpEMCxTHRMPBfI+izQ3o0pOMqhoDtXLhcmsEou0VynWFl+fj+n/C+bEhRt5YOmRFm3oRqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JluhcyTr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JluhcyTr"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65523E0D;
	Thu, 17 Sep 2026 10:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633410;
	bh=tzbg7uK5/shkC8bFSCg25CEDhd18zzycIlQF7Bl7Dm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JluhcyTrnGK4dd/MZo0ranbVVEA7ciYs4UPyLPLyYhkeBCnF8Icy+stKSGt6b+ar2
	 dzx68TQf90HVUyBHx9gTS/A2V9NpKeoFV25O1/LadeGU4p0oFYVazBn+0JovBzYU65
	 wmAYackbJieyBMLxrzal78m7IFsgqRLy7MquQutI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 17 Sep 2026 13:53:08 +0530
Subject: [PATCH v5 02/10] platform/raspberrypi: vchiq-mmal: Include missing
 headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-vchiq-isp-v5-2-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
In-Reply-To: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=tzbg7uK5/shkC8bFSCg25CEDhd18zzycIlQF7Bl7Dm4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqq6PPGSMKHhwJsyPJJtfAFB6b6QCOTx0mW+uq1
 SgFnzKP0NeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqujzwAKCRBD3pH5JJpx
 RYMDD/9EN9FYLR1SNIL4L0xmDsRakfDIyFwSrRpPwfS70+D6UlIqyUYSvmFT3o41TFRTyOvvtT2
 PSpQkHEH2rb8UCJ45UZyLm/v9KXjn2D+Bz8/eoCGgutaQQo8siiVysZKNGYiYfVKflA5FFaKyje
 z9kDyBXLU+grsUoOPE/cg7LYg7ThdeVSEk8PuEuAdgbtXbTG6i6eoSbHEUNZ0U5pQUwLv+eY1cG
 DYcAf6Zy7MzZrfdetJHjnNeOFBJGOZmchZ1qqXQyrHdi1JxgqDtx0MzhKkGCzYO+SaE0nzOlMoo
 L45fD88RsooScKjUSy5YHEMaxZbZ80HwnJdjCExP5y3EvJjuY55o5lCLXcL4EuK/X10Otqen3qA
 C+BhPWasNbCVQfulCerVFclIcWeFHP3FEELRVUr8xOUs2zLS5EVb/JDlrgKowM0KxCIso2HQRNi
 Q3/qb/2+WkybKOM5MM0vKFNM2tyrexOJ0jGfyvb79SPvsOSMTFaxlj2bxikN8zu/vGy676PL8qm
 9qa2Zm24QpyVCeU9ZaO6NDMhUxNM2w/DpKLI0OMrNWwy0VNcFAE+g4uFmO8Uoy1waxM/PplP5Pf
 SOpiQetNJ7e2IvyYHs3q/Zqs/rmC36lVYO8gZQnLJRbUJtBgHDGJXjcf/IzxlLZ0sANzk3xgvu9
 DYOf+bJyMwJxUkA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The structures defined in mmal-common.h use types related to lists and
videobuf2 framework, but are missing the explicit includes for them.
Include those.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
index 6c5092a68b99..c9976bdd7490 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
@@ -16,6 +16,10 @@
 #ifndef MMAL_COMMON_H
 #define MMAL_COMMON_H
 
+#include <linux/list.h>
+#include <linux/types.h>
+#include <media/videobuf2-v4l2.h>
+
 #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
 #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
 

-- 
2.55.0

