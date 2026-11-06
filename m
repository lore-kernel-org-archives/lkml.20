Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975136;
	b=1VjePpco87OmQdgX4jCwHaAi85fojjRv84A/IcRyxehbF5+ScvT3BlhRmCPdGcAQgZjN
	 nalHtVPwO8z4EGvh9oj9r8qDDxwBsWsEvi/qmAlBVliSxm+n1kvTYknBLHjzNSrzB/OB5
	 BXHmSSFriIDiYWMBeh3z61xT10U7p7aONSwH5EAvje28Iu9IDIWZFB5oIYAMYglrpAIxT
	 k+JpL7jRsw0uRjt7LkH5ruTdKWwPs7FpBdtXjFDKc1fMviT9Fk4UbXQVWoY6tQ94IwnCB
	 3svYQwmGdMtxbsEvPzCf5MRlrhOghXyejvBds/3Z9ExeJbba0Tez8e7WZ0RjEN3LHOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/vQq7/OUg3A7EulCfcTLyC9GSdMx/w1XZowxdVp3bKA=;
	b=C844TJYKkBCCO6Gz8BizWNHZvGVtgjFLey+QySobWf70blt4AUic5XJLEmWEdaFwSrJo
	 vdMB2aN8HvM0Slpk1N7ma2eIQXfJUIsqsYbxV7qawvvcNyiGraFI/Y6zloVtv57JPjSmL
	 VeH24u6/NT5HyD++kemFD5F/r6+W8gqxXAE8C8crQjkKFhEj/QPM//T/HfWfXZ4yqRB4g
	 3NiVBrRzIy+Yh+wr/scOc0TtZh3Dnf+ThFcrr7t+FXvu4yzKpjyWmLDvi5y0IZOzrxzR7
	 kG2Mp++Mw6DGV6iClJFkhMIg9L5LU8Rl6S1XAQUG9MrKVe75a+y9Ezb8ww03VjCav3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W2eonC8s;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64567606D83A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64567606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W2eonC8s
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36ff9c9da34so761517eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793975134; x=1794579934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vQq7/OUg3A7EulCfcTLyC9GSdMx/w1XZowxdVp3bKA=;
        b=W2eonC8s5BJoRJbGppqiM59YV2PN0mcjJtgshuRjRbHdVnNofp+7+PEYxNdpvBxpbF
         x5rYNo2JyVZ4V4R5Le102ZQNLVClJMW7MZuEySu52HnWSQZmSDOUkbP5vnxfuwlJpDfI
         OnuLXNgE0zwBeh84ZysOlJ+KbXUM98KIzUn6GaWW5s9kQaxxMgCuUGVLjfP12ZQXyr0d
         1bWAIW50p2F3lyLjDha6jY4ti7mYGfMqc0N+JVGJm6Uld2hLrwJUthgOUl+Jl5cj1L59
         io/hF4A70i+hbFY3leR89gt8TQE8zmV9Wlo86SCZk7x2SbAfkx9DkYhQoH3kfGlDKL+N
         qsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975134; x=1794579934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vQq7/OUg3A7EulCfcTLyC9GSdMx/w1XZowxdVp3bKA=;
        b=voM9aGSSq77B13tCeuBpPoZX+++pzfmiWp+HI6r2iktb/moPCMxT2N9BGbMg62ujt2
         1Hj/iBDg+ahFylSeDUS529bXpuwftoj/EIoCmK5KhZfat1+JbqRXStUZSZv4ikftvG7m
         g6y3q2xAdC+CNZSF41duebPAAvDYeoj9uZYA2aG8LlCORofmIpCGC/6R6AYbBrPWKh2W
         adYZvlJ+FcN9fx2oSAz7iH4RgGZEoUzwYWfwYJYMuJjSiy9mxWGGPrru4OjGaJOvGa6u
         QTXI4QKySkZ9x3zkWzthzXSiHzrHvtyEf2MKmkMCP0/wO5eCZ876jA1nEo6DmmCFnrH+
         sg8Q==
X-Forwarded-Encrypted: i=1; AL+hErGpFw+P39iJHcJFYabf7z/OpQbci/7C9A4mXVfon07VNxVro1kPT9RShGy07H05wurz3tyIYBiuXyiyfJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FUAvLqC+5zxKj1c2ftqBjtzQtBcQpxdYDh2f2aMpK3/J3UP+h
	9jwYbQezn+Qe3TaArh/H1kU2k/apPfcCPCylqBVaS0f0G9M5TYxt9Arn
X-Gm-Gg: AYBFou0jvpU4UCLCSPUH0FYOz1IdL8g/Uk5u2/Fr8I++gdUpwEXc+mfafor6AIZf867
	Pf5yZMSFuPsyeAWnagbr6jHbTwBJUVJ8uO3beoHzK2I7OZXiLIRZ/OxPa5MHHgxrQA1GGeeDxj/
	WdXS8h/24rgUqxw6P9O+OWStp1a08KQvE5geXkxtn8wSQpzRbOXkW7Ciq5vPZwvuyrJLwV3RT03
	Bdq7XM+0YsgLv6BmA68tAbc5izIWPbbkvCb7v6L3e7xYNvcvdqRfBtj/AL6P97l3YcyZSgO0BOc
	FJqqzjFx246xfsfUUG6oDsbCoW6BeL8JoqcR4PivWL4LgctYK6eFu+UwcjYG8ftR7eAW9PeMh/Y
	huFAPoll2bHPHaJP3Cf0lT9ths8E7n3956hqRcMMaznxCEWwSz1M7QD29vOF2nmb66LwfPOzVPQ
	iKHlI5LKgdFsB/oGVL4renKiyI4c+Ru4K5zOgEWZvDDKBeZdlTtzVgkJYPonXZauv9234OJTfiI
	7aFq7HMxRY4KlAuIKLpnLoMQdr6bWeqYObji+CwKuYmTM9gc1W6JE8ex+tn+JtloUju0A7a6JQS
	5avqaFteWefDyUs5YD9v18ZxDooq2jEI2+ki+tk=
