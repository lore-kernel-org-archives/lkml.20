Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408281;
	b=VntOIlDjhhHr7vV2PWnsY9zISJXntbnBsUIISiaq5HSBUaPcyRpoj+1uK5mjWgWxp9pH
	 k2sASGesmhnwoPcCPAwAwtSksvdy52+W2/JScdkbsioIDXgMNzU6mQkuWABcAi1bVEiBV
	 SZqa4CUzvkwyCIx0pdZFBo/fXRAulc6eid3X1TlyhUbHBQyhRIqRDlt10+2uPa74ZKR3y
	 Y7eeoolcp0Qx/RRh7is0oUfts9mKcd27yD5aY3GsUlj+mLOKUjdRvx9qElkwUtkc6Ot3a
	 0HJ9u+TC0DGk5uI6T0zmikBj1aZxRJLnw/1+FPlG7hYLfExkYxN11IkmiyYMf6PKr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=;
	b=u5PqiRmTanTlTZLfZDKWqngxT9bRfxIt8uG+TjCCTCTZ1tXnUm6s8OWc9ZFnQ0vM/gsO
	 OwOY7LApuNPZ8PP69pM98f2WxsAvdBjLaph5n09TX2KhVny++7p+Hv8kOucFwwV3XOA76
	 D9oNdnqn7ePQcIrEDwX6GlALDL+LbseAmYM0k5eKXCpLmT+uv0RW8vVskaztbBYLyXMU7
	 JJwjGM4LUoHku+RUOfdFrvpRJ2iUf/nczVZy4OWJ9VkWa3oHXdojLoWUo5mDXiyX20Wx+
	 gnsRAx8DH9DIwcZQEHmOJPceuWtVJDZY9jhEAZljPf6p+kFbD+pxjTQn9fJ10li84zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+Swmzkm;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78D60A3811
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B78D60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+Swmzkm
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so20882225e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408280; x=1795013080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=;
        b=k+SwmzkmeruMyqeW5z6x/dsExshBytMDpxcO1OU4qU2kAfFNVuzAQtHDrHYdDz8Hvm
         OUTVWbCxynl3CtGFNMp8o95ip7H7qCrf4O6LhRcD83LHbP/PYgnVvUZaJmlWhGa5x4ye
         n61r0y9ZWtacYE/iYoFN16Awu2pzCeBbK6DKAMF0mtTVLikRG4NeubyuQlF5y78PQYbA
         HvE6ncIX0yo6Ivf0fAlIYHFj80507YdfWQS6mwo4eka9u/uBZjTqhRu3dyNjpovlWdeH
         LGurjKJgjfzKrmdes3ZpL4QHaBLzB4aG5TSa3q/Ry1xfjk3b0BtgqZPPlQoCFDt/oENg
         APVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408280; x=1795013080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=;
        b=iju23kOzl57DM8i1OS00RCBFjqYaiWCjSB9PfPWD1LmjM9vYBFK/NfdHuNWaS1KrAX
         pQS5IYFm37USLr+xw6A/plfAW2+GF5J3/8s1dQgJh1fI9iOJS37Zg/ROqvOefTVdplhJ
         92TkHD8iERH2VkPGsAvaVLwQjr7tc3lKkF+6Ya2X4ng/K7bayQ/JLZ9lF5M4lax6j2Ro
         NNnduWxdy6MBlOF7oigBMVi31rXMSaxy531uTU5J8Efc6q6RW9nS95Gpi+1zBKazSGFj
         9N6mtKZvcsSXAXmxunAr+gSWgtztBb1IwOm+/WGI85xs/H51pyQXixfH8tIHR/f/nuNH
         yF6g==
X-Forwarded-Encrypted: i=1; AL+hErHB4WaAW+/zVakS3zu8SB2yIpOM54Kww3kx8SYqn9CluxJFkIHAlrRuZIpUc+aPQVbCftSTITDy3DUcw2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/StORc2EjND+7Z8BnX5Izdy1bh79jlBYIUgOYeCMPb++3cPguU
	qB2GFtoZiYR+b+p6J0xUNhM0/HT7dLPPS3MZiL0EPjJm2QWPkl4M8l9l
