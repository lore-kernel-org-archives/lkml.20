Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500F91EB1AA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788724354; cv=none; b=ZvP9Sv48FE/bnqZQB2NCmfdc2q25huM9nj8CKyK9DXNHjiIZjPInTWmdMcDvn78CwOdv8q10i/21BrmCJalk3SbwRDS0Q4p0A1yhfenyyoCnjeEHi9Ix2fVL1/+YeZlfUQuQ1JnAWfCoNcpnYzF8TNXIfNQdL5vpKesBd80aQkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788724354; c=relaxed/simple;
	bh=XK7mjK3oCEhliVmaVp9tiLgnzsCWO9YB6cN8rKU4JuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cne65L80Nrgwg2RDt0x6H+WONnGX7LVW1/QL0UetVgEU7+8CdXzpDVXkmSiMmv0v4DPatu1MloEdoYDksQXA/tY3oRTXjj2ViQaDhIQU1XKdEFPXDna/VIPTq6HCwbuN4KgXkZnGaybrolGOxdqHDfz6XKOpffxHhvdTjMs8SEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPiG6xa0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPiG6xa0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e397f74so3585865f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 12:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788724351; x=1789329151; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k6aIIQf/ZiuidRK4WOGU+i5+W1M7hJlkCU0KRsVn8n0=;
        b=CPiG6xa0AygcEZOFf0N8fyngzVrspKUSDf513e0+IkBf6hWpIxWQGFoqPkwflEE512
         P1CpOsjpj3Nts9CfruRObIGDzK79CiPO/ZwRvu6mgbryQKA/7vjcd0//bX9hKcqIT65I
         oqvGuR1PA2t+9Q3IL2dpPRZ7expLRniX5+LK8QiS13l+lNBbK8sT9sHVdZj/tMQvOTEB
         mwSpN7CiNeaO4MdBCXLByyJ/sZEV35GJVcPLw9/zUVdGTPRUlOm1nV46WkxKJ+D75z0g
         xE7d8FI7jwopxmuvKpe5NwMP08KYN1mQj0nHdLdJSlEAxhGnlESaEhOWHvzJ1jc9flTl
         l38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788724351; x=1789329151;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k6aIIQf/ZiuidRK4WOGU+i5+W1M7hJlkCU0KRsVn8n0=;
        b=eaip4sQw1NdLUcYqqJUcNuNBXVmWxKjnuOcNoX0IhJOBvdFCCC8Cd+MokPY1wq2QlA
         2MNiMNutrKAHxjIZZHSBX1/QiuY6tVFQDsGMYqE2a/zqPITvLJeZW/ozEgOYEQ33tLmw
         M+vRPO9HLU7uNs9iWI3wYLrtkT4H0eEpuTXuHocwmvyFO/qb/RE54q5On32FhxlNLNan
         j8Sstr1WZxwfULX31Achhu0bEYPbqowB+hGBelxFi8Vq6Mae21lWAZu8UgHulzEqFdW8
         6L9v/3yxttcZhdVBGdVSSZV+vCMNV0RdBUu5TB8i44ZrrlgoftOk/ZWSZJjFaUxN6i7I
         mFxQ==
X-Gm-Message-State: AFuF++kOgmd7nS2PDDDmD1pI9Ta511VGY5U5+z1Mhl0pb5Pd7kH3i2e9
	TMs9qjIjxZ3r85SkFu6AEZM0btEkH8cHv/fzH+xoz/aWhPuJIkXIsosix2/OR3PJEMdi46xTtDo
	=
