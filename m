Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432723394B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791767857; cv=none; b=a0SOVegU6dhOwuUViYJboGBlVZyjdOXd/1axGMbSY/khXRsGoux9LpipuHsvEt36nwdjmE+Z5fdW8/Qj18eqtJrtg9u7Y/EDsFTzJYG1lIV+58bBCf1oCacZ31pCQq1mLlc7e5QGtGmjFD3VDsx0ZChSFOf/4Qtj03+mOO+zRkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791767857; c=relaxed/simple;
	bh=hQ0V4emjN35pL22c0loNCh7/yoeuZXj8fb7w+F5wmuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDjWgvO8IknXK3CwfINiUf1bDU1zwzF6wK4zvLI0eN23dHnIUrT6rY8m9Fs4W4ljPxG69ufZq547FGkz+AQziHZ3N/fc6uq+/hkx9w+0ffxxC8TRqF/CkMGY7IQ4jod4LiLZmoPtQwfUUvnGJTpYE0irGxxB9WAjr+GPhyn4VaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtHVgD8l; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtHVgD8l"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc7cc8aafe6so424309a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791767855; x=1792372655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLEFCbx9qwaV8Sh994v6fbEqFw9fgRzVy0l3bJClDuU=;
        b=dtHVgD8lCmdOgapM3trbUYsr6AY4zJkieaXFMVY8oX4F+cdBGUIc6IVFQs7GUBMl84
         U3yahS/xinMNsjVZXLUQT5Fx7rVc2ls8nHAS2W+igZVlhicfOfqgMur0OepwwbXftHBZ
         i9rK2Ip9hdgEuGZ4CNWufNsbKF8dT7SMeD/k/aIsX42WJwHjKy7Sb7OZCTO+MRdNBkIr
         lNZkJR1wYaepW6iXrB0VF1p+2qlV2MVIJ5IB8gtdsLqR9Zw8LEw8ZqQ3Dr3Vm9XQglXb
         WPLmwVMM2icWqb1lZIlV/l99ZzmcpA2hEAZKRTq18rAT7zrz2yGNfkIkN5QZRvVSrNw8
         tQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791767855; x=1792372655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLEFCbx9qwaV8Sh994v6fbEqFw9fgRzVy0l3bJClDuU=;
        b=Ia3tUzghVhDakW/GoYKKzlZ4Z/S3rX9kDc6zgbySmVkGR4UCMQ1Rdh3w214RhFXo9D
         IehBgQVTtPxGN6y9ENMg2VNYes4Q43lHJvKdVZztT+iJ2QE+lgQAL/XnlZ9Mw592sk2Y
         d1a6j3L1naN474FCt/ZebTZoadHJZEsR6VnSgaB7sZCttMge21b22m++XnNb/3UpZR7g
         7R2+PeDblEwpIbo1Mi0VJAe3TrW7pvOmgSQa67uJ10y4K9yY16S5xsGvfTlB+9QwrlEO
         duu3X8oi0mOIIxbnpi4ljCEd2ig5ST56oFUn4Jrh1o74Y96q8CJyjeXGN82zuoSSFkBa
         y89g==
X-Forwarded-Encrypted: i=1; AKwUvBzTTEW7KYgXWdxjxISc9443ND6nC0g1+UL9MbCzpQFUxPdjC+YDPfNzwBwT0zwmBbeM7kDZ0F5Sz3FPMZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXkupKeX86zj6dhzHLUsPV6gI8D7vltgwQqaP9zwAHg3fBLCzn
	ny5Su8qfh0eptqR+EUQpUPvWWkFl0/F51dr4xjV4W3yaM6Mg4OdcF2FK
X-Gm-Gg: AYBFou2VziOUb5lfO8n7kvQA7uHlaDLOMUgwYmyHolUbM8+YaaxZexEnuLrUiRNLnxn
	8t4iK8zBnMKsk4caViFSmrBRM0b4VRTokfm52dEUOVUs7ejFmlVeeZeShi2PJhrGc16E4DVRtJj
	tBWlIFXRRMlQVv/K+qs2hAEzK6+/hwPWHS1k3IoaAFlsa07CXfblibd4yiIUOk2gdCuPQpPzxSK
	imUb3g69t5EEdChCbMnTP2Kbx47rgua6L5bID5Onr5Sk8SyPLTGktVkQCSEsHlWuwolPes25xt4
	cMj105PnT8XI599Hswjzr2BBeTMGlkeeUuRYbIQOlgYXczoy66JcH15cobD02g9SKPYIG527vT5
	2giaKnRLP+4qe/+JsZC26RG+929ltYth4R1wGcB02egSNo8XruxaOrZkacxATZAu8zF104TabVT
	TaGrX7iLgrz0wbzrN3t35oxrkGDKeMkPaOvZJJWEkhHGVOy/TMooceVkuy06WBI0TNyiP/Rsz3h
	nCRktdBIzYI2zRIcyjAMiL60QDx0NTNu8EJRh8sY1Xo0ij6yNRoHqIgiWG+Qu5nynQbMN975JGD
