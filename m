Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592391;
	b=XzkXC1lmOAya3Q6uFQHD7zfGlNrmubcqlRIxSST7/7j/rc1lZGXTdpTYRObMh66hatYD
	 k92mntyK5HoZzVy4cV/0uzGb2FWvmW88HumCYMtpRkCP+PNi0vMZmIw1QzkJYtf31CHH8
	 d5ArVk12hMHRoaoy2CuApnMs7q9RfS7kpMfVnO8K7CI9lfDbWKLoKQP2fpo+/hmvyp6eA
	 +PiqikFVRaI76RHn4+6tT2zfpIGEUX5lBlx4nRVABGtOn965F1hbK4Bj1qTXIJhkUv6LH
	 EwDfOdpjRGDvYJiOJaPZRQYXD9p+Z9Vu/xo3Vu4GB/qw3Mwd37OwNWCxHqiimsFtwQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BWkLz0gjL56F9JTm4S/uyWsKYfVy6LiPMU9KWMExSVw=;
	b=kDn94GRZd19Dt+rIghyEx1V8bNtk9VinQwK7iciypWOMjbZ02kxpCt59pmunIPmMNNAF
	 +MASlBH49obYIx88jvqAZgdoWs7xZAuJXnibWiVkvmlDSLRiI7I+rzFjAUpK7cBOc23oN
	 HI73D8uQHuLyFcwP9cfUpA3VnQEYGj6UwboV36yqkION1SgK02VA/Gg0wVaY+BIbDaZVd
	 pA6xw6q4BXQeMYPZZP6ggktPuE+pIxv1M5xzfDnHaqyl7dvCLSIZV4lkVaDpLAXQKmd9k
	 +r7tBdz2SjGyDZpJIeBRxRkpQ55BrnZSRJCBjf6hTxJaEdBL6G311xgQnbJUqE2NOCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JhuwrpEw;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1F606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A1F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JhuwrpEw
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b09c273caso148064f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592390; x=1793197190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWkLz0gjL56F9JTm4S/uyWsKYfVy6LiPMU9KWMExSVw=;
        b=JhuwrpEw2+tGiMAAw2g7/r3V1YLxLrKiTMctX0+x2twyc1hJ/5oqA42G9s0RE9mi9r
         TrC8EFo9Gowcyhdl4UYX3EMYtXQLKBROVfVwTAV/BoW8Lo+KDuQSGO7ukUk4cPv9mcqW
         JGWhvfPHaxZ0biROqvCVl1Dfjyk7oDdC/g4MBhshWGq86gLy4sH35NgaY/faw5MjV5HM
         xeivE+H7WFc5GtnS2SkGLxNqjf69GM0LGjNiqZzmm8MCIls4weQedHY80K8DCFppDbeg
         8gt6OcadgCdXXYTWNeujOfWBcRvHrkRQxlNDyFomMUTMMZpQpHrWnnt8cDtuPjOsR8L5
         i/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592390; x=1793197190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWkLz0gjL56F9JTm4S/uyWsKYfVy6LiPMU9KWMExSVw=;
        b=t6VR82gpitBe2E+2xnLxvkiH1gfn8IL+MiNDpcqzrazfGI/f8ayFL8jFziuZuUjHi/
         6VawECXzu6Ip6mDsokEd2svfI0I6sl4+jF/SDiAvfK6xtUYK8wNFPrtSeTYwnCksIhk6
         xroTae/ZozWl05ZrZ9YqN2PqSLN7zz1ueV8Tb98IX9nNnQF4vEx/4c4aT2L8LmXENDOI
         qtorREp7dPBXzMEjUxQD1yOIIi+ysElw6V/0V9XYoPtMBaxMmvHVTqotjMkzYyutVsNz
         akeUWtOzk0JIIXFOkp+csRJm1/fePRRIn5pS6iwOUdyQ+gGmjSs/+xwNKgpfQw+a+Zts
         Csng==
