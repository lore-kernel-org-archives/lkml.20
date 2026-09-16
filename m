Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5344FDE7E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565917; cv=none; b=msphawhcjH/zheolhc1APFdGXgP2QNlnmDkfwTSGT6Ct+H6Qa4wTld729lzL2o5rpQBbIVynJH5K1vD+xrSZpsvoUmJwkaU2igHle0o7v45+/WhvQkpxRjLxbwoh3KcDaR5qV+Pqa0pbTXZ67WoIPpu5ue4AymYlfXsTNAbU+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565917; c=relaxed/simple;
	bh=8i8Qr9F+LzOgZ9ctuIJBF35YtOXaQS3m8/GHuRgFMB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pG/Ld2AmXrazXu+77bkHhP9MnPVEETESjrYIv9ntv5J/gj4DLubJCyQ1hvO5snObIZovz1sjhlHUM74CVuMjwE/5GFOD2BvMHsiEV0eh2/Y28jc1PEhSXVCPYTyOPC4utwiJLCOqKLLsBWPK2ixlp6PKjHsO9NlKhBr0y9OjIPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrNClc2o; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrNClc2o"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so641744f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565905; x=1790170705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Or2QBqTu0XO5TqiywS1dagQ1+7oN0y+saD1nDD1L5c=;
        b=QrNClc2oMxNoNFB24nQtF44qRBwh1ByfdKqJY/RH5xAENQu56z2Qdic7Xj5THa9bQz
         FfLBE0tpb7p9+RFBZbkHgw2euWzVDJ2wmUzTF1+WjsmN1LhR06BgZyPW5HyPLQzGsuSJ
         0EerFlbksvqgm2PTRGyZqDW36ix89PnHZPt6yzJGyN6fGS4VumEwaN+98lhcQ+cek7eQ
         aVsOKRM7p++2uabPKMsURrECQxuH1nyhUWdS2JBmbMPXw+9FmGVK2MQ/NfyXFZzS5Zf1
         F1Ma1vRjJR7o/cD5TgI4QOHSZTwXc6pUAwwsvD47SVx5JmfhjaiHphBCjN9tU19+yDg0
         gaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565905; x=1790170705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Or2QBqTu0XO5TqiywS1dagQ1+7oN0y+saD1nDD1L5c=;
        b=RwuTy7KXw/p945W9aLnK9XT8axeX2kx/5eU8auaDSXXajwSByoSE87gFSNz/p2kaRI
         RKECHczeNQC8LCDBPBVols0XKRNKueJMyl2m28WIosBwvX+piQcfhVnCw/+yb7/gxFMj
         C4+ExQCF9YTBRU46w+T3F6xUMMcBgaRnoHFxU5R5ZzIcNZ5SzsfdLT9J8sXVB54/rGmD
         lSDkJLW12KS0Xkj5I5yMQK7aDrkuaZO3AfWFrAGFPuQ40Zz2a+M0sTSJq1rwyV3b+5er
         zU09pvSSaOuewVN+GKISr4VCtG4XdlVGX5zS6wZ6j+uzbBZPC7SFyPR8dIjpFPDJKzt3
         g1aw==
X-Forwarded-Encrypted: i=1; AKwUvBwzIFW48sFyqhDszuHJ7eD90GTKlaQumqhtKAQu5zGo9q0EIjgI5f267JIff3gsqTn1DidPHpD/mtCC0z0=@vger.kernel.org
X-Gm-Message-State: AFuF++l+2+Z1e/6N2naanG/h2v4EFziTHeia60PQpL8quCQi96sK6JZc
	Vp6D/vQMVnYBNzMSnvp+x4nvtQrAiQjZ+TybOSn90iQglnzZwhqsDEVq
