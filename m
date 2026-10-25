Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892852;
	b=xOTdzn0708FXCwXNF54VEaOqYqecJ+vHh05/1fNMQDJdBFWgKOU8qU8qoeQnQRJ0a5tn
	 2SPrfCVWBsQ1hbooYtCagBbdTACSrFCszylhLDRASc89U59VTzO/DZ1qQyPqtONGVBuIq
	 +ldJ3E4Qktzc+AQ01el0h9hFZ0tfUU4Ee5Tb0nZ1O+zTn3g2ksm0mFtZ/aNz0j0Af1WRj
	 nijk3U10v1k0acwNpSvSi0vPaWDk3Cmmt4dj+UhXOUkuaKkQTO48etCEIjP2VM7FHshus
	 eaJQsWu0DPnvLh2X2LpJBAqFfPcQsKxQgpQULRZupWGzt49pGKAGLtpm4jzxBBTqGcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LKl9wz07od1KtnGqk5r36fEXu2WKt0H3YytCVeKpeLc=;
	b=jlFZbZNOs+/5hG3Y5EOi3EhtlPy6+th0+T8IKjWQCoaYbCMP1Xdj4Wmg7In6UQt79OPe
	 A3EZPJkUC3QkSrvXuAWxwUzw96eR1hNFjYmnJL3iCZLq9QeHwv2OJcA//JPgIjLYPcxO+
	 v25cMhuxkd7t4V9bXtNMfNn3/92+e4v/s7IdiX7FXVPSmCP7M0PLBEbJcoBTay7GADYgf
	 OQaRKE7BgHgG3DKll7p66DJbwmg6bNBum/pj3O9hJdh8suFM5MCOkIqr+thPQdwkEAayQ
	 Iga0JizWq93PeJefTOk9IyBUSKMkDR0fNAO9TG/LdSFZPt1AK2JE4Rg86BzY7c1elqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HyVygiV3;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4677606A323
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4677606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HyVygiV3
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so1255649241.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792892851; x=1793497651; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKl9wz07od1KtnGqk5r36fEXu2WKt0H3YytCVeKpeLc=;
        b=HyVygiV3dVJOSmEqo+6npbk5JJr0kWBwET4OBfC+fWzK60JaYMRV0qoe1jnAuch9j4
         CZgOpMD0yClGjlJiDGCDVGwXi9DusFLOd6LaXL2GDNXhY7nTPxalYk9BlHrX64vHzp5w
         ADAsMkxSaN5g9eXDUiMDpIkaqV4iLRoWE74tSq52FIyhaiIu4YZW4fSft0k1R3r7XDvl
         CQ36x/0jdm2EemUegmNLiXTj8TwFGNJsxDzdFSZ1IDG6xjM6ZAvfjHc7cbtduSOSWDH8
         CLi1TIA9d+cS40XgccixL91VzpOMQzmLfdZ4xj4+QEbdCazq/XWUOr0VoCKaGVV6OCMa
         yyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892851; x=1793497651;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKl9wz07od1KtnGqk5r36fEXu2WKt0H3YytCVeKpeLc=;
        b=PVPl25ghndHgxrm4MjdM13IlCSdt3VAhTq6L9VgHk9mWcbdp8UeXnyRIueW6FXFPZP
         Yxfuheefc6w8hc1nfseu2xDC3iyBcL/xcaBpH5haK+kr/6PD5R0ohEvb7Uq8e/WzxOr8
         7TEgP+MOqLYAM84n5fDn8QAJBHzFaf3pzZ4ci3PWZPR5sqTv5SNr8AZJCio7xE/x7sKY
         jGJl2fivTDOnfDuIRMEzkquWrVLU7FeQwPIGh08i6FtAxR29XYeIods6spYGvO6l+idy
         exsx5Yd9UYAyRUMV3aEdnldovfkXAw2hu7zRk15eRskMfWae833bzbxmTw4SSmGKYJY6
         y2aw==
X-Forwarded-Encrypted: i=1; AKwUvBz05IO+hZQcg7QMzNWgFycnNlp4dbkp2aWvR6P0BcuA2HAObuItp7M9g+n+caH6s6R60DtY5v6LIiwjk8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvamBN5V7cDQpwrt6c2aOW+BUvVyFT6Kt4vyLT3wKNSuE7N1Oj
	zEos2SKIWddtvNJE7wg0L1v6mP1StzHt/MeNfOfKa0EqsN+pc3BMPRB9
