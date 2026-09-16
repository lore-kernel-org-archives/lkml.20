Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159271FBEA8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524254; cv=none; b=rf6V57Q2WmFDAhsdbUx/J3jd1x4Fvv1PIWiT+deWlcjMoOwiMr44lYD1WyOPgyGNP/mjNUfU0Fek3Byresj/4DMhtkVw+96XpZVVcl644H1L7nShuJi2LZA9G0RRxBUQihjqlLZyqoCge+i7ngStp5oN9zVx1bcfqSI5/icSkhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524254; c=relaxed/simple;
	bh=VYcIVUSYQLV4sjwuoeaRc5KM8Pt0LayXAdVTM+vIopM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RdVCSITyVhAOJdtFvmo5muVjXCroa8dwowfO+E4p7w9KslcxQWA/TOBD8TJLSl7DZg98sRqp7UHA9X8okWinG8hbOLsVDR6H2Id6v+NHaeiNaJoFxsLeFDBwofGYRMNWuN/GXYoITaEdXcX/Iv4qB8Dc8QzThjp8ICqpBDgiEIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dju/W7Mf; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dju/W7Mf"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85a4329731cso262932b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789524237; x=1790129037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GY32qtKDHLqp705JJ4dXs20ZzYr5H1bBKfaTF23PTKo=;
        b=Dju/W7Mf62vk/L0wvQpBefMZzv8TJPaWkwY41Y0SYjiTKxxy6Yapehzh8+/y8sqWG8
         OA8CgXwV1AyPokG+fr3xKR5UwjDGbpBQiHs/6EflRLtqGwZfZC3XOaX9DzDg7bx2ttjk
         h55wAjKixZn4si8w/AiRtV+gQjNjYI5ZUds0WszsFz5ZHmwlta2yuNpbt9Y88yGpfprv
         Ybq/qCUucgt9HnYo4I2ENvhNVN5QQClwGpHIm0mRgJLAQOB9VRgAsyR7DstHQ5hLcuRV
         XcbmLBQpkfPQ+Je6C7fYAzwma8oOumjjTq02EqvdZokI6UffpXmlke1ibT+C8QrnrPjb
         1rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789524237; x=1790129037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY32qtKDHLqp705JJ4dXs20ZzYr5H1bBKfaTF23PTKo=;
        b=cDaGWqqd8MJo/gMTI93co20ikR3cvnbzf26w3M0XDWu8quCSb5XvuK+6xIxt4jzOx3
         vGCI0lCUO+0HhhwY6uCjnTkjN8S+EbZINkpYqUg8gbYEnDSU3XFer6z5gwReXKHfyiKZ
         Ubvw4aLOZG+j7ojEmKfH72hsuUA2QLDvaxsJvJuLrP7kH6Njjl95oQhjSYWEDVVNdlMR
         Dpg6VwJs1wgh71iFN7ArXM+rN6+ZrwTa9BUncTRB8WKtyCCYUGH2NTW8++HKJUhms1DL
         3q8Hkdew1GPj/YRHPzUHkvX+xHUOT7xhQ/cvFJY7TUMjKyUjNNmpLnPRiHK0F8Ga1sGj
         OQyA==
X-Forwarded-Encrypted: i=1; AKwUvBxFjnIFScfIqmnX+6p/EckuEw6LqoTayMiKFF7r+4PAavocRdRjE6wRVGmL5h2KZl8y9+lD0fawRHAQqEY=@vger.kernel.org
X-Gm-Message-State: AFuF++lnNEPd1zQ7EghHTqjHWaQHHg7nsd2u2M1w6b8MfIsS/0CzNGp4
	5+X3zevARaDADUhydqRYghuvhqwtuFThxhyg+GXVgQRtoEY484ph5V32
X-Gm-Gg: AYBFou3mqyh1XXESroNQd+JAYdc8uDSjNFlTcWRPFN497b5Kby3J2aeEsAmbWw3RLdO
	rh0SMeA5KonptQUnLup8+UyucjqXud5FsylCtTzUPVT8pDs0Rrvfelufv/VtP9OMDthyFCNXbjV
	gEPFcNnpYMKfYz/Z7cHyW3542I1l/B3DQ3NlftpZjtRxVWamJQAUPF6PSwmAquj2eAxm5bd2l5E
	NPpiqqzk5s7WCyQ8hSVik+r1k9+uu8XG1U1HmuwRxgfcKVSVBgBQ7kjN7qq+bTtcPH8aI9TmBfX
	/6Fqzx1PrxPwa9XnTdzErwUaYAxLa9GFzJxRVQttpLjW+hbI5P695PC80ywTPKtotM1lWD2HcXF
	gIlDtho+fyXEFtJ3N/Bujl56WOX0MOWLQ0OmVt3IyDQZPnnWCXPw75WppoQi4yB+j/Sxm2hot7s
	H/coFQb48hzNUlIch4YFcKhWxk1RWoVGy3PteblmbIM23E62gSdFryzg==
X-Received: by 2002:a05:6a00:1a8c:b0:857:7317:cff5 with SMTP id d2e1a72fcca58-8723a4942bemr1132881b3a.22.1789524236922;
        Tue, 15 Sep 2026 19:03:56 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872024e4369sm385031b3a.58.2026.09.15.19.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:03:56 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: dsa: mv88e6xxx: fix netdev reference leak on remove
Date: Wed, 16 Sep 2026 10:03:40 +0800
Message-ID: <20260916020340.2580417-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mv88e6xxx_probe() uses the referenced network device provided through
platform data, but the remove path does not drop the corresponding
reference.

The probe failure path correctly calls dev_put() for pdata->netdev.
However, after a successful probe, mv88e6xxx_remove() tears down the
switch resources without releasing this reference, leaving the network
device reference count unbalanced after driver removal.

Call dev_put() in mv88e6xxx_remove() after the switch resources have
been torn down.

This issue was found by manual code inspection.

Fixes: 877b7cb0b6f2 ("net: dsa: mv88e6xxx: Add minimal platform_data support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 80b877c74513..e4394af2a3a2 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -7464,6 +7464,7 @@ static int mv88e6xxx_probe(struct mdio_device *mdiodev)
 
 static void mv88e6xxx_remove(struct mdio_device *mdiodev)
 {
+	struct dsa_mv88e6xxx_pdata *pdata = mdiodev->dev.platform_data;
 	struct dsa_switch *ds = dev_get_drvdata(&mdiodev->dev);
 	struct mv88e6xxx_chip *chip;
 
@@ -7486,6 +7487,9 @@ static void mv88e6xxx_remove(struct mdio_device *mdiodev)
 		mv88e6xxx_irq_poll_free(chip);
 
 	mv88e6xxx_phy_destroy(chip);
+
+	if (pdata)
+		dev_put(pdata->netdev);
 }
 
 static void mv88e6xxx_shutdown(struct mdio_device *mdiodev)
-- 
2.43.0

