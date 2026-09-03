Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB3E555
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419604; cv=none; b=f1BsldMHrNv799P04OnKF++KAGPia/kcyp+K571WXXWx5PqqXTC0GhQJFmpck/WdxUD/eEsm75+Ot3Qyg+47X3Me/lShH84WvouOywM63l1+jCx8N1KbtMWyb5+OZ1JUrl9+PSbjOdw99l5GqdzXhoQu+RM61lOh+ZeXHwjL86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419604; c=relaxed/simple;
	bh=9SLoUPHOOh/ADivkX8RveWuwcpC0xCJYoTqm47U/wRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=kEK3ybNvaFkKu1wVvBu87eXpRI1hcrpSutzTTHx0aSAYqRSmMS02gJzl8GT07YABxFlTxoI1Be84E4HzbwFyvVT0imt+p3PsCw061yAD9gwWEaVth8im+IH7K4j3q02hOD4HP2aShea2iZb9mZ9W0gFfSQLvBKwskxy4/KQR2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gcKJcsgz; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gcKJcsgz"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260903071317epoutp04d2a05c55958934ba1f5aa0777ffe4871~RviX3iq-p0824808248epoutp04d
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:13:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260903071317epoutp04d2a05c55958934ba1f5aa0777ffe4871~RviX3iq-p0824808248epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788419597;
	bh=cyr/0fEvLQuH4z7Eht9lxXGhoAt1RWvvUHvN984jtM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gcKJcsgzINY/Xw2xCetKgtD1ZTadiw950/xAmbNUlejwBruISNhRQbCzI88CS/b3D
	 ugYvDyBj10zH+eVptjdEJN+cAcAq0wdJYY03JEh27d+PBLZ17zVPeda/RGaiCV+of8
	 hqQZ0KvzzfX8wwvu5pLjauGiMpVRbP4vjmMsSHxo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260903071316epcas5p290dcbdc8d9d3bc41801a42a5b29a24f7~RviXQ5IvJ2559925599epcas5p2s;
	Thu,  3 Sep 2026 07:13:16 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hb9mW42Ryz2SSKj; Thu,  3 Sep
	2026 07:13:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260903071314epcas5p2bf6f08797b9b92aef2bbd5a6a2708867~RviVtAX-82559925599epcas5p2l;
	Thu,  3 Sep 2026 07:13:14 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903071311epsmtip14d2dce7c3a3495747f584f0e76b7802d~RviSp9Kn_2402924029epsmtip1S;
	Thu,  3 Sep 2026 07:13:11 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH 1/3] MAINTAINERS: add Samsung USB DT binding to ARM/SAMSUNG
 entry
Date: Thu,  3 Sep 2026 12:42:48 +0530
Message-Id: <20260903071250.3421499-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260903071250.3421499-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260903071314epcas5p2bf6f08797b9b92aef2bbd5a6a2708867
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071314epcas5p2bf6f08797b9b92aef2bbd5a6a2708867
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071314epcas5p2bf6f08797b9b92aef2bbd5a6a2708867@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add the Samsung USB devicetree binding file path under the existing
ARM/Samsung SoC maintainership.

Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6008f16ae2ca..c1a466d772a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3561,6 +3561,7 @@ F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/hwinfo/samsung,*
 F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
 F:	Documentation/devicetree/bindings/soc/samsung/
+F:	Documentation/devicetree/bindings/usb/samsung,*
 F:	arch/arm/boot/dts/samsung/
 F:	arch/arm/mach-exynos*/
 F:	arch/arm/mach-s3c/
-- 
2.17.1

