Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694536;
	b=T/cFKBricJL3K5fgVDgQRPEdp2r8s7QnbTMksEYbCK/Hkqe7zztBWsBIiYdIW7MGDnIw
	 VOGBoj6xoCG21tZrZ9bwGqh1aOFchqQCCtLS/31XqrZe/7rWYs1d67bTNHGHLliuna28X
	 0MtvhNDnQE61feDGa3f1Ldp6QPp5e5e4e/vleh1VkvI+/dt8fWk2M31lcupcj6VXFHFI/
	 WwfA0Mu+NfKYw6iZxFYAztTlUMsLMrNrRRjfQjPdHJLHVmxgqq/A27ky91g5iK3KIKbBh
	 BX2SgJt5L0POHjlaF/73VkEQ20MF8sfrcFy7u28A4qUii00yLWMOROSIw8dVzbXO+lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sFCil6/GykmHC8UZ+eSxB0rc3OAECvi79g/NHfkD1vc=;
	b=B29MjLfWFazORoG3tk2cqnfZnZYDNEaqXPrMz+FAyHYnho5dVwzjvcD78eCRXNh+RbEL
	 wPE6GVVZgrBRTsnSTpyngmSc/wPS4Z6SESfbszbwuqdPzSeNQmqbduV9wKK2eUxoMSWsW
	 49T2nBXmwpxdSUAn9sBR944cZtAY6Oi7m9MzfCkG9fOmGdHok5X4iwbztNYHXHXNcweHU
	 iaofvUZO1aIx6FobBpctHqs3sCr6iOZ4l9M2HEeDxRiuCO/nQNpJINtQr0RmCrTK+krwa
	 mIGZBf3xUta/iV12iu9Mz9E6B/7pRAhe5DsyP5e6IfxQn30cyUZJvC3PqsRM40eq8Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdIQm6En;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD81B606A890
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD81B606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdIQm6En
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so159735e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694534; x=1795299334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFCil6/GykmHC8UZ+eSxB0rc3OAECvi79g/NHfkD1vc=;
        b=kdIQm6Eno9IUfOMTOu8gndMuAs02BU2lSZB4SE1JJ0QophMAJF6Yowsx7p9Y+QlcCg
         kMrrQGfi4vH14yn/H1RziG363GHfFRfvBlYINIPtTn77YUvMeaIJHQzYNTj5X4lXHs+7
         QB5lCvQzeV90uRiDrejM1eBiaj9RpG1f/isUqLYfZFjUjyl2zTwbu3OHOZxFuToEd8U+
         WQATOqMZ4EkHyoTBM9ToJI+cPYR9YnGtDjORBdsQtJ/ImXUhX0tgmydJZgR4d8HcF77e
         6gGlAQBcZq3flcLXg9kCgc2wGaBk5kMywdelpvB5afNYq6QdtIIulbsk0dp+LIb1S3J2
         gxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694534; x=1795299334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFCil6/GykmHC8UZ+eSxB0rc3OAECvi79g/NHfkD1vc=;
        b=DNXZwmZNivK6+0daA0nJXOoUArFr04m+CHPs401/xuhVPeAnferdWX4+TfETXKWfK4
         3ch0Q7gppXdzYQFvH2aLEi+4w4mx/tUe1uviKBVWFGf6Mqfnu8P0fPy1rz8QOekjE8F5
         kGDzvPwaD+vi/9JKRAnAmMd1O+MrIWV6xZE64Y8QConbgWCUF9LEZom4jzW9Ox9VZRPU
         wkMJFN5q/JC5EfDl4ipy8A+lZfDBdnYYowoAMi2y93BnjfPFiVEUG8mvNoM0WCYH8Q0A
         fe5l9aF6rjyqfzC3pUUgGPmE4ENI4TsyUI0j29qPNRejrrP71wmEXnX+5DqkxM5JXVNu
         71fA==
X-Forwarded-Encrypted: i=1; AL+hErGHgq65UeLocQXomRjN2gQBkacTdGLGNMfhKTZO4nRzHd3DuGjoo3P17PCQgqvfSZBqo83Ijmw+x4sB988=@vger.kernel.org
X-Gm-Message-State: APuU4Z/76jZCfHF1f/JSQN2yEnqY0t9hNk3zyimret+1J5oDTKyaD6s5
	dmd1Pl47uqYVZWB+W2lZ3F1X5dkCtwbQ3PNugLpiWF5PJmPh4fLxgU4+
