Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892519;
	b=OvTkiH5uVC4AWxKYZH9DcBU1m4z2/H7o+2vWE5G2x7uFcgZOvJGt38IRleLYoQVBG7lR
	 aIj5kTVzkdxbQt/B29y+WvYSMyLy66SQGgyDCWiR/dI/fSC9kmnglQeEGM6SPx2h7GU2g
	 8CvSD2Y06hMtPSRh3ie84dsrSpT963AjuA5E1n9NgsFX+2rWKstZL1A//NIcrpYQ8o1Ld
	 2ZjbF9Y0Xvye04lPnN3E0ALYFrwSAV6UgtmCofM1SgcBxX29vCxlaFVsv/kzTbURlZ/sl
	 b9QxP1PLoznyrEgmQKTSAH8ZmS26iYQqLeQs7xCFIsKR5YEOr7la8q1b7YLCCyo6cAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KLPcNV9aUbDLiPnscawDJ9DlhHyhT9MXerP8+aTsTTg=;
	b=qCGTr0x3yxr5sTBDaPSZSAZZ8J3b5SxnhpD+Kj11RoQeRPP7XG5oGhcmw23trZN0fYN3
	 DE/b2URw8NbTwYaTRtLWGyHuBMnFZTdM+ykZBM+1bSpRJijT9ZJMvR6CxmZMOSJRqz1E9
	 wbAzKakper6ui/Z33vmEymqU3jTSzmRBK6cAFXdLCx0IRKDNnaGLdbPSs7wMcnUtOTo06
	 2K3RELvI0TRMyr4uW4+rPvHb0D9wvKzn3g+1YlfDlX4L10vnDlvYJSmgmFoYOsGTKyUIG
	 VIZKAi0feJkMN8waztdbat/Rk1kHcayOXMeD6EKFl/0/2UNm53Pl21ht56NpBLJCt4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=nDvoAKD7;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F50F606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F50F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=nDvoAKD7
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-536717a4d83so17031511cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892518; x=1794497318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLPcNV9aUbDLiPnscawDJ9DlhHyhT9MXerP8+aTsTTg=;
        b=nDvoAKD74JrwtH/SpvIvR9HqdawNMNOudq2c1aLjeVyQHb8kYx/T5JZEbF1CoSCdG/
         phXlTdkY9vJ63j6mmfIUMXlLMA4fdMj3u6ECqUP+gF4Q7ByuKobzxu4TSvbZgQ+/B41r
         tqPZYtKXcx0/LOt2JTRdVx9Qf+O9DQngL7PY0n0NHyOhb+4VXHWhua8rRFwKU2xewmxZ
         ll2Vfw+VYzZJQkY4jrtdUWtkYLgKpQtQzzSCUAW/BjS35Q5enP4TrLJ2P3uSVP2p9kaI
         uIk8NNxPHzeQ93xmb4QYJCC60EcTEpJ02CRhh6jktWnBr5Ydo0A0f0oGYSVbebbDxpU0
         vSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892518; x=1794497318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLPcNV9aUbDLiPnscawDJ9DlhHyhT9MXerP8+aTsTTg=;
        b=fzuEKGu+CTaPs4BuNfkkgMfSlRe9CaeR2+ij6PRaSkqFhu+KAJF630RxHbkeKigp0F
         KoWdh6/5x4iCoRHu2ItoCDn418IhO0e2ysbxX27rM/RA+HCZikxA0Q45zFSVDyAKYuky
         ZnbuvE4I1raATjQ2UUo+t63sFqhy/Gi8uOIrPActXAPbk1rumQMITbPPGL5VLmpW83no
         rthSPMJ26J1WLMiwoLHZhm/5+4m7gbtAjDJjiHhM/McCSE0J9BGxLFBElmF2FMvFQ+DD
         +/dYJWvM9xIIYRxp0eeWatt08IpF+qZ9ed2t3lAkBErBu22fguASQbL1d6mWlgVfbYko
         S+lg==
