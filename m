Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892626;
	b=vIaZ5+0cWZgfr/huR+P3K8l8hMQkKv6IyAgmwoXjRJfqo+0ZL7OZc8upCTCIYTNIkcQ4
	 DgD2HyFBvaJg7tPoWEfo6BUhpE3/cubWxDNwWPS9TXrsLItMmFlUpcvbSxSYGYklrtEGg
	 wTSgiAS28lD729P3FULRLfhnrSi4NaUS6mJQaBpL4SeZWorb9N4yoHNOaCPKw6gZU2Pc6
	 Nm8N1XRt4hSaZiAKCHSD4UUgtuic76DDsP7fT5fNqm0BZ3tgr+BhUzYMsEC/yoAICQBnQ
	 Z1QbOwhiiCVyODfzfZ8wwuxzC3UyMfEOo3EXqKLurw2iK2gc+xbyfqOAWq5SvCwYrSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z0DbPNMeG6nNdW76+j3b+tBCShft1G1Sg+ofOhCOv1c=;
	b=AE46SAZe+22hJXFMuE0GpWZQXV6mWfjECHacO0SGAMcG+xeIOywLNNcRQYT8Jj2wJ88A
	 Y9bcoUqRjazVN/RAo7Yw8+p1TiyeVj1QqAp6VoR0frOuHdpyVbQsJi69Ho5uG5Y27F7GC
	 yt9GF3uIeo7XhVTiD3/ASGYWPimrM8B1v96rgrhkXfvHZTc1IbzpWGjexocCXf+OLU/DA
	 JG34130SROYxxQRxk3b8RNMXulfC+4BS/qfCdcL5dhJLPOzFxOU6SEyCJaCXbGgVsm3Pu
	 o/vre7phDf4jYEmUN1NlGsjhme1yBsDpJhbbI65RrHS+ImEwewc9nBFceJuTX57PINQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=E+XD8tKL;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F819606EEAF
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F819606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=E+XD8tKL
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53644b28706so29214991cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892625; x=1794497425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0DbPNMeG6nNdW76+j3b+tBCShft1G1Sg+ofOhCOv1c=;
        b=E+XD8tKLAqSpIB2a3mjjEEIU6vYr6js7OISpKNQfZiTwkzvbaNFERfuOH9foiR7Rkn
         RijDr/vZA7jCDTsR0HBcj9XwLHv+OF8CMoWQ+7ABrTDnyU5WLt4Bu9Pv1H0ShwMknjti
         OL7tqa+xgGlq4IM3oaI/oW+p1AKnd4s0XE5L3C+lW11fGgar9B0yhPf5TnWAdqqquWq6
         LWHyacZ5KfRddK3VFkDpkSGbKrj6qCXjifrQDFq5rfVMIuwZgRLpo49k7VzJRRuI+41W
         B460uaCehqi3sEsMUhMAsDFrEXvFv3KY0ieHHYNbZWQ3fpzVomijycGmVSJ8h8fLdefw
         Qahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892625; x=1794497425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0DbPNMeG6nNdW76+j3b+tBCShft1G1Sg+ofOhCOv1c=;
        b=PhvNN9pBjU2flEZxpFF+V2Smbsr/anwDQpdzgfgMchBkFUQPfjPnBq+1awcwlyNhO1
         GqJeIr9Eqy75G4khFlb67YSethGBHHFs6BdXALGX/FPwfwok1sIz3FgfI5oaH61OoM9z
         ZqjA4ZFmQa5Ed5qWeOT7E7O1qeuL0ORja/bfOlFBZxsTrEmlUDbEV9LawadURtyYoKst
         femNvzVOyADR4P1xjUU6FkNzorzksGJwa1nhlU4G0sdI2YKe/gi1zByKGF8eq4ALR3Wc
         6fYMsma6cdSc9XjqHfedX/NbT68+XGV3lqQBkVoBHJDZw0l1kXuT/JwZ9SKFhtgzm0aE
         8lPg==
