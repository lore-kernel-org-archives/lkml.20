Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910609;
	b=PL9P9xzWBeYWJXx1cWYCfzdas6JSibyu2qc4mtnSi+FEjw+fvetVXyh50ab84neIovsu
	 uzzLSvNhLnZpa21Kh5oDNjwhWnJXkgfqqmpLseK3x107kGqWEkw3bW6FFcBaFSmBr3l5L
	 z7HFNpWa3ENhKe9/3+oZlpHTcDfXcv2ZPTtfYvytpC1meqUHrGANVZmaK70gshVjrwIBx
	 +rev5Bvm+eXSbQc/z2EoJEkm8OFgs3cXcH96NNfBlZ467mY8enSUC+FQTRKZ2JDSVB7OQ
	 7JJQUTV3WTz6NVvnDZ/C5Pak5r9dZl+Yz42RnJNnEV2Fk4MG4Pp1+isrKyGNSLJ+iew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910609;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 Subject:To:Cc:Date:Message-ID;
	bh=00d0rKx625EmsqUQ7jJLXhBseG3RZ075q6KfkxAtgN4=;
	b=sVpGtGJerBk/xPw1uWpNlRCeR09D7bxZYZVpemk5pvn8Eiy6h7oZe3bAD8/3xwtx3cyi
	 MYJ464BtCZGIpkB8twHD5ROl5qrC1Sekyh/vqKX2ndXXZuPR7kEcIuUcKtC9BGO1Q5Gb/
	 TKM07wtohGuFMvrKzIPlOW7vYThe8R937ueEVcbjVkWSrZq16zZIZo55mfn1OKdde2XDo
	 V/HT6pqJXLg05VCqiVoT/JSHGUAapNsagsSjOjWZLI5ljsGm8qh67fzZ3OBJ+RrscGwnp
	 TuxdLvHwwFTpNxL8p0L/iA7gSLbX8yJqVfSpumhWiISFqY9RLs834Htt4V3YXIK0/dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CKx+ZM9S;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B392606A31C;
	Tue, 17 Nov 2026 10:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B392606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CKx+ZM9S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CKx+ZM9StnyRJteDfdPI7NMboCDv/TEXfaFzqJ+PHrDmb7gIQFnZtjw9fDc5ZYoh1MlWCfkvroolz
	 hJnzze18wbmehSgYuhX/Iurwz5NwcyVH8pxe6SvkIJyn5Wk0jlBb8tclLWCB/HKRnBTx1OliE+wI3H
	 e60nMdjH+x7hlS80=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16afc298a11f-e5a34;
	Tue, 17 Nov 2026 18:16:46 +0800 (CST)
X-RM-TRANSID:2ee16afc298a11f-e5a34
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.50] (unknown[223.108.79.102])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afc298c43c-ad895;
	Tue, 17 Nov 2026 18:16:46 +0800 (CST)
X-RM-TRANSID:2ee16afc298c43c-ad895
From: Xia Yan <yanxia@cmss.chinamobile.com>
Subject: [PATCH net-next v4] ip6_gre: fix changelink conflict checks for L2
 tunnels
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
    idosch@nvidia.com,
    davem@davemloft.net,
    edumazet@kernel.org,
    kuba@kernel.org,
    pabeni@redhat.com,
    horms@kernel.org,
    linux-kernel@vger.kernel.org,
    kuniyu@google.com,
    xeb@mail.ru,
    yana06070@163.com,
    netdev-bot+sashiko@kernel.org
Date: Tue, 17 Nov 2026 18:16:09 +0800
Message-ID: <179491056935.741041.1816208847037703396.ip6gre-v4@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

ip6gre_changelink_common() calls ip6gre_tunnel_locate(), which only looks
for ARPHRD_IP6GRE devices. This lets an ip6gretap or ip6erspan update
create a duplicate L2 tunnel, or rejects a valid update because an
unrelated L3 tunnel has the requested parameters. A duplicate can receive
traffic intended for the original tunnel.

