Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222604;
	b=5J1EdMjLiwiyikqB0gY37USu+hO3Un3gDGnMOt5QKWyDRaYmsBd1XAZGS0jJRjQ1oI7c
	 aQwimhVNC2K1QzGS/HtPK+atFp/yBuoSMFXdGMAMrkZFfxmVGYK2D6JtmnfTDmybnxF/y
	 F9LNAYk1SabTTXzLDG/rZU+FEPX6ftf1nVf28khuwrc01nrj2BnfV4ZmW9hXWFcur37Uk
	 +YlTZWU5fFecub1JkT0R8SPdriW8nuItXxhnrwqWedv2SPvcz9HQicJzGDwIdPHeVnREJ
	 SvIiyI3sgYfkYuFMzQACIAhlTUKVEQdCOrqmeXYl+2rPR6AngWaYu3nxQZleX0CQ2JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222604;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=pQ9JV51aLYDpacaXcbipq7EgeCvVh7+04CD76p86tPc=;
	b=Q3cSpX0UfSJ46fS/+MRego2qOsnXhMBUNga4MF0Bh6eAesraV3j2QSUAsZxYRp2a2Ile
	 QwpmoYR82cYRrIdJWkojMR1RcrFatEsAFJmtt/GiCapEkbIMTWYQYHq39EilfnapcLJvq
	 QhATESmwBHmNQR4ezkU5xnsHRtq6olXYjowOAurRL1+gudvdF3BZi9EQBQd/hrYb8csmq
	 vLmWaFtchf8Q6VlgRJiFBy/IXeVfWA29XMSzkutNP6/Q/aquG+8z7m7m1tZJNqLlsOAD3
	 ZP8HkGZTf+7AUEArUXHstMZ+UDCY+oBZBYN+hqBRdj9Qstta3JFr5FQYNM6Cq4HEF3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="MwGvlQ/C";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F62060A260E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F62060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MwGvlQ/C
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso934187a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222604; x=1793827404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQ9JV51aLYDpacaXcbipq7EgeCvVh7+04CD76p86tPc=;
        b=mPFFUgbT7gxfn3b5MK+ZHMFx26ZcJT7ULtdcowi0ku8InYHgqfLcB1J9XwoOqEiArn
         W+KnYlJwcp4QHFOjV/5BaIipz4bQqUwXfsEbh83PkgBhFVK3GQBbwuaf1deyq/Tpcaqr
         Td6YhXr0kIOYzB8H6RvI1RZy33bqAuowuEmCINB/AOdw7a1FHMjFu/4pr9sk+NkQGLtd
         k3XPG7qxvhKVogaznFpCQPF41xm31WuowM0c2UGBnCuvgldjdM7ULpZBFaKQddLBM4T8
         irjZFPhcVw6ueik6JlgXA+uoWSfc+cBxHcPmqNhiDe0+xKgAS9XPqN+ekmBdPYD+sHoV
         jrdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGDlwBUeTyBmmi4vt2PQy2j0MLPcTzsYYZ+0PskHQSvbnDDk1gCGjPqA9s5B2ES0srjK6lVZGcxRxXsjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeGFYK4hw5L9is+NTFAzTXwydYGUkuDeyFcjkGET1wNZKWPPe1
	zmTiqgvY6ZFoUAfOQX10URLiIuha+WmYaVsA3x9muWxC/cWn58718uNPFJ/CxrUtF2COTdsfx7W
	xYhvhcMoRRl5sFOpmX0akRjxBB7riJ5AY53Sm6Sn9ZquDbmGoWu54veMeCU73wMs0aSFk8zo4Ai
	c5/oHI6tWwRMoWYtAW3yzQtrOiuDlrF5JS5W0rhgD8fJb5N2fosVXmoYcR6SzqG5EhsXL/ZrX9h
	lb0F1UAgZbTag5RJDpn2htL
X-Gm-Gg: AYBFou0W3OB96YHijEKDMLltxB8PGaBOugvOaMtQ1zK/tKu21Ukwc4cwA6rtN9nSi9P
	rtYzQPTDyaok4/CrgJrvum86ynw6UUD8KPwOYGsZuLjhmhPzIIFpElj1HthtYRz/NgL0EjAdWiN
	fgclPkyPdQ3oBLM795Sv9gaU6bWRKNwhtqjySBLdodGK937qPCnvBc8UDBheIWS9PLNYLd+/r9t
	ADi4mWgUzfGTWrxPcuSecFtHnz6noiDtzFHMU9UjsTybyolwJyKrKM6L6FQM/g/YMUhDmXSAISF
	3oSutT+4zBueUP1BfEE5vUUQFUCqEMNc1oyLoMI3Dxlys1PRCH6P0J5dRE4ibT2lpBbJWJ1GRvr
	MszuklJKtF/kU1zj7W95prmgX/hYagwFZmZwENVZ1iWkgaSQei2jd5osTgAzFPBmJacp/hSXyPT
	+CkEIIBjWkoQsfRbH3Mfu8un+f+pLoME84ykWPmthaR20=
X-Received: by 2002:a17:90b:1b0f:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ae5809fcc7mr2843658a91.26.1793222603817;
        Wed, 28 Oct 2026 14:23:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e72b73dsm536780a91.5.2026.10.28.14.23.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:23:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943e8ff02d0so141069585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793222603; x=1793827403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQ9JV51aLYDpacaXcbipq7EgeCvVh7+04CD76p86tPc=;
        b=MwGvlQ/CvngOXCOn171X3inuHNzmp25wpOYQxDRITZwH/DkfjriWZFaCj7BWk/AwP5
         8kW8WgQT6oBrWR9d3FMAIYBEtEAplzFmYbh5GusQYtCgWDljeSQzQAlkf/6aT54nw3yd
         5QL9/3zJu1XhmFZ8nZq2GRQiofHAWqHRj4YsA=
X-Forwarded-Encrypted: i=1; AKwUvBzbE+mtc5cKdtZdpgOrZ5la+WPyPk+WjKwReFYFSzjVu2tRzJib3rm0MTRdYGo9pmgmKEAxQNTN8KN3fdM=@vger.kernel.org
X-Received: by 2002:a05:620a:6016:b0:943:f301:49b9 with SMTP id af79cd13be357-94408ce490fmr511481585a.53.1793222602737;
        Wed, 28 Oct 2026 14:23:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6016:b0:943:f301:49b9 with SMTP id af79cd13be357-94408ce490fmr511478285a.53.1793222602293;
        Wed, 28 Oct 2026 14:23:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669112sm1368755185a.10.2026.10.28.14.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:23:21 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 4/5] net: dsa: b53: reject conflicting mirror destinations
Date: Wed, 28 Oct 2026 14:23:09 -0700
Message-ID: <20261028212310.3847553-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
References: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
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
rule can select a new destination.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index c38e8c5838bd..378f47e7250c 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2543,7 +2543,19 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
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
@@ -2554,11 +2566,10 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
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
@@ -2595,10 +2606,8 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 
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