X-Forwarded-Encrypted: i=1; AKwUvBw8BZe3W48/9PxXGwQqOHPJwU6JFIuyCCT/mh5FY6F34z3skZP4wDLC9SKnQM1Dwu1Hcfk0JJPX/+URvrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8du3Aoj91+xhTmH8VFZRSMxGG8bITIGCWJgAToFT8eRheMhu+K
	nhZvd57w/JSsPclELbfnT71P9QVsVXPgmymoQVCNeYd1xc60P9+uSeuWpOh2LHYNbDs=
X-Gm-Gg: AYBFou0MFfXPl0PKDSokVu6/3PgtwlImgxwTJwAm6c6NaVHVHPDc3Z9yMLSloRl+HQH
	AAv6a9klq5azZFmcrHxDPq2UNBvyABeKPEdL18NEL8hP8Iu3x+M8UGpfzHUXyN//otpPaQY0pEI
	gLuXJU4DHq12n5Z0N5J+g8RqOWTrS1TA7KO36hFVf0rxMVETAp/0co5eM884sVNJNUrsi9E3Ecg
	nk4ifj0xk3Mxp9lLRsHEz9eAVblDYtagHDV5lVtlLssiKefO5lBcVk6T4f3zz1nne72lgzmXOKc
	s51yqbUC6sFHtgYjLMhFaEmcKLM5o2TYQHRH760IYtVtMP+92C8a5hbg9hBiD8t8DDsXcPzjKdu
	ityAcqg8YZVGqshgmIXP70E/9hIBLqXxrQ3Iu74Jh9iitLOFId/0yutXetPGfQSlP4lVuJccDHw
	SAUT1y+qquysU2/4KkTzdL/3he67mlTAGgTyVgcylRS5UiJ4csR4lPlf7u5l+PmphG2ssQwjV1y
	KeanSWRbLYDU4VvgoLcZKfwLXeq20QNsolJkT6ebN4OUpI6L2CMA3bzRldtmdBruxXkBoYrIXYa
	RYnvrc1DNN9tuar8HWHpkHB2Sg28Hz24iAnGp0RgvGWjnA==
X-Received: by 2002:a05:622a:550e:b0:536:691f:b7a7 with SMTP id d75a77b69052e-542b6972edcmr341696291cf.29.1793892624874;
        Thu, 05 Nov 2026 07:30:24 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10c49ab3sm53794761cf.19.2026.11.05.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:30:24 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:14 +0000
Subject: [PATCH RFC v3 82/90] net: use net_may() for raw and packet sockets
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
Message-Id: <20261105-b4-cells-v3-82-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=4356;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=3gXPfoooqpzhufGJ7QkT8q08tGiStjFRxFNh5oB2gRo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHBSOC7DHQO2uNe6YZUtz3e6beW/rb/2WbzhvN0wWQZ4G5jap5EeRGONpapQXrVIiVdVYDdAmKl
 C5eqo+dzeTgY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Creating an IPv4 or IPv6 raw socket or a packet socket requires
CAP_NET_RAW over the owner of the network namespace. So does sending
certain IP options and IPv6 extension headers from an ordinary socket.
Convert these checks to NET_RIGHT_RAW.

AF_XDP, LLC, NFC and IEEE 802.15.4 sockets are not converted.

No functional change.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/ipv4/af_inet.c     | 2 +-
 net/ipv4/ip_options.c  | 8 ++++----
 net/ipv6/af_inet6.c    | 2 +-
 net/ipv6/datagram.c    | 6 +++---
 net/packet/af_packet.c | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 7677b0343abd..b24b50e0098e 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -320,7 +320,7 @@ static int inet_create(struct net *net, struct socket *sock, int protocol,
 
 	err = -EPERM;
 	if (sock->type == SOCK_RAW && !kern &&
-	    !ns_capable(net->user_ns, CAP_NET_RAW))
+	    !net_may(net, NET_RIGHT_RAW))
 		goto out_rcu_unlock;
 
 	sock->ops = answer->ops;
