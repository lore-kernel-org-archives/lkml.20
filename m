Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197133;
	b=P/NBSk8Mopft+VeETdCn2VslJUDrOYmyhMsKmu2kOhxMoFEppqjifJLb3NLXJfjt6qSB
	 7SwXGfkxALe14tlUfirFEu4Od/C62kK3+CGN2AcDYS8APT3VFPNYdr2qcjJ41y6U3/5YQ
	 0+t3VWzHX+Sxou7KQ1GHNN7MIowQ+Zf2FzGflQUxkfYkJUBao4+fp2kGzzxyRqJrknfWl
	 yj0UODtfHJTch7IxAHBEG/enSOF0r8Lp7Feh6dNnljNhNXXmxEQFJ1tVlsEK2+H1sqfet
	 t5pDky2tsJ61LeD31puVtwBbsClLag2ivFp98aRkeTkqhZVjQWRhF7w7K/Cs82kkqNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nFEfZnQ59TpCZnJvhgBJzEp+yfYh6wGlCUPMkB3MYBc=;
	b=4LnySkJiitdszBrXdC2PGFPgCMsn10MLbOvgeVvIW5Y6LodbwF5/Moxp4YU3LSbJrRSw
	 zwdruCcLZS7EqOsN2arNjIvmBWNcVUuN/Al3PyC2NT4F0TxWVG+hKz/sD4jsbD3r1kNCF
	 W7LwOgpFrzwkWz+Ydq+abWO+cts/Qp4MIRlDhNwB2lJTAtJq5aLVv+WjUFwkVK8Y27gv5
	 S6N/6veBcqGCZJSrJA6NUk2zRwfNDthg1L0fMhRSqYxeIwqZRuLosIAsiA2s11gRIaoZP
	 3W4PCr8Jp/Zk906jvQnUuUTBkukcIjGIRQRA39h8iBb0IZ0mOIfY8/gQPHvd3i2/nMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjLQz0ze;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20798606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20798606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjLQz0ze
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso452737a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197132; x=1793801932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFEfZnQ59TpCZnJvhgBJzEp+yfYh6wGlCUPMkB3MYBc=;
        b=RjLQz0zek60zgNWMOUzt+E2a1xXdBEOiVCxWA/FFoRh3FoUS4+hOiT2HP3gcy8Kvux
         PrLGVghaH9/X5IesZxXXelQwMBw23TpKdfAm5H5CNTED6rtMXS+MDaFBoWDcEriTyU3X
         421a2sdHC6BR37TyAyTU1M26ctJlzFHYvxKFbVxnoaER08bJLunZh9kh3b/UY+IjdsFU
         DmrPpA2BejTH1SQtFJYaUTx43Wre9yYyVqDjcLyp3PH58lMGu1ve46GKjhzXVXJg9pGj
         PuhME+NL8nnXJW/SI/NbjncgvmKw4C3+eKf9NogEbuvwpeYA430D9zLKqfjca6lcV5AW
         mAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197132; x=1793801932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFEfZnQ59TpCZnJvhgBJzEp+yfYh6wGlCUPMkB3MYBc=;
        b=0WQldWuD+re6V/GRiohq0ClTIrZviul98vCwxUibmMeclwZ1Tsq7zhdaxxP0UN/0+w
         k8QwKnOoZP6Bh35peR7ZZ05kp4NCAt1jmaMDuY0Cc0AuTZxTolGsuDh33o+Cnk8myK0X
         qFaAmyEhHFNTSwqlExDKlThnrp0KquVN4ozSot3dg0jmr2i9Sn/qfoTJ8bKizkFRwGUP
         j+B19pfW+by4VaKLv7WNhs88U1G7cAJdr2cCpE8yCZS2PgtNrTq+gLm1ymcgX94cqNDd
         tmPmjamvrdGFA414AeCzvstxTU5IpgYuQ/Wxy0dV3vVNO3Fx5IBVxtbuGKRc3Y+bYJGt
         IZ/w==
X-Forwarded-Encrypted: i=1; AKwUvBy5zBCJY6GpXamf2UV5UEYEwNxUCzxdglBRsIk97WGBIeO1iBVS6t21+vl0KC6D/j7oHnoagYotlFsN1g4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxaROElWGeqXW/0rym+LpdyYnQ+gZmS3yHuOLjZnzIfr7uzToM
	hUMfO0azpGFJqQLkRlwUXODHLLx9+lEgi40n94/42ym57MIaKojGzwlq
