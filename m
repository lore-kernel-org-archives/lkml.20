Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378666;
	b=iv5YSNYxQ6jYMj8SynKsFtUYosno59AnvPGZKy0YH/zofOse/gFiHmEj8ktu8fA+69ig
	 utlXA0jtJJRxXa+ccWWsCfaDUZ8NClPgGU4Afaw7BKXNZ+hvuuc7pGQ3YCx9ki9lxC+/r
	 /SfvGwPr3cAb86mq4cZhkCR8jxnNw5WCrUGn4azxnF//37CRzrLledgqDqHph6yoKmZb5
	 qr8nPMlFOq4LS4UZ5Qi71FggDnM0W8Uaso4UniXb9Y5sucAgV538G938WQ/PWN5F/Egii
	 5zA8ljm6fm2MVUZPqV6TjJd7tEYVqWWqU6ycXi5v41gzvbwOfVCJgDE3kd8kgQdEtfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378666;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=AkugKOwsmCzSmy1v+LN4LSm35Z/A/uOlgAT9s9U5gaA=;
	b=kCmJX6pkg/xRfGLnLGFsnkOszE30Te4ahUPhDfLn/4Im9/Luk6qSdPcoWZmCyKwVpZ+q
	 T0TKvHBZljS+V0u6vsxnywXO9+E3TY8MsQc6crdW8AIUSG7FNIgidiqboRtEGFrEU4JcY
	 wBCOETdCSqe02FqdwPPAO37Hhr+pQuFf6d/krBS1VRsFCXETmk0u9CBYEJdjvqHXhX9O2
	 3QQtsqwpTI4SPJq4JVTjQEG17pe+hMlVNP6gx0VpzDevMsfwCaCgn6iV8XlaS8mz3XEMB
	 j6Ltw0D8Iif50UIyVprnpGVSk3LNNh3xGyMZmcUpLqWl3IVN813j4NAE0XQdGFtdQJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77487606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77487606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679a2b5fe87so3440490d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378664; x=1794983464;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AkugKOwsmCzSmy1v+LN4LSm35Z/A/uOlgAT9s9U5gaA=;
        b=dE//VDJ6COSwF/dOZX0WhKzyZIGLqG5LUy/9esd21vYcq8LaNTpk2Xl0YjW4VQ/Hjq
         4juBwSSZw9SYP/ZtRrITowdKwaJOWLgCJSteJo6OJK7Gt9gziO6pbcTMmu7RQ7wifnyX
         HJSSIpWXUF3wKRRCH6DnYg8YuQjOVTOIgHEjqPKoc2baFyrUBt4tJfLS4SZn6wfhmqEn
         kAHgz14/zyDjeiICAYHRFh34IO2XjwX8l5HqIy3hJH4W4fzVGyD/HdzbQSs8DURjRReL
         kAlgd5mMM8VdOmCqnLNLfY5EosaySwk4quFt7AE6PY2bQSKfixMv2FoqE1l8mjMOeGi/
         msAQ==
X-Forwarded-Encrypted: i=1; AL+hErFNElm4rS315orJec05akAAz3UqfA+eGj0SP+RoMIRPCyUqyRqsdAwV7rXEIourzfgWEJQjU5fGYthewvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tTDSodGobvJlOG1WohaFLrTuJO0/2Al+ytqqBmrHceWYXbPLb
	M87exME5clnpCvKAci1DCSWrZPlolyjdl5P6eN6LoVi/vDS3J6LcoPE+
X-Gm-Gg: AYBFou3vxLG/dtcEW0rysQJCyeKJXLEHRz9v5xz90jne2eJzdRqzWGMClsoqBA8b/7T
	Qgzb9UI1sxR8nLbduMKcQj8N5K0NEk4NKRt0WmKYiGzuB1WqcvFqLEUEZv5ip49a/lHqzjB3we/
	3Bk/jMmYcF2XRSLfuJpBVint5Zl10VxZVTVnqsFksNsf3tsfZRGnAWZrMYYMrVH6SZt4k2nH8Qw
	lQ+g4ylO1Xp8s5fPpvum9DFeQpEvmeLEotWWEegtep6l3XUaLIXs1QoLd2p1bZ0Jh3Bzwu/Ki5c
	oglSDzl/6+eMBjY/Oi0vJ/jWPKshkIMysswP5xAxtl7eTtXdKrsFD/gukkmOXm+Bn1au/vxDXPx
	J5hM5fW8mZWZVXGObtj5q7tqwRH0i1PnSdPXh2ARKSdkZeeGbGOjwvSj7VGIe/SAmRRlbE7kUZl
	hf5oR5nai44n95HYYheA+hrSXJyWWJVc5g6JbN6S0ua59KclLW72SxPTVVPS28COBuNAdG92kKA
	j31HY6uKvnrB1C1uCPe4bJOCGP3FeGQwb8CGdrm8rzzc3ArFBAkmEDwZ5ph7Dyb3sXV7l7NUocL
	R1TjaAK4jhU9YwVhK+mrlEVRDhHw2X8Y7oRKZEUnMzmG0+VKwLDkIjRnAPf3/YqG9c/rezw9wkY
	qyM3iG/vVuu0G7tYsGmME1ZLClCEx8ilXz9/6WoiFf+pLzjG7UlJsvWCn7ys6kRRane1Q2IZ3Ai
	vzrFwcngKWOA5N4NsLKWUjMss=
