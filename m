Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0066230EF6C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791175116; cv=none; b=NZPf8t6RzkFDMLa4m2PrxjoW2kMSGzRVggsmSASQ3DnYx/+r62Q5TbTE/hVnXUil3WsvtP2EnmNwUUTphw0EypGafCYkIg8Ybg9G9F9VNQ7kXcHK3Plld/kFAScvjWarqVapcXpSjyd9JT2FACs+24D/yKz0X9ycqnfZMR6IVPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791175116; c=relaxed/simple;
	bh=WL8BkZfBmynsOQljiOg3YEkZaeHg1x9r1zprVn1fyHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHsShLcuSsscwNLhSrOcWKYW3se7oP6G+j3Zo4NI/Cofc14IYUMhT7PRECxtXx4Eg3k5sFYhI5CoygQbNS/3OqFyORX98TvdulakCJqXSwRW0ZoUJoDsQeHdJtNi4jh9NqnI8mpRCIkwoC/tZ8brxk30KmEypaMVsHdam2QnyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqdtzLZN; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqdtzLZN"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35120d43ecaso1724465eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791175113; x=1791779913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQ+LmaGpGiijcsTJ1qk0sHsM2h6jT0RkKgmxLE6xfsI=;
        b=EqdtzLZNWWNB/Kz2IcwjtKAiCxceRXYTFRlUuO03JLAmdMl29y7t4NJT6M3EMJeiGq
         jrrch8dQzE4wdvwKHJyoiilxGUjyfKdJyf6hvLW2akhFrcinxaJw5ChxBXVg7k8TZNMA
         hDWFdAzylSGKe38p5S65J3GyEWtGt+1svx5f1a77Am4jrQ0AW5QqNdDz6elC9n1FDbrI
         vL8HHx2uAnAqJYYqExQeKjD+mlD2vwshjifS/lUSCreYxKkD1YHK5++snrRzCQk7LJ9q
         +7Itk8+ERiiPN5lRubVwM0F//Vd5NwSrAYRc0mxjJC7WBpDlHFWbjLGVUmhVsulSBYpo
         +YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791175113; x=1791779913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQ+LmaGpGiijcsTJ1qk0sHsM2h6jT0RkKgmxLE6xfsI=;
        b=lN33tIKR61cu/9N9ZmYe4uI/50KZVa0slwdw0eQ/l1XDpUGD5idy6WmJB8OhbtQQcF
         lE/TKQ0dxiu/ds4XB6FYyz+orni1KsDl/RTk4pQ2cD5r29kjft1merUCi3PDCeGur+PY
         zpI/5XtwEvwOBXT/4A4MKp1Y0qyJXwiUT5BPYlqR5T5Ix2rK6YqnDR12rCyKopUWS7J8
         WpyKMkQq2mqIAzFDANojOs/eHSlBUHPRKvoobdgv117zxJAuoD3k+UQiXUjJmco9DEaj
         v1thFDNLlgdR5BjGAfW751IXQVPepaoljyg+MmkUXCt6swl6FV5cUW8SgiJZmTMScqqC
         MuxA==
X-Forwarded-Encrypted: i=1; AKwUvBz8ZwcYhDIXHXhSGJn4Ym+IpSrDrAuEw7TtnpJXdMsIvZuVBbA9wREeCctkHc/IiIXvn6AwJn9WIkHDp4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3KVSZUj888Y2+rhVK1/5p3DiYaTwbx1ngr8+TkO2qJLJ24EiB
	jtln1E38/4y9IVJB8Z95nnnq3SjdGHvRpLSMjjod5m/G21/cQ8l6lGTp
X-Gm-Gg: AYBFou0FxDnlyN0ANAKMHP9ty27xcK2tuQpA6MaNJtw55zis0d4yl91A3SyKD5Z0e6u
	Kzb60wh5uouQmPRhvajVYIzRbTBQcdddHQuXUR6vcIRDSYJb70vnL9fntQMCqyMMacQzE4ZKMqL
	e5tjlcAFaUcGZX82as1iL73KDN8rQf0nEfES8u2kriwln+yNAss3jX3idqUA+8kz4Ms8xz8xw+L
	+NigfKo0W3Lp5327UqXAJkLTrMWiC6kyJMiKilTktwlyFJYxEeL/Tjjkbzo6ecIRpu8JCHmDZ4z
	oWDxwBxtVzNfFRdHv8ztMyG7+qlcX24ZQYsfbuxT+sMlAABj4hR0L08+upP8dbsvebvR3vVZ7zh
	cNsEdJOYheA6W7O5k/nP14nwu0SkiVLpuaam8r75FN7WJwlNgm5Cp+jWxiLqYx7yxxsr9mj6W1b
	oSqB4TV3Fb6Zl8BUpDaifELtEiOvFdbh/mmu7cqSOiGt4o1WFKIwG5PHzX1JmIuqxPq96yxXAMh
	hyKQrpT9lbAQkpOF40=
X-Received: by 2002:a05:7301:182e:b0:345:84eb:7153 with SMTP id 5a478bee46e88-351113bfd63mr8233346eec.11.1791175112963;
        Sun, 04 Oct 2026 21:38:32 -0700 (PDT)
