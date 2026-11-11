Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437265;
	b=p2mGHMgTAP/0qonhrGsGnJ1LmVI9z+pi7seCFVlyCHJAjPLbpnCPDbKjRIy3AQ3pLZji
	 O5HqJBixWG+dqtM8/w7d5UTLIA9RAYueDL2rpl+E/T+hcUpE7NbRtJBejCia7t5caNRpE
	 3W/YMf7G8sFBlHK8Q2cGCMYTRbDYeABU/9yyLrJxkuZmhYm07kaX/jBsWpytm5pAFR5l5
	 H1u9Szcy28Myfs/wLBJIdUeNr4taB2NQ3SzgXY38khBQSCsy7V/SHZOfJpP3HM3DiR2LF
	 aY08854kle/vWN9PfhOUG4/yA9N4M/aLDozM/qC8loAHCbaJGnSMfQouG+v6TBjoUaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=v7W0xNYpiy5LlSzPIX4rQ16P/K0fxOUo2Bge+Pct8Kg=;
	b=NnkRUOzX11TONzJL3PvaNeU9nroL32PgHi4p6fU5NOd5ZRmJbpwenWT1zfVSxsJmx9uj
	 QsZ/fjYRetHeDnnfxPaHQzmMccKa/uKBM3qwOPYetuEUlez7gDNz6vtZgsHnn6OREKnoL
	 JNercVuGGRHu8UDUyWkcg0q4RFCouoQS6qbHu3sNIUFsVdTcveCkC1IRl/d7rIJqYguqr
	 pBrhg/F4up5ey7DSYbSisgysQ4n9yCpYlNYQ0aBNkIyWA7+Uz4yykOy3hyXxuTLWrOZGm
	 0nUT3yCr/I9ag9s7fNUqWM0FBWpVYnOkMsfDdtz/pt2Y4t1zkBkqg20qpwyI02/gWXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTooIN3Q;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486DD606B747
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 486DD606B747
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTooIN3Q
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so2553089eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437263; x=1795042063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7W0xNYpiy5LlSzPIX4rQ16P/K0fxOUo2Bge+Pct8Kg=;
        b=DTooIN3QoP8/9pVMHn481N0AQOgxeEutkom8yEbz05kzxThTnvfycNhmfLfhQr+4dC
         eaAxuGYTj19ii0QDr6qYhgUoC1FKGTPnT6NHD5aeIJcvGpW2+UqzXBLAhCGk6TxkXdem
         WKqVGf802TMuZjVAyE+woEqFEUws+x6LIQaZyZxdurSz6eMIV9OMhpoI2gj/EKIVqpAL
         i7FiXALbuSkKCmV/104GLFgKiYV+qyckq1eXXTA40fTxCuSa3p3VGAIqbyxAkNk/wQAq
         xVNKdz2XxvSnZgFI2fjksYnkgdPpFY9eQZUa4LjT998m5MmMyjdtUuOCKRPK9hJPuHZu
         RCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437263; x=1795042063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7W0xNYpiy5LlSzPIX4rQ16P/K0fxOUo2Bge+Pct8Kg=;
        b=aH+bhbnFmD0pN8eA3auVwOPy1pJWuQctoHYLSZRyUDYa+kMi/5ajul3f6p1XhKH7jY
         xqLH+0BR5TFQJxRN1WYQiqchXlqHAX/5YCqMwOscNqpPokAig7XFPurlZ9pDSZ4ETjis
         teNwVokfMTpzV8wMfH0vCpP9ioV2M6942qkGDZl/Lxc5WfJ7c3XdQtYcKQnhls/+FYVg
         DrcR14tOt2I5vbzPg5k2F3NOmSgiXSZnR/tSk9uWptDJvSK5a66IAKfvlZC5SF3z9kC7
         3kPVzV5cuUNQbNk6Gp5/hrtRYzO5gwlVtM0bTnjWXezrygeJj3XWumxfeybpAtM8enx0
         u2Ng==
X-Forwarded-Encrypted: i=1; AL+hErEv7sceqkWBghU8J5okUpH2e5amLbFSZIxa6U/OvVDVaPvbrTeRvSXj4dp4FranUFKkEXCG1rZ5gGI9Vrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YFMk+OQWSOag9I1GyZHkXD0uvnmY44uLEod8qobRx/h7HyLn0
	ap7CWMV6doprG6MxlTi20rz75c1U1DXaGbg+amGzLOSNtvpcp7pbgc/m
X-Gm-Gg: AYBFou0Dxp6hTojva0YKME5V7U3BmzXoIa3b7fySn/6dC16KBuofv2kfjfRFmq9Yepk
	Z2E7xyb5fMBzCxnDXQlf3YTS0h4p8K3C3G9hn7BnhsiT5xZg63FGU7lUIIDKBArkj5k8Bug4OL1
	BVQPE4fNdQbqdHZNb16p2WXdZm7Uk+nKpFow2RfZfHmi+zBAfyViYlVhXmEeYpAngRTgaKOdcJq
	XPLsnASK66EVTQqFF+HPKcRoDpt7VtZUuUXz2SJLVTFJ75q+LzdG6T5DYCs7SPLqp0VEKeYrF1S
	vmHsDl3kW9fKukKPYg3CRYEdBQUaeSDBlywHOeWWyCXVa8HvlPvgoIxMTqyG1+4aK6HpbaR99Nj
	iwpKM6/mGpa46kSogm0hg83aQkbPzp9enXv88eyz8duNvRSuv1fkhLj2pFkTexugXq3Uv3w9Fcd
	zQRp7Dl1jR5s2qc6QP+14q9SarbSibnpiul/i/FyLZzSz90X1/qMf2ICBDM605xSajk4MFbM8Pk
	FQFFJOyl4TXzsx01hj+LnGLVHnjKcpd+m2Emk4z6NJePLhqPpV6Pc2eeG/zU0s/DAmS8axM5HwJ
	HFAqRhoKz3R6O+i+FeLH6TNiiZ2jyO4u+96PUl6xWEMD
X-Received: by 2002:a05:7300:aca6:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3768579fd19mr5751002eec.13.1794437263206;
        Wed, 11 Nov 2026 14:47:43 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:66::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm20685173eec.7.2026.11.11.14.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:42 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	almasrymina@google.com,
	sdf@fomichev.me,
	leitao@debian.org,
	dtatulea@nvidia.com,
	asml.silence@gmail.com,
	bobbyeshleman@meta.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 1/5] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Wed, 11 Nov 2026 14:47:36 -0800
Message-ID: <20261111224740.2744522-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
References: <20261111224740.2744522-1-sdf@fomichev.me>
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

With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
more frags than a packet can have BDs. For GSO skbs, linearizing needs a
large allocation, can produce a head which doesn't fit in a BD with BIG
TCP, and always fails for unreadable skbs. Clear the GSO features of
such skbs in ndo_features_check instead, so that the stack segments
them. Non-GSO skbs are still linearized.

Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Michael Chan <michael.chan@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 33c4cacc8ffe..f20b61180ab2 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14320,6 +14320,11 @@ static netdev_features_t bnxt_features_check(struct sk_buff *skb,
 				skb_shinfo(skb)->gso_size))
 		features &= ~NETIF_F_GSO_MASK;
 
+#if (MAX_SKB_FRAGS > TX_MAX_FRAGS)
+	if (skb_shinfo(skb)->nr_frags > TX_MAX_FRAGS)
+		features &= ~NETIF_F_GSO_MASK;
+#endif
+
 	switch (vlan_get_protocol(skb)) {
 	case htons(ETH_P_IP):
 		if (!skb->encapsulation)
-- 
2.53.0-Meta