X-Forwarded-Encrypted: i=1; AKwUvBxLDAB3Y2ZR7Sv85P1QqgSD7CSitZ4geoHzUGFy9LVG8HEQtsXgUKbMNZbu2ILGaG8kHjsB+P8Cbb487vA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zWKYdXZQ7gTY/XwNIRSaq5On7lQhl+Df/E+qd+vr4Ouj+PNtm
	uCWA4fJLuzSA7rlVT0ipVp1156A6kJnNpd2Ltzd4ovvP1qLEbWsk8aW6NVfK2J6prKw=
X-Gm-Gg: AYBFou2x7mxVA0qOQiXeff3PlLfPaXpaaPeycKziGV0BULdihiY69Ab8qe5KngXsh4V
	zceSfaZ9NJpEJ1Ni0Ap8lut9p3EVbVRm7WVJM6TwkYxnWAgYWWt2Zc4vgmKecp4pnoUCIMcTVvv
	G1HTzxdFo8uc5W7qXbneQf2L3ZmOPCkR527px2S0HzOJfuYh6tp2Tjex80yQG9D0YA6G6PtwHZg
	COtDOZ7tZOyEYcDBJR6UFZJBOSdtrWFGbLR6DZmfzoOaOfxBh5afvSuxBp43NZ81nnRCI5BPfdW
	2XRNl5/E30nqUA3KxxYXxwvJI5iHPiZgqZV+3FN+dBd2VeUnpDRrTvji8U0okqmgPX7IOCHcnPj
	/KKMHCLJNY8hYWYvxBbHSLyiQzm3G/zVQKFc12ncOF2vs/U7BaqpxiQIBEvLCfS3kA15Qohni9J
	xmt/5NwtdOTgGN/1vsawbpFUazT/ShnHKAch5Eno6vBn3WMaN5wMuRPacqXgImCEyrD8EVozTxf
	fKssNkP8jKKen/eDSp1oom3l0AXAe+zMwFpfoi2AaKQUhQQvVp9f+Til56CcH6gExDejG4VIslA
	6AbjgEFcCC5dQNsJI9BCUAg/KbwuN1zIT8oNrDNlBoXv8g==
X-Received: by 2002:a05:622a:4209:b0:536:6488:e7e4 with SMTP id d75a77b69052e-542b6a72b3cmr336045591cf.13.1793892517845;
        Thu, 05 Nov 2026 07:28:37 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54d970216f6sm6703391cf.25.2026.11.05.07.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:28:37 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:09 +0000
Subject: [PATCH RFC v3 77/90] net: use net_may() in the configuration
 ioctls
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
Message-Id: <20261105-b4-cells-v3-77-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=4548;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=aroO3MBSFDs6m6+Du222Gk5S4GUIEG4XnIpJZgS36no=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJO6v6Qow2FGiwDal0iPWoEjeBVIuqkZgWf6GgjIBBErGi0Ifpq9yV4cmB+MsCBn1G+9E/WNMVW
 SnRZ1e7wHMgA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The ioctls that predate rtnetlink have their own CAP_NET_ADMIN checks.
Convert them:

  NET_RIGHT_LINK   the device ioctls in dev_ioctl(), and SIOCSIFFLAGS in
                   devinet_ioctl()
  NET_RIGHT_ADDR   the address ioctls in devinet_ioctl(), and
                   addrconf_add_ifaddr() and addrconf_del_ifaddr()
  NET_RIGHT_ROUTE  SIOCADDRT and SIOCDELRT for IPv4 and IPv6, and SIOCSARP
                   and SIOCDARP

No functional change.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/dev_ioctl.c    | 4 ++--
 net/ipv4/arp.c          | 2 +-
 net/ipv4/devinet.c      | 4 ++--
 net/ipv4/fib_frontend.c | 2 +-
 net/ipv6/addrconf.c     | 4 ++--
 net/ipv6/route.c        | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/net/core/dev_ioctl.c b/net/core/dev_ioctl.c
