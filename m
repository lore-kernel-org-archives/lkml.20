Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C7A3E51F9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352792; cv=none; b=F7orUW62fBIqVAsOOZP9GDNCdEo0C6xEhx3PdDyI4tUiTYzl3lENxOSiQwT5UfssEWinWDaaT4dell9t1CdMs2URDhRHfV71n7AGQCL4hNeKn7gYZIfdVOaP1ojf3SOqEKEWwRzTydrOrUd+5F9+UOfhmuHSg9ygYBQV779tP94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352792; c=relaxed/simple;
	bh=MwBpIpYrSPFxTbkIfoUADmu1fef0nYoc+dMugb5PlAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFS/Swcxu0FXrL+EC/HAM55A43CxoGTBo9ripH3kg6MX6IJo5xWMqznipLrPuxP9u4BavhV6tIJ7aTQ8rsjSQiRGyO5YWHqYn3SV3IBcMw/nZU33hBjTrZejWeoxoq/OjBg9+6hAVP3e8CbX0QH+ThUCh/IT74KTEdcwABK/9Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQt5wOXp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQt5wOXp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1462090a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352790; x=1791957590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkYzG21Yn8djlHNaCJzAzQuNMZXAhnyVeMJo3kZ+SUo=;
        b=NQt5wOXpjN4PoBhqVjEWssTEgk9yJ22Ifc/O0WLGiJYRW0e+nB318BRulWXSmxmgDu
         nULli7hzFqlY0rVZefz+JuXMtT2NKZGjJyRyqQWnGiUuUpOKVKO/mMkvaQRsiBKUsMuJ
         9Y8pjrm8dtB0wNpquz74bUX58/ISGpaClRXGAxTiOdggaeWoL9UXrkCXlwXiQvJcmfcF
         7Gpyy0+wa92PoB0LjmJMw3cjimcLrTT5afn9aJtphpZ3HxzLSvE2UYPf8PLuwuE7TOQb
         o4shEUCiGVHRQuNBq3lRef3Qf4ADXubyGJCqgv/nVh0nnJZ3zwmWlTXZozD8qYN+Y75c
         00Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352790; x=1791957590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkYzG21Yn8djlHNaCJzAzQuNMZXAhnyVeMJo3kZ+SUo=;
        b=mISKs0swXyZ7Yj75ptxqVqxBWf6WnPRIZmOOIdHBmTgtbcc5zvqacCMdS8g9I6YWeG
         0WNKynAiA7ko3BsKq0FJmSfAeeotQ8qV0LIGlBCpCYtuqXuaIcNhs46ONcZLLJwi+msI
         fC0QooSHYxk+lOqcCUinCcZWXk5CDGvStBOgk621g2HB4McEALBen4IT82iIy3pmFasi
         4gh+rjF5dSslwdX8u2eHok0K1VZJUteqcplU/76sZelRip9mWVDvglsCEI03oK4hgk1b
         Dw5EBC/iyXQS4bhGGbeX3Ip4SaLVLSSOGzgCWwG9VVu6vHTudS47f1vQKPOIXeI0Xww6
         vxzw==
X-Forwarded-Encrypted: i=1; AKwUvBxHy2ZGxe+7Di576NnjLI7/B148bBDnu/jo317WeYEoJTYjS9pJFdAcARQXF/h8mOuZrJvPjK1dPwP5DJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+MV9txBmkMi+V0j4JhLBiJlNSbvjGuhgX2GG/UcaOiaSHvBjp
	22QQX06P+HC1z9C0Aen46HqRtzcpDj5OqjjV96mEw2HCnD8dHcpDpYi1
X-Gm-Gg: AYBFou0PR3xzrONCdYWEDrBkryGNYsCXcE2GNGREaRZsk2caJZBQCiENIVNCKbdxUYy
	3K0trdrfzltQ+XZQ19yMQtr7XdnSKw8ehMPxU2ne4pRTzTi67dln2GBkClPYybjeyav0D2BnsQN
	1cs/QsnzyN52lzobfSTDH9KoOVS/fJmzwjKW3FNb4Ds17Ph+ziNF5XmnhyK5FCx76mU4ArkEUL/
	9QKT6PjP/Ov01THos3/UIWP+S2DjRCqF1aqRR1/FWUkLfkCMY9EKOLdGdbhh0fs9ciuo56tW2yb
	/PMNYEeWz6mJXSh0CsqiOnbxWE72fLbjp3nCUe2Qd85zdIaqWgaSlWNyFK7M6yTMez181bSoEOq
	tuTb5VUO8vXOtISr+FrBpwdpUGSFfhAhwSLIwdolpwC2rJFGq8XuJrHHFfIJ2Dwe6bfQ8Jn/yVI
	Y5UhpeG6BULlhRQ/sdfXe/3dQcyuuJKOwkKiL7LXk4j/tG02yXzEmPb30446pw7ZhpgwzWfK5n2
	+upCkl9/h7+HBNhHBG8x8Gb8gk=
X-Received: by 2002:a17:90b:3949:b0:3a0:b12f:b51b with SMTP id 98e67ed59e1d1-3a854636ecbmr3123635a91.40.1791352789882;
        Tue, 06 Oct 2026 22:59:49 -0700 (PDT)
