Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC4453CA97
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871059; cv=none; b=YVAC70sUv82cKoil/fPijBqbmAC8UeXiImE/zI4mhD8F9cYV7Q0XsSnR2WFZ17d1GBJSePWJpPTDDakPTiGzkoYOIRcSSFc0yzanS4DE9YfqGj+3I/w5PnEbqetrrqsTdf6FOZgLPlzSyOZ2ZrpZWSC4kcfq4g0WG0VRvucLxsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871059; c=relaxed/simple;
	bh=dy9Ewq/CCAs6X076BbDVqr9zqeeUDWMtH8Rg+kR+9Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U09/9o1iY567hiOa45ZQogz7+7+kWkMS2DLXCnDpy0g3qCrO91DrBWozUz9K4cHUOwmJGbvjZOH8cQ3mDPaC44zN6kf8U+DKaBRyi9uFSyPmJx7fdtTUcAUxSCi4dvZ2FlejLnIyEH+LTqgK+6xhtAkj9vkIM+nPXr/MNd5h3YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xs6F/yoD; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xs6F/yoD"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c250f28f1cdso733897566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788871056; x=1789475856; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jXDH8QZoI3ckH+lQsjWcXyDggsWx+AqwtOXNe3U0sBE=;
        b=xs6F/yoDVqpUWcOaoLvAXrQvh1pkuISC8QDJzTDOz/3i9XinJkfJAnTCsFGZ/LEywc
         t5DsVJYFmmhNwVlLQQgMcCBXKzo8+NyOaZjvBaOiw5ckyPlazTShMBNDOi5LwXoRxYPF
         zbmSvsaoT4NCqpXT13XqFw7OdUF+anQQKrXI//Q91670oqzRft+JGK1IT/pLjYTvXP3B
         wn2W3pJlbqMu2aWfI3LNV59shxzyRpEKbHYIMcjLtjTi3ks0lrVWW87FFnRWAhPr5WKd
         CaewtD4LjUR5VpkTfu6uhHR1IGyc6gGsbs13jmmc+IkuHxUzcGWzPqLDx3x2JYgj83Ay
         b1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871056; x=1789475856;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jXDH8QZoI3ckH+lQsjWcXyDggsWx+AqwtOXNe3U0sBE=;
        b=LCZm55yHbdz8I5HnEOPux3+l6nTwAmgMzLxQXILCtHGL+eCf8ISEni/Pc14aFkmKFA
         MQhnbGI62zYzYW2aF671864e93Rmi+phmCkc7o+eOmx6PDKb0vjz3+5qLY1MubiFq0Jt
         3T6VmRwC/rSpU/5mr+oALj7PdHkchFsgioj2HJ4wVlFVzUyiF71qkeKDW68w6XBkfRt4
         V+MEpMFA72oUXUIDAeIm5TZhJh35F/aTI9eqG2bGX1VPF4FT4UVgeyBQwVBjeZbCM0ec
         nWyrrYElUSZ29Z2B1x6VhxpckwmTBy2PCoC10T9a9rxmbaNHkgpqMcq1amD2UKs8iAHs
         ZTOA==
X-Forwarded-Encrypted: i=1; AKwUvBxGOJ8Yyhbpj7qS0a/MT8t/AdUAL8/3u3SwlAtVHoHyVGPZq8ksD03i/jLcrA3XEH5a1ar3RQGE71tflWM=@vger.kernel.org
X-Gm-Message-State: AFuF++n6z1blSVlSeRWbPUKwgy81TbvwUedmkCwKgKAkobGt5M0ab9Lr
	Uo6yymJbMroRwhEl+ZUJ+FroT3vph8rPevszOnfZlk7OkT9Uy2C3TM4ucDMyXt+HvCM=
X-Gm-Gg: AYBFou0NFYjScVSFLUA/5MBpEJ4yjghDBFStv61ohkZNqcxrd81lTulC+5NMnFJPS15
	rUYNg24Bva7Kzw82C5VOZTTUqBZsfy9mxhBs6S9CCMp+blxbnFS0GOoUhGm7FXxmB2tkHoty7ds
	Xp3cyKOjHBLQzN/ato79wXWmfVcUJy4t7tCZTYpdUo4w2zTYiFd+/tp9AF3xo2l4cWOGxgQsB/k
	Vi8/y+GNRIGr5a/OPCryrSSACVGT3PT1MsBIs0+74+XZT8ibPssZcfuPOndaNEMVk0BFG0HYr/H
	505HONoz34lfSn6M8jMFwoZe/LC8U2R4CX7HlwVHEC5lVcb9XLjMsDt4ClxsMX2AhCxj7HD5N3a
	gTmdbkRxNaz3bi/UMMunOfmhSYpgydLJr5tEzufyPVHYKR1rbwMe6ZvL/ZGKWJbVrSj1Qbexvv9
	lyJJRtAfP2zbQLm16TOoM40gPe6wNsqKnOd7H0IEphvqlO/Uzd60njYR7egd2YlJ1W214F34v1D
	p6yP9kPTGrkji0EUa+eOJdHy2HYDv82UKySLJhkxxf1Yg5NLGE+AjA=
