Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035502;
	b=lBqIxpK2DgXY/iHP146sRg3tkSWf7baa3o3awilGiBBJGdd7QOIEPxoA3XNY/5KohD5Q
	 vEqTmhYZwmYsBnJ7IA7JI6WCMMWnmtB46NlnYpN0PJu80odZEq/5PsPHv66+ha6988zA0
	 Qh0zcFd6gDdiUTKPNTIb8isQAJp5HSoWqAYvNVPvvQyydQUlMb6RSiRoaQ7PGIxjjLNqz
	 p4eWoYK8knVSrMcO6ZQgUicVlBSOvLBc20rFOYn8USy9yIXleT4A0Ldn/XiIBUElx7Ajm
	 vJ96/Tbm0ockwbg+GfsmiK0jbZk/3kIeUA10iDGgQnQdF0ARYupIh1ffXE75865/Nuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035502;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Anilyg+OpX1k2rbfizQdpMhmGXdFZZHHaE8PjcFsPBY=;
	b=ylJydR5iXmqOmVe8mxrOQlyHeoAwq+jnzcLwhgDQNSXVr3+RRo0hqLa0/4yi9uetJFNN
	 nHnWKMYqhnnp3X+AuJMAUEKjpQN09JZlR1mwZ7WgLM7eg+EsxVFmAQCW6GURxqkFHgSvH
	 M//P+gORYwHZyyxeYqkcXDtWs2//FEywuZbKpenEjapcea2QYiobgQM5cs8jZINPCSmfE
	 IoNTmh0yJHXl0Ne1LY35IdXYsp892x6dk0rSeGUSs6thlUZcqp693s72Y4Omd9aSx4KCA
	 7ExvtXDXUCZ8bRKlA79ZdzW4YxHsg7O6U8QRpZsFVJPKdT+3wH3rxbEAw6sOYeyXZQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Qmwzn/Ch";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444A2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Qmwzn/Ch
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1880545a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793035501; x=1793640301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Anilyg+OpX1k2rbfizQdpMhmGXdFZZHHaE8PjcFsPBY=;
        b=IuFoDVP6EtGVq0XeUZDPvsMGJap5UtgSX/lYn3qna21ckRAcsubDa5nfEloFuNRS2b
         FuZnTAbrTkK793uwI8XxlXIVCTCLVsP+9xhyrGSEWfLJn1WXJ/RG2ySMWDB11mUHtD1v
         cbysZitShpEWHM275V5GcXFb+wNxxtuuf4LfU54UAf9B8AiLslWy4uHwxerxRGmqEQQX
         qSH62ivY536jzLiaw0HQ2Ctntu4pmphd3L3ZvLJO+vhH5EbPT9B3IEa/C6z+bIxDWtYF
         XfGTaCdaVklZOA0fQWOnlElnlQax1mq4wpzM8alUcw5cajTBGmyiDEjqg1q8iPv7CQGf
         dzIg==
X-Forwarded-Encrypted: i=1; AKwUvBxaO6Ow+oBywtUw60EGT7z35pAXdohHFKAfOqjiQMa8poV9us14S5m8ctbSBrw1tDtVG4vqeS7/+0IjCuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJzJRPOt1LUUi/rR26bfqvgwGN1zqhu159K/sCFHHxCnmjyLVr
	iXp8RGwgrapsPGw6T5ZsqssAtDPY4FOfCtQBd3dVve/PXhPkvkEHdXeyqpGQflZ8avyP+xzCm7V
	s6/cjPSSBGTqtWGNbV9ytU4RHq8KaKzL30Asfvf1Hx6477hNny2gDgMTua2UcwYTg4shKV9Jr8O
	YgdzpJQ1VIYnumVuKZUGVQ1IQbN6o5QlFNby4AZWgnu+j8xnm0NJKHN58ABA90zK924k9zW/ggY
	baIQwT9Xn5+v6Vg8l4QSJc5o5I=
