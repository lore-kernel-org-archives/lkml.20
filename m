Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521508;
	b=vJNex3PQU2TRA/toU8kYue50HQayGCdCVl1fciYuDT2oCdLeot0Xr+xp1qeg7R0paodz
	 oPg3M9vUxToU6wa0m0mAP28saze8dqR8CWM8pfngodQu9abbcA/bueyqE8+X9pgdDoXfx
	 Kh94vI8BoUN0CmfuQgJrKtpR3RzgCw+ktv3hGcT8HYsRiMvY6J/LXegD8wHhePTYmRgy1
	 ohsTNqpVLPaup5g5TDTbz4drqXvq083TtqwyLQcorQToAXoDB85jjioLjRslCt0/zGdGc
	 AFEVf/fINia/TZyJIF5tYMJLoaGRIIBLmBNznn6Z6i4Z2s+sY3bVJrMoZAvw4UtW1Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521508;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=5TNd4kDZ6PxnC1nFHlM/gzXF2fKd3DLoroTgzKLXOEc=;
	b=zQH0k5v7mLMbtjY4G0Gx/PJ9JWrjhRC+lR7IcDaQ9YwhhZNp9AQ3qbagrxOZHQ5vTZHo
	 AyhwdeIOONbUkvAvh1CNgcNf8WRL0iSiiaevCDQT6/PLb5eOYpoDdHQu17Ud8hzt2B3EG
	 d7TNFa+ZJrcnpU8njtJWOdnQTkjkJi1VNVj5p7aqlJ712qqC+MeZ964Wc/woZbNZz4QHw
	 svQm0jBzTUt+2O6AQLJ/3xWDgz9fCWLDhjrt2n/BnSJBc/FSERpieK9RcEfcgt5RVcDT3
	 TDwU8InuhK8ixwkWAjyLMYfx1BizRnrILecgUKSzVqgwLBh5GTJUIYWYmdVqTG7dQOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=aSVbJWLq;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SykK+h3b;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DEC606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DEC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=aSVbJWLq;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SykK+h3b
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 2A1E8EC06AD
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:25:07 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 01 Nov 2026 03:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793521507; x=
	1793607907; bh=5TNd4kDZ6PxnC1nFHlM/gzXF2fKd3DLoroTgzKLXOEc=; b=a
	SVbJWLqIBnjO3ZuxQU2HbdyB9ECwbFaOsudUPJ2trb0HJ3khIqop1jQ3DvmoHmZx
	5ql/p98R2Gp5uSOZepnxgHFH5we8xq+qscIeFEr8HBBeGB1Ip5X5jCxFR2Adrk0A
	XbC5/SGX57hI4zH4bBK8vPp5C5wGjpd+pCyoqDd2ETwNRfTGNrLKDI/o7MnVTZ8O
	hxtKhBJsK8XH2wbLxVNqFmNnDuq7Wbufbxgro/Vo8oqqmE2AMGjTD1/RsAIzqhUj
	1UbHNto0KW3DH1NpUVN4eeSOO3xJkX7Z/YuHpcca6F0RMf5ixLBRKYxYuGNl5GQL
	9fdBEgVKVQrSERLijm0UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793521507; x=1793607907; bh=5
	TNd4kDZ6PxnC1nFHlM/gzXF2fKd3DLoroTgzKLXOEc=; b=SykK+h3bNF1vncyqN
	7zPEwhi5lcek+WiRtcLhU/I8/4J2J3mJbXc8Ug95VSlcw01nKHZiUhI11vmEuVcC
	tpllI0Dva0sCjluH11F213/p+W1J+NDaLjon+M6dWuCNGxRunUVdg6ONhv/BQD3o
	fknnWLo/0uYQHvbAx89sPT1+0uww6g09w/OGaH5pB+ZhhbKHFN5V2t3nkBTFMWot
	UWpcI38FQ7FDIGl4vxZ9C6V2BNyEQJO5SVYMJFmSxnykZgzQE26lQmCEFAtycgBh
	3i66DAcDqOf2XilexmPQuQ6S0YWRl1oDug4xbMZcXQ18rIhspH5HSmanjH95tCKo
	FEmKQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793521507; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:mJTYoQDK0x8Ub/LmgELkQAS8cPpRW+MllSEUMG6we8TT5QK
	34fQXef6Uc6lbAB/YBuMIRos3Gadw/am3rAJTDyr0mclSDk1oExPJtnZ5LCv4m/E
	PK7VcxjtR4qz67+RLqXiCYjmV5NRLggH65pFnMITiNyjhPAsr+Ua/ZBuXz/fIrIg
	rNr/9wawQdSF4AGr0w0vgZ6kDoN4EfZwOQ523hcyfo9T3MxBJNq1FKafnAEh/Xzv
	ps4ONeK4LZcd/2ArpbT3m76IQcx7aXFJDTF5FgmGaAKUxcIR93f4Ko2oFu19R3qk
	qjwT34h3Z5e5w0ssgLDEY/iOTL1QQkClKch7PWA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:11GbJ2AeV0PwLZsvOyp/vxEhYDc0sxthx+5tw1j8pVg=:ZQuFp5rsf4YNlNT28VSe2czptbzzSJotEN0es3Oo6Ys=;
X-ME-Sender: <xms:Yvfmap14OfjTptZaEYcd1IBtQWcPHS9K7NhDWfBr7nx2XI2UPbwGDQ>
    <xme:YvfmaiYNi0bdWhA69K-bZTbgyj7QJaY847CYmOGiMlVi-BHpo5cR-jFAfKCXgDgJ6
    ZDSbEh4F-tjdL8c6vNdiwQE4vwTyb9xv2iMuCYodgdCcq005V9LlS7T>
