Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792741006;
	b=vXE8dWgk5c9g1H8GIo55Bv5BT4RnZGzUdZG/hCiiVhNxlSQKYtOdXJcWNxuytWzcCyxv
	 KysMkxUK9LytkXuy7KcGJZV1zl9GymB1nECUruWfXdRb2TECuEvpdeLh0+ZSKbUKl1M2x
	 //ydbpX1KFbdifsT0OFvHK3P6BQxEmQyOIrsdjFxm+QHLziQw1ly0FRgs/veCEf9WLkq1
	 f1IAeg+56UiYCffh9HgaQvOGhTAqjMg9OmraOLlgmDQuwwUvoPHv0sW92rmsFjg/wswvb
	 GwNSXBAT9wXP5yM4otG+mdCUw0tS3urU6juNqN4drDqu59Q9nJv5jztBPogAj05euwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LEwT0YhXrskx2vnf/jESb/aGipGf5XisCm0pn5WijMA=;
	b=O+MiHF68cNhKUsKEcYNs4hrD8CEM7CotXmhdq1k5JSthfw+Pn8TxFcTHhlnv4Qe9D3VD
	 gvbNtBu2GLXZNRfpL/SykGtpO1rfzRgcHrDU0vd8CyDeXuy5+TwG0TW5o6LnUnkZ5o7/4
	 eRoDJzDOcn07Ot2byd0Go2Otx4WgEr0rxZIpELROr9eAVAuXCpQ+8/TArpBVAvkjdowYG
	 VSh2uxypMWYPWP1VEvyK0I0+GJSRpBAhI9D9ptUKKOJjLMqC1esZ1uz7woZNqQCrah8AB
	 HCHXnGQevfWDO2r0Ie5duGupCvlFw3wJxupGl1xUK6j1wZfp8cM7WhEFb74X7nCbPSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gSRiq3LB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE0606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98AE0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gSRiq3LB
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso409396e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792741004; cv=none;
        d=google.com; s=arc-20260327;
        b=EXQAfg3npZj6kLE4YRtUTXWj2Hs1NqGmFa968AYgOEaXlxecicfMnUrZm2u4XtLdLZ
         HLj7yA3BmCaqfRuxDd4mp5Ipsbi9ouVQXU5vv8FxQoNbFbTBcmv9PaN4kawz21qVr0n+
         +NaMCJ9452oeCC52C9++tYKJDVFKMUInH0440sYsSrNiO/YoOxV9Ina72XoL/cwHmehs
         Gc3488TGXhgWkvrTUIsOJJ/vXafbgIfs6kUMeZoHt51QcbCXrXTffkPBLc5tGgyQrPFd
         gXu6KdwLu3/oUfE0a80SqJZ/RQ8QqPI8KjDXC+mQmcpNghSQyjXuxBP7GLeU7zgbBLx1
         IUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LEwT0YhXrskx2vnf/jESb/aGipGf5XisCm0pn5WijMA=;
        fh=5BTGtEIwOre4RGmWtEZm8Ms6IqLqGSGnhBOkDsJiJ70=;
        b=C/LAni0tC0/Fu/2PnDgTL6JHUdCT7hLjUsBXZTuq/aDbIjfyAEhFoHAKY5mCYvI/VX
         hIFKd/topvCTsZnsn1S628P0iP0EoAhm0gz1z+3j/evE3aaa4+LmRFP9QYHo9Ieya0RZ
         Um7SwgY6ezA99+IbiM1lyz/VkIXRaML6oF1BrsCYhn1yXoFtMcr53xtCf231yc1e/+zm
         M8Qo4wiL1t5lGlxwXhNCu/fe4UGqypfaVQfv0odWxqa+1G5KprCI4K++hFSBZOdapBmn
         XJzDQJmFyZ88/VFLjoOxQmBK9y/sWKUufEE3+vLj7NVfhC/4C+331Vexl2iKdl2fGlGK
         3D1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741004; x=1793345804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LEwT0YhXrskx2vnf/jESb/aGipGf5XisCm0pn5WijMA=;
        b=gSRiq3LB1p025Dt8CY+r6baTbk/WIx+K8TCoKBHZY8hVC9FCWTwoFwJS5/Az9iXymF
         c0PBJZSB/h4meUizqJzhevVx7Q/XzFq7VEvoWByLHEszgyVn31JaoOPlEXkTqT9zOGQ5
         rDCUC2NzF7dCVm2USErYluhZWRZffLzh0uiMmCErA9D6JGqzwQt2eHQoC7eoG6vJ4v1E
         BLXtTDN21SXzSBYmeTu2VPmu/YfrFB86Nc2/+eWE9S9UXaGiao3cNl1LImzQHXQO60mc
         zhar0mJPE4qo/+makKthGu5QPx49qN61sgixoNlD8jlnlPRdhdit2a44VW4KtscmDpBt
         O7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741004; x=1793345804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEwT0YhXrskx2vnf/jESb/aGipGf5XisCm0pn5WijMA=;
        b=srmPClctgEsGAmeiARz1vyPMouVUtqvaIudLrHCIyNskkA0fggUCkcNUmb+jwV8Hxw
         lr2kbAkd+V34Anlm2NXujCmr/4Ji2z/bz47Nt02EHr0tHrn3wjj3+rOfRi5/F0USB8nv
         ge9W4OxjR1XrT+cEsXUNTgPm9yYnQnx5ySsuWpJgDWIhNgbz9wbY40SPAA5Mt6sPTUf/
         Fx88x8UwNozScMaGExomRGVdQC8jbXs5jc3gpvDrHlhyDh+byXS0Lm4EQXm4THzXXMqL
         b1+605uWkJZt7+xGiBbiyKGnkS46lXatZhREuMiaDLswLbvowl52nkVDIxADhoMW0C88
         8I7w==