X-Forwarded-Encrypted: i=1; AKwUvByCAtegLS04S52Rkc21SRRmppHF9Z9cgGP+UC2v0vPNyzU3HeNQS7aRTP38sHiev235qYvE/gkYUmPYcFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJIAbmqrZOLwvM0HCzPgw9NB/Vz3AF40z7w0AQiZF+p87zNfYy
	vdOYHKbv0ej6M9tVPdFBpZx2OA/fyJHdBMo/bS56ELQq/GPQKOZ+cev4
X-Gm-Gg: AYBFou22OoeHvzVkI5dIiHoWUaYv4Q1jAs4ij93F2cPpP9G2St0S4n3Yw70I+U85kGA
	Ue/4CrDroe0lkO/u82ycQtbinG+A1VjHTyAiPqgvC5+DPD6TOeXm1u+cpSm2aWkOY9Samc5+XGw
	wSSfYL0DG9zmG7WYVMKfFS1W6Be7PFt2DLgmEhPjFpyKsqYliE96ikzjDByNkJP9d2YBCCHPeY/
	lVwEHDk3bTa5YaTdnah1/A7DHEz6B13JdO4HbiXU5TeZCTBv7dduRE7VY33Z+24/YeMuDGtgrZn
	bAM6Y9qNgySAzP1msme83eW3AMh1iQU0qjFg8T00AczjiR2IfRvnlaLd8mEhppD0GOwfL/5G/QP
	V2XDrShIdBScjy+U53gjcWYT/BYRYaXkrG03iY08H72N2Jo8No34rDz7+G0pauKYugYgef5fGp5
	SMIzbNvpMbp42qs78l2/iqXzpJoHI8HcqD3r+/F8xY0FjoQ/SaosNbcmbHFdF8/OwIGm3TQw47W
	ml8wlknrIgN31RU6UT2pArk9mqupgF35QEaQQSLxg==
X-Received: by 2002:a05:6000:2511:b0:48a:f5c5:d067 with SMTP id ffacd0b85a97d-48e264414a0mr4436164f8f.2.1792592389826;
        Wed, 21 Oct 2026 07:19:49 -0700 (PDT)
Received: from localhost ([2a01:4b00:bd1d:5d00:1a26:c015:c64b:f840])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm5692025f8f.1.2026.10.21.07.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:19:48 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 21 Oct 2026 15:19:07 +0100
Subject: [PATCH net v4 3/3] netconsole: recheck device registration after
 waiting for carrier
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
Message-Id: <20261021-netcons-fixes-v4-3-3857120c6340@gmail.com>
References: <20261021-netcons-fixes-v4-0-3857120c6340@gmail.com>
In-Reply-To: <20261021-netcons-fixes-v4-0-3857120c6340@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

netcons_netpoll_setup() drops RTNL while it waits for carrier when the
device is not yet up. If the device is unregistered in that window, the
NETDEV_UNREGISTER notifier runs before np->dev is set and has nothing
to match.

We might then end up setting up netpoll on a device that is being
unregistered while holding a reference to it, stalling
unregister_netdevice() in netdev_wait_allrefs_any().

Add a check to confirm the device is still registered once we retake
RTNL. Release the device reference and return -ENODEV otherwise.

Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-netcons-fixes-v3-1-1aac85ed7665@gmail.com
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index be7eb632ee42..bd36ebd334aa 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -534,6 +534,16 @@ static int netcons_netpoll_setup(struct netconsole_target *nt)
 		rtnl_unlock();
 		netcons_wait_carrier(np, ndev);
 		rtnl_lock();
+
+		/* Check that ndev hasn't been unregistered when we released
+		 * the RTNL above.
+		 */
+		if (ndev->reg_state != NETREG_REGISTERED) {
+			np_err(np, "%s was unregistered while waiting for carrier, aborting\n",
+			       netcons_egress_dev(np, buf, sizeof(buf)));
+			err = -ENODEV;
+			goto put;
+		}
 	}
 
 	if (netcons_local_ip_unset(nt)) {

-- 
2.56.0

