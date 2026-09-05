Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D39394793
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601188; cv=none; b=X+jqw3IYYfzxmeMMw3nNZy4ThLi3X9JDbTXzK5A0N0kuh41dZ7iFvOVVy7UrqtC0ZMNXLWUsXDik2vYd4xURsfnxoO9LPCBoEgGbeLSIsCbJn6CifawGYk01kA60hNLauErhHvTYKMtGW1sUGIbb5zDDR4wiPnI+nPXcocU+6qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601188; c=relaxed/simple;
	bh=kBH/QCChj1yZYkWRGvB6j5/KJJ0aYZ6DCFSNPgO54kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RcMdvf9bm4tGAyhREWRpsyM2jM04Gb9RYb+LBRkqoqJJmlff+ol/t/rMvm+2fpVvG2NAFK0znQZaia60nnc4+gOofq4tfttkdC76bUT+Cz4Cvn5gNF2Sk52v6iyjHzwHui5WGZWIg4EHe0OyL/2JOlrt+hwmqC10k5/H3bRQghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msJVZWqD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msJVZWqD"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d9b60c652aso23458175ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601185; x=1789205985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93uempVhJxS6adHQtJsrkPq5DG5IgTwHCn3O8Hav3LQ=;
        b=msJVZWqDxOOamlIbmvHEFUkmBFHK0FWfLKYfY3aayBItbsrfUg/z130wAvDETMm5DR
         jTCFYz4SAHdskJJimzrBjsTGPfEnXNgpA7yUxNspHoo2EEmYQtHGxsqDgYVumKAeYpBP
         zAxFN7DO9ZAuHVzbNCPt7HtWGqvIeHlNbOU4TgYKG4W6Avs5eBvExPqyV71573ElHx+4
         yYQx4MYl+y377dZP15Yayg3r6xWtbpCkI5jWeIHgfcLbGagCqMVS1N4O64Vx+iscF2sk
         HTs5JaN1P+AR1eF9Ji8kJx4zEE3+7dF8YN3DbqXvwIx4F2wRAwuNT/NG4p0FwE0o8dtA
         0itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601185; x=1789205985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93uempVhJxS6adHQtJsrkPq5DG5IgTwHCn3O8Hav3LQ=;
        b=THu41GuCWutp7ethz4OWsv0xCdOXkOxSrhS+hMRb05VjZK9OdkdP5+NhnWAEgjfox+
         RsjBMkJmmbJO0IgME1En7tXc4Dg19L8gpKFwvb8l0ZngX0ctwyo/gDoI7CiAd0+L5sRG
         JZUDuIAuguJnAeWHBzutipnlz15qteQvPbR2EYK5Q09BcIcv+JH13nIAAoExJ/KOwET8
         3mcYByB9ngdBoN3Khz/YTDtZSQu7Uli1S9z26sDwe5moxTmIus06IS9pfFOyotSx8Fqf
         K8sMsZo0XBeVwQF9sT7dShyn5je0GQTUykpwgEZjzIeqlMBqPOOkkbo2EkFonJ02ckA9
         w3GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJoZKgXpqWGG18LyuQa+aW6Qxk3Y5tgICUjYKfY+kotL2UuiYrEtXPFVOA7pUi0Z91klAwqO1KjsB9awE=@vger.kernel.org
X-Gm-Message-State: AFuF++k0M3mWCzArwZweddYQVp+EZgFXgdgfvX4PnSqt7512w12+6BRS
	IJSOkUbjlt+wrJKhPziW2ZGnK9Tq5fPqDKv5+BJw4swIx1Kj+AVq7omWOx38+dSofYY=