X-Received: by 2002:a05:690e:80b:20b0:679:b192:5eae with SMTP id 956f58d0204a3-67c67effb5cmr628615d50.24.1794378664196;
        Tue, 10 Nov 2026 22:31:04 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a266dsm3807044d50.7.2026.11.10.22.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:31:03 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 11 Nov 2026 01:30:54 -0500
Subject: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
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
Message-Id: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yWMQQqDMBAAvyJ7dsFEGtGviAeTbNoVGmUTRRD/3
 rQ9DsPMBYmEKcFQXSB0cOI1FlB1Be41xych+8KgG22Uanq0jxbt5nd8s8gq6NtgjOvmLngNpdq
 EAp+/4wiRMkY6M0x/k3a7kMvfIdz3B6hzXG59AAAA
X-Change-ID: 20261109-b53-bpdu-mirror-d3f66c7a7fd2
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

A BCM531x5 can be connected to the host through its IMP port (8) or
through port 5. With port 5 as the CPU port, b53_brcm_hdr_setup() puts
the switch in dual-IMP mode, in which frames trapped for the CPU, BPDUs
among them, go to port 8 when they come from a LAN port. b53 sets up no
WAN ports, so that is every user port. On boards that use only port 5
and leave port 8 unconnected, BPDUs are lost: STP never sees its peers,
and a loop between two user ports takes the host off the network.

Mirror frames sent to the bridge group address from the user ports to
port 5 instead. The multiport address registers cannot do this, since
the RoboSwitch data sheets resolve reserved multicast before them, and
marking the user ports as WAN ports stopped forwarding between them
when tried. Other frames trapped for the CPU still go to port 8, as the
mirror matches a single destination address. The switch has one mirror,
so tc mirroring is refused on these boards.

This was observed on a BCM53125 board in real use, when both user ports
were cabled into the same LAN. Tested on that board with a host sending
BPDUs into a user port: before, none reached the CPU and the bridge
stayed its own root; after, all of them did, the bridge took the sender
as root, and forwarding between the user ports kept working. No
selftests were run.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
Sent to net-next rather than net because it takes the mirror away from
tc on these boards. I can resend to net with Fixes: 8fab459e69ab ("net:
dsa: b53: Enable Broadcom tags for 531x5/539x families") if you prefer.

Only checked on a BCM53125. BCM5301x boards with port 5 as the only CPU
port may have the same problem, but I could not confirm it.
---
 drivers/net/dsa/b53/b53_common.c | 24 ++++++++++++++++++++++++
 drivers/net/dsa/b53/b53_priv.h   |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index a2a5754c413c..6b33775c7598 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -797,6 +797,24 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, int port)
 		hdr_ctl |= GC_FRM_MGMT_PORT_M;
 	b53_write8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, hdr_ctl);
 
+	/* With port 5 as the CPU port, a BCM531x5 runs in dual-IMP mode and
+	 * traps BPDUs from LAN ports to port 8. When port 8 is not a CPU
+	 * port, mirror them to port 5 instead. This takes the switch's only
+	 * mirror, so tc mirroring is refused.
+	 */
+	if (tag_en && port == 5 && is531x5(dev) &&
+	    !dsa_is_cpu_port(ds, B53_CPU_PORT)) {
+		b53_write48(dev, B53_MGMT_PAGE, B53_IG_MIR_MAC,
+			    ether_addr_to_u64(eth_stp_addr));
+		b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL,
+			    (MIRROR_DA << MIRROR_FILTER_SHIFT) |
+			    (dsa_user_ports(ds) & MIRROR_MASK));
+		b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
+		b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL,
+			    MIRROR_EN | port);
+		dev->bpdu_mirror = true;
+	}
+
 	/* B53_BRCM_HDR not present on devices with legacy tags */
 	if (dev->tag_protocol == DSA_TAG_PROTO_BRCM_LEGACY ||
 	    dev->tag_protocol == DSA_TAG_PROTO_BRCM_LEGACY_FCS)
@@ -2604,6 +2622,12 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	u16 reg, loc;
 
+	if (dev->bpdu_mirror) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "The mirror carries BPDUs to CPU port 5");
+		return -EBUSY;
+	}
+
 	if (ingress)
 		loc = B53_IG_MIR_CTL;
 	else
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index c4d2a41c714f..6269c8b3c95a 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -170,6 +170,7 @@ struct b53_device {
 
 	/* run time configuration */
 	bool enable_jumbo;
+	bool bpdu_mirror;
 
 	unsigned int num_vlans;
 	struct b53_vlan *vlans;

---
base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
change-id: 20261109-b53-bpdu-mirror-d3f66c7a7fd2

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

