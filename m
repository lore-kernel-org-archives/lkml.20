Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CD817DFFA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085832; cv=pass; b=V78+N61mpJ8si7aG4LOLU9WVywRmwyjISyiysbFfsYmUWDavFfRP238lgKAHkGYdBZOgI/qXzjLPjiZwXTmdeZQQm1XXT2eBZv1T2B9yCDlnQH+JEpUi2ctoMfpaj6785OBG/g210Q99J9s081vP+ZU7sUvhiSKYONcVG5lwGa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085832; c=relaxed/simple;
	bh=UhcXak3PP4CSJsJ+2ZmTXWyuXKO/e2C9z0rfeaGezsc=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=ofrusGr58C4Gg6b5D2vP44XFvx+l/sy/QXfzgxQktoC70pBZ3talng/S6GmQoP/8fPQ+dL6VNiVg3Q4EaJ6g4H6fPdHSpe8RWq1Z5Hg78zab5OeDeRVxAlqOFwhlj4YpIB6ZvDg99WDj5dnFTTZOsUGpFaOa9phYlvcFBjTj8wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=XGSRsjBU; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="XGSRsjBU"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79fbso1445055ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789085830; cv=none;
        d=google.com; s=arc-20260327;
        b=aI59zIaMBiORZxCbpMAhNb6ya4tk4Z4cmhv0qKbBpSMq6HdsbkBGSkP8WMinAENDGi
         VydZpgaMF7ASBaMlvdpMyWbclXRfecNL50oSXctbaFBHaSmtiCZvlF7ClvVPx7t8Lou6
         loQVneujIRuYgrF3aAYfFqJludTt0lIcL2IiW/K8R+Z1sTsM2203zszUeybKGStamPmb
         lNRSzy4YeD1NfTC4d5sySdd4JKe9UTZOWFr1seNa2dfg8vyy1NeDmrkojAkIqj/1hIB+
         WN2imn8lNmM2G99aTTLKkUqax1JTRlAL/J14gJYG33fg5ZdjF2og+hw/d3tke/EuKE4N
         rmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=S44dTWF40G+fGHovL3O3dgYh1dI0740WCQy5o7cAbGo=;
        fh=Dci+xOmTl5TYWN28iWHkZjTAFFAJycAIgMLTpGy1K2U=;
        b=YDV5zpM5wE11oNVc6czdVx36Sfe/vDqZW1E/8zPIMhlzmpbnSlLQscHcAK9f7HMl4D
         ftFOXVWYzu4tf3ollXtEIIpb3tEbSX0StpU8ngpzPFlRYVKjQlUI46I3MOvnZIKXeztd
         LhYpM0Q/lWaING/X3UhuoXKtythRNtvO1XGT2LVOXJz+23uo14d9IZ8LDceSkpDv9gc2
         DlPyU+d9jsBinsMvrddJdFPliXXQAnQ3FkAgQNsO/25WIoWGP9GVGkFu+bsdnAHhhJX4
         6hZGl/sdbjWbqNb1MKU2owsiUROYtvU2RaCB9KnaDFW0nRRbWY1fP6Rabj/nwgn8fyNr
         DPrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789085830; x=1789690630; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S44dTWF40G+fGHovL3O3dgYh1dI0740WCQy5o7cAbGo=;
        b=XGSRsjBUp4g76BmBhsyD4RnkmKpW1/+QL08F6ioVnKzv/M7EDTcin4QOOsu0JHX2QZ
         VNIVemujvk8kAa5UyYxQ48k9oPl4dA0KQqCjXkN+0UepeXO3atV5i2tpfvZTgPAGcwE8
         g5H5wB7CRNcRk7dWc48nNWf/70rfm8SVMeuVoAEU/biHkzRgslvYlWlxw/N1dqQsNbgX
         WQU0scJ3/C9BTHZzQvABQnWInCjoz/aZ71rVpEEnu87snffCPNbftdkIac3vCnMY81eI
         IF3QGDjRmwqLlX1yq3KCL1tP3+WogDKh9JxbMT0cEMu4AnDs1P+5s5OevOsq+ZxzbfsJ
         M0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085830; x=1789690630;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S44dTWF40G+fGHovL3O3dgYh1dI0740WCQy5o7cAbGo=;
        b=mYsjmkTa/W3ILvan/J29Ta2LtiGasnJcdtLAHs4FdxWlh2q1IawQgFE7kkDdLJQfnQ
         dsB1+wZWA2uVw1Dimrmq9O4qgqTCMqQF/Qbk3djjCvGkW6CXXGF9ZAdYbx6HpEeybNlc
         uaUhzNI1sg5uve0qGa22KNwOKHeRNih4mxh0gQZvyDZwMRIXk1aPiFNIir5zLVD8rnjl
         WdoQUrWPMzWlFAqfD4wnEId8ZkKpbX8UlCFNbkhzU4pVuAz+l+5E65Mng0PdDeQZFr+A
         uJLpXKkf48pUK3EdF1eweN1uct48DuvgBihqOI/UW3K52daLhTiTCcPqF6HuvQ/ZF8+b
         AfZg==
