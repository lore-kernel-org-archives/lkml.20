Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231480;
	b=pxar81FopBLM3+zR6l23UR0+/HyeHL3LDq89vy9N4InZhHp3taPDUNFtk+tDgQmldJDe
	 taVvEbfBgnPt7DCZKaGD5qLA6WlawEmZ0hwIMIoIkYhOkrg5fO9BBKCldXotnBNeFWwJC
	 4fmhnD/kpD334+QwJf7hSPjPO/Y6hx57rnuPV3peztKH/YjTIY8kmF3p34BN2GrK8n7SK
	 b5BmrQn75FgVl6UzF3/2He0uuvuQoYoEkYv04TqGj8Zjup+x/pPssW1XhehC0luSursaK
	 PZPYT3hiMdVPpqKMyndR9/l6np5dj3uOGNFyCWLDXNi7BrO1a1jXFf+8O/PVH9gONEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231480;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VXSAHnvRrdjdq7C11KhgAqObZZKQ4MrHs0PWN7JbC5o=;
	b=zTiFklcJV58mUTWq8Wl74uVrPX9gz/i6zUGvVhHVjsq2H58u1s3ArcIPHaWTkS/xxa+C
	 SgnU7NaUaqXbFUudWl8tS4QuFvAY5J2lLIJ9ZGaHNbAUtCwYAtqxFmucNH4T5iPl384/d
	 QkHlHnaEBjIygox+1syY3jVJ6Q4XOnMyP2PQyAzV4gRQV/AVWRvNDOH7QSxkJQ8/8BK87
	 fgD0xmPGrww0bPXpt6W+/tcjw1uzqkffwuQLettyPKv/qTqbKIwHhL3/FTqCr2QS3ZEQ6
	 KLQIERwBRZjQDxYQeIZVNDEGb7fO2BlTXy+UaX/WoZ/lNGj7ny1tj2/PbGNd7NTIzDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="R3MFy/yF";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D94606A337
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D94606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R3MFy/yF
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso98193a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231479; x=1793836279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXSAHnvRrdjdq7C11KhgAqObZZKQ4MrHs0PWN7JbC5o=;
        b=yHLgr5jZjI8/5GC9WMwYBnlY/stnTrPxsd+eIr+t9OgF5ZbKaaf8EOmisEkSy7KS2A
         KkUa+gFB/hkfwOGV2L5khHWbayMg51oLN5nw/FeIUB4yXZBmwxVmY6q88b/5xRVR7xzm
         YMeqy+EKMqE0/O1qyNMEtfpMW/pWYXglqKkpYPtZT0fFobD9T70/Jxbhkt1g8TUJNpkk
         b1ADUlX5lezGkYeOCI2+mP3VO3GLXkUpivm9fo4JAW2rX4uUsmnm2a01VVvqKXhOpUlo
         wOA0NO+PPe/bY0vc3IRsGBrF8hmHlnrlR4Jq1nQNXsgrASHT7cVgfGP0QkfR5IuWn+gP
         DqnA==
X-Forwarded-Encrypted: i=1; AKwUvBwraWWU5cRsrJVeDgfg/1LHY203MMtyjwIkvM0e8PBSgKWd10J2DfU9QSyeGjTqRtgwtNTgS5lp6ghympU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ9VzXmz6jy/2vyPsU/ghM6dMuyOZssnqrlGIX9WNhuNwZuJBc
	3g/ol/+5+F4RBv+LXaP18e6hals6jRrCx0rAdu07x8woVWquA2zTcjb9g4KFYE2TiGH+g7W8NwQ
	EIR8lvOk8re31Q0H46K38KV4z6125AKhmC+43ma9mWhyUe1oELmM0pJ3Vg2qAvTVe64HP9qm5VY
	AcfjmMdIXK0p4e4+244xXkLuDjmG01sR0B84lZQLVi9lTUNrkCucL7JuIJcQK/S7l2SSwG9dT/p
	ot4/eMpsLMIAw26Kq+S5Q/q
X-Gm-Gg: AYBFou1bljsPY7cISqPxumXIUdmmzayMMU6KSTNdfa+36lWjdPIbxofMR5z9oBq6Uu/
	rACgVt0k2R96B4i7MbdsvSRHjFbcv+Nlt0qKrJ4I+SxeohJAWZQQa+GyU0HgCjTggZGRrETtpiY
	GMrBMI/gC01UzrxQXWtLJeabcc784uAgh0e8z0p4jDMOJ2RGk4+kmAzB1tCPSqO6iePJ+sAaxsR
	xsGPq3IP+PQ96E3Ic5y+zo3x4JdN74YhTtBSVBGIm6AgkolCumgVLF1iyqB6Y+hw7hlwgZwYGs/
	R072ynaDtyQAeWhV4IVTzTD0rTOIrGDhE+U7sidugjJOG8IgfID9VanOUmivoDsyS9xT/dSdLTM
	5cYKpXgqy6B+SUVVFw09TMFz+OqeJxbZ1xh+5+hf1cRHZIsy64MWQpI6sFt4ybB0SQnL8E5RXDp
	5BLYSY3JvTjFJOF+yoNqOsmht2R/s5dKlvfswuIZRv