diff --git a/net/ipv4/ip_options.c b/net/ipv4/ip_options.c
index 09d745112c15..c9ab57a6f1a8 100644
--- a/net/ipv4/ip_options.c
+++ b/net/ipv4/ip_options.c
@@ -393,7 +393,7 @@ int __ip_options_compile(struct net *net,
 					optptr[2] += 8;
 					break;
 				default:
-					if (!skb && !ns_capable(net->user_ns, CAP_NET_RAW)) {
+					if (!skb && !net_may(net, NET_RIGHT_RAW)) {
 						pp_ptr = optptr + 3;
 						goto error;
 					}
@@ -428,7 +428,7 @@ int __ip_options_compile(struct net *net,
 				opt->router_alert = optptr - iph;
 			break;
 		case IPOPT_CIPSO:
-			if ((!skb && !ns_capable(net->user_ns, CAP_NET_RAW)) || opt->cipso) {
+			if ((!skb && !net_may(net, NET_RIGHT_RAW)) || opt->cipso) {
 				pp_ptr = optptr;
 				goto error;
 			}
@@ -441,7 +441,7 @@ int __ip_options_compile(struct net *net,
 		case IPOPT_SEC:
 		case IPOPT_SID:
 		default:
-			if (!skb && !ns_capable(net->user_ns, CAP_NET_RAW)) {
+			if (!skb && !net_may(net, NET_RIGHT_RAW)) {
 				pp_ptr = optptr;
 				goto error;
 			}
@@ -530,7 +530,7 @@ int ip_options_get(struct net *net, struct ip_options_rcu **optp,
 		kfree(opt);
 		return -EINVAL;
 	}
-	if (opt->opt.srr && !ns_capable(net->user_ns, CAP_NET_RAW)) {
+	if (opt->opt.srr && !net_may(net, NET_RIGHT_RAW)) {
 		kfree(opt);
 		return -EPERM;
 	}
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index a9b8b4b42a1a..03a630b92680 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -164,7 +164,7 @@ static int inet6_create(struct net *net, struct socket *sock, int protocol,
 
 	err = -EPERM;
 	if (sock->type == SOCK_RAW && !kern &&
-	    !ns_capable(net->user_ns, CAP_NET_RAW))
+	    !net_may(net, NET_RIGHT_RAW))
 		goto out_rcu_unlock;
 
 	sock->ops = answer->ops;
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index 191c9733ff9f..3d3e9fd4443a 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -912,7 +912,7 @@ int ip6_datagram_send_ctl(struct net *net, struct sock *sk,
 				err = -EINVAL;
 				goto exit_f;
 			}
-			if (!ns_capable(net->user_ns, CAP_NET_RAW)) {
+			if (!net_may(net, NET_RIGHT_RAW)) {
 				err = -EPERM;
 				goto exit_f;
 			}
@@ -932,7 +932,7 @@ int ip6_datagram_send_ctl(struct net *net, struct sock *sk,
 				err = -EINVAL;
 				goto exit_f;
 			}
-			if (!ns_capable(net->user_ns, CAP_NET_RAW)) {
+			if (!net_may(net, NET_RIGHT_RAW)) {
 				err = -EPERM;
 				goto exit_f;
 			}
@@ -957,7 +957,7 @@ int ip6_datagram_send_ctl(struct net *net, struct sock *sk,
 				err = -EINVAL;
 				goto exit_f;
 			}
-			if (!ns_capable(net->user_ns, CAP_NET_RAW)) {
+			if (!net_may(net, NET_RIGHT_RAW)) {
 				err = -EPERM;
 				goto exit_f;
 			}
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index cf6429f09477..006349f214e6 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -3417,7 +3417,7 @@ static int packet_create(struct net *net, struct socket *sock, int protocol,
 	__be16 proto = (__force __be16)protocol; /* weird, but documented */
 	int err;
 
-	if (!ns_capable(net->user_ns, CAP_NET_RAW))
+	if (!net_may(net, NET_RIGHT_RAW))
 		return -EPERM;
 	if (sock->type != SOCK_DGRAM && sock->type != SOCK_RAW &&
 	    sock->type != SOCK_PACKET)

-- 
2.55.0

