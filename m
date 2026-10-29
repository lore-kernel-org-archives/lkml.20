Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308609;
	b=y7to9NuQF9FSenj6myk4tR2WAx9aAvjZlntGyKaYgdTeE8CVoLb7c63S4S5N+yAVclvP
	 RyNNli4wSnkiNmXJhXQgrePn0szecVuhMTH5jornghgI+mOimr8BvU8j5CHtkAwspKDe2
	 bDebGaGb7B2tZqtC91aYwPJ0oBIJ7vcxaOuIMpA6cA+sUkJULVMl0cr9v69vyWkdiybLv
	 UGXB7X94YnNhpfqHHjUdPH5/81NkzZxnrB4pNXC9eTA6is1jUlZhjubh+OLC37kdxBd05
	 HucfRgNm5mNbyxnjo3zETiR3DI0flooQi7TXSX5qfkvVnDdUw2ulX5QMT7IWriE8uFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308609;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=//FswPmpGUCUeaiDqBbIuHbgZKjvPl5eO/5v7O9w/Ro=;
	b=mBbd+EJNmlbn3WcHORdSU1IaqDFTze8CSSA9wKEpvwQieSB18gsulaTP1rVmCgPWGD6h
	 O9TLMxwLt9cyUnivlhApHcDcAfIiAkPt1YsnHcb27TEMjHmuu+M0Pc8u6YherBl7SJQX0
	 vfY7xNPc/Hka+FBhnmZj7Q/FjvSR/OlQ1J9YusS7kvxY5vRZuqN4wC0eMW0V8/OESBDq+
	 rqoNf1Ko0hRyXRVTLAo3+ajW+ACvicJ3jasY7jAZ5ugOZvvID/pUDyY4kzhY0E+BREKnX
	 pOVyY6Pvlr3xK8pO6XXlFj0CxjWqwUlNG+RR7KakJrJoR9kj7KvbDNDqlUlPXnWSHgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cu3nR16R;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C3F60A2610
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C3F60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cu3nR16R
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so25014a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308609; x=1793913409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//FswPmpGUCUeaiDqBbIuHbgZKjvPl5eO/5v7O9w/Ro=;
        b=kXSuLNqVLXed9kPEnu1X/SuqVGtLe1+b7LgtyN6yrzWTZ/9WzpDvmXIlbHnic5GTnd
         lRdwjeO3uiLSw2bD+YFqDLdN4hGkYU+YaBU8mazrbK9ONICGLZs0+vtvrlyYKwscRTzR
         habP/Ao4/uZm+uCfKBQ8OOHuWeTU4QSoY87Pv5nCfp4V4TdKfn6hLtH5K1BlfX/cneiW
         qK0ha0X5JT93/SKdXjkPLF5PZOwSinFzUliUjm8BsBcCNsbQJCyPAeSXeQ163RrfqUh/
         qx6Zg8YunBSJXoXYC2ZV+WiE2kFIPAAoQfN/GPUKxDeYxLgBpb2C5DaHwytNPPtrISMP
         K+Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwReQyN4St4Bhq+5HWogJ+yWke1zDb+90MGOjsqCrQN3ZBqGD8PSSQxDBH9TRny9hcO9P45xpVsZzr9k2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9r0o4M0xxAx/Eks5vSha/sb+EF6gqnh/tjdfAIRkBDgnc7ozx
	NZrBmMNdqB0ncUsXDQazykKvR2TEgr9yX6gTlq/8f6mgSTBZ9ooyffXNEZY8fOLelQPfNMX4XVy
	ymKhVAQxxJKdSyu3Imaa0Gpceem8Qm9yPyFvzh1DFd6/KP+tXxqQGOdZ9VYW4rYlIMcPFLUzwKU
	d1Y6+grIqD5Lj3TTYqV5tGC3L7zGnXUA6RO3h9fdd2NOzfA8D+3yJ2NC62kNRBLE+PaBkfQP+Sq
	fomBFQhCZJqD7fEl/FbICU+tvM=
X-Gm-Gg: AYBFou3WvTLnH1na0xH11+88/RBByAhwX1KjXyGkLWMIXaAp7WiIh9P64MKV9aesNxM
	OKTSEdMtDo3TBxgGVfK1RL2a+RzD/T2GG8ZMNY9JSPZvJomE4JKaZaFuNNzhjDaXUNO6mK4k613
	PWK1a7lB0NDTLnqPAWtxMOL2gdeuZqO8XTDWe35D3GlgNhL1dTnygAKNnNVjlfa0F+xX3UoONGg
	MkFE8oFa34X0ed2mlOgaktHeCQZAz762TdmX/6xtiWxw7jf5+GyabAgkSvcDFWr9sxeFt54+T4S
	mU1HfXnOlMsf+fCwbzDTcFFsvuV2/bVRBaWf8rKqTwZxftPgLpQS08ot4aK2sQjM1xqgE9fzkux
	WodAnVIvNjuTTDMCZMhKfBHgPmH61XIxJVOJ83ElvQphcMPmwWcxPofKHFNKxmHrQRTZj7CNhJY
	9Yn49qA8jRo5WKERe80CXibg/Oz4OxyTAA81GUg/bN