X-Received: by 2002:a17:90b:4b0b:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ae6ecde884mr551218a91.8.1793231478656;
        Wed, 28 Oct 2026 16:51:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e70a4c5sm784858a91.3.2026.10.28.16.51.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 16:51:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7bf2d740so4799636d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793231477; x=1793836277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXSAHnvRrdjdq7C11KhgAqObZZKQ4MrHs0PWN7JbC5o=;
        b=R3MFy/yFotiuXHlmGGYlxVcG6yZIJKAIjI+3GTkGsFvN1JSks6Xnw/VjGuM90A8sju
         2j+3stqvWFvJRRa+iPD/CJGbrOsE5BrrtHr/rwgwJO6VyMhi/mYZ84HMElfAk5XCgU/X
         n/EpgQn4gXwG0dHd8Wy3mZ7YC3VyBxGwUYoqQ=
X-Forwarded-Encrypted: i=1; AKwUvByE03mSv9mZscB9www39UmJtgQHnWTnzxrXcdQXPe5c2ENShxsjSG3IWggzoaQDZCQoHv6+OoOBcHUtDyE=@vger.kernel.org
X-Received: by 2002:ad4:596c:0:b0:91b:b26a:9793 with SMTP id 6a1803df08f44-91c9089912dmr18287056d6.35.1793231477016;
        Wed, 28 Oct 2026 16:51:17 -0700 (PDT)
X-Received: by 2002:ad4:596c:0:b0:91b:b26a:9793 with SMTP id 6a1803df08f44-91c9089912dmr18286786d6.35.1793231476540;
        Wed, 28 Oct 2026 16:51:16 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c84ca44e3sm23074216d6.10.2026.10.28.16.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:51:12 -0700 (PDT)
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
Subject: [PATCH net v3 2/2] net: dsa: b53: Enable legacy IGMP snooping controls
Date: Wed, 28 Oct 2026 16:51:00 -0700
Message-ID: <20261028235100.3892374-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028235100.3892374-1-florian.fainelli@broadcom.com>
References: <20261028235100.3892374-1-florian.fainelli@broadcom.com>
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

The older switches do not implement the high-level protocol control
register used by newer devices, so they are currently skipped when
setting up multicast control packet delivery to the CPU.

Enable the IP-layer IGMP classifier in the 8-bit global management
configuration register on BCM5325E, BCM5365, BCM5389, BCM5397/5398 and
BCM63xx. Their manuals place this control at bit 3 of page 0x02, offset
0x00. Preserve the other management fields and propagate access errors.
Clear the separate IGMP redirection enable on BCM6318 and BCM63268 to
use snooping mode, as documented in 6318-PR100-R and 63X68-PR201-R.

These legacy classifiers have fixed forwarding behavior, including
query flooding which excludes the IMP on BCM5397/5398 and BCM63xx.
They do not provide the newer per-message IGMP/MLD controls. This change
only enables the documented legacy IGMP handling; it does not add MLD
classification.

Keep BCM5325M and unidentified BCM5325 variants excluded. The BCM5325M
manual reserves the global management IGMP bit and instead describes
snooping through the shared mirroring engine, requiring a different
implementation and coordination with port mirroring.

Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 23 ++++++++++++++++++++---
 drivers/net/dsa/b53/b53_regs.h   |  2 ++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index e54f6d4d1f7b..957a1501d3f4 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -841,12 +841,29 @@ int b53_enable_mcast_snooping(struct b53_device *dev)
 	u16 val16;
 	u32 val;
 	int ret;
+	u8 val8;
 
-	/* Older switches use different IGMP controls, not HL_PRTC_CTRL. */
-	if (is5325(dev) || is5365(dev) || dev->chip_id == BCM5389_DEVICE_ID ||
-	    is5397_98(dev) || is63xx(dev))
+	/* BCM5325M snooping uses the mirroring engine instead. */
+	if (is5325(dev) && !is5325e(dev))
 		return 0;
 
+	/* Older switches classify IGMP in the global management register.
+	 * They do not provide the separate MLD controls of newer switches.
+	 */
+	if (is5325e(dev) || is5365(dev) ||
+	    dev->chip_id == BCM5389_DEVICE_ID || is5397_98(dev) || is63xx(dev)) {
+		ret = b53_read8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, &val8);
+		if (ret)
+			return ret;
+
+		val8 |= GC_IGMP_IP_EN;
+		/* Disable the separate IGMP redirection mode on BCM6318/63268. */
+		if (is6318_268(dev))
+			val8 &= ~GC_IGMP_RED_EN_6318_268;
+
+		return b53_write8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, val8);
+	}
+
 	/* IGMPv2 and MLDv1 reports use the group's destination MAC. Once
 	 * the first listener is offloaded, ordinary multicast forwarding
 	 * can keep subsequent reports from reaching the bridge CPU.
diff --git a/drivers/net/dsa/b53/b53_regs.h b/drivers/net/dsa/b53/b53_regs.h
index cfdb5ed38326..e994d3a188c7 100644
--- a/drivers/net/dsa/b53/b53_regs.h
+++ b/drivers/net/dsa/b53/b53_regs.h
@@ -217,6 +217,8 @@
 #define B53_GLOBAL_CONFIG		0x00
 #define   GC_RESET_MIB			0x01
 #define   GC_RX_BPDU_EN			0x02
+#define   GC_IGMP_IP_EN			BIT(3)
+#define   GC_IGMP_RED_EN_6318_268		BIT(4)
 #define   GC_MIB_AC_HDR_EN		0x10
 #define   GC_MIB_AC_EN			0x20
 #define   GC_FRM_MGMT_PORT_M		0xC0
-- 
2.53.0

