Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030493;
	b=lTA00UDiUPO8+a24/dOJy9fX+XMd3J0oZEUGVO4fsp9l2GXHD14ZAwodcU8G3mdiS1nT
	 mtaCGWJB3YiqsKm1MtaypTGJQAoAW8FDmm/AvQ0hYNqrCE6NsSS7guIbIMVLQpDjUNc8f
	 8hmbLGdDIYACsAB3px8x59yuq/BQHeRmQ0+7tMdk+aP5hsoOK27D1/pTBX7LL4DmPCk8S
	 kaQ6TK1gqFbDiwtVSSsOOacgANdgLUWIPW5gesLQk7r/jNefstzdjXWB81MfrLNMx3Obj
	 8Fdo3wbNJRyBCAjML5psbcOvmbfQx0HbeSDoA3K9jJzt3WlEY+PY+qQsGw5BMDMhx8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uqme9Wp5homb4GKnr1RiyXTopVTpMqOF0DSF1J4+ZFA=;
	b=yvAuiVo7ijvCDdmrHviI6TEg/Ny6OLwKxddc6kOMKNtDvV0PJZATXQ+lwvJD8WpkVFSX
	 3w2NUKtjlv+gYyOaCwJTm2tU10LQpMeTj0mP29epKHqoPqRz2lctPMrxwBPvQFAVfhonG
	 30sRtSi0dlhKX9IB4//0dOn8ZRTNp5CIZ6m+dhqWH2qNfdie1HXg5YsC6Zp1lj0zj+aYp
	 U/0la1l0GKZdWo0xcR0wo7GWWSVw+g6fd7A72XuHo0ExcRtYSzEiVcLDwjQpKQfGIFMdL
	 GpavSHjppitDAhvSGkcjlEjY4C9SfVJ5VkRjcvXTP4w9MyIv3rM3+mcpBXqcGQKPiGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jizuv7pv;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDBD60A260C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDBD60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jizuv7pv
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4677aad67bso338185966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030490; x=1793635290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqme9Wp5homb4GKnr1RiyXTopVTpMqOF0DSF1J4+ZFA=;
        b=Jizuv7pvuxy19viM9ptnpuVBxGX1f6XW1wsBz6DO6Cp3AuafDjZiJ+J5sOvDWPAKts
         PEg2Xn35Ub7+Da3PstmTcQBD3X2ASgeHkaDtimk6USFNs70V+95nQvCLB7MrnTczhp4a
         M5YSjcDSWih7op3+KOWXNvZLk71LjfdWbUrt2xLCg7QO5lA1gCmz7qltVq4NARKyts2Z
         sHf5ysV9r7U93QwIYl/L0+1r8SaHSs0ODKyTIG2Q6R3ey0+tInnPmj2usKuUKDO+wR+d
         le87tvQDOmX6vrGYCKzFINPk8hahdGQdCkAww7iZ/wN2AqUtk7q5XFDEJvk6h5tiWJt/
         9KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030490; x=1793635290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqme9Wp5homb4GKnr1RiyXTopVTpMqOF0DSF1J4+ZFA=;
        b=vF60oHILDvNWqnJbUEGfGxkMYhgHzUpb+Mw7yLJ2+abQ+mTH6IBnJzRiL5h05pL66u
         MAdsdwAnz9rB/bBYsR0Cw1VYT1xZkbc7wAvOqKhlf54oQgM0fSOW3DE4JtfGA9hOM8ue
         9Pl8C+s+ZyT/4iPzuUprT86YPmbSvBE53JrEOEYmRhmkUjvfPgZGe4BzroI24Prk+ioo
         DRRc/BWH8UVNyZoG+hc9CHZCw5zrkQCv2W1VwdoXiwuyDbEYFZAAkFr21iQl906F1O97
         Ru63L8WqFq/mEO0K4Sk84Ht7b4B0pRJBpmAdyw4azrkc3JbIGnnDHLD2B4kdDwd0WSe8
         37yQ==
