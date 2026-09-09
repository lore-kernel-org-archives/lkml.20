Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E324B51475A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962641; cv=none; b=UDBe6M60rS8AW7CBv0MELkAOmT6ti7eu+b6n6aUvm8KP7zoiwIX+/zetRhbtSgAvStgIp5LN9fJ4h+IQQnMMUR9/9LjyqQTtNsylvU1aMNgZ1+ls1REa9ssQpjTV0A16WMpkIFQilgw2+5/H7Z9oiRERh3kb1lomq4hfoSGyUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962641; c=relaxed/simple;
	bh=sag3Q5SZ/Vf4EaEXCrQjc6pPGJRvp/1eWzwYQiiLhHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VU6UAyuRvmawwWrzy633ypDby+6ZY3GAHfLTYtg+yq9KxI4+hJ26QlNJcHDhrvdjRNDCu9us9xEoqholtaMpXfCR7QnXB2HzP9nIJLXAjYnAlAFTCdnW4KI1I8pS0gj8BHiC/HZxT/UJ7xw1vp0hznJ0yfk0JjofbZMnqIFfFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csFcISA2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csFcISA2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so24698625e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788962637; x=1789567437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C81wLIgV9CTs/F+PgQEY8c1J5nQbz2h4oO8nmOwUCUA=;
        b=csFcISA2c5/+vSPkFBIevWtJgW6rzJXX6+xjqHfKywrNox4fbZZys/bplNWGIu5Ay1
         2R6qC8ocZItnjJI33AKPqqve8Ktr0+0fRyO4qIyGDFsQiF+aRCzwFhnaMPTz2dibXXTN
         2mShAb3mwS35qJRO9TzYfW1mJavuqAZnLO+XIU8zkuKdDIkxN4HuxbqdYWSQXlwOR3GL
         LykLSqQTBDVZ9UU+dACZ+3qxat56PO9w5uGcppD4+McjscL5k5/SfcXg9mTpjUc1zgFb
         jGS4s/lzuWZFNze/fQNLuahTmP8/lCjwFwgkLvCby4FSzX3SoqgwTcJ2NcV29klqmaBN
         PfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962637; x=1789567437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C81wLIgV9CTs/F+PgQEY8c1J5nQbz2h4oO8nmOwUCUA=;
        b=Ng7fGSkBlN+lfEhk4ylDxgJidK2tOodK+Gfds9tMNP6mrwVCF2Y4JF68XGyxPp8vrl
         FIPyW86e5S1sIgrlQFq9XoKGFUdlnoQyqWOUsb6SOHxT7Zo32N9ZsvkWta9kakivUGjn
         skSiccm5qXL/c6GdZ3dno0YNgi8ktwlPE55zHfCYd48QZ7hEq2PWY2uSazf6C3+t6Gzb
         0CzFJdt/kZt7Du9/Ltw7adPn6PNzErEZD+ULgPXQklAw8uZJR1ByEzodtJ7SSZzfDlbY
         +GHejBQD3IcF/sfH+WoRqkHEe4UeVhhdyJX0ugJR+i+cnM5J2ygbaVkfuCP102Sh7Em+
         QdgQ==
X-Forwarded-Encrypted: i=1; AKwUvBw69Ke11+7/jvJMK+X5HDmVN3erQxT9tvGiOPQFFkkKfYGzbcjUXR+5k9/cHkxs8JbVfHg48NQn3pqW6dI=@vger.kernel.org
X-Gm-Message-State: AFuF++mgses5jsEbOzYj7WrEfE1uMfrOWBaC4ITxaSBq5LQtEt4yby/j
	ZkouiJq7W9o+CWpiq15HAWO/2UNiYj9URBJ2ut3rnnObAJ9lt0JH41uP
X-Gm-Gg: AYBFou1m5nv9tfQigR65fxb1s25HYCaxrS84CGRhaSx1eNpdQ+o6cLOQhhQOo0Sb7LK
	weiJV4GN5OOMEVriie97JUu6AOciC0lra4mGUCUURnnuGRGy8q2cdIiEZ8kBmz+9McphQ2bBe/e
	njcK9YBC3oaSq0D+ehogW45ZBN4PrbSI3KNce0V5LT+jW0b4qHYIuOXGnYY47hMTWoob3SOsXqR
	GHJemfxmUhxwT1VTC3eJqVUZTyIhUq/4wL315rndS7Auz1TnK0C/wRx0PRc6E83uZfWrkJjCp+c
	00ra7x5WspK8BlF6ui5xEE5y0MifeB81sLlqgUHLs6Z2R063O5cjyTxX3YD0VFM9IfCqRStn8gX
	j/QM/c02ssiKLw0+D64NW65TfdCrbDLGgrNCoYLfxUHpLKtV503oRXNSoX3J68WzyJYMLNhet9L
	qRkXpM8k+jpjSS3SQDsRtkhnLHxb1NSgUix564UVhMIGx5Y8rwg7azdMj7Ryy2+oOFPyxGQeDsB
	bAlCFQA940I9w243eTavjZcnya5z74dFSelQMN08be7SGN6X27v7Do=
X-Received: by 2002:a05:600c:c1d7:20b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49cffe32f58mr232275715e9.3.1788962636654;
        Wed, 09 Sep 2026 07:03:56 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm44956952f8f.34.2026.09.09.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:03:56 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: qmp-combo: hold a runtime PM reference in the typec callbacks
Date: Wed,  9 Sep 2026 16:03:45 +0200
Message-ID: <20260909140345.4239-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
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
index d77fe94b312c..bf4d29fe1719 100644
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
@@ -4930,6 +4931,8 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->init_count) {
+		guard(pm_runtime_active)(qmp->dev);
+
 		if (qmp->usb_init_count)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
@@ -4997,6 +5000,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 	qmp->qmpphy_mode = new_mode;
 
 	if (qmp->init_count) {
+		guard(pm_runtime_active)(qmp->dev);
+
 		if (qmp->usb_init_count)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 
-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
