Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD92391505
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131101; cv=none; b=s4q3D8lP2mLU1OHf9sUe7ryfrzy8lD5RqhXdUwV9PX8PXWO5L8REiyFFId/4THkFFLHvlqa3/oXTTj6zyV1aVrFI0zsLFKnLzoAk6JLh9FMWMr0xNELXdHpxVjCOSYAbpCSG9grxgQbJacG9C053cOqvGLTWQClqdsrzjURPJWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131101; c=relaxed/simple;
	bh=lW1SmNMHZLUdjwKr2y0L+Tr3WFC55TvE/uJFRdnFpiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxU2W/YlE6Tqih24qmzhZTYKMnrk/pn2Y+ZZi4PB23d6ibjp0kAi0e4zO/hF24XmFjRKuH88AQoq0B4QTgA1TgaUS7xk6293YF1pFk7+KuPa2y34aHhcuOW/t10t/wYi7A/Sah3jXovgdvqyyrnKuWdTApsPiKNHHblVVZggjg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwhkdu3C; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwhkdu3C"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso4475893eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131099; x=1792735899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWmAXF+DT/idqJMn3V+iTCr8CLKa/928BqRixUV3uIo=;
        b=dwhkdu3C+XLVN5zZZ5nFJlp+NYsKHrupg96O7mn8tHhUwFWA/cgiacTO3YXj1xttie
         8HeP/NRZpQ9tqYrRaqPX7r0XCFgIyXs/lHkJI3Tg2uGtjuGinoVyNUElHgYb/tdAf5d9
         CVawkIps8Kk69CJruc4RMzT+xGB56InDqNAERDb9f6ZKnBfC2fr1AgllOkDH1VW/dsPa
         Eq4dyonv4gxSgKez1RC0YQOFHnBm+ow8zbdFiBZyljBdUn3jFssZQ3xJVcLreHtz7xn9
         T+Iz5xbXcfKEZh+LgnzDTgsX0R6iehR1MYhdW0HmpauuAVtr/vyCs+XFiRWtwu3gJEeS
         Rhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131099; x=1792735899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWmAXF+DT/idqJMn3V+iTCr8CLKa/928BqRixUV3uIo=;
        b=d9nn1rxfnFEOGuKn8N8CfzaKa3wrzJ+SzhoddSjD0fZjZPKWcCHIOuI40L22ba/AyU
         tn9CcjnXiyQ2DjX2TJptuIwN3dGbD4l1W2colwuSairyWVeiBKIOXPsr/exzuXYeXZBS
         OunTrum8j2O31FN02+uISzHTig2MQXkEWraY9eP4wprrywqeA7g1vzQrsufYa24pUxzw
         HlhUNLx9PagNyXZMHj4Lq6oUFNP9HsGW4Bz8/cotDNiNcibswU5EiPd5/1f49XzCNpNt
         0UOSAMCG7+x9rMD4WYqEqugvS3zSTXrGzHKC8zNr7v53YTH9HeTQ0PmPeISTVQ7rfzA9
         YL5A==
X-Forwarded-Encrypted: i=1; AKwUvBzRteH8inEGfIO7O5AMEi92DLOF0+CP1UCcWMnnBHXgOTiOG3U3l7Ni0Ly4HNGvcCzaOieSZi1TCxgHap8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOT+qzff6Am4jmj0vo4+Wdw9QzFGhtWFBtOLmXPdjeE3x604RU
	U3b8toGnjP6PFAtL68Rmeq165B/HPAXBb7iDY/bHTfxP+wNIYr7z5Il+knF7Ffje
X-Gm-Gg: AYBFou2VWex1a5yErvMVQPFLP2h7IgALamzbwcqCexfsptX0uPDAPSH8iYpTZdYSFqv
	MkSLVOa4ZXE7k99oP7mr47l4bqOB6Ttb4II0hyvfUmAuascH+Yt02DwRhMz0e1NdeE3EVevzu7S
	jz6canEFGETr9i0VsUvuB5lp7T7ok2kCa9Wswo7Az3nrk/ftWt5U1rLkjaiU09aRaRk0d89viwa
	iceLl8QQA9iXbZ/JYMcjlwRbV3R4Yoxmh79YeZVboJmeESINR+FXcy+jqsXgSKSW3/xCItDyqSv
	onYbI9e4HxVS01YNbNFR6fz3PcP5sHsd6Mko1dpjakuR3I3sYBzWR8Y+dYnvUCb4UEG+C9f7rcC
	SBKa0fBE9OhsOkjYdvN3DKgJpk2yWN2nccd83jjA/RsjY9jLX9HlIX8OXyL21OC28+BMgWO2067
	1KX1gTQjfeVItHzi2f+B8PzkHGY1R/BtpCktTFzNH7Soivm4wuVuXF8R70v29SgPojM7bewmYvq
	BqFS+eQJDB4II8CDTY/dzxgk/7k2m4hjNf9E3N69EovWOQ=
X-Received: by 2002:a05:693c:4097:b0:358:8bd2:fda1 with SMTP id 5a478bee46e88-3588bd2ffb0mr34500666eec.30.1792131099385;
        Thu, 15 Oct 2026 23:11:39 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm3725600eec.4.2026.10.15.23.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:11:39 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Max Staudt <max@enpas.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] can: can327: publish tty->disc_data only after register_candev()
Date: Fri, 16 Oct 2026 14:11:20 +0800
Message-ID: <e02d5a1d31bb8dbc6397e3469cd0578b85d78970.1792118038.git.chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792118038.git.chaosheng.qu.linux@gmail.com>
References: <cover.1792118038.git.chaosheng.qu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

can327_ldisc_open() publishes the private structure to the tty layer
before registering the net_device:

	tty->disc_data = elm;

	err = register_candev(elm->dev);
	if (err) {
		free_candev(elm->dev);
		return err;
	}

register_candev() fails with -ENOMEM from register_netdevice() when the
device name node or the kobject cannot be allocated. The error path then
frees the net_device and the can327 structure in its private area, while
tty->disc_data still points at the freed memory.

Publish the pointer only after the device is registered, so the error
path has nothing to unwind. slcan does the same after its own patch, as
do ppp_async and nci_uart.

The stale pointer is not observable today: tty_set_termios_ldisc() clears
tty->disc_data before .open() runs and again when a failed ldisc change
falls back, and the ldisc entry points are serialised against .open() by
tty_ldisc_ref() (async) and tty_ldisc_ref_wait() (syscall). The change
removes a trap for the next modification of these functions.

The success path was tested by attaching N_CAN327 to a pty under QEMU:
the ldisc opens, creates the net_device and SIOCGIFNAME returns its name.
The register_candev() failure path cannot be forced from userspace and is
only compile tested.

Assisted-by: LLM
Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 drivers/net/can/can327.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/can327.c b/drivers/net/can/can327.c
index 90f5e35f3c8f..d40dadbb5733 100644
--- a/drivers/net/can/can327.c
+++ b/drivers/net/can/can327.c
@@ -1037,7 +1037,6 @@ static int can327_ldisc_open(struct tty_struct *tty)
 
 	/* Mark ldisc channel as alive */
 	elm->tty = tty;
-	tty->disc_data = elm;
 
 	/* Let 'er rip */
 	err = register_candev(elm->dev);
@@ -1046,6 +1045,8 @@ static int can327_ldisc_open(struct tty_struct *tty)
 		return err;
 	}
 
+	tty->disc_data = elm;
+
 	netdev_info(elm->dev, "can327 on %s.\n", tty->name);
 
 	return 0;
-- 
2.43.0

