Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4A3DD84F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946053; cv=none; b=IxWXZDdmkFxDn/t+pQIy9aF8UDNqcOiwf8I5VNygQhqnnSKKVMKoi1FOgH7tk0fr+sBtXhV3M7ltUJ70lW1yifzXqj2dnnBZcys1OTuQRBqlcsPckLHcxqs2ZYfl8y/iOZJwhDZ8GASaXAY/y0LdMX+CSUinn6l49iItCpJ/LLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946053; c=relaxed/simple;
	bh=opb3piTKdPfw2gKO3g3oDpNDNotYQET8m8wmTdkj+Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGq21tB2ePUEyqCHCNWP+18/zfc/hJERNZGHcKi51pWe0ZWFquf95pJUCXgMuFDTMdc7tZHo+sYopVgrWNsdzgIksK2N14k61/mirrFiTBVZ/C8eAVldwAtONgLlfCyko8CaWrBicknWBIKAjvi1hhAVe4InSfxp5B7S7LN7moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WscwqcrX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WscwqcrX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482ea739de2so3861110f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946048; x=1789550848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tn5iao8ktJWUmrSNE1xw9a8qj82WjCSpUTURoE0uN4c=;
        b=WscwqcrX+24QmnAh5cBIlTV7sZvnkdwUmhhQ47jHS5J9HPr4XK9tOxS5/Z/RAkktRn
         RZpc9r3DInqH3+E2OWCLlLFCc1MVpnFlUHUAFJHTRg06pyNp7s2VR5zSwmKzdxkmYAor
         W7n9Zs309x2w48K8t7XF/Lnz/SDhSGLXy+WcQtK1Ng+iealt/EuLS+9d3oWvcDQfAu/6
         NgMr+/rN47SrG/HTw0i2erx0wbGdkOGQ1jfgKLDyOZ8SDAtequ2aMKFg1YUc9TqxoIwU
         iYX0fuiFByRkqj2PmnMnNv3mnlVjFGqc0Eo9mP6fmqY5Sxt03P8gm24UfsmJDsI5gO2U
         7zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946048; x=1789550848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tn5iao8ktJWUmrSNE1xw9a8qj82WjCSpUTURoE0uN4c=;
        b=UIpoDqva6+YnG2XEfOsCeNRujO3GlhLDB52WrJ4Pxdd3kZ0Z4lh5lxykQJoWPPRpHs
         ru4cNzag/hRkNZtanEo8dpGy/fV7u/PM6zX9ysT75183QXh16bw2jh9DOfDVGmg3w1Ul
         EgKIsQoiXq87E/CBDJyjw3sz3YRs2Nu+41rwqHiikv7HpH2QSzC7pBbyDaDfHrPymVma
         j2w2CWLCe+VyEUIqcMwCp1NaaXiVBsuq49Xw0Bsk/3PzktwiYpS8Ax5vNUCXvHvd2KzC
         vkmZO0beRwjc56HNHJGPeB3vXNXblsYtoUQGXapPuQvjMgGl1FLr8bHIdXx8Ld+i961q
         rSrA==
X-Forwarded-Encrypted: i=1; AKwUvBwHZwhawqHVggh0hWBejETyrYlo5g9lkZUcL8OrjO8PT/lSa/bUvImP7viF46iK84xsBIXUw7WZjU43jGs=@vger.kernel.org
X-Gm-Message-State: AFuF++luvXhbB1h4v9CNXWQUmdBUkm4CWJfJoK3Lt7Rn4AT8fvfk8CNA
	CPIBs60n7z/9wsREOoSy8vm/iiHZBG52BwdfBPX6sbB0Kj3tQwp6OA5a
X-Gm-Gg: AYBFou3sFKyON+gSeHjXCOV0TbxhXkTIQl4zJgK7RHw09oU+nBnWU4FSHzdT0itMWeE
	M63dv0d8lQQS2DR18IP7DV6DZsNa68SjvBG+2d7eASTJ4//Q9e16fgryylSfRi5GA55iUvo/Thl
	c/ErFKpcXSMnldlCOVoLKjnserpbyMib9kQXkZO28/X1fpq2IbrQXFxBxHn77AOtpG99C1ir9Jd
	JnkKxc0jUPXmi/k+IS0fJbnlCYP1XTBAMFuxoVpQ9gt4o3NvlEgpgWrYiN6I69klpuQsw15/7HL
	NL7WCLRKraBJ58cIaWEVGSJNrkKOVD0guo0bE+m8mwN3/6Nb53+OJVH5ldypTSVri6p4kHgdZ2q
	K3C//8dLLRlbkvVDQ2nbmVyukba8txl3MeJf34u2gdfx/poPi7TopOTETzt8COC3+hj5jJeJr9s
	/Zy78t4Th1eE0N9gXqjfrsJJFChvtNg0FCksOeW/9CYARM71CVUfxE776WTa8gk5smZhQSzmahZ
	iovSt/663L/8KysL9YkfHLe
