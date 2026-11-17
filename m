Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874635;
	b=lRi0BFJMluIOTfBE2m5aInBcjENqrtvGBSvRxR7y/MCogOrrHIK0MJi5aBvVNSeOV7ga
	 Ia+M0pzt/T7tqZRdRDk6y6Zp0EUnczBzW+eNkxuCeK4jt9plPfyqf7HCNPbLpX5ZElv4P
	 9L8/0UWSslS+mp81n1SSrtLRfL7jVItB0k8L1RrHPcmJG0j8gSH0UH0T27UY6U5fMGiKX
	 ucJsfqJ1g2p+Zc9bK4HdS2bk4JUkDssyfCoEdhdYMsV0jiCEqv0DfbjEXdF6yYjHlfeIb
	 Bv8jOGC3T7XljQ+xbScch2bdoa6ChnANLUMkQr70zglPu3AA3x2p2Qr1sDCN0VUazlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874635;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=CVYsmp0KczWzE0joivXQDORwssfDFQQlsu469l4XFpg=;
	b=0jFygmK0Ktkyn/4GgVsZvZlrxKkwNMaKU7Cb6XAUlYMrDs+vGKgEwY3cL1ufgNqPvNVi
	 fan1NO1N50AuJXEkN2v/YwU30AQdu6mA945azbBnr+NEBOdPrsj2zAfL4edmITu3b05sJ
	 +6msoMXKLB8PFRVr6hjxcQ9WCIoyxv2gqRZAZR8AKxXWQY0CIxH81HeY5BpyB9EXgtq7S
	 qOjXCrfo8IRdvmahmp82S/7WYs/tDDvBP3+6pyTlLh0vbmqnXI82kKKEZpIfdgpJOWuSA
	 kgUVDTlVn+9f8YXrAfxdo9UlxjAVpdIGgLKHznSrbxACPrD54rVNMib0AJ40GXYjugA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9599F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0d126f631so37662287b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874633; x=1795479433;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CVYsmp0KczWzE0joivXQDORwssfDFQQlsu469l4XFpg=;
        b=NcLLXvwscG4J1b8IWOQ9/TdoAjXqblwCCRqa1mLUXtMz7znQ0Z9SDuHp2V1epPmDeM
         DP6HLFKJaxqSwM6XOktrAtkNYddi2HEp0aWbiiGwKYt/rga2qziRDrMNttdYWdmVVUHV
         ChZYJXX0kNhAbuK+pa0ETzTK0XZUPkvX8/137DvvN60yTyDflB26YeK9KkqClGMHJ7xr
         Tdh5oWo74ABBEXfKKwOO+4+Tl9OWnOdEWjjY/z9cVsvteNPlcYH1uwBdza6k7M27zg85
         8JqBx5ggt+6ykeKtjFeBLQLrrczlyVCzL60rpFhFXUNUAo3STmD6avyhDJgRgOLSUBdK
         GNHQ==
X-Forwarded-Encrypted: i=1; AL+hErGcP/l7WXqOU8jO2wsYgGKk6AnxZZdbWA9GWgr8tyUj5AcGNU3MTwLCQBNDCTEnVyycg8zFMRiuhvZLeUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mI0iGv1zwFMcXXTQXC6IChEMXOCz74wewX4Y3qjKwiYkY2PFt
	SFKUiJV0IRU+p8bFgvKBNHPapGSRcV/VYYl0oZfacXV81Nz4iiz0KXynmojVNYKTAKA=
