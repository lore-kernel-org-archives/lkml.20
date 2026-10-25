Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952431;
	b=cwPlI6oalMYXNZPr7aQP1rAHfZ7j1Ynr7EU07GuS4/I04CmGp3bryTIA36hUu8TTEpxO
	 QpYdF1lMjtRyT6l6QX+3hy2ZG5Hfx6dEyzwsbRxmu+AjHEYzRPwKerU6pOOZg9DW2R8iu
	 bbA8AYBnp50X/DIHyAl+DTCR09LdIfb7YAK25G7iwM5gnMvRhSyyDaWXniW9HJlMk7Q77
	 9CrjCd2/04h4oFu3kaUDisSv+sKpwjJPc6I1fziHFnHbnGOInKTBg8KBnp4VvTU+QSWvJ
	 XOAzhO+5FZRNJ6/SGYEPv+Z/2DtJPg8mWHi950i/tYr/9ZMHQKLR7IUZ+nswvFK6n9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kkg7v9pYa1AwlmOfl8C/ErCvRwIjr29iyWLeNc7eLhs=;
	b=4UyxgDWNEdreqO2OHRGVfQFAUV7CBP/CO0mvF1q5pRli31jWPWDFU3GmRXkNXbxAc9Ud
	 hqGfS3CiZ7mBhMVXcCHtIF4ajaxT434VJzDmtIPbtH7KW7uJgNr8MPzJ+1HucwqPMxTnw
	 ZPN7hhCSjK99XMVxyZHOAhWeTUsnOsIZYvma4OumWvIe/+xrMAkpjPMtFn1KikgJhCIaJ
	 /m3yZqfcUcn20nA689fhk7JrRJXsGHcNxZT2zx2xNtX42K6C5MnBZTjymHJqn4beWDlPp
	 vUdHi1K00ChvSgQiRjzEfU2w7Lh0ZF/wo+JD28e59yCNb93xkQfBrkVXdwHLbLxKghg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hGg8IcG8;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6571606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6571606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hGg8IcG8
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1139209a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952430; x=1793557230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkg7v9pYa1AwlmOfl8C/ErCvRwIjr29iyWLeNc7eLhs=;
        b=hGg8IcG8zi4/Z/awlqSK8ljg8JDI7fwQl3Gd8hkVh8ELqDTkoDUnkR3YLv1jEfaZCa
         7SDrXXOS3u4rgPbH7mtse+ndeA/T3iyjofXVtdfWNSyat7E30OY7KB8hErs78BX78YVU
         RIKz9THfOb8vSxqplRih10XOdz+F7ny9kNM5k4PH3Nk2aL6eKeab/lggbYlBLYWrlNLq
         vADXZg9wus2h2VjPq7t8CZEYCGjqJLq6yn10t9uBQ4LPUHQcp05QUusLmfx5f03i+gXW
         xydEaeLW54FbOBhSn6YBcDkID/acsI3mXcWNJBxXhwgEKFat3v/Dimsx0tyLXepsqVqY
         GokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952430; x=1793557230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkg7v9pYa1AwlmOfl8C/ErCvRwIjr29iyWLeNc7eLhs=;
        b=SI3aaQoEQxtyhmhatrV2jof2+qrofkegCRWcckC6uW1oEwVAbkoCZqVDCIVrjAB2QQ
         VCo5Sy7Xi1b/rASERnVIYiXipd1596MTR06VoTA1buPM0PePA0m+51Vav78NLdPTKn0v
         X0XrR/bloWPolOfaYzI0Y5U8btOMHSxBzQ0mZnhxU9Du4UKZNbB/J9Zxd6YcjBq1j4Ij
         /8ePAATVVkBj3W+l/MSKihdLAUKn/v1PiUzu5YoHbrmC/8mcZ7XZ57sqQyTdGQ6WbmbS
         z/XubHQMj4gNcK3NKN0BzLyoyeoFUZ0Tt9+pO/k040DMlgVXmBw/nzG4iLn0Ta5lv5G5
         865g==
