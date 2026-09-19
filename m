Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E75380FDB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857277; cv=none; b=lFr3W2zAPM2w0mZlso5z8KXiWk0SnTrx8O4Rgnk4Pfkm01EfNQGTVlENfvEAfoCmCxTJdxr4AJsnNV2Gc9CyMS4jCPdHknn7Vn0raFSmrwjM+cqdhGc+eM6mxxF/efKbPz5eankd7qlJEvrvQbNVzoSLrUBtTf5mbMfFTWTxLmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857277; c=relaxed/simple;
	bh=gC++OOJwITlq+qev6bTeZbXJeu2a9jMkJnQkZiZRxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gFVWl24e76gNWDA1chbYrxXCcH11QOx6Wv8iI8MV6eKHnNuAshTda/b5Ltxz2moiaqa6v8+8sjxHd7ARO9K7K2PnLaPRlCo7NHtWZdgigYs3Dft0sI+sz75hEFTu/IeCkbGSwweZ4/kqpWGUXIXf7/ylAocz69Ei/sRaz+hP7AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZkMsOId; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZkMsOId"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91a931f66so11950675ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857275; x=1790462075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CSJfvpEKhzICZxDdQza9cnVlC/TEEQOPCzrF6sAEcIk=;
        b=EZkMsOIdO+0LhgnkY4ay5xCg/Kneba/HcAzKKT7jzc/HKLEcfgDHUfCzd+pfH7rH+p
         sQe3xM9Gb6D5oMBr/kCHGczhQcNdpiSWaB3fZbFvomksK9wu0GVIBfhxafZT31dD7NnZ
         ZuTKOvscPSj0dSfrdKrrJdAZJrPjd7wXgfW7qExNtK6ZaDH5Y0QG7M8J4u6r/4evpEf6
         3AKuRiS89TneJFRP6t3T8zjKnU2NEm22eQRofOx1QtuILm+IBhVpSbcPOC4RYlCM/DzE
         ensnA6f8N1bNcHiANlPCv1OOVsWHtWFlDdkFfUh6JNJTzPbq1N1bCd3PYFwD1aJxY0YW
         1F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857275; x=1790462075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSJfvpEKhzICZxDdQza9cnVlC/TEEQOPCzrF6sAEcIk=;
        b=affdVe7+v1SPFLLtvndXWJBHLIUeWiPHZ0GqmNk5vaEVPTw1FOqL4XczWK4WmEVdAO
         yKmglz7GTaF+6IL3EzqW2qXw6g6wVqIrOd6zJvvO2d6gO2T+94rayMMa6ve8e/xlcv5R
         Tl7JdaysiUwTQtinWxKYpt8u3+jl5fRASXn9pne3bGt0+QtJZ7sQ8nd+M3FOn0utU5Y5
         eX5HT4hncTiWn0h3hwUDbNbYgB6x8BImNncI3IM5nZgLire1SmT4uyav0MGSkJ4Ip6O2
         JzStncwG7WWrRNrhr7IjU92y3aMvslnJnnYPfjWDsfu3+yigTQUPzPIEIvBVi0PyUeBA
         Db/A==
X-Forwarded-Encrypted: i=1; AKwUvBykNdU/4O9WAm9b/2cdfkKx7/LfuqpxMsCsKCmg6NpjxtVJuuJk9tUO85vr7JTJYWFIkZg1HzGhdWsi0l4=@vger.kernel.org
X-Gm-Message-State: AFuF++mhv5RlIhA+Y8Ebe+mhN2u3U/H2ggyTiq2D8w1sWzxqindOJhu3
	BmpcxmLTrCmmYUUIWK9Yv2JvTq5t5jHFsaESm+9Spl4H22kioFqaibPV
X-Gm-Gg: AYBFou155iakOvYltpZVIZXRlmuwwLbABJmC5erCRlMp+9vt0PxXsGPuVJ2RGshkj2d
	0nUpGY70oxMbo6NP+lqWfqAtrVELO97CZYN7rwneiadgNetq4YywIuOS9kH7WN+YI4eUotyxcZN
	aZW5FsXTZ78k06OvAMh6RgnHltfu1bUo8X0R+yLl2vFq8TEeweJYSJZRkZBR1QJnXs6HOjoimtp
	REYhPxpSjbpcqd8y/NOohO5U4gbH5EY5QdoQfOY0WVNFkSv5Kr0kO81GMfxMj+aTJHhgKN2iBkf
	3Qya7JilFeC2mmI+HkVbBG6E2zePt1vE5fdQftnfHE7ReEGP2Evf0BFFc7anGa+wB72js1fk/wA
	MGff5V4rwspGCad2fUdxB1nduLKKS8oymUMxlh9siEkk/oXh7uJ1HY2rsKpIDHNIL1JuDCcdgF6
	9mZ1F75jHFSZOqeYxZrWPL5kut3/uQrWddTPVoSFqkb00kjNMEuz6jMPTDWaHw30Dg+wpex60NR
	tvVzcEjg2PjaQJS89YRvcOoG9X+dZUL8ATnq9f2+lYEikRReKQ+1M+x344ojLHnHr6RTM/uiyrB
	IMrkvDPZjA==
X-Received: by 2002:a17:903:298e:b0:2dd:c100:4b7b with SMTP id d9443c01a7336-2ddc1005f40mr50972745ad.50.1789857275552;
        Sat, 19 Sep 2026 15:34:35 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b471fsm13287455ad.3.2026.09.19.15.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:34:35 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ieee802154: hwsim: fix edge allocation leak and netlink attribute validation
Date: Sat, 19 Sep 2026 22:34:34 +0000
Message-ID: <20260919223434.3882824-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/net/ieee802154/mac802154_hwsim.c, clean up allocated edges
and phys on error paths and validate netlink attribute bounds.

Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/net/ieee802154/mac802154_hwsim.c b/drivers/net/ieee802154/mac802154_hwsim.c
index a9bd1555d2dc..1b325d665177 100644
--- a/drivers/net/ieee802154/mac802154_hwsim.c
+++ b/drivers/net/ieee802154/mac802154_hwsim.c
@@ -987,6 +987,8 @@ static int hwsim_add_one(struct genl_info *info, struct device *dev,
 
 err_subscribe:
 	ieee802154_unregister_hw(phy->hw);
+	kfree_rcu(rcu_dereference_protected(phy->pib, 1), rcu);
+	goto err_pib;
 err_reg:
 	kfree(pib);
 err_pib:
@@ -1003,6 +1005,8 @@ static void hwsim_del(struct hwsim_phy *phy)
 
 	list_del(&phy->list);
 
+	ieee802154_unregister_hw(phy->hw);
+
 	rcu_read_lock();
 	list_for_each_entry_rcu(e, &phy->edges, list) {
 		list_del_rcu(&e->list);
@@ -1013,7 +1017,6 @@ static void hwsim_del(struct hwsim_phy *phy)
 
 	kfree_rcu(pib, rcu);
 
-	ieee802154_unregister_hw(phy->hw);
 	ieee802154_free_hw(phy->hw);
 }
 
