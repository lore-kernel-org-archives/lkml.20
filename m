Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920683;
	b=qW4FdKMvwnPp5es60cck7/XLbXbF75Ja0UEcLTclJNcO8mUwgkdbxJMpWllQzXtTqfHD
	 At7wgpNsjXEMEdDKJon529ZjQH+XZ/2TWFUFWw4Dar710cc7wDxaDLGy4doPt48zrMgRg
	 PC+737dnN0ZV8r0T9ApVhwVNrxXc0zm7Narv7FPIUUcTT8Cb9zOUTLSgEk9nTFG4Xk28/
	 1pLjDjM56on6+/AocIwjl38JwCUnn5B7SGeaKRVxjsmH1DpjG5iNbh09QMmgWcsxLtxlN
	 qMFBSEm5AWviOuKQGRVwDQcaFGeEfoFuJxdYazPuYf+6kTKIdQiYrUiFCs4ftyD2Iww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920683;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=mR0nEV2O5FZTm+jth7aDIW2PeXtt3ZXbJtCg3l+STZU=;
	b=NCIblscLHJEaHV++Mkc53z7hat8Ro0w+9UdIairbdFbfZkBD2e2y5apUT3N2EFggyv+d
	 4buvAxAS9AsCzpQpVawAvFRAMZX65QVLLHeXpUwh5qKWBlQ5umJASkWmZ2qQLLHli3JgQ
	 HoBj93kNM31PlGaneXGQq2GPkUsBLHeI1v6eXXEOp78z8cMPLYbqFrsBPdJ+kjzvC+nea
	 LiV/7RThYLfSQnRIPvaDihb+UY2FY+aSkcAbgYdgLJZDumP+UghorKQsN2GeihFwGrZZK
	 r8VxbE6JC7X9sKKQu6jpTYbjmGwOuayi3BqU91tZJzq6sEWtQHfXtcj6ROUVcd0okMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fO86I4+j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B10606A32A;
	Tue, 17 Nov 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fO86I4+j
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794920682;
	b=yAYxV6NAniNUH2YBm0dLWlOFPxzVu+LffIjuhE0Dud4/MHoQryBnMUO8jyn9xNAUP5Ek
	 KVLZQXzx2ZXeV/ti6yefmqnWw81H3Ty4RQsiGkE4ZYwC4+yHcrHzmf2dNvCh2YE3D1xae
	 l2YDKxV40Sl186K7P6FJDZX0IS5sIwGI4lRlqrqmiO5a5W45wdOVPMKYjT2rYIr6PJ45w
	 bXu8MlS7ULB2zNs/A6e2Dxb2/oHEOYvsXqpSLQW6vnC8nUVtSgOod80nxOQew95cgpknL
	 3Pn1deYu1+xBHY2vGpcGSqerg7DCZMCO1x01NxCNNdfNxAXW83ThzQ4tiybLrysSzAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794920682;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=mR0nEV2O5FZTm+jth7aDIW2PeXtt3ZXbJtCg3l+STZU=;
	b=HVwuMWgLwAMVlVXMvEx2TjecmpAuWn23io/5mwEs23Xa9HBgnjOIqi6fo2f1I4h1R6Bl
	 wXYElXEtTqATkxEQh28qqFmOjJCSm5TYxaMqDqxwJnjcTNUu9/G/sS8b80BIdrR57vd2m
	 1ZSuc939n0aZSXah8rYJwlTEl0AvOGmcpMrwh9Iy5VpVXBz4AtjAznwkadp+hvmWg/EqN
	 ivXWDZ7z0nrTJYHXDsU0mNKn9XS/LJBkcneZ2LQ+ev0UYs2IPJkmqzHo0D/cSTggi0Be2
	 uNDtdmKi4VyzeVfcrhoEyOyL0dPBOc3LsasAaFV4Nn+PCQUC/ZxYfIW3yl06fZFOT/Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E9501F000CB;
	Tue, 17 Nov 2026 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920682;
	bh=mR0nEV2O5FZTm+jth7aDIW2PeXtt3ZXbJtCg3l+STZU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=fO86I4+jI4sBttLnIbvwe4uN1TekoTNeXAzk+ias6+W8RF292LaGcPe/R6a2VcS4/
	 6X4NLJRLSqf+RkDSEAcJ0mgDmOFHUGsrYeNGkE2UImCsK+4jbTkLxWpnTgS7sWLQtt
	 BTxuYUj5A7aILJyUWX3atE7O77WhAE03y+0OL7+qWvBFZvGYeexmtIs+ugyx11+D1r
	 nQf2istyCTZwP1w4xaULHS7DTGj5jDVQ7mamql9HZHUETKTpndXbLfmt6x/Gi3bXPw
	 26MUTD75eXZTFjRfglkgH+LAwKQjjdTluDhtnh3fs6SAgamXbz2x+9u52s/QcR9mPW
	 OVy64hKr4jNMQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 64A964A966;
	Tue, 17 Nov 2026 13:04:41 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Tue, 17 Nov 2026 13:04:41 +0000
