Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1410E30B51E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789091809; cv=none; b=LNvksfuCo5jg97GBaFiu0f/guLM++ECUascN5It7wAeJx2LJwHeaoxXqWawqYP/5GZLwVXKWvAJqXV/YDwsH3xl+F6P2g8kRkv/MYMCNmdY6flQm7kauYp+vyy+759SpsV0chqV/9iwKwkgklhLh9jfkAVbEk0coAmiJQV6QxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789091809; c=relaxed/simple;
	bh=pTIKxt3rN8svwwlF+VkWkXOvUISb8VIjuqknOEyyVfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L90esmwfT5hp3nIzqIBt+ni1le5qGsvoHe2gXuQhb7AiVvna+Bsxyjl6rfm16Y1mWzqPto00wp621QOEj1xcNfDKcyCpEdRNsHFTH0x1e4JGMIWtOt6Od8VG/obpyfk1SFaZ4CB/ojBn2E3tKTqjVqVC9v+QJvZEidDhkOtZMKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CteS1cUc; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CteS1cUc"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so451320a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789091807; x=1789696607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxq2TIe8bS3KM2vl9kkxjnCBMcSMNKULAJlsrLiD/GU=;
        b=CteS1cUcvQfb+tGE5jbQ4TxVO794UcvJMa1pXysOXTvUQxmO5jArAQ9GpOEYcn9LHv
         yy3YH+FOMxMD4PcWMNza8IprW8QQ0ZOyy4FiDwDxcG6jfatQxQ2kRPvCoRIVxie/NkuU
         OgN8zCH3nAEtkrU589pPyWfRbdb86Bzt9rdrD7olfW2WGPD0IyMWZo9D0E+fqDl44AQ3
         T5UhnbhnHEjH0jFGmVO7qzRL9SDPZMG0q2lMHeV6A0WwR3GTZKvIGuwtZNzq6Qr6bgpN
         GvRvMOwHDmuQUgDEWnBmT1W6TxjIPPg434F3pXLds7IwkQME24xoYwptRZagDVkhOW3/
         cPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789091807; x=1789696607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxq2TIe8bS3KM2vl9kkxjnCBMcSMNKULAJlsrLiD/GU=;
        b=YiV8jXveR2iJq2P1el2/7CjHqC7a7TlUxu+ex01ZUuZPVLong9hbxijCwhgqmyEurZ
         yiIm0DOusckyQWaudU2S9OVfeop8F60HVsx3zv7GAgbXthqwf8eqOh9ZldDPFnYOCTaq
         /tr4ntyMcUsPO5isaISJHcayYeCgNq3jfvP3ynF4u3r7B8p9Mpm4C3KvhIDlShV+4aaR
         M4+eCGVYakAwoGny+K+jhn3Aa+ISbSGq3R9+u0g8Fe6Axhckmx+jWRedrVfuFVkBFqCq
         WQqYY38AN1wEmhbHt7ioN6IokSx28V05VBr65tORjNf1vfxiElJi7lboliN/ClgTHM2o
         3jFA==
X-Forwarded-Encrypted: i=1; AKwUvByWWrvID7KW5Lz7keREfWS7IK1c4sjVaPQJlVPfQnnOJZsOr85DkgNG1CiFg+bhcbunBdL5KJ/D9YJNnSw=@vger.kernel.org
X-Gm-Message-State: AFuF++lNgLw/V6ffRg8fee0ihW9qG9eklOtV4Km63HDtmS/38CusEznN
	qJlffiFDfZALuw1RkaxrmDOm3uPKWdeJemWILUfoGhb3Vk9lMHxHg/ju