X-Gm-Gg: AYBFou2OdlTv3GQ8Jqg5uAU5oilXVtb6pEJ6lL595ludQwFsw4+eexu9N954pjRPy8D
	lnrHGJXf2b9kok0M/sblsdNn8w4IetQYMLFPAQMLmBtQDAFw/k6MkOhEcNtIXr4QwHCiR8WJWuV
	bavbT01Yd+4rD/Y58UbMV5xIGdoA0z1AKnNivrqfgtGB1aKcOXzjWuRigpON8lEAKKSxj999M6g
	sOmvaBz14lZQwKQuoep3zL8tYMWWFq9nTwmBhHaAyKNQ3e00+HgRRhobth/VOzqRRQv36/I4LQj
	5ic9uwXHq/eQ+4olRVCdi55a09uCrDqk/kiw1bx466/ztkuYoREWahW+XitpHtr8sBpxAo5BtW+
	PfonqFI5fAXVmN2w4KpGH5s7YeJhM05tyMNvItm+Y5JhqnZbM/7/K0yvyilW1/y8cSCaeiARTlY
	hfKoZ+0UNAKoVHKB2aHj5aQLCkJjor+lkZGQqWSy0UW43K4WETX7ZM+J+GlZKrJamMr3dXfRCj0
	/GAgO3yjAOje3KrVREXO9t4dFPbMok98CyeE8BHWx7N5xWyaW/00Y5zi3cVQbpnMdsm8TQ0fkuq
	wL63kwfZRbnWSOCYDobkLDTmW8/YEMDrh21XgPm/djUZEg==
X-Received: by 2002:a05:600c:3e19:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb665f8108mr45213385e9.10.1794694534138;
        Sat, 14 Nov 2026 14:15:34 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:33 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 1/8] vxlan: vnifilter: reject VNIs outside the 24-bit space
Date: Sun, 15 Nov 2026 01:14:05 +0300
Message-ID: <20261114221412.255825-2-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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
already does for its own VNI attributes. Since commit 599d0e97610f
("vxlan: vnifilter: validate the VXLAN_VNIFILTER_ENTRY nest") linked the
nest to this policy, an out-of-range endpoint is rejected during netlink
policy validation, before vxlan_process_vni_filter() runs and before
anything is allocated. Without that commit the range would be checked
one entry at a time, by the nla_parse_nested() in
vxlan_process_vni_filter(), after the earlier entries of the message had
been applied. How many VNIs a single in-range request may span is a
separate question, bounded later in this series by "vxlan: vnifilter:
bound the number of VNIs one request may touch"; that limit is not a
policy check and runs in the handler.

Make the loop counter u32 as well. With the range bounded it is no
longer what keeps the loop finite, but it drops the undefined signed
overflow past INT_MAX and matches the u32 vni that vxlan_vni_add() and
vxlan_vni_del() already take.

Found by code review: vxlan_mdb.c range-checks its VNI attributes
against VXLAN_N_VID, and the vnifilter policy did not. In QEMU on
net-next (production build, 2 vCPU), VNI 16777216 is accepted and
stored, and a lone START=0xffffffff wraps the loop counter and keeps
allocating VNI nodes under rtnl_lock.

This targets net-next without a Fixes tag and is not a backport
candidate. Reviewing the earlier posting of this range check alone,
Jakub said it was either a security fix needing a stronger check or
something making things slightly better that did not deserve Fixes or
stable.

Link: https://lore.kernel.org/netdev/20260905123900.23984eda@kernel.org/
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: state the dependency on the applied nest patch, named by commit id
(Paolo and review of v3); name the cap patch by subject instead of "the
next patch"; the changelog no longer calls this "not a fix" and says how
the gap was found and what it did in QEMU (review of v4, sinfo bot);
policy lines wrapped to 80 columns; rebased. v4: no functional change;
rebased onto net-next.

 drivers/net/vxlan/vxlan_vnifilter.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 124ba47758e9..2b02f448c3e9 100644
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
+	[VXLAN_VNIFILTER_ENTRY_START] =
+		NLA_POLICY_FULL_RANGE(NLA_U32, &vni_filter_vni_range),
+	[VXLAN_VNIFILTER_ENTRY_END] =
+		NLA_POLICY_FULL_RANGE(NLA_U32, &vni_filter_vni_range),
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

