Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73554E50B1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981605; cv=none; b=NvBZHvMdarP7bjlauc766fsBnMCcX13Z46ec/5nCLK83KiLbn1tSwTVvLVeTvl2q5jesL9piUwuLM6UI79Qodk/8uzIAUzDrLvwRvgkI9poCKEep7VVKZU9n2+xtT47dhXsXbTau1ZJkPIOlW7TD1i+nhVZ1PPIEIAGtMRQfxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981605; c=relaxed/simple;
	bh=Ksp4EgliF7QzcdXzGDFAVUiL11TloA7f+lfEnZXBD2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8kiBI9zZEnO1T+F8x7mOOiQidXsp+DYRmLH893rk9KvjIHHNMRaaAe8GNyNA5bZIJw+x1veVmShWsvSaJPlmdbOzeDgzaZwwQuFOr6QOu0mDSK2sBaRVTLoWsc2UyT4i2OY8McgcJyOUJex0zuEPYObyDD6EIe1I2I8tddqnQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkR+McFU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkR+McFU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so35758015e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981602; x=1792586402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXNpyqm5jy+6hjKyKFpoJe12RqunxSVKiBFsjy58fn0=;
        b=fkR+McFUqxCMgh/LtJQdKB5dtMWul3fmc9y1nbPzTFnGvO2a0wepY9DtguRNkvUQqh
         qvCWiCfYemdwB/yZ0FMxZ34CRZX/fEulp4wm20wURv7v8pSP1ifnylx5HIRj8cvQXx5W
         B++2Ta/yc4kFlbUz7WKYaccuf4rEtASR5n9lGkY2sjPvnY6bcXVaR0+J38GMZ6ye5Bbf
         rFO+1je63hWWw11IJe+p/LGP30gYvNOTMmsdf1UjXUqeF+XJEI73z6BGL8XtW22dhKds
         t+0u+xQ+OnvgHqRo+dWLEALmeK51KHgT54UpaAGziLWuBfmxHpJ92E5qrfsaO9ErflqC
         PWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981602; x=1792586402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXNpyqm5jy+6hjKyKFpoJe12RqunxSVKiBFsjy58fn0=;
        b=zMFvzfogin5zggdJz1QS9GaGXDB8BAyFiwk4D+mAJFzwAQeOG4xlCbUFGcNJiVgDlr
         YRuL//D/jcEOU+E4onrC8KdP48aJSFlZQOZmEd2Jx4nGz9/8FG6A34JcBiqQkNb00L/d
         ofhGILynjQ/U1muGqYhA3f/9MTSbaT+0WCM+JtqTlAwyITj0db27zGnb3WDACdkbo1uF
         duTVlMkswkuBRCgOnEjfX6H+/0zAZdjcNs+6I5xzm1zbpm3m77Net8fIFEL/mUWwWaT8
         jFAvdL4RnksFKCJFB6b6kyrSgscdFwRcGggOcgYdS8rkzf3OG2NH/l1KYdY1P1nOZVzV
         bgWw==
X-Forwarded-Encrypted: i=1; AKwUvBy23IbOqBdVkySfwbxF61uF2IsCEx61AeNbzgnC0EplSLRNAsFcDGawUxRyYH9ydy392YAB6ovvvtCctW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgPV4XWfgfAC3SD4CQAp7oMmz8w4wM70qN3sl2pgf97FGS0GYP
	5PD3El65/ue/7aqNJ1QJ4xl4mFmLNeFJnC5sH8/WXBc4rJnDiD8fLZ5O
X-Gm-Gg: AYBFou2IpTTf7beWqXwWoruI3fV9TGUpHHMwOdVwnNU8GFQlsm9KGUX/Mkm492AYGGT
	177nSN5zgxUVq8yCn3Euq7RDSRIOCaJCGE9z8wYrEgBnSwtVfeFJ/nShTswwGksVugvFLLl+Sj0
	WNIBOR4EECS3SiCwMnUXJilk7PrsXVL8VI5UzkgLnfzXIvemd1QC/UmRYjDpvtnzs5GNBIi7Dle
	sNlADVzwQ/A4l802f9ogtgMYDYuW7MZPaL8rzS7eCNaW3sMdIM2L01BaehsaOGfyMIHZTdgRAV+
	xmpmT3VudRwWawtMKTLVqyXDhjaKjmovg9kSpidLKhOQkfNYPkvdbT19n9IH02+xbgPo0lvEeZt
	pSEGMNeAj52CQ2NF6HGPAw/N1Auk+G8QmkR5n+2JEmuV/w95uEULLMBKLuI5HPhQSm0zCoeAX3c
	/UeRZg/W4bQmR7yYpMK7bjkybwl/d7VSHsiTAXtLRX8BlDCMoiqtoXVI2IpsjAZ59WVjpjUmLtb
	Q==
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1985b87f5mr174078275e9.4.1791981601878;
        Wed, 14 Oct 2026 05:40:01 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm54163165e9.1.2026.10.14.05.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:40:01 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v4 2/7] vxlan: vnifilter: reject VNIs outside the 24-bit space
