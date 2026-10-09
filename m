Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0F037F00C;
	Fri,  9 Oct 2026 03:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515911; cv=none; b=tpNhNUNw2I6c7uxXpHk8nwn1uC5gaG14IraxubJ6lU1V7V7k2uokXfax6IhaL4K+EkiInSexq9ufHWx3VEpOu/29McU8s1tMBhFZIqvIa6W0oihRs5YWV884LVc/zmgrFUfIwYykS7g6RWbtrpTNQOlYWf0CA9vA9KCF7coNK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515911; c=relaxed/simple;
	bh=iY5Uc1xTCGczUi0dqQkmwt1qtcO7yk+6gKr9GQ/UnJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGE5MP73W4Z/Mg/FzGkwnMR9llKQ95ohhl2H08LxJEg85Hfp1+PrvrPHTBccR4kd99V4gc7mE/IZ458Jor64iKogbnG/id+rAO/iU5lsJok95nmy6ryFMreprwmbzzUOsS0WcPwAgxHm4dTGad45zjTBKeBi+e3GO+Dx6LwK7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515826t0fda5ad6
X-QQ-Originating-IP: 1m0x0heME81gQiDrvyw1IQiDZIStO9MbFOMmJ8xkQy4=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 359533307684351837
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:53 +0800
Subject: [PATCH v2 01/20] drm/atomic: Handle max bpc properties before
 connector state allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5131; i=sophon@radxa.com;
 h=from:subject:message-id; bh=iY5Uc1xTCGczUi0dqQkmwt1qtcO7yk+6gKr9GQ/UnJk=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlZs31B1zKVURPdXms5Xgb0XHiqV7Y54feWedc4eE
 SZm2Uy+jlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABMR2cDwh/NZnu31jX6Lqxll
 dy98ejFAjcdId0Nq03nWSoMXD6eo1DEy9O14VH7ZRCs32K2i/e82Dim96YFzGE+Z+7k7n9y4mTO
 eFQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N2V5A3LHll/od67rKIY1HBORMD+ciF1lTCNZDEWT2wOAG619NlDKvNC8
	VwI2PxkXTJP5TqjbfVfiLtxA62MISUxDDmzPZn5vcuguvJHlRI/dU36bErJOMZR2rug/7mu
	zQhO3XPZw+T47jzBVO6gDa30zRwtgvZJ3ihRlWk04Ri2LfekUBmCs4yHmiGhcwahkltA48Z
	n2hkeGYyp63IvSo/FciIsynkcx3MpaOehnEWNFIp4H/U1+HMgtyiLi+x84grSZWymg4SoSU
	VaRKL+aTjGnjfNHUBaxwZ3hMghiDCAC+2nUNeqehNkKu0eAdNew/hKdvUIfH0VBo76ro1N/
	oR7Wf2LUkEuq4/Ir6on6eJMth4y7RFZlEkWaW6SmowqgKx1S8KhRs82CsTCMtKGAOtMt7+x
	uSbX3wnlV6P2ffM9u3stixQ1gvcdTxAjkrk/m94Mq2cD/RGbFmwJCCIIQmsMWtqppWtvQmu
	RQYhPogB3VkD/sJ4yQQDq7kggkcLsVjGxCJ6Yf0CNeQ+yaPCwhU+2ektVuC8YyatdEEDkFF
	2/rz2jNF3TSxbLBLc+7pC1CMPSse6kM3Bel/aN8N5jLYn2/j6H3juwmGsIDzCMAVyBRRufM
	VlqiIzNC8E/p3yY2Z2wU6WGyuhXyBCB3uyeDayoUhReSY3xxo9zwd3Y3ywdnjOqriKCNRDD
	XX3usTZqofq6HxHmAk4cGhWGxaogWhsACNiEXYa76qqnwVmwou55b/a24DKlBgk521Z9cIk
	c7kp4tTnL1yOdgJA0mBbnC/aVWxmvAeFMnJWiE6hvKbAPXcZmGm3GkfD+XdLbmYDqMs9i1C
	N2F40tAqhM2uZpZdE1XO1XJnxVvfDjickaw38srUG47kVq3WZ/RcpHx03dOtnXhL9491M/A
	337UlqPY3I5zcCQJcXEkUvAkAwVfVZzYJm8U/h9BbmhnSMKvDL9iK7ZVLyPw8MYLj6vGToN
	pguNSdo6gXXFf7eRdW68dVWPf1hA1EdXyJ8DLGl9GJ4wXjhP8pJ3OPJghSaqVd+bxh74OMH
	zeqG8Kss0YPSrUdzlLi/BT1kI1kHUeCJPm8Vz3fg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Allow drivers to attach the max bpc property before allocating connector