Received: from kfuzz ([202.120.234.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8b0616esm884856a12.6.2026.10.06.22.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:59:49 -0700 (PDT)
From: Yiming Qian <yimingqian591@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yiming Qian <yimingqian591@gmail.com>
Subject: [PATCH net] net: bridge: don't under-estimate the VLAN tunnel info size
Date: Wed,  7 Oct 2026 05:59:37 +0000
Message-ID: <20261007055939.63100-1-yimingqian591@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

br_info_notify() sizes the notification skb with br_nlmsg_size() and then
fills it with br_fill_ifinfo().  If the fill does not fit, br_info_notify()
does WARN_ON(err == -EMSGSIZE) because that is supposed to mean a bug in
br_nlmsg_size().

br_nlmsg_size() (via br_get_link_af_size_filtered() and
br_get_vlan_tunnel_info_size()) only accounts for the VLANs that have a
tunnel mapping at that moment, while br_fill_vlan_tunnel_info() emits an
attribute for every VLAN that has one by the time it runs.  br_info_notify()
also runs without RTNL (e.g. from br_forward_delay_timer_expired()), so
tunnel mappings added or removed under RTNL between the size calculation and
the fill make the fill need more room than was reserved:

  WARNING: net/bridge/br_netlink.c:660 at br_info_notify+0x13f/0x150
  ...
  Call Trace:
   <IRQ>
   br_forward_delay_timer_expired+0x1b3/0x1f0
   call_timer_fn+0x2d/0xd0
   __run_timer_base+0x5ba/0x7d0
   run_timer_softirq+0x31/0x60
   handle_softirqs+0x17f/0x570
  ...
  Kernel panic - not syncing: kernel: panic_on_warn set ...

Size the tunnel info for the maximum number of attributes that
br_fill_vlan_tunnel_info() can emit for the VLAN group instead of for the
mappings that are currently installed.  Consecutive VIDs with consecutive
tunnel IDs are compressed into two attributes, so the fill never emits more
attributes than there are usable VLANs, which keeps br_nlmsg_size() an upper
bound of what the fill needs.

Fixes: efa5356b0d97 ("bridge: per vlan dst_metadata netlink support")
Cc: Yiming Qian <yimingqian591@gmail.com>
Signed-off-by: Yiming Qian <yimingqian591@gmail.com>
---
 net/bridge/br_netlink_tunnel.c | 44 ++++++++++++----------------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/net/bridge/br_netlink_tunnel.c b/net/bridge/br_netlink_tunnel.c
index e7eceab5b515d..74627323711c1 100644
--- a/net/bridge/br_netlink_tunnel.c
+++ b/net/bridge/br_netlink_tunnel.c
@@ -35,39 +35,25 @@ bool vlan_tunid_inrange(const struct net_bridge_vlan *v_curr,
 	return (be32_to_cpu(tunid_curr) - be32_to_cpu(tunid_last)) == 1;
 }
 
-static int __get_num_vlan_tunnel_infos(struct net_bridge_vlan_group *vg)
+/* Upper bound of the number of IFLA_BRIDGE_VLAN_TUNNEL_INFO attributes that
+ * br_fill_vlan_tunnel_info() can emit for @vg.
+ *
+ * br_info_notify() is also called without RTNL (e.g. from the STP timers), so
+ * the set of VLANs that have a tunnel mapping can change between the size
+ * calculation done by br_nlmsg_size() and the actual fill.  Account for the
+ * maximum instead of the currently used mappings: consecutive VIDs with
+ * consecutive tunnel IDs are compressed into two attributes, so the fill never
+ * emits more attributes than there are usable VLANs in the group.
+ */
+static int __get_max_num_vlan_tunnel_infos(struct net_bridge_vlan_group *vg)
 {
-	struct net_bridge_vlan *v, *vtbegin = NULL, *vtend = NULL;
+	struct net_bridge_vlan *v;
 	int num_tinfos = 0;
 
-	/* Count number of vlan infos */
 	list_for_each_entry_rcu(v, &vg->vlan_list, vlist) {
 		/* only a context, bridge vlan not activated */
-		if (!br_vlan_should_use(v) || !v->tinfo.tunnel_id)
-			continue;
-
-		if (!vtbegin) {
-			goto initvars;
-		} else if ((v->vid - vtend->vid) == 1 &&
-			   vlan_tunid_inrange(v, vtend)) {
-			vtend = v;
-			continue;
-		} else {
-			if ((vtend->vid - vtbegin->vid) > 0)
-				num_tinfos += 2;
-			else
-				num_tinfos += 1;
-		}
-initvars:
-		vtbegin = v;
-		vtend = v;
-	}
-
-	if (vtbegin && vtend) {
-		if ((vtend->vid - vtbegin->vid) > 0)
-			num_tinfos += 2;
-		else
-			num_tinfos += 1;
+		if (br_vlan_should_use(v))
+			num_tinfos++;
 	}
 
 	return num_tinfos;
@@ -81,7 +67,7 @@ int br_get_vlan_tunnel_info_size(struct net_bridge_vlan_group *vg)
 		return 0;
 
 	rcu_read_lock();
-	num_tinfos = __get_num_vlan_tunnel_infos(vg);
+	num_tinfos = __get_max_num_vlan_tunnel_infos(vg);
 	rcu_read_unlock();
 
 	return num_tinfos * __get_vlan_tinfo_size();
-- 
2.34.1

