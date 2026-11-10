Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282646;
	b=ZgAm6+BgqaY4+1Y+nTquQKJ2HLR/aSwG8YFuGujQYBMK9GjqD6Oa8HWAxLNJ4fSSAraC
	 BmRPkaLUWy2M+30IGVIehj/32HhgMN+Kuqaeo9UYEMNW6f97ZB8thCfvPZyr9XDb0y/EM
	 AaWgAQLeX1r6cPVnLSuBcvxQ+YkMThORRQWZycNQz347KGhUGTTgr/Sk9NfJuEeI1Oc8K
	 hcw3kwEBYFDKL7+vGCpu8OQzZludylTWIHJ9I9+dsPiujCbMk/ZW/Mdr2kcAtHFBfpqaa
	 S3P9BtJ5mJ09e/0XyHyF6u+1pC8joa2RWuvvoqRoOBvuzBIgKuPW2wypbXRiGc7frIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282646;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LzeYtQeHYIVthg2hHB9w5Dkr2DnAfEy/jz5r4BF+vDg=;
	b=WiwXOqLckhnAxQVknpsoFVzk3bgM0yecRsPiSQuROiEtEPyAF3Xhbxw9pktSsudls8E/
	 1nqxJtgSZU4I0Xnpb8vv5DDQn4ypvqnhVjQxCx6SnOudlbbCi6ZGesr58RA0t8IpgX420
	 tm0lup/OnxVoYR0pmEHYNW2Dv2gsFCJh+qZ5sWyTlQq3LiHYYw2NkNpmAcghQudR/nEKu
	 FUv4ZhH+Awgx3BI6skesyPdUZqChyeu9k2o4dU0+dLJVAQ6fhF9lGLO19cHz0hlzC1GXh
	 Ma2OCuiBRjPSd7C/dS9g2wk6CBYlH3LJKJAJuujVxRQ6nY4XomMVWX9gS1Bvtsl28hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WToQpwPP;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549760A6F41
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C549760A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WToQpwPP
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdab938dc83so613613a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282645; x=1794887445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzeYtQeHYIVthg2hHB9w5Dkr2DnAfEy/jz5r4BF+vDg=;
        b=D7oHDgz4L+wxgtRa5+MyiR8EtkYoL3u1SZpMTjzFk1iRMUUGS18xbSU9IGS0BflGoK
         2Hn/yGiLJpm1RPIkkZVW5Tcl7faiV0yvazUxA65sycGyTr1E9jK7KmNaB9Y789rJ+1Fo
         kIKfPiPNXtGpiMuQ8grdNYLmxs/yiHlKpThRNbgKKDca1ZwAFNhB6ek7eLqyo57oubNU
         I5Qekpe54q5WUxUUH/O6FgL9OrXnbADpQX3O/7u0WnhlzjPg5ZZL9vKaVy/S1C8irsU7
         koGo1xOH2RF3OUEVMIFbDKVO1BJ4XOW37FtNjdNsa70B+o1TE5NFNseq+6qW/Qa/rl4L
         sXmQ==
X-Forwarded-Encrypted: i=1; AL+hErGvx/DCeLqAjU71IPJT2wsnJMnzvimEbHrTFEWeYX/l3RMjg8QEZPAedfyIDJvjzfaSlTXFPPf23T/onqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z++zZ//8YLz3vuk8LTzyalyPAxi8AbdPfK+ev1SKeoMXT31auRh
	927XB2zZsLNCCwbN9RXPsYQhizYCS8mMNGrC7o5A1Pqc8TzEO8ZPoR5ZNRuQTOR7MHZlUFkKY5a
	6AY+P/zln7ylx7oBgJQxJ0xm9OOYZjYRVjfWYWCRIz+523vAacdaAWgXvZ5Rh4NtrVxGG+rksyu
	8rgpf3fmDw/yy7xbzIuUNJzzvfjoatfHpEm9zt37iGgwHxCmaBVxCKGv9XtlAIjYDtSmCeP5wxo
	TGkYq/Byf5kC8dMHsZOfcRE
X-Gm-Gg: AYBFou1qoHhMlQvpqQfl2qV09k77DqGK5Z9VzbwphfIukrymaZELr6/q2xYyBzs3mrF
	ZfvhFbB2THPWNR6Vmpp7fVzTk6VjdnQ6yg69dASCql2/ouMUs21bCp7OsLjwBdmOMj9ZFWE94UY
	6GMpVPcfzHZ1PfAMZf46wAtyk5GP5y0/TsfF5ECRzFYGak24GgTS+aMCepPfGXkrrl6pNjuOzEp
	ke2Ln8BRqm41gHT1GxA3xRjHtX94HRzbc2vkU+zMtawPRSF2/VMGPzJNJBT+Z9CjAlu7TWETqGm
	sGhMnMBL4XbIrZho4MSatBUw+0kfwbp2FQNJrV2VsxmxRHOeqpw1mvPCteYQh3C8zoJfJ7UYreo
	8f6GnkGOBS+v/BV96Gt+6tvZiG5ekpcBATcGkG5mWlIZ+PzJS4xUFutyMejMD5vWY11l/T5mLV0
	SvdGYuAB4v+7Tlt4L7wHlSZOJsr7TdBcMaWbenLwu0
X-Received: by 2002:a17:90b:3b8f:b0:3ae:9944:3bf0 with SMTP id 98e67ed59e1d1-3b166cf7a7bmr1892315a91.34.1794282645012;
        Mon, 09 Nov 2026 19:50:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1690d6612sm358547a91.3.2026.11.09.19.50.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-54b437451f7so33691471cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282644; x=1794887444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzeYtQeHYIVthg2hHB9w5Dkr2DnAfEy/jz5r4BF+vDg=;
        b=WToQpwPPiE+bdCr3yitPpDfa0eiKHIu1fU0lw+6yCvs69aLaolrnNu1N/90aXUE+tT
         UcVfjGPNuAFlVsa4ehT/5Wyd6P8ezIJr9daMSh0Q9zmGT7vX62K8i8NmqAR4ucfWgzzX
         4ugksQc898E2LT0OpKiCL/zzzlJKDi+OIqzA8=
X-Forwarded-Encrypted: i=1; AL+hErH2/vPjrW1nMhO0eSDPR6jMPXUkhqg6O5j4jb1sKPLgcqe9brcCEuhsKCTVzhYOeID5Pt1YUXUbNZ7wR3Q=@vger.kernel.org
X-Received: by 2002:a05:622a:4d43:b0:535:a5fb:645b with SMTP id d75a77b69052e-5552a16cbcfmr20330531cf.70.1794282643694;
        Mon, 09 Nov 2026 19:50:43 -0800 (PST)
X-Received: by 2002:a05:622a:4d43:b0:535:a5fb:645b with SMTP id d75a77b69052e-5552a16cbcfmr20330281cf.70.1794282643171;
        Mon, 09 Nov 2026 19:50:43 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:42 -0800 (PST)
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
Subject: [PATCH net v4 8/8] net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
Date: Mon,  9 Nov 2026 19:50:18 -0800
Message-ID: <20261110035018.2169370-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
References: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
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
index a2d46cceca47..5bdf9cf147b3 100644
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

