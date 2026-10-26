Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019425;
	b=vO0zOb3BJ3wyLutGIh9kmFS92XuMxKsdAsN+r4p5+eXRUyCoofFr35MztfegPk23mxOf
	 0U1hYIo+fWsqgFS7Ai0bbaND5FioHbse/sfkwRQSCRWZ5uja1l2CdYcdm8Zu+l8LtQY92
	 dRItzmOvJ9kLFf1rltiNmynbhsn3ha7Om8wizhl1O5ihfG6nddLCkTGbEXfsO8ex5rfJB
	 Lg2vLvaNz4R3YYQaqv3P2y04sHxSof1OnoiDNtA3cXS1ENjU2MtWZH4sHn2PKuQ5rjN8m
	 0cg9bEF2wmuE9yteQkJ1GLPlWqrppGuO+Icha/V2tXSOhj3sEjgakXDxA0oSUZ8hcNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oVuKwGIjjXyEyowEZBI9FlnKfe9p52diw5KrP0Znboo=;
	b=C1pjQJCNEkK35YHBBisjnFcNJA8fHFPYUikUASpbYS/vjr5Q8Cvi9YF9WAdL397q6Dvk
	 XZ04+WodB9OZ4oOld+IN4klodzZGIvW6vUaVFC6bL5slQ4U3gCpaY+W8/UJ6tghXS8DPq
	 HfoqPkw2Xiep2YgrpemWC7Wu2raoMvtSkkCpSxxyxeuPUPjRXtIPBYgmDxZlI1axSPenP
	 cAGxrShr7GaeY1y5ATnl2Z1L7/ILiTGaQPwTVSVZS0qcIaZ8ZN4mG/Tx4G87Z8pCVCwkV
	 CGgpCu1WHxI1YDaYxsU9ULAOYFXkRsrLQxSHd5G+zNdn9jKRG29bqj9gvKWxBamIzZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qeT6jpq7;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB669606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB669606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qeT6jpq7
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso984940b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019424; x=1793624224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVuKwGIjjXyEyowEZBI9FlnKfe9p52diw5KrP0Znboo=;
        b=qeT6jpq7I2LtcCl7Qu+xvIx4uXs73wb44YbT+9FyF5C+Nvgy2bQ3j895OsD8OSGjv+
         +WpZUhX3+6+HKHt36sD1KG4MamoCCYpfCDJWzyybL3852TFmnOC3nV8dJz66sIMFo0cm
         zGXLZYClv3iIVLDNnosegCl46e3XKjAhyJQr+fMh5kTtGcHb1K7ZvTn6ZHq0fJa6rcif
         TFP68HrzEngo/vAKB7+uwijarPNp7kCDie7c3Jb6T1xlY4fXQ5dxi9HqEZgPeRIzizsL
         9vEI5m54WwHFu37BI/48u28s1k+xCO0Qtk6EqCpTX/KMerMklAibB06TfrfCHS/I4nWA
         zkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019424; x=1793624224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVuKwGIjjXyEyowEZBI9FlnKfe9p52diw5KrP0Znboo=;
        b=C5ARU7zlseHgX2Tbd8Yli8lNDsQHV/N3z0jO6tdA1QtLF0YM/6b9wtg3cZAAtIeDYz
         ReU+tgY8BxwddrAabwIOEf+6IfuasM5/zU1r2H2crgsSpHSVEYE77mGjgDS5pSEgUl5z
         KookgjIbA80O38O6IPXSSmLBKhgLa21prBi4AfaBt4JK8ENOYdrC8921cCC5ITPCcmaF
         7kB7w9F9k4gYGuZRUVuWMHq74hnIn11aJtBAWYtPN6Uh/h2dBGoAYlftfqFzVq8sqze6
         9FlVS/JsKvibyleoIXOTwFchMAsIQJRrIJUTPidx7FEoXzwHbAY23PGk7ArYcgu7dCjl
         SsaA==