X-ME-Received: <xmr:Yvfmaoka4CbJUQV9zklWG_v5vtk0BjqyTRahoRayP5fSuTZw4FjvA9QnKSrFMwryFygWf7vr>
X-ME-Proxy-Cause: dmFkZTFYmcEmotSNtM1fAUdxIlSGcOabWplbu44q2HzUtSxo5V/kInrI7pUnhg4GzUZfSm
    vH8lUrDDtk6Bj8913JSzqvmqGfhb5Qy+CCYbpKNyZvf+JVxLvyAf7kk5BfkevtmJF9YYvf
    nuCsRe/yo4NhxrQ61JNcUlaBafwz0GZweHDqO/ANkhiBG65cKeabQzD528kyvJ5EhjjTep
    fJB+PLADZSMtuzvyNyIAyxi0nFOKW2WYNyU9zTM6zU8rVJIeIQI6zk0OIOD9QvDCL3suwU
    W+8QiN1lnpQmgRfHmlA9ToEpye3nuMU2sjFOG4+7Z11tJ1F9VscM2qg8CTipN86u1uv3pr
    8jdffYgo0j0R7H/QmW6hkUSUZj0kGE5szVSGykQOtAcu12IBMDg3P4L5+IFlMfHvzurvY+
    Qj2nZyNzPxuOPZjcj/iUSSP7h67LspkMtAmedhsCpEzKD2p7gVgu6WwKA+0FPKQhGKf8f5
    wahmGBQbZReLTSUXf7FXztzaKYxnoRAtXMERNgjc6XsybDLg5XOu/s+BeOCj2omLg/qXG3
    aSu6Pa2c1J9vzY5zMHt7YIYifKGdmD+++gDzDoHPqDRKAjK6yciSXNbaAvEwtQ0T6sYKX/
    GYFwXn8oMak1BfQVkuA7/351gFT0hUAs3aneohzYEteZgsCWusdGdJIcmYPg
X-ME-Proxy: <xmx:Yvfmajx4u6LwougfzDOj3M5hbwdFygM7RfYPbOFiBWO5-DoceHEyUA>
    <xmx:Yvfmaps2uTRkaUS6lQFPW4nQqFoBf39RfaxG72hCMezwIrd4YfahKg>
    <xmx:Yvfmav8xn8rhx77pEnWFruXxFpzGEI4AkFMCDYiFbnR6XcW9djX0Pw>
    <xmx:Yvfmao15PJCTQ1PpbUKJIV8Fag0EnnjyOWVVkK7KlvbqVMkrN5ClDA>
    <xmx:Y_fmapzKUe6AcbgdWrBFSf3CRh7L4z_VirXYOgksltUCn4xJGRFi5Vsh>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 03:24:59 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v15 10/15] pmdomain: rockchip: cycle an optional power-domain reset on power-on
Date: Sun,  1 Nov 2026 21:23:02 +1300
Message-ID: <20261101082307.151957-11-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
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

Some Rockchip domains come out of power-on with their bus interface in an
undefined state. On the RK3576 NPU this shows up as a hang on the first
register access after the domain is switched on, and pulsing the domain's
reset at this point clears it.

Take the domain node's reset if it has one, and pulse it between
releasing idle and restoring QoS. The reset is optional, so domains that
do not list one are unaffected.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 33 +++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index e3cc60fa2277..0f4ea5471792 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -19,6 +19,7 @@
 #include <linux/of_clk.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
@@ -103,6 +104,7 @@ struct rockchip_pm_domain {
 	struct clk_bulk_data *clks;
 	struct device_node *node;
 	struct regulator *supply;
+	struct reset_control *reset;
 };
 
 struct rockchip_pmu {
@@ -688,6 +690,21 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 		if (ret < 0)
 			goto out;
 
+		/*
+		 * Optional: some domains need their reset cycled once power
+		 * is on. This goes BEFORE the settle delay, not after: a
+		 * domain that asks for both is asking to settle before the
+		 * QoS registers answer, and a reset deasserted after the
+		 * delay would leave nothing between it and the QoS writes.
+		 * On RK3576 the reset being cycled is the NPU core's bus
+		 * interface, which is what those writes go through.
+		 */
+		if (pd->reset) {
+			reset_control_assert(pd->reset);
+			usleep_range(10, 20);
+			reset_control_deassert(pd->reset);
+		}
+
 		/* Some domains need to settle before the QoS registers answer. */
 		if (pd->info->delay_us)
 			udelay(pd->info->delay_us);
@@ -873,6 +890,14 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	if (error)
 		goto err_put_clocks;
 
+	pd->reset = of_reset_control_get_optional_exclusive(node, NULL);
+	if (IS_ERR(pd->reset)) {
+		error = dev_err_probe(pmu->dev, PTR_ERR(pd->reset),
+				      "%pOFn: failed to get reset\n", node);
+		pd->reset = NULL;
+		goto err_unprepare_clocks;
+	}
+
 	pd->num_qos = of_count_phandle_with_args(node, "pm_qos",
 						 NULL);
 
@@ -943,11 +968,13 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->reset);
 	return error;
 }
 
 static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
 {
+	struct reset_control *reset;
 	int ret;
 
 	/*
@@ -962,11 +989,15 @@ static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
 
-	/* protect the zeroing of pm->num_clks */
+	/* protect the zeroing of pd->num_clks and pd->reset */
 	mutex_lock(&pd->pmu->mutex);
 	pd->num_clks = 0;
+	reset = pd->reset;
+	pd->reset = NULL;
 	mutex_unlock(&pd->pmu->mutex);
 
+	reset_control_put(reset);
+
 	/* devm will free our memory */
 }
 
-- 
2.43.0

