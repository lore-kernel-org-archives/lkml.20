Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077093;
	b=mHJfDKNbHnptyjfcVwF4RAF1IVjcMXrDeFaYeeyj9Iccx0299djMFSG16U7FJHs+e3RI
	 jawDp2CzVndiP87Jbfh4u8MHlXtgWhgTepAvDSDt7wH1iaAy94XGl+6vuPHbiySR1SzYA
	 gWQdKBeEg3ZzWLRRd/QkxepCM+ow80B6zwdYrbBACwLjqlHx03ldQ9tx1N4PBGFlq+vER
	 X8ZQbBfIjV8WwupkjeXV/98oNnzxVs4EeLMdmXlOt/Y+L3Ge1Fcv9N0lPtOG1spZd0OMQ
	 axyuiUg9Rab88xH7KkcgzUS82m4qi/oTbwMccJSczTMs0acBWv7magy7U7v+ZQHKVoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sg7nmjDxIAixbof136SBr2EkAZqYxcTSKOudRFI2tTA=;
	b=0pMDb6wAo168M+TEWANhv7WouDaau7n0wJrxQGTIVq6+Ulby+l0j/KJK+Zc5tcy8IKUU
	 iYzkiSLjr8BH4gjPmZ37h554kmaa7wKgX89JnTovCczXew9PQoK/ZiYCS8fbDQHdkTgBu
	 aGdmNqsH+Ie7skGdkGwnvYrNyMNnnjL+2wKB4yZloY5fKO8VXNj8Uwxy1mfWvMQNDKiol
	 Qjn8r41itoJk5R2Grbg/SEcvCtQ1n4RBRtZjrLtEg/yfEqefiYPvt9hx+EbyXc8M5uSIs
	 ZhMe6GFe4adE5hLrXyEj4K+tpiGcDtyQQnB8CGUmrXmww9uRVVTIDSr3VCAFHPUaNvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=IZeniE+v;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9E4606D83B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B9E4606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=IZeniE+v
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36ff9c9da34so2296166eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794077093; x=1794681893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sg7nmjDxIAixbof136SBr2EkAZqYxcTSKOudRFI2tTA=;
        b=IZeniE+vB78tOMPetsPVU3PY2tNQHfaR1Mdw6w2ZhSDlPPhP7lAMOrmcJAQuhulr9q
         AZ2CwDZpj3uolZqKUlFhTnoiGPP5De6WUn0Rhd6b3wi53pC6Y9IVrHw/fweT1YWVtYV+
         GgVvbHvVGMsbLzr/oTTmN1O1ljow6WjlpLYzrpiJknqRmQS1TIHi4cLSpDZhLhM+Addo
         /89k08OpccMtIVHeW7bvQRbIEv2z2UGPWML5+/d0g0llIaiw496Vvp1m4TEJcUmoQ8Uj
         TRMwp9YeAH8Ffiw8uUsV7zI3VGDT7hQ6gBPo6zLkj2nlVibj1Z4UUkXMRjvMC6XZ7nk6
         1WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794077093; x=1794681893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sg7nmjDxIAixbof136SBr2EkAZqYxcTSKOudRFI2tTA=;
        b=ve8gSjMLJfB+SFqPKfRJvlAI0IsVsS24kIwVurLB2I8iyD3j+Nrz9wgLQ94aEiTmQx
         d0Ze3IRN0JXz2eGm3oLp/usbvJ5hxHSc3T7r6X4IxpWDXrlV1ezX2+LXEb0QYgjZez8v
         ErKjqcNvVV+A0XbPPX//MF0KKySEsMemQqvZj87ilJo5ris3MItpKMzRll6hoam8Imea
         C5XIwzDccORP6Pha+nRASTSaUck1+C2oxJJrRFtbzC4OUgisMgzg+WNhhF6wWcivnKdH
         8J3L/Pthv+xw5HG/8sEeH4wDCLEXUuAu6yxdx70H1u8K1pUYwJttgxEvXpsxZ4J2h7lm
         Whww==
X-Forwarded-Encrypted: i=1; AL+hErG/5499zoZcwSg/Lbwi/1Okqac147mlib/dkoHbXdd6+3QXunSk23cxDZGNVQfXpePLGlpaM72TgZ6yAQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pi493ogIGGxgFWINeOQKrF3kt1jQPXk8VAsU111W81AnzfGON
	GhoUkwVRgpmLxrV+2bLKS3uFcLsuDtzlVsV+SfWQk6wwfxwd2PeoW3m4CrImHEZaKLA=
X-Gm-Gg: AYBFou09KKFAjdQ9YfqPPdgWS201J3C0D2TjrWya0H/0OrAlFOzZrAD0AI++bJe49/D
	49htbVOZWL0ma/zmsXOsEzF/XWWDQkh9agltMfk9EscN7zRjPtq0SXFQhFMqS1iYKZeJV9Ne/fQ
	qAcTS5+N/XSIhpUyLEk/Z/PK8zXAUxwqU321K6DhNUksDfT5dFJAbbFiOb24RiEsaJGGnPNNGdj
	gwrFq5bhu6qb4pGHRuSRM0Secl80AvVMlscz5IDyRjSyo0HgrQQ1hxvfb7t2mbv9xoLVYBLWPuP
	nUJI+QkWAT7sQT0asrRxdFxo3zoshoQSjGvc424szR34PbDls9QtFPUCCLx296fKF8pCg9szU7h
	eyApvHYLjkFrNiAkLb1uJ+3pjsl+lEZZrtvvWM+V7DK9zcElJg7widBNIzbSwCWlfIuNIGgd580
	F433SiPM9aPiFi135iWHaxkn2NQfnUhx+aODhuFYrGTyHg5jA4KLV9ebU0V+3ioT/077X5F9432
	Ddy/035cC5eX2WXb7cDgqv1O/EqlAQg9sPaGelWw0MNEsxmpnvnATqcd7PMU6Afhuqm5GDcg0cQ
	za3VucQcA5elr4Qvp6bsPW8u58oEAcx3E0/gMwybQT626qd93dZbFQ0H+yHzq/G+VaHNQqo=
