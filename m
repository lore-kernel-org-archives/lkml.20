Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793592723;
	b=tgiW2OkD+aDy0w+Fk29T7OkWRydzW8R+ivlHcLjBxrXAy0G3u1QNSFh+mufGNgnuqiLF
	 Mpyb4Gm+Bqs8boCYu7JPcp+3zwZ1zo7J7AHtpOPS4+czmj//64HYEmQN1L2t19e0iBHnd
	 11OyOZ8qIt6chQfykwfwQOjGsWD7IitMuFAH2/TJ8ipxQHBJB2oSznhRc8/RSQQZrpD9K
	 zgepBOnFHRgkURqfjMyEqV8W2SqFVfX5RjTl86rZAoDI1rXxoXcBtCzrcALPkm8Jt/tdA
	 afHlJ1rdf/Etqxsbmr39WfwHlQ4rv5Y0rP/pMTYs5pHqDtuB+GOF7LjJosr5XZ7713Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UoVVCs4E0WqMtB/439e3ybc24ctA88xvXydp2Ix8gds=;
	b=3SBOF9/seUZJRwkdiKpKP/f6k3XZq/GeNggpHhjHjEvzC++jJJ31gsQBHAlAWnBDRDfI
	 asIdBg/DKT5sGas33fI6QQjwTbLzbJDy7bfpIsRw3apiXPGhAEHnfXx4w4kMkzYSHkxQG
	 YqhH/Lq41e2VkNiAvHh7jPiv806UuAC1+Ync5JwMq6KopHl3jJMxOOGkWXMQz3uQwCTkF
	 Cw1JRB0+pNeHJetL7+G0wCJtMMzizJZNY8rkCaYTsUfvaGNatjSGoyuTTOYGtHxQC/Hs6
	 mOtVJxwk78uToZx0WSi+8lmcIpNDASGwzv2idn+SHvLHgw8/Slc6XV9Q6/Ng/0E/VlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Tc/9+/Ld";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370C606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2370C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tc/9+/Ld
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15943c9c005so155298c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592722; x=1794197522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoVVCs4E0WqMtB/439e3ybc24ctA88xvXydp2Ix8gds=;
        b=Tc/9+/LdIC66EeckJPdBLvN9Rg1wU4pEN4l7rnCe3Z/gHKcDFU1y3neN14jG9ql81i
         W5/DMdYmOha3JI3QFuzqYwwl6m7CbFv0EAWX3qkWcen8pt6vZ6jptX3i4rBbZcmiy9xn
         d2HlbnbUSE7tpHxkSiMsGN/e4ulsAbKQe7EaFt+DVKPz60dAFcM+EiHLViGJFINg7S/z
         eW7cDkC2MPdjYjuVj9wngyd4LKVT3xSUN0McuKX/wk85J93UK4ZafZEsLdDTzikiIaOY
         78v/KEOxxmt9wBLgLlKInjZStqKwOXxNdKTDyyapCAwdvvMgLWKG/HJfjkfXk4FLmGLg
         6MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592722; x=1794197522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoVVCs4E0WqMtB/439e3ybc24ctA88xvXydp2Ix8gds=;
        b=NJtzGXhlbbUhEgkNayziiwW2DiXjrF3ZkPwBrsBHGyfwLj1EGmSWyrkLAwzYkqbqGV
         7kUa/lHYV27+NHKiIOjBv+xDtvpUWJzYY+HljiMHYuglJ7GPTsKB4QQ2RKrM6aAGLH58
         2rPaGaZIHzVxFGsRHwj0Nud8agFm/ppcw08PvsM148M47WVmYEKVCzmtox1D9uIE6DM+
         eCNkrdww7c2ksGzr69HgQAvHIUNTudbncv/A8APQvfVUoIy4cQO9o30ufNzMeVIl56lH
         cVrVxPisfl8ZD4RipoGC3g30TR1u0gbzhmw4wlvDOXcvn2+EdP7QkwaxmlBaBE/+56bR
         zNpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnIXPLGqkmhi1biZocroAUz4a7VcIjwnK0l/85OQmhl38oB+da+ayQydJIGhNJ5qmURqG11IaZygOvN4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYz58PFzXsPt+od4cfL3+j03Q/oo8C7CUM+LxoN79n6dv5MXwa
	fvxbtbJTXrNu086TBPL3QB4PAdHmFEJMiySyjF2Wrz+u51Z6w36rKpFZ
