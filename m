Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863408;
	b=l7G9MVfeG6kZvj5Nw2Jg8tXlRLizwWWptoJbERqojiEMJIUaLKi0DI7QB8ea+OPjltSQ
	 JJDi5xD8cU4DEtsbC1gxwJNiMnIhSYqF67R6wK1St1+vh/9ugkSwcyRXuBvYyV61ShTX0
	 HodWf9N+TgAEH2EuQFZQWSQJi4ekfuxDJPuEWEYiQYz8Yts1xhnWLd3xHbPR1gq6c0bgk
	 vRVHiCFOjmBJ2VHJWdIR6xxgfz2ZpleuTCX2s5PZrPK//ppnvwxh6CH1C4PoXmKhvgbA9
	 WDBJwXFc1AMBosRGB9BdYQX/MlSNaI2r6kKXfFI+j6geQi8wMr8Y8D8XwU2RIvQEfSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863408;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=JKAZYXMdZqe4nxfssXO4EK9O/cr+JRVGzs2YOMELCDw=;
	b=s00jFOWF0nAh3q1Zj25nQD6ggkbvH7D93a/enuSRthk6de2sSzNz/59HyzUFeMQM/CvP
	 PHF6SCewAJjEuaq3kgZwh+m0FrtTzbKPsWpmf3+qIMHC2QnCEG7nuovNMlt3qV+YXIrRS
	 h99bWzZX0wz/u4CoRInoW1EDiDiiynx15oOhS0Lj6ihJ/gWtrD7zzkLUVDBRR9mo/6DfO
	 HS5Zefv/Et8XRSedRiJeUq9ngdaXHWO/4iyXh7V86iur2c7w5dmflZlhfURR86kvl1nPj
	 1kjGHEStCmQJ9yTVPALhyrjjFSqn2SIbRGrJDGulsSo6LcvK2McFxTfSlaE5xkEZz6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="NWJp/cfq";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E602606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E602606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NWJp/cfq
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso2278562a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863406; x=1795468206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKAZYXMdZqe4nxfssXO4EK9O/cr+JRVGzs2YOMELCDw=;
        b=VTyXtN6jcHm5KZOTIheKh2XnawhMthafIU7j+a5OgAyjGFWSfepHRpD9KdhfyOMHcH
         J8rGQ66O02gi+1xvlxZ6QFkgIaYcMRQQstcidnT3qjZowSDCn5OsYaZ8PFIrcEs50nfa
         ZKmnzSGZGA9BfMC4I++Amog7yFtoGWzgfaKLliikp2NsUQarkUxS7/nMXdOMBzyHi+ye
         d+9uaRc4mcy14D9YiDfGo+CqWIhmUv+Xu11pmlmuHW3bH8lAijl2gusyB7iEa8J/plVF
         ZgzNJDJCiHcLU3dj/rKE5Z9C1/HGsqEm2EV6kL2dGM9xFq7Efi7fmUNfZ7RP8whk9hMj
         gImg==
X-Forwarded-Encrypted: i=1; AL+hErHTNZbj7Mc8qcdA+nxL/QDBZFtmJWL2YjYZsAwAbZce/qw+oC69Sgt8oyxwbWhyeMP5i2+Ct3V5gunTrgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0g9AdTOmLY7f59y8aiPQXFU7oJQJjKwQt+W8twYsWGyMN8204
	4V4yIjRU33meZ1geUzBN43Iy8kh+vOJnRSSP2KfW/J6v0u2x56EASkdnDWBuNSLq+kM1XMkXYzc
	7NjFCYUNdxr72gjUdT9xXcDRaCwklXmQKvrbYVwm0cs/AgBAfL0iqJ2ohtZ+fragVJ9inVuMNQd
	VsmPolWtyV4kHzrhJ5zXPV1HyLKMCJdcR0pNNsVjbhu7r2EePVdd0TkVhNxcW/OgWtzWx7RtBTP
	f6mw08BnBdw79WZrT8E4P/I
