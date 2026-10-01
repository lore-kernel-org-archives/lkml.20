Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93B734F46D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832124; cv=none; b=Sj/1kqI36N2CQVQxYApX/w3SQiGPr/+wmNudq21gm9pIAtd1OGn3/paVDTbWq0rhFAYfoBdrdIC8nbbRrlCEDLl2+pSD961MznuWVQ6ydCLFKU0kvC35ZnatJJKxj4+uG96iK6ciRZssnlmlCyourwby5qtbUK7kJ8nLiKWckek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832124; c=relaxed/simple;
	bh=6zQ/dGVekAKk4Ygn9pvYX2mxUUI5q0Qrh3Z4u8De64U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RV1hPE6eJvT75laveM82A5NgZwiQWkLoqrpXLJMES2iio/emFSPyZgao7djtrxJArg8zYzA/orWfKrbpggvxOKvIQowwt8jJT29SyA6e+P0t2sBxb7Dj1KOf/7Ll8nRUEpU6EADM/911iZ7HQCyJsf4GwqD+Y488sRtP7jEKB+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4kUH1Vm; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4kUH1Vm"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso3038815b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832122; x=1791436922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=drcBlhp1loCKFpHE49qLsszBsMwUy6/00G+FHSsCpkE=;
        b=h4kUH1VmE42UdcYrg11gtXQ/lhNyR5YAYXEptIbhoeW++yQszCm8GgXdXK0b46FdzC
         9xUFLzCneA5XwLk/oLLLhLxP/Eg8iLhc7cJH0oIC797QxjAe2NTeR6aYza2sljOscqa7
         S/fo0hC86xhofaTWBisCx31UWiqlLPYuW8tOzRnLjaPhnxBe8E5mLoFceHiWKJoSDzX5
         PG4Q49IJbLXtlXkGOMWv2olcjWEoilArz2rYMCI+ES8DNt09//v1M5Nvzv0vNvW/hzDb
         UxRkPVSTjxyM6PL+GaSpiXuowMu7j5FdOAzGpoR0adW+1TrBS9uONmoVE76bHHmxwRqL
         uv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832122; x=1791436922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drcBlhp1loCKFpHE49qLsszBsMwUy6/00G+FHSsCpkE=;
        b=dnEFcDPckweIMgProNFJGb6UxGmWjiJlUDCgdWsnDEhZGweJT5VUmacer/fJavvECw
         730RP9klamOKCg9D74wj8TMFcgV0FE9cV2nynkJEqqBWy2EZ9otJB33/dCXU+4aahMm9
         WKWJfb+ofD+f++3L9hyEesBJszoe5ZK1j6GZMzvXvWIlJdWRnpGgSLiawckE4kiTE72D
         YfdklR+GkheAfp0jZOBoBl8WQn133c14XQrBS/gJNZ0Qr6jOj33STTHyDQ5UQA4ktzxO
         MB3UOBmT87CirLPLPeM//pQvMT5bTpLfu9Hg35ZkYVJZ7vZKHXXJWOlYYZEzEL0j0GQ/
         PBVw==
X-Forwarded-Encrypted: i=1; AKwUvBxSARXUSXYnaG6Q5asX1LTROF6ycMyQ5LCpFbW0lYToKNrMB8QsMZEhiRNf2RClRGOkxhBkvIvfbRio+kI=@vger.kernel.org
X-Gm-Message-State: AFuF++nKXqkVFDtynr79yz/l/LoKLrScw0nCiwcDO+dtPSdwG3KvJciQ
	rmEo7eRiHYGChOok0XbeLLUyn1bPaDEwMiKxr3l6BZl3w7fAZZ5sCCO4
X-Gm-Gg: AYBFou2TMNei+LBt9Gf0upnDN9TB0ktNEUkKRhfI6/Vjc/WhWojdE3SvVZaJjsik/NE
	fnWRG0EkIPxj0uLm5AXCRzOYwf/4/HiinMuYAvTR9tQX14rnl5WDVOO/0Jz0SUd1sWy9SEkP9h5
	BWf09NNlVF9byWGYnyPFcYsD/0e4+uQPZbuGB53+SLO6WElPeR3slIsgpQ/LcR0BBgZjiVS0mNR
	6XJ51A/Se2TMrAvx9JpDd2qtVLjWXrCMFeRI7JFvZX/+3kOsjlp7mQ1pvzQ1CrLk0nQ6GrKUvur
	G7/gRZ88yiAA9P/72FRwc7LyjEIl9eum2wYcAuZGA5bT8T5ALTEjh9ZasyxU02igRIPceJE2Z3v
	Ums8v4V1pp6pXPcOxcNrSMor60m5DPyxFfXxxkuwKi9Y/I+//z0DfLBQSlkTv3gIgGFBxdO7p3n
	iwtE46QNVii0thjLatj96cPyaMDpyjWhcwgdMd8pYChBA/4PRkk2kWiOspWbzYKdTs1BeFFnDuI
	E0Ts43pvzY=
