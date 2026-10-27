Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140331;
	b=ZQG3hIgKDYoFbp++dBYIpHg4IF4SBm6QE6B7HF4inUBarI97dGxmtQ/ovmDpLo1hOgSK
	 KKDlDOaV49q3EFHdem2yn/25UuJIZJhgJ3ynlgWrqPNWNELFFIBt33rimOvrBFc6lo7id
	 UK0lV2bR2DoKK2l6mFJRiBXY+HgArR8ri+0yLKW9/Acz30AEWVANeXp+qKBQ705cpyaGr
	 YGN3tkEU6mrv9d2ImLW0gckwYl58UHwOlbh7DKaazEhAtD+TX8kf1bQiBVY5KMh5SBeAP
	 j32YFyQGqC+vQriQ/pnv3Abl/DaYaJvKJqfeaf11+nM48BDK3EJ1zUy5qn5IlwROprA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UVKrm4SxR7vRiZDaPeH2gqLrUndpLkILXeCxDkU1Wtk=;
	b=dJMwdMQ8kS8C6/h0VtHPFjncqmUwxbfTWYlHYT6idC9sHbIkmld4KFHq1w6+6fXK90q5
	 +bU3GhbT1Dq5IdTiH6PjtVaw+RfmtMgKp/3bp0iaYhgP0QHn7BHk9VND1KKQ3YStetqtF
	 PVlH747lSVsRz5rbEJLeML4uegK9oC+WHKfmFsiBjyZsxeicXqvIy2UVJNgX3n1R6vyac
	 k6/dbHtNzs9vAVR8mPDJVHQcZ6gx39DR+ro1v4ka/f7ZXC1Paea3+wZ4317KJZXDGpyJw
	 vvIV5siZUohLoA4B9lJXMX11PPuL3aOM+5c9f420tho1RC/uGmu8vhvZqZN4oeIgG5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Miy/4m91";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA860A2638
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECA860A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Miy/4m91
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-19305bcb72cso317937c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140330; x=1793745130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVKrm4SxR7vRiZDaPeH2gqLrUndpLkILXeCxDkU1Wtk=;
        b=Miy/4m91SGotJnq6ko0yK0avIrbhSItJ9Iq8AzCMmKJWwAju1/IUzTMCsc6SyYesoI
         0H4D7eMqNz8qMY4v62ZhA9F2PICDurIm7JMbnzfCHmwh8U3yXnICuyXytzTGRdAQTCNY
         A0jRta6C78xUJ7L8sS7h7uDrXWe3BiEExf7KEbxnFyxouJE4KXNJ3ZwtWKkZpdIgXvrF
         a0r8hkALTIMysEUsJtUd12PqdLyjWwvOvS/Gu1TPT0ENeG3k90CQQBLx63a56lc4q0UI
         lRzfSAobUDfLCQjG3QqRJ2gmj73FkVAhCVe7prsFYLNmH9lTabFmpiHEMv+RELD5aBgt
         J9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140330; x=1793745130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVKrm4SxR7vRiZDaPeH2gqLrUndpLkILXeCxDkU1Wtk=;
        b=DOwk5faL+DB7CSyRyp5xYemTqlsLwG6tYHWst+BdKkiqh6TnH8Crql+95lZbfAhi+U
         ZCQXgjcn9nYfMJdPQyGkRbT5FVbMG4JrtcYEdTrBV8DaXYWI72RI+6cKrQY12omO6eqI
         KV/xkS1hCTL93tjuzRH2g9uWXoKL3Vq2aa6CZUa9988vY7WKlOU7tX/2BUjDpMDpQYrs
         A8lvTJ2E6Wcmrvq/ItgdtvZtH7g8xsWJg2qbciPMJSNdVUSg2IF9EWWIXgR9qEz9ivVh
         gcH9TNO25BbzVRHORzfdh44FdJ9ltC/uQR8pSF/QuhoWx2Co9g14JVEcrbcZ36HBE9Lf
         nDow==
