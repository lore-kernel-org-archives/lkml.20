Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441934BF933;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=C771IAnxcx/IPM98P6ifGpLRVMyi0nIKXlfKk2MiqA93NNbzMW6YguM2ayEnmgGcKk0fWENmlmXWffg68JfrgXjFIaXVrrnJ24t8jqYh9t1z39olGQgdNY07gcnzb1O+dzt5WYQMviaewez5Db1O2GA2PJIwJ1k3zwse2pukTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=CQO3KyXjcEOh1cJImvayR9pN1O2Gi+6chTdyTr2q23c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdtH3RiFCdRH7qNTXH9rjK2qXi4en9zpC1uheddzBPLRKhnW7jxIx3bs+9RNN+h35fxRct4QAh7KF4zyU4s1WCwug1j70tXnc28ALTkRRbZKjNybPPjnY+N5jHsLv3qSJ9MqRqpVgRGOr6wM4ocF2owg5FKzpSglpngrlDCNlro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiiUXy/M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiiUXy/M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64D4FC32781;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721840;
	bh=CQO3KyXjcEOh1cJImvayR9pN1O2Gi+6chTdyTr2q23c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hiiUXy/MYf+LhIkuAehHEFuDk4Tgy/3F5R9qZalTDIHYogFC8EMY50VhTve5zNM3k
	 9rtzqbQI5RtK7o6WUDORZjhVpeL9/3T2zjW+vHwYgwLl6KK/bemBxaFQoPm5abeYW8
	 4KsPbOy3EmGV6g83xH19hxiDaaU3Udx0T+ioWBM21Tm8C0qf1Zj36qiFYssUN2pC1y
	 W+pVyeaxAl4c/oK4BL2gt24Jrnx38CkXRvMUdVS9ztiEHDy5kLQVNMeddJkRY18MMT
	 pWQ5gFjJ/gxE2E/l8YFVz5YgT4RpAEr6sb+/z9NP9FQbgaFSFyUgYmGojAlnD8Cfao
	 NBgGqp0cXmVUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEAAC88E72;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:26 +0800
Subject: [PATCH 11/21] media: i2c: it6625: use unsigned int indices in EDID
 read/write
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-11-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=1460;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=NqCXYn3xhZ1IIhlAVGE1HXgnu3CsRL/n6ZRVnjAh6nw=;
 b=jOqA6KM0UKYUdWwV5r7kuGILkpP2dbium/P6VXPD81QNlemTzlveDZvPh0hKIHB27t1EEKvBG
 8vCfFbOiyCMDwmL2pH3gvOk3512qvUjzrTQObPOXpHHk4Lr6nu3i9nb
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_read_edid() and it6625_write_edid() iterate their block loop
with signed i/bank_ctrl locals holding only non-negative values; make
them unsigned int and keep err signed. Reorder the declarations to put
the pointer before the scalars while these functions are already being
touched.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index b580256d32f51465a620b639fc0134366cc6fcc1..328bd99f27cf84722caa184302cddeb9c3e667fb 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -660,8 +660,9 @@ static u64 it6625_get_pclk(struct it6625 *it6625)
 static int it6625_read_edid(struct it6625 *it6625, u8 *edid, int start_block,
 			    int num_blocks)
 {
-	int i, bank_ctrl, err = 0;
 	struct device *dev = it6625->dev;
+	unsigned int i, bank_ctrl;
+	int err = 0;
 
 	if (!edid) {
 		dev_err(dev, "edid buffer is NULL");
@@ -699,8 +700,9 @@ static int it6625_read_edid(struct it6625 *it6625, u8 *edid, int start_block,
 static int it6625_write_edid(struct it6625 *it6625, u8 *edid, int start_block,
 			     int num_blocks)
 {
-	int i, bank_ctrl, err = 0;
 	struct device *dev = it6625->dev;
+	unsigned int i, bank_ctrl;
+	int err = 0;
 
 	if (start_block < 0 || num_blocks <= 0 ||
 	    start_block > EDID_NUM_BLOCKS_MAX ||

-- 
2.34.1