X-Gm-Gg: AYBFou1Imjm9guiZY9oH2xczt3aM7OntzJtQ3S5tBlpSi6MMcU7lZzWT/KzqmVUZTIM
	xy3n9k5gYH5upXjgiiYzkBevrpPvs0xoZg+Tc9tddahEunPJkFOrUgVARpZdEFSTOscCaDZSFrI
	mahJj9VP8BqH4JB6mVx0b2vxG2JEIh26BwCJXmlcKNsFDvb+r2hnQUjPz9aaMgUJAbmp6nqsipt
	PIY1LcTxnoiU6hosKvu8d7urxkc4Q3z73sy56wIdUPqyz3n6SkTa3aKdER3e/8RvCl2vFRz3Na/
	WtMHm1Xk/fCDKOp+cZHy5diGZGf2Y+mvGWhUvQIOWsZm6z7YgMG1Ep6BYBMcoDAHp50i8QXS5Bp
	MJNBAsXWkuwvr1Onde2hdAp6ujhloGhhIb49IgOypv+GqjNSq7n0HWEea4FMvJ+THGSQA+Rdelf
	jh1+eCG1emPK5hSF+ANmW60gR9bqWWDNlhA7pGM2Jb1BTqLTdKBF2Y3Yk75Dszh8uA5JH0CNOf9
	ziOaOKobROXZZhV/bpWnN41cuvBulI4Yoeh/x6YosTtmO4yob02e4WIvybAq2awyLjeIwyEtbG7
	O4Fi2i0oj+zuXLhSUnL9rsJJsrilBtSjbpfoYgsgre5D39PVmXQq1NsqiRRqS7JV/A==
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr13511529c88.10.1793592722018;
        Sun, 01 Nov 2026 20:12:02 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:50b9:9b10:1e19:1f0a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm33171098c88.17.2026.11.01.20.12.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 20:12:01 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: stas.yakovlev@gmail.com
Cc: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: libipw: Do not return NETDEV_TX_BUSY after consuming the skb
Date: Mon,  2 Nov 2026 12:11:55 +0800
Message-ID: <20261102041155.61680-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When the TKIP MSDU encryption is done in software (host_encrypt_msdu,
set by ipw2200), libipw_xmit() copies the frame into a new skb, frees
the original skb and goes on with the new one. If libipw_alloc_txb()
then fails, the function jumps to "failed" and returns NETDEV_TX_BUSY.
The core stack takes NETDEV_TX_BUSY as "skb not consumed" and requeues
the original skb, which has already been freed, so it is used after
free. The new skb is leaked.

Even without the swap, returning NETDEV_TX_BUSY from "failed" is wrong:
every jump there comes after skb_pull() removed the Ethernet header, so
a requeued skb is sent again without it.

Drop the frame on these errors instead: free the skb and return
NETDEV_TX_OK. Do not stop the queue either, since no frame is waiting
for it to be woken.

Fixes: 1264fc0498e1 ("[PATCH] ieee80211: Fix TKIP, repeated fragmentation problem, and payload_size reporting")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch and the changelog were written with the help of an AI coding
    assistant (Claude); I have reviewed them.
    
    Compile-tested only (x86_64 and arm64 allmodconfig, W=1, sparse): I do
    not have ipw2100/ipw2200 hardware, and there is no emulated device.

 drivers/net/wireless/intel/ipw2x00/libipw_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_tx.c b/drivers/net/wireless/intel/ipw2x00/libipw_tx.c
index 6e16060834b8..d0352c8dc064 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_tx.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_tx.c
@@ -509,9 +509,9 @@ netdev_tx_t libipw_xmit(struct sk_buff *skb, struct net_device *dev)
 
       failed:
 	spin_unlock_irqrestore(&ieee->lock, flags);
-	netif_stop_queue(dev);
+	dev_kfree_skb_any(skb);
 	dev->stats.tx_errors++;
-	return NETDEV_TX_BUSY;
+	return NETDEV_TX_OK;
 }
 EXPORT_SYMBOL(libipw_xmit);
 

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.53.0