X-Gm-Gg: AYBFou0wzQnwCvf3ef2UcAdGN70fxQLukmzq7n34zwcUUEP8pJNIAncTwLg995MwYd3
	+UmuOTWU5lhrR1iFm9/CVIZxer4Im5es0K30J4gwNBBqT4xND4GjwcGi5NzPGtOmaS2CwC32Nsg
	Mt9cdm0MuhPUK44vMTGRoq/xiSnA69KMz5Lbc9p1ruEWGewE/PoLjzw3t3VHZlP3+KPG6CDySg0
	EFVyXv3eU88ysW4FKY/miA1ttRAAr1mC8YAyn4W2a/aRt+xo7w+pq77TVtz1uP+fh4Tb1fVUEYf
	LX5uxHYqScQ3Nh7vrVQhjWACoLkojV5zAWSoc9SQVQjT+8JGd4uGc9CevIz+i/5VLoQqRUN54jj
	ItkkGE9BqloJmn61s/5U+xrcYF3BWb9Nma5As3yqCBzJtlHmGSR7YzWC1yEnviD0KySzHLHBrE8
	7u9kUZYKa6Dr/PeKSTJtded+EBED2zP7XBX5ObSaoeGTvnbeScAu17KIYEWC/960/58SNUMFbZV
	9Idk7anpaOK5z43ZSbVRtU67sGM5D6So6hyolLaaKnFbpZRC+rGtjS5F+NMq2q08n0Nfkqw/zJe
	vahgZ7n3mHtZxW8/S6/28Jo8m1pAWuC8UzcHgYrW6iGgcLMuSz4=
X-Received: by 2002:a05:6102:4b1b:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7ce5ce62789mr982785137.30.1792892850663;
        Sat, 24 Oct 2026 18:47:30 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([2804:7f0:b101:277b:8118:1af6:d493:fe05])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec233f4bfbsm3877257e0c.4.2026.10.24.18.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 18:47:29 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] net: dcb: initialize PFC value before calling getpfccfg
Date: Sat, 24 Oct 2026 22:47:24 -0300
Message-ID: <179289284460.50470.572724041164324949@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

dcbnl_getpfccfg() and dcbnl_cee_fill() pass the address of an
uninitialized stack u8 to the driver's getpfccfg() op and then put it
into the netlink reply unconditionally.  The op returns void, so the
core cannot tell whether the driver wrote the value.

i40e_dcbnl_get_pfc_cfg() and ice_dcbnl_get_pfc_cfg() return without
writing *setting unless the DCBX agent is host managed and in CEE mode.
Both drivers normally run with firmware managed DCBX
(DCB_CAP_DCBX_LLD_MANAGED), and i40e with FW LLDP disabled runs host
managed in IEEE mode, so on a DCB capable i40e/ice port the PFC values
in DCB_CMD_PFC_GCFG and DCB_CMD_CEE_GET replies, and in the CEE part of
RTNLGRP_DCB notifications, come from uninitialized stack.  The same u8
is reused for all eight priorities, so this is one byte per reply.

dcb_doit() only requires CAP_NET_ADMIN for RTM_SETDCB, so the GET
commands are available to unprivileged users.

Set the value to 0 before each call, like the PG config path already
presets its outputs to DCB_ATTR_VALUE_UNDEFINED.  0 is also what the
reply contains today on kernels built with CONFIG_INIT_STACK_ALL_ZERO,
so nothing changes for those.

Fixes: b94b013eb626 ("ice: Implement DCBNL support")
Fixes: 5effa78e7c94 ("i40e: Add netlink callbacks support for software based DCB")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Found by code inspection, compile-tested only (W=1).  I don't have
i40e/ice hardware to check the reply.  On kernels built with
CONFIG_INIT_STACK_ALL_ZERO the byte is already zero, so in practice
it only leaks on builds without stack auto-initialization.

 net/dcb/dcbnl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/dcb/dcbnl.c b/net/dcb/dcbnl.c
index ab71f53128..ad0aebe0ad 100644
--- a/net/dcb/dcbnl.c
+++ b/net/dcb/dcbnl.c
@@ -281,6 +281,7 @@ static int dcbnl_getpfccfg(struct net_device *netdev, struct nlmsghdr *nlh,
 		if (!getall && !data[i])
 			continue;
 
+		value = 0;
 		netdev->dcbnl_ops->getpfccfg(netdev, i - DCB_PFC_UP_ATTR_0,
 		                             &value);
 		ret = nla_put_u8(skb, i, value);
@@ -1395,6 +1396,7 @@ static int dcbnl_cee_fill(struct sk_buff *skb, struct net_device *netdev)
 			goto nla_put_failure;
 
 		for (i = DCB_PFC_UP_ATTR_0; i <= DCB_PFC_UP_ATTR_7; i++) {
+			value = 0;
 			ops->getpfccfg(netdev, i - DCB_PFC_UP_ATTR_0, &value);
 			if (nla_put_u8(skb, i, value))
 				goto nla_put_failure;
