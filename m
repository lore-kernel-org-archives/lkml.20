Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559758;
	b=CQa4jIzSPoe1KBiCfECxwH0lfKyjm1/0LapKBzxaaPLEFs7BPHWTrfTYkxZuAXwvcmkX
	 30VJLqJ5iuqOPOUNXnBrUiG6Qw5khShKIZhuCWZ6Dgp/ZbL5Lx9lzaQt9Uh4MW+ekbU2Y
	 JtydY9ukVqGi90kPERFJDiPP1OPz6MfdYC+JLMhJqrcuBOp/42LO4fv+5pziO1gCqYYLn
	 THFwfMHZYWMJ/1g9fbxE2h6rGpWRmQHoR1Whv/XkI35PJ7k4W4E93ddXeKV/9PXs6jZrt
	 q4hY/ZBXjNO6s9d3XcXizaGEvcAaRtwnKjLOGfUFOrV0Nuh0zxJuJkYIUjWO97Uogdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4rqhIjJS9gtiSswzyzrQGj9FsyK4TI/z+J8ZIwdTjok=;
	b=1D2eAMS//ePQEOIcAKevo/Pp9tVgElRoV1OTGgrytZimULvaVLYR/JRvsV7hsLXoOZ9K
	 3wOTGPZreBfjWIThP9DYvdxRYu8Lsf9OJvBOAoX8D7KhAZvXXf8Vcvbsx8EDluHu6w0xQ
	 mXrcQrmm4wrzMyXw+0hcj8JJn3KJ19L6X/S38VAUpnKRH2nqIpFnRzXh8IWbFG9OSOMXt
	 dkyOxm+bLzQ/CbDOKuGwpO6Q7/C75yDI60AUxhHRY8uVvnnvp12gqZfS8ob1TvdsYyi5t
	 MuqORRO9r7hvBkbS6IjnJEzdAxhmrO1lum264upXWIsCQRI3S02ypyh0DbxVxA5xyEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DKUK5U9g;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40743606C191
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40743606C191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DKUK5U9g
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8446af403b5so720843a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559757; x=1795164557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rqhIjJS9gtiSswzyzrQGj9FsyK4TI/z+J8ZIwdTjok=;
        b=DKUK5U9gGeUJWk2mqTHfjf7C1eMdGZMW06/68FFMXasZ617H5gy/KsNTI+pjfV8/zi
         KlvUIcJ+0htOzjihHdr2rZwFpS+jBZ+Heq4OpBfTBvzGzfeeIPkIrJxIV515/muEiyMK
         sZEqYzR32P4dc9xKzKwBXJ/5+Eq/sOUe0NMeQ6uebt7e9j98HKMYTS3gudAzgFneTulp
         xfxRYuk0qWsN5baBRcM6fae7J7c2VXVWLu5HU3ReJR8Ehr6daJTVodBH4u9VrFikCopa
         XcEa1APKv6HcuiCuw7A0BKCAqD/94sSLK+V+Udw/mZ01AOTY9eMTowuF3dEiJTNLbb4Y
         /pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559757; x=1795164557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rqhIjJS9gtiSswzyzrQGj9FsyK4TI/z+J8ZIwdTjok=;
        b=OyJdKBgjZnGIZUotildwr9IxofjKEsKYDw2jCvz/gn9NTJT8CvkfisV4lTqMRQ7Yp6
         7bZoWpynuurGuiCzoqymDbmUIkL3Coo08dC4lVOwsxjOCLYcKl7xrCE1ralhdQ3hGbti
         muK7rqtrOFLrWaEyOSSq92KJ9ZY5tHLkl4vnjJxyeWQ6xjq4I8n++tPltI3p40GaOlhd
         xyT3rgECRbAEps3fAYVNKG/80MJqi9hhZNjH7NBT0O0mg8WOOwp64kUnksqQfDEGm6wp
         ui68JPug83S/dOpU2GXTZjDKYCrOXoAgaQZ1XEJaalsZcJLOfWjEA5/r+y9DkQVSI9DB
         TQcA==
X-Forwarded-Encrypted: i=1; AL+hErGqkO1MMY1nr4WrclmB36FK67cXPKpnNhDferA9HOOpWZBuna7ikgXZC2TMhRwCl8jIxvuWXnqPeP+Mi2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0LSNEeCOopX9yhNhx3agPX1ac9Vh1j42gOww5Wtmg8unij32h
	OezzAC1edlGsHOCYy3ORV3LdX6eNjSnFF7uir3uNBk6VPFXDT2sh83FE
