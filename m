Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863398;
	b=5WKnehJmYa4utnrsG1wdD2YigYft5jJ21qfKTnEtjyMS/jEetnAXGC5ALSj9549UBoH+
	 eqnF8sg+ZBnpmkUEnIOO8OhHJPF2Wn1e3aeWL1VtP4KcHVoHOesufwF3VN7t2Bch+234J
	 pxAChetr//WfcfGQJ31uJ/ktby4os9iJLr0q4ruQ433Xu3X313RT2JQeYY/80fB7ROsbf
	 0PQv9K0WBpqFIG5U4Wj7uZ6DPmC7+Fs3aBJpGe0fdjg+9nuR4RKcTlpA8gfRsPRsC/IA8
	 YOzMvBYvCUXOC7uuZYggFeF88lgv6PcMBkfSBLUZH1J/4/KrDKxxA2RIqWocBFFq5lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863398;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=b+Tq+JzazEzZKCyciOayH6RZTF4kctIYbumNKqLHuUs=;
	b=dKBy3xNchV0M2oV0n7KZgAm89DlVkaHKyzLCm2ufwmSgtn4cHpuHGlb+dkL1NkurCTKd
	 QnaOzZKI+5/tgTNhvB7T54Eh0Lq+vM9Y/BPBTv8v5nkx9CnOU2zDZG1lTRL+02LinXzfD
	 0Qfzi24LlaGSi/PLr262yFNC3zzlRBpce0nFgtZsIMlg9iBR5Tca8RheRuDVblwvXPzUQ
	 7GgPlT4Pua+u4V4wy7n1SSOmIzRYBnQK0YKvHQk+nDrofjB/1FSKOOpnY4DzhjsbGZZu8
	 R9zw6ov+IswHogm6OCy1w43V+CySBcZoia9YlyzEBO3vBO382p+05wqgFP/5x55x6mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M3cVc0XW;
	arc=none smtp.remote-ip=209.85.161.98
Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29763606A896
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29763606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M3cVc0XW
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-70b875f6f1fso4152661eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863397; x=1795468197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+Tq+JzazEzZKCyciOayH6RZTF4kctIYbumNKqLHuUs=;
        b=ehPdjvCXyEhX9PlHy9TIeKbRUlZMZDQYXHHQibRwQtHjK3xYLFpqBpPJo8VtTvh7my
         FEQV7MhBPWWDjTUzzuUV1m3RGBLehwWgIVw/kfDPUITUHFX6z22w7TW59aSzrGVF9XLv
         L4izh0cl3Pb1o9hHMV+5Z2RWPqVciItH2Bd14BHDW9sPaNDmnx3cKgUXr0gFJrKSun6y
         2xwZILlWL0BQjUBkpaenq0XKwuwnbqivbwQDLqYAeQQIbZpnIIMI+trqxvKcMrSvO8fV
         P3D4M1BCtIkOqawcSRZZr7SGFg0ueyOibW5ONxBUbud7888ZQFiMUYc+nKq1uCkRKBU0
         h99Q==
X-Forwarded-Encrypted: i=1; AL+hErHDvXGwrxhao4yPovt48dTRLDgofRXrn4JEGTqp0t/G/yKtH5O9ffIkX0s5/ColNbc7sqftCVb0s3TmgsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+imgg/wtcwqvf1NXAHAk0UqfzdHuP1vFReqWzXZVWXRBJUpAxJ
	4crDE6b/vXj0lBLA0Ef0H1j7PatCEP+XPvP8V3nS/gmfqc1dS5YRJHCeXB09V1vOewd2zHRSGjz
	Ni3+x+/VybP/6Nc2h4vL2YQIxQ89HF2raQnOdWHaiOUOXOAcPRX3L4IBCfgWNsO9RvWB0bVB5yE
	NlG7Jf9kg/koSknNbreKBpuUDNJPLzfouKYdbJmuYZvt8FmEe+0VqymVGao4L61OUfodTyFWHq/
	WkiX5AEZQ3K3VzkM3j/pAm9