X-Gm-Message-State: AFq9FYJlr/Jv/EessS76ed+vac/DGPZkuvh+buo0ewvoRIjWA8CUuRG3
	qukvCRFoXwiGVIuryBbUOfHJqyAem53c9wIbYnLDu02cbof4SwO15GKk
X-Gm-Gg: AYBFou2nycAVhv0f+mvZuV1/j1TrovBkM8KPtFoBoxxyt3REbd/gZLDpLiefWTRWvph
	eR8Ts95m3sFxx3cZJGxn8SQnpLRroVeSvNfKo5UVelckHqbGhyp8oxD2Zb7COT7beiGmoqf1g9o
	PX8AfIcJ19dXxHEyFG5wL8tmV4bCQ6O4yHSnUBYUZHPp2DDqvDSwQel5rENI/KphsDnjjEL1e9A
	YIOIPeytt5RfUK0ko7/FOBdhUU5A2Ues74ZEWffYjjoN2YGkCgEC9dTT8pf3JiYSjF/U6GobYru
	jVU2dDtgJVLxT+1GBulCPPkWjt9IeL4ROuk2bO1WFkROTwJbLYIXK7cwJfXmZj+oFZuRbkzfVgc
	cHga5so/4JPZCV+qDXrSpkpgpoMkJ9lbSBq9w5GnjIaSi7PEpBvWradrTBxTwa+RdrnsUbPcnIT
	iW/SJjXi4ica5sSMlMhb+GYEGlm/cVhIsGmMlyz1YTkRdnNniC6OazTXaNooq7k5MEa8U45GBfV
	4a6WjJ3jz9FKVnH77r0ECFjDUuGC7f7Y8tRWM9khpUCLV1fZTc45LAhTZBQ5CQfNaX7trm4nQi/
	yiVlSNTnzN/FXfFF63M69ZWX/ExybFxT7yEOHQD+0flD65rMbJl0HOt97IQjkRVDYsjWBPTt4Iq
	CnFyfKX7DfelI8LYqHm2MVq6+CLrG
X-Received: by 2002:a05:6a00:a20d:b0:89e:261c:448b with SMTP id d2e1a72fcca58-8a366d7a756mr5101551b3a.34.1793019424147;
        Mon, 26 Oct 2026 05:57:04 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm1336811b3a.7.2026.10.26.05.56.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 05:57:03 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH 2/2] most: core: serialize comp_list and pin the matched component
Date: Mon, 26 Oct 2026 22:56:07 +1000
Message-ID: <20261026125607.73453-2-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026125607.73453-1-yuz08559@gmail.com>
References: <20261026125607.73453-1-yuz08559@gmail.com>
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

comp_list is walked by match_component() and components_show() and
mutated by most_register_component() (list_add_tail) and
most_deregister_component() (list_del), all with no lock - the only locks
in the core are per-channel. A components_show() read or a
match_component() lookup can therefore run concurrently with a component
module unregistering and unloading, walking into the list node that
most_deregister_component() removed and the module freed, i.e. a
list-traversal use-after-free.

match_component() also returned a bare pointer that its callers
(most_add_link(), most_remove_link(), most_cfg_complete()) dereference
after the lookup, so the component could be torn down between the lookup
and the use.

Add a mutex around every comp_list access, and have match_component()
take a reference to the component's module before returning so it stays
alive while the caller uses it; the callers drop it with module_put().

Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/most/core.c | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/most/core.c b/drivers/most/core.c
index c2616da..d17f538 100644
--- a/drivers/most/core.c
+++ b/drivers/most/core.c
@@ -28,6 +28,7 @@
 static struct ida mdev_id;
 static int dummy_num_buffers;
 static struct list_head comp_list;
