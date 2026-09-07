Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D92F1FDF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756439; cv=none; b=dFL2UYLYokzO+iiQ+DxOgtbt8mBxvjOMrzUsBEP4M3pdLlXL0cEwlim5JVwH8GaQpQXIPbukcUDTgAkv1T+XehEYI+ylZBfAaR9Vr8qGXXPRCA9Sv3VOTlwFgV2VPzoyDqvCvXXEej9v0xz+L6o2eLKkpWeE0CVcui0Kbw33YGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756439; c=relaxed/simple;
	bh=5Z0cdknBFIlhM01g731hrLfDIHFwyL/2mrLrM0spXtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNMeIRIhLcPckg2Niwtgxc/+JKUtZrNciCDJvzhfKoyj1ZnksM0kFAU9tu2uaACSODZNQTSTcLtv5TX2Gn53ePzY9ls32jOgQo+MCHkY23WjJxbOuwr6IBBX0rSzjQfDHeR01gkafpLTBfI0+f3rMRaqyCaO5FuQEvfrxHfP+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZQoGxCT; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZQoGxCT"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so2384218a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756437; x=1789361237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=375o4BJGgHmxnVw1lMhhu/qJ8TmCINoNbWz0ZmrSte4=;
        b=YZQoGxCTD/hWwvA+bDisPhf0yNUHtx1kegkFVsw4NhyHi2LIQ9NFaHBJJD/8FgxoyU
         ihQkVndiqlI0jQvuAs6ZZCZMyIEPuZBPcgYnXGh22Jmateac8tjs1JUOAZvfoYKv+SSN
         4YfgVR8avv5AH/hYavu4o87uqA8YFCk6jNuYgijPrq1SxHdjcmNnaArEe8jJ1gFgqQj1
         +bQHvyCQHhwMhiI1DiGm/kGqrFo7B/cye+O+iTLqvO4CNyXWpjyYG/Npti+5SkzYM11S
         PynFcqGmGSsRFPNQWM/ZP051kS0npQz4KfPJqnIgJu7FWd40Cfq/XSF3DsQ/U1L7lXBM
         Zxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756437; x=1789361237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=375o4BJGgHmxnVw1lMhhu/qJ8TmCINoNbWz0ZmrSte4=;
        b=iv74kbWJuunkBq9TOT47wjm+otqkZVHsNKSDZQPbl9CkB4XLO0KA0nqtsGW7Nom4Gl
         qstzTnTNQB5tolaTDshAIF0XvVCxw35FHNpW+EgO0at1qebE2sJkW75GoGKNNeiSad6h
         JXhV463WrproGBP79RiM48Q1wvxdU/by0G3n71xazzQUr6t2Bm8tJ0ztuWzQ5Pf3RDr1
         5VG8Fmwn9twdawYafUKpy7OE0/MD7nuyt40d/7lYf5wNrbKKUT675KlOTHsqlYM/ynJz
         ij/abh+bc17hMof0T31FCmWDGvp97/c3jGSTlL2KUcIGm5JVLX2FMSVQrcJX0wmwOE+R
         68oQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmNhvdEnJ4oCce9sDGdQH7FJQli+LIJrVd0H2VW8noJHZ6NZEeAQq7Iwv2wCkvchP35BU1amPznitEuhs=@vger.kernel.org
X-Gm-Message-State: AFuF++lKzX4aOo1EvxkkyuflOwfPMChmteV5iGllgH9gwxYM/9n4ko04
	k5jNAWwOI0KWIbeMQpLghbdAUBcfiY/Z24ZeW7YHHNgb/yLDZI8EFcCt
X-Gm-Gg: AYBFou0wwC2q7KHKkt7TYx74NESdSMbzm9ZkKu2zISYJJ2tmAPQV7nA7J/Tg06toT0R
	5CNaHo3aWxO5ApD7VuQ/3uJwXMkK7r2y2ULYCraJAuHSTEPQgQk0k7SP3jjUBVRQ8rpkgES9BmY
	GKJzfpxNdvw6L6I1hnifG+MOazMOaDiK5mZwCP6hkKZWIZ8RaXd7OfqLVyv4pHzohktfHq+gO8U
	xIUkc7WJ6u6ksbDXPTSb7ETL9f4xfARzB9P3arwJK4WJDPfepVe36rDINtYg6008HRM6iE22ObD
	NinPeViPJOfstr4blqucFJUA3qEBzn/f+Yddy172wzWH4uGhYLDdaFkf9VlIOk4x56a6IsuKPzS
	MSamhVy2h8Bb8GI/LPd7P6w8nBdDs4cUL/kImd15qjyG91r+b6Jc/SczMANb2X5UQgoMXFJJYeh
	knSwj5sj+qZLLInnfhrx3KfiwXFLpp4s67lSnvkvCHQo9RJjcuuXe1oPBl1ZFsTR20yQyq/FlYI
	11oNoNqBWuIeIvdvem19zJo
X-Received: by 2002:a17:90b:4d87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39b26100bfdmr28314536a91.6.1788756435888;
        Sun, 06 Sep 2026 21:47:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37844565eec.16.2026.09.06.21.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:47:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 6/6] net: usb: fix repeated words in log messages
Date: Mon,  7 Sep 2026 10:16:35 +0530
Message-ID: <20260907044635.7141-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044635.7141-1-hemanth.selam@gmail.com>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the words written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/usb/asix_common.c | 2 +-
 drivers/net/usb/sr9800.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index 4f03f4e57655..e63a849a1043 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -413,7 +413,7 @@ int asix_write_medium_mode(struct usbnet *dev, u16 mode, int in_pm)
 	ret = asix_write_cmd(dev, AX_CMD_WRITE_MEDIUM_MODE,
 			     mode, 0, 0, NULL, in_pm);
 	if (ret < 0)
-		netdev_err(dev->net, "Failed to write Medium Mode mode to 0x%04x: %02x\n",
+		netdev_err(dev->net, "Failed to write Medium Mode to 0x%04x: %02x\n",
 			   mode, ret);
 
 	return ret;
diff --git a/drivers/net/usb/sr9800.c b/drivers/net/usb/sr9800.c
index 6fd33a5b2279..cce0392d0232 100644
--- a/drivers/net/usb/sr9800.c
+++ b/drivers/net/usb/sr9800.c
@@ -271,7 +271,7 @@ static int sr_write_medium_mode(struct usbnet *dev, u16 mode)
 	ret = sr_write_cmd(dev, SR_CMD_WRITE_MEDIUM_MODE, mode, 0, 0, NULL);
 	if (ret < 0)
 		netdev_err(dev->net,
-			   "Failed to write Medium Mode mode to 0x%04x:%02x\n",
+			   "Failed to write Medium Mode to 0x%04x:%02x\n",
 			   mode, ret);
 	return ret;
 }
