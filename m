Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7F833263B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328700; cv=none; b=Ihe1ghrhtLD5XCFxbAMe4qhb/N5+zXFCPgim+EIY/pFahRukoIQw4SEyvQThu/DF+eGFKGGGOPAIkpj87dImGoBQg6y6yLKNNLz7R/fgZ+0N0GV2w940ws2C8WyfNDer0FZZrPIwMSfsj1KTdOENTev3JERlz+FgU1xoq52Drto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328700; c=relaxed/simple;
	bh=PRH7T8L3JoMUM0QFNnzzr4gxgP1D3MHa2wzpn1CUGSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EiZMt6dZTjBmuOxNbX7hg2hFZ38LeNG+5/xXQU6QWQT6Piq+S9plMl/R3wjdRWGGqcgsgx45n4KIiRotz7BsdI7ZB+9XExFLx02Nsmf+Tcpyq6VrTTTf+BYmuvvh+kbvfH/lYobaoNifl1IdY/gC4Yyyw5ScTbgwdYzzaTjpb9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quMFpAbT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quMFpAbT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d715f4a587so9689165ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788328698; x=1788933498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/7YdiQnmvwq13HNX1XVkADzp4VfCBMVWEOL5fB2Gb8=;
        b=quMFpAbTULEdQPRnq0OcSlVKoQLsj3r0S2A7rdDyhZFTzVqdG58y4RL3LrqRrPsDCW
         rdEyN+CNBkp8DUb92yitdrxCChRCmm6oTBCa5tIEC92B6MxmiB+siJofbZ/nLFGHVVwP
         M2ZZMD2t60TX1nJt+2dncr+tgvMDDiBUIxkE0vfCUDow1hy4KKq/xNpTmTVr+jXryukh
         6M1L9RAnCFHWwCFLvmljWTBigqAnfUpUdW+ikD58shBhpgswOgNEHcUplg7WDW/LcD+r
         /4h1lGe49VV8v3TQ67ZukSQpyl9hKD9hTJhq7t7hC4u7b6tNnndKV5z8GlIKzvvH6+5W
         E2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328698; x=1788933498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/7YdiQnmvwq13HNX1XVkADzp4VfCBMVWEOL5fB2Gb8=;
        b=a4AEEOlXeNwMv1Td8bzimJq/Dtoed38WT1Aw15ZbQGZO/U4f8dOXcKKbpUccz+vD6T
         QkZ5IeIoBh2K7Zdbk+n43G9jYclFMww/ZcqsDB10hfuMpRKAFYMyxi3ALX8hRmI46g9A
         /ZltGlPhBcA1b5KX3pedWusVVmh4cunTvVbjG0xoUEtf3lkGOsnFlGEp5Oj0zQA572l0
         MoJuFyOShtbw9CFiZQZRp3YZ3iaTAHw5ILDTwCdN6OVEv0muv35GQ4cYv/wSWXHtq8MP
         RDrYZh2d5cGgcLq1/32BsFGPhGBxrpRhYqwcNmdibwlIwShLia/+Xwd27EZlhxtrMZAV
         UjDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6c9gqH9ZzfmZOT5cjiVfawnRwkc2FKq/Wev9AgyFWfpxohz3P9gCjflilwaH4Oa+V+FIwsfyAoOGo3d4=@vger.kernel.org
X-Gm-Message-State: AFuF++krigNyrvPEOECJ2LNDrhOpKpuTJvaDHSvn4tuPXIF2v//fnp1j
	21/Zy8Di+CQ6CtJxzVa2D3IHs2zf6RU99x2L6Rpt9MOBmiN5+vmEO0l5
X-Gm-Gg: AR+sD11MJtfZPE/0M3VmFXC0ETnsUUM0ii5EOCqa0aG3b73UzCn/okmUz1/S4ci7vXv
	TZ4PYsVig1HlAfQPLv6JwnCZQeYTwTahydMtV18A4w6ewA69ERaofSHdv8pkqPtOeiQkdWdxBnR
	4xA7S/kR087kP0z7diwd//UvHa7d+fyfRRgXwR7HonQLWh4QC2pHhUrZyZrp29o5nwcLEEfCTwB
	Ig8b7JTMyA7j8olzCxPym0DFTDrTaGtYGccJ1GRyG6PQtEsTebC2NuDc9NE45V2DGJaegKM6IUM
	uaSi30ix5HewCfuKkbEiVXHEPBO3JDoGc8RqQB6WnI6kk50Be6OFHlvNlge095wgmgzR9rwQ0lF
	hf6aTVmw1zXRmiUrRLgmVfeLoiYquxsmKfcDRjuzy8qtn8riYxw+ANsroekq+bypQEDQE7H3ogV
	4VMMxNOBfvv1ZCcOSBllYdAd91FgJlSil7UVJfTdIy3eL3WI5JrczdYR4GFt2/KlrayIaW3gP0