X-Received: by 2002:a05:693c:881b:10b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36f76520e62mr9146148eec.28.1794077092493;
        Sat, 07 Nov 2026 10:44:52 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm17286897eec.9.2026.11.07.10.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:44:51 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	brett.creeley@amd.com,
	sgoutham@marvell.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org,
	Ido Schimmel <idosch@nvidia.com>,
	Satish Kharat <satishkh@cisco.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH net-next 5/9] amt: add IFLA_AMT_OFFLOAD_MODE
Date: Sat,  7 Nov 2026 18:44:33 +0000
Message-ID: <20261107184437.2783174-6-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107184437.2783174-1-omar@blockcast.net>
References: <20261107184437.2783174-1-omar@blockcast.net>
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

software (default), auto or required, after
IFLA_AMT_MAX_TUNNELS_PER_SOURCE. An unknown value, or a non-software
mode on a gateway, is refused with extack. required with no usable
provider on the stream device refuses the link with -ENODEV and extack.
Emitted by fill_info.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c        | 25 ++++++++++++++++++++++++-
 include/uapi/linux/amt.h |  7 +++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 377660e55..58e9da443 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -5719,6 +5719,7 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_NUM_QUEUES]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_QUEUES),
 	[IFLA_AMT_DISCOVERY_IP6] = NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
 	[IFLA_AMT_REMOTE_IP6]	= NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[IFLA_AMT_OFFLOAD_MODE]	= { .type = NLA_U32 },
 };
 
 static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -5745,6 +5746,22 @@ static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
 		return -EINVAL;
 	}
 
+	if (data[IFLA_AMT_OFFLOAD_MODE]) {
+		u32 offload = nla_get_u32(data[IFLA_AMT_OFFLOAD_MODE]);
+
+		if (offload > AMT_OFFLOAD_MODE_MAX) {
+			NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_OFFLOAD_MODE],
+					    "Offload mode is not valid");
+			return -EINVAL;
+		}
+		if (offload != AMT_OFFLOAD_MODE_SOFTWARE &&
+		    nla_get_u32(data[IFLA_AMT_MODE]) != AMT_MODE_RELAY) {
+			NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_OFFLOAD_MODE],
+					    "Offload is only valid in relay mode");
+			return -EINVAL;
+		}
+	}
+
 	if (!data[IFLA_AMT_LOCAL_IP] && !data[IFLA_AMT_LOCAL_IP6]) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Local IPv4 or IPv6 attribute is required");
@@ -5802,6 +5819,9 @@ static int amt_newlink(struct net_device *dev,
 
 	amt->net = link_net;
 	amt->mode = nla_get_u32(data[IFLA_AMT_MODE]);
+	amt->offload_mode = data[IFLA_AMT_OFFLOAD_MODE] ?
+			    nla_get_u32(data[IFLA_AMT_OFFLOAD_MODE]) :
+			    AMT_OFFLOAD_MODE_SOFTWARE;
 
 	if (data[IFLA_AMT_MAX_TUNNELS] &&
 	    nla_get_u32(data[IFLA_AMT_MAX_TUNNELS]))
@@ -5998,7 +6018,8 @@ static size_t amt_get_size(const struct net_device *dev)
 	       nla_total_size(sizeof(struct iphdr)) + /* IFLA_AMT_LOCAL_IP */
 	       nla_total_size(sizeof(struct in6_addr)) + /* IFLA_AMT_LOCAL_IP6 */
 	       nla_total_size(sizeof(struct in6_addr)) + /* IFLA_AMT_DISCOVERY_IP6 */
-	       nla_total_size(sizeof(struct in6_addr)); /* IFLA_AMT_REMOTE_IP6 */
+	       nla_total_size(sizeof(struct in6_addr)) + /* IFLA_AMT_REMOTE_IP6 */
+	       nla_total_size(sizeof(__u32)); /* IFLA_AMT_OFFLOAD_MODE */
 }
 
 static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
@@ -6068,6 +6089,8 @@ static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
 		goto nla_put_failure;
 	if (nla_put_u32(skb, IFLA_AMT_NUM_QUEUES, dev->real_num_tx_queues))
 		goto nla_put_failure;
+	if (nla_put_u32(skb, IFLA_AMT_OFFLOAD_MODE, amt->offload_mode))
+		goto nla_put_failure;
 
 	return 0;
 
diff --git a/include/uapi/linux/amt.h b/include/uapi/linux/amt.h
index de1ae1929..c67a1f763 100644
--- a/include/uapi/linux/amt.h
+++ b/include/uapi/linux/amt.h
@@ -122,6 +122,13 @@ enum {
 	 * AMT_MAX_TUNNELS_PER_SOURCE; raise it on a relay that fronts CGNAT.
 	 */
 	IFLA_AMT_MAX_TUNNELS_PER_SOURCE,
+	/* Relay mode: enum ifla_amt_offload_mode, default
+	 * AMT_OFFLOAD_MODE_SOFTWARE. Replication offload to a provider
+	 * registered on the IFLA_AMT_LINK device (include/net/amt_offload.h).
+	 * Required mode refuses creation with -ENODEV when no usable provider
+	 * is bound. Gateway mode accepts software only.
+	 */
+	IFLA_AMT_OFFLOAD_MODE,
 	__IFLA_AMT_MAX,
 };
 
-- 
2.43.0

