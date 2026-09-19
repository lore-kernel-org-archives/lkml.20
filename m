Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD33148BF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850888; cv=none; b=H4E9RRLlRWdkU0xw0H83HpPVkN2gbz4cxFhJhcHqfzk5kS+aBfTbWJoiO+RfypPFnP0xkjgKVZ5JW2ihVofM8k7EUlPqQDhSWRFRj8kWmcs0b8tEugQN1kl7iqVthRC52zVvRNLEE06zgJ97KAkX+wnh0ck4N/PQp9duvm+dOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850888; c=relaxed/simple;
	bh=PXzOW8D/JPC4glKuSHEeGq8SfS8CyVzZS0VKZ//P1OI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KIn2CZ41LFrfy93KpZX1Z2bI5ftTjE91X9+77zYePbx9pXU/NkCDdclyHgJRed40BWi4uHogEXbSwE5sUhgY/zb2d5sdLUPltD5Rc+Ynd/uhlN4pSDp9a3jmsPeHSTB1+EKNUQJ7cOSXo/kzr5GOYlwak45vJH+wGKw+Xil10x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/jACuv4; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/jACuv4"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso1432874b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850886; x=1790455686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbzMWY27RNn6TvNZ0mX5/THo8gbiTxzyAVe/fdV+7Y0=;
        b=L/jACuv46l2hKmNpEQd8ITYau2awShtYptfgPFBau5HyuF7pcmnFEuYoZXYSTSnVKz
         2Zt4Ii1nmPyuyWTlbbJ8Ub0ohRqkH41qudBZgnlCl3xmj/a4WzTWRZrJDopNmnm5d3kx
         6Ra71/mjV09f+xrJUSamNInLNZOHqfPXLl1MOLTEFZ18sOoCdxlWSJvIm5bhawGEGy4g
         IAgCtb7PnpwnFDTj0RnjXh1lObWdE2TUeLaFkrEj+Q35wglFBQNFzb+2MruIw+/AKtqJ
         POQ2aHDrzDu8b8wPYaXIMF5KGHO/hvKuNVFpkfLn1n19tZw8w0A/OvQaJxSXM3EFmgSJ
         BhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850886; x=1790455686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbzMWY27RNn6TvNZ0mX5/THo8gbiTxzyAVe/fdV+7Y0=;
        b=oKt3gASbxCsFIcGIOeBAjPjFvS1FpTrWbNVXnZqvvb3/9u61gAFDzzlEMg7YIOiT3s
         4C8z6aIYRshQJtkfIx6U4LOk85QzgfYm2XP0ulaYQ6sL2DnLDDsm186YZ7312n26Z8ht
         G6WizuVkpI0hE2QvZjiZlW9u7KlivlVYKhFfwdBSwlo4Z/IzumvfZiYiwN/T5W5db5JW
         aNae4plsYbKBYKMrJ5e5FTRW9HjxcVQLiRvhiyhtxhipX7/1YYGyuozX9H4RX6BWTZBp
         m23VHEM41Z1VnaVt+yWppHqqRZgellg3T/s4tSkbfJrIXfxfUMrWZI14VhoKx6KgAS0B
         PfbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrdkS8yfDJnXx7IEHAlnArpHC5n7Eijo564AhOra3cUjH9mO1M0Kq/JOoujLMcCcayR754AYOq6HXwBfY=@vger.kernel.org
X-Gm-Message-State: AFuF++lyoDyJUuyeJw72dZkTYcY2YwNn7FM3PmkkVKumAsp0DWmBetkj
	ESmZbElhOCfxZNSrlYuXa1j3aW/wiGXYGkqlM5GVULHSfumjvg+NltMt
