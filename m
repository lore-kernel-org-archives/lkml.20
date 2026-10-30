Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394992;
	b=oij2POjZ0ws0morBE5UwRgUzcuX+joOIJsyoSS5ZUsdJ+07Qujp8/PrHR56rFBIxVA+3
	 ehm7aAZVtzeGW7ZuO4JCKKQHoBk/EIArlTMW3byAR4e9IaHQ0tIBAFOv+xdtJq4EwBRC8
	 vDvknUp0OHAcO1DFXyc1FR3sjK9TXY8s2Omx0BgJqjLZyuIz75MBjEcV4KWgDynbksH2n
	 DfzInXqZ5PWWrMz5MsBXy/5PZeWweEeLv1LMYtxke4TCDzDlWl8KX2MnUNWXes+5WwirM
	 R3MxRn9egksDre3HHRrE+XP1WpdJKuxqR5mZoIXjIlLrHXQGVFH3keIDNfcAJ+CnbVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394992;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=BMM/lKLw4x9WcDyTwN7IVkv5KR6mnIRrBacIydwUBoc=;
	b=nqmQlVEkW86EtJgXKRr2WMY5YrbJNjN1TxYtQvcH4D+kSbPFfUbq5mpNA8SFvNU8Wd5y
	 Wuv1g80VK4oU11x2/sAjcHy1Li+O/WKHBb4Bgcy/IAVLiHnq0pzvwI/cv0Ju9jbHF0ayN
	 KMcqhHRv/1P28RB+9TIwHnMm2NwSOE5amhJio65l4TTkY15Cm7AsUeTvGTxfhDuHKlYDF
	 u+SWVmuHuC20KrW3lNrIU5WZZn5AIa4p6QjhCr8UurHFvI5yQiSX7AkCzille7/WiTyvO
	 IFteOLlQ1EzLa+jc8bM6IxkInUIJxqjBWBaZjuMz6m1cFJgOLuSUgdX8Z93V+dB8qFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z6ZjTrGW;
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0EF60A2616
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D0EF60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z6ZjTrGW
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8a594d313a3so674135b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394992; x=1793999792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMM/lKLw4x9WcDyTwN7IVkv5KR6mnIRrBacIydwUBoc=;
        b=hqdSuv6glWcO6N+ZcFD6WTwPTJanpGEuhgjLdCrUgEoBU7oH9Uw7lB50aywS/GrLmV
         +wN5Dtqp/jQOQVKx2jGVTr17AqNm7l7+FRVrOwKPwzTGBalUJiv3onZ6/FX02RPshHKc
         m1Zp7GCQ9cIuysAffqoZfAvFUTHV5J64GLBtpVnOoaMlcykQ3dY0aRlcR3M0wXbo2dy0
         BxCVeZXqSfS7o7ms0Q+BGpMsOQNiNdtuQQTASb3m6RQK6R1QCqV99OWTFXrwUhy1V2mu
         pcINCAXLRsHwHlWinAuDMJuMFgE6AF7G4Frv/0mQhcXpxhTMdYiY923pgLzCqhgKa5NE
         CjIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxf62MlVLtLT+PI3e1CiKIoQMux9f2eEwtxb+PH4otvbR80TPQC+MyvX9AaJf9o2wDPZBGvGIXOAfQcP4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAxCozxBoYxwbVKUdDvawe4YUijLZFYnqlgD9AUBHcfMngsjuG
	9eg1ChoF7+UEk3tmVj/W+LAsj/NLf2St7camv1NLr9DroDncAtVR2wR//P7P2TgqhdlyArfLsVD
	oDPso4kRc1a1M3zGk3Xu93BK61ghshYEMKKs3+zOEvZRAn0f/+XLgqDakwtYUL6Tot7fZH49pfY
	5W12uFkt1WlEPEA+M8TJEeqgLOAhODxcKzcj+WNqkiTru3lROOZ4W1Y4DXhQEEH/BAQ/5CcezO4
	fBDm2B8FHFmscwVAyDIIV7E/iY=
X-Gm-Gg: AYBFou3X1Z4bMJg5Cfuv+WO4ElE4f4hEvrmPNQfgS7hBZEUdvhM+1YQWlmqlKkPkL7J
	tP5dl5ADSDKuoGS3nNejaQ/0q/y0xsduViSpD9FXef3yEehzEu0HQBueGEnh8ISZHholsrawmCz
	bxeCgEIEfG6g8jI2/AFecezQH96eqnT0Yviy5gOo9K1cOmrdYHh8YehUmACCPvuagOkl8nDNkrf
	3LmDClfcd7nESZ93WKEHY7hdGi+LmWCTsRenUzp0q7hZ1UFHFjdeK1tA2QjDguBkfablyDFlNUC
	wK8ZON7xnVfjBT8em5xPpN5NN2uA4h+iGbPxX5uLuAaVjTBacJ5f3mKS/ew4clHjwj1QGpMUAE2
	duBlnw6vc/PFwx37GeHL3LgdLd5vK+f+mygrHEnCqjVSSySrPkttvUhH04pgrDcMYLw6D2QIR/h
	7keDjxUtgcAPXevgLI6DNHPS9G3b34jQYPpEDpPM8D
X-Received: by 2002:a05:6a00:6c83:b0:899:915:792b with SMTP id d2e1a72fcca58-8a9bfddf73emr3076620b3a.54.1793394991513;
        Fri, 30 Oct 2026 14:16:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8aadaf86637sm24621b3a.20.2026.10.30.14.16.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2479402eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394988; x=1793999788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMM/lKLw4x9WcDyTwN7IVkv5KR6mnIRrBacIydwUBoc=;
        b=Z6ZjTrGWWE0MRcRorrDYGIFfme8tua3ta+Z4zViooeKhL3+YIHohpT79mS5abxBxyW
         bfiSbg8eg7ZvI8jgnccj057lruq97yL7XQLxVHWifvkLwK4aOJk6q3U1KgEGZdmzZOzG
         8xONzZL+MAuwfNN8qyLGExCjCjfELzZ8i2jMU=
X-Forwarded-Encrypted: i=1; AKwUvBx5KEkAVHfzEv7p22VFXy0+1StyE48dYj5ZgHZDapU8LXJb+A8KyNic7/kmi2P8YYfD1S5ktK9qEr58Ug0=@vger.kernel.org
X-Received: by 2002:a05:693c:69d2:b0:36a:1294:59e0 with SMTP id 5a478bee46e88-36a4241eda9mr5274230eec.24.1793394988285;
        Fri, 30 Oct 2026 14:16:28 -0700 (PDT)
X-Received: by 2002:a05:693c:69d2:b0:36a:1294:59e0 with SMTP id 5a478bee46e88-36a4241eda9mr5274156eec.24.1793394987481;
        Fri, 30 Oct 2026 14:16:27 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:26 -0700 (PDT)
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
Subject: [PATCH net v3 4/8] net: dsa: b53: reject conflicting mirror destinations
Date: Fri, 30 Oct 2026 14:16:13 -0700
Message-ID: <20261030211617.288562-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211617.288562-1-florian.fainelli@broadcom.com>
References: <20261030211617.288562-1-florian.fainelli@broadcom.com>
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

