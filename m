Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334213;
	b=NjibdW5+LAdXs0KewCZ9XVCNb/zC4UbY+hh7au8AperhY0I85OdV13otbugf0mD7i8/z
	 8MSUJlUt9Kmp2NRPRYx2OQRS3rgC/yDrMBDMnqtQBkZO3MxHe/OK7DZ/Esg9NqvEG2Xdj
	 R2L4DQJjm8IB0JankWnJ4cJ67R7lQfumg9aEBfGYszd5IzAdAfxlSb9f8La/WtkQcgm8w
	 /qbAPw/g+upRnwPg+IF+gfGabqigJU7wz0gI8zSallH8sRnGBruj/FDREwpUF7TwMSYcu
	 w7IGLwq/7VjBepPlBaJJcoWPyzcmpUpv+dpxbDI/by4e+RkA+8DwzrqGM1UZ8/JB/6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XN4XDyaiqYlOIplV7CClfO+XYVm+Kn4edMfOjEe2lFQ=;
	b=fUivY2HsqUzIjiShirMPjFo72Ou4uT5FOeWBctldaJgSz6x4xijnY2ZMoAhHGxq/oGm3
	 fXypkILA94oTaQEm/ae/zzBnwdA6720LjUIz4svMfqvJIaiHNzw9rp/YVQQUGsas0GGBu
	 F3kPNElZiMhS7S0KKkXUlVmlcU4zeBqkynyKaNcDopwgOnDy2qyOEdpbYnoORl928SeI2
	 0JqmCuDMj6uslbRUSKZhrJBMxuWWeyx3Y70lHfV+wB9kqRMrehyoy32IWC/cDJbyYeSDW
	 R6XFF7dndBwxIyXmRpjPJcdnXnOCHNO4IW82JZ3WzANG7CP1mUTrvf6EIuuQJ0vqUpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=WbyQfqI0;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BA1606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BA1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=WbyQfqI0
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843cf077f10so448517a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334212; x=1793939012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XN4XDyaiqYlOIplV7CClfO+XYVm+Kn4edMfOjEe2lFQ=;
        b=WbyQfqI097yHRB3+7aqxBmB1xknuabF6gN0MRP10jfBMsSndXmWbK9pPvOZllmPr05
         MBm2qcpdzkbWWNEy7thMZjekuiOkgjZqB6MClyeokHWrZ/4n2joOeIAxlttHCer/Bqq3
         9Lc+byJPShOER5gUpuxDeqKRsavCodwfdHjcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334212; x=1793939012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XN4XDyaiqYlOIplV7CClfO+XYVm+Kn4edMfOjEe2lFQ=;
        b=CboZUBF/YvBJgFQwerFPwLUKLIC7viOaW/IrlXElsxzRRfCy0qqi4K2DN7JbdXfRLz
         HgTp/fvxPvpt0/C31dqpnIiXARHuudMsXYAWhQ+WuAz/k27RvSYXauRlpiYoirOcBqWn
         Qz+kThOqJpyROQyf2kZgvSLWDi15e/R9nqd5I92h03TV71zDem2Ylmf/B56s2Etb+mMe
         Tte3I0B4j7oISd3iFtLeykrROt+M54q/V9vuMCR3EixxYoeOtR0Y+t2MdcReJm4vyX2M
         ZnDE8i5fZY2beOhTN5fICvmk2VGZJnonyCZRpC/MVxWRhSWg0AHxDy6llb+XAo8DQJZi
         0W8w==
X-Forwarded-Encrypted: i=1; AKwUvBwD1qE5jPoiW2kp28Ayc+9oOFXtyMfPjS1amiKvckh9RpRy5azYlJq3vfLrgA0I9pNz2bT/eNHci0KdKRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMP3uBlAJouHIuCmshksY63ouv/x2wyS/BTPFDbNwPdvjbBLBc
	d/5hSvT1IWgcrWxqGkP49kTLdf+99hWCxGbRYQM9U6EdSADm/EZqYcjN6b9SaBwXif4=
