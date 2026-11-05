Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892498;
	b=raUvqAN6oO+e+8b7h5eCHErj9HoKR4VMISnTVV8RzD/YycNExaqIMPmhg8iOpXIhEtaR
	 FtnfmrqMWg2k7lT2rqgbJ9uWshpKHaniB2K4Ow3ydtbsK2mBb3MaUhfoRhDoxWeKYt8Ax
	 JC7lbYk6y4sbn+g/yDErNZIQeZLdyLDOji92CB1RPJ/23BXu7+5VrD4akyc/5PoG+HjlO
	 tqx266/Fn5TjfC//CUIP5q1uhaYNCoxd5pTHr0QCipxIy1Ic8dOdeZiylEg4WiSIWSZXi
	 HgeRxlb/aWBmXfUzpUGUo+Ie2sgyJxHGwGQu3jh7+CRsGZ29b/Afhkp2TIT4FmZb5hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Kz0PHWKcByhyF/gvlB7if/6abGMtYwQ80lEx67ATnrg=;
	b=cvaRlR5IJlJX4yEjQxOHW54qHARH4NjO1hzn70dih/rSmQdVj7oqFjSSNtBLUztyw57j
	 RM2Cng6nI+HNcehQmDW10ELEKbrjfTwfE6Qlt0zaT6hfRaa/vf2cwI8BeRn7+mHKXVd3V
	 R3XUZ2HY9DlK+xKdIKHi/H2nTeK87b2mNBjreKF8lpRIiDcOGTJj3wCL3cCIv25xJmCb1
	 QAlR5z6IRwBuneoKw5uqQJ4AdvsBjYlBcVXA6p24V9ml/vcK8NNZTX1b1sVoCIi0yOSuV
	 zP6GZjOYJvuA6vNP50BIFiJYmuD/59VtWQRAikoxoLNfXvWZFWz0aAClnE6kfZC0h4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=okYjACgm;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C597B606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C597B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=okYjACgm
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91c79a9a739so27884736d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892497; x=1794497297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kz0PHWKcByhyF/gvlB7if/6abGMtYwQ80lEx67ATnrg=;
        b=okYjACgm7VGSbm5mvBeAcVOR5vXf+V9s+Un2s5ENVQC1OmFxAFRjqcOsvZBMPLl3iQ
         o3RBzyHNwWHhgm595K0sbVAhhgOWOQRS3VsbRZ1qif53GmJuhoSXYzYEc4ir6RGvyktp
         Q5KV3BaeVpUw3pT9UhvPhDWqQg+YvuOMaCtx6lipyUn0nFQmqN2S3Al2j9o4v0QXYqRK
         qO5e62lvsXDauNRhQExOuf4bqvojvnGEcJNL9NcsXixjZaG040QD/gvEsQiiP0cXScP0
         oMe/ZpQ7AEJGZtO9/8EF84JyfEXE8s4UfqExcsJ0iz3jZ2cOWrt9NeT8iD6G0KLcq8xR
         9HxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892497; x=1794497297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kz0PHWKcByhyF/gvlB7if/6abGMtYwQ80lEx67ATnrg=;
        b=NjjYLWSLObEE/DHmV8pN4i5ajNnSvdmu3bixCZPur+Vr10dO7qPoTibmFU4EzfPYLm
         mwaeXb2QmCyrps2SsO+VIAmXBDqrTGX9gqAzOt3OOvHAK8yYHAZLWdrEmoxa2tzKSEUb
         uagfPEEPIxK5KLdfrHz9voGnJFC7b0TmftNSIgcVysaQBMb/n8LgTxWWJbhxBT9CuBnU
         G9bJbq6awxf9jzufKtmrGiEex0yqU5c9Fd+BmBogEVUep7E3cvE9FQ1rU82Bx59tUV53
         uIOT3p1FLQgFBubujRrNTB8e6D55lB2HKrUdZMfdyoscNQDbQD8BpoxGVj7iu1w6BxZ7
         2mVQ==
X-Forwarded-Encrypted: i=1; AKwUvByyA39YScVTGDMrpfH6i5lEDJ/f7fJe2itI9Ddc3FHZR/RF4oToYZK3F9tSPe2QZh0AuwI0JNrJxuXTuww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GkteVmtTyQgv7iMTl6dlehUjAMbt+pERJpzqS+KxW1tOsihus
	o+S3/QaN6bNvr4cKRkiFpE4PfYSwCeFfQgVNwIj6l/OPUyllS9cN0RNQeo7CpJzgpkw=