X-Gm-Gg: AYBFou1DzYEaYmCdSktBdUNceRfjUPEKXpU/2oUSIQ6cX7ovqJVnzILPJ9pdSlqHGnH
	7f6Fjj65Bk9t53VYVJixEppSuJOwddV0QPIjQjr/fzgC2vUU22pkoMjgzxdxaDdk1nu15jroFCs
	FojTwBmqi+lwb+m5U7cj/mu9gwOHE5YM/p+kMiLO8l1YMa3HCHe0y52AQ7RPlVT1Sr7dXv2Dv5M
	Qr7JoGF1TgPNqLpmHuSHB54DgzQY0g4S5ltYtOc7543NXNgJ4FEgF4b+xr2+a2pOd765yWHx49b
	fRa27IDnqX5ajkVze2yUO3QY/iKph/7Kl1iuJOukPsQL20hw/1a9+Yoenbi4hq18VkqtLdEg7Up
	RRgN7fBjujUKdS5drIMSyFqIXjoVsqqxgvXJicYtHsZNmgJh0mcUSN84KX8BboW4E1JN+EhjNiU
	G2+PeI0YTOU9bzKpOqd2zau9TOepRzDABr8EzvLNeb
X-Received: by 2002:a17:90b:5186:b0:3ac:b3e5:428f with SMTP id 98e67ed59e1d1-3adeb10f4aemr6342249a91.53.1793035500007;
        Mon, 26 Oct 2026 10:25:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae407e4ce3sm123253a91.6.2026.10.26.10.24.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:25:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535066512b0so95914101cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793035499; x=1793640299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Anilyg+OpX1k2rbfizQdpMhmGXdFZZHHaE8PjcFsPBY=;
        b=Qmwzn/Chv+itwOSYWzSIKrAG2iZc/Uwy3NGlCQk/+fpNX6gwpRvJdf6LNwfZtKQWFm
         39NlJMniVxjJx8FrqF7tTGsCG//zZAOXMp/Ab7LigoThiIn2dQPkipPt3aUvvHGL0AGZ
         k9ncgkkgTVVx32FgsrFOFdV0zq18AA5sFy0rI=
X-Forwarded-Encrypted: i=1; AKwUvByOAYLC7smxKo7/rCV7CMEnUOwGLTtLqpezrOCECsLndDE7H7cTazkelC1vwBhRI5K8J826J3T+P2lDCfI=@vger.kernel.org
X-Received: by 2002:a05:622a:298c:b0:535:a5f8:a5c7 with SMTP id d75a77b69052e-5383b63b340mr121782091cf.71.1793035498798;
        Mon, 26 Oct 2026 10:24:58 -0700 (PDT)
X-Received: by 2002:a05:622a:298c:b0:535:a5f8:a5c7 with SMTP id d75a77b69052e-5383b63b340mr121781601cf.71.1793035498304;
        Mon, 26 Oct 2026 10:24:58 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53839739ad5sm59689821cf.23.2026.10.26.10.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:24:57 -0700 (PDT)
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
Subject: [PATCH] net: dsa: b53: Enable IGMP and MLD control packet CPU copies
Date: Mon, 26 Oct 2026 10:24:52 -0700
Message-ID: <20261026172453.3152951-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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

IGMPv2 reports and MLDv1 reports are addressed to the multicast group
itself. Once the first listener is installed in the ARL table, subsequent
reports can follow that entry without reaching the CPU. The bridge then
fails to learn additional listeners, although static MDB forwarding works.

Enable the high-level protocol classifiers so that IGMP and MLD control
packets are copied to the CPU independently of the multicast ARL lookup.
Retain normal L2 forwarding by clearing the CPU-only forwarding modes,
and preserve unrelated protocol-control fields.

Handle the BCM5395's 16-bit register and different classifier fields
separately from the 32-bit layout on the BCM531xx, BCM5301x and newer
integrated RoboSwitch families. Leave older devices with different IGMP
controls untouched, and propagate register access failures during setup.

Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 50 ++++++++++++++++++++++++++++++++
 drivers/net/dsa/b53/b53_regs.h   | 17 +++++++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0880310c9ce3..54844cfadf01 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -836,6 +836,52 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, int port)
 }
 EXPORT_SYMBOL(b53_brcm_hdr_setup);
 