Received: from vscode-11-19.w453y.xyz ([59.164.88.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127136b8esm9518581eec.6.2026.10.04.21.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:38:32 -0700 (PDT)
From: Abdul Wasey <w453y.me@gmail.com>
To: netdev@vger.kernel.org
Cc: razor@blackwall.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	horatiu.vultur@microchip.com,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/3] net: bridge: cfm: count CFM config attributes in the link message size
Date: Mon,  5 Oct 2026 04:38:20 +0000
Message-ID: <20261005043822.3106580-2-w453y.me@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005043822.3106580-1-w453y.me@gmail.com>
References: <20261005043822.3106580-1-w453y.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

br_get_link_af_size_filtered() only counts the CFM attributes when
RTEXT_FILTER_CFM_STATUS is set. With RTEXT_FILTER_CFM_CONFIG alone it
returns before counting anything, while br_fill_ifinfo() still writes
the whole config, about 250 bytes per MEP and 20 per peer MEP.

Dumps cope with that, they just get a bigger buffer. A message built by
br_info_notify() can't, it fails with -EMSGSIZE and hits the WARN_ON
there. No notification asks for the CFM config today, but the next
patch adds one.

Count the config attributes when RTEXT_FILTER_CFM_CONFIG is set.

Signed-off-by: Abdul Wasey <w453y.me@gmail.com>
---
 net/bridge/br_netlink.c | 42 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
index f65b8b6ca..5160e801d 100644
--- a/net/bridge/br_netlink.c
+++ b/net/bridge/br_netlink.c
@@ -90,6 +90,36 @@ static int br_get_num_vlan_infos(struct net_bridge_vlan_group *vg,
 	return num_vlans;
 }
 
+static size_t br_cfm_config_info_size(u32 num_meps, u32 num_peer_meps)
+{
+	size_t mep_sz, peer_sz;
+
+	/* IFLA_BRIDGE_CFM_MEP_CREATE_INFO: instance, domain, direction,
+	 * ifindex
+	 */
+	mep_sz = nla_total_size(4 * nla_total_size(sizeof(u32)));
+	/* IFLA_BRIDGE_CFM_MEP_CONFIG_INFO: instance, unicast mac, mdlevel,
+	 * mepid
+	 */
+	mep_sz += nla_total_size(3 * nla_total_size(sizeof(u32)) +
+				 nla_total_size(ETH_ALEN));
+	/* IFLA_BRIDGE_CFM_CC_CONFIG_INFO: instance, enable, interval, maid */
+	mep_sz += nla_total_size(3 * nla_total_size(sizeof(u32)) +
+				 nla_total_size(CFM_MAID_LENGTH));
+	/* IFLA_BRIDGE_CFM_CC_RDI_INFO: instance, rdi */
+	mep_sz += nla_total_size(2 * nla_total_size(sizeof(u32)));
+	/* IFLA_BRIDGE_CFM_CC_CCM_TX_INFO: instance, dmac, seq no update,
+	 * period, if tlv, if tlv value, port tlv, port tlv value
+	 */
+	mep_sz += nla_total_size(5 * nla_total_size(sizeof(u32)) +
+				 nla_total_size(ETH_ALEN) +
+				 2 * nla_total_size(sizeof(u8)));
+	/* IFLA_BRIDGE_CFM_CC_PEER_MEP_INFO: instance, peer mepid */
+	peer_sz = nla_total_size(2 * nla_total_size(sizeof(u32)));
+
+	return num_meps * mep_sz + num_peer_meps * peer_sz;
+}
+
 static size_t br_get_link_af_size_filtered(const struct net_device *dev,
 					   u32 filter_mask)
 {
@@ -122,17 +152,25 @@ static size_t br_get_link_af_size_filtered(const struct net_device *dev,
 	if (p && vg && (filter_mask & RTEXT_FILTER_MST))
 		vinfo_sz += br_mst_info_size(vg);
 
-	if (!(filter_mask & RTEXT_FILTER_CFM_STATUS))
+	if (!(filter_mask & (RTEXT_FILTER_CFM_CONFIG | RTEXT_FILTER_CFM_STATUS)))
 		return vinfo_sz;
 
 	if (!br)
 		return vinfo_sz;
 
-	/* CFM status info must be added */
 	br_cfm_mep_count(br, &num_cfm_mep_infos);
 	br_cfm_peer_mep_count(br, &num_cfm_peer_mep_infos);
 
 	vinfo_sz += nla_total_size(0);	/* IFLA_BRIDGE_CFM */
+
+	if (filter_mask & RTEXT_FILTER_CFM_CONFIG)
+		vinfo_sz += br_cfm_config_info_size(num_cfm_mep_infos,
+						    num_cfm_peer_mep_infos);
+
+	if (!(filter_mask & RTEXT_FILTER_CFM_STATUS))
+		return vinfo_sz;
+
+	/* CFM status info must be added */
 	/* For each status struct the MEP instance (u32) is added */
 	/* MEP instance (u32) + br_cfm_mep_status */
 	vinfo_sz += num_cfm_mep_infos *
-- 
2.53.0

