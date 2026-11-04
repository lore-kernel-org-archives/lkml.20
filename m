Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777388;
	b=lh8aYsf9KWeYqNp1UTIAY4/Iuiw9B8ZHai3KMU1YVB0bmrhq3ycnCAtE9NGUI4y986kz
	 2ed2bdZBAnjn3H7QwvC9BK7iIuJCCkH/UmbrTShNId/7z/eHNOjbK1yhpE+OISiCKghSk
	 fhA1sb2BT/1z00fnw8cZR78z7IE5kwlyQ3saIDSQKThVjSjE1lnwruvbaPTD+PG/KmYvU
	 vD9ZJ1wYOi4LLywUvgFfNq38sWC2B+tpJn/o1RJ6xdUfkLUM+LotU/dgLv9ZS8oKWU/ZY
	 8aqus/37Pmu+NY6b4KSDMyBJftCI5uVD8D8iaAXxbRVD53ggBM+FdUp5yAZekfkqUBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=121s4JOLOhrrTtqNw+nRPzr1JTP5S9GXqoANnz/M4b8=;
	b=DpGL/cfNrfm2v6f3znKsYVFxrv2bAFE0O2bOw2GAAvrwPBscuR2+p7fL4R0MV1PiNhLG
	 99S+aG4ykJMCagll/13pQhF1wrN5b8m+WNHwH0ujtyByczW/oB2sJdh6P+5VkWSC2sSu/
	 C+egGJvyMrrajNVUrUM1dGkea+uIt4AyoFe1WaVHgJ2Y/02A3uwrygeTVWUT+O3VfYjR6
	 B0pa5dPIj3MylVVV0TjahwywUAY/tEw64ViwHtWFl5AS338AYw4F6MhJ2Dq4UMt0NLHrV
	 YexELTWSt22buUr9Faso+pt/O+EjMcBfGixtIQBWq1nVsZRio86OAG+GvvCpYASzSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnP1ALsd;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD1606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12AD1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnP1ALsd
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e4831c028so320692f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793777386; x=1794382186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=121s4JOLOhrrTtqNw+nRPzr1JTP5S9GXqoANnz/M4b8=;
        b=GnP1ALsdVz51CwsNe01ids8Vf3XofkIBdeApDuS2THdbzLAnZE0sO2UqznJzBj77zU
         L6EI5+xeloPdKNSnc4WPtEMZdWTe7nWiHbCxh3VlTUYFq8wx2Z8VXfdDxRa8hCPBzv29
         rrXw2TobSoWy5g6L7i7Cwh9b/x4FlcBBCfmL3k/4ezm/6ySR5g79027PUjWHzCU36aJf
         X1YfREmSrAMg+tbF58CiZP9DSlnvCSD4YawDUaN69Y3Bo5dZ6HSJE75H0dFr7y9MqbBA
         qwXuZ55mj8XK+XayBwxEWpiF/fcNM3QXgLrJg8HdScRkw7+1GUA+DdWlzZP5zmmxhc1y
         lKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777386; x=1794382186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=121s4JOLOhrrTtqNw+nRPzr1JTP5S9GXqoANnz/M4b8=;
        b=F2tS+5LzWGjEymlziEaJci/NrDU5PnPIO98Y2UdASkf8GkscycW35dVGeVkxho/H8h
         hQJVfj5+NeNYZydYt/4LD3MmbK1L4zoUZRyx13T3cmQ0KgMNbX02hmEKg/nwLmwt7G98
         o3Vl4yZY1Rg+jYnycvzLVj24lFbpa/67oP6OM0m7Yb29YkpT603kvHf+Osyb5W7vmjX0
         1FHw6HCaO+Ga9z4Sqlg7NztlSMwpx/gHJVt+oLiZR/stX9xJhX8IdnaLTr3foGFn5QGI
         2SCohg8sB6WPXfds8eOKQq6kU67vjjc+Q1pxcCwDOBrp49vKVVopAt1qVyhxY4DMT2PL
         Qocg==
X-Forwarded-Encrypted: i=1; AKwUvBwvoFHUCMG9Ev+GfgQNYfHJ5vkZ7e/bB0McRey9Xp9i4g/fX6dKstLamQYUIUxE8C30ejNIYJ/t6YBaCoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P2PQHTwbD0qghODCoMx/mvHBpyc87hV5VHf4ydLipKbOgIso4
	E1c1wWWzcWW5buy9nug89s/sqYlRT2eqIj/RZ4w7fnS8okZztelgkozpBqblWg==