X-Gm-Gg: AYBFou0bCENj28Tt9uDG+tztpUUIgvD3SJ3YLFJzAVRf1Fn3k6l9u4vlaJtsRgtDp5q
	spPq+0l1pwlWfCBulRFVV5okwoCA3ldGsQUU8qa+u6OtKGzMAuCtLiGjbsuApRG4vj7jjyyI/ea
	xfmXmjAHXm1smhZ0WE/au9mvwzLbPP1Ay9msE9IERYDOzuQtZEOwv5CesHi8osMZFJiho6VXcA7
	zt2WmQEssx8oaoVsBON2iEB6cz4q5BU4qj5ij6RQ1IduDBe8XFERMwshNp7Y7piSpQhJGVUPGK+
	KilPl0PC9b3ZYUbyaLmNVp5mj3L+VMhlS7fSs8P2+jZYuYWSq43X3TLGoF8GqM2ED4JcKe2tc48
	+LPY7ryqQWT4SvgRoFu2YbUuN93ExNGJ22YgRHkwCwTGSR+ROp9YFuCi+lCRpbua8hBOJccTwht
	OEf2ByOu57Yw9wTK+wTaxTcwGpQvHRKTYn1D4aFNXSHuK8bQgQwXVmqHSonKkFVjdWxWpsoaejF
	YStNePtxdDXRkNH8hgiqEr8QSoIyTRMQi4JK2cyllUvVcE+HbmUmviezmM05K26Asj8PrKfBGQY
	QoJaQHB/VMOGd1/xDfGCUMvlYSstwnrU0ePG76Ye/yuZnEp6m3If5/xNZxbWxpU9YtH0gpUagz+
	cA8IU5bJmLsL4eC4z2DO6jWQCkyQEOFHalVSIIhuIZSqG2+uXXFF08v8TS8PgMkXU4pmKUglLwS
	VM0Wr5XQF+wYwScjTYIWEdIZzui2vQlaLvqi4R+DJN1m90hkWCHrk=
X-Received: by 2002:a05:6830:3115:b0:81a:adf1:ae71 with SMTP id 46e09a7af769-86289739f14mr2026123a34.4.1794559756988;
        Fri, 13 Nov 2026 00:49:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm2034202a34.22.2026.11.13.00.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 01:48:42 -0700
Subject: [PATCH net 3/4] net: phy: quiesce the state machine during MII
 resets
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-phy-mii-reset-v1-v1-3-02a55f352a91@gmail.com>
References: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com>
In-Reply-To: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Chan <michael.chan@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

phy_mii_ioctl() performs a BMCR reset write and calls phy_init_hw() while
the PHY state machine remains active. The worker can access the PHY after
reset but before the driver has restored its configuration and software
state. A statistics update in this window can interpret cleared hardware
counters as a wraparound.

Disable and drain the state-machine work before resetting the attached
Clause 22 PHY. Reenable it and trigger a new check afterward, including on
failure. Disabling the work also prevents interrupt notifications from
queuing it during reinitialization.

Wait for BMCR_RESET to clear before calling phy_init_hw(). Drivers without
a soft_reset callback otherwise begin initialization while the requested
reset may still be in progress. Share phy_poll_reset() internally for this
wait and propagate its read errors or timeout before initializing the PHY.

Do not hold the PHY mutex across phy_init_hw(): some driver initialization
callbacks acquire that mutex themselves.

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phy.c             | 27 +++++++++++++++++++++++++++
 drivers/net/phy/phy_device.c      |  2 +-
 drivers/net/phy/phylib-internal.h |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 4ac72a1b4f42..5da8a699446c 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -297,6 +297,30 @@ void phy_ethtool_ksettings_get(struct phy_device *phydev,
 }
 EXPORT_SYMBOL(phy_ethtool_ksettings_get);
 
+static int phy_mii_ioctl_reset(struct phy_device *phydev, u16 val)
+{
+	int ret;
+
+	/* Keep the worker out until the driver has restored its state. */
+	disable_delayed_work_sync(&phydev->state_queue);
+
+	ret = phy_write(phydev, MII_BMCR, val);
+	if (ret < 0)
+		goto out;
+
+	ret = phy_poll_reset(phydev);
+	if (ret)
+		goto out;
+
+	phydev->autoneg = AUTONEG_ENABLE;
+	ret = phy_init_hw(phydev);
+out:
+	if (enable_delayed_work(&phydev->state_queue))
+		phy_trigger_machine(phydev);
+
+	return ret;
+}
+
 /**
  * phy_mii_ioctl - generic PHY MII ioctl interface
  * @phydev: the phy_device struct
@@ -349,6 +373,9 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 		} else {
 			prtad = mii_data->phy_id;
 			devad = mii_data->reg_num;
+			if (prtad == phydev->mdio.addr &&
+			    devad == MII_BMCR && val & BMCR_RESET)
+				return phy_mii_ioctl_reset(phydev, val);
 		}
 
 		if (mdio_phy_id_is_c45(mii_data->phy_id))
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..8b0c1f28963b 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1232,7 +1232,7 @@ EXPORT_SYMBOL(phy_disconnect);
  *   standard phy_init_hw() which will zero all the other bits in the BMCR
  *   and reapply all driver-specific and board-specific fixups.
  */
-static int phy_poll_reset(struct phy_device *phydev)
+int phy_poll_reset(struct phy_device *phydev)
 {
 	/* Poll until the reset bit clears (50ms per retry == 0.6 sec) */
 	int ret, val;
diff --git a/drivers/net/phy/phylib-internal.h b/drivers/net/phy/phylib-internal.h
index 38ee294f3c96..680823633d98 100644
--- a/drivers/net/phy/phylib-internal.h
+++ b/drivers/net/phy/phylib-internal.h
@@ -24,6 +24,7 @@ void of_set_phy_timing_role(struct phy_device *phydev);
 int phy_speed_down_core(struct phy_device *phydev);
 void phy_check_downshift(struct phy_device *phydev);
 int phy_scan_fixups(struct phy_device *phydev);
+int phy_poll_reset(struct phy_device *phydev);
 
 int mdiobus_register_device(struct mdio_device *mdiodev);
 int mdiobus_unregister_device(struct mdio_device *mdiodev);

-- 
2.53.0

