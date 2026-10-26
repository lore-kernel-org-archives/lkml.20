Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048841;
	b=S7zEMeUkU0jDGpCSMQBpgGQ4ISH9yZJngS4YFJyCZBhK3fHhCWut6F36TMw5IOYghx5y
	 oGn66/6EXaky+rrbmfmvT8VD1UgfZ+HbcjDnxryjmKvkYmmYDIwcGYhuAi/GHJFKi6Kzt
	 ZUTT+ki+QT/gup7T0rhD5X/MaFWW7s+mjTb/2HKVOwgggFRUsc9BXXyif3GtnCI+RrF+j
	 f6/G0RBnMa+2FtCcNNwPBU3rpkx7KSvR+IpkyPZWy9kWx3RSYQ8pi5mIGidP4Mf5+3kJq
	 X1TUYyjASTU9KmmhkmoBroacjcblx7FAXF/J2vCocVSh2USqUJGecywvzDetkiantLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048841;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uTkZJ0Yzp0GGufzljGd6jbiq9eMnJlsjmW0Q6mSjuiU=;
	b=N8UdRxYKyDh3EDoXUPIeTRMELrm8hlTRic0wvlLjt0p8vugKj4PPhDdUYW6GXbh2sWDb
	 le3ItpumZCWFcFVtJhusiIehQr8rDlVp/Z8USCl1wkTh9jtISGUwiGM7MYFyF7Cmt0U87
	 UCNfnSJzt5BqVm64MKbVPMOIT+vJ5GAq8ivvNmG9JbgpKCyTPX5UmmBmbyCxIeY3d6HG4
	 NKKzVJ4r50J7Ik2vLd/TddFR+HdT5taILDcUf4Bk1CN1vyyf0YR9X2aSoZsvZS/vmioSi
	 qi/iV8a9wNye7TpUEFOT4k95tv8CkuB/x+hWnmSfER8EMY4+PQNJj8aAIBDWF4rpBWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="GB1J/OwO";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20416606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20416606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GB1J/OwO
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso1959969a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048840; x=1793653640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTkZJ0Yzp0GGufzljGd6jbiq9eMnJlsjmW0Q6mSjuiU=;
        b=hs3CHgtFIRxpuNy8gYbJzE6w8CelYPhNrkkPYfMGBhWiOs/x322dLgQfGq1eklzcgy
         H9Re4L0vnah+QOhIn07vzxisb6fnsOpXrG/KRfqqVTTE8U+eLAPMr2yEp456MT8Om6B8
         X80V3H8Mvhk2TtG3hH0WTccuWqpSkxPmYc3kxrQqD/bGNTceE+NYL3iceJ1G2OF+WocK
         nsS9DPzzGcstmGKBYepnwlT9bJQyaPxDjTH5+Ap/lX22s8fYfjUG+er6LEaX0HtE7b91
         6kcbIeMHy/GgjJqPsOt/1DcRwTcOxobqi/7s9f7+GK2elV3pbc80+fPQ1aF6Wr9EivNE
         dkZA==
X-Forwarded-Encrypted: i=1; AKwUvBzS7kfC6V0CBVMSIvchQJKXrCQ3UNY30OwMyRzZMU77RO0BRhtDzUn0NboRfY6keCBhgccdk1k1TGMMDSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyypVhmSloUDmmgMSG/3grFEj3oAKjuasMm/p53iki/ci1PSpf
	jYFuA6c3EXYQSdL4Ll5ZFxst1JTJXpCMZ08KJSQB69WW52A5eTTaib2+e5jFiHUnXZIKIBnFH54
	uUKeIHHg4zrPSenJxtYqA3OuuYp703w3RGqWnXUKBO/D63eaNSFxH8q/r+SN66JP9REgFXeMNUF
	o4LyXdvhsG4QRegCt/FF0JQZJDQorQgUDEd2l1wQ5IY6tosb7DnP8sAso7DCVM9KR4krzXLHAVT
	Y5NGZSLsZGfYDhg+r2I6Xk6fo0=