X-Received: by 2002:a17:90b:2f87:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae897f6d60mr156453a91.59.1793308608693;
        Thu, 29 Oct 2026 14:16:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85f56a85sm163397a91.1.2026.10.29.14.16.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:16:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c85c9a756so2848406d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793308607; x=1793913407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//FswPmpGUCUeaiDqBbIuHbgZKjvPl5eO/5v7O9w/Ro=;
        b=cu3nR16RAdsJ5xY2rnUiRopuM59Nqqp0xX964Zk+REPuxZhGLSOd5xjiQX57pz4bGY
         zZinYzZVrzFxBGQ87gFeXy2dThaZa2wUW9qUK/fWnG3HMiw/41gyjK4bvzKgcg4cHi+L
         hCbNKxtIk+6xYqiEJpp3HY2GuHq5nPVIgXvZE=
X-Forwarded-Encrypted: i=1; AKwUvBxDlORwPlVwWdplqL5HVvvC/x2sIBjxQNbQy9MddkjLxFC4PFBcfA+refK6/AXsSAu56kIi3AELUtdnyWY=@vger.kernel.org
X-Received: by 2002:a05:620a:444b:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-944216fefebmr85370885a.62.1793308606889;
        Thu, 29 Oct 2026 14:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-944216fefebmr85366585a.62.1793308606424;
        Thu, 29 Oct 2026 14:16:46 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314f888sm6326926d6.35.2026.10.29.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:16:45 -0700 (PDT)
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
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jon Mason <jon.mason@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4 1/2] net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
Date: Thu, 29 Oct 2026 14:15:39 -0700
Message-ID: <20261029211540.4123250-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029211540.4123250-1-florian.fainelli@broadcom.com>
References: <20261029211540.4123250-1-florian.fainelli@broadcom.com>
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

Northstar and Northstar Plus use a 2.5 Gbps internal link between the
AMAC and the switch.  BGMAC_FEAT_FORCE_SPEED_2500 makes bgmac_miiconfig()
configure that speed, but bgmac_adjust_link() subsequently replaces it
with the synthetic fixed PHY's 1 Gbps speed.

Use the forced speed when processing link changes so the MAC remains at
2.5 Gbps.  Together with configuring the switch IMP port for its 2 Gbps
mode, this eliminates the output queue discards that caused approximately
1000 TCP retransmissions per second during an iperf3 transmit test.

Restrict the platform forced-speed flag to Northstar Plus using the SoC
compatible, since Hurricane2 shares the AMAC compatible. Other platform
AMACs without a phy-handle must continue following the fixed PHY speed.
The BCMA path already selects the flag only for the Northstar family.

Fixes: f6a95a24957a ("net: ethernet: bgmac: Add platform device support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bgmac-platform.c | 3 ++-
 drivers/net/ethernet/broadcom/bgmac.c          | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac-platform.c b/drivers/net/ethernet/broadcom/bgmac-platform.c
index 4e266ce41180..4880b1890481 100644
--- a/drivers/net/ethernet/broadcom/bgmac-platform.c
+++ b/drivers/net/ethernet/broadcom/bgmac-platform.c
@@ -243,7 +243,8 @@ static int bgmac_probe(struct platform_device *pdev)
 		bgmac->phy_connect = platform_phy_connect;
 	} else {
 		bgmac->phy_connect = bgmac_phy_connect_direct;
-		bgmac->feature_flags |= BGMAC_FEAT_FORCE_SPEED_2500;
+		if (of_machine_is_compatible("brcm,nsp"))
+			bgmac->feature_flags |= BGMAC_FEAT_FORCE_SPEED_2500;
 	}
 
 	return bgmac_enet_probe(bgmac);
diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 669eb7ce7d40..9ef7307edd41 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -1430,11 +1430,15 @@ void bgmac_adjust_link(struct net_device *net_dev)
 {
 	struct bgmac *bgmac = netdev_priv(net_dev);
 	struct phy_device *phy_dev = net_dev->phydev;
+	int speed = phy_dev->speed;
 	bool update = false;
 
+	if (bgmac->feature_flags & BGMAC_FEAT_FORCE_SPEED_2500)
+		speed = SPEED_2500;
+
 	if (phy_dev->link) {
-		if (phy_dev->speed != bgmac->mac_speed) {
-			bgmac->mac_speed = phy_dev->speed;
+		if (speed != bgmac->mac_speed) {
+			bgmac->mac_speed = speed;
 			update = true;
 		}
 
-- 
2.53.0