X-Received: by 2002:a05:693c:881b:10b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36f76520e62mr3755759eec.28.1793975134156;
        Fri, 06 Nov 2026 06:25:34 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm7101233eec.26.2026.11.06.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:25:33 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com,
	alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH net v2] tun: disallow setting IEEE 802.15.4 link types via TUNSETLINK
Date: Fri,  6 Nov 2026 19:54:20 +0530
Message-ID: <20261106142421.17793-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101092219.1278751-1-skalpesh942@gmail.com>
References: <20261101092219.1278751-1-skalpesh942@gmail.com>
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

A userspace application can set the link type of a TUN/TAP interface
to ARPHRD_IEEE802154 or ARPHRD_IEEE802154_MONITOR via ioctl(fd,
TUNSETLINK, arg) because tun_get_addr_len() explicitly recognized
these types.

However, TUN devices cannot function as IEEE 802.15.4 radios (they
lack wpan_phy, channels, PAN IDs, and MLME operations), and tun
never initializes dev->ieee802154_ptr or dev->ml_priv.

The IEEE 802.15.4 subsystem operates on the invariant that any
net_device with dev->type == ARPHRD_IEEE802154 is a genuine WPAN device
with a valid dev->ieee802154_ptr context. When an unprivileged user
creates a TUN interface in a user+net namespace, changes its link type
to ARPHRD_IEEE802154, and issues a netlink dump request (such as
IEEE802154_LLSEC_LIST_KEY), ieee802154_llsec_dump_table()
unconditionally dereferences dev->ieee802154_ptr /
ieee802154_mlme_ops(dev), triggering a supervisor null-pointer
dereference / general protection fault. Similar dereferences occur
across net/ieee802154/nl-phy.c (ieee802154_del_iface) and
net/ieee802154/socket.c.

Rather than scattering NULL checks across every site in net/ieee802154/,
fix the issue at the source: validate that arg fits within unsigned short
(rejecting arg > USHRT_MAX to prevent upper-bit truncation), disallow
setting ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR via TUNSETLINK
by returning -EINVAL, and remove these unsupported types from
tun_get_addr_len() along with the unused <linux/ieee802154.h> include.

Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK processing")
Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9ea34da5ca6100593c90
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
v1 -> v2:
- Instead of adding NULL checks in net/ieee802154/nl-mac.c, disallow setting
  ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR link types via TUNSETLINK in
  drivers/net/tun.c, as discussed with Andrew Lunn and identified in Sashiko
  bot review. Virtual IEEE 802.15.4 interfaces are properly provided by
  mac802154_hwsim and fakelb; TUN devices cannot function as genuine 802.15.4
  radios and lack private 802.15.4 contexts.
- Add an explicit bounds check (arg > USHRT_MAX) to prevent integer truncation
  bypasses when casting 64-bit ioctl arg to 16-bit dev->type.
- Remove ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR from tun_get_addr_len()
  and drop unused <linux/ieee802154.h> header.

 drivers/net/tun.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e60..f2915e929e3 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -70,7 +70,6 @@
 #include <linux/bpf.h>
 #include <linux/bpf_trace.h>
 #include <linux/mutex.h>
-#include <linux/ieee802154.h>
 #include <uapi/linux/if_ltalk.h>
 #include <uapi/linux/if_fddi.h>
 #include <uapi/linux/if_hippi.h>
@@ -3183,9 +3182,6 @@ static unsigned char tun_get_addr_len(unsigned short type)
 		return 4;
 	case ARPHRD_ETHER:
 		return ETH_ALEN;
-	case ARPHRD_IEEE802154:
-	case ARPHRD_IEEE802154_MONITOR:
-		return IEEE802154_EXTENDED_ADDR_LEN;
 	case ARPHRD_PHONET_PIPE:
 	case ARPHRD_PPP:
 	case ARPHRD_NONE:
@@ -3362,22 +3358,33 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 			netif_info(tun, drv, tun->dev,
 				   "Linktype set failed because interface is up\n");
 			ret = -EBUSY;
-		} else {
-			ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
-						       tun->dev);
-			ret = notifier_to_errno(ret);
-			if (ret) {
-				netif_info(tun, drv, tun->dev,
-					   "Refused to change device type\n");
-				break;
-			}
-			tun->dev->type = (int) arg;
-			tun->dev->addr_len = tun_get_addr_len(tun->dev->type);
-			netif_info(tun, drv, tun->dev, "linktype set to %d\n",
-				   tun->dev->type);
-			call_netdevice_notifiers(NETDEV_POST_TYPE_CHANGE,
-						 tun->dev);
+			break;
+		}
+
+		if (arg > USHRT_MAX) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (arg == ARPHRD_IEEE802154 || arg == ARPHRD_IEEE802154_MONITOR) {
+			ret = -EINVAL;
+			break;
+		}
+
+		ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
+					       tun->dev);
+		ret = notifier_to_errno(ret);
+		if (ret) {
+			netif_info(tun, drv, tun->dev,
+				   "Refused to change device type\n");
+			break;
 		}
+		tun->dev->type = (unsigned short)arg;
+		tun->dev->addr_len = tun_get_addr_len(tun->dev->type);
+		netif_info(tun, drv, tun->dev, "linktype set to %d\n",
+			   tun->dev->type);
+		call_netdevice_notifiers(NETDEV_POST_TYPE_CHANGE,
+					 tun->dev);
 		break;
 
 	case TUNSETDEBUG:
-- 
2.53.0