Subject: [PATCH net] vlan: require real device netns admin to change GVRP
 and MVRP
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-vlan-gvrp-v1-1-53a6b0775953@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOhQ/GoC/yWMQQqDMBQFryJvbSBfQoteRVyY9Gt/KVESDULw7
 qZ2OcMwGZGDcERXZQROEmXxBaiu4N6jn1nJqzAa3TyI6KnSd/RqTmFVRreTc9YaTQalXwNPcty
 vHp43DH8Zd/tht/0uOM8LXl3gOnIAAAA=
X-Change-ID: 20261117-vlan-gvrp-409fccbb4014
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org, kuba@kernel.org, davem@davemloft.net, 
 linux-kernel@vger.kernel.org, elb12345@hotmail.co.uk, horms@kernel.org, 
 pabeni@redhat.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794920680; l=3616;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=aPzvkoJxrs75VGP9OVSKh7asGZOHTzpg2ld/W4/JnyU=;
 b=u+HsRqt9OQMihDiNfBrDajCA2N5gyWBMaRFjPlIP3o7lKFjNddQ6JGAnhDf/v75M/vSHp42S2
 RJNs7b+S9ryDsTgrn/IQMwKZTcgMRQ7XWC6cc/pvPYBtLmhPaLsBolW
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

A VLAN device can be moved to another network namespace while its real
device stays behind. CAP_NET_ADMIN in the VLAN's namespace is then
enough to change its flags, through IFLA_VLAN_FLAGS or the
SET_VLAN_FLAG_CMD ioctl. Two of those flags act on the real device
rather than on the VLAN:

    if (netif_running(dev) && (new_flags ^ old_flags) & VLAN_FLAG_GVRP) {
            if (new_flags & VLAN_FLAG_GVRP)
                    vlan_gvrp_request_join(dev);
            ...

vlan_gvrp_request_join() and vlan_mvrp_request_join() declare the VLAN's
own VID on real_dev's GARP/MRP applicant, so the real device starts
sending registrations for it on the wire, and the switch on the other
end may add the port to that VLAN. On a running VLAN, clearing the flag
withdraws the declaration the same way.

So an administrator of the VLAN's namespace, with no capability in the
real device's namespace, can make the real device emit GVRP/MVRP
registrations on the wire. Check CAP_NET_ADMIN in the real device's
namespace in vlan_dev_change_flags() when GVRP or MVRP changes, which
covers both the rtnetlink and the ioctl path. rtnl_dev_link_net_capable()
allows it right away when both devices are in the same namespace, so
nothing changes for that case. This matches macvlan and the changelink
series that gated the tunnel drivers and, recently, macsec.

rtnl_dev_link_net_capable() was added by commit 8165f7ff57d9 ("net:
ip_gre: require CAP_NET_ADMIN in the device netns for changelink"); a
stable tree without it needs that first.

Found with a static analysis tool and checked by hand.

Fixes: 70c03b49b80b ("vlan: Add GVRP support")
Fixes: 86fbe9bb599f ("net/8021q: Implement Multiple VLAN Registration Protocol (MVRP)")
Cc: stable+noautosel@kernel.org # local DoS by a userns admin; low severity
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Tested under QEMU with network namespaces (x86_64, GVRP and MVRP
enabled): an unprivileged user+net namespace admin can toggle GVRP and
MVRP on a VLAN whose real device stays in the init netns before this
patch, via both the SET_VLAN_FLAG_CMD ioctl and the rtnetlink
IFLA_VLAN_FLAGS path, and is denied with -EPERM after it, while a
same-netns privileged admin still can. W=1 and sparse show no new
warnings. I haven't run it against a real switch.

The same gap in macsec was fixed in commit ed502e485685 ("macsec:
require CAP_NET_ADMIN in the device netns for changelink"). Its author
described the identical VLAN case there and said a separate VLAN patch
would follow; I could not find one on netdev, so this is sent
independently.

Link: https://lore.kernel.org/netdev/AS8P251MB000190AAD82CD30EFBC57B4DC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM/
---
 net/8021q/vlan_dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index bca0a3693636..44067b0ccf35 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -269,6 +269,12 @@ int vlan_dev_change_flags(const struct net_device *dev, u32 flags, u32 mask)
 		return -EINVAL;
 
 	new_flags = (old_flags & ~mask) | (flags & mask);
+
+	/* GVRP and MVRP act on the real device, which may be in another netns */
+	if (((new_flags ^ old_flags) & (VLAN_FLAG_GVRP | VLAN_FLAG_MVRP)) &&
+	    !rtnl_dev_link_net_capable(dev, dev_net(vlan->real_dev)))
+		return -EPERM;
+
 	WRITE_ONCE(vlan->flags, new_flags);
 
 	if (netif_running(dev) && (new_flags ^ old_flags) & VLAN_FLAG_GVRP) {




