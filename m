Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1DD2641FC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791956781; cv=none; b=oZqCRGe50ehhH6WwDdT9TysyMkB4hfiiHeSclKn69wqLfdQJUdOU8DG72ITiFO9JA1niMhN+xqjxcB/glbNOucGlqm0oB1RfN3gI1s9X2ldy1iOoyr1RWs9/o471Jhe8VVJynRgyPJt3BZUy3Sq5ScVbEoVvNyGFvMslqcJPFpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791956781; c=relaxed/simple;
	bh=DMNfYlMwDzFMT9MKWuc7BGVkd9GqxzgPKdtOv8N0d6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3i69G9IBnqAGpMutMqkVndrAvCrqYJUAOFFBuOL8FJV4KO0BnXA7lA+AunFXXsMuFn0aU/6DZFOOs52lAZ0a9bLpaZ0f4OEKFROB0Y2reJfQwU3pziSnigrH2YG+FUKxhjyIloSYZlS2haW9YfztoriZNivPQqnXmY7aQCHLEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvXML6M+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvXML6M+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bced78b3dfso2368204e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791956778; x=1792561578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+5T9X62m2XyH/11b9ZRGWiO9yNW0NlBwsa5IZJ3yF0=;
        b=DvXML6M+HQtzDKlYSPeCA/lT1kcDCuWDtRRTnya9JH62cR70C9hMZa35P3pKhcQlD8
         QMU0hWQpEJD0uIslHaRqf+rSew3orOYW0y3lbg6Qd3qKymBPwD8qlNI9LgrIPvorpFWG
         mjopF7e+VHcOviRaP+KYheFssoV7lYcKRMLegkpT1vZ4yug7+XY4C3o/77PqbycirweM
         Uu7mJQ8h/eFAVXPlX+7Cmw5cLd//0o5KjGJEKiDSKolnQInDDSneK/CAIGLcHlk1FQvW
         gHAncDKywvKKzyDNkDqCIhfHtURF8LpWGWpT5TjmLeTLK05KtKFWMGzL/Ogf51FBy38+
         Y7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791956778; x=1792561578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+5T9X62m2XyH/11b9ZRGWiO9yNW0NlBwsa5IZJ3yF0=;
        b=ZXJJvNTK1Ax06CwmO2EB7yAviERxG6py9s1I2ZCqLOcYvPmNq/WTffDqp3Tkt1y8kD
         eA+ISnK/KHJZrV0CSovPdlzdK0YRZj75BEFRkP8uT+6UWXTA/qEqZFv9qEvtM3usMYKc
         38ncse099xrAeLEP4T+pMPpx4lcDim5wOtsMw2pwgGE0ehSJR0/gvt4BvsGGCPHk+IBM
         ZUoqq8sqPPj0464KYCM1IYEAbtZwjpIjPDGgy7DWMDncgF4w8eAhAtbniaU3ruuy4HdF
         ehCLxwQn1aO7db5tlfDYd/u+Z577ggYq9yA5OWoxExzoyYjcmjf2i5V5RfKZJtKKyVPZ
         mSVw==
X-Forwarded-Encrypted: i=1; AKwUvBxVqEbc+3JSuoOBWDf7jYz2wOfVPphIfCXP3xXYDpY8BXh5EQQ47C5IGbu85K11Gkk7vkUl0BWbj2NWnos=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFEKFbldByh7QvRHko1+n8ZoHDZG6J86ioBu2EDPEBDiO0Y00/
	rMa03NOzWjJBe1bX+G4nNqt3XpDOVx57I475V3Da0ua1QbDToGBtoVg6
X-Gm-Gg: AYBFou2wXx3EK/9wkSsQl98AaHDReaJxV89mHc3V7P+2yDYWUTgT8PwPqAof8fOFPja
	U917XI3DQmmbNkGwDT3DSRPFxMyqCy+JKzbaghoh6yr/0awthdDP5SCm47SBGOo2OlwofcldagF
	9nPy/QRJapTjPNdkLLV46Ztl9UJPU09qIS4gAmrIiGNetvwGfUwk85Gt77FFopiFm0SvrA5xtvQ
	1iLnQh11tUy+026vmLfxzmyzhcCW9PA46JsujdYDD99f7Pu818Z69FCkiiz69HZtFjYZZI/OUxb
	EX8BGkM957+alyuoFc2wlCbVbAbSNmbXKym36gL1B4vk7BsxxNP6a/ytQb7xhsVaCXJq/5MSlpl
	o6dA7WU3RU0mmU7Jpf8d4e7Yxib2LjzKyhK3zUhsRjvRFvd9FI0K20xxL0m0wxSoGXQdDdPphzt
	IaGgXy8X9+Tsq4X682vjiukEyuXTvCmdDWvvDSsoWvpnPjFzFJbgsaNQdKItwAYMNYgnNJmHLLU
	MksO9uTXufVbXDU7bnAoTVEBd2ObDNWRnmB9KrIFPLMVftUr7Eo4SPWrTwFvolT