X-Forwarded-Encrypted: i=1; AKwUvBzMPgnC+fkUJxfSZHVhRb3XeExAKW7/WCeyay0AJpJrXMlWmtQQFFxCHV53H/Uz3ZPTF6fIQqytjAmvhD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/gCiDLF3IM90mqWA69HRBJvw+KDPZGSQciIbdfHkjyu1hnww+
	OC8jMGe/K6VAkNAsw56kdqIIzLSmdSKA/9i1jGzYlv560vyIf451pZ6ZMUQF62h+H1pNrOSuPNt
	2MFmeIarq+6FnmyCHwEtwx1DfycHzghmCxlWV
X-Gm-Gg: AYBFou1Wk6qdj804EFb0TQr/6qWb9XRkFdfsc/U6zD3EXfnvM25UEN4WbiUKNtc4BWF
	ufwHvXM2AMiZQLB2vPu8YJZjZF0uFSq5h6MOyxtqYQaQDae9heA0fs+uk6arQvvtTniv/2ZMM8w
	4ReAqiCXSEeKQEQ44K/EDB3JEftnY9HrQy6YXPMcu4Pty5Y+Iea13p7VMuUFi7afDX2y8hIW4Qg
	3/2fFlx81swD1MYnv9MKPOBPQEPu5nY8yZEFu5N01znAH7Aul4aqQGDycg/yFtdJ6Atp55gQg6O
	1LP547vSfTpAzB6t/IbwiM6isCpVpbCq/+ZZqf56+SaL4Gv0PhBezmNHT5bpbjFnaW1DNejLPbi
	OjMNeWd427V4JG2lDUXdy1XTsy+9OG+/q0UFG
X-Received: by 2002:a05:6512:1195:b0:5bf:a8fa:2dcd with SMTP id
 2adb3069b0e04-5bfb0b41ec2mr393486e87.43.1792741003205; Fri, 23 Oct 2026
 00:36:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021065750.2069795-1-anilkaushikwireless@gmail.com> <179273868210.3134.12145105670992560597@kernel.org>
In-Reply-To: <179273868210.3134.12145105670992560597@kernel.org>
From: Anil Kaushik <anilkaushikwireless@gmail.com>
Date: Fri, 23 Oct 2026 13:06:30 +0530
X-Gm-Features: AclHuK_55cXWNO0jBsFGdH-QWTewaPnfJE6BaXbTxgMV5nW5-2xen-3RddkOEo4
Message-ID: <CAG0Mgm-T=n2Zq_bqMNNY3Bc9w7yUg-NMcEjzkHOKM3+9yJjfTQ@mail.gmail.com>
Subject: Re: [PATCH net] gtp: Require 'CAP_NET_ADMIN' when joining the gtp
 multicast group