index f6029f60c1dc..caec8909b0c2 100644
--- a/net/core/dev_ioctl.c
+++ b/net/core/dev_ioctl.c
@@ -757,7 +757,7 @@ int dev_ioctl(struct net *net, unsigned int cmd, struct ifreq *ifr,
 	case SIOCGMIIREG:
 	case SIOCSIFNAME:
 		dev_load(net, ifr->ifr_name);
-		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		if (!net_may(net, NET_RIGHT_LINK))
 			return -EPERM;
 
 		rtnl_net_lock(net);
@@ -799,7 +799,7 @@ int dev_ioctl(struct net *net, unsigned int cmd, struct ifreq *ifr,
 	case SIOCBONDSETHWADDR:
 	case SIOCBONDCHANGEACTIVE:
 	case SIOCSHWTSTAMP:
-		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		if (!net_may(net, NET_RIGHT_LINK))
 			return -EPERM;
 		fallthrough;
 	case SIOCBONDSLAVEINFOQUERY:
diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
index 1ca4ced280ae..934eead1dc51 100644
--- a/net/ipv4/arp.c
+++ b/net/ipv4/arp.c
@@ -1285,7 +1285,7 @@ int arp_ioctl(struct net *net, unsigned int cmd, void __user *arg)
 	switch (cmd) {
 	case SIOCDARP:
 	case SIOCSARP:
-		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		if (!net_may(net, NET_RIGHT_ROUTE))
 			return -EPERM;
 		fallthrough;
 	case SIOCGARP:
diff --git a/net/ipv4/devinet.c b/net/ipv4/devinet.c
index 1e9d988849c9..ec57948ffbb3 100644
--- a/net/ipv4/devinet.c
+++ b/net/ipv4/devinet.c
@@ -1088,7 +1088,7 @@ int devinet_ioctl(struct net *net, unsigned int cmd, struct ifreq *ifr)
 
 	case SIOCSIFFLAGS:
 		ret = -EPERM;
-		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		if (!net_may(net, NET_RIGHT_LINK))
 			goto out;
 		break;
 	case SIOCSIFADDR:	/* Set interface address (and family) */
@@ -1096,7 +1096,7 @@ int devinet_ioctl(struct net *net, unsigned int cmd, struct ifreq *ifr)
 	case SIOCSIFDSTADDR:	/* Set the destination address */
 	case SIOCSIFNETMASK: 	/* Set the netmask for the interface */
 		ret = -EPERM;
-		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		if (!net_may(net, NET_RIGHT_ADDR))
 			goto out;
 		ret = -EINVAL;
 		if (sin->sin_family != AF_INET)
diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index 8c123b111b3d..67d1eb7f8b7a 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -651,7 +651,7 @@ int ip_rt_ioctl(struct net *net, unsigned int cmd, struct rtentry *rt)
 	switch (cmd) {
 	case SIOCADDRT:		/* Add a route */
 	case SIOCDELRT:		/* Delete a route */
-		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+		if (!net_may(net, NET_RIGHT_ROUTE))
 			return -EPERM;
 
 		rtnl_net_lock(net);
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index c8c0dd04982d..3699e5410992 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3185,7 +3185,7 @@ int addrconf_add_ifaddr(struct net *net, void __user *arg)
 	struct in6_ifreq ireq;
 	int err;
 
-	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+	if (!net_may(net, NET_RIGHT_ADDR))
 		return -EPERM;
 
 	if (copy_from_user(&ireq, arg, sizeof(struct in6_ifreq)))
@@ -3212,7 +3212,7 @@ int addrconf_del_ifaddr(struct net *net, void __user *arg)
 	struct in6_ifreq ireq;
 	int err;
 
-	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+	if (!net_may(net, NET_RIGHT_ADDR))
 		return -EPERM;
 
 	if (copy_from_user(&ireq, arg, sizeof(struct in6_ifreq)))
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 616b86f89f63..f458a3cae13a 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -4578,7 +4578,7 @@ int ipv6_route_ioctl(struct net *net, unsigned int cmd, struct in6_rtmsg *rtmsg)
 
 	if (cmd != SIOCADDRT && cmd != SIOCDELRT)
 		return -EINVAL;
-	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+	if (!net_may(net, NET_RIGHT_ROUTE))
 		return -EPERM;
 
 	rtmsg_to_fib6_config(net, rtmsg, &cfg);

-- 
2.55.0