X-Forwarded-Encrypted: i=1; AKwUvBw3WzkiDmVBvwCQp+xnky0vukPytIcU7YtpPyNW+eNQZ/r3c7AhMxVlmJ4v/CbgYLJJLnnrpM1WpyL81t8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3IVDi/IOu0mQ0pW0I+GeiByn1f9+0RGdc8Nrcx7xVcDUPOi00
	B6mRJ3tjjTBtypcaajL/kYuLHymN3lXi6cLjVwDt5NT4KspHwfRlDjQy
X-Gm-Gg: AYBFou3jPf7YhBwBCBD8fzVthmaGtUSWrk1ueGZvzMAzHcZMJLGjgv2UwJKgKL+6asy
	Y0J8LVa2J7HMAK1h2uR+HwhRq1qxvSa84gwIi9y3ejJGkw4NJPirQbSFD5o5SJdGpHVSxY/S/pZ
	JkgP5qCS+7O34NEiLV9sfrTrebMx4QKDG24yb3bNEoBrPYOltofQovJBUAASJsfThmkE0qGVQMO
	evZmeyAMMfy7+TEKltXR9vUFP+/B/Hr5yupAjpHGzf+3PA0ziblX2C1aZlrE3VXjpod/lC17K0m
	bwQrRfmy7VjlXFJMrJyXz4aUxn/W/FmQSfIbZypFNiycGIbIPJoaPT7uo1oTPNK9BbnshHerGQy
	NH5+Dn0xsfAY/4Xvn7bUl7TWorin7UlY8hCyObY3PV65cY/eC/oUZn20smhql41SAVuavuQmhtM
	uPm3yb3M0iAK6+ozWpNDlMWqoyRLSWjolXLCb9rpe6CssKaDPjI3v3xJMoKefn++BzOKgDnuNCS
	9EUPLKXuhd4XVdDs6LAEbZOCxfzJIyeshzNDFeEblLCmQR76U4wmtZXwE7g4S5g5RjbOzZixNlb
	6u0EDg==
X-Received: by 2002:a05:7022:423:b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1a6c2e5b801mr1106860c88.0.1793140329772;
        Tue, 27 Oct 2026 15:32:09 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:08 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net 08/11] net: au1000: restore receive filtering after MAC initialization
Date: Tue, 27 Oct 2026 15:31:37 -0700
Message-ID: <20261027223140.3774570-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

MAC initialization overwrites the receive mode, dropping promiscuous and
multicast settings after a watchdog reset without notifying the network
stack. Reapply the current netdev receive mode after initialization.
Protect the control register read-modify-write with the device lock so
it cannot overwrite a concurrent link adjustment or MAC stop.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index f8976e324f0e..6b817d18329b 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -684,6 +684,8 @@ static const struct ethtool_ops au1000_ethtool_ops = {
 	.set_link_ksettings = phy_ethtool_set_link_ksettings,
 };
 
+static void au1000_multicast_list(struct net_device *dev);
+
 /*
  * Initialize the interface.
  *
@@ -742,6 +744,9 @@ static int au1000_init(struct net_device *dev)
 	wmb(); /* drain writebuffer */
 
 	spin_unlock_irqrestore(&aup->lock, flags);
+	netif_addr_lock_bh(dev);
+	au1000_multicast_list(dev);
+	netif_addr_unlock_bh(dev);
 	return 0;
 }
 
@@ -1038,8 +1043,10 @@ static void au1000_multicast_list(struct net_device *dev)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	u32 reg;
+	unsigned long flags;
 
 	netif_dbg(aup, drv, dev, "%s: flags=%x\n", __func__, dev->flags);
+	spin_lock_irqsave(&aup->lock, flags);
 	reg = readl(&aup->mac->control);
 	if (dev->flags & IFF_PROMISC) {			/* Set promiscuous. */
 		reg |= MAC_PROMISCUOUS;
@@ -1062,6 +1069,7 @@ static void au1000_multicast_list(struct net_device *dev)
 		reg |= MAC_HASH_MODE;
 	}
 	writel(reg, &aup->mac->control);
+	spin_unlock_irqrestore(&aup->lock, flags);
 }
 
 static const struct net_device_ops au1000_netdev_ops = {
-- 
2.53.0