X-Gm-Gg: AYBFou2WFKMzC1T6XCSvJfbJOgM+eYBOu1oM20nD4ll+USXJ4jv4Ss4pOEhuj+Lk23r
	ghfZx1W/S4j9F0Ehu0CsNMlSD1LmH9PD+ViHp8iofarGn2PUDendEs166Np002sSJKnPxQ3abxM
	54U3wp6OAnzU1lTAz05DVRyyWi/W8NYyNH0T8B4tkfSmvINy0RVxEcjFMjN4Fjzj+4JOhnangC4
	EzH0vGJm+m/rJAMN21uNANpmLE/L4CChvDw6V6eNn8kkb3q3Gco3SZUnL0G1BM8Xya+QHzYoeL+
	Npd7wD4aQ5Bl2OLSW/l2isQiekS/qWpBO51fx/WtYXPcFN6EtmVe+byL1dql6I5UUi2/eUXvFKg
	ZmF36JlnmL9TwHv5/NmarFjkoQQvMwNurpXrCcTeK2eYAzICf3eYm6CtBkzHqh1NVoVylHKYM6p
	PchWX5LFUD8Qxr4ZMTzid3BgFqXpRQTJOE/CBl6rqts2REg5BjbcsSKMA/x2nEBr9RkQ==
X-Received: by 2002:a05:600c:3105:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49cf82bea15mr176446125e9.1.1788724351324;
        Sun, 06 Sep 2026 12:52:31 -0700 (PDT)
Received: from [127.0.1.1] ([146.70.189.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce592b01asm81194855e9.2.2026.09.06.12.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 12:52:30 -0700 (PDT)
From: Miles Krause <mileskrause5200@gmail.com>
Date: Sun, 06 Sep 2026 15:49:24 -0400
Subject: [PATCH] extcon: ptn5150: fix fwnode reference leak in
 ptn5150_i2c_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-extcon-ptn5150-fwnode-leak-v1-1-42c2ff731138@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMPDnWoC/x3MwQqEIBAA0F+JOTegtUb2K9FBdNodijE0Koj+P
 dnju7wbMiWmDEN1Q6KDM0cp0HUF/ufkS8ihGBrVdMqqDunafRTcdjHaKJxPiYFwJbdgr31rjf5
 YZwOUYEs08/XPx+l5XvjkzvVsAAAA
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Xu Yang <xu.yang_2@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788724349; l=1948;
 i=mileskrause5200@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XK7mjK3oCEhliVmaVp9tiLgnzsCWO9YB6cN8rKU4JuU=;
 b=LPtIhjrew4bIl35WIgkpRvqyyGWBDp6zWiGR3ljLL+EbLxMS+IT/AErJnTgcjXSGnf01jqiCr
 KHyL152rkpPDLkyTkAqGCUSAAHxax2MQOi3awU73vZWYkSoFZsibPxF
X-Developer-Key: i=mileskrause5200@gmail.com; a=ed25519;
 pk=zcIfq4TGtPwMRJUW6WsbE2zLHvOMwk6ZyT/CGd6XzyI=

ptn5150_i2c_probe() looks up the "connector" child node with
device_get_named_child_node(), but never releases the reference that
the lookup returns.

fwnode_typec_switch_get() and fwnode_usb_role_switch_get() each take
their own reference on the switch they hand back, so the caller still
owns the fwnode reference.  Nothing in the driver drops it: the devm
cleanup handler ptn5150_work_sync_and_put() releases info->role_sw and
info->orient_sw only.  The node is therefore leaked on both error
returns that follow the lookup, and on a fully successful probe.

Declare 'connector' with __free(fwnode_handle) so that the reference is
released on every path out of the function.

Fixes: 842546c56345 ("extcon: ptn5150: Add Type-C orientation switch support")
Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
 drivers/extcon/extcon-ptn5150.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index eca1b140aeb0..ede38eec2466 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -256,7 +256,6 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	struct device_node *np = i2c->dev.of_node;
-	struct fwnode_handle *connector;
 	struct ptn5150_info *info;
 	int ret;
 
@@ -343,7 +342,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return -EINVAL;
 
-	connector = device_get_named_child_node(dev, "connector");
+	struct fwnode_handle *connector __free(fwnode_handle) =
+		device_get_named_child_node(dev, "connector");
 	if (connector) {
 		info->orient_sw = fwnode_typec_switch_get(connector);
 		if (IS_ERR(info->orient_sw))

---
base-commit: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
change-id: 20260906-extcon-ptn5150-fwnode-leak-81c395149a9d

Best regards,
-- 
Miles Krause <mileskrause5200@gmail.com>