X-Received: by 2002:a05:6512:308c:b0:5bc:f0ab:1f3f with SMTP id 2adb3069b0e04-5bcf0ba663amr3547827e87.42.1791956777495;
        Tue, 13 Oct 2026 22:46:17 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.131.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d8fe69sm392928e87.57.2026.10.13.22.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:46:16 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3] tun: use pskb_may_pull_reason() and remove SKB_DROP_REASON_HDR_TRUNC
Date: Wed, 14 Oct 2026 08:46:15 +0300
Message-ID: <20261014054615.1656074-1-littlesmilingcloud@gmail.com>
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
the linear area fails. Use it for both header pulls in tun_get_user(),
on TAP and on TUN devices, and remove the now unused
SKB_DROP_REASON_HDR_TRUNC. The pull of the IP version byte on a TUN
device with IFF_NO_PI was reported as NOT_SPECIFIED and now reports
PKT_TOO_SMALL, for example when only the virtio-net header is written.

After a successful pull drop_reason is SKB_NOT_DROPPED_YET. The later
error paths without a reason of their own, the unknown IP version on
TUN, the virtio-net header conversion and the path that finds the
queue detached, relied on the SKB_DROP_REASON_NOT_SPECIFIED
initializer. Fall back to SKB_DROP_REASON_NOT_SPECIFIED at the free_skb
label, as vxlan_rcv() does, so that these paths, and any later one
without a reason of its own, keep reporting it.

The errors returned to user space do not change.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20260923145931.GA2859441@shredder/
Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
v3:
- Rebased on net-next. Since commit 44378d02c5aa ("net: always dissect
  GSO packets in __virtio_net_hdr_to_skb()"), the virtio-net header
  conversion runs after the header pulls, so the commit message lists
  it among the paths covered by the fallback. No code changes.
- Collected tags.

v2: https://lore.kernel.org/netdev/20261003132340.4175269-1-littlesmilingcloud@gmail.com/
- Also convert the pull of the IP version byte on TUN devices (Willem).
- Dropped the Reviewed-by tags, as the IFF_TUN conversion is new.

v1: https://lore.kernel.org/netdev/20261001093925.3529772-1-littlesmilingcloud@gmail.com/

 drivers/net/tun.c             | 8 +++++---
 include/net/dropreason-core.h | 7 -------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 8b82a7fe6ec7..d4152c9ba8df 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1903,7 +1903,8 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		if (tun->flags & IFF_NO_PI) {
 			u8 ip_version;
 
-			if (!pskb_may_pull(skb, 1)) {
+			drop_reason = pskb_may_pull_reason(skb, 1);
+			if (drop_reason) {
 				err = -EINVAL;
 				goto drop;
 			}
@@ -1926,9 +1927,9 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		skb->protocol = pi.proto;
 		break;
 	case IFF_TAP:
-		if (!pskb_may_pull(skb, ETH_HLEN)) {
+		drop_reason = pskb_may_pull_reason(skb, ETH_HLEN);
+		if (drop_reason) {
 			err = -ENOMEM;
-			drop_reason = SKB_DROP_REASON_HDR_TRUNC;
 			goto drop;
 		}
 		skb_set_network_header(skb, ETH_HLEN);
@@ -2065,6 +2066,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		dev_core_stats_rx_dropped_inc(tun->dev);
 
 free_skb:
+	drop_reason = drop_reason ?: SKB_DROP_REASON_NOT_SPECIFIED;
 	if (!IS_ERR_OR_NULL(skb))
 		kfree_skb_reason(skb, drop_reason);
 
diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 664249924219..fa2fe8990557 100644
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

