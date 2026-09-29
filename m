Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13D452268D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684673; cv=none; b=bGV9ck+tSd628FgjIE6u0RhLs5NhbTYnY7OSPOi8yuIQ9baq5ZQZZV+EeM7u9zc1Wt4MeBP9YhOz/x7X8twGXh/OHRS60pbnF98y8Gl2FfJVRyVHECvlRu8k6jymHC+eWBj3t5s4m6Up0M9EYUxxan/O6Vrd9m74v1Fgd7rmswc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684673; c=relaxed/simple;
	bh=xPyRjwfyilCcyeFg+vatR1rOEVXq+Oc6Sf8alsTW/bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bd8PZJIkJQgEZkg4Oq0w9NnApBxFD2nIsW5SpNOgpmTHI5cP9Ir7mM/aHtu0aOPzkeH4BzYJNXEpjzKXox8DGa6FAkNlxkRy2TG5gzR9A0iV5wxtMsHb130TKYFivAharP3W9F6psr14CiOyTSZvfFxj7RO/0X+Aeg5DdvbWwo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jua+9kxT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jua+9kxT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so31290305e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684663; x=1791289463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noLRTkEou4q4y255qEcc6T3lEUPxoco+dVf+qITIb+s=;
        b=Jua+9kxTCF0yft/xR0g9AActLz8CW+Yyt9k7L8vb852LJbVgafHAfe7jhBrKySMlmv
         2HwiLVBuaBZ838kdDqeFuplAh6+VTjH3OUd7WrW3LUrwf9aXh2rv6qH6kpzU7+f6vJQP
         F0+gM8LrJlhO2/p/trAQcVehFRCfIZ1cVLLe51Fi8bBwcErJLcAw73QBtBNivHaaxQr4
         fwGHWWhamjdP6Ku7t2+EjwmTa9TXigxDW/duO1tkDoLicu91nLa/pN/6PI2h1pEzpVUZ
         lyIztKy2lGcRPFBNq6FOne6oN8mChvrakn51vj6A6itpZIcmq/x07oVtfsghKKuGsEDY
         CUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684663; x=1791289463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=noLRTkEou4q4y255qEcc6T3lEUPxoco+dVf+qITIb+s=;
        b=as67qiRsTfLSmMNklN0zExQntzDAn8azqJvNT+kMybIwW4sYYp8Q/8cNaKShUDI+lJ
         BKKHjyRYzZnoWyJEggvL8kIDcPg6MroMK7dwRsCUuKYTP2Vx9yvO+9uduPxW6yY5w6LG
         2I8yW93mKP97mTD4fj1SgFxy59FO7N1/T3K+Xooo9qlFzI393Hpuy7Y8JBy0MaI3K9eF
         YHRvSRZrwWzfRHOGBrlxAETXJuYUsHnemPmg3PMWYAo8NYumFFs4Nsok7Pl69ul/wHSK
         dAJxtXOnw16PkHdd0QRL9TI+1P9JiYqxs9HVb31jVnmewRsIHeE61PTuqGD+T2EztL/P
         AyXw==
X-Forwarded-Encrypted: i=1; AKwUvBzzPrtwdcQykcHH/+OD+fCcnx5xTYHPUhIs6hj6ZMS+OzZc345VSAwsZ+yAFQBuZDeMZ6kNA6dOUM+F3M0=@vger.kernel.org
X-Gm-Message-State: AFuF++kv0xQwvNsHFxgXgXlKzfdudR8V6sKcD2zpJw1vBndxJWKKgsu+
	Bzkh/rJqqeCuh2VFRQuIcjwCwMsCa+RmGOE1bOu8Y9+iIF4Ez23Nz+5sEk+Qtdjz