Date: Wed, 14 Oct 2026 15:38:09 +0300
Message-ID: <20261014123814.388557-3-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014123814.388557-1-alishmery18@gmail.com>
References: <20261014123814.388557-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VXLAN_VNIFILTER_ENTRY_START and VXLAN_VNIFILTER_ENTRY_END are bare
NLA_U32, so neither is bounded before vxlan_process_vni_filter() hands
them to vxlan_vni_add_del():

	int v, err = 0;
	...
	for (v = start_vni; v <= end_vni; v++)

v is int and end_vni is __u32, so the comparison is done unsigned. A
request carrying only START=0xffffffff has vni_start == vni_end ==
0xffffffff and looks like a single VNI; v is then -1, the comparison
promotes it to 0xffffffff and passes, v++ makes v 0, and the loop walks
the space upwards from there, creating a VNI node and a per-CPU stats
block per iteration under rtnl_lock. Any range ending at 0xffffffff
behaves the same way.

Separately, a VNI at or above VXLAN_N_VID is accepted and stored even
though the VXLAN header carries only 24 bits: vxlan_vni_field() shifts
without masking, so such an entry keeps its own rhashtable slot while
being truncated on the wire.

Range-validate both attributes against the 24-bit space, as vxlan_mdb.c
already does for its own VNI attributes. With the nest now linked to
this policy, an out-of-range endpoint is rejected during netlink policy
validation, before vxlan_process_vni_filter() runs and before anything
is allocated. How many VNIs a single in-range request may span is a
separate question, bounded by the next patch; that limit is not a policy
check and does run in the handler.

Make the loop counter u32 as well. With the range bounded it is no
longer what keeps the loop finite, but it drops the undefined signed
overflow past INT_MAX and matches the u32 vni that vxlan_vni_add() and
vxlan_vni_del() already take.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v4: no functional change; rebased onto net-next.

 drivers/net/vxlan/vxlan_vnifilter.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 124ba47758e9..9e15f4de75c9 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -491,9 +491,15 @@ static int vxlan_vnifilter_dump(struct sk_buff *skb, struct netlink_callback *cb
 	return err;
 }
 
+static const struct netlink_range_validation vni_filter_vni_range = {
+	.max = VXLAN_N_VID - 1,
+};
+
 static const struct nla_policy vni_filter_entry_policy[VXLAN_VNIFILTER_ENTRY_MAX + 1] = {
-	[VXLAN_VNIFILTER_ENTRY_START] = { .type = NLA_U32 },
-	[VXLAN_VNIFILTER_ENTRY_END] = { .type = NLA_U32 },
+	[VXLAN_VNIFILTER_ENTRY_START] = NLA_POLICY_FULL_RANGE(NLA_U32,
+							      &vni_filter_vni_range),
+	[VXLAN_VNIFILTER_ENTRY_END] = NLA_POLICY_FULL_RANGE(NLA_U32,
+							    &vni_filter_vni_range),
 	[VXLAN_VNIFILTER_ENTRY_GROUP]	= NLA_POLICY_EXACT_LEN(sizeof_field(struct iphdr, daddr)),
 	[VXLAN_VNIFILTER_ENTRY_GROUP6]	= NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
 };
@@ -914,7 +920,8 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
 			     int cmd, struct netlink_ext_ack *extack)
 {
 	struct vxlan_vni_group *vg;
-	int v, err = 0;
+	int err = 0;
+	u32 v;
 
 	vg = rtnl_dereference(vxlan->vnigrp);
 
-- 
2.53.0