X-Gm-Gg: AYBFou03eQ2LvUX+Wjj6ahrFVHeDtOxO4iXHZn6t93rw1zN/OXC5lrSkvrPcTNAMKSU
	xKKLxwAtFQh8SsoUW9lCRT9oLsLvPvAodtkcPDGAn19CI6k7bSIqPYbIcUHVlpgVV1+PAh8Yu3q
	AW1uaUyB4HAT8t7980B5KbkANUiFHELDfABRvHUEXkGrx7h6pavj/OgPt9ja0r/aui1/mkk6o2T
	RNYMnbusWmfANH6CYs7uGHCNuUUismCuImppMhwHqEBF9etVRUmumT5SLpZULk4GsgpsE8wW02c
	vD4sb/jvZpPDpYSH54cmF+q3wXV0NDvNI3J7RNn9eeVNKSASjGXl1rzKsWnICYCdZjxBW8gQS+t
	EXfiSFAoAxzE6gAtWXgt6H4Ffuu4w5NCEK+14YFZEeG2TQqIfEgPUBXO5yGExIfe3miCMNKCwb3
	j5RQ8U8CiPD+6mqRoSBFyH6W3xPoI4nHxDPMTs0TYMbt7qk8X/cTrPT4VntT2Jgbqaf5NB3tEkB
	4plfp44IRXQTyBZYdBInm3tOBRYlZbH0r9Bcg5Y5MjNWlz+71uvxM5/VeML7ymJXJFpHgq0i/kA
	7UWwMQsKdPzlPtaUbh/FEgfPuytzYwl8D6hT6Z5M3DFHxphWKBjPKx3yzP9k90dFDGVnWRzObOx
	NxTagsiIqfyQNtXUMNqPV3itcDjyUnnlxaw==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr345693905e9.29.1793777386280;
        Tue, 03 Nov 2026 23:29:46 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm130754225e9.0.2026.11.03.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:29:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC net-next] net: airoha: npu: attach passive devfreq scaling
Date: Wed,  4 Nov 2026 08:29:39 +0100
Message-ID: <20261104072940.52933-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPU can scale to different operating state from idle to normal to
turbo. Attach a passive devfreq that will scale the NPU frequency with the
CPU with the use of OPP table and opp-required properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

Posted as RFC to understand if it's the correct way to handle this...

DT patch will come later.

 drivers/net/ethernet/airoha/airoha_npu.c  | 61 ++++++++++++++++++++++-
 include/linux/soc/airoha/airoha_offload.h |  3 ++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4d3195eb00f7..f8055ca65ec4 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -12,6 +12,8 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/regmap.h>
+#include <linux/pm_opp.h>
+#include <linux/clk.h>
 
 #include "airoha_eth.h"
 
@@ -656,6 +658,62 @@ void airoha_npu_put(struct airoha_npu *npu)
 }
 EXPORT_SYMBOL_GPL(airoha_npu_put);
 
+static int airoha_npu_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct airoha_npu *npu = dev_get_drvdata(dev);
+
+	*freq = clk_get_rate(npu->clk);
+
+	return 0;
+}
+
+static int airoha_npu_devfreq_target(struct device *dev, unsigned long *freq,
+				     u32 flags)
+{
+	struct airoha_npu *npu = dev_get_drvdata(dev);
+
+	return clk_set_rate(npu->clk, *freq);
+}
+
+static int airoha_npu_devfreq_get_dev_status(struct device *dev,
+					     struct devfreq_dev_status *stat)
+{
+	struct airoha_npu *npu = dev_get_drvdata(dev);
+
+	stat->busy_time = 0;
+	stat->total_time = 0;
+	stat->current_frequency = clk_get_rate(npu->clk);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile airoha_npu_devfreq_profile = {
+	.target = airoha_npu_devfreq_target,
+	.get_dev_status = airoha_npu_devfreq_get_dev_status,
+	.get_cur_freq = airoha_npu_devfreq_get_cur_freq
+};
+
+static int airoha_npu_devfreq_probe(struct device *dev)
+{
+	struct airoha_npu *npu = dev_get_drvdata(dev);
+	struct devfreq *devfreq;
+	int ret;
+
+	npu->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(npu->clk))
+		return dev_err_probe(dev, PTR_ERR(npu->clk), "failed to get clk\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse NPU freq thresholds\n");
+
+	npu->gov_data.parent_type = CPUFREQ_PARENT_DEV;
+	devfreq = devm_devfreq_add_device(dev, &airoha_npu_devfreq_profile,
+					  DEVFREQ_GOV_PASSIVE, &npu->gov_data);
+
+	return PTR_ERR_OR_ZERO(devfreq);
+}
+
 static const struct airoha_npu_soc_data en7581_npu_soc_data = {
 	.fw_rv32 = {
 		.name = NPU_EN7581_FIRMWARE_RV32,
@@ -803,8 +861,9 @@ static int airoha_npu_probe(struct platform_device *pdev)
 			 (val >> 16) & 0xffff, val & 0xffff);
 
 	platform_set_drvdata(pdev, npu);
+	dev_set_drvdata(dev, npu);
 
-	return 0;
+	return airoha_npu_devfreq_probe(dev);
 }
 
 static struct platform_driver airoha_npu_driver = {
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 7589fccfeef6..ac776dc31487 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -6,6 +6,7 @@
 #ifndef AIROHA_OFFLOAD_H
 #define AIROHA_OFFLOAD_H
 
+#include <linux/devfreq.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -167,6 +168,8 @@ struct airoha_npu {
 #if (IS_BUILTIN(CONFIG_NET_AIROHA_NPU) || IS_MODULE(CONFIG_NET_AIROHA_NPU))
 	struct device *dev;
 	struct regmap *regmap;
+	struct clk *clk;
+	struct devfreq_passive_data gov_data;
 
 	struct airoha_npu_core {
 		struct airoha_npu *npu;
-- 
2.55.0

