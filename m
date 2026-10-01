Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C8364EAB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847575; cv=none; b=usNIK2xqE+EFsNs03CupuH09hVg8CEzX4nMaUK/Judt4NdmOb/jI7GAcEloTf1WOx1tSfk4zz1LiGO0rNB9C63fdcBYxK6NeSn20VPv/D1ySTSGsMFdHCpwGSqFI1LyR9LgO5G3V2ruGgXEW78RUBrOsOKMz/nkVOWk/Iw4BDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847575; c=relaxed/simple;
	bh=ZADkkZn7HN7bou+4zRcIFWfkZBSSPWIycn/B8FwZ9Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQ6qmcznDKSYVU+0T2Td//shGkMUpPN+ENlGM5PeoSfYvrHDq+C/ehpOkMvizL6CBkZVxHfLxYj1eZQgr3TwvdKw32thb5qzt+9W3NGrX9P/MqUOPo0tTR+cjqatcI0r8ih+oEAP7JYHM19k/mZs2b043vLkHJ+22TkwW6r6H3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpGqsxiH; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpGqsxiH"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so53285541fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847572; x=1791452372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxBQyCUXBxxGCn8236LFkNCS8I/Hm7fiHMOoZKxNqEM=;
        b=FpGqsxiHnfihUBF1ZmI+TPLvgyPW+3yZTB66+uv280dM35yhBH2r0xOdSgiYtMfcue
         QbdOyvgfm6sVBq7m3Zwy7sLnxNj5TYAc0djk429LO814M60r/3UXHR/6zR7WxlY00wJW
         oyYE3DWnRR9VlsoUviEGxBW3VKxY1sCNmMnxi2CGFMD9sCdGPemfD22jUOC+2dfeY0rJ
         1P67hjX0PfJgnXWyJaJXHOP0NpxBjl5A5hId5cgT/hhUuMX0Iufx9LBcWYFyVpzX//+t
         SsuONSjjdhPGwJhIuOIJ0SRWWYhSZZwQ/LRSt1a6dpZQyUT3kshxbjmpvfjQtn9uBaWR
         wYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847572; x=1791452372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxBQyCUXBxxGCn8236LFkNCS8I/Hm7fiHMOoZKxNqEM=;
        b=PrISyr7j+SUm8lQ8fYEyC6BCzzBe7M0Yo3Oa9HZVQti5wRz4b/K9iITq5zrjxOEeph
         vqjjjFSWmLq8MlGSFq2+taufbDrLZOChUXL7E5Hn3QmFX8I3qnwSrFArOLz/S0ca5Wef
         nd699FJRokvyOYQ0w0D+O7CmkZCkXIgIILzm5bl0LleLGYA2U55lzSuj89EL1oSGEniC
         uMUtsT/puItvNq/JhCnetWuTr/jLGLrPEdqxai6mnIzDKaUZ+Qkhp9Btp3eQx98T1EUC
         clpBhztDAnZg35k+kfZhM4PyimsGOteAyYmKU13SzNELB78xigfuITQT8A03RTU53gTW
         FFFA==
X-Forwarded-Encrypted: i=1; AKwUvBx4fAn2C5iNmfyG+5CxMfJ6xFVFvwZNs4fl1ec+GzuH5cm0uY2IlDwwonUWcFE1kMICgy6jRlSul+85h/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPKW3g38rVjDDg5ij6OboIio/+b14bG6uWAhoLqYeIiF/SAYRl
	1eK4kbaeae1Os+2PCDt4A/u39X+poytEewq1zWDwBfpBygKb8RPD7Tke
X-Gm-Gg: AYBFou1PP3mUYMDorpIXcFrcECeSadfuP3tgiDWdFSgl22OlOtATvdTPBYhEtPBXIJp
	Y8OA0QXbNw8bUTJOKe2PhF38HGZJ67AXUY/TOjtiteS5CLZmZjUEv97HPpNX/eUfSMZ5Nvgnpz+
	gma/oLkJ3hQ/f2Nq4Am7yl8T+TvdDbYoIrOGeKbxl0geEQOBVQs+rRaLtvXda9DQlkCTMdl55xJ
	7uXzPed/MUVvgSa1Dln9kVtUm0vKSRW34i9KiiBcwOVL8wqhzzgp00TeFNLtoIP/5LqLt7sW99t
	3mYXos1mGBt+HVVvUchWuRIT/CSoulSyELjb8IVEgHs3WXL/c11oIJtg4XxmKZS13JSIoi2yAp4
	bFztgEwC+886sOAuiqQo4RIm9qkItviA3l9a+GMoyJAj/3N2o6vgligNo2fP4n3k8pDDZKnOKsL
	uek7V4wTkp5FC1eUySO5wjUNED2YB9t6ZzRb+u9+VRUusz4MRMs3G7vWBkPFHk+HDV0pgXHqoho
	HnTTjMUzISmQvJNS3dArGO3Fvkz+JMSGZYz1iapCw==