X-Received: by 2002:a17:906:730e:b0:c20:af9d:4533 with SMTP id a640c23a62f3a-c260c9f74d6mr1126754866b.19.1788871056023;
        Tue, 08 Sep 2026 05:37:36 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm620301466b.15.2026.09.08.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:37:35 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 08 Sep 2026 12:37:27 +0000
Subject: [PATCH] opp: fix use after free in _update_opp_table_clk()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-opp-core-uaf-update-opp-table-v1-1-93d3fc928c5c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIYBoGoC/x3MQQqDMBBG4avIrDuQxNJqr1JcjOa3DhQTEhVBv
 LvB5fcW76CMpMj0qQ5K2DRrmAvso6JhkvkHVl9MzriXaU3DIUYeQgKvMvIavSy42yL9H2x8C6n
 fT+tqS+URE0bd7/+3O88LHutCoG8AAAA=
X-Change-ID: 20260908-opp-core-uaf-update-opp-table-0d9ea3741231
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, alim.akhtar@samsung.com, 
 krzk@kernel.org, kernel-team@android.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2239;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=dy9Ewq/CCAs6X076BbDVqr9zqeeUDWMtH8Rg+kR+9Fg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqoAGP0Ra3Z3Gt9ya7IDfBGoPtgjNPxBPQu/+H3
 /zUFBvO5l+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaqABjwAKCRDO6LjWAjRy
 uq3tEACDxDprQa3RAcU9D7xZT7Mr1xl10hohSgz+2R84eC071OuqSk0rcIq4iFhSOanTGy2lvpW
 /sbmhAOfcH/Q+4xgxu5DzDRzFFS5X4vvOlPjl61nw7VQU3f0OGcnMUuR/xUeGe1oUzQQ8ZvhlnH
 MDYSPTJz8tHlXslyCPBo3w4LRc+Af5mdC1+I16bv1mywrtR6IhgOHUE7VszioFDe6WxwNaPYwn0
 +X54sUUh04MrToo0P+799k+2T8DsEgtSIuyzJT7YDG918drS+48MdGqUrPSU5LyutugR5a7ltkf
 VAfYn/6YyLGFV2BHFuJptdoRNinPVgWQDAYgA0jSSxaQF/PIk8clwPoMGbVxKoHBSTmj4WG3a8Y
 mjOIjLaFVXh3eHGkGtbGNEx46Wq80sv/EScRVraDvxKNlrmdCcOnHIcClqC6AcC8rDnG8T4v115
 Od815dnxzVNmjfq7e7lnxrN3CFNpOX5H/NVXusF5yjJrK5c46WoqyuNmYU6KiqUv2M6D+9qJHVL
 rYmsZu/F769baNtgXHCzaYe6CD2Qbl4M3nyPN1xOmC2xeyncTdSnIsEbI8XBZu0hp3XnsUoypKX
 bGcDbsbqHiTtgch2FO4SOgcTeDACZMXsFZwFx1IDKlG7/UUdB/CcN98f8NY2AYZjhnI4djMK+LM
 pIA53gI3b4o6ozA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

dev_pm_opp_put_opp_table() frees the opp_table which is subsquently used
by dev_err_probe(). This causes an Oops during boot on gs101-oriole.

cpu cpu0: error 000000006b6b6b6b: Couldn't find clock
Unable to handle kernel paging request at virtual address 006b6b6b6b6b6cd3
...
Hardware name: Oriole (DT)
pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : _of_add_table_indexed+0x80/0xbb0
lr : _of_add_table_indexed+0x6c/0xbb0
...
Call trace:
 _of_add_table_indexed+0x80/0xbb0 (P)
 dev_pm_opp_of_cpumask_add_table+0x70/0x120
 dt_cpufreq_probe+0x23c/0x480
 platform_probe+0x64/0xb8

Fixes: 84f05af0975c9 ("opp: Use clk_get_optional() to avoid leaving opp_table->clk as an error pointer")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This UAF regression was introduced in v7.3-rc1, and causes an Oops on
boot for gs101-oriole (in part due to our default upstream kernel dev
config having memory poisoning enabled, hence the 0x6b6b6b6b
pattern). It is intended that this patch should get picked for the
next -rc.

Peter
---
---
 drivers/opp/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 2fafd983de8f5..c8b941cb81b44 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1581,6 +1581,7 @@ static struct opp_table *_update_opp_table_clk(struct device *dev,
 					       struct opp_table *opp_table,
 					       bool getclk)
 {
+	int ret;
 	/*
 	 * Return early if we don't need to get clk or we have already done it
 	 * earlier.
@@ -1607,9 +1608,10 @@ static struct opp_table *_update_opp_table_clk(struct device *dev,
 	opp_table->clk = clk_get_optional(dev, NULL);
 
 	if (IS_ERR(opp_table->clk)) {
-		dev_pm_opp_put_opp_table(opp_table);
 		dev_err_probe(dev, PTR_ERR(opp_table->clk), "Couldn't find clock\n");
-		return ERR_CAST(opp_table->clk);
+		ret = PTR_ERR(opp_table->clk);
+		dev_pm_opp_put_opp_table(opp_table);
+		return ERR_PTR(ret);
 	}
 
 	if (opp_table->clk)

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-opp-core-uaf-update-opp-table-0d9ea3741231

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

