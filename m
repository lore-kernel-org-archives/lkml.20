Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF680331A53
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527377; cv=none; b=n18+U5cTvU39OpmG8XdB6Yhj9JiMdsfPWSj3cxnYxgK9LMkUkBANlg2+Rd2aDTd/50oBWcuOiJx65XrI/zb/KKFrPU0VL0A97FVsZh4AsspyhPs5Gr1LO4AcCIaNa8aW76jeMOnlZpE6AJ9NJQn+5TZ2OCRllqb/QDbHf1l7OYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527377; c=relaxed/simple;
	bh=nsUn/gyvK5xq/EZQV3uYgBkYE5FmY2nAUyyxBMr7d1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czeF5o04dEP71l0YYi3ybbY2jQzBgLeFCrcQShMvh0BhBppfs8wYcvyHIcEiTlGZTZ7sF6KrWURPBkKPsjm0uEwMyCY3d0vAaB9w0tVSo3rJgCx3j2PmIqY8lPzcsr4zvkjVY/d0WH2TcHQ4InVmAHUyDQsHgvPa80eypwQpUKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOPc0Yuh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOPc0Yuh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4957799b92fso428505e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527374; x=1789132174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+f52AKxDAlw/HpKk7FcOocDLK6B8oOeUPjxL8dkr0A=;
        b=KOPc0YuhHXuaxTYSgYikUG3GNSRVZd8xLi+A5PhhQcLWWpbfcRA6A1J8ZD2Kcq+QYc
         4oNuIg7cPBNHlctDUduQT8hCA0/IKlKqJjtS5/fJzftXRVhJHCnXpUdApzh/QuAqzxpk
         Pc0osIkXiw1hq6MnkVZ9vaWRpqA7Td9/KLmBxh3nekpjXZfcxi3ohemy7GO2ocSR4Wzy
         KRVXVWlyvooQrSaFKeaiTh/WlEIhULrlQa11nQfZRdJGcFdWK48eDH/NH1hp4JgnqGfJ
         AmI1SaKv1/0EozvbN7lBdKTKS/DJqCX67BvojSVu2HAOng9QoEeicVSPtoxCbBmrjkZM
         wtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527374; x=1789132174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+f52AKxDAlw/HpKk7FcOocDLK6B8oOeUPjxL8dkr0A=;
        b=tH6TB6D3ylMK6r7QFNl/dov5eTLt+lPsm7bT2pO5q2+1tPadEOmZH9vD1mSgp8RqAU
         l0BNNnM4LcBuixcrZvVW31F6CwPDOOC6N4DJdPqiN6gP1MFZLTf+KTRu/Xwg21e1Njl4
         xo/G+yPMPHRrQEmtqYOuVlsKDlywK4I9Fvkl00gNZ6U7bWDrcU4b5TEjDakHM0ZOSnY6
         wJSbLQYccd5JZUkbwQS/l+nY3bM8RMy4O+qe8vBtJGd/XRZacNypmy1YGPpTV0zmamVA
         aDEbxDilcdWrwFrqWW1q2jZsii/yT6JVcw4q0J4JOevmSbtoEUVMR8s7fm8LHDXQBLeD
         NULw==
X-Forwarded-Encrypted: i=1; AKwUvBxSp71Zfra1nfB09pqwyv2gHtWpUjr6h3t7uXXf/B2jcI6Po/Sn2boA+l34t6eUQmnAeY6zIvDur20uyPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n04ClF64R8gduOnmqmGba2HKcfm389iYia7FhBjHBX3HLx9y8O
	aoKRjtjNX0XKHU3iPNiYeVhFXfRwi0SjB/ZltmLr/3TsZgMLUhu51mD/
X-Gm-Gg: AYBFou2tXqQ2F14y2dd2tge5PxymlFJdgvXdXPo54s4zV+rAnFw6jCK91OMlyfJQemj
	7HrEzGSGc+lsKxoNEhxsk1Pw9b28PgxBa2gd2zHBboGCnJYacrXCGQz/szHwBgeLtkYnpjUReQu
	XV71me49WQ92oPvEA2xM/TTGF0xf9gvaQSsxd3HSUTvKw/I8x9jJEmGx/lTwi4TTWpN/Nx0czC2
	4laUNF6wkW7fJ7cvTAkOT/Ye0VbKMsv9DYc/O/80cJZA3dgdPOQjRWSoUImL8q4mXyEt2pxerqB
	wX9cFAga9f0lrpBNDM9IGnitqwxPgEr5eHUy6RGMpPBQ3LpMXhD7A0eyAFFUElZuFXbtoSbDZZM
	sZjt/efUUrlowg+fpET6b3PTZ6NpXX1KRGHzZlcWwmcNGYZeiKIF54tBKvIh3n48HZpRtIcuz0D
	UAKX81xnumyBHwMgdu/ubd+NxZR7qeIqIZuq8pplUXHj4/np2UFRlNxV6IuTbbhXLuYA7L1lwQn
	ypPRl4ArygdyMR686UCo5lN2DPWX7HC5j5zb9lrBvHaZByI/BF96g2p7gffBm9TVJDVm/ibGurP
	yJoo