X-Gm-Gg: AZFdTZcSPdBFellSVceVDNO73TQzL1kC6/TYh4SmkM3N4bhgf3XPlF3jPjzxb86pz1i
	q6pGfycCkklXUamhovE2eDF1jjiWv8ArOJLXGX/zkHgpFjfavUNhNfD60uWPv+9kyMKf/JUX9Yu
	R5Ke9FLlSxq0AADLwGxNLwyYDC9cpV7ZW7uBvm1aW6QmUeAURLEEFZzkhjVpu825laTEyXqsh3e
	z6Oij/ILDU0RsC705gIz+xGsVcpRaOg2oJcusuVTjDw+DFbBL7L+xzpLOMLNoPeHtldsS+gaJE0
	1dzORYVcY0oEYBR/AQEnD8QiXPO3EYhrWHcuKuFJ81Fkg1wP8B38imCTo9hICu1wG5EKUdLEeBW
	g6lbreQzIVeboziuXYpdClB+us9TTN4HEbbRhZiWfZrRCsCH7RIFKUekpP3AANlJNssSA3j1z99
	EtZNA5Fg4MyflEPZRmfNFCzap8aOC6MXK4iEpnBlLh13MSOKucVk3fbx+nGbldUOrDgc13ZVwqh
	d1hyXhRhZY0csLRyqNQTXgkUWhptX9QRG5mdG99KJynmn4mszkKRir8R6NZjgr/KHuWbbGLQJ8A
	SUzGJOz8jS117Yvstb/UlRdGAGDgzkfcJ5c92d5U/HfoaX2C/yGHY66gwVnOy5OWRFIAmuQ4cj+
	w92godoeyzFP4CFrpQCav/NNjuRNtLDqEdw==
X-Received: by 2002:a05:690c:dc9:b0:8b3:1c7c:1b70 with SMTP id 00721157ae682-8b4aa3c727fmr79090967b3.53.1794874633458;
        Mon, 16 Nov 2026 16:17:13 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec065d13sm11873787b3.25.2026.11.16.16.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:17:13 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 19:16:58 -0500
Subject: [PATCH net-next v2] net: dsa: b53: mirror CPU-bound frames to port
 5 when port 8 is unused
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
Message-Id: <20261116-b53-bpdu-mirror-v2-1-c39ab745730f@telaak.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WNOw6DMBBErxJtnY1YI0Ckyj0iChuvg/MxyDYWE
 eLu4VOmHM28eTME9pYDXE8zeE422N6tQZxP0HbSPRitXjOITJREWY2qyFENesSP9b73qHNTlm0
 lK6MFrNTg2dhpf7yD44iOpwjN0YRRPbmN2+G27WyIvf/u8kQ7cXiI/jyJkNDUJhdca1FodYv8l
 vJ10ZygWZblB580LFfLAAAA
X-Change-ID: 20261109-b53-bpdu-mirror-d3f66c7a7fd2
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

With port 5 as the CPU port, b53_brcm_hdr_setup() puts the switch in
dual-IMP mode, in which frames for the CPU from the user ports still go
to port 8: BPDUs, the IGMP/MLD copies b53_enable_mcast_snooping()
enables, and most traffic of standalone ports. On boards that leave
port 8 unconnected these are lost, so STP never sees its peers and a
loop between two user ports takes the host off the network.

Mirror them to port 5: frames to the bridge group address as they enter
a user port, everything else as it leaves port 8, which is enabled with
its link forced up and in the disabled STP state so that only frames for
the CPU leave it. The switch has one mirror, so tc mirroring is refused.
Frames to 01:80:c2:00:00:02, 03 and 0d still do not reach the CPU from a
bridged port.

Observed on a BCM53125 board in real use, with both user ports cabled
into the same LAN. Tested there with a host sending test frames into a
user port: bridged, BPDUs reached the CPU and forwarding kept working;
standalone, all but EAPOL to 01:80:c2:00:00:03 did, once each. No
selftests were run.

Fixes: 8fab459e69ab ("net: dsa: b53: Enable Broadcom tags for 531x5/539x families")
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
Tested on a BCM53125 with this patch on a 7.3-based kernel, which only
lacks b53_enable_mcast_snooping(). Still net-next despite Fixes:, as it
enables port 8 and takes the mirror on every dual-IMP board; I can
resend to net if preferred. Boards that can wire port 8 (5301x, 58xx)
are better off using it.
---
Changes in v2:
- Also mirror what the switch sends to port 8 to port 5 (Jonas's egress
  mirror), with port 8 enabled, its link forced and in the disabled STP
  state, on all dual-IMP chips
- tc mirroring refused with -EOPNOTSUPP (not run on hardware: no clsact
  in the test image)
- Check that port 8 exists and is unused; add Fixes:
- A CFP redirect to port 8, where the chip has a CFP, is left for a
  follow-up