X-Forwarded-Encrypted: i=1; AKwUvBwe/gDqTkgZSFnSze6eIRKyp4bcto3oq1yqaJL11+lJGy8Qr53ZuwQyAfcG+KDTqrhwda9+ES6jOGJsAao=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLMlsSPWmeXOhKIn0Gsdu4/IAqcnNWD0j3gCF20/0HpGeUu4iM
	0SP6T0AfwOKnQmmJXubVGvKeMdcx6pwAeWM9A8MFD03uPjZCdChst1eM
X-Gm-Gg: AYBFou3nOXuNKvUYx6XqBS0uzgVpa4aMBt8rUU21hUjgYKcZws4lNH4qv5ql+E8IALk
	+FlonXMrHVpmfgOqVPxrG4b6swy8n391qT9NCsJMRsiwHQ1YR4XGG5AqTSeQkapgh7t5/SBws2P
	PSAt+gbwaSdLmU2f7ISpTYdYTAST0vwrfmqzHSeO01RQKcQn3nVsBGmGDhCOkG1OnJH3iTohHk0
	7/xHMaRQ6YZ5o7d664AQreRmcCLbUuIPAH6ltBZmuwL7YuC1WCyNO6lhYgKzOJv99Gm+pvdhzvv
	pL5GNRE5r6migyfyNJZGn+P0TM0rqTMC0J+xCwUb2rvFYKO55ohkQhkWBszAcB0YKp0nTaTQpWR
	dV34GcTqyKtaP2qorrPbK3BKN3B5NSHGToAPyJnezKrYuY0fPL40zZm7FXEjFbsa4pufVxMurf3
	07i5LbS69dati35rAHxkfjPLYsCfxAl1Hj7Na76wj2NzhQUlnos/xBlENayWxh03NUEfDn7T5xy
	GXFLeTSnECU8FsZAmuBgiRjgpPEkLe9bFB9mbo5XSDsJUIsaUVkYiuMSBhXrcFwoH59hn+Jn18a
	a0IfzaY=
X-Received: by 2002:a17:90b:4acf:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3adea0b1206mr3533541a91.7.1792952430015;
        Sun, 25 Oct 2026 11:20:30 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6212:1232::1d0:de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm4108709a91.2.2026.10.25.11.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:20:29 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	stable@vger.kernel.org,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dongpo Li <lidongpo@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: hisilicon: hisi_femac: Stop the receiver before releasing the RX ring
Date: Mon, 26 Oct 2026 02:20:18 +0800
Message-ID: <20261025182022.2959333-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

hisi_femac_net_close() frees the receive ring while the RX address queue
still holds every address that was pushed to IQ_ADDR.

A port that keeps receiving then DMAs arrived frames into buffers that
other slab caches have already taken back; on an EC6108V9C (hi3798mv100)
the queue still held all 52 armed addresses right after the interface
was closed, and had dropped to 43 after 15 s of broadcast traffic.

Reset the port before the buffers are released, so that the receiver no
longer holds any of their addresses.

Fixes: 542ae60af24f ("net: hisilicon: Add Fast Ethernet MAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hisi_femac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/hisilicon/hisi_femac.c b/drivers/net/ethernet/hisilicon/hisi_femac.c
index 016605e86f0b..a44ea0a2b1ee 100644
--- a/drivers/net/ethernet/hisilicon/hisi_femac.c
+++ b/drivers/net/ethernet/hisilicon/hisi_femac.c
@@ -491,6 +491,7 @@ static int hisi_femac_net_close(struct net_device *dev)
 	netif_stop_queue(dev);
 	napi_disable(&priv->napi);
 
+	hisi_femac_port_reset(priv);
 	hisi_femac_free_skb_rings(priv);
 
 	return 0;
-- 
2.53.0

