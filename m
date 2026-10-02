Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E14D9577
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951765; cv=none; b=MFCmhAkTbghWdFjgStdLCW5S0vT3I9Nksc6xHDtGY01KZzs6PaearpGUJ4pf0IOwBL9eRTidUIUdLO4KM5/5iSPMsSBOLrjoHnAiijhbPvaDbfclEuAopHnxvYPhDbC2Frl+FoccrUFnUx+crl7s441U5VWfFq3JHIYIGEldgDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951765; c=relaxed/simple;
	bh=BCGicS7Y6bDVCOIyWVuqM71qCFRkkaCxCz33ZwbKG3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4ZwSVuIIeDZSYKNMbJULqsuOAYFArlbBhcNRR7Ppf2A1xbVJT5yzKZWNLTjs2bTM4VVKDCRhVVfieaWp8yP347FYyZxS+eFx+I04LBU9wk0pXLG2oUIqcGrf4GCcaUh3URGQAOvKxb28/UaZeZ3d/ScQOgcFjbbt4PxD/MAYzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com; spf=pass smtp.mailfrom=citymesh.com; dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b=NiuC9VWt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citymesh.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b="NiuC9VWt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so859425e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1790951762; x=1791556562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veTkOzmo6163gdZSR/5amkh40A+qHj9V4VaoR7YYeV8=;
        b=NiuC9VWt5xHXMXqzn9CY9HVJW9IPUVLAY5WMt0v4yw3ZNrFmW53HTmIftq5LE0OE/v
         Ggpo6zN08OeMUtxBBT0S4uUy0ChsmN0gdf7kQnQlOcRF+NmhbkNAqJSjKm+SqFtxA4Lp
         hvuXO5RSCzjh/ho0+N57SBIcY9F7lvyoSyIHpDAY9kzxgMiv27oTEh1bmeDDR+7Y9slA
         edxUYMc/gHnOqgQoa4P1VMYXsBarVD2vLMYOgm4ZkSBTfN9UpGhDObGJdmeGTZK5VOxJ
         B4ySDK69dO+u3DL4xqJd861LZWu39i0hxk0cauTPcTvDEHGUDIB2tYAp87MbuhRcY0+a
         pPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951762; x=1791556562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=veTkOzmo6163gdZSR/5amkh40A+qHj9V4VaoR7YYeV8=;
        b=X3tQKs5jUB3RbMNEgISfV3ZUKkQKRpbNMcVOyEk9nL7Oh+AhrQIL4AGJHoN1rfPrxE
         13ff16W6e6VnyDdAqB5SI31vMvU6abyRamD0Cp/Pc+le4LUjYGYAmDCHD46O6k5llMPA
         kotEuPbwpowYwoGKOBEE2WSVMg4DMX4vGC45BnF5jtbnKf9UNaCncYLVuNZBwgH5a16O
         JBuB3JWaVB1tYecumQZv7wVrk3znDaCzEB9HCXx+i8t3rxsQu18u5S5wD9zd9rcvYVRP
         /umYol1wg2THB4wi2ponn2nZ6VaraFYgVa6nhbGhes7Q1HG6ABYuJrxN8jqjHhPHRHU4
         dY8w==
X-Forwarded-Encrypted: i=1; AKwUvBzKUlPZP2aObzWLugPa321tXeYwXz2L9mXVzctOKpYcMIqcSr/pY/cCjcQh91p7Y/c4DYQx05CIZNNrQWs=@vger.kernel.org
X-Gm-Message-State: AFuF++kw9VwyKEc6isn/AWtutPvjlkQqgAkWMWZh3fhL797JtNgXRFSk
	bZCf43z+ZyqpI7dXDg5DUnEKw5zxZDbVY5e2V2g9pjK9pm3yX5JQI1rs7kVMdfj93BQ=
X-Gm-Gg: AYBFou3zTFVCvFU+yE4Xm3MSln4CjYALzAMU38tuBp0/R/oL0fUaAGVM1VvLD7vg4XI
	xv4rduJ9Zjot1SHXlC3jCtZHW+HtzrECZLaRw4rCQNkVdIrPCMUWZdtnI4k6V0owTLUa1gfbc4l
	IRCKeAlrfIeYxpkmivvOoWgTC/bPIC/iOpxFjjAMqpMWozftsbl2wNsueuUporTgSZyMzSTsADo
	CweyQbtqepukWZVpcoxTgtQeMx59Qgg60ShXLbJAiHEB8w1/qxqVSgNn5Ig3JImAQ7cs00eAO/p
	8OoK86SAMs+SE66sumsJJWFDqXr2wz3KkkcMBIdagzskJF+MnLRLylWWrkq0TrlCjoEtULsey0S
	BECfWeUaiRrFEB6/SWcPapOJIbdMagzOiYPy4btNkQfbj8tIqJtZTn86J/hD0l/yayvi3UH9rzW
	tx56c39rmMqAIJz0xEHFMAAtPTHbbgDgVb35CvbRUV+bRy59I3tXN6PDjofqTnvmqa4hA=
X-Received: by 2002:a05:600c:1387:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-4a02769cc07mr51779325e9.25.1790951762007;
        Fri, 02 Oct 2026 07:36:02 -0700 (PDT)
Received: from koen-nuc11.. ([2a09:bac0:1000:2ef::4e:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67cbfesm8715315ad.28.2026.10.02.07.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:36:01 -0700 (PDT)
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
Subject: [PATCH net-next 2/4] net: rmnet: optimize rx deaggregation memory allocation
Date: Fri,  2 Oct 2026 16:35:27 +0200
Message-ID: <20261002143529.3217189-3-koen.vandeputte@citymesh.com>
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

Currently, rmnet_map_deaggregate() uses alloc_skb() with GFP_ATOMIC to
allocate new socket buffers for individual packets extracted from an
aggregated frame. Under high-speed receive workloads, such as processing
large 16KB frames from a USB modem, repeatedly hitting the generic
kernel slab allocator introduces unnecessary lock contention and high
CPU overhead.

Replace alloc_skb() with netdev_alloc_skb() on the deaggregation path.
netdev_alloc_skb() is specifically designed for the network receive hot
path, utilizing a fast, lockless per-CPU NAPI cache. Furthermore, it
automatically provisions standard network padding (NET_SKB_PAD), ensuring
that the newly extracted IP headers are optimally cache-aligned for
efficient processing by the upper networking stack.

This change significantly reduces memory allocation overhead, prevents
slab allocator contention, and improves overall throughput when receiving
large bursts of aggregated traffic.

Signed-off-by: Koen Vandeputte <koen.vandeputte@citymesh.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index 2eafb1d969c1..ccdfde3711db 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -390,7 +390,7 @@ struct sk_buff *rmnet_map_deaggregate(struct sk_buff *skb,
 	if (!packet_len)
 		return NULL;
 
-	skbn = alloc_skb(packet_len + RMNET_MAP_DEAGGR_SPACING, GFP_ATOMIC);
+	skbn = netdev_alloc_skb(skb->dev, packet_len + RMNET_MAP_DEAGGR_SPACING);
 	if (!skbn)
 		return NULL;
 
-- 
2.43.0

