Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855163;
	b=kMW2CGJtAdEa7GJ6+2Ayk47afFgsWzwvZ1aHV47g6ei4FxOP4tfUJ3ObX/O5XbgE1aM1
	 cvAg8dc2Nbl3KizwmucjYi6SivYrtDXwjtipZ0NFKxDitwMkNaivLfRxyLjYrhAQ0L2DT
	 XZBg9V9EpDvlAgvG05zIYf8xKMknEiy0yp1tE8xJf+77i6wwl3+Bjz7l3q4ub9tAUQfwt
	 YFTf+4wDzdItfrpM4nPb+y0pAjIkFiht5jUrfUKauTKUr770I131zTUGOawQieW6PWDOs
	 Vccj7Gl/y6dMJSb0wwXU/u/1vmndmM6RL9RjFrlyXYpnt7qdOogvAVR8XeG9MxDhmcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+dkEPDVy0VHptq+I/g6JYGM++xkWiF4W9qF7n02UaTc=;
	b=cAtDyA9SADMURM1Q+7EXBBKeB5dKIXuxkmWq20QS4E21gf0h3OWP8ypACv4VXughkmXN
	 JjOOD0fSIytIPlwgMOajrXMwGfM0fYPhiq2goKTubs0otLVyELAyzjgjpZNigfu9fzHlh
	 tPJ9foLZpVCx7pKS4N0sEel7lFLdNBJyfYi45cSKV4YS7h/jvpFCAdodMJ+qKA8czO91g
	 HsimdQdQhPcvXKVnPAvRHVtGDC0hEWNcDlKZp4kqE+inkKLv1kbf55pOk5/blIDoNoD0f
	 fqt4IITfdf0AfjauIuwhtxeyA1xA9E1//Nw4qQuibsBjxWQUX9AmQENmZjDFHFTwh9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=je3WgVDS;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB2606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDB2606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=je3WgVDS
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so13804505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855162; x=1795459962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dkEPDVy0VHptq+I/g6JYGM++xkWiF4W9qF7n02UaTc=;
        b=je3WgVDSzPP+yBl/FMyb5Ls3+qgwG4uKtiS8DhxigkQc1CiUz+8iqXekwQC9Nqc/Ly
         J2Bh18ffkWFwmRFKjBu7wWkzXLqG284ER6IKGK+u4vi7odV1Jh4XWOGhF3bVN7DxOtRV
         ybyhbxyMtoWl+Z+TxjjkNYt1EjFPWXSfkdlwmMZOqUtCjLv2/8YTei5FAlLJyz9bR2bd
         ylSgkZc5DR/x5odsUu9sBA25XDkTZz0iFRPz0HrZeiMfFRXw/6dGdXbIsVazO55fxJRu
         6f7WRlvGUBS3C+Rm06LrcaX2MC7JBL4/YyH8w6ihqgS+1WMhP/R9HLEprti2QkINEJ+4
         17Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855162; x=1795459962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dkEPDVy0VHptq+I/g6JYGM++xkWiF4W9qF7n02UaTc=;
        b=H2wqwsyEX8p9i09Ta/fQL7OmkSWu6dDlBeF6hnBPJ2q4UI9dB8aUDqStlmLaICWd6R
         Hh1rkvcvXeNP6BCtm82rDY3GkgiPT+XoYgxfUqKyiZWKHPvb+ZZV2akGkNYG2hB5/V1M
         pptbTjDQhpTe4tui5BuJNeJue4Al4LBO4Otp/15oy17o8v2ktT+QE4CwfBmgZP1J/lRU
         jaLoGIcY4VL65J30choOkY4vBtxYhTk89WhQa1hrgEiA9QiYmzSs9+FEpq1y7RJChLku
         8cUNLnY7MHa4O32rNJZ0/H55rfQ2N+IldRCRfQWJBZ+tlqIk4EewxRccku8gTrO6HZXT
         mNLg==
