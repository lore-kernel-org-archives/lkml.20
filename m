Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394853;
	b=d3ILLL2vKSYRmgN9Ulp49TvnriEmXNAptTThFZNupPKkeBERRNwKJnuFr/JmjP6L1i8q
	 huxoEuzoJo22jK4kSV4AREGlI/uSd4qffyopQh/u8Qzgyl8AobZnedjaA3Tc+0pNQSCif
	 ApoWCb6RlzgdiJYBIyPG24F9nVmrK0SeWuLiaprY/vwW/tnxTDPINwv6Gxq5+LzziSsl6
	 JuxZKNKdGHyVqYjDCCVMSyN32PqpfoYWaXKjcbLjtnUjNiGBwo1lcDpXbKlNxfK7EApY1
	 NYrqRSbCX2pc+FGGLgcqKkt9aChXatuZJrHnaUVU9tGjUsg3LLyuUD1icWkf0Rce90Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394853;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=BMM/lKLw4x9WcDyTwN7IVkv5KR6mnIRrBacIydwUBoc=;
	b=ErQ1mfFn4w9M/YwJmYZLQfAIiJUBV3StaOLcUTI3XB4eWZcVkB0NCk+vquC0TTKGaCnE
	 CXd7FMR8LcUDZzcqXyWBpP5jFXH5wOL2Ltot5IJ5o+9aNrVNCA88lO/MPAGY9DpIOPC6N
	 cthmvwkfFwtNmoyLL33a8BAvOKUMpBu85yp/DDBWO3yX/wApgj6LZeHdMOE+p/oubobJf
	 dkemd+GWsuUW4KR7JOfloUdBkZEaMVP5hYcaSTYoNn8ChOmkAzy1KPT2gUQ0Px7ZuqNxb
	 EFq99geOjtGFL5yc/tLlQD5mlA3PomRIpbHXEYe7KRnNhZSWoo3A3MzAC4NJ2SPPALA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="el/T2PL2";
	arc=none smtp.remote-ip=209.85.210.227
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFA60A3806
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AFA60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=el/T2PL2
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so792032b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394847; x=1793999647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMM/lKLw4x9WcDyTwN7IVkv5KR6mnIRrBacIydwUBoc=;
        b=vYoNlB2Qrqo0haY1rF7t3osZRoIDYhgWa1E3SAPIfI9Gr5r8biKS/tPADUxjU5mOu+
         mr1O5QuXI0rzvyt1Q7d2aUkyRh+UCKUj9RXOAFEa9W7rtbUP0BFV67a71hzLB51CvaGO
         wp5jkgEWjVE+9eu2McnsLgFS+ntjm6lD1eabReUSyEsCpqGS4rXFxL2ifPR7NxbbTKXM
         SDBrVcPj8WxWKhhU8Jd6Ak6F3aSRU0bnLcXjG66SxFkg/Kb5IZ85XW4zjL0oDLhobVZB
         jz64jui/ZsLPIEIrv7jhW36LhLIUHb3/skMOnZ9myguyxb/zx1J2f+3t5Fhdv/yTzoGT
         6DSg==
X-Forwarded-Encrypted: i=1; AKwUvBxkJxWpDlRKWDAXmMVHYlo5oJExLFX9jGVxIPHtdFGXJf9JXQ4z7DzjW+awClQ7Pv1cge16KaSngwzGVmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5zIYgSh3q1oU6lW0NJah31AvSuhXjyiJL91bma8J/STt6TDY+
	npY4Q0ZlYgaZZL1kNCSUOzr39oW5SmnC5lkWipGdWdo8twdplTkYTttF3AWpBzsqL38t3ss5mOV
	1fN2lEHyrUAnpBo4Iu/UzwMY/gyaaGYvSfJ4ow7VM1uIu4gpgOqBPNa4t5z2K2MJfuPLaF+lWTr
	haiN/i17MezM4el7qldsqu4k73Bo9090aQfiCYgi594wmdajWf7Gvlq9cFoxmCDYXDYn0AQ29Q8
	KWrVg3MH/hCQydALjdaZBmzhgk=
X-Gm-Gg: AYBFou2XRLbH6KreInM1EKMrMakVaKsMDUCFWnXPl14LtKmGdJ/tyHmDU8TtbTMgWol
	ZBXXcA6bZ3HcmQJteE3hJkhkllzZPNyxZZx5iKzHTupK4dcWI4RjjigJ563UorqqWbA+BdaWrM0
	o92lZXRm6EkKcAg4qmF0hBD0lFJV1Vsn/4CPZ+GnGLdySB7GkrYD+6UE7NRpcdIR5YsX9GAl4Id
	cV8hkplfe9p64yQjWN1lI/wux3iMoopy3zGD2LUC2LvjInMO0SDtQZl0ZK0hdHTzbNQJ7s3h/Tv
	vN46/sE//DJMAJCSBQOUElxXY/MDL25Q+YQtu0KqZ2/dG7YhuAgv+e+12G8BC2YjA6Vsfh6Kq4P
	1SLDFaDGkd0W2QoUw+ujIGS3WPbuLRsTDFRapdXNrKxz5Jnr9RC6NetSDlCywod/3He952iaPf2
	osxfk1qEV4WeEsYaDZ4aMWXN5aRpyBceOZ7esAeZsf
X-Received: by 2002:a05:6a00:1bc6:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8a9be1a0cf8mr3544797b3a.16.1793394847098;
        Fri, 30 Oct 2026 14:14:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8aadaf82ff8sm23545b3a.19.2026.10.30.14.14.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:14:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so1922769eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394845; x=1793999645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMM/lKLw4x9WcDyTwN7IVkv5KR6mnIRrBacIydwUBoc=;
        b=el/T2PL2HomCZPffzNnABTgxutKRKzF8N5SOmwTc9I5YIJPsfKAG+ejniPHH/+khTW
         v/kKjez5v5mt1NhNrMV5pP4W7z0RWoXej0QJVQFXkOqSO1xEUR7IczqvC30OjV8Ctp9/
         nwMA34RDwhjpEAtXz9AMYN9Wi87nUorqxCYac=
X-Forwarded-Encrypted: i=1; AKwUvBy0RJ7PPFTuIItTXxr3MGBIyiRqG4uPX2h646tACnTr+AZ7G2vb/W4FX4YKAcfg54mkcrk9f7XEShks5ko=@vger.kernel.org
X-Received: by 2002:a05:7300:5988:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36a42426236mr4904966eec.41.1793394844851;
        Fri, 30 Oct 2026 14:14:04 -0700 (PDT)
X-Received: by 2002:a05:7300:5988:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36a42426236mr4904932eec.41.1793394844236;
        Fri, 30 Oct 2026 14:14:04 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm10574595eec.3.2026.10.30.14.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:14:03 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netde@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	netdev@vger.kernel.org (open list:BROADCOM B53/SF2 ETHERNET SWITCH DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 4/8] net: dsa: b53: reject conflicting mirror destinations
Date: Fri, 30 Oct 2026 14:13:46 -0700
Message-ID: <20261030211350.287566-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211350.287566-1-florian.fainelli@broadcom.com>
References: <20261030211350.287566-1-florian.fainelli@broadcom.com>
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