X-Gm-Gg: AYBFou0S82QjVFnu4mnUl1IXNpPnqwj+/+XgwAQXUx5KcKMcbhMr2du9xwMZ9Bdgcai
	rjHaOJ9CUKDCXUdujVYjzQeGlV/xbl2yiia0Cz0UrnwXpXO1VjmJsPJpiWcMUEqcUp0Dm5IVXzd
	zpZPLC8g3VyAPqe94r9KxyQqnVMfFViasa2zX+REjYRIK01bTd0yGVP8lXOfiFDhwgmWROf+abz
	oAWkXUcwf1Vrv3t9daflDsuKIH8tQqJRJwLO355hVldCPwczsmvJuxv9VfKwWuFmILKP8kXu8GD
	TyacrpUGyJHdGW9qTndm+j2vZ5tmxasH3OO9+/tWcOALwRFVskEN4t6Vd+XiVaX80t+EJmDeskO
	dJnhSbkmn+CCPP+sMODU79HggrIQNUn98MFHajtwGstwrayo9de3fQ+6AuYjAlyriI35J2WQfGV
	aEz6ycBeYjanvILUO+xS9EDoaat02DrTmPF9I3hfoYHOJaHyAtWI3M13nkvBP43fhg3EN1lbybJ
	Gaxg/nkxreEImwb6Mw+hxjCMDT8Oks0+wRmLh5vu6ThZNjGPNVw8fca1IfQG3TLEvvueKiJAXxU
	mtwzNPPSA/BnzbBmK0f56baeMCLXOezu9BY494aFq2kvs3oJ7FaKMwcyZzrNjsh9Ioc=
X-Received: by 2002:a05:620a:6191:b0:93f:1437:2e58 with SMTP id af79cd13be357-944216ee050mr3073697185a.56.1793892496646;
        Thu, 05 Nov 2026 07:28:16 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d48694cfsm487038585a.36.2026.11.05.07.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:28:16 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:08 +0000
Subject: [PATCH RFC v3 76/90] rtnetlink: use net_may() for requests that
 change state
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
Message-Id: <20261105-b4-cells-v3-76-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=5219;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=XoA8BbdVLFstFTRRQB2rIoFN5ABiwloSZ4q7Qt5LBx8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIpXDyOZBYdzTDWL1l/kopzbAXnbdbXC+LWnZGkccvvay4VHDUbhdHJ+jo4myg4NSNTsIFqt2J0
 pmcbwSrC8BgM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

rtnetlink_rcv_msg() has a single CAP_NET_ADMIN check for every request
that is not a GET. Pick the right from the message type instead:

  NET_RIGHT_LINK      SETLINK, NEWLINKPROP, DELLINKPROP
  NET_RIGHT_LINK_NEW  DELLINK
  NET_RIGHT_ADDR      NEWADDR, DELADDR
  NET_RIGHT_ROUTE     routes, rules, neighbours, nexthops
  NET_RIGHT_TC        qdiscs, classes, filters, actions, chains

All other message types keep the plain capability check.

RTM_NEWLINK either changes an existing device or creates a new one, and
that is only known after __rtnl_newlink() has looked the device up. So
rtnetlink_rcv_msg() accepts either NET_RIGHT_LINK or NET_RIGHT_LINK_NEW
for it, and __rtnl_newlink() then checks the one that applies.

rtnl_link_get_net_capable() checks the network namespace that the request
names as its target. That is the namespace of the sender if the request
names none. Convert it as well, and keep checking the target namespace.
All of its callers pass CAP_NET_ADMIN, so drop that argument.

