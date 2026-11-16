Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863394;
	b=sNuyPDcRwqaQazK3JTljl9L0k6QGZUpp50qTyeWlhM9NeqGe//H76bkcNOIvrqA/2k/f
	 Y1mY5xWJbO1YmP7JttDZyABQUBpDJY+W7vlf2Ef4kNFd2V3Sho/jq2b4x5EFbdQkm3vg1
	 G1SrMpE36dqyGR6jxeD5N+yyV7MYakabWCQJa26UFqIZXP/hJTHvnnj1lIpB8ejGZqHYo
	 i9n5ikXp0RJyTFYkUDyxom1FgrEu9SJKW5KczY664Zp7SOZaQMBW9Dy3KufN5UCqTWnZ8
	 XqqRoLCPchaNDqovQmootu+dvQy+y9rSGVXL4N7qpp/bPKXe2SYYvNP0OiSjbk2zVzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863394;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
	b=RwK2eIIb89qAve+Ct+EpJaNGx8dLDZRWQtx5I4erGzqykkC9F+LSbWJdY/q7zzyFaPRC
	 tZ+d4RYOo84gU3etZx0PGlGQ1Dwao+YCwpGWrP8Z88Jg4ujU1es59cFlmBkzDG8DSNe1t
	 +Cvr+/NbiTzlunrHA8nfaodSvxtosWCCkh4FRfFgvfiy6is4vERvJsQmx3D5EZMO7xfpT
	 Y1UvbmP3Zct5kCsziUguUrbaXE+Q10rjZomJ7V74tioHgjP6gK2MwoJxerKwvN9NngXzw
	 9aVYKaiZXi7jZr8MgC4Rj1d1pXuXekUWA3G7J6onntE3vjlxh4FBAAIE4ew2oVV7B2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eotBeJSJ;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518B0606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518B0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eotBeJSJ
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3088604a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863394; x=1795468194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
        b=qG9o5HgARqBmZLWdURdA6Wya5hUozNzJn+aG4zGOiYHv5Gq14JFzT+VtzfeXqIhQqn
         /SmbuO4uboP/KFD4dPfI57PL5uXq6J8WjGDZDV//WDlnoTp07hUS7YU7eJIJHGVTQ+9+
         veUmLCN9e9V/pgQNkz9ZWh5PoHPS+p19waPF1H8Cvn3q7ymeanfilblwWHn0EFZnTNl+
         nzFGvqslYT/uyoXWYYH2hEJe9VWPNALjQ1Ui3dYQcrn9s/Bt34R5vPbSdXl85363sWQS
         dZXsOi95WI8DoSN/g6BD/IaOhmXoteTK2F76oK1/yoAqegIjTYlwgwkcuKixPCQrVv/8
         KZmQ==
X-Forwarded-Encrypted: i=1; AL+hErF9zouvqcjlta8BXqEMwa5V4+TYfJ3Kb/BD4gQAPWuPKYQv3sCoOSIFbSVsrDkROCPJ5wqspuaikIP43iQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xn6EfWMv58k0ApYmsCLCZKefVycxVUsSz2G2srMkiCZ2Y40gC
	Xt3k8u8KI4fnPWUVYbAnWa9uRtVnHbjsNvzJttypJVHZSe1SnyqbuOlxa0B9Lq2FPyAdjNwoViX
	CHn++ZF0DpbfYtVUeSrgIRvDpHYZ7FXf+le9vKPljJ67vsuBJ3q5DS2ja8MyyGxVU/Ci5jmRtoi
	+ONxIpUOuLPW19s5cReXUS+0ZCDwjqlD7wH8TvkHqRiVSnk2sZ2GN3OM/hWNtIcMYVzyKNmsjcy
	ZL+kGPXBniu7kk/ZbyZJDBW
X-Gm-Gg: AZFdTZfroxNw72HPzEiGHEB2gcgeqmBksbpE8+fn5hy2hkRK0DYlyQuzR5RxgrvJK9g
	yPr9Rk7mIuTb7WLQBTFr5oRs+ePn6WthJoeWDKJ4AtMRdlDD7kwQw3HWJDFbmmv3OGTYZ0M+20o
	Z7dxi9g2lMhxKPNXIuYuLoAA+rg4CvyL2JM9w9kk+x1xq1siQTWwevOmsNQwbUQU1taBJ1FfNDy
	OL5QmD+h8a4vBXC2TLqHRmDph9IuzBHzlNQjObMd63S0dLo0Q6Fbe9eZSBP4GS4jD5mf46ZovyI
	TF8xFtguuHzGrSaurUT0+Y/+zQXTSmnFDbZOi0U/fgjGo8weMTVC5UfZaR2M+D+ksqapgpyDvvX
	2MUjMCf6j46QJXLEtYjfPU5AFm1wGtfv9WXbBtFmXWW8f3g2QPUCFKlIhZRdpYBCeUUfThygqWN
	U98MW43x+ean6yguU91UliCtSLCHgC5/V1RwcQtzXt
X-Received: by 2002:a17:90b:1f86:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3b1b0b666c5mr11997479a91.19.1794863393561;
        Mon, 16 Nov 2026 13:09:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm6347694a91.3.2026.11.16.13.09.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5363b06bcb2so34809801cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863391; x=1795468191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
        b=eotBeJSJZsfyM1s5nq8TsLhGdHvFeMwEEucfH98IXW4j6bJrOSogLZ5hxAKjanjBBM
         WIseKzibz3915B5irt7q5WqIH3DBywqrdTmBxzOZ9dc1qw6/MnWenDTkyYH45M5U6nVT
         seWqe0nNQpnP/c5YS+Fm1jkFTlwerP1EODKP0=
X-Forwarded-Encrypted: i=1; AL+hErEdekPnzyNux6ZqqkLLKBqrczeMyc+jAB9aZdkTh2PrT7FluLlNhb6qdSbs/Ubgy+HKEICad84VwIrdLTQ=@vger.kernel.org
X-Received: by 2002:a05:622a:191b:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55ac8b9ba4dmr187039661cf.68.1794863390985;
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
X-Received: by 2002:a05:622a:191b:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55ac8b9ba4dmr187039321cf.68.1794863390553;
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 2/8] net: dsa: b53: fix the SRAB grant timeout check
Date: Mon, 16 Nov 2026 13:09:36 -0800
Message-ID: <20261116210943.1352656-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index e6d14fdc56fd..7306535a892a 100644
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