X-Received: by 2002:a05:600c:a40e:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49cf9b8baffmr34000785e9.2.1788527373810;
        Fri, 04 Sep 2026 06:09:33 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:33 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 6/7] accel/rocket: register a devfreq cooling device
Date: Fri,  4 Sep 2026 15:08:57 +0200
Message-ID: <20260904130858.27803-7-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With devfreq driving the NPU clock, a thermal zone can now throttle the NPU
by capping that clock. Register the cooling device so a devicetree can bind
it to a zone.

The _em variant is used, not because there is an energy model today but so
that there will be one the day a power coefficient for this NPU is
measured. There is none now: the NPU node carries no
dynamic-power-coefficient, Rockchip does not publish one, and a made-up
number would be worse than no number. devfreq_cooling_em_register() logs
the missing model at debug level and registers the cooling device anyway,
so what this gets today is step-wise throttling with no power model for the
IPA governor to use. Measuring the coefficient is follow-up work.

Registration is allowed to fail. A kernel built without DEVFREQ_THERMAL
gets a stub that returns an error, and losing throttling is not a reason to
refuse to drive the NPU at all, so the failure is logged and probe carries
on. The cooling device is unregistered by hand before the devfreq device it
is attached to goes away.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM sparse checkpatch
---
 drivers/accel/rocket/rocket_devfreq.c | 24 ++++++++++++++++++++++++
 drivers/accel/rocket/rocket_devfreq.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/accel/rocket/rocket_devfreq.c b/drivers/accel/rocket/rocket_devfreq.c
index 9d923a0b6ea30..86bc34819a187 100644
--- a/drivers/accel/rocket/rocket_devfreq.c
+++ b/drivers/accel/rocket/rocket_devfreq.c
@@ -3,6 +3,7 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
 #include <linux/ktime.h>
 #include <linux/minmax.h>
 #include <linux/of.h>
@@ -404,6 +405,24 @@ int rocket_devfreq_init(struct rocket_device *rdev)
 		goto err_remove_table;
 	}
 
+	/*
+	 * Thermal throttling is optional, so a kernel built without
+	 * DEVFREQ_THERMAL keeps a working NPU rather than a failed probe.
+	 *
+	 * The _em variant is used so that the driver is ready for an energy
+	 * model the day a power coefficient for this NPU is measured. There is
+	 * none today: the NPU node has no dynamic-power-coefficient, the vendor
+	 * does not publish one, and inventing a number would be worse than
+	 * having none. Without it the EM registration inside is skipped and
+	 * throttling is step-wise, with no power model for IPA to use.
+	 */
+	rdevfreq->cooling = devfreq_cooling_em_register(rdevfreq->devfreq, NULL);
+	if (IS_ERR(rdevfreq->cooling)) {
+		dev_info(dev, "no devfreq cooling device (%pe), NPU will not be throttled\n",
+			 rdevfreq->cooling);
+		rdevfreq->cooling = NULL;
+	}
+
 	return 0;
 
 err_remove_table:
@@ -426,6 +445,11 @@ void rocket_devfreq_fini(struct rocket_device *rdev)
 
 	dev = rdevfreq->owner->dev;
 
+	if (rdevfreq->cooling) {
+		devfreq_cooling_unregister(rdevfreq->cooling);
+		rdevfreq->cooling = NULL;
+	}
+
 	devfreq_remove_device(rdevfreq->devfreq);
 	rdevfreq->devfreq = NULL;
 
diff --git a/drivers/accel/rocket/rocket_devfreq.h b/drivers/accel/rocket/rocket_devfreq.h
index bdf8e89ed3761..d5876d62a0b7c 100644
--- a/drivers/accel/rocket/rocket_devfreq.h
+++ b/drivers/accel/rocket/rocket_devfreq.h
@@ -10,9 +10,11 @@
 
 struct rocket_core;
 struct rocket_device;
+struct thermal_cooling_device;
 
 struct rocket_devfreq {
 	struct devfreq *devfreq;
+	struct thermal_cooling_device *cooling;
 	struct devfreq_simple_ondemand_data gov_data;
 
 	/*
-- 
2.43.0