X-Received: by 2002:a17:902:e78b:b0:2d9:2fc9:570f with SMTP id d9443c01a7336-2daec738b38mr42021135ad.16.1788328697763;
        Tue, 01 Sep 2026 22:58:17 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd38cccfsm7282505ad.29.2026.09.01.22.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:58:17 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] ip: validate options before echoing them
Date: Wed,  2 Sep 2026 14:58:00 +0900
Message-ID: <20260902055802.3724915-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPv4 option metadata stores absolute offsets from the network header in the
skb control block. That metadata is only safe to use while it still
describes the header at skb_network_header().

This invariant can be broken in more than one way. An IPv6 UDP packet can
remain queued while IPV6_ADDRFORM converts its socket to IPv4, after which
IP_RETOPTS interprets inet6_skb_parm as inet_skb_parm. Also,
ipmr_cache_report() retains the control block when it builds a PIM
register whole-packet report, but pushes a new 20-byte header without
recompiling the option offsets.

In the latter case, a Record-Route offset of 20 points at the original IPv4
header after the push. __ip_options_echo() then reads the original TOS
byte as the option length. KASAN reported a 212-byte write into the 40-byte
stack option-data area on three fresh boots.

__ip_options_echo() currently trusts both the compiled offsets and the
length bytes found at those offsets. Its fixed-size callers reserve 40
bytes for option data, while the TCP caller allocates only sopt->optlen
bytes.

Require the compiled option length to match the current IPv4 header, and
validate each option's offset, kind, minimum length, source span, and
remaining destination capacity before copying it. Use sopt->optlen as the
destination bound so the validation also covers the smaller TCP allocation.

Keep this check local to option echoing. Rejecting every SOL_IP cmsg based
on the current network-header version drops supported metadata, including
the physical egress IP_PKTINFO on IPv4 TX timestamps taken after IPv6
tunnel encapsulation.

With this change, the original IPV6_ADDRFORM input and the PIM register-vif
input were KASAN-clean. The latter returned MSG_CTRUNC on three fresh
boots, a normal IPv4 Record-Route IP_RETOPTS cmsg was preserved, and
tunneled TX timestamp IP_PKTINFO was restored.

Queued IPv6 payloads can still be returned with bounded but incorrect IPv4
peer or error-queue address metadata after IPV6_ADDRFORM. This change only
establishes the memory-safety invariant required by option echoing.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Closes: https://lore.kernel.org/r/20260825221922.85651-1-4ncienth@gmail.com
Link: https://lore.kernel.org/r/20260829144847.1738294-1-4ncienth@gmail.com
Link: https://lore.kernel.org/r/20260901141352.236286-1-pabeni@redhat.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
v3:
  - replace the global cmsg version guard with class-wide validation in
    __ip_options_echo()
  - bound each option by the current header span and the sopt->optlen
    destination capacity used by TCP
  - cover the PIM register-vif stale-offset trigger and restore tunneled TX
    timestamp IP_PKTINFO
  - document the bounded ADDRFORM peer/error address confusion that remains
v2: https://lore.kernel.org/r/20260829144847.1738294-1-4ncienth@gmail.com
  - use the network header version instead of skb->protocol
  - preserve IPv4 multicast-report and software-VLAN timestamp IP_PKTINFO
v1: https://lore.kernel.org/r/20260825221922.85651-1-4ncienth@gmail.com
  - reject all SOL_IP cmsgs unless skb->protocol is ETH_P_IP
---
 net/ipv4/ip_options.c | 54 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/ip_options.c b/net/ipv4/ip_options.c