X-Gm-Gg: AYBFou0lVYQgTeFD0iX+Pjp9vPvMuzDN+EIxHWcRCX0WWow+9DxhIvmHu9nXUbtqBJp
	Aab9UcqEPFoX3KRi5wjt2ny2TXmcrbGo0Nq2m4yLuI/5I6FNK0VE8VyALApxF3BEMfktbWWmtEE
	Jnrs2Ao4EjNcuqJwWwjiFZ6ZZZfP0w+y7pSGDjCrGhrJAJrL1iKPoYuas0vTDp7aBSZhikJaQ6F
	UvJd8d+IOhNPCX9q/iT/uSphVdSsGDaWQDT3qENT8jU54FJruvsae62sS5Jbssps9cBVWdIfcsq
	S4DmaiI2oGz7Ua2REhM/f+jvBggWAQfNHgRDRO76YXatblPbhjgrFV3OASMjEO63yTLvlyhOtYz
	X65LPSD6JrJ/kyQPgGxhGERhVx9cqNJO6ZS0Tu+Ucll5g7uIJNyufbRGJjBVLXBgztMr3nxEMrW
	j5lb4Gk45gtxodshOUM2pmtF/Yr52rRLYKvD+Pmaad
X-Received: by 2002:a05:6820:f014:b0:6f8:2e98:cfe3 with SMTP id 006d021491bc7-71ab4cfc518mr8088895eaf.10.1794863396988;
        Mon, 16 Nov 2026 13:09:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-71ae862818bsm49291eaf.20.2026.11.16.13.09.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b937ecbb4so28045866d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863395; x=1795468195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+Tq+JzazEzZKCyciOayH6RZTF4kctIYbumNKqLHuUs=;
        b=M3cVc0XWj9fyB6IM7iR72Nyzn0lx6pjuqa8E0gvBRVdmWJPvAmSetK2SqUIF7Y46+a
         hqGWdHNnZIDeFsl9GiOLCmzjk3oy3mmPFGPZhHDBqtYw123rjtlgDMqYF9h2HKLxHFN3
         TrPTBL/ZiVODFfQgiez9Ebjbc9offWz8X1H7M=
X-Forwarded-Encrypted: i=1; AL+hErEi8VWGHDGgVmKsMQTmt1WYY1HmnRQAsSf6rcSHPkHdVIreudo8R+H1kWECXmyok++5JlfiS+c6dxTq/Ks=@vger.kernel.org
X-Received: by 2002:a05:6214:3186:b0:91f:1719:73cf with SMTP id 6a1803df08f44-91f2422cfc4mr182685266d6.46.1794863395106;
        Mon, 16 Nov 2026 13:09:55 -0800 (PST)
X-Received: by 2002:a05:6214:3186:b0:91f:1719:73cf with SMTP id 6a1803df08f44-91f2422cfc4mr182684726d6.46.1794863394497;
        Mon, 16 Nov 2026 13:09:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:53 -0800 (PST)
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
Subject: [PATCH net v6 4/8] net: dsa: b53: reject conflicting mirror destinations
Date: Mon, 16 Nov 2026 13:09:38 -0800
Message-ID: <20261116210943.1352656-5-florian.fainelli@broadcom.com>
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

The mirror capture control register selects one destination for all
ingress and egress mirror sources. Adding a rule for a different capture
port currently overwrites that field and silently redirects all existing
mirror rules.

Read the capture control before changing any source masks and reject a
different destination while mirroring is enabled. Return an extack which
describes the hardware limitation, and propagate a failed capture-control
read rather than making the decision from uninitialized data.

Also clear the whole capture-port field, rather than only the bits set
in ~mirror->to_local_port, when the final source is removed. This is a
cleanup, the field is ignored while MIRROR_EN is clear and is rewritten
by the next add.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index dac6013f8fe2..64e04c5731a6 100644
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