X-Gm-Gg: AYBFou1PpsQlBcOSTnaypM0j940aRIvkjv3Jf2qkyA0Sey404SDnF6F+BnkBRMaKgqM
	Uykc3HCQfeXV9z4g0QpdW5PRLn3upcI3ogv47DGNr2Dvd7pmEUSZ0mlO7U9jaJV75sQi6Rw0iPC
	Raypyejvzj3jnAMNl2R/s3tPAAvfYkknfzOzeRAuimg+UqL14yi4UlyfGOcH+84zeqJS+HxxoXl
	LjF1t0/3jv4ELn2q6oKTrRx1iqU9RByCMgiY4c9GENjbgLwov52GBBbI93Sth5F0LD+ZomHNbve
	AD0NfVAGJIv2ioZhohB8L5yBnqnehUwZxGsxrvZHahZiFEQSJZcc3Kpi8BD70mbGwaLqpI3rm4w
	gOA30af8Jyze2aqx9d5taGQSMZHkFLtGVtZpvvNTzbvLbpEMwOkwapV12MdAFD7ld+vVtQ0eWOW
	2r0kYyY4InoWRbippHk0IH5QW2pTXEM5I7n9PeCzkOaUqTPIRXBivTyb88nJKc0FIXYcW21lT3m
	WeD1HH68IV+PMMlDPv0/7sBBnO/MimjpdZ67rzjBaiGzqYtzoG5AiydfPWqEJSYtF03Qsj0rCfF
	RH8msMt1fZIDMoLzGE9dEiDLmehwJEloSGpuSxK5D4ucFhGX8QJ9KMuRxgbACgt+Q3wy
X-Received: by 2002:a17:90b:2fcd:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ae57e07d0cmr1867914a91.4.1793197132116;
        Wed, 28 Oct 2026 07:18:52 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a0482e9sm3437223a91.0.2026.10.28.07.18.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:18:51 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/4] wifi: nxpwifi: stop AP TX after preparing channel switch
Date: Wed, 28 Oct 2026 22:18:17 +0800
Message-ID: <20261028141819.7556-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028141819.7556-1-enderaoelyther@gmail.com>
References: <20261028141819.7556-1-enderaoelyther@gmail.com>
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

A channel-switch request can leave AP traffic stopped if installing the
CSA management IEs fails or the driver's work wrapper refuses the request.
The driver disables carrier and the TX queues before programming the IEs,
and the wrapper silently drops work during removal, command timeout or
suspend.

Prepare the CSA IEs before stopping traffic. Queue the switch directly
with wiphy_delayed_work_queue(), since the driver's wrapper can silently
discard it after the IEs are installed and traffic is stopped. The wiphy
mutex serializes the callback and worker with AP-stop cancellation.

LLM assistance was used to find the bug and review.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. Not
reproduced; IW61x hardware was unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 384ba69dd058..0f7720df0304 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -3115,12 +3115,6 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				       &priv->dfs_chandef))
 		return -EINVAL;
 
-	if (params->block_tx) {
-		netif_carrier_off(priv->netdev);
-		nxpwifi_stop_net_dev_queue(priv->netdev, priv->adapter);
-		priv->uap_stop_tx = true;
-	}
-
 	ret = nxpwifi_del_mgmt_ies(priv);
 	if (ret)
 		nxpwifi_dbg(priv->adapter, ERROR,
@@ -3137,11 +3131,16 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 	memcpy(&priv->ap_update_info.beacon, &params->beacon_after,
 	       sizeof(priv->ap_update_info.beacon));
 
+	if (params->block_tx) {
+		netif_carrier_off(priv->netdev);
+		nxpwifi_stop_net_dev_queue(priv->netdev, priv->adapter);
+		priv->uap_stop_tx = true;
+	}
+
 	chsw_msec = max(params->count * priv->bss_cfg.beacon_period, 100);
 
-	nxpwifi_queue_delayed_wiphy_work(priv->adapter,
-					 &priv->dfs_chan_sw_work,
-					 msecs_to_jiffies(chsw_msec));
+	wiphy_delayed_work_queue(wiphy, &priv->dfs_chan_sw_work,
+				 msecs_to_jiffies(chsw_msec));
 
 done:
 	return ret;
-- 
2.56.0