index 09d745112c15..916259b833a3 100644
--- a/net/ipv4/ip_options.c
+++ b/net/ipv4/ip_options.c
@@ -74,10 +74,32 @@ void ip_options_build(struct sk_buff *skb, struct ip_options *opt,
  * NOTE: dopt cannot point to skb.
  */
 
+static int ip_options_echo_len(const unsigned char *sptr,
+			       const struct ip_options *sopt,
+			       const struct ip_options *dopt,
+			       unsigned int offset, unsigned int option,
+			       unsigned int minlen)
+{
+	unsigned int end = sizeof(struct iphdr) + sopt->optlen;
+	unsigned int optlen;
+
+	if (offset < sizeof(struct iphdr) || offset + minlen > end ||
+	    sptr[offset] != option || dopt->optlen > sopt->optlen)
+		return -EINVAL;
+
+	optlen = sptr[offset + 1];
+	if (optlen < minlen || optlen > end - offset ||
+	    optlen > sopt->optlen - dopt->optlen)
+		return -EINVAL;
+
+	return optlen;
+}
+
 int __ip_options_echo(struct net *net, struct ip_options *dopt,
 		      struct sk_buff *skb, const struct ip_options *sopt)
 {
 	unsigned char *sptr, *dptr;
+	unsigned int hlen;
 	int soffset, doffset;
 	int	optlen;
 
@@ -86,11 +108,21 @@ int __ip_options_echo(struct net *net, struct ip_options *dopt,
 	if (sopt->optlen == 0)
 		return 0;
 
+	if (ip_hdr(skb)->version != IPVERSION || ip_hdr(skb)->ihl < 5)
+		return -EINVAL;
+	hlen = ip_hdrlen(skb);
+	if (sopt->optlen != hlen - sizeof(struct iphdr) ||
+	    !pskb_network_may_pull(skb, hlen))
+		return -EINVAL;
+
 	sptr = skb_network_header(skb);
 	dptr = dopt->__data;
 
 	if (sopt->rr) {
-		optlen  = sptr[sopt->rr+1];
+		optlen = ip_options_echo_len(sptr, sopt, dopt,
+					     sopt->rr, IPOPT_RR, 3);
+		if (optlen < 0)
+			return optlen;
 		soffset = sptr[sopt->rr+2];
 		dopt->rr = dopt->optlen + sizeof(struct iphdr);
 		memcpy(dptr, sptr+sopt->rr, optlen);
@@ -104,7 +136,10 @@ int __ip_options_echo(struct net *net, struct ip_options *dopt,
 		dopt->optlen += optlen;
 	}
 	if (sopt->ts) {
-		optlen = sptr[sopt->ts+1];
+		optlen = ip_options_echo_len(sptr, sopt, dopt,
+					     sopt->ts, IPOPT_TIMESTAMP, 4);
+		if (optlen < 0)
+			return optlen;
 		soffset = sptr[sopt->ts+2];
 		dopt->ts = dopt->optlen + sizeof(struct iphdr);
 		memcpy(dptr, sptr+sopt->ts, optlen);
@@ -141,10 +176,16 @@ int __ip_options_echo(struct net *net, struct ip_options *dopt,
 		dopt->optlen += optlen;
 	}
 	if (sopt->srr) {
-		unsigned char *start = sptr+sopt->srr;
+		unsigned char *start;
+		unsigned int option;
 		__be32 faddr;
 
-		optlen  = start[1];
+		option = sopt->is_strictroute ? IPOPT_SSRR : IPOPT_LSRR;
+		optlen = ip_options_echo_len(sptr, sopt, dopt,
+					     sopt->srr, option, 3);
+		if (optlen < 0)
+			return optlen;
+		start = sptr + sopt->srr;
 		soffset = start[2];
 		doffset = 0;
 		if (soffset > optlen)
@@ -173,7 +214,10 @@ int __ip_options_echo(struct net *net, struct ip_options *dopt,
 		}
 	}
 	if (sopt->cipso) {
-		optlen  = sptr[sopt->cipso+1];
+		optlen = ip_options_echo_len(sptr, sopt, dopt,
+					     sopt->cipso, IPOPT_CIPSO, 2);
+		if (optlen < 0)
+			return optlen;
 		dopt->cipso = dopt->optlen+sizeof(struct iphdr);
 		memcpy(dptr, sptr+sopt->cipso, optlen);
 		dptr += optlen;

base-commit: 70f3995830d3f1e79faa14eb0605914f778feca9
-- 
2.55.0