X-Received: by 2002:a17:90a:d44b:b0:3ab:365f:ebdd with SMTP id 98e67ed59e1d1-3ab3ad2029bmr6553771a91.37.1791767854603;
        Sun, 11 Oct 2026 18:17:34 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm13743307a91.8.2026.10.11.18.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 18:17:34 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v11 3/6] net: add a generation counter for dev->mc changes
Date: Mon, 12 Oct 2026 10:17:04 +0900
Message-ID: <20261012011707.3378-4-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012011707.3378-1-sigefriedhyy@gmail.com>
References: <20261012011707.3378-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A multi-part RTM_GETMULTICAST dump of dev->mc resumes by position, so
entries added or removed between two dump rounds can be skipped or
repeated. The IPv4 and IPv6 dumps report that with NLM_F_DUMP_INTR by
stamping cb->seq from a per netns generation counter combined with
dev_base_seq, see inet_base_seq().

Add the equivalent for the device multicast lists: a per netns counter
bumped whenever an entry is added to or removed from any dev->mc. The
list helpers do not know which device a list belongs to, so give
netdev_hw_addr_list an mc_dev pointer, set for dev->mc only, and bump
the counter of dev_net(mc_dev) from the count helpers. That covers the
dev_mc_* helpers, both lists of a sync, the hardware sync helpers
drivers call from their rx mode callbacks or their own workers and the
reconciliation after an asynchronous rx mode update. It is atomic
since the writers only hold the address lock of their own device.

Used by the following patch for the AF_PACKET multicast dump.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 include/linux/netdevice.h   |  3 +++
 include/net/net_namespace.h |  1 +
 net/core/dev_addr_lists.c   | 15 +++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 3d9e3a70ca5c9..6c837ea34748e 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -259,6 +259,9 @@ struct netdev_hw_addr_list {
 
 	/* Auxiliary tree for faster lookup on addition and deletion */
 	struct rb_root		tree;
+
+	/* Set for dev->mc only, the device the list belongs to */
+	struct net_device	*mc_dev;
 };
 
 #define netdev_hw_addr_list_count(l) ((l)->_count)
diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 46b4c67e2966f..c29a22ca178fa 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -71,6 +71,7 @@ struct net {
 	spinlock_t		rules_mod_lock;
 
 	unsigned int		dev_base_seq;	/* protected by rtnl_mutex */
+	atomic_t		dev_mc_genid;	/* dev->mc membership changes */
 	u32			ifindex;
 
 	spinlock_t		nsid_lock;
diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index d615192d1c3b1..3ab053cbf8b99 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -16,9 +16,19 @@
 
 #include "dev.h"
 
+/* RTM_GETMULTICAST dumps use the netns generation counter to detect
+ * changes of dev->mc between dump rounds.
+ */
+static void __hw_addr_changed(struct netdev_hw_addr_list *list)
+{
+	if (list->mc_dev)
+		atomic_inc(&dev_net(list->mc_dev)->dev_mc_genid);
+}
+
 static void __hw_addr_count_add(struct netdev_hw_addr_list *list, int value)
 {
 	list->_count += value;
+	__hw_addr_changed(list);
 }
 
 static void __hw_addr_count_inc(struct netdev_hw_addr_list *list)
@@ -33,7 +43,10 @@ static void __hw_addr_count_dec(struct netdev_hw_addr_list *list)
 
 static void __hw_addr_count_reset(struct netdev_hw_addr_list *list)
 {
+	if (!list->_count)
+		return;
 	list->_count = 0;
+	__hw_addr_changed(list);
 }
 
 /*
@@ -521,6 +534,7 @@ void __hw_addr_init(struct netdev_hw_addr_list *list)
 	INIT_LIST_HEAD(&list->list);
 	list->_count = 0;
 	list->tree = RB_ROOT;
+	list->mc_dev = NULL;
 }
 EXPORT_SYMBOL(__hw_addr_init);
 
@@ -1197,6 +1211,7 @@ EXPORT_SYMBOL(dev_mc_flush);
 void dev_mc_init(struct net_device *dev)
 {
 	__hw_addr_init(&dev->mc);
+	dev->mc.mc_dev = dev;
 }
 EXPORT_SYMBOL(dev_mc_init);
 
-- 
2.43.0