X-Gm-Gg: AYBFou2icpgQuKvKpQ+q+DPrMybDMCQXn6VqyqJ5WjVZopXb/GhMUhrlVpCHnRE91ro
	wXEn996g1uI6O1oexpVCihaNERkZfVMyxrcWDVu0sjoqpPtZt8l1ye87wQbE5AQW9hWM5Hu4QMy
	XLhOFGm8LU/zDZuEAH5t5TKjnCxvxL95xcF72kntLbjYjOsTTHQMDXW7zEz6QgsuRoCAygigdva
	SB1QyuRGlZiJ2bOJk45Lauj3er+mPebTyLco/saiaUi5Tzs2BbMJy5CHFe19DKDHbAVispC2jr+
	Wf3dp3A4xk/TsIak9j0hj+6SCpHcg16DqIan+7/IC9na8w9dHopQTxZ8NCglWoMLkTD/vtuz6Io
	/YS5iXyopBo0iZyAA13Nb82mqidTyWR33DpbVs+cP6JxuEG0zVK2DC7qTkFzEbvzqr/oVVaH52f
	fxcMt+qd+SCqBleabASpf7CeIpXxKvA3E/EIbHBl7dDDCgD2NNOReqar0ExeTP9hs02bxeZvijV
	z8SCy6vyOnGVad3
X-Received: by 2002:a17:90a:da8f:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39d9bc10072mr2329431a91.6.1789091807236;
        Thu, 10 Sep 2026 18:56:47 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:fdee:b2:3ee8:60d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95095946sm2178864a91.5.2026.09.10.18.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:56:46 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] media: adv748x: Fix endpoint reference leaks on probe failure
Date: Fri, 11 Sep 2026 09:56:40 +0800
Message-ID: <20260911015640.1728828-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adv748x_parse_dt() takes an extra reference for every endpoint saved in
state->endpoints. If parsing later fails, adv748x_probe() skips
adv748x_dt_cleanup(), so the saved references remain held. A CSI-2 lane
parsing error also returns from for_each_endpoint_of_node() without
dropping the iterator's reference.

Save the endpoint reference only after lane parsing succeeds. Drop the
iterator reference before returning a lane parsing error and route all
parse failures through the endpoint cleanup path to release any saved
references. This retains the endpoints only for a successful probe.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 6a18865da8e3 ("media: i2c: adv748x: store number of CSI-2 lanes described in device tree")
Fixes: eccf442ce156 ("media: i2c: adv748x: Support probing a single output")
Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Changes in v2:
- Move of_node_get() and the assignment to state->endpoints[ep.port]
  after successful lane parsing, as suggested by Hans Verkuil.

v1: https://lore.kernel.org/r/20260814134106.1387486-1-ruoyuw560@gmail.com/

 drivers/media/i2c/adv748x/adv748x-core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 3eb6d5e8f0826..70594d0018048 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -675,9 +675,6 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 			continue;
 		}
 
-		of_node_get(ep_np);
-		state->endpoints[ep.port] = ep_np;
-
 		/*
 		 * At least one input endpoint and one output endpoint shall
 		 * be defined.
@@ -689,8 +686,13 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 
 		/* Store number of CSI-2 lanes used for TXA and TXB. */
 		ret = adv748x_parse_csi2_lanes(state, ep.port, ep_np);
-		if (ret)
+		if (ret) {
+			of_node_put(ep_np);
 			return ret;
+		}
+
+		of_node_get(ep_np);
+		state->endpoints[ep.port] = ep_np;
 	}
 
 	return in_found && out_found ? 0 : -ENODEV;
@@ -739,7 +741,7 @@ static int adv748x_probe(struct i2c_client *client)
 	ret = adv748x_parse_dt(state);
 	if (ret) {
 		adv_err(state, "Failed to parse device tree");
-		goto err_free_mutex;
+		goto err_cleanup_dt;
 	}
 
 	/* Configure IO Regmap region */
@@ -809,7 +811,6 @@ static int adv748x_probe(struct i2c_client *client)
 	adv748x_unregister_clients(state);
 err_cleanup_dt:
 	adv748x_dt_cleanup(state);
-err_free_mutex:
 	mutex_destroy(&state->mutex);
 
 	return ret;

-- 
2.34.1