When the addresses, input key or link change, check for a conflict using
dev->type, including updates to metadata devices.

A metadata device can be created with the same receive parameters as an
existing ordinary device. Allow updates that leave those parameters
unchanged, and keep the hash entry in place. Otherwise a TTL update can
either fail because another entry matches first, or move the updated
device to the head and change which device receives packets. Do this for
both GRE and ERSPAN changelink.

Check conflicts and unregistering before applying encapsulation
parameters. Leave the shared find helper, newlink, legacy ioctls and
receive lookup unchanged.

Found during code review of the newlink and changelink duplicate checks.
Reproduced under UML with an IPv6 underlay named under:

  ip link add tap1 type ip6gretap local fd26:106::1 \
      remote fd26:106::2 key 100 dev under
  ip link add tap2 type ip6gretap local fd26:106::1 \
      remote fd26:106::2 key 200 dev under
  ip link set tap1 up
  ip link set tap2 up
  ip link set tap2 type ip6gretap key 100

Before the fix, the last command succeeds and received frames move from
tap1 to tap2. With the fix, it fails with EEXIST and tap2 is unchanged.
Custom UML tests covered conflicting and valid updates, metadata
overlaps, and receive interfaces for GRE, GRE TAP and ERSPAN. TTL,
fwmark and output-key updates kept the same receive interface. Kernel
selftests were not run.

Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
---

Notes (ip6gre-v4-mail):
    Changes in v4:
    - Check changed receive parameters for metadata devices too.
    - Skip the duplicate lookup when receive parameters are unchanged.
    - Keep unchanged receive parameters in place in the hash table for both
      GRE and ERSPAN, so an update does not change receive priority.
    - Rebase onto current net-next; keep the shared find helper unchanged.
    
    v3: https://lore.kernel.org/netdev/179455350258.84965.17518172977020586093.ip6gre-v3@cmss.chinamobile.com/
    Review: https://lore.kernel.org/netdev/179489968486.3136.18372818760197436344@kernel.org/
    
    Tested on net-next 6ff4c5942a301675eb12e5b49d53a81e604624a1 with
    W=1 UML builds. The main checks passed 194/194 assertions; eight
    additional cases passed 92/92. Packet checks verified the receive
    interface and payload before and after updates.

 net/ipv6/ip6_gre.c | 64 +++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 26c0e1c4de18f8b44ceb05d01673aaadfbcbd5ef..af08041b6c498bcf25885acd09328eac4ae7b668 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -2042,12 +2042,21 @@ static int ip6gre_newlink(struct net_device *dev,
 	return err;
 }
 