No functional change. Every right used here maps to CAP_NET_ADMIN over the
owner of the same network namespace as before.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/rtnetlink.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e141340172ce..df97309a9622 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -2737,7 +2737,7 @@ static struct net *rtnl_link_get_net_by_nlattr(struct net *src_net,
 
 static struct net *rtnl_link_get_net_capable(const struct sk_buff *skb,
 					     struct net *src_net,
-					     struct nlattr *tb[], int cap)
+					     struct nlattr *tb[])
 {
 	struct net *net;
 
@@ -2745,7 +2745,9 @@ static struct net *rtnl_link_get_net_capable(const struct sk_buff *skb,
 	if (IS_ERR(net))
 		return net;
 
-	if (!netlink_ns_capable(skb, net->user_ns, cap)) {
+	/* Where the device is, or where it is to go. */
+	if (!netlink_net_may(skb, net, NET_RIGHT_LINK) &&
+	    !netlink_net_may(skb, net, NET_RIGHT_LINK_NEW)) {
 		put_net(net);
 		return ERR_PTR(-EPERM);
 	}
@@ -3610,7 +3612,7 @@ static int rtnl_setlink(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (err < 0)
 		goto errout;
 
-	tgt_net = rtnl_link_get_net_capable(skb, net, tb, CAP_NET_ADMIN);
+	tgt_net = rtnl_link_get_net_capable(skb, net, tb);
 	if (IS_ERR(tgt_net)) {
 		err = PTR_ERR(tgt_net);
 		goto errout;
@@ -4109,6 +4111,11 @@ static int __rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
 		dev = NULL;
 	}
 
+	/* A device that is there is changed. One that is not is made. */
+	if (!netlink_net_may(skb, net, dev || !(nlh->nlmsg_flags & NLM_F_CREATE) ?
+			     NET_RIGHT_LINK : NET_RIGHT_LINK_NEW))
+		return -EPERM;
+
 	if (dev)
 		return rtnl_changelink(skb, nlh, ops, dev, tgt_net, tbs, data, extack);
 
@@ -4220,7 +4227,7 @@ static int rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
 		}
 	}
 
-	tgt_net = rtnl_link_get_net_capable(skb, sock_net(skb->sk), tb, CAP_NET_ADMIN);
+	tgt_net = rtnl_link_get_net_capable(skb, sock_net(skb->sk), tb);
 	if (IS_ERR(tgt_net)) {
 		ret = PTR_ERR(tgt_net);
 		goto put_net;
@@ -7067,6 +7074,49 @@ static int rtnetlink_dump_start(struct sock *ssk, struct sk_buff *skb,
 	return netlink_dump_start(ssk, skb, nlh, control);
 }
 
+/* May whoever sent a request that changes something do so? */
+static bool rtnl_may(const struct sk_buff *skb, int msgtype)
+{
+	const struct net *net = sock_net(skb->sk);
+
+	switch (msgtype) {
+	case RTM_NEWLINK:
+		/* Which of the two it takes, __rtnl_newlink() finds out. */
+		return netlink_net_may(skb, net, NET_RIGHT_LINK) ||
+		       netlink_net_may(skb, net, NET_RIGHT_LINK_NEW);
+	case RTM_SETLINK:
+	case RTM_NEWLINKPROP:
+	case RTM_DELLINKPROP:
+		return netlink_net_may(skb, net, NET_RIGHT_LINK);
+	case RTM_DELLINK:
+		return netlink_net_may(skb, net, NET_RIGHT_LINK_NEW);
+	case RTM_NEWADDR:
+	case RTM_DELADDR:
+		return netlink_net_may(skb, net, NET_RIGHT_ADDR);
+	case RTM_NEWROUTE:
+	case RTM_DELROUTE:
+	case RTM_NEWNEIGH:
+	case RTM_DELNEIGH:
+	case RTM_NEWRULE:
+	case RTM_DELRULE:
+	case RTM_NEWNEXTHOP:
+	case RTM_DELNEXTHOP:
+		return netlink_net_may(skb, net, NET_RIGHT_ROUTE);
+	case RTM_NEWQDISC:
+	case RTM_DELQDISC:
+	case RTM_NEWTCLASS:
+	case RTM_DELTCLASS:
+	case RTM_NEWTFILTER:
+	case RTM_DELTFILTER:
+	case RTM_NEWACTION:
+	case RTM_DELACTION:
+	case RTM_NEWCHAIN:
+	case RTM_DELCHAIN:
+		return netlink_net_may(skb, net, NET_RIGHT_TC);
+	}
+	return netlink_net_capable(skb, CAP_NET_ADMIN);
+}
+
 static int rtnetlink_rcv_msg(struct sk_buff *skb, struct nlmsghdr *nlh,
 			     struct netlink_ext_ack *extack)
 {
@@ -7093,7 +7143,7 @@ static int rtnetlink_rcv_msg(struct sk_buff *skb, struct nlmsghdr *nlh,
 	family = ((struct rtgenmsg *)nlmsg_data(nlh))->rtgen_family;
 	kind = rtnl_msgtype_kind(type);
 
-	if (kind != RTNL_KIND_GET && !netlink_net_capable(skb, CAP_NET_ADMIN))
+	if (kind != RTNL_KIND_GET && !rtnl_may(skb, nlh->nlmsg_type))
 		return -EPERM;
 
 	rcu_read_lock();

-- 
2.55.0