X-Forwarded-Encrypted: i=1; AL+hErET0I/z54n9uDWhgPXIfA8cieolGTiLXu+eYtlXeSlEpwb4n4EMvbAhDf6v2k4jY/Pt3w69AKRFAhA6Ow0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2tVcYAPKjeaxLqc06mZMK5qYyp7sUw/oQpau9swb22ZjfLCID
	pwcaGw63WgaLs+9RI2LQsPwRwx4p94anaEHNAIENiRXnsB30m1gDP7lEe8cZ4g==
X-Gm-Gg: AYBFou016trvmhD7iUM16Y1I9iAlIHnreMNj/jfeTP/wSZA2bYJ7pm3dKYYlRVFbe3W
	+rsup/0PFOW/AycEPTMmrkma97BowvNI3FUTEyLze/weLOfjR+ctMb3jtaeXa9B2/fUW5hmMZZ9
	iN19L5L/GAILNOV+5u7R3bosEVeRkAyz82anMkEokIyE5q30b9HPSSaZWjQayjCCXtXNW0aUzoU
	dkf2xbmI9+lSJyLwl/P72XGfKQVrxJrKQxLPaOoT+ngB8u3eiTpfJmbSpZDCGQxiaO81HPWm7bA
	lmxtAkPy351Tomix5H9Tm6TukIbLH86nKEFlydqULKeehvlLVf2NPOM7WUv2ed3G/l6GTuqX827
	4do4aPvlxLtfPIGECOYRBuBDr6C5Gn9rQ/tUzRvaqDn46ULXFRyFTwBGy9aI3+FdTWts86EBSq6
	90w6IzhJX4uCCJzxP9eAEQSHoTbQn9BE4c/jmwMNviVnWDUPHz1mNnx2Zcv5yKO8Yr8Yrw/saMm
	5iHisf6M1GmdL0Lt6jWHBXwEPmLEnYlJbMQEdE18jcCLa2WENPwBEEOHLyflC9DkfpXmwt5flnP
	9NAhFv4KXeiCOM2UfN5TdGeePZUVzeKIOiQ7wrcRkB4l5N6LGMVJb/+0Vnd3VdWwgQ==
X-Received: by 2002:a05:600c:8716:b0:4bb:6847:791f with SMTP id 5b1f17b1804b1-4bb68477becmr153891005e9.7.1794855161517;
        Mon, 16 Nov 2026 10:52:41 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm157961345e9.4.2026.11.16.10.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:52:41 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 18:52:39 +0000
Subject: [PATCH v2 1/3] mmc: renesas_sdhi: Save and restore IOVS across
 suspend/resume
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
Message-Id: <20261116-sdhi_hs400-v2-1-de41f7a7f330@bp.renesas.com>
References: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
In-Reply-To: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855160; l=2510;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=72pqcPIdoyFJ2Xiah39zI/T9p3oP+0sAL771H/Z26kQ=;
 b=wV2z4bmLlPvfIXA5O3yDQNxl/F2i0z1To8NyO+nf8XHyuNtIPuzzvtbuWwYqVlZBLcXJHXobJ
 kU7geJiQPgaBnivDoZx+xHwfaODHgMsKpzLl5akbKFG/FOS8dcMXYVi
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
whole register is saved and restored, as IOVS shares it with other bits.
The save/restore is only performed when a regulator device (rdev) is
present, as the IOVS bit is only relevant in that context.

Fixes: dcbce328d3a2 ("mmc: renesas_sdhi: Add suspend/resume hooks")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added fixes tag
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 4f8ed1d8efee..a93e613e9821 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -106,6 +106,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e649ef20990..56286431fd2c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1465,6 +1465,15 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			return ret;
+
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	}
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1494,8 +1503,23 @@ int renesas_sdhi_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+		goto err_assert;
+
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			goto err_pm;
+
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+	}
+
+	return 0;
 
+err_pm:
+	pm_runtime_force_suspend(dev);
+err_assert:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);

-- 
2.43.0