X-Received: by 2002:a05:6000:38c:b0:484:3fce:6ad2 with SMTP id ffacd0b85a97d-485872cd602mr38412091f8f.15.1788946047859;
        Wed, 09 Sep 2026 02:27:27 -0700 (PDT)
Received: from kali ([169.224.126.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm41558442f8f.23.2026.09.09.02.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:27:27 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	roopa@nvidia.com,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net 1/3] vxlan: vnifilter: limit the VNI range of a single request
Date: Wed,  9 Sep 2026 12:26:43 +0300
Message-ID: <20260909092645.3105263-2-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909092645.3105263-1-alishmery18@gmail.com>
References: <20260907141001.GA708129@shredder>
 <20260909092645.3105263-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VXLAN_VNIFILTER_ENTRY_START and VXLAN_VNIFILTER_ENTRY_END are parsed
without any bound on how far apart they are, so a single RTM_NEWTUNNEL
message can ask for the whole 24-bit VNI space. vxlan_vni_add_del() then
loops over that span creating one VNI node and one per-CPU stats block
per iteration, all under rtnl_lock.

Two things follow from that, both reachable by an unprivileged user in a
user+network namespace, since adding VNIs only requires CAP_NET_ADMIN in
the network namespace's user namespace:

  - the allocation is unbounded. Each VNI costs 128 bytes of slab plus
    64 bytes per possible CPU, so a full in-range request costs roughly
    2.1 GiB + 1 GiB per possible CPU. Measured in a QEMU guest on 2, 4
    and 8 CPU configurations, every one of them ends in a global OOM
    with the allocating task in vxlan_vnifilter_process(). No errno is
    returned because the calling process is itself OOM-killed, and the
    OOM killer also killed unrelated root-owned processes.

  - rtnl_lock is held for the entire loop. rtnl is global rather than
    per-netns, so unrelated network configuration blocks everywhere for
    as long as the request runs. Measured with a plain "ip link add
    dummy0 type dummy" in a different network namespace: it takes 0.011
    s normally, 4.472 s while a 1,000,000 VNI request runs, and during a
    full-range request it never completes at all.

Cap the span of one request at 4096 VNIs. The limit is on a single
request, not on how many VNIs a device may hold: a device can still be
populated with the whole VNI space, it just takes more than one message.
The value follows from how the interface is used in practice, on bridged
VXLAN devices where the VNI is derived from the VLAN and so cannot
exceed the 4094 usable VLAN IDs.

The limit is written as a driver-local constant rather than reusing
VLAN_N_VID. The two numbers coincide today, but a bound on a VXLAN
netlink request is not a count of VLAN IDs, and tying them together
would make a change to one silently change the other.

The check sits in vxlan_process_vni_filter(), where the span is known
and before any VNI is created, so it rejects the request before any work
is done. Both RTM_NEWTUNNEL and RTM_DELTUNNEL reach vxlan_vni_add_del()
through this one function, so a single check covers add and delete.

The span is inclusive, so START=0 END=4095 is 4096 VNIs and is accepted,
while START=0 END=4096 is 4097 and is rejected. A request carrying only
END has START default to 0 and is bounded the same way. A start above
the end selects no VNI at all and is deliberately left behaving as it
does today, rather than being turned into an error by unsigned
wraparound.

Fixes: f9c4bb0b245c ("vxlan: vni filtering support on collect metadata device")
Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
 drivers/net/vxlan/vxlan_vnifilter.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index dd94085e0886..f18ce0e1e741 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -17,6 +17,14 @@
 
 #include "vxlan_private.h"
 
+/* Maximum number of VNIs a single RTM_NEWTUNNEL or RTM_DELTUNNEL request may
+ * span.  VNI filtering is mainly used on bridged VXLAN devices where the VNI
+ * is derived from the VLAN, so a span wider than the VLAN ID space has no
+ * practical use, while an unbounded span lets one netlink message create up
+ * to 2^24 VNIs under rtnl_lock.
+ */
+#define VXLAN_VNI_FILTER_RANGE_MAX	4096
+
 static inline int vxlan_vni_cmp(struct rhashtable_compare_arg *arg,
 				const void *ptr)
 {
@@ -869,6 +877,17 @@ static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
 		return -EINVAL;
 	}
 
+	/* Only bound a well-formed range; a start above the end selects no
+	 * VNI at all and is left behaving as before.
+	 */
+	if (vni_end >= vni_start &&
+	    vni_end - vni_start >= VXLAN_VNI_FILTER_RANGE_MAX) {
+		NL_SET_ERR_MSG_ATTR_FMT(extack, nlvnifilter,
+					"VNI range spans more than %u VNIs",
+					VXLAN_VNI_FILTER_RANGE_MAX);
+		return -EINVAL;
+	}
+
 	if (vattrs[VXLAN_VNIFILTER_ENTRY_GROUP]) {
 		group.sin.sin_addr.s_addr =
 			nla_get_in_addr(vattrs[VXLAN_VNIFILTER_ENTRY_GROUP]);
-- 
2.53.0