- Link to v1: https://patch.msgid.link/20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev
---
 drivers/net/dsa/b53/b53_common.c | 48 ++++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/b53/b53_priv.h   |  1 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index b7aff5e238e8..f82139b0c501 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -745,6 +745,10 @@ void b53_disable_port(struct dsa_switch *ds, int port)
 	struct b53_device *dev = ds->priv;
 	u8 reg;
 
+	/* Port 8 carries frames for the CPU to the mirror */
+	if (port == B53_CPU_PORT && dev->cpu_mirror)
+		return;
+
 	/* Disable Tx/Rx for the port */
 	b53_read8(dev, B53_CTRL_PAGE, B53_PORT_CTRL(port), &reg);
 	reg |= PORT_CTRL_RX_DISABLE | PORT_CTRL_TX_DISABLE;
@@ -1326,6 +1330,42 @@ int b53_setup_devlink_resources(struct dsa_switch *ds)
 }
 EXPORT_SYMBOL(b53_setup_devlink_resources);
 
+/* With port 5 as the CPU port and port 8 unused, the switch runs in dual-IMP
+ * mode and still traps frames for the CPU from the user ports to port 8.
+ * Mirror them to port 5: frames to the bridge group address as they enter a
+ * user port, everything else as it leaves port 8, which needs Rx/Tx enabled
+ * and its link forced up for that, so b53_disable_port() leaves it alone.
+ * This takes the switch's only mirror.
+ */
+static void b53_setup_cpu_mirror(struct dsa_switch *ds)
+{
+	struct b53_device *dev = ds->priv;
+	int cpu_port = 5;
+
+	dev->cpu_mirror = false;
+	if (dev->tag_protocol == DSA_TAG_PROTO_NONE ||
+	    dev->imp_port != B53_CPU_PORT || B53_CPU_PORT >= ds->num_ports ||
+	    !dsa_is_cpu_port(ds, cpu_port) ||
+	    !dsa_is_unused_port(ds, B53_CPU_PORT))
+		return;
+
+	/* Rx/Tx on, STP disabled: only trapped frames leave port 8 */
+	b53_write8(dev, B53_CTRL_PAGE, B53_PORT_CTRL(B53_CPU_PORT),
+		   PORT_CTRL_DIS_STATE);
+	b53_write8(dev, B53_CTRL_PAGE, B53_PORT_OVERRIDE_CTRL,
+		   PORT_OVERRIDE_EN | PORT_OVERRIDE_SPEED_1000M |
+		   PORT_OVERRIDE_FULL_DUPLEX | PORT_OVERRIDE_LINK);
+
+	b53_write48(dev, B53_MGMT_PAGE, B53_IG_MIR_MAC,
+		    ether_addr_to_u64(eth_stp_addr));
+	b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL,
+		    (MIRROR_DA << MIRROR_FILTER_SHIFT) |
+		    (dsa_user_ports(ds) & MIRROR_MASK));
+	b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, BIT(B53_CPU_PORT));
+	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, MIRROR_EN | cpu_port);
+	dev->cpu_mirror = true;
+}
+
 static int b53_setup(struct dsa_switch *ds)
 {
 	struct b53_device *dev = ds->priv;
@@ -1387,6 +1427,8 @@ static int b53_setup(struct dsa_switch *ds)
 			b53_disable_port(ds, port);
 	}
 
+	b53_setup_cpu_mirror(ds);
+
 	ret = b53_enable_mcast_snooping(dev);
 	if (ret)
 		return ret;
@@ -2604,6 +2646,12 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	u16 reg, loc;
 
+	if (dev->cpu_mirror) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "The mirror carries CPU traffic to port 5");
+		return -EOPNOTSUPP;
+	}
+
 	if (ingress)
 		loc = B53_IG_MIR_CTL;
 	else
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index c4d2a41c714f..15f745d79bf4 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -170,6 +170,7 @@ struct b53_device {
 
 	/* run time configuration */
 	bool enable_jumbo;
+	bool cpu_mirror;
 
 	unsigned int num_vlans;
 	struct b53_vlan *vlans;

---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
change-id: 20261109-b53-bpdu-mirror-d3f66c7a7fd2

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

