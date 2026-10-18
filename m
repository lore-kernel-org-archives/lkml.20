Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DEA4A2A57
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328346; cv=none; b=LBgySRQKa7kKZKiF3nxcPMCILbiyPdVTwMh+Tymj5tm+7VOGYNyVkoKfXQ3ERZ7pq7+AAL3lqB2nvbrTOI8G7oPeD0VNLAKGKS/XrZxSJ4ajk4x345nIpaIOJBOtzsKCoj+uLNtDtF2+1lK9VsWFz7UI/8txQ4+FVePmEYiI4pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328346; c=relaxed/simple;
	bh=8AgZcyfplCfNaQ9wKxTOpfCs8+Fbgo88uxJRdzeoefk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwl5oLX6ONIoKR5Nyp3gryjfQcO1G2EIVbzBrn8IQOUPiFz2LdQTa3Kzt8RHiizt99DMBWx0fydFiaTkv6dQMIHrNJb+fqPNZ7uG/FMfx16XrrOszeJmN93xN5xR85ylyqfOoBpTEStO7aPe3ZHpCOOGB95HBKfcsERCgcnYGMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=sHlh1FYI; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="sHlh1FYI"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2055573c8cso144437066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792328341; x=1792933141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAVGT6mmXXV7gd2pst8rSD4EZFUw8guUet3I0hNK1I4=;
        b=sHlh1FYIG/V6Ift3HSOK5bTe1vOeZ+SKY7PXg6r5znC7pf6Z30mDk6hp3Y3KNnzSI2
         AgzZc4bRJa8FwQFyFsZVWFrJPXnalfUvyaHIJvAhxKcvLpwaSVSv3zrC2rzDV3EjJaX5
         /0Jw5QgsBWwGSvbRbjkrZ4VAiMZXJL59qP+hrYRUZWTlzHJPiFvX+OtdEKr16OKbK9Ts
         boBHFBJeuGiNIhgF4/tHMrH25xg1apSAKLGeAUgvtgYeifiA8BSF4b8raz8rk9hc0U23
         uOU1tIfTAmjd/kL59+R5vSQxvfH1EjEs3WazLW9MDkyo7D7FRSRWydMTquaQHp8TXl3Z
         6qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328341; x=1792933141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAVGT6mmXXV7gd2pst8rSD4EZFUw8guUet3I0hNK1I4=;
        b=sM/CkZtpAx3iUiTr0oS4GyYujDFGX7MD2C4c4uaI89p6DH0ta/daNXHkFZggpa3bvv
         yBVV0JuciefqbDCFt2inXwGDeLuKcksnYdNZpGd0G1oMO1EpSANf4LciuagMDVv81uIq
         WekXSGFKts+9RdYBKIn1teaicGBn1fOPrOH+MAcHgOZmUSrbtZWLcBFClft7S2awd/EV
         PMytoUh73ZG7ixMAVH9ebapcjLJuXDuV92lERX2SuL4IMf7lVjNIdFP401QF9SKJpAWQ
         VoedNUiZPa+IYS0t1sGoe7+MfHxW9qCIgy3LwnruXUUEn3BqKE90VINhwCetcB2XfTn4
         5+Kw==
X-Forwarded-Encrypted: i=1; AKwUvBx4AAx+Fy/UHHyjRzUgwo8d0vrInRAeO3t0CBKx04R/E/NthcPfmLzK8bccY9Z4ZShWyZjwcD+DN7RArfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHjOVtaiFf06BlTHwyN9jw1+GAzcWKFRdnKics8rZHWI6tYSXS
	uDciiSNQVfzSEmY7qwdMQ+Mh98PAzkmO89EhRC2PHG57yBbrBC4EFvwyRJoCCHAy3Q==