X-Received: by 2002:a05:6a00:1415:b0:881:7ff5:6061 with SMTP id d2e1a72fcca58-8874c6d6e74mr2623126b3a.24.1790832121957;
        Wed, 30 Sep 2026 22:22:01 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819bbc6basm461851b3a.55.2026.09.30.22.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:22:01 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net] ipv6: serialize address publication with addrconf_ifdown
Date: Thu,  1 Oct 2026 14:21:50 +0900
Message-ID: <20261001052150.136559-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipv6_add_addr() inserts an inet6_ifaddr into the per-net hash before
linking it into idev->addr_list. addrconf_ifdown() clears the hash first
and snapshots the device list later. A nonblocking add can therefore
enter between the two teardown observations.

When a non-loopback device's MTU falls below IPV6_MIN_MTU, teardown
marks and detaches the idev. A late add can then link the ifaddr into the
dead idev. On v7.2, a deterministic interleaving left the object
hash-visible with idev->dead=1. ipv6_get_ifaddr() returned it, and later
device deletion waited indefinitely with usage count 3. During network
namespace exit that wait can stall the single-thread netns cleanup
workqueue.

MTU changes require CAP_NET_ADMIN in the affected network namespace.
Where unprivileged user namespaces are permitted, a local user can
obtain that capability in a new user and network namespace.

Publish the hash and device-list memberships while holding
addrconf_hash_lock followed by idev->lock. Recheck idev->dead and
disable_ipv6 before either publication. If teardown wins, the add fails
before publishing the object or taking a list reference.

The same forced interleaving now returns -ENODEV and device deletion
completes without a KASAN or LOCKDEP diagnostic. A real Router
Advertisement separately reached ipv6_add_addr() with can_block=false;
bounded natural stress did not reproduce the full race. A reproducer is
available on request.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv6/addrconf.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index c90ee6dd7446c..899e9a47f7585 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1047,8 +1047,9 @@ static bool ipv6_chk_same_addr(struct net *net, const struct in6_addr *addr,
 	return false;
 }
 
-static int ipv6_add_addr_hash(struct net_device *dev, struct inet6_ifaddr *ifa)
+static int ipv6_add_addr_hash(struct inet6_dev *idev, struct inet6_ifaddr *ifa)
 {
+	struct net_device *dev = idev->dev;
 	struct net *net = dev_net(dev);
 	unsigned int hash = inet6_addr_hash(net, &ifa->addr);
 	int err = 0;
@@ -1060,7 +1061,23 @@ static int ipv6_add_addr_hash(struct net_device *dev, struct inet6_ifaddr *ifa)
 		netdev_dbg(dev, "ipv6_add_addr: already assigned\n");
 		err = -EEXIST;
 	} else {
-		hlist_add_head_rcu(&ifa->addr_lst, &net->ipv6.inet6_addr_lst[hash]);
+		write_lock(&idev->lock);
+		if (idev->dead || idev->cnf.disable_ipv6) {
+			err = idev->dead ? -ENODEV : -EACCES;
+		} else {
+			hlist_add_head_rcu(&ifa->addr_lst,
+					   &net->ipv6.inet6_addr_lst[hash]);
+			ipv6_link_dev_addr(idev, ifa);
+
+			if (ifa->flags & IFA_F_TEMPORARY) {
+				/* manage_tempaddrs() relies on addresses being added to the head */
+				list_add(&ifa->tmp_list, &idev->tempaddr_list);
+				in6_ifa_hold(ifa);
+			}
+
+			in6_ifa_hold(ifa);
+		}
+		write_unlock(&idev->lock);
 	}
 
 	spin_unlock_bh(&net->ipv6.addrconf_hash_lock);
@@ -1168,26 +1185,12 @@ ipv6_add_addr(struct inet6_dev *idev, struct ifa6_config *cfg,
 
 	rcu_read_lock();
 
-	err = ipv6_add_addr_hash(idev->dev, ifa);
+	err = ipv6_add_addr_hash(idev, ifa);
 	if (err < 0) {
 		rcu_read_unlock();
 		goto out;
 	}
 
-	write_lock_bh(&idev->lock);
-
-	/* Add to inet6_dev unicast addr list. */
-	ipv6_link_dev_addr(idev, ifa);
-
-	if (ifa->flags&IFA_F_TEMPORARY) {
-		/* manage_tempaddrs() relies on addresses being added to the head */
-		list_add(&ifa->tmp_list, &idev->tempaddr_list);
-		in6_ifa_hold(ifa);
-	}
-
-	in6_ifa_hold(ifa);
-	write_unlock_bh(&idev->lock);
-
 	rcu_read_unlock();
 
 	inet6addr_notifier_call_chain(NETDEV_UP, ifa);

base-commit: 7375d38364a9aa66fb31716bcefef38aecad75d8