X-Forwarded-Encrypted: i=1; AKwUvByg3ZwtRluVtRgiITa2hLHMN/sq96MQSJxeevYURid1jIyF+t1E2sNZs7/sKVj0LAARhUcbCkFnFGBI0HU=@vger.kernel.org
X-Gm-Message-State: AFuF++lR//kbMEn/Pc9WXjHqMbpTVhpZrfO8yEETjLoZ5h0WS97Yvs+p
	+dsvPlHRR2ogj6u3KDe8yatzM0l58jaT+HT815WsnbBe+pwCVSg1CU0XlH5fDAuaTE75YOl5KC9
	PJmoLa5FZiWdMlSbmFKcm5r3CertCOK+NBurAPNZn
X-Gm-Gg: AYBFou0gyC8x9gRERRFJT/E8VryaC1YshGCJVySBR4QWz5NyvR1i2b0+XlaXa67ZrJ+
	Ol/BaE9qmaLtBPpIAMBvZE/XxthpEBgVH9Hpn0+bohUTdwgbcdTocKNIzHof7z21a33eDnyckpL
	FusyfzQEmyGxQd7DKZviOszQc8CjU0zoL1HhCcB2nd5GcsRmvO4DDOnrfj/P1q/Mro0fnRirslI
	LkbCxdwIl0A2eizaGdVV/RnCqjQpHwG0qw66wTlJhkPNvGRVJ5FdKMrHR5IUk5UyqAO2xEUoQyl
	ixLUA3GqdO+a/bwPHvKJenZeR4Q4PsKBok08hdPDoApE+tLC8MZfEtXJuTc62Gd1/fVO8L0m31q
	xlbxwlLmHuRW/ez+wYBK5IwXp+CzfBpUTwqjQWon2MN8=
X-Received: by 2002:a17:903:19cf:b0:2c9:e9db:8167 with SMTP id
 d9443c01a7336-2dd2a1ea679mr40406725ad.7.1789085829154; Thu, 10 Sep 2026
 17:17:09 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:17:08 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:17:08 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 00:17:08 +0000
X-Gm-Features: AcwNN1UI0Y2k7NpwvQMDJPRWXKOGhgWR9UD98ZG3_PEz1AwjbPB5B0x8KFFklCw
Message-ID: <CA+0ovCj+Pd5owGH+51rA8-RDu9YFx5oYUv8bV0zOE72QgVfY0A@mail.gmail.com>
Subject: [PATCH net] net: reject a forward path that loops back to the tunnel
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: falemi@asu.edu, Simon Horman <horms@kernel.org>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ipip_fill_forward_path() and ip6_tnl_fill_forward_path() assign the outer
route's device to ctx->dev without checking that it differs from the tunnel
device itself.  When a tunnel's outer route resolves back to that same
tunnel, the walk in dev_fill_forward_path() makes no progress and trips its
loop check WARN_ON_ONCE(last_dev == ctx->dev). Release the route and
return -EOPNOTSUPP when the resolved dst device equals ctx->dev, so the
path walk either advances to a different device or fails cleanly.

Closes: https://lore.kernel.org/all/CA+0ovCgaRvbd0Udj70b2xxG8Cx3CaCpNhnf1V4RWQuDveZYZhA@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
--- a/net/ipv4/ipip.c
+++ b/net/ipv4/ipip.c
@@ -375,6 +375,12 @@ static int ipip_fill_forward_path(struct
net_device_path_ctx *ctx,
 	if (IS_ERR(rt))
 		return PTR_ERR(rt);

+	/* The path walk must advance: a route back into the tunnel is a loop. */
+	if (rt->dst.dev == ctx->dev) {
+		ip_rt_put(rt);
+		return -EOPNOTSUPP;
+	}
+
 	path->type = DEV_PATH_TUN;
 	path->tun.src_v4.s_addr = tiph->saddr;
 	path->tun.dst_v4.s_addr = tiph->daddr;
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -1863,7 +1863,12 @@ static int ip6_tnl_fill_forward_path(struct
net_device_path_ctx *ctx,
 	fl6.flowi6_proto = 0;

 	dst = ip6_route_output(dev_net(ctx->dev), NULL, &fl6);
-	if (!dst->error) {
+	err = dst->error;
+	/* The path walk must advance: a route back into the tunnel is a loop. */
+	if (!err && dst->dev == ctx->dev)
+		err = -EOPNOTSUPP;
+
+	if (!err) {
 		path->type = DEV_PATH_TUN;
 		path->tun.src_v6 = fl6.saddr;
 		path->tun.dst_v6 = fl6.daddr;
@@ -1873,7 +1878,6 @@ static int ip6_tnl_fill_forward_path(struct
net_device_path_ctx *ctx,
 		ctx->dev = dst->dev;
 	}

-	err = dst->error;
 	if (err)
 		dst_release(dst);