X-Gm-Gg: AYBFou3cD6njay6tBKSs2nxfSUoKLZfeuKoHA1QLhQkBdMcY9TCXYyrw2BSwnaOPWHT
	QWrxiy2EgCdJ84KjTNyHFZBvxaQzJFYGp3gf4xyXzn/B9Ga/djdSUJwdbWw1Xb/xVlayE70ctXE
	wMHrwPSroNbFpnPFTo9PxeBEHL0cSt/QIJhIRFTC5rz7cXt0O85L/Jx8JK0bsu4Z8Ra9b68/chz
	t/1QGrDkesIk1w0Gvkt4mnkQdxg0swJgB78+D8koPISg8SNZkL1Nyj/gNRGHGHlc9FaOmQnunne
	3bIHXYDfgvkqhAwX4blTNG3ZB1JqVIPplGfUBvs/rqrmwhAReKUnm78crEVIsuu31wkE0u03ni5
	YVR4ytkDEQYp7VCudao8nTEl0c8gQdpwn74y6bUjYKJ8bORaSQ/TFYZ+1g3kfBtuB8tTbqy7Ttj
	jeonNu/6Aj9JHtLC5wENtdLTUOnNm+qZY/ktRthYPJs4ErQIyqcAYtuGn3gpUU0jc00xB9IOyP4
	88MOJ6FbbLqEebXDnYrGSDdn4rDB1OW5k5yQYlgZEEXTuAvdqDKWqsQkf4/+7gXLhWB5IygwyJr
	qtz1d/1A7EvkTOyjcYuS7bbMRVEWXrpdM36EHL1BLiE/ixQoA2Cq3RUK4gFWmDnLhyspeFBs7ve
	4CxaupLG3FxrDM4A2y2dexJuEkAlpHCip6EDM4Oicbat86VZo6KCYlG7yAOZvUqaVIa+ZFgwFut
	TsI8K3AKUei0x3LFGi260=
X-Received: by 2002:a17:907:c305:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c419f90490cmr308794366b.32.1792328340965;
        Sun, 18 Oct 2026 05:59:00 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm259032066b.33.2026.10.18.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:58:59 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/4] ip_tunnel: move the TCP fixed-ID flag to the inner header
Date: Sun, 18 Oct 2026 14:58:52 +0200
Message-ID: <44dce02a36429356aa12372bd928fc79d45bb965.1792327155.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792293419.git.julius@bairaktaris.de>
References: <cover.1792293419.git.julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SKB_GSO_TCP_FIXEDID describes the outer header of an encapsulated GSO
packet and SKB_GSO_TCP_FIXEDID_INNER the inner one. TCP GRO sets
SKB_GSO_TCP_FIXEDID for the header it merged. When such a packet is
forwarded into a tunnel, iptunnel_handle_offloads() makes that header the
inner one but leaves the flag, so software segmentation gives every
segment the outer ID of the first and increments the inner IDs.

Move the flag to SKB_GSO_TCP_FIXEDID_INNER when the packet becomes
encapsulated.

Fixes: 3271f19bf7b9 ("net: gso: restore ids of outer ip headers correctly")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ip_tunnel_core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
index bab42b9e277f7..752ddba1298b6 100644
--- a/net/ipv4/ip_tunnel_core.c
+++ b/net/ipv4/ip_tunnel_core.c
@@ -174,18 +174,29 @@ EXPORT_SYMBOL_GPL(iptunnel_metadata_reply);
 int iptunnel_handle_offloads(struct sk_buff *skb,
 			     int gso_type_mask)
 {
+	bool inner = false;
 	int err;
 
 	if (likely(!skb->encapsulation)) {
 		skb_reset_inner_headers(skb);
 		skb->encapsulation = 1;
+		inner = true;
 	}
 
 	if (skb_is_gso(skb)) {
+		struct skb_shared_info *shinfo;
+
 		err = skb_header_unclone(skb, GFP_ATOMIC);
 		if (unlikely(err))
 			return err;
-		skb_shinfo(skb)->gso_type |= gso_type_mask;
+
+		shinfo = skb_shinfo(skb);
+		/* The header SKB_GSO_TCP_FIXEDID described is now the inner one */
+		if (inner && (shinfo->gso_type & SKB_GSO_TCP_FIXEDID)) {
+			shinfo->gso_type &= ~SKB_GSO_TCP_FIXEDID;
+			shinfo->gso_type |= SKB_GSO_TCP_FIXEDID_INNER;
+		}
+		shinfo->gso_type |= gso_type_mask;
 		return 0;
 	}
 
-- 
2.53.0