+static DEFINE_MUTEX(comp_list_mutex); /* protects comp_list */
 
 struct pipe {
 	struct most_component *comp;
@@ -445,14 +446,21 @@ static const struct attribute_group *interface_attr_groups[] = {
 	NULL,
 };
 
+/* On success takes a module ref; caller must module_put(comp->mod). */
 static struct most_component *match_component(char *name)
 {
 	struct most_component *comp;
 
+	mutex_lock(&comp_list_mutex);
 	list_for_each_entry(comp, &comp_list, list) {
-		if (!strcmp(comp->name, name))
-			return comp;
+		if (strcmp(comp->name, name))
+			continue;
+		if (!try_module_get(comp->mod))
+			comp = NULL;
+		mutex_unlock(&comp_list_mutex);
+		return comp;
 	}
+	mutex_unlock(&comp_list_mutex);
 	return NULL;
 }
 
@@ -517,10 +525,12 @@ static ssize_t components_show(struct device_driver *drv, char *buf)
 	struct most_component *comp;
 	int offs = 0;
 
+	mutex_lock(&comp_list_mutex);
 	list_for_each_entry(comp, &comp_list, list) {
 		offs += scnprintf(buf + offs, PAGE_SIZE - offs, "%s\n",
 				 comp->name);
 	}
+	mutex_unlock(&comp_list_mutex);
 	return offs;
 }
 
@@ -666,12 +676,15 @@ int most_set_cfg_packets_xact(char *mdev, char *mdev_ch, u16 val)
 int most_cfg_complete(char *comp_name)
 {
 	struct most_component *comp;
+	int ret;
 
 	comp = match_component(comp_name);
 	if (!comp)
 		return -ENODEV;
 
-	return comp->cfg_complete();
+	ret = comp->cfg_complete();
+	module_put(comp->mod);
+	return ret;
 }
 
 int most_add_link(char *mdev, char *mdev_ch, char *comp_name, char *link_name,
@@ -679,11 +692,17 @@ int most_add_link(char *mdev, char *mdev_ch, char *comp_name, char *link_name,
 {
 	struct most_channel *c = get_channel(mdev, mdev_ch);
 	struct most_component *comp = match_component(comp_name);
+	int ret;
 
-	if (!c || !comp)
+	if (!c || !comp) {
+		if (comp)
+			module_put(comp->mod);
 		return -ENODEV;
+	}
 
-	return link_channel_to_component(c, comp, link_name, comp_param);
+	ret = link_channel_to_component(c, comp, link_name, comp_param);
+	module_put(comp->mod);
+	return ret;
 }
 
 int most_remove_link(char *mdev, char *mdev_ch, char *comp_name)
@@ -695,15 +714,20 @@ int most_remove_link(char *mdev, char *mdev_ch, char *comp_name)
 	if (!comp)
 		return -ENODEV;
 	c = get_channel(mdev, mdev_ch);
-	if (!c)
+	if (!c) {
+		module_put(comp->mod);
 		return -ENODEV;
+	}
 
-	if (comp->disconnect_channel(c->iface, c->channel_id))
+	if (comp->disconnect_channel(c->iface, c->channel_id)) {
+		module_put(comp->mod);
 		return -EIO;
+	}
 	if (c->pipe0.comp == comp)
 		c->pipe0.comp = NULL;
 	if (c->pipe1.comp == comp)
 		c->pipe1.comp = NULL;
+	module_put(comp->mod);
 	return 0;
 }
 
@@ -1222,7 +1246,9 @@ int most_register_component(struct most_component *comp)
 		pr_err("Bad component\n");
 		return -EINVAL;
 	}
+	mutex_lock(&comp_list_mutex);
 	list_add_tail(&comp->list, &comp_list);
+	mutex_unlock(&comp_list_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(most_register_component);
@@ -1257,7 +1283,9 @@ int most_deregister_component(struct most_component *comp)
 	}
 
 	bus_for_each_dev(&mostbus, NULL, comp, disconnect_channels);
+	mutex_lock(&comp_list_mutex);
 	list_del(&comp->list);
+	mutex_unlock(&comp_list_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(most_deregister_component);
-- 
2.43.0