X-Forwarded-Encrypted: i=1; AKwUvByj1LsmzgibFbGHNjMNn0Ms/S5wX/uOYTE/cO5IKARLt7XA/DtPQ1Pm0Dz9J6EWwzmmQ8NImq8noSWiBK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0YlqAIoMJQcdnzjKm2OOMBmPw2no14yb2Y7WumIVoHgPbISXQ
	5uQT+J5hqUKvcj7dHDnFcu107q131pT2GYqG6DLlavo7Y0RtIYk6F5ZG+1DMwogicxw=
X-Gm-Gg: AYBFou0GnJXv4+Yq7I3bdcHA2wigZlNVojZREiCnVnTiNkDk14ICBQGYT9TVKKyEKxE
	Zq22Ehak7e3EYgK5YhnwtKZNhvIe65pA9H9bgktMwxGPWJ+DgyOgPgFbH62ZXNPkH76wnQWotqT
	Z0HL/a9bc6JRoxiokNEreBMMOcXls3wyen4Hken/cUKtv+fcrtYEypTZ6jciD4YIRm71IgZVDlM
	NYB3//g9ba8/A6MtzG5ChPFP34EniwMM1S7pfxvkylOgRJnSnyWIbAF3UCT+YqOckDTmhWBM8H0
	Ie5j3aLqXZf+U3jyo0eGcBxJ6USTTUxk1bcjQ/Me1xjTW807g/aPrAjMIpnR+NGOORbRKLSeBSs
	FOxLEvecGrlnlEc0A8f62D/P8bcrsxAjv864+hATjxb3nv3r5q09AvMWz8QuU2JNsUK62uHYkGp
	aqdmrCdk8moRA5RngVTTRzvrGzLUY+R3I7cmvhBYD6ZFHSYcr/N3I8ECVg9iDzw6IulWs6CIJSo
	yTVH43gff/GjfwhJ5U3z6T/j4nzGrOQkkN4I1sxSPLIll7gPKcze4n2dVMWsShtJ8XcEqzIpDwQ
	rQEl5nR4gE38xUlBns+Hrhfkepj3lW3vkIchpvKgF/rOtKFOEjFlEtMglR+UXPyuu4AzwhXyK+g
	QaV84FtYOwQ==
X-Received: by 2002:a17:907:7f9e:b0:c41:5970:2360 with SMTP id a640c23a62f3a-c46bde8d65dmr797137366b.41.1793030489913;
        Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:25 +0000
Subject: [PATCH 08/15] thermal/drivers/samsung: acpm-tmu: Annotate lockless
 sensor->enabled access
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-8-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1693;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=s+vlmicvmxoIoV/zG2HTAfaht+VsOMx3OvHNh06nsKQ=;
 b=sr3Gr7+wPMBcALGw6z7oTnVQMKMSvhD4VWlJImkrIylHLhmr5t9yYa8CM8+YcRQX0+qwzTdZ7
 MYcDNOc0I6uAEEX6sHSgfiz0P4Wgj2B+LSwh2tq1C1/bqWW9EUL4LL6
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

acpm_tmu_get_temp() reads sensor->enabled outside sensor->lock as a fast
path before resuming the device via runtime PM, while
acpm_tmu_op_tz_control() updates sensor->enabled under sensor->lock.
Because both accesses are plain C accesses, concurrent execution is a
data race.

Pair READ_ONCE() on the lockless fast-path read with WRITE_ONCE() in
acpm_tmu_op_tz_control() to prevent compiler misoptimizations and KCSAN
data-race warnings.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 1f56c69af76f..65be8884a8c5 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -7,6 +7,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/compiler.h>
 #include <linux/device/devres.h>
 #include <linux/err.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
@@ -148,7 +149,7 @@ static int acpm_tmu_op_tz_control(struct acpm_tmu_sensor *sensor, bool on)
 	if (ret)
 		return ret;
 
-	sensor->enabled = on;
+	WRITE_ONCE(sensor->enabled, on);
 
 	return 0;
 }
@@ -199,7 +200,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * concurrent disabling is caught by the second check under the lock
 	 * after PM resume.
 	 */
-	if (!sensor->enabled)
+	if (!READ_ONCE(sensor->enabled))
 		return -ENODATA;
 
 	ret = pm_runtime_resume_and_get(dev);

-- 
2.56.0.257.gf7497c7d27-goog

