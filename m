Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282637;
	b=o4QWSBO9pR7DwFKr8c3lCUyNkcH03K2L3F+oFkIUnV9SuDGpg7qQT8kNyVOgC6sp7XIg
	 hRiWMdha2Jx+c6MoA0Y/+hDxqfmcknFBEgEseoK3ZpEgAqnMjOdc3/TM4ysTQRSFn3ED/
	 qV8TLo3N/fJ4/MQdFGRaui1uln2bQbkFawc0oCXNZ4/pqfaRf0qnQr3d26dvTP3v14nRf
	 aP85kBNjEcGrr8Byl1hGIt+8Y2HPCoeGWFji121pU7Lf3q/kKXnUayn9C9bHpYuH6LBF/
	 jWFTiRWPx2jbob+vxDmfLLIVf0s5/pMOrJfYBVPOW4vMunb72Q+Z0jt6QuFttRpipVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282637;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ViXjqbT3KRWfvHNHJYyPeRSyMlk/teSxYJxUWIJYwOc=;
	b=wPBRy3x+4Jg3EFEURi6abSD/pEIP5ensHCLga6WD75WFvtFVhBymmv5R2vRXSG9JfY5O
	 vxk3y1GXhrsKucnWx4sVdp3Lk69dl9LFnsbgHFP9f6z60N4SavJI4PaQ3g0ciJKCqWQmG
	 RfmiRVkqor1qpl0FAGzD4/uTQLC0zU3BL1MKtlrfHxdlF9fbcdGfy3Jf734Cvx38q8R8C
	 e4Mfk+uvdv2spyOHNNLi7WkrUDlEv/AS9hVY7VLohSaTYAQaigqnpD2SRNP5lJ4baDctS
	 WuxFcn86B/nknIyP53ZtS1iCAvXizp6T4ZM6/ZzEjl1/7EXM6zfxf/OyMFOi4/oMeKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dWRw5dwP;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC6C606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC6C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dWRw5dwP
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso869257a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282636; x=1794887436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViXjqbT3KRWfvHNHJYyPeRSyMlk/teSxYJxUWIJYwOc=;
        b=oL9iOsZuqdwz+F6AVWGCC8ek7mKKJvvuQCs58SyAqxUVmKMo9LPCNnwx2lADXdSih8
         HIO1u/FLuD4Pr+02fU5KksPuD4PJmVjqAWyBQDI6ZjIdTWkUskbGtqxHNnS6jwXejYjX
         9EWxZuHtLWO77OEz2vmek4bHFdkJdh0zDHFatbPva4V3RycfAikzZ60+b2OSQJLlbauB
         PFZw2PBTQ0lOYG8+jm4XtJqewBQWx7pw+4+7ur/tR7RS5SemeBaLCVFNA2hHNihiTomN
         +/T5sCmRKCFPGqb2VrKogKp090Q+aIlSiKzniKGgmGWSSHgSEL840Vr72CEpqPPFC9kq
         zL9A==
X-Forwarded-Encrypted: i=1; AL+hErHl5KugHP7NQ8kxONpqgxW2o9MFlZcEfmdAFQBy8W0i3bKlHtBRhPJbiFhr+aYSkmzvLYQYW7/c7T1S2aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z85Pdh8/nWRfE45Yt/ullG98yi+FCDzpjRuuYP6zvlipp/EgzzX
	io9Cy8y7IrZpfiLvVLJhiiI3YH15MsJBN/Mwt8B/Mo1QgYl3An7w3WCwaGvHX12lKR2UPp1S29q
	HkhBQMXnjBZWHw+nuFY4rW0MCRuiABc2tIAEkhN8bxYMt+jKrSNS9hPrVKdktvRjs3vwjFN2pxC
	YRUoZOteRBUEW85DiRQSxDw2yM/E2clOm9v4TmCLg+6XKpkBIWXVQgorOLEkdfmqVYzJ7iVkqN+
	lEMtFTa/bGEVc256RebUPLr
