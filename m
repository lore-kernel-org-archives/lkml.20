Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C044457B6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638655; cv=none; b=B3YUp6yAWmtsRzKCA70g/lkS6UetyPHqCDmHKeTRqfMXRJBhvge5+wgK/XJnkRdutHGejUgpnV8GtG7VNHGn/dYzD6AlhNpgvmSj4Pq3WEyP/4/bzVrxAQMvdY+5O/lC+7ockxQO6AVrLH+dFJP61doL/IaTlH2JbscEgm9F/Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638655; c=relaxed/simple;
	bh=zCGjskzC6nt6OCJ7w5ms6NErauf5y//QMc9iiBz8jkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dH5unvs6aMUuwubRBrhJvUjGGvYcqz+c+KSQdUz0EMxhlTA/dmYTJSUEeSB9QeBgDpw1pG9xN6haJ4fApOkEHqmK1/+diczGVxh14SP4+es8lFDGYnrn5CPpJAYT4q0sPgpMMxWkpW9rY7R+6uV/P0JK/kfy9v0/BaChh2BMjX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sl+mqBbs; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sl+mqBbs"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zCGjskzC6nt6OCJ7w5ms6NErauf5y//QMc9iiBz8jkU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789638644; v=1; x=1790243444;
 b=sl+mqBbsL/tyvYprDuftf3Mdnc34PHHF6AyVE+3bbWr38K/v/bNwLbdZqG9Ut9Ge4RuqRbHH
 KFMTOluPkDcbeRnF9fEQHUZNKx3Oa+bqUFaE5PSyLz2fXhIin5BBZlnhyiZ0rkktWPxXpYGox2E
 uxqBOsqn/gg0V7UZoCVeiiy0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 74eb9895368bae3b;
	Thu, 17 Sep 2026 09:50:34 +0000
X-Mizu-Trace-ID: 74eb9895368bae3b
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	tgraf@suug.ch,
	pshelar@nicira.com,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Subject: [PATCH net v1] ip_gre: Reject enabling collect metadata through changelink
Date: Thu, 17 Sep 2026 17:50:16 +0800
Message-ID: <20260917095016.71937-1-xuanqiang.luo@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

ipgre_netlink_parms() can enable collect_md on an existing GRE, GRETAP
or ERSPAN device. Unlike newlink, changelink does not enforce metadata
tunnel uniqueness. Converting a non-metadata device can therefore
replace the metadata receive entry for another device of the same type
in the same netns. Deleting either device then clears the shared entry,
breaking metadata receive lookup for the surviving device.

If parameter validation fails after collect_md is set, deleting the
modified device can also clear an entry it never owned.

Reject enabling metadata mode in both changelink callbacks before any
encapsulation or tunnel parameters are modified. Allow requests that
repeat the metadata attribute on an existing metadata device.

Fixes: 2e15ea390e6f ("ip_gre: Add support to collect tunnel metadata.")
Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
The state change on failure can be reproduced without an existing
metadata tunnel (output abbreviated):

  # ip link add g1 type gre local 192.0.2.1 remote 192.0.2.2
  # ip -d link show g1
      link/gre 192.0.2.1 peer 192.0.2.2 ...
      gre remote 192.0.2.2 local 192.0.2.1 ...

  # ip link set g1 type gre external
  RTNETLINK answers: Invalid argument

  # ip -d link show g1
      link/none c0:00:02:01 peer c0:00:02:02 ...
      gre external remote 192.0.2.2 local 192.0.2.1 ...

  # ip link del g1

The request fails, but collect_md and the device type have already
changed.

If another metadata tunnel exists, deleting this device can clear its
collect_md_tun entry. A successful conversion can overwrite that entry.

 net/ipv4/ip_gre.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 82309efd417e0..7b1b0f17f60b9 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1464,6 +1464,9 @@ static int ipgre_changelink(struct net_device *dev, struct nlattr *tb[],
 	if (!rtnl_dev_link_net_capable(dev, t->net))
 		return -EPERM;
 
+	if (data && data[IFLA_GRE_COLLECT_METADATA] && !t->collect_md)
+		return -EOPNOTSUPP;
+
 	err = ipgre_newlink_encap_setup(dev, data);
 	if (err)
 		return err;
@@ -1496,6 +1499,9 @@ static int erspan_changelink(struct net_device *dev, struct nlattr *tb[],
 	if (!rtnl_dev_link_net_capable(dev, t->net))
 		return -EPERM;
 
+	if (data && data[IFLA_GRE_COLLECT_METADATA] && !t->collect_md)
+		return -EOPNOTSUPP;
+
 	err = ipgre_newlink_encap_setup(dev, data);
 	if (err)
 		return err;

base-commit: c9151088f1674fd29ff26a20f5fc687acf53a2f0
-- 
2.43.0
