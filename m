Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8627837996C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615396; cv=none; b=XKK60BnUUp9GH9HDH0vCg9fRSGWA3rdrtc4sb0LizSRD8plzEbx3NnFHDr4qWYS2Zl7zTOcntnYmdiXn+Jkh8v787ki4Da2xXRV7fa+pFnImtUWvzNLP+gVMyuCm9CSngpG49+x+HCp/NAexJzuFDb7Wwwy7r00feO30tkTy9w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615396; c=relaxed/simple;
	bh=r8TOIyAy3fy6Z83M18qhxUjxbotERm5xCx2WC3simDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOc+FF/zGd4kx1leWCFh/nNNCqRFrm90bwQmrhNy5+tmg1HOqjxu0YlfkH7WrVIeoKWG626scko1ugg/XVAvH9CE6YGLlPfPLFrhywlpDmmygA+HEvp73pRaD4XIxQmuCEcs/kwQHOz9JxelSWgxzn3RE7L+QYxzd9F+Su/501Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iqqLR7sn; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iqqLR7sn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=r8
	TOIyAy3fy6Z83M18qhxUjxbotERm5xCx2WC3simDU=; b=iqqLR7sndgbuPLjbBE
	N8duj6GI12ZYJW2dsmvNpGsxI22gRdeF43P6awJK4GEYgdlayIEHU5ZQJHIFF+sg
	y7pADbD+wWguTQMFs/yOFBjfsEDX4wIdGgnmJfeI98P9H+lP2bPnICoaidlAxr+z
	gccngKW4hVu+Dlj/HPmbLCDPU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXn5zQGpxqQcRiNw--.6153S2;
	Sat, 05 Sep 2026 21:36:17 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	linux-kernel@vger.kernel.org,
	Richard Gong <richard.gong@intel.com>
Subject: [PATCH] firmware: stratix10-svc: Publish the OF module aliases
Date: Sat,  5 Sep 2026 21:36:14 +0800
Message-ID: <20260905133614.65180-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:PCgvCgDXn5zQGpxqQcRiNw--.6153S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4xJF45WryrJryDAFW7twb_yoWftwb_ua
	yjgrs7uFyvkrWFqr4Utr43Zryft3yjgFn3XFy0y3sIv3srXwsrXr4vkr18XF47GrWjqa4D
	Ar92grZ2kw1UGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRiJ5rPUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRF8RWqcGtEm+QAA3P

The Stratix10 service driver matches firmware nodes through=0D
stratix10_svc_drv_match. The OF platform population path can create=0D
these devices before the service module is loaded. The existing=0D
platform:stratix10-svc alias does not match their OF modalias events.=0D
=0D
Publish the existing OF table while retaining the platform alias and=0D
the service initialization path.=0D
=0D
Fixes: 7ca5ce896524 ("firmware: add Intel Stratix10 service layer driver")=
=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/firmware/stratix10-svc.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-=
svc.c=0D
index f8c2da2..fde4463 100644=0D
--- a/drivers/firmware/stratix10-svc.c=0D
+++ b/drivers/firmware/stratix10-svc.c=0D
@@ -2006,2 +2006,3 @@ static const struct of_device_id stratix10_svc_drv_ma=
tch[] =3D {=0D
 };=0D
+MODULE_DEVICE_TABLE(of, stratix10_svc_drv_match);=0D
 =0D