X-Gm-Gg: AYBFou22cEZd5UNPckBHaKNn6asAWoJ+PWpTdfyq1nz3Jskb9gg0OXLF1Dg6liRjRSD
	2nEMoqeOCLv9DS8t8CYLEgILZXs1/CU2Wg4RCjsSe2OIPnMBMBKPqD2B6+ChKLjeJIx00RpsapU
	q3SUq9rK1S4wPhNvp9SkaOzR98A8yqLzfvCY005++jEqzFvnWOihR3jSIQ2VfgPyaJvSnoadW5p
	ZQ5bBSJsMpATnKO1gvS/3xo8xK3GZQ3+SoxxdqOfW8wi9ThjeVBoSmejxK/Blbpv/3L8NRmtR1N
	eF8T+iPI86At2xflv7nu+50nScZZftiGASyvT9Hl7QqPUKmrb+PLpkEGKVo9zV2iKx9nuPLtXMS
	kGkn1Ks80e4ewvQnUJZZrwFBTOalK9ayMB0KzJ8XZBHA0yco7Y8N9h9/Ddr2wQWKuNjWhbUYmQO
	EYiHoVZ9eb79IBjyIoazM02nP8pVeuIumyQ1pIqNAn
X-Received: by 2002:a17:90b:3d47:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b1678cf08dmr1061572a91.2.1794282636134;
        Mon, 09 Nov 2026 19:50:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1690eb855sm278569a91.3.2026.11.09.19.50.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5364f562140so33417901cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282634; x=1794887434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViXjqbT3KRWfvHNHJYyPeRSyMlk/teSxYJxUWIJYwOc=;
        b=dWRw5dwPXfUlMQXoqdbkd46MvtWuhmIRzJqUWfJr9IGZezYI1HiC+sdk7JEAjxCfg9
         CW88YP2hf0HwSOp6IpKoZ3FConCT8FBpvvY+LVeNGRQMkcMaynSCL4cu/H2qVLm8lWFP
         Q2NIshVN6GQhwnPFGws9chrB0q7dLIsHINfy0=
X-Forwarded-Encrypted: i=1; AL+hErGIMna0a/2XHIhOkhWvdMAPAwTXBuG24kFo7A+cJqg5sgunLhoqdYiT1e6asF2/6SHDN+N0BnLOrTX0PAo=@vger.kernel.org
X-Received: by 2002:ac8:5a51:0:b0:535:ba01:d95 with SMTP id d75a77b69052e-55519b63639mr23961181cf.19.1794282634668;
        Mon, 09 Nov 2026 19:50:34 -0800 (PST)
X-Received: by 2002:ac8:5a51:0:b0:535:ba01:d95 with SMTP id d75a77b69052e-55519b63639mr23961011cf.19.1794282634197;
        Mon, 09 Nov 2026 19:50:34 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:33 -0800 (PST)
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
Subject: [PATCH net v4 4/8] net: dsa: b53: reject conflicting mirror destinations
Date: Mon,  9 Nov 2026 19:50:14 -0800
Message-ID: <20261110035018.2169370-5-florian.fainelli@broadcom.com>
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

The mirror capture control register selects one destination for all
ingress and egress mirror sources. Adding a rule for a different capture
port currently overwrites that field and silently redirects all existing
mirror rules.

Read the capture control before changing any source masks and reject a
different destination while mirroring is enabled. Return an extack which
describes the hardware limitation, and propagate a failed capture-control
read rather than making the decision from uninitialized data.

Clear the capture-port field when the final source is removed so a later
rule can select a new destination. This also fixes b53_mirror_del(),
which tried to clear the destination with ~mirror->to_local_port. That
only cleared the bits set in the port number, so a stale capture port
could remain after the last source was removed.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index cc42b2a4870a..715a0969eacb 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2606,7 +2606,19 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct netlink_ext_ack *extack)
 {
 	struct b53_device *dev = ds->priv;
-	u16 reg, loc;
+	u16 reg, loc, cap_ctl;
+	int ret;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
+	if (ret)
+		return ret;
+
+	if ((cap_ctl & MIRROR_EN) &&
+	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Only one mirroring destination is supported");
+		return -EOPNOTSUPP;
+	}
 
 	if (ingress)
 		loc = B53_IG_MIR_CTL;
@@ -2617,11 +2629,10 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	reg |= BIT(port);
 	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 
-	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	reg &= ~CAP_PORT_MASK;
-	reg |= mirror->to_local_port;
-	reg |= MIRROR_EN;
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	cap_ctl &= ~CAP_PORT_MASK;
+	cap_ctl |= mirror->to_local_port;
+	cap_ctl |= MIRROR_EN;
+	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 
 	return 0;
 }
@@ -2658,10 +2669,8 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 
 	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
 	/* Both no longer have ports, let's disable mirroring */
-	if (loc_disable && other_loc_disable) {
-		reg &= ~MIRROR_EN;
-		reg &= ~mirror->to_local_port;
-	}
+	if (loc_disable && other_loc_disable)
+		reg &= ~(MIRROR_EN | CAP_PORT_MASK);
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 }
 EXPORT_SYMBOL(b53_mirror_del);
-- 
2.53.0