X-Gm-Gg: AYBFou2ars6eTAn3u9UtzkTmtPbyTamG6jQx2HVWlxPiwvtg06vr/HT8dGbZINWhvdR
	09e1OQg/yWLG8LAytYS1qXR2rAn9kbGFJGgPu0pLkJaTsuews08kXfYyodcAzRevw17ds+7UPMV
	EWM5UEJMAY2x6AEvVVmeVx7ghio0aziet6qw5OT7+RuqV3kSOjI0+pFZzdEjbji000Q9W0YIc3P
	VpJgkE0rUTJKR+RX4qO5/h+Y2bDR87AWtdh7ad9uiOgO+ZNZXyFFdWsOgsSbI5mn86TAfBH5iqI
	B7fFyqB5T04Eg/0FVDGRcJkTlmz1ohNAbqw2SXJVNhuQ5KCHHJUw+84FhJxxnt8OLCrkha4qWMk
	mYQdyE2ramvqB24jVlp0MQEhNGFt2qm3a9hAODomLY+LffOuyH8ei8jW2nOlUzqVT7Oey8SGFRs
	/NMgF/cEyPk77nFK4VINM1oPeO2N0L2FSXkF9xZTMnYOTs5OKPWJBAQL+/1Coj+Xp7TA9jG7VPc
	oshc794x9JmdjWF61BTQnI9AAe0P+gZlzjXLg==
X-Received: by 2002:a17:903:1983:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2db127c3903mr201337165ad.11.1788601184945;
        Sat, 05 Sep 2026 02:39:44 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:dbc1:ef89:4dd5:b812])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0c0sm20393745ad.17.2026.09.05.02.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:39:44 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 1/3] rtnetlink: add AF_PACKET multicast dumps
Date: Sat,  5 Sep 2026 18:39:30 +0900
Message-ID: <20260905093932.43726-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093932.43726-1-sigefriedhyy@gmail.com>
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTM_GETMULTICAST dumps IPv4 and IPv6 multicast group memberships, but
the device multicast list (dev->mc) is only available through
/proc/net/dev_mcast, so "ip maddr show" still has to parse procfs for
its link-layer entries.

Handle RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET and
report every entry of dev->mc in the existing ifaddrmsg format:

  - IFA_MULTICAST carries the raw link-layer address
  - IFA_MC_USERS carries the entry reference count
  - IFA_F_PERMANENT marks entries added with SIOCADDMULTI
    (netdev_hw_addr::global_use, "static" in "ip maddr")
  - ifa_scope is RT_SCOPE_LINK

This covers every column of /proc/net/dev_mcast. Strict requests are
validated like the IPv4 dump, except that no attributes are accepted;
a non-zero ifa_index restricts the dump to that device. The dump runs
under RCU and netif_addr_lock_bh() and does not need RTNL.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 net/core/rtnetlink.c | 132 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 81c5a6104dea..5e83232c1504 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -4566,6 +4566,136 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
 	return skb->len ? : ret;
 }
 