X-Gm-Gg: AZFdTZfGpMLz87bTNlPGH/yNH1GxLIMYuzeyrQxpljRzZDQrK40m28h0/1aElYDGK45
	n+zcZL/lkgsh2I8QFQMqqFNYFrLWFfrHBIYK76Vw1F7EIMO3AW+HOCEJvjXK5dOHrtFswk0IkCn
	wZe/IRP0zgMiCwCBsFTasntLq9pZEdbFxbZwn5+0aF+pHwLj64g4KgjDklhxKtnCviNrtK3x0i7
	VB4/dPUANGqP284cIn8M3YvglgAYFsyXWBeO9TaPul/l8nQA/QDEl4t7MaCSF6H4snyjU5CAFAd
	d601KJCIgofLkctRVDt/vL1Fetk0SbweUZnO+f6dyDCyiHayCm2jAH5xNMM2rB8e6Ss2VCsdEJk
	5qcgg704UhdM7WHvHNKRWkoHEFq0mhBwqUecyBcgHlbqndK4N+C+RvQDzkQvsJ0pMivBR6+98KZ
	unn1d0ttMD/ZO+0e94LvLg5N9OXJ/BJBwVVwCkl2RsD8I=
X-Received: by 2002:a17:90b:2246:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b1b0ba91femr10302427a91.54.1794863406099;
        Mon, 16 Nov 2026 13:10:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abf029a5sm391525a91.5.2026.11.16.13.10.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:10:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920fb8b9859so8867126d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863405; x=1795468205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKAZYXMdZqe4nxfssXO4EK9O/cr+JRVGzs2YOMELCDw=;
        b=NWJp/cfqhbhA2oH01EqFEVibXqacDgK7lmVt07WNL75ee0XBd79w2TrGCH1CtD/A9R
         oJe/VEkuFm7+t+Yns6nLqz+IsbCr1bA6/P9U64klL6d7NgQd3wr9/JYCD+8A2KQw4ZG3
         B3qPZrcyCKp5HJ1RHZ/wkLSeF+5Lknmcx7pw8=
X-Forwarded-Encrypted: i=1; AL+hErEQ9cb+aLw506ICRq5RMXzebA4bTyMDIhAxqSzX33c5b5AuYE61yFf5XnvL30+T5wn1M/F3tr3VzHGvGK4=@vger.kernel.org
X-Received: by 2002:ad4:5e8e:0:b0:912:517b:20df with SMTP id 6a1803df08f44-91f242627a8mr174689006d6.39.1794863404908;
        Mon, 16 Nov 2026 13:10:04 -0800 (PST)
X-Received: by 2002:ad4:5e8e:0:b0:912:517b:20df with SMTP id 6a1803df08f44-91f242627a8mr174688376d6.39.1794863404364;
        Mon, 16 Nov 2026 13:10:04 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:10:03 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 8/8] net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
Date: Mon, 16 Nov 2026 13:09:42 -0800
Message-ID: <20261116210943.1352656-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

BCM5325 and BCM5365 use an 11-bit bitmap for the mirror capture port,
whereas newer switches use a four-bit port ID. Programming the port
number directly can select no destination or the wrong destination, and
can select multiple destinations. For example, port 2 requires BIT(2),
but writing 2 selects port 1 instead.

Use the bitmap encoding on BCM5325 and BCM5365, including translating
logical CPU port 5 to hardware bit 8. Apply the corresponding field mask
when checking for a conflicting destination, replacing the destination,
and clearing it after the last mirror source is removed. Keep the port ID
encoding for newer switches.

The ingress and egress mirror source masks use the same layout on these
switches, with the CPU port at bit 8 and bits 5-7 reserved, so apply the
same translation when setting and clearing a source port bit.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 46 +++++++++++++++++++++++++-------
 drivers/net/dsa/b53/b53_regs.h   |  1 +
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index deb331b3629a..ee2d27732c0c 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2608,6 +2608,31 @@ enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL(b53_get_tag_protocol);
 