+static int b53_enable_mcast_snooping(struct b53_device *dev)
+{
+	u32 val;
+	u16 val16;
+	int ret;
+
+	/* BCM5395 has a narrower register and a single IGMP classifier.
+	 * Its ICMPv6 classifier also covers MLD.
+	 */
+	if (dev->chip_id == BCM5395_DEVICE_ID) {
+		ret = b53_read16(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL, &val16);
+		if (ret)
+			return ret;
+
+		val16 |= HL_PRTC_IGMP_IP_EN_5395 | HL_PRTC_ICMPV6_EN;
+		val16 &= ~(HL_PRTC_IGMP_FWD_MODE_5395 |
+			   HL_PRTC_ICMPV6_FWD_MODE);
+
+		return b53_write16(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL,
+				   val16);
+	}
+
+	/* Older switches use different IGMP controls, not HL_PRTC_CTRL. */
+	if (!is531x5(dev) && !is5301x(dev) && !is58xx(dev))
+		return 0;
+
+	ret = b53_read32(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL, &val);
+	if (ret)
+		return ret;
+
+	/* IGMPv2 and MLDv1 reports use the group's destination MAC. Once
+	 * the first listener is offloaded, ordinary multicast forwarding
+	 * can keep subsequent reports from reaching the bridge CPU.
+	 * Copy control traffic to the CPU independently of the ARL lookup,
+	 * retaining L2 forwarding rather than selecting CPU-only traps.
+	 */
+	val |= HL_PRTC_IGMP_RPTLVE_EN | HL_PRTC_IGMP_QRY_EN |
+	       HL_PRTC_IGMP_UKN_EN | HL_PRTC_MLD_RPTDONE_EN |
+	       HL_PRTC_MLD_QRY_EN;
+	val &= ~(HL_PRTC_IGMP_RPTLVE_FWD_MODE | HL_PRTC_IGMP_QRY_FWD_MODE |
+		 HL_PRTC_IGMP_UKN_FWD_MODE | HL_PRTC_MLD_RPTDONE_FWD_MODE |
+		 HL_PRTC_MLD_QRY_FWD_MODE);
+
+	return b53_write32(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL, val);
+}
+
 static void b53_enable_cpu_port(struct b53_device *dev, int port)
 {
 	u8 port_ctrl;
@@ -1334,6 +1380,10 @@ static int b53_setup(struct dsa_switch *ds)
 			b53_disable_port(ds, port);
 	}
 
+	ret = b53_enable_mcast_snooping(dev);
+	if (ret)
+		return ret;
+
 	return b53_setup_devlink_resources(ds);
 }
 
diff --git a/drivers/net/dsa/b53/b53_regs.h b/drivers/net/dsa/b53/b53_regs.h
index 54a278db67c9..cfdb5ed38326 100644
--- a/drivers/net/dsa/b53/b53_regs.h
+++ b/drivers/net/dsa/b53/b53_regs.h
@@ -274,6 +274,23 @@
 /* Revision ID register (8 bit) */
 #define B53_REV_ID			0x40
 
+/* High-level protocol control (16 bit on BCM5395, otherwise 32 bit) */
+#define B53_HL_PRTC_CTRL			0x50
+#define   HL_PRTC_ICMPV6_EN		BIT(4)
+#define   HL_PRTC_ICMPV6_FWD_MODE		BIT(5)
+#define   HL_PRTC_IGMP_IP_EN_5395		BIT(6)
+#define   HL_PRTC_IGMP_FWD_MODE_5395	BIT(8)
+#define   HL_PRTC_IGMP_RPTLVE_EN		BIT(9)
+#define   HL_PRTC_IGMP_RPTLVE_FWD_MODE	BIT(10)
+#define   HL_PRTC_IGMP_QRY_EN		BIT(11)
+#define   HL_PRTC_IGMP_QRY_FWD_MODE	BIT(12)
+#define   HL_PRTC_IGMP_UKN_EN		BIT(13)
+#define   HL_PRTC_IGMP_UKN_FWD_MODE	BIT(14)
+#define   HL_PRTC_MLD_RPTDONE_EN		BIT(15)
+#define   HL_PRTC_MLD_RPTDONE_FWD_MODE	BIT(16)
+#define   HL_PRTC_MLD_QRY_EN		BIT(17)
+#define   HL_PRTC_MLD_QRY_FWD_MODE		BIT(18)
+
 /* Broadcom header RX control (16 bit) */
 #define B53_BRCM_HDR_RX_DIS		0x60
 
-- 
2.53.0