To: netdev-bot+sashiko@kernel.org
Cc: pablo@netfilter.org, laforge@gnumonks.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, nicolas.dichtel@6wind.com, 
	osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 12:28=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] After this patch, the multicast group and GETPDP carry the
>   same PDP-context data but are guarded by different checks.
>
> --
>
> gtp: Require 'CAP_NET_ADMIN' when joining the gtp multicast group
>
> This commit marks the gtp generic netlink "gtp" multicast group with
> GENL_MCAST_CAP_NET_ADMIN, so joining it requires CAP_NET_ADMIN in the use=
r
> namespace owning the network namespace. The goal is to stop unprivileged
> users from reading PDP context notifications that GETPDP restricts to
> CAP_NET_ADMIN holders.
>
> > diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
> > index 69fe5717846b5..e5ff1621ed620 100644
> > --- a/drivers/net/gtp.c
> > +++ b/drivers/net/gtp.c
> > @@ -118,7 +118,8 @@ enum gtp_multicast_groups {
> >  };
> >
> >  static const struct genl_multicast_group gtp_genl_mcgrps[] =3D {
> > -     [GTP_GENL_MCGRP] =3D { .name =3D GTP_GENL_MCGRP_NAME },
> > +     [GTP_GENL_MCGRP] =3D { .name =3D GTP_GENL_MCGRP_NAME,
> > +                          .flags =3D GENL_MCAST_CAP_NET_ADMIN, },
>
> [Severity: Medium]
> Does this make the multicast group check the same as the one on GETPDP?
> The commit message says:
>
>   GETPDP requires CAP_NET_ADMIN, but generic netlink lets any user join a
>   multicast group by default
>


> All of gtp_genl_ops (NEWPDP, DELPDP, GETPDP doit/dumpit, ECHOREQ) use
> GENL_ADMIN_PERM. genl_family_rcv_msg() checks it like this:
>
> net/netlink/genetlink.c:
>         if ((op.flags & GENL_ADMIN_PERM) &&
>             !netlink_capable(skb, CAP_NET_ADMIN))
>                 return -EPERM;
>
> netlink_capable() ends up in netlink_ns_capable(skb, &init_user_ns, cap),
> so it needs CAP_NET_ADMIN in the initial user namespace.
>
> genl_bind() checks the new flag against the netns owner instead:
>
> net/netlink/genetlink.c:genl_bind() {
>     ...
>                 if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
>                     !ns_capable(net->user_ns, CAP_NET_ADMIN))
>                         ret =3D -EPERM;
>     ...
> }
>
> Take a gtp device in a netns owned by a non-init user namespace, where an
> init-ns daemon installs PDP contexts through GTPA_NET_NS_FD (gtp_find_dev=
()
> calls get_net_ns_by_fd()). gtp_tunnel_notify() multicasts to
> dev_net(pctx->dev):
>
>         ret =3D genlmsg_multicast_netns(&gtp_genl_family, dev_net(pctx->d=
ev), msg,
>                                       0, GTP_GENL_MCGRP, GFP_ATOMIC);
>
> Root inside that container would get -EPERM from GETPDP and the dump. It
> could still join the "gtp" group and receive every NEWPDP, DELPDP and ech=
o
> response notification. These carry the MS and peer addresses, the TEIDs,
> and the TID and flow label.
>
> When the UDP socket lives in the host netns, container root has no other
> way to see the TEIDs and peer addresses.
>
> Genetlink has no init_user_ns scoped GENL_MCAST_* flag. Making the two
> checks match would need a core change, or moving the ops to
> GENL_UNS_ADMIN_PERM if userns scope is the intended policy.
> net/ipv6/ioam6.c already pairs GENL_ADMIN_PERM ops with a
> GENL_MCAST_CAP_NET_ADMIN group in the same way.
>
> This patch does block fully unprivileged users. The commit message also
> says "in the user namespace owning the network namespace".
>
> Could the commit message say that the multicast check is still weaker tha=
n
> the GETPDP check?
>
Right, it should. v2 says it: the group check is still weaker than the
one on GETPDP, as genetlink has no multicast group flag for the initial
user namespace, and this fix blocks the unprivileged users.

pw-bot: cr
> >  };
> >
> >  static void pdp_context_delete(struct pdp_ctx *pctx);
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261021065750.2069795-1-anilkaushikwireless%40gmail.com