+static u16 b53_mirror_capture_port_mask(struct b53_device *dev)
+{
+	if (is5325(dev) || is5365(dev))
+		return CAP_PORT_MASK_25;
+
+	return CAP_PORT_MASK;
+}
+
+static u16 b53_mirror_port_mask(struct b53_device *dev, int port)
+{
+	/* These switches use a bitmap with the CPU port at bit 8. */
+	if ((is5325(dev) || is5365(dev)) && port == B53_CPU_PORT_25)
+		port = B53_CPU_PORT;
+
+	return BIT(port);
+}
+
+static u16 b53_mirror_capture_port(struct b53_device *dev, int port)
+{
+	if (is5325(dev) || is5365(dev))
+		return b53_mirror_port_mask(dev, port);
+
+	return port;
+}
+
 int b53_mirror_init(struct dsa_switch *ds)
 {
 	struct b53_device *dev = ds->priv;
@@ -2631,15 +2656,15 @@ int b53_mirror_init(struct dsa_switch *ds)
 	/* DSA retains matchall filters across suspend and resume. */
 	for (port = 0; port < dev->num_ports; port++) {
 		if (dev->ports[port].mirror_count[true])
-			ingress |= BIT(port);
+			ingress |= b53_mirror_port_mask(dev, port);
 		if (dev->ports[port].mirror_count[false])
-			egress |= BIT(port);
+			egress |= b53_mirror_port_mask(dev, port);
 	}
 
 	if (!(ingress | egress))
 		return 0;
 
-	cap_ctl = MIRROR_EN | dev->mirror_port;
+	cap_ctl = MIRROR_EN | b53_mirror_capture_port(dev, dev->mirror_port);
 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 	if (ret)
 		return ret;
@@ -2659,6 +2684,8 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
 	u16 reg, other_reg, loc, other_loc, cap_ctl;
+	u16 cap_mask = b53_mirror_capture_port_mask(dev);
+	u16 cap_port = b53_mirror_capture_port(dev, mirror->to_local_port);
 	int ret;
 
 	loc = ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
@@ -2677,7 +2704,7 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		return ret;
 
 	if (((reg | other_reg) & MIRROR_MASK) &&
-	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
+	    (cap_ctl & cap_mask) != cap_port) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Only one mirroring destination is supported");
 		return -EOPNOTSUPP;
@@ -2689,14 +2716,15 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	}
 
 	/* Select the destination before enabling the new source. */
-	cap_ctl &= ~CAP_PORT_MASK;
-	cap_ctl |= mirror->to_local_port;
+	cap_ctl &= ~cap_mask;
+	cap_ctl |= cap_port;
 	cap_ctl |= MIRROR_EN;
 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 	if (ret)
 		return ret;
 
-	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg | BIT(port));
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc,
+			  reg | b53_mirror_port_mask(dev, port));
 	if (ret)
 		return ret;
 
@@ -2730,7 +2758,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	if (ret)
 		goto err;
 
-	reg &= ~BIT(port);
+	reg &= ~b53_mirror_port_mask(dev, port);
 	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 	if (ret)
 		goto err;
@@ -2749,7 +2777,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	if (ret)
 		goto err;
 
-	reg &= ~(MIRROR_EN | CAP_PORT_MASK);
+	reg &= ~(MIRROR_EN | b53_mirror_capture_port_mask(dev));
 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 	if (ret)
 		goto err;
diff --git a/drivers/net/dsa/b53/b53_regs.h b/drivers/net/dsa/b53/b53_regs.h
index cfdb5ed38326..ee049927a63a 100644
--- a/drivers/net/dsa/b53/b53_regs.h
+++ b/drivers/net/dsa/b53/b53_regs.h
@@ -239,6 +239,7 @@
 /* Mirror capture control register (16 bit) */
 #define B53_MIR_CAP_CTL			0x10
 #define  CAP_PORT_MASK			0xf
+#define  CAP_PORT_MASK_25		0x7ff
 #define  BLK_NOT_MIR			BIT(14)
 #define  MIRROR_EN			BIT(15)
 
-- 
2.53.0