+/* Match the fields used by ip6gre_tunnel_find(), except the device type. */
+static bool ip6gre_tunnel_same_rx_key(const struct __ip6_tnl_parm *a,
+				      const struct __ip6_tnl_parm *b)
+{
+	return ipv6_addr_equal(&a->laddr, &b->laddr) &&
+	       ipv6_addr_equal(&a->raddr, &b->raddr) &&
+	       a->i_key == b->i_key && a->link == b->link;
+}
+
 static struct ip6_tnl *
 ip6gre_changelink_common(struct net_device *dev, struct nlattr *tb[],
 			 struct nlattr *data[], struct __ip6_tnl_parm *p_p,
 			 struct netlink_ext_ack *extack)
 {
-	struct ip6_tnl *t, *nt = netdev_priv(dev);
+	struct ip6_tnl *nt = netdev_priv(dev);
 	struct net *net = nt->net;
 	struct ip6gre_net *ign = net_generic(net, ip6gre_net_id);
 	struct ip_tunnel_encap ipencap;
@@ -2055,6 +2064,15 @@ ip6gre_changelink_common(struct net_device *dev, struct nlattr *tb[],
 	if (dev == ign->fb_tunnel_dev)
 		return ERR_PTR(-EINVAL);
 
+	if (ip6gre_tunnel_unregistering(nt))
+		return ERR_PTR(-ENODEV);
+
+	ip6gre_netlink_parms(data, p_p);
+
+	if (!ip6gre_tunnel_same_rx_key(&nt->parms, p_p) &&
+	    ip6gre_tunnel_find(net, p_p, dev->type))
+		return ERR_PTR(-EEXIST);
+
 	if (ip6gre_netlink_encap_parms(data, &ipencap)) {
 		int err = ip6_tnl_encap_setup(nt, &ipencap);
 
@@ -2062,21 +2080,7 @@ ip6gre_changelink_common(struct net_device *dev, struct nlattr *tb[],
 			return ERR_PTR(err);
 	}
 
-	ip6gre_netlink_parms(data, p_p);
-
-	t = ip6gre_tunnel_locate(net, p_p, 0);
-
-	if (t) {
-		if (t->dev != dev)
-			return ERR_PTR(-EEXIST);
-	} else {
-		t = nt;
-	}
-
-	if (ip6gre_tunnel_unregistering(t))
-		return ERR_PTR(-ENODEV);
-
-	return t;
+	return nt;
 }
 
 static int ip6gre_changelink(struct net_device *dev, struct nlattr *tb[],
@@ -2086,6 +2090,7 @@ static int ip6gre_changelink(struct net_device *dev, struct nlattr *tb[],
 	struct ip6_tnl *t = netdev_priv(dev);
 	struct __ip6_tnl_parm p;
 	struct ip6gre_net *ign;
+	bool rehash;
 	int err = 0;
 
 	ign = net_generic(t->net, ip6gre_net_id);
@@ -2101,11 +2106,16 @@ static int ip6gre_changelink(struct net_device *dev, struct nlattr *tb[],
 		goto unlock;
 	}
 
-	ip6gre_tunnel_unlink_md(ign, t);
-	ip6gre_tunnel_unlink(ign, t);
+	rehash = !ip6gre_tunnel_same_rx_key(&t->parms, &p);
+	if (rehash) {
+		ip6gre_tunnel_unlink_md(ign, t);
+		ip6gre_tunnel_unlink(ign, t);
+	}
 	ip6gre_tnl_change(t, &p, !tb[IFLA_MTU]);
-	ip6gre_tunnel_link_md(ign, t);
-	ip6gre_tunnel_link(ign, t);
+	if (rehash) {
+		ip6gre_tunnel_link_md(ign, t);
+		ip6gre_tunnel_link(ign, t);
+	}
 unlock:
 	mutex_unlock(&ign->tunnels_lock);
 
@@ -2350,6 +2360,7 @@ static int ip6erspan_changelink(struct net_device *dev, struct nlattr *tb[],
 	struct ip6_tnl *t = netdev_priv(dev);
 	struct __ip6_tnl_parm p;
 	struct ip6gre_net *ign;
+	bool rehash;
 	int err = 0;
 
 	if (!rtnl_dev_link_net_capable(dev, t->net))
@@ -2366,11 +2377,16 @@ static int ip6erspan_changelink(struct net_device *dev, struct nlattr *tb[],
 	}
 
 	ip6erspan_set_version(data, &p);
-	ip6erspan_tunnel_unlink_md(ign, t);
-	ip6gre_tunnel_unlink(ign, t);
+	rehash = !ip6gre_tunnel_same_rx_key(&t->parms, &p);
+	if (rehash) {
+		ip6erspan_tunnel_unlink_md(ign, t);
+		ip6gre_tunnel_unlink(ign, t);
+	}
 	ip6erspan_tnl_change(t, &p, !tb[IFLA_MTU]);
-	ip6erspan_tunnel_link_md(ign, t);
-	ip6gre_tunnel_link(ign, t);
+	if (rehash) {
+		ip6erspan_tunnel_link_md(ign, t);
+		ip6gre_tunnel_link(ign, t);
+	}
 unlock:
 	mutex_unlock(&ign->tunnels_lock);
 

base-commit: 6ff4c5942a301675eb12e5b49d53a81e604624a1
-- 
2.43.0



