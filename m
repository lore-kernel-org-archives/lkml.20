Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892605;
	b=vK81PMEH4fcBZZVfEfIGK/wKiMpHmG0o4l9tIkK4AmV3FiWa8sSYOhkdxw7tOwUikZWZ
	 HV17a1Ggf2KEIszZZi2H9o9YW1cXWTVaS9JCoCRf+1lvO2Ld+vN3MAL4chKP8jNDirznx
	 Z9MNYRl8hW4rQ93gVtLHbZxvRfTnibfSGiluo1Sx+JiRMyGsAVpgMo6DmLbeKG2AXD5qr
	 zPEjX45at1EZJ1eBK6C4ofM8OVxGze6dCmpSoBxzzTACwbYUuW/Nywz1y+dxtCjhn2bon
	 not/70tjohEC3qL/GFNihvC/04JsGBChkfeizXn9+JfqkvpapO72Oghx0cJA67qoXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=H7D7yhropaYIP0/pL9q+MsUBGzWnLUACI4oHFA7OPZE=;
	b=MruGMU74bHZcke+5WfcOTQEJuJUQtv/7zxG+GXEiNK3qq6/mBzTCYJxS+DkYkoxazkCd
	 slXTI4yeGydwMl36WsEGdn7D34/pzfQzCn7erTKIAAa6rDMYEHATKRTkUFKoosrVr6rSR
	 vlyJ4zv566yk5tKULwsTtpgBBpQQ55NBWbUoKgnYZMIZQvr5/HmJ5w+675EOJMsxtcCGj
	 93jowXMP6nCqTf+qhDGxgx5iPg2eBkc5ZpJ4pOhZdIl6/mbHvpAp/1EpnJBgGU7Xul6yU
	 MmnTn+jSqjyMTzflabjgs/ak5TTJ4RPdy3HHoz3HRD+MFKtkh8ve4YfNd13xP3FA9GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=iGXHVwdK;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAED606D838
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEAED606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=iGXHVwdK
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eae1276409so664758e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892604; x=1794497404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7D7yhropaYIP0/pL9q+MsUBGzWnLUACI4oHFA7OPZE=;
        b=iGXHVwdK2OyUuEwtigKed6XUtBXEKdT+3EtKeX0rNHKNR++WsFzSY7NMkcfCXeU00V
         K8DwTOnEnGKnNeg/VKgGYBzML07Q0jeoZ0tKU0z2CTsdL3YXVsVCgTax4hbO3fT93K39
         n4BSUKC920c5bMCqSevbL6uK+8BaSjQfUol6/pMo6YJo8DDo/FpuNLdWj9DMyY8T404u
         9llPU3/5AOk9kMD9zPMR4mq5GrsYJE1yxcFxUkj2wNR4mQ0qHgbtE7rCKmDz0SzMUiqP
         QcKecp+nfCPFGAt9jFhqcDQ3hEsy3EASWT9XOrHlcaxbdVKQOuVpobNF8PRyX/+VU6JD
         nx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892604; x=1794497404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7D7yhropaYIP0/pL9q+MsUBGzWnLUACI4oHFA7OPZE=;
        b=bnN9Tbt06T+E+LVrEgQ4CVyzwFENt4DdUBNh+e58xgpeVXrJ5EgottdjgKswyJCXbl
         uuRhaAUaOZ1qBZlSFO6wIHF0HwOY/h4EW6xkQfFq/zncekcURzzjcQt7RaWrUlUAwHKH
         VrRcmlrSF1GQfpacUxTeyKFUDRehQ7ykQbkYVY24wHCc14YmasI7Llm7XBQ9vFeJoAMR
         U0M6RCypVkjWD7tMdxZmCAkRT7XJ0qfHVhbjX2Ydths68RHzpp3bMmpa5a17r+ENOBfg
         MHmuncyFiHHKM1uRhQirQ+gMYwrb+0NqWmGugYpHoEk7SIyqab9bRneZ5IFXBgwEVq4J
         AaFg==