X-Gm-Gg: AYBFou3VDs/xxkTpcHyfAaLR2QQVpJH670Qyse7h6MONwoQP0cwmH/9889SD6J7MoFz
	mvajBTOdFSuGe175Jz9NbRNXsgYJyM+rl+ePWi16v4bx3P6Tgyw2bWa3TA4A6qbfCR1aIb7MRfB
	Dfrhn7h8tVYFnCqaDh+Wj5oJ/26NpVLcBLVJvqU2hifUGILK/bagwjjqJ8UYe1uY2RpHmUePkv+
	G/qFLBcvDdBC6t/8oQGYia/cjO4/J1EusOKj3O9061vOg6Lf9w2ZXRMu02R9yC3kmFZkUSe+Bvo
	88JnIxX/6kt8hkvTdtL81rqrd2jWjTesHRT7aTvEMkcOZIfvoZE8hPRAO41xseqZNrQUBf2podj
	JWd/CtqPnDtDel/JAE+MuJwtBqwqtO8yom8pIKWk1vym2QLiL+LTpuHz/KZgeu5nkWAdO0ebMK/
	Ke/tGnOn/2DGqJva2RuiEPgu5I3sNhG+Ja9LzYEY8e7hUypPrwSIJReDNBmo8tCMRZ48o9tnO1u
	S2o4JU4pASgr5cL1GK1PvmOcxE+IEzw1FsBdU0kY3CwOHGECSBZ3t12XuUR76Xi1IjQnAAJCY9Q
	0m4qBw5htULuuzoKx1IZ1gCpu9kHlEoWgEC2T/2AyzLSlTwvEh2JVuIf8w4Hvk878m0BNbMpfFQ
	XVQv1BUqAJdTwxQ06WmZwuzhxAHOroQ==
X-Received: by 2002:a05:6830:4c0c:b0:815:e061:e72e with SMTP id 46e09a7af769-85d365b33c0mr897995a34.23.1793334211180;
        Thu, 29 Oct 2026 21:23:31 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm1218751a34.10.2026.10.29.21.23.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:23:30 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] net: skbuff: preserve fclone lifetime when freeing stolen heads
Date: Thu, 29 Oct 2026 21:23:29 -0700
Message-ID: <20261030042329.74461-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

skb_morph() can give an skb from skbuff_fclone_cache a page-fragment
head without changing its fclone tag. IPv4 reassembly can produce such
an skb, which can subsequently reach the GRO stolen-head path.

napi_skb_free_stolen_head() puts the shell into the ordinary NAPI skb
cache without dropping its fclone_ref. If the embedded companion is
still live, KASAN poisons it along with the original, and later cache
reuse or eviction can overwrite or free the allocation underneath it.
A mirrored batman-adv DAT packet retained in a plug qdisc reproduces a
KASAN use-after-free in plug_dequeue().

Use kfree_skbmem() for fclones in napi_skb_free_stolen_head(), retaining
NAPI caching for ordinary skb heads. Also use kfree_skbmem() in
kfree_skb_partial(), whose stolen-head branch has the same assumption
about the allocation cache. This releases the shell according to its
allocation kind and preserves any live companion without freeing the
data that has been transferred to the receiving skb.

Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/core/skbuff.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f676411724..7f08139ff3d5 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1495,6 +1495,10 @@ void napi_skb_free_stolen_head(struct sk_buff *skb)
 		skb_orphan(skb);
 		skb->slow_gro = 0;
 	}
+	if (skb->fclone != SKB_FCLONE_UNAVAILABLE) {
+		kfree_skbmem(skb);
+		return;
+	}
 	napi_skb_cache_put(skb);
 }
 
@@ -6263,7 +6267,7 @@ void kfree_skb_partial(struct sk_buff *skb, bool head_stolen)
 {
 	if (head_stolen) {
 		skb_release_head_state(skb);
-		kmem_cache_free(net_hotdata.skbuff_cache, skb);
+		kfree_skbmem(skb);
 	} else {
 		__kfree_skb(skb);
 	}

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