X-Gm-Gg: AYBFou2dqCGl8OZCQ+6MG52hKp7/NWpSGTJTsR6MEEVxw5wv1q42P4CeBpXOC9f23iA
	SwxE/sBgEq0qPRMan9DSyWnGUQHVlEkro0jzk3IM5w/8d0kVxTHsNS3ov9J1pvYh4fL5AkVTRB/
	e0aKCg02VUJ0ZB0ItWdujBK5Y3TdZ2/QnPiDJmczzX0SeeEIrwLNB9seJr69sCvBFXZo9oLr/tf
	3V5KTWhY6MHHgMkbbNKxu2Otto6KMJwll4pwcr1SFiTZl7yE5k3vosLwjySofynZndX2Rs3hjLj
	S//knFwwkFGTYuOHSMoIrAD19S88xZ0qRc14sUoTmnyXYyyVmYuwoqDTsVNvbkuwAQ7Mmjvln+a
	qtxuzTzktWnvve7LZc/dgat2Ir9l+Im9CpYLTj/NoewLRVSppQO/GprG1PO3BhClAWNgPx6dNyT
	9kJHGlLsXQ+vonuQH4kvU25qvdQygfowDImac3PwZO
X-Received: by 2002:a17:90b:1804:b0:3ab:4e4:e979 with SMTP id 98e67ed59e1d1-3adead4fb3cmr6205446a91.36.1793048840432;
        Mon, 26 Oct 2026 14:07:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae407e4ce3sm497258a91.6.2026.10.26.14.07.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:07:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e80f7acc67so38183155ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793048838; x=1793653638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTkZJ0Yzp0GGufzljGd6jbiq9eMnJlsjmW0Q6mSjuiU=;
        b=GB1J/OwOUp9OwFeIaRzNnLPUia/7R/jz4jRHDP/RgEsXdjC+vVEteMqdNlI8e7GNEg
         bDl6Z6m2REAPpjX5/XAyHEyFl4huzQ/thNQDlJBr/2/4lGezIhGsQZoiDEbnAH6ebaWl
         nPzzI6dpPLQFs5xn/pHzxjsXBvpE+aRYwwPD8=
X-Forwarded-Encrypted: i=1; AKwUvBz0JlDani8kakXSwVXndkFNkM5p6BfKbTLCH8P4ypt7vV/DD5XzwXL4l5vdUWUcxtEtOAuZJEV+d6L03Qk=@vger.kernel.org
X-Received: by 2002:a17:902:fc45:b0:2e9:9a19:c5b with SMTP id d9443c01a7336-2ea9c7bf298mr69830645ad.47.1793048838533;
        Mon, 26 Oct 2026 14:07:18 -0700 (PDT)
X-Received: by 2002:a17:902:fc45:b0:2e9:9a19:c5b with SMTP id d9443c01a7336-2ea9c7bf298mr69830405ad.47.1793048838119;
        Mon, 26 Oct 2026 14:07:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce5d92sm808245ad.75.2026.10.26.14.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:07:16 -0700 (PDT)
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
Subject: [PATCH net v3 2/2] net: dsa: b53: restore the NSP IMP port 2 Gbps mode
Date: Mon, 26 Oct 2026 13:37:42 -0700
Message-ID: <20261026203742.3198673-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026203742.3198673-1-florian.fainelli@broadcom.com>
References: <20261026203742.3198673-1-florian.fainelli@broadcom.com>
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

The Northstar Plus IMP port uses the switch's proprietary 2 Gbps mode for
its internal link to the AMAC.  Its fixed-link description reports 1 Gbps,
so applying that speed clears PORT_OVERRIDE_SPEED_2000M and leaves the two
ends of the internal link configured at different speeds.

Force the 2 Gbps mode and flow control for BCM5301x and NSP CPU ports.  The
mismatch caused switch output queue discards on both copper and SerDes
ports, with one discard for every TCP retransmission.  With both ends
restored to their high-speed modes, iperf3 reports no retransmissions.

Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0880310c9ce3..743fc04da0a4 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1663,9 +1663,15 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
 	}
 
 	if (mode == MLO_AN_FIXED) {
-		/* Force flow control on BCM5301x's CPU port */
-		if (is5301x(dev) && dsa_is_cpu_port(ds, port))
-			tx_pause = rx_pause = true;
+		/* Force flow control and 2Gbits/sec on BCM5301x and NSP CPU
+		 * ports
+		 */
+		if ((is5301x(dev) || dev->chip_id == BCM58XX_DEVICE_ID) &&
+		    dsa_is_cpu_port(ds, port)) {
+			tx_pause = true;
+			rx_pause = true;
+			speed = 2000;
+		}
 
 		b53_force_port_config(dev, port, speed, duplex,
 				      tx_pause, rx_pause);
-- 
2.53.0