X-Forwarded-Encrypted: i=1; AKwUvBzqFkM/fj/aBn0BRD8odb/qUwCyV7WUquos9YDkVaZpDsdqNq3v82wmVFaepQCs+IQ/5NU+X2WBcxm+0HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uxy89cgobSGKoANcoeQvsWFUBYupL1K0XVD6oUH93S3jnLO/6
	x1lS7ucGdJFyG2K8CXxt2+r9XbN0Nrttgm0PkXc2TlwektBwVrF2JGnADzcjJV/IB/s=
X-Gm-Gg: AYBFou0AHvvz5HbTlhSNDMSqTNpH+xRce+3pV+yOa5+TPs1TP5T6NPeJ3Tqfe9P/LQK
	V1VIkV2kJecqFfH/PD2eBRBB0eo82Tts74fLx558+xRu9l52DE95IovKwoaj71rMqfPF4eJccMK
	JYN5glG/AtWcQRMdv3qXCdinqxkdNUU3JetRuXuVxJwCihiD+dnWy6OUiUbM3Ic475jYWCibm56
	sG0sNRqGosG3dnkrTdjRA0vxfbVlNtcELDBTsRquaL33kK+cyQ5nrKcbcmhN7/gjfp1o8x7JohE
	M7REfF8bHgv2PsbIGUZULNQ6tpDEp4Vy2Vj9K6UdhnUfHroPX+PUqoGU5XyyOZLqmnd9XEB0sMd
	r+64z6mB+geoemj3rz6Mzi1knPx9+AUvumiXKDep2a/6s104GYYIveKs1V2zibugZzHmnTPZ4IR
	kRGCppK146AT1UwDVoGpDGnmcVctAeCrAvNr2GgyEun0pVSYCIY36jHyL14uHIVeG/RJIUSHxdE
	yOiA8Mqei9HFS21ovN9p66o4GhamQjwE2kR9QPvi75NPD2emQ59rRBt3cCCevrbOaGOtuUUYmfr
	vJvQAYrwzxrFrs+/rPhfYXCubUuHJ8w=
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d072baa484mr7972673137.9.1793892603471;
        Thu, 05 Nov 2026 07:30:03 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d775aesm4495753e0c.4.2026.11.05.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:30:02 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:13 +0000
Subject: [PATCH RFC v3 81/90] net: use net_may() for privileged socket
 options
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
Message-Id: <20261105-b4-cells-v3-81-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=4991;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=eW6u9uQ0Wsmh3Os08bQUEqftrsYKdy1N88JIsBJuoEc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QL8/5Krgo+1D1BousniGNKt/9o0yYC27T0CQ8djI/9gfhK/kChE2x/kdhPQZeiWy4jXRQ+tiqJP
 duiCL/Mg9SQY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Some socket options affect how the network namespace treats packets, not
just the socket, and require a capability. Convert their checks.

These accept CAP_NET_ADMIN or CAP_NET_RAW today, and now accept
NET_RIGHT_SOCKOPT or NET_RIGHT_RAW: SO_MARK, both as an option and as a
control message, SO_PRIORITY outside of the unprivileged range,
IP_TRANSPARENT and IPV6_TRANSPARENT.

This one requires CAP_NET_ADMIN, and now NET_RIGHT_SOCKOPT: SO_TXTIME with
a clock other than CLOCK_MONOTONIC.

These require CAP_NET_RAW, and now NET_RIGHT_RAW: SO_BINDTODEVICE on a
socket that is already bound to a device, and the IPv6 hop-by-hop and
destination options.

Not converted: IP_IPSEC_POLICY, IP_XFRM_POLICY and their IPv6
counterparts, and SO_ATTACH_FILTER on a TCP socket.

No functional change.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/sock.c          | 16 ++++++++--------
 net/ipv4/ip_sockglue.c   |  4 ++--
 net/ipv6/ipv6_sockglue.c |  7 +++----
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 352310066e35..ba870aa6b967 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -462,8 +462,8 @@ static int sock_set_timeout(long *timeo_p, sockptr_t optval, int optlen,
 static bool sk_set_prio_allowed(const struct sock *sk, int val)
 {
 	return ((val >= TC_PRIO_BESTEFFORT && val <= TC_PRIO_INTERACTIVE) ||
-		sockopt_ns_capable(sock_net(sk)->user_ns, CAP_NET_RAW) ||
-		sockopt_ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN));
+		sockopt_net_may(sk, NET_RIGHT_RAW) ||
+		sockopt_net_may(sk, NET_RIGHT_SOCKOPT));
 }
 
 static bool sock_needs_netstamp(const struct sock *sk)