state, as needed by the upcoming non-HDMI bridge connector support.
Only update the current state when one exists.

Initialize max_requested_bpc and max_bpc from the attached property default
when creating connector state. Use drm_object_property_get_default_value()
rather than the range maximum so that state creation and subsequent resets
restore the value chosen when attaching the property.

Cover deferred allocation, existing state and restoration of a default
that differs from the range maximum in the connector KUnit tests.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c  |  8 +++++
 drivers/gpu/drm/drm_connector.c            |  6 ++--
 drivers/gpu/drm/tests/drm_connector_test.c | 53 ++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index a2ef272e9f27..8352b5a9097a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -494,7 +494,15 @@ void
 __drm_atomic_helper_connector_state_init(struct drm_connector_state *conn_state,
 					 struct drm_connector *connector)
 {
+	u64 val;
+
 	conn_state->connector = connector;
+	if (connector->max_bpc_property &&
+	    !drm_object_property_get_default_value(&connector->base,
+						   connector->max_bpc_property, &val)) {
+		conn_state->max_requested_bpc = val;
+		conn_state->max_bpc = val;
+	}
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_state_init);
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3..34c30469f405 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2886,8 +2886,10 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 	}
 
 	drm_object_attach_property(&connector->base, prop, max);
-	connector->state->max_requested_bpc = max;
-	connector->state->max_bpc = max;
+	if (connector->state) {
+		connector->state->max_requested_bpc = max;
+		connector->state->max_bpc = max;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index beb1d50a6646..1174607441b9 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_property.h>
 
 #include <drm/display/drm_hdmi_helper.h>
 
@@ -187,7 +188,59 @@ KUNIT_ARRAY_PARAM(drm_connector_init_type_valid,
 		  drm_connector_init_type_valid_tests,
 		  drm_connector_init_type_desc);
 
+/* The attached default need not equal the upper end of the property range. */
+static void drm_test_connector_max_bpc_default(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	int ret;
+
+	ret = drmm_connector_init(&priv->drm, connector, &dummy_funcs,
+				  DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	prop = drm_property_create_range(&priv->drm, 0, "max bpc", 6, 12);
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	connector->max_bpc_property = prop;
+	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_NULL(test, connector->state);
+
+	drm_mode_config_reset(&priv->drm);
+	KUNIT_ASSERT_NOT_NULL(test, connector->state);
+	KUNIT_EXPECT_EQ(test, connector->state->max_requested_bpc, 10);
+	KUNIT_EXPECT_EQ(test, connector->state->max_bpc, 10);
+
+	connector->state->max_requested_bpc = 8;
+	connector->state->max_bpc = 8;
+	drm_mode_config_reset(&priv->drm);
+	KUNIT_ASSERT_NOT_NULL(test, connector->state);
+	KUNIT_EXPECT_EQ(test, connector->state->max_requested_bpc, 10);
+	KUNIT_EXPECT_EQ(test, connector->state->max_bpc, 10);
+}
+
+static void drm_test_connector_max_bpc_existing_state(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	int ret;
+
+	ret = drmm_connector_init(&priv->drm, connector, &dummy_funcs,
+				  DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	drm_mode_config_reset(&priv->drm);
+	KUNIT_ASSERT_NOT_NULL(test, connector->state);
+
+	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, connector->state->max_requested_bpc, 10);
+	KUNIT_EXPECT_EQ(test, connector->state->max_bpc, 10);
+}
+
 static struct kunit_case drmm_connector_init_tests[] = {
+	KUNIT_CASE(drm_test_connector_max_bpc_default),
+	KUNIT_CASE(drm_test_connector_max_bpc_existing_state),
 	KUNIT_CASE(drm_test_drmm_connector_init),
 	KUNIT_CASE(drm_test_drmm_connector_init_null_ddc),
 	KUNIT_CASE_PARAM(drm_test_drmm_connector_init_type_valid,

-- 
2.56.0