X-Gm-Gg: AYBFou2ge77/AyXQu1lKsckCL8In4Bl8J/ND3xkvvCPrtDVqjjO9hlzCeRCa1ooEb/G
	s0HCPlSDZXQHKMthkf+DE4PtAou6cU7r2JVvHxv9DS4Bj9yPZJc3Vuj5BaY4VBWVnUIolmC1Gwr
	u64x0h/wakYraojyFfNfZ4D1jkDEQYr0RGKKzPA2MZ2TcVM8su6551u7DfM7otWQcEffoQ69Kx4
	Ce1fOkAVW1Iiafpj5kqsDAyIJVqk4hmTXhIVsDgCK4YOkIS2BFem9N7S1fIYHRQU7XcQ+9iKKHy
	zfoEUij2UcOJxZMG+ctRJf7VpHIF5IUEUe6zTuBJwkuHk1eNZi/EKWQ/HEbypncfeHOI/BwVp2o
	/KirUz6dbVKG6Tu8WXAQPaj2UY9qnUDld/+oQOz7poDEnk69fxSNyy7RxYyPXwh3/suAQlTghVM
	aG7EA4IQdpbtawvOu5ZxCh7wQNKANLAc+vRoUVSVuDTP0AZRF6cK8OhghDQ3jNKcIzoVXxbNKMT
	JxRqS/TIidO547jKg13EJssIGX0SYrQjjTAvyk/8eKwn9ywsZ40mWAhxdoPjkV68RvUqJJ43ris
	3RCAdiG534RC8h7QXDs=
X-Received: by 2002:a05:600c:3511:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49fe66fca74mr259377975e9.23.1790684662478;
        Tue, 29 Sep 2026 05:24:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfafa23sm70994965e9.14.2026.09.29.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:24:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/5] power: sequencing: renesas-pwrrdy: Add per-SoC probe via driver data
Date: Tue, 29 Sep 2026 13:24:05 +0100
Message-ID: <20260929122407.219448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The driver only supports the RZ/G3L PWRRDY signals. Other Renesas SoCs
use the system controller (SYS) for different power controls, needing
their own power sequencer targets and consumer matching. For example,
RZ/V2H(P) and RZ/V2N use SYS_ADC_CFG.SY_MSTP_ADA for A/D converter
power-down.

Add a struct pwrseq_rz_info holding a SoC specific probe callback,
reference it from the auxiliary device ID table's driver_data, and
dispatch to it from a common probe function. This allows support for
further SoCs to be added by extending the ID table.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
index 743855620501..0190e53913bf 100644
--- a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -15,6 +15,11 @@
 #define SYS_PWRRDY_N_DSI_MASK	BIT(1)
 #define SYS_PWRRDY_N_CSI_MASK	BIT(2)
 
+struct pwrseq_rz_info {
+	int (*probe)(struct auxiliary_device *adev,
+		     const struct auxiliary_device_id *id);
+};
+
 static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 mask,
 				   bool val)
 {
@@ -122,8 +127,24 @@ static int pwrseq_rzg3l_pwrrdy_probe(struct auxiliary_device *adev,
 	return PTR_ERR_OR_ZERO(devm_pwrseq_device_register(&adev->dev, &config));
 }
 
+static int pwrseq_pwrrdy_probe_common(struct auxiliary_device *adev,
+				      const struct auxiliary_device_id *id)
+{
+	const struct pwrseq_rz_info *info =
+		(const struct pwrseq_rz_info *)id->driver_data;
+
+	return info->probe(adev, id);
+}
+
+static const struct pwrseq_rz_info pwrseq_rzg3l_info = {
+	.probe = pwrseq_rzg3l_pwrrdy_probe,
+};
+
 static const struct auxiliary_device_id pwrseq_rzg3l_pwrrdy_id_table[] = {
-	{ .name = "rz_sysc.pwrseq-pwrrdy" },
+	{
+		.name = "rz_sysc.pwrseq-pwrrdy",
+		.driver_data = (kernel_ulong_t)&pwrseq_rzg3l_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, pwrseq_rzg3l_pwrrdy_id_table);
@@ -132,7 +153,7 @@ static struct auxiliary_driver pwrseq_rzg3l_pwrrdy_driver = {
 	.driver = {
 		.name = "pwrseq-rzg3l-pwrrdy",
 	},
-	.probe = pwrseq_rzg3l_pwrrdy_probe,
+	.probe = pwrseq_pwrrdy_probe_common,
 	.id_table = pwrseq_rzg3l_pwrrdy_id_table,
 };
 module_auxiliary_driver(pwrseq_rzg3l_pwrrdy_driver);
-- 
2.55.0