X-Gm-Gg: AYBFou3+rWO/0DcVMzZX2Cqxsn8wubVLR9Yh6/6wqs7FS1ue2Y3p1GXibWyjgXBVy2v
	lcO0rkws9rtREcw7UJB8CXtjPSeuIjxDbpcLjQi85vROM7f2P2U7xPlMr3UTKT3gXlBLjzWz9lC
	39PiDCpre/Sn6hsJr2PhsUtqhN0semzFGgU8aYMuoES408GfdDymV/Il0jda4dg75fVCH9AyICs
	2YlsCUtbkPicFhYXdKtJG54p+shrL8HEMFdiaAgKYBAkGUVEUC7QqDscDayWveYs91qfY1l5iLc
	jgxzXKXMjZlkJH6NXR5/vdPThyu31iC44hKJwEjsfQtpno4SFVtsSFr4yDYoLiOwPUgzukxbAZd
	cJ68qVzVLmhwKiU7cI8yDX69c4HcTqanjcM4oie3VprkB7NVwEicB4ueNXEyHM0DsJ4Sd9ZUaB3
	2iXkuOwJfo30bcYL5LZE0QiMp0jB7qMt1bV3Ee0FMt6tLuq3j097HYWN25ElIvvJddOWgFvL75m
	X9uEbrtMpQZbZfnD984xdEZmJ/aFXntnRFcKiKhGZQSSGrlZIhedMqtcM12WMZwayDluD+L0Zoc
	waGJWfg21A==
X-Received: by 2002:a05:6a00:2ea8:b0:878:3658:23dc with SMTP id d2e1a72fcca58-87836678cfcmr2747328b3a.53.1789850886311;
        Sat, 19 Sep 2026 13:48:06 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95f915csm1282928b3a.29.2026.09.19.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:48:05 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ethtool: tsinfo: release net_device reference in ethnl_tsinfo_start()
Date: Sat, 19 Sep 2026 20:48:03 +0000
Message-ID: <20260919204803.2811673-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike ethnl_default_start(), ethnl_tsinfo_start() keeps the net_device
reference acquired by ethnl_parse_header_dev_get() in
ctx->req_info->base.dev until ethnl_tsinfo_done().

When a Netlink dump (NLM_F_DUMP) of ETHTOOL_MSG_TSINFO_GET specifying a
device header fails on its initial netlink_dump() invocation (for
example, with -ENOBUFS when sk_rmem_alloc >= sk_rcvbuf), Netlink keeps
cb->cb_running = true without calling cb->done(). As long as the Netlink
socket remains open, the netdev_hold() reference is held, causing
unregister_netdevice() to hang indefinitely when the device is removed.

Save dev->ifindex in ctx->pos_ifindex with ctx->single_dev = true and
immediately release req_info->base.dev via ethnl_parse_header_dev_put()
in ethnl_tsinfo_start(), looking up the device transiently by ifindex
inside ethnl_tsinfo_dumpit().

Fixes: b9e3f7dc9ed9 ("net: ethtool: tsinfo: Enhance tsinfo to support several hwtstamp by net topology")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/ethtool/tsinfo.c b/net/ethtool/tsinfo.c
--- a/net/ethtool/tsinfo.c
+++ b/net/ethtool/tsinfo.c
@@ -295,6 +295,7 @@ struct ethnl_tsinfo_dump_ctx {
 	struct tsinfo_reply_data	*reply_data;
 	unsigned long			pos_ifindex;
 	bool				netdev_dump_done;
+	bool				single_dev;
 	unsigned long			pos_phyindex;
 	enum hwtstamp_provider_qualifier pos_phcqualifier;
 };
@@ -476,12 +477,15 @@ int ethnl_tsinfo_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 	struct net *net = sock_net(skb->sk);
 	int ret = 0;
 
-	if (ctx->req_info->base.dev) {
-		struct net_device *dev = ctx->req_info->base.dev;
+	if (ctx->single_dev) {
+		struct net_device *dev = dev_get_by_index(net, ctx->pos_ifindex);
 
+		if (!dev)
+			return -ENODEV;
 		netdev_lock_ops_compat(dev);
 		ret = ethnl_tsinfo_dump_one_net_topo(skb, dev, cb);
 		netdev_unlock_ops_compat(dev);
+		dev_put(dev);
 		return ret;
 	}
 
@@ -533,6 +537,13 @@ int ethnl_tsinfo_start(struct netlink_callback *cb)
 	ctx->req_info = req_info;
 	ctx->reply_data = reply_data;
 	ctx->pos_ifindex = 0;
+	ctx->single_dev = false;
+	if (req_info->base.dev) {
+		ctx->pos_ifindex = req_info->base.dev->ifindex;
+		ctx->single_dev = true;
+		ethnl_parse_header_dev_put(&req_info->base);
+		req_info->base.dev = NULL;
+	}
 	ctx->pos_phyindex = 0;
 	ctx->netdev_dump_done = false;
 	ctx->pos_phcqualifier = HWTSTAMP_PROVIDER_QUALIFIER_PRECISE;
-- 
2.43.0
