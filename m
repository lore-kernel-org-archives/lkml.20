Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132564;
	b=HhzZwXtH5mIyVaN8PrRzw3tCnJRtgI4TVa0i/+tMLa8KQ6MVJ2wlBAFulG4NTb8UUF0W
	 QeKbmwan9FUOSVvOhLiHcr59f+qbcxiXbGIy0V/QNuKA2qGG6slgzFLm636ZwJAbBQhWB
	 BFUN2AuW5/nNKwEKDdcRdhNZ6fGzbyZ0G4m7NS80w1yHs5FlKaIod2Bk3q16fm2yeKmej
	 LXOLGrD+1tUTDPdA5i5vNuKUQMj2Vd9NXOlM7fFYwyV8baXoaYhXbuEA2eFmTTcu4tGTY
	 rImJI7p3VLleTR9vHb34vXJycEBdjrQwgFDSBJKHM1FiSkgYkVDJ3BRwtNdBCthW95A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132564;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xS3INcmyp9xwvFRPGcegU8mkYfG4iN3+4RM2xAf/dV8=;
	b=uRZl2qN7MTbkshlKSWPhevXATe0E5gzUj1nQEJ8xOBwfT/9A7/62h8wj++M5+e6+jB0H
	 mwHFEBGQ68+0E4jvM4mPjrYWGToOelLgWf//TrHqjiOZFenMtEosyLSI20vGXNBxzSc5C
	 z/nhO+W5cmBcCGmovTkLriYWOI7As5HzoIzlWDMZ3wbdLgPsJrI9QdtLgLFPaXjNeX3jz
	 tBzqU7iI4A0j9zObRTwRL2TaqoMZogUp/v2nEhmaerq7TUMa+F7v9KE8pPrSZhxNrRLDp
	 jRryXU6+ovDhL1tO0aSjzhKfGOV0gPXNX4jFWrRRwa2kq/rB1uGVBz91hJ/bAZiuxKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MSg+ZW4m;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F378606C90C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F378606C90C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MSg+ZW4m
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso221975a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132564; x=1793737364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xS3INcmyp9xwvFRPGcegU8mkYfG4iN3+4RM2xAf/dV8=;
        b=kt0yvCTJWC/2FbDoihx2wjcS2qZ2Trb19LmxdkQrrl+x0EZza8UXLHPe7jEd6pOf6j
         vlQuqEuDuliqVw0k38f+z7creskEvLY80DPZ/ZbcDOIyBt7hagz6OCvN/LEenSDUm7mh
         nW3c7NDnUiHK+Ir40LBDYTuTQq8DF4vsxgrVl2pHIRSsUYEAC6+xDurSqtwkC30dXmDT
         Bimdp3OwBJItgrKKlTpbSE3UVnpaP8aznUW9deQDPlibe/lOTZtcPpr4GBMuy49Kk2Xx
         n/N6RDgZPiejNmfMthEZQSzmtPFqu2gcYsYyv6NIbDvNYcgWcMFQ9oYu5l4sHQgINM7r
         LXyw==
X-Forwarded-Encrypted: i=1; AKwUvBzaY+dzQUWLgNl0Z2sSMc7NYndHaCkTK1N1xgUPSS+vUzUSQBWLGOAHXFwLu0t9xBFkfK+gmSM/TzEJOX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsDew5SYD9Kh+gvJA8uaYfYD9AKuRKh5/EoYpb7Jccer8yB6K0
	p+DY4fJwDfJhn1MCiBGFOeNIksJWAr/THv8oRPMAuEsjxAsureCilAoANGRmQKjzhKRmwvoOStI
	QyamZ3G0B4QeQmAEvildLXZ0/YTKhV3G+wWo3rnCZq/IkEhCDvIiGRzuf27em2i4BYbzbY8qBtx
	Z8TlxquZTXfxyC17yeiiLQ6Ian8iCTYZW7GwO1Pd6wuFef/AewuhUxTn2PrMMZvXE7DR18rL/fR
	AJFRwaTQpYSOJvkAJYOXM3iAO0=
X-Gm-Gg: AYBFou0HjPsX8eLESyo0be2+TCXO4TSndVzezdlqO8u9ZKIqAWUNqLTWeGLAD9iZh7D
	yR/YGVeY7/Kxy8hgtaoDcgRDo/t8J+LyFFN9l74oNvFnS/JAEo3KPDKa9eK70s/7nwyKPOm7xZw
	DrfrjnLPTZtWSJ+tXK+QkGMdEcTrxmcO3V2wBCs5K7iSUgzO2YxpsV+wLrRt+l4lLIe4VlKsAmZ
	Ibhp0o6i362jGpXwFlz+2mb9KE1EqZBLIt59UGZ/BGp0mpCV6KMTskDSwGHh0K7PvXFaiTXHdUw
	357BSc8NzXNJVbUNZcrG0/zQT5bOZxTP11W0GLPNMvAcI4yBq2xb0vdaqVIY1Q7jtCNLHhAkxI9
	2nZ2oyhJULO+ur5+0tHA/Qob8gqKZCbGGE2lnPHma4WkxFWWovzWiuDk/sbUedkoB66FlcOwmwl
	3gckC9E3AH1nkLqvyPMKKtUoWV7noG+6uIJNSfeOkT
X-Received: by 2002:a17:90b:590e:b0:3aa:6b5d:a018 with SMTP id 98e67ed59e1d1-3ae5819528fmr125730a91.67.1793132563359;
        Tue, 27 Oct 2026 13:22:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae577ac7b9sm185095a91.3.2026.10.27.13.22.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:22:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so315644a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793132561; x=1793737361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xS3INcmyp9xwvFRPGcegU8mkYfG4iN3+4RM2xAf/dV8=;
        b=MSg+ZW4mlEhby3XtDxBFmfXlyr6eJb2MWT6M/OMU7MIUxsHTUcWigpznf8ckUU7SDV
         gk7yh2d5N0jQHWsSDGyv6XgWLj0X9fRkD4gpchhUFRrJDsTERKrqeJVL7E48N3joHvoa
         +9g5KotYSNZncsodsT0Br7dLN+TIBws+I4xpc=
X-Forwarded-Encrypted: i=1; AKwUvBy2u3wiV6eHvUDP30gO4GDTqFlyJuYWNV/iblKvY0QXORxTqHD0xD7CPBTDeciJwvb+juJ6wQ2XjvlXC3U=@vger.kernel.org
X-Received: by 2002:a17:90b:1a92:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae580df590mr145713a91.41.1793132561304;
        Tue, 27 Oct 2026 13:22:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1a92:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae580df590mr145692a91.41.1793132560929;
        Tue, 27 Oct 2026 13:22:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d1650csm275486a91.1.2026.10.27.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:22:40 -0700 (PDT)
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
Subject: [PATCH net 2/5] net: dsa: b53: fix the SRAB grant timeout check
Date: Tue, 27 Oct 2026 13:22:27 -0700
Message-ID: <20261027202230.3539646-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
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

b53_srab_request_grant() polls for a grant up to 20 times, but checks for
an iteration count of five to detect a timeout. This rejects a grant
received on the sixth poll and reports success when all 20 polls finish
without a grant. The latter allows a register access to proceed without
ownership of the switch resources.

Check for exhaustion of all 20 iterations instead.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 83a03fca142a..f4689078ccd5 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
 			break;
 		usleep_range(10, 100);
 	}
-	if (WARN_ON(i == 5))
+	if (WARN_ON(i == 20))
 		return -EIO;
 
 	return 0;
-- 
2.53.0