@@ -642,7 +642,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 
 	/* Sorry... */
 	ret = -EPERM;
-	if (sk->sk_bound_dev_if && !ns_capable(net->user_ns, CAP_NET_RAW))
+	if (sk->sk_bound_dev_if && !net_may(net, NET_RIGHT_RAW))
 		goto out;
 
 	ret = -EINVAL;
@@ -1540,8 +1540,8 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 		break;
 
 	case SO_MARK:
-		if (!sockopt_ns_capable(sock_net(sk)->user_ns, CAP_NET_RAW) &&
-		    !sockopt_ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN)) {
+		if (!sockopt_net_may(sk, NET_RIGHT_RAW) &&
+		    !sockopt_net_may(sk, NET_RIGHT_SOCKOPT)) {
 			ret = -EPERM;
 			break;
 		}
@@ -1649,7 +1649,7 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 		 * scheduler has enough safe guards.
 		 */
 		if (sk_txtime.clockid != CLOCK_MONOTONIC &&
-		    !sockopt_ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN)) {
+		    !sockopt_net_may(sk, NET_RIGHT_SOCKOPT)) {
 			ret = -EPERM;
 			break;
 		}
@@ -3172,8 +3172,8 @@ int __sock_cmsg_send(struct sock *sk, struct cmsghdr *cmsg,
 
 	switch (cmsg->cmsg_type) {
 	case SO_MARK:
-		if (!ns_capable(sock_net(sk)->user_ns, CAP_NET_RAW) &&
-		    !ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
+		if (!net_may(sock_net(sk), NET_RIGHT_RAW) &&
+		    !net_may(sock_net(sk), NET_RIGHT_SOCKOPT))
 			return -EPERM;
 		if (cmsg->cmsg_len != CMSG_LEN(sizeof(u32)))
 			return -EINVAL;
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index e06c1f48ecad..cc9e0bc952f2 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -1008,8 +1008,8 @@ int do_ip_setsockopt(struct sock *sk, int level, int optname,
 		inet_assign_bit(MC_ALL, sk, val);
 		return 0;
 	case IP_TRANSPARENT:
-		if (!!val && !sockopt_ns_capable(sock_net(sk)->user_ns, CAP_NET_RAW) &&
-		    !sockopt_ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
+		if (!!val && !sockopt_net_may(sk, NET_RIGHT_RAW) &&
+		    !sockopt_net_may(sk, NET_RIGHT_SOCKOPT))
 			return -EPERM;
 		if (optlen < 1)
 			return -EINVAL;
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index 4b3536571c98..d2880493d33b 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -304,12 +304,11 @@ static int ipv6_set_opt_hdr(struct sock *sk, int optname, sockptr_t optval,
 {
 	struct ipv6_pinfo *np = inet6_sk(sk);
 	struct ipv6_opt_hdr *new = NULL;
-	struct net *net = sock_net(sk);
 	struct ipv6_txoptions *opt;
 	int err;
 
 	/* hop-by-hop / destination options are privileged option */
-	if (optname != IPV6_RTHDR && !sockopt_ns_capable(net->user_ns, CAP_NET_RAW))
+	if (optname != IPV6_RTHDR && !sockopt_net_may(sk, NET_RIGHT_RAW))
 		return -EPERM;
 
 	/* remove any sticky options header with a zero option
@@ -405,8 +404,8 @@ int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		inet_assign_bit(FREEBIND, sk, valbool);
 		return 0;
 	case IPV6_TRANSPARENT:
-		if (valbool && !sockopt_ns_capable(net->user_ns, CAP_NET_RAW) &&
-		    !sockopt_ns_capable(net->user_ns, CAP_NET_ADMIN))
+		if (valbool && !sockopt_net_may(sk, NET_RIGHT_RAW) &&
+		    !sockopt_net_may(sk, NET_RIGHT_SOCKOPT))
 			return -EPERM;
 		if (optlen < sizeof(int))
 			return -EINVAL;

-- 
2.55.0