X-Received: by 2002:a05:651c:4182:b0:3a5:e792:2dc7 with SMTP id 38308e7fff4ca-3a77924076fmr10015781fa.15.1790847571835;
        Thu, 01 Oct 2026 02:39:31 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7717f1e64sm14202621fa.17.2026.10.01.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:39:30 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] tun: use pskb_may_pull_reason() and remove SKB_DROP_REASON_HDR_TRUNC
Date: Thu,  1 Oct 2026 12:39:25 +0300
Message-ID: <20261001093925.3529772-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tun_get_user() is the only user of SKB_DROP_REASON_HDR_TRUNC. It sets
it when pskb_may_pull() fails to pull the Ethernet header of a frame
written to a TAP device.

pskb_may_pull_reason() reports why the pull failed: PKT_TOO_SMALL if
the packet is shorter than requested, NOMEM if pulling the data into
the linear area fails. Use it for the Ethernet header pull in
tun_get_user() and remove the now unused SKB_DROP_REASON_HDR_TRUNC.

After a successful pull drop_reason is SKB_NOT_DROPPED_YET. The path
that later finds the queue detached has no reason of its own and relied
on the SKB_DROP_REASON_NOT_SPECIFIED initializer. Fall back to
SKB_DROP_REASON_NOT_SPECIFIED at the free_skb label, as vxlan_rcv()
does, so that this path, and any later one without a reason of its own,
keeps reporting it.

The error returned to user space does not change.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20260923145931.GA2859441@shredder/
Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>

---
 drivers/net/tun.c             | 5 +++--
 include/net/dropreason-core.h | 7 -------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 5a302709a68a..758956f93979 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1932,9 +1932,9 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		skb->dev = tun->dev;
 		break;
 	case IFF_TAP:
-		if (!pskb_may_pull(skb, ETH_HLEN)) {
+		drop_reason = pskb_may_pull_reason(skb, ETH_HLEN);
+		if (drop_reason) {
 			err = -ENOMEM;
-			drop_reason = SKB_DROP_REASON_HDR_TRUNC;
 			goto drop;
 		}
 		skb->protocol = eth_type_trans(skb, tun->dev);
@@ -2062,6 +2062,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		dev_core_stats_rx_dropped_inc(tun->dev);
 
 free_skb:
+	drop_reason = drop_reason ?: SKB_DROP_REASON_NOT_SPECIFIED;
 	if (!IS_ERR_OR_NULL(skb))
 		kfree_skb_reason(skb, drop_reason);
 
diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 12f909651591..47b44a29daab 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -82,7 +82,6 @@
 	FN(DEV_READY)			\
 	FN(FULL_RING)			\
 	FN(NOMEM)			\
-	FN(HDR_TRUNC)			\
 	FN(TAP_FILTER)			\
 	FN(TAP_TXFILTER)		\
 	FN(ICMP_CSUM)			\
@@ -427,12 +426,6 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_FULL_RING,
 	/** @SKB_DROP_REASON_NOMEM: error due to OOM */
 	SKB_DROP_REASON_NOMEM,
-	/**
-	 * @SKB_DROP_REASON_HDR_TRUNC: failed to trunc/extract the header from
-	 * networking data, e.g., failed to pull the protocol header from
-	 * frags via pskb_may_pull()
-	 */
-	SKB_DROP_REASON_HDR_TRUNC,
 	/**
 	 * @SKB_DROP_REASON_TAP_FILTER: dropped by (ebpf) filter directly attached
 	 * to tun/tap, e.g., via TUNSETFILTEREBPF
-- 
2.47.3