X-Gm-Gg: AYBFou0J1ICpayEH311dsnsEA2nWoZ9MeFODS+Dlq8lRkfQj8ctXXV2KrX3YrcxKZEM
	GHtvF+k0Qn1k6YVgGrIOxlZJUi9wFdIdbNwI0a0pHcNY5T8PxlEC0BcTleukk7WzF60UoMPW5Fu
	KjlU7T7LtAPbhm4HJXgewHK6wmBrDrDMSq1+UMrz/LGNhx0ktEoaeAuK6+XKtJyn+7aAkryPIj9
	siIGFfzVLNGeBjCkrfKsk5o5V5MatSUV8LVZcbtvb49edqUfYILEAWUj4unoNOcQoBrpbVqyEjR
	K88czaXTxzh7uyU2z5jhUHkZbMw8SxJGfc0Lp7C7UDsoi25DMTh17B+YFGPkxTZtXhRnzb360kQ
	w1EFUEiqsG4vccj6CG6f4ZzhuPPMqF0tIaL0rNF4eTPgEmvlvkFJirX5hgX1Wi62+J2Yn4mpfQR
	rM5KSw0FLJkpRCyy9EMbLnTscRZHMddNjNOAvK7/ekKOaQY1otYqPw/lb7uTDrHt5vvJiPEiW1r
	lA+6vQwGsK64q75+jKdKL2xrpC4HltjXSZZGGm4J6ky8wYiTmQ1+/6wQRSfbda6Js6eLRrQhPHv
	ODEoNCKALRt4EnwlwWVUBGwUO+URh9cgk2f6uBJlG+LzAqYEDkP1FXFC
X-Received: by 2002:a05:600c:c83:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba0936f386mr49865155e9.24.1794408279927;
        Wed, 11 Nov 2026 06:44:39 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:39 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 5/5] net: ethernet: zte: zx279128s: debugfs knobs for the WLAN ring
Date: Wed, 11 Nov 2026 15:44:26 +0100
Message-Id: <20261111144426.1321237-6-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

wlan_state (counters and port table), wlan_inject_all (inject every
frame of the bound interfaces, as the vendor firmware does, to exercise
the ring and the trap path without flows) and wlan_bind (bind an
interface by name).  Testing aids, kept apart so they can be dropped.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 drivers/net/ethernet/zte/zx279128s-wlan.c | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/ethernet/zte/zx279128s-wlan.c b/drivers/net/ethernet/zte/zx279128s-wlan.c
index 6c6f6a36d34f..29970db47a41 100644
--- a/drivers/net/ethernet/zte/zx279128s-wlan.c
+++ b/drivers/net/ethernet/zte/zx279128s-wlan.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/tcp.h>
+#include <linux/uaccess.h>
 #include <linux/udp.h>
 #include <net/arp.h>
 #include <net/cfg80211.h>
@@ -751,6 +752,38 @@ static int zx_wlan_state_show(struct seq_file *s, void *data)
 	return 0;
 }
 
+/* Bind an interface by name without waiting for a flow (testing) */
+static ssize_t zx_wlan_bind_write(struct file *file, const char __user *ubuf,
+				  size_t count, loff_t *ppos)
+{
+	struct zx_eth_adapter *adapter = file->private_data;
+	char name[IFNAMSIZ + 1];
+	struct net_device *vif;
+	int ret;
+
+	if (count == 0 || count > IFNAMSIZ)
+		return -EINVAL;
+	if (copy_from_user(name, ubuf, count))
+		return -EFAULT;
+	name[count] = 0;
+	strim(name);
+	vif = dev_get_by_name(dev_net(adapter->wlan->napi.dev), name);
+	if (!vif)
+		return -ENODEV;
+	mutex_lock(&adapter->ppe_lock);
+	ret = zx_wlan_is_ap(vif) ? zx_wlan_port_get(adapter->wlan, vif) : -EINVAL;
+	mutex_unlock(&adapter->ppe_lock);
+	dev_put(vif);
+	return ret < 0 ? ret : count;
+}
+
+static const struct file_operations zx_wlan_bind_fops = {
+	.owner	= THIS_MODULE,
+	.open	= simple_open,
+	.write	= zx_wlan_bind_write,
+	.llseek	= noop_llseek,
+};
+
 void zx_wlan_debugfs_init(struct zx_eth_adapter *adapter, struct dentry *dir)
 {
 	if (!adapter->wlan)
@@ -759,6 +792,7 @@ void zx_wlan_debugfs_init(struct zx_eth_adapter *adapter, struct dentry *dir)
 				    zx_wlan_state_show);
 	debugfs_create_bool("wlan_inject_all", 0600, dir,
 			    &adapter->wlan->inject_all);
+	debugfs_create_file("wlan_bind", 0200, dir, adapter, &zx_wlan_bind_fops);
 }
 
 /* ---- init / fini --------------------------------------------------- */
-- 
2.30.2

