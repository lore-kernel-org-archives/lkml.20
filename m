Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC137481A89
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936121; cv=none; b=BfDWx6VUd49e1G635d1tlD88aHnEboJQZJT9BbT16S8UVRD/jojGS0moEjafcXUJlOOSmBXNHZ8E8hzjwYfWGiJqJXxS9G3QgIkmwVsnkGM6hmwHsYogKhnbaK//ooVfL/1Befug7cQ2uzWvXttNRyQhCCZmtMIl/qE4m1kjMs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936121; c=relaxed/simple;
	bh=+tqPDaM12jYhHff2UFsFajJs4biJiSI7mtbBXqPkVDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOCDx8IvuSo3nSnMV+P3tZ1u8bOAKUxeYhqrHO/+BEhb7A1FDQUU72/Ho4g2O37U/iL+I0o9TQwBoRqS2o/jdOaAibh+ryF9Mai1Kjjj7uc5pt6CBJfX2nXf3AjENLXEJIS9+cgEXec2WRz06Yyfxr350kLc/f2LEbIZMdAwM04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P61iyD85; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P61iyD85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9581F000FF;
	Fri,  2 Oct 2026 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936120;
	bh=KeXs2ZC7kzSD0ufQfLuOTISey+oFMQdyZjFqrA00vpw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P61iyD85NdWm731e17X3QQ1Gg4599UfZnGkpPFao1iPDiLdKjW0+U75EueWxkJGCV
	 97mTjmOJcg4PYMj6BztfMZsqOCDKYI7ySToXRSn3lt7YDxhr/g5kbMQKg/V8AJvSTA
	 rjGKx2q/2Ousgub3q5adyNSA7dOk28tsvvd5GQAqtWMZaiex+2TsXFTxQGFKlmfQOZ
	 XRfIYUu/M2NUZZas/jzZ9L2DdpI7yMx5TiNvumQFHs+zPS4tmepuRousiA+DRJlayv
	 eIeq4U3rZuYakbNG9KhaEPtq9MBPS9kKwYilD2wNH2qRh3bWTUNzwz/yIgWM2M/zBm
	 Ho5d4gLgMtnXw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 2/4] slimbus: qcom-ngd-ctrl: use platform_device_set_fwnode()
Date: Fri,  2 Oct 2026 11:15:04 +0100
Message-ID: <20261002101506.1084743-3-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101506.1084743-1-srini@kernel.org>
References: <20261002101506.1084743-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 6e89415712ce..eb0ccb31e907 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1539,7 +1539,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		platform_device_set_of_node(ngd->pdev, node);
+		platform_device_set_fwnode(ngd->pdev, of_fwnode_handle(node));
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);
-- 
2.53.0

