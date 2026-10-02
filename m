Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756CD4E01E2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951774; cv=none; b=u6xSUDRudtABgcLMt2vlxeOAMpHBKEer4/wvAgbVCWT8juB3tTp1eUtXEQc4fUnAaixyslZqpwMaJIH3IPT6A+pshDfESZ98nQc0W5dObMTmb/JcpfEIUpbR+sw9DOLjCJRCK5MWAkuPIxjgPtcNWvs0Vjn+GjPrt3f1Cnk+l5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951774; c=relaxed/simple;
	bh=zQ91ICwZjqU5P6aGDiyYlfRLUyuW9YOMBnxwHcCrIWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHfMJEMQB8ZQvjJ6f4+v3IYYoZnkTHyK91fbuZxpNp6aHOFVlhoZSeU40nJufJSoQKHCLxP879RGHoeMKmSvz+2RYC99wYJdROCQZvdc3jlYulo3rm2LIqxNAMaatJzVhOnKhdisZv4w7akyA23rIMcY2nu6vulvGcsir/JfgLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com; spf=pass smtp.mailfrom=citymesh.com; dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b=iD/oop3Z; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citymesh.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b="iD/oop3Z"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso44322135e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1790951771; x=1791556571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRr2guhba+ML772UP06zlXanMDzKKDE9ikuGJMi6gS4=;
        b=iD/oop3ZuBKpB98GRhE90n+pVvh56UsE0s6OD2PrCCH3uCl1EQ8CIjgdi8PzmpkyXc
         vj3KVtY4Azdk4cCbZu7DAitU6RTcIQd5OVZg6zwE4DeyJC7IH0IpsE74I7BCDfHR88Ku
         G7YrsT+C8w4bfISHlliWbIsm5LV3Wns/bSLZx7gGThMM+S5A9ELupHSQjJFoYOiHnati
         kjg962GMHL0MN501vy/jBqx29dmglC6dYKEwb4UdlzUtv03VuI0B71hr2JQjOJZmpWJz
         4IfklI6MGuMNc/evV/DquKxGofhNhAtBQJB2yI0jNKTcgURggHLFcInEPrdVyUD2j66v
         2eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951771; x=1791556571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRr2guhba+ML772UP06zlXanMDzKKDE9ikuGJMi6gS4=;
        b=AClTiffJ+Wc0MPG4m9azQ8deR7RyhjXTy9xphh1ws4+J7tCJW4nYZ9zDa11OZqXLky
         BEcDJBF3d8O1BfWyIB8ZlYXrVIzswC8Gvhd9yZ7uZfD7H8q+koqZxAZMxAaIAVK7ID2O
         awKdpCWxZ506LlqaHvsJ/yBvZOdA7onsT4zMLEmItbTTBUvmRJGGhtbzsmZA8LAGKxVS
         89icoUPsB+Vre5vMOT8vQCdj9N8Tii4cYCQGdlTupASAutNrfL6R5l1brobwTUYCU3dz
         w9GKyjmGi7iRHwy3VgfxMCBywv2fmocDhczGT0NbPDYUgKapLmYeqhgXpk71iYGp/dmP
         8dpw==
X-Forwarded-Encrypted: i=1; AKwUvBwDqMZyS3cwinkGuCOaWd3k7jqhR5RKZicDWbWiEZvOI34rqFjI1k2EEzhOwsEv/TZWgSt6o2xIKTRkbVM=@vger.kernel.org
X-Gm-Message-State: AFuF++kFODoKJiD4MkQWGER0IhUIPQ0ydOycq0DP/5Sl9G4lXWKgIpp0
	03UHypZBIpj8lyzF/fONKJ/mUdAUtUP9AzKTD0k1UxF8e4yD+G9ufcKcY4WbuoSCyOE=
X-Gm-Gg: AYBFou2ayvKef+jx8PEiInntis9+hAoT2U2L+kq4kig3FavlVJzKCqGteWk88PC5rpE
	QGJG8/u540Sbm+GqI99NOBedz0QDnzBfKrC0ObvB4Zlwr5gfuXAk4XrcaMujFqfErTDPXxZtqKU
	Zl8eJpb9M6opvCBQ6t/KLU/sDroU9yKiSGjyLOjLA4f88rVVKbbXY4psiWEYpwu206gAPfkNW/v
	/n0fPARGjRLAPqW3E2D3T3thUdZ1ffUTjkhWiRkfUjlAU4aSUJfTy4ieQSDJC2Sqp5Q+GYO9+GF
	Ufo4/NRK0YZJDWk0QQroKR4QKWwVBnE3XPuSqfdtBDT4QmEdUJB40O4yq+ZDUVK5OPzz+1DHv7c
	MYHzWC4KmXEfejmkCkwfVew42Sf+lGs1/Z1gN3syvWfAsyaNQJLDvTd77iXGKGIJm4LAnjH75oj
	gFrAt3eUC+ey1PHQZ0PpFEbd92Ekm1EYVE/VINq1aOXj3ZUUSt19rKHt5z7UHCWThdcT8=
X-Received: by 2002:a05:600c:1911:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a0275657a1mr50439615e9.22.1790951770536;
        Fri, 02 Oct 2026 07:36:10 -0700 (PDT)
Received: from koen-nuc11.. ([2a09:bac0:1000:2ef::4e:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67cbfesm8715315ad.28.2026.10.02.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:36:09 -0700 (PDT)
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
To: netdev@vger.kernel.org
Cc: quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dnlplm@gmail.com,
	linux-kernel@vger.kernel.org,
	Koen Vandeputte <koen.vandeputte@citymesh.com>
Subject: [PATCH net-next 4/4] net: rmnet: optimize rx handler by replacing skb_linearize with pskb_may_pull
Date: Fri,  2 Oct 2026 16:35:29 +0200
Message-ID: <20261002143529.3217189-5-koen.vandeputte@citymesh.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002143529.3217189-1-koen.vandeputte@citymesh.com>
References: <20261002143529.3217189-1-koen.vandeputte@citymesh.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rmnet RX handler currently calls skb_linearize() unconditionally
on every incoming packet.

When receiving large, hardware-aggregated frames
(e.g., 16KB or 32KB from USB modems via qmi_wwan),
this forces the network stack to allocate a massive
contiguous buffer and memcpy the entire scattered payload
out of paged memory.

This severe performance bottleneck is completely unnecessary
because the RX handler only needs to inspect the initial
4-byte MAP header to determine the logical endpoint
and route the packet.

Replace skb_linearize() with pskb_may_pull().
This targeted check ensures the MAP header is safely accessible
in the linear data area while allowing the bulky payload to
remain untouched in paged memory fragments.
This preserves the zero-copy architecture for aggregated frames,
drastically reducing CPU overhead, cache thrashing,
and memory allocations on the RX hotpath.

On a slower embedded board, this improves throughput by ~10%.

Signed-off-by: Koen Vandeputte <koen.vandeputte@citymesh.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
index 95c3e3934fd3..a2379df69a6d 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
@@ -217,7 +217,7 @@ rx_handler_result_t rmnet_rx_handler(struct sk_buff **pskb)
 	if (!skb)
 		goto done;
 
-	if (skb_linearize(skb)) {
+	if (!pskb_may_pull(skb, sizeof(struct rmnet_map_header))) {
 		kfree_skb(skb);
 		goto done;
 	}
-- 
2.43.0