+static int rtnl_fill_mcaddr(struct sk_buff *skb, const struct net_device *dev,
+			    const struct netdev_hw_addr *ha, u32 portid,
+			    u32 seq, unsigned int flags)
+{
+	struct ifaddrmsg *ifm;
+	struct nlmsghdr *nlh;
+
+	nlh = nlmsg_put(skb, portid, seq, RTM_GETMULTICAST, sizeof(*ifm),
+			flags);
+	if (!nlh)
+		return -EMSGSIZE;
+
+	ifm = nlmsg_data(nlh);
+	ifm->ifa_family = AF_PACKET;
+	ifm->ifa_prefixlen = 0;
+	ifm->ifa_flags = ha->global_use ? IFA_F_PERMANENT : 0;
+	ifm->ifa_scope = RT_SCOPE_LINK;
+	ifm->ifa_index = dev->ifindex;
+
+	if (nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||
+	    nla_put_u32(skb, IFA_MC_USERS, ha->refcount)) {
+		nlmsg_cancel(skb, nlh);
+		return -EMSGSIZE;
+	}
+
+	nlmsg_end(skb, nlh);
+	return 0;
+}
+
+static int rtnl_dump_mcaddr_dev(struct net_device *dev, struct sk_buff *skb,
+				struct netlink_callback *cb, int *s_addr_idx,
+				unsigned int flags)
+{
+	struct netdev_hw_addr *ha;
+	int addr_idx = 0;
+	int err = 0;
+
+	netif_addr_lock_bh(dev);
+	netdev_for_each_mc_addr(ha, dev) {
+		if (addr_idx < *s_addr_idx) {
+			addr_idx++;
+			continue;
+		}
+		err = rtnl_fill_mcaddr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
+				       cb->nlh->nlmsg_seq, flags);
+		if (err < 0)
+			break;
+		addr_idx++;
+	}
+	netif_addr_unlock_bh(dev);
+
+	*s_addr_idx = err < 0 ? addr_idx : 0;
+
+	return err;
+}
+
+static int rtnl_valid_dump_mcaddr_req(const struct nlmsghdr *nlh,
+				      struct netlink_ext_ack *extack,
+				      int *pifindex)
+{
+	struct ifaddrmsg *ifm;
+
+	ifm = nlmsg_payload(nlh, sizeof(*ifm));
+	if (!ifm) {
+		NL_SET_ERR_MSG(extack,
+			       "Invalid header for multicast dump request");
+		return -EINVAL;
+	}
+
+	if (ifm->ifa_prefixlen || ifm->ifa_flags || ifm->ifa_scope) {
+		NL_SET_ERR_MSG(extack,
+			       "Invalid values in multicast dump header");
+		return -EINVAL;
+	}
+
+	if (nlmsg_attrlen(nlh, sizeof(*ifm))) {
+		NL_SET_ERR_MSG(extack,
+			       "Invalid data after multicast dump header");
+		return -EINVAL;
+	}
+
+	*pifindex = ifm->ifa_index;
+
+	return 0;
+}
+
+static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callback *cb)
+{
+	struct net *net = sock_net(skb->sk);
+	unsigned int flags = NLM_F_MULTI;
+	struct {
+		unsigned long ifindex;
+		int addr_idx;
+	} *ctx = (void *)cb->ctx;
+	struct net_device *dev;
+	int ifindex = 0;
+	int err = 0;
+
+	if (cb->strict_check) {
+		err = rtnl_valid_dump_mcaddr_req(cb->nlh, cb->extack,
+						 &ifindex);
+		if (err < 0)
+			return err;
+	}
+
+	rcu_read_lock();
+
+	if (ifindex) {
+		cb->answer_flags |= NLM_F_DUMP_FILTERED;
+		flags |= NLM_F_DUMP_FILTERED;
+		dev = dev_get_by_index_rcu(net, ifindex);
+		if (!dev) {
+			err = -ENODEV;
+			goto out;
+		}
+		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx, flags);
+		goto out;
+	}
+
+	for_each_netdev_dump(net, dev, ctx->ifindex) {
+		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx,
+					   flags);
+		if (err < 0)
+			break;
+	}
+out:
+	rcu_read_unlock();
+	return err;
+}
+
 struct sk_buff *rtmsg_ifinfo_build_skb(int type, struct net_device *dev,
 				       unsigned int change,
 				       u32 event, gfp_t flags, int *new_nsid,
@@ -7251,6 +7381,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
 	{.msgtype = RTM_SETSTATS, .doit = rtnl_stats_set},
 	{.msgtype = RTM_NEWLINKPROP, .doit = rtnl_newlinkprop},
 	{.msgtype = RTM_DELLINKPROP, .doit = rtnl_dellinkprop},
+	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
+	 .dumpit = rtnl_dump_mcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},
 	{.protocol = PF_BRIDGE, .msgtype = RTM_GETLINK,
 	 .dumpit = rtnl_bridge_getlink},
 	{.protocol = PF_BRIDGE, .msgtype = RTM_DELLINK,
-- 
2.43.0

