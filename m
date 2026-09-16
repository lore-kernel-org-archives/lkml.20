Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA6A49A3C4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587475; cv=none; b=hOlOWGuCxjHIdpJdKMtz9jSVXA+z8Op17179EtEBSnKpr/yKI1iqAMpUz3H3azyZzGMg6kH88mmAuu2r21TL04Im9op6RckBvspQu83DLpL0ngobtCjI4mR/mOoFJ1qGNr5rtRHEyaqphRyb/gCYScN+x34EmS0yqkbNJ2rpS8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587475; c=relaxed/simple;
	bh=ddPCkLG/mZMQG7Ygxj4GAeNW18W2hB6ed3Wan91fRWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AY/lTYMNmOsiob3EBnqg0L3GwTBi6PdN87BqDthupLeqi08YsRXEqot36479/F9cVkhVEFtL2dtZKqrtq1pOD6Yf9XPy7nraqSAKCmvnMAEBizPXpt4fivAnN/OXWNz3W0lX/qUXFwCvzcOEwjSC4XMNcmTDAhMjQXioiPe4ejE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ2DNBIB; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ2DNBIB"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so639275e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789587458; x=1790192258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tk+LZk++Zz9blrRTZ2t/G1JXrIPeHycnebwimkzWD3M=;
        b=TJ2DNBIBPFygk0HXRfK48t20WSD+fb8RBQBdKix/Ri5I2qjREEAnMzs8rLuW0/Z7CR
         v+8VChYmdK/A3bskV6drcvVAX/XNUTOjHcoraeW9ce9adi3FRMBHWX/YugPbtfq1MbSV
         lIfkAj/sMWmnWkhekZ/s1whtVcSfeHUwvsgYVOUiFFc45bllMhqpguBJyMjK+/HcQhbN
         /pvFFdTE6KKizrNr4/fb22eErkph6qycYk1ILKiLq/JANgnc86m5Lw87J127SwgXhW2j
         X6GnOmDBybJGBXXepsVfkjDU0RKuS9cc2YpamEvHmHMWIfEDEomv+H36Im9dBoyvk+N/
         5vEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587458; x=1790192258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tk+LZk++Zz9blrRTZ2t/G1JXrIPeHycnebwimkzWD3M=;
        b=uqMcu3CZJnm1niYAHhgHuXbGkD/vRHXCaTj1MoCaNHlElvYeS5riRZcasedaPOXPHV
         86k3rqieTyhVVSacwFk7FqE6QFCyAVdTGIEHaPx7gBs/M2sHlNX97yT/NACQlClP/Jpd
         kXaz9lkJD3xhozFD49kb3Q4UQGuN08rh67v8J1XgTSXWngYOnlzY8U7p5iUewCbHeBvK
         /HUbARdFQNe73ri3CWIxj8jEpWRkXY9pEvCwwIFKhqEmOuAuJiAVA9cGW8ATCgaTLO/U
         sKf1uUbxp9jumpT901COSVEqxRcmh3+M3F3/IG5W7D2sYfz3yvbn6rf2gf5kf67Yf/nx
         v4mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCQdCuAEzElQCmJIr61Crl3+xdlUcJUj+aSpGtsRfeyMPAY+ZnskVO77JQjcUWY0iIQnvWgVtqG3dVHGo=@vger.kernel.org
X-Gm-Message-State: AFuF++k5s9a/sHxR7O54dpt9xXEO9zi2zVpvGdyIovvUmNoBBc45rMQl
	pxYnKMccB2v7D50q8ppovJphmmzAiCkDICUvXOu+hE1z2gQCj6mvvGWS
X-Gm-Gg: AYBFou0UNZ/AxNlkzPNoVdt2mCJdqsBx2IIYLhi9GWzN2OL6HPfw8ppS33OGjW2iXtz
	Mx9X7P5+z42+nnbI+7BKjlxqu8Nl3YsQnIKSbCqHkyhQhdjVvt1bjP1jXNjqw/K95jKU0TY4NZV
	4N3HS9gPs+qg3136mInVFtrDHyUL7piNtCyhyT9+scWgRjYRgYhwE5MqKdwRZ5GEBxtLlcJxV3v
	2b2MSHbOJkW+xnnq9JnH621mpoxC4EqF4+EMSZSuyw4/myNwZ8ih5+THxbW2H6v7Y/dNk/VvLGk
	fhmOfnDpfKkddy6FwDwWHaagHYewC4B6aTKyVPDU7nWbG1+DI+CgQEcZ/TOwGnYa4hTl3hsbNc5
	WnogXZKOa4jQreGKyfBdES1Ce6lExgusEkIYa5pmA5OOa3icxJ8c6toeXaAm2XrIf8PabT4GzDL
	2xDXJKjyqFV7zkGS1hpuJuke/HwLYppKq3Ag8wb9aE364UNdpYRtp3KR0LpA8xYiY=
X-Received: by 2002:a05:600c:8b30:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49eb72fd676mr47695055e9.14.1789587457746;
        Wed, 16 Sep 2026 12:37:37 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm12936105e9.13.2026.09.16.12.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:37:37 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v2 1/5] vxlan: vnifilter: reject VNIs outside the 24-bit space
Date: Wed, 16 Sep 2026 22:34:45 +0300
Message-ID: <20260916193449.2552039-2-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916193449.2552039-1-alishmery18@gmail.com>
References: <20260916193449.2552039-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VXLAN_VNIFILTER_ENTRY_START and VXLAN_VNIFILTER_ENTRY_END are declared as
bare NLA_U32, so neither is bounded before vxlan_process_vni_filter()
hands them to vxlan_vni_add_del():

	int v, err = 0;
	...
	for (v = start_vni; v <= end_vni; v++) {

v is int and end_vni is __u32, so the comparison is done unsigned. A
request carrying only START=0xffffffff gives vni_start == vni_end ==
0xffffffff, which looks like a single-VNI request. v is then -1,
"v <= end_vni" converts it to 0xffffffff and passes, v++ makes v 0, and
the loop walks the whole space upwards from there, allocating a VNI node
and a per-CPU stats block per iteration under rtnl_lock. Any range
ending at 0xffffffff behaves the same way, including narrow ones such as
START=0xfffff001 END=0xffffffff.

Separately, a VNI at or above VXLAN_N_VID is accepted and stored even
though the VXLAN header carries only 24 bits: vxlan_vni_field() shifts
without masking, so such an entry occupies its own rhashtable slot while
being truncated on the wire.

Range-validate both attributes against the 24-bit VNI space, which is
what vxlan_mdb.c already does for its own VNI attributes. The request is
then rejected during netlink policy validation, before
vxlan_process_vni_filter() is reached, and nothing is allocated. Make
the loop counter u32 while touching this: that is not what terminates
the loop, the policy check is, but it removes the signed overflow past
INT_MAX and matches the u32 vni parameter vxlan_vni_add() already takes.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v1: https://lore.kernel.org/netdev/20260909092645.3105263-1-alishmery18@gmail.com/
 drivers/net/vxlan/vxlan_vnifilter.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index dd94085e0886..5aaaaeee8110 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -459,9 +459,15 @@ static int vxlan_vnifilter_dump(struct sk_buff *skb, struct netlink_callback *cb
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
@@ -814,7 +820,8 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
 			     int cmd, struct netlink_ext_ack *extack)
 {
 	struct vxlan_vni_group *vg;
-	int v, err = 0;
+	int err = 0;
+	u32 v;
 
 	vg = rtnl_dereference(vxlan->vnigrp);
 
-- 
2.53.0