X-Gm-Gg: AYBFou1vY3zzzYdJR7I0EftWDL2Z/EZk0jUCyellboZfw+ABpXakNU7/0I7IcLxPqDd
	fuKsTtt6yliVuN7/I4Pxmwb9NlEHFkJWxq1eO0fITdsGJyxbR4AIZXR0JD+9d9ob9hogEiEIDbP
	yVoF/uKFoXlhj4lHShha/zV1hgEZh+MJfLrPFv8T4U06zwKgQdj6VLtSqokq6KNc6xabFCr3wsn
	eZMViUeIQ//P5bGrFRBRnUIeASwz5SYXiAp2CV2n0ic4/d1D1/j8WLqGK5ylwnDqJLsWQTh47te
	JixDfRDp1AWEkR6YS0ZWzQHFWNrS3J73JhJRlR1T1SP7I+jMIc/ilCXnNAqcd+OLDOEUvUOvOqk
	SVZoFcRyztVNO2GSTzIEI+fvQmT8l3J+8rL6qWPxl96sr/Wlzyw7SJN4hZJ8KWis0FBrsnScR0x
	OF4I796/kUA10JRdTXi1v+a8qCG3uTabmjIz7JD8pWzLQ1lx7FJ6OV5H9XFMCMZgBkEDuHAaqfT
	qCRTrRrgjM=
X-Received: by 2002:a05:600c:8819:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-49eb732b40emr29254665e9.26.1789565904385;
        Wed, 16 Sep 2026 06:38:24 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83da9a7csm77085295e9.11.2026.09.16.06.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:38:24 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/2] phy: qcom: qmp-combo: hold a runtime PM reference in the typec callbacks
Date: Wed, 16 Sep 2026 15:38:13 +0200
Message-ID: <20260916133814.3977-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916133814.3977-1-okerixx@gmail.com>
References: <20260916133814.3977-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qmp_combo_typec_switch_set() and qmp_combo_typec_mux_set() tear the common
block down and bring it straight back up, calling qmp_combo_com_exit() and
qmp_combo_com_init() with force=true.  Both release and re-acquire the PHY
clocks.

Unlike the PHY operations, which the PHY core always invokes with a
runtime PM reference held - phy_pm_runtime_get_sync() in phy_init(),
phy_exit() and phy_power_on() - these two are typec_switch and typec_mux
callbacks and hold no such reference.  Releasing the clocks is then enough
to drop the device's last reference, so clk_core_unprepare() runs
pm_runtime_idle() and re-enters the driver through
qmp_combo_runtime_suspend(), which disables the very clocks that are being
torn down:

  gcc_usb3_prim_phy_pipe_clk already disabled
  WARNING: drivers/clk/clk.c:1259 at clk_core_disable+0x298/0x300
  Workqueue: events_freezable pmic_glink_altmode_worker
   clk_disable
   qmp_combo_runtime_suspend
   pm_generic_runtime_suspend
   genpd_runtime_suspend
   rpm_suspend
   rpm_idle
   __pm_runtime_idle
   clk_core_unprepare
   clk_core_unprepare
   clk_core_unprepare

qmp_combo_runtime_suspend() only checks init_count, which is still
non-zero at that point, so it proceeds and the clock enable and prepare
counts underflow.

Runtime PM is forbidden at probe, so this only becomes reachable once
userspace opts in through power/control - which is exactly what the
comment above pm_runtime_forbid() invites it to do.

Hold a runtime PM reference across the teardown and bringup so releasing
the clocks cannot re-enter the driver's own suspend callback.

Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index fa1a91e67549..f6d3320a59d9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -16,6 +16,7 @@
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -5179,6 +5180,8 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->init_count) {
+		guard(pm_runtime_active)(qmp->dev);
+
 		if (qmp->usb_init_count || qmp->usb4_init_count)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
@@ -5265,6 +5268,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 	if (!qmp->init_count)
 		return 0;
 
+	guard(pm_runtime_active)(qmp->dev);
+
 	return qmp_combo_reconfigure_phy(qmp, new_mode);
 }
 
-- 
2.55.0

