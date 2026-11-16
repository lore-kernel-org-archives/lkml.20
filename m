Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863392;
	b=eUvdYnegynn3VtkUaTHXKseapKq6DZZAX8s+wK8DLV/1dy1lQw3i1QiIIT60FYeR/lVx
	 /JSO8X5fcwF5+Knrpjj7u5/48or/PYlL2CIdHiM72nj+l4B47teXxUPPBs1kUU7vBzz1R
	 w2LVj3I+1K6B9ilbZvX8qsYHjQNzZeoQRNnH50RbU8MmaID2KbrYZytfQeEp2THPyakf5
	 0BEfno6v2bjjSb5ypGtz/X+sHLWlL54HwApp7zazf+Tf7+pj/4HHo30qgNusMaFC7bzRY
	 MCh9+cqK1bsotZu8XCkDjzCq58q1wo16OQ/zB0Vnx1Hy4hhyhejztnLRyqw8yl2igLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
	b=vknFOFj82m8ryl8evvClVgWDlxijgPk++REFqX94QGHRkQETxI2uuWiWVcFqSW3XAun7
	 ywNmXqf/cVW4BsGGhQfEhHxTUxra4axMDb2fztTVZQNQ/COR6snBxw4BIeNXZbSLnT4vq
	 zKTKv6JOXx/ruEKYNgJGXG5XbHUoLsfLMUh50SFIcJ3eXigR5HuFwemzOb0lxmQYCiZRn
	 UnYe2FCSFE+yHckTJ6VQ8YnyTHggqOZR2s6UUHoS27OK4dwbrcY0fmOMbawz4vAAdPVIP
	 rmoJWe4NSBhvK8bJe8vx+VRXENhXF5HahIarqo8fhqPOR7Tw763vzG6W8ePCxLhhFAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WcJNw6Mm;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CE606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A64CE606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WcJNw6Mm
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b37951a397so1815059a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863391; x=1795468191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
        b=wd7/EtdI8p+uX9Np3sZmnxIkhaolO6pUldIPnwuAkEL3KO+3lP0px+w8nVU1wTZDMz
         UVoAl5dhJoeXSJKVQbX6x8krhoDZ2ICwdh6EwTsviEa5N9JV0tlnBbAkf1TyVH0u3gZ2
         U32nM1bIJpuOpVTUYHwy6Wdb7Cjvi2ykNlg/yCwA5YJgMRp3cODLNSqYGmRfBzXnK62M
         UXT0HBJicL8l9GY0Tuq2BsBk5zPIGlUgExvalEg2lONGHwGRLs1L4mXzDxGSMoLAzy1w
         lNwklZFqnX957Nw4tcSjwmASnijpRmozF8qWK33fzsOkvzAnp5NrKCwLI5nLeqbXsDv8
         gTSg==
X-Forwarded-Encrypted: i=1; AL+hErG+YHabN39Xa+vyL9xw/WLsgk4i5wA8vT+n7mZBP7zh+YuIwn3TiR9VWm6mtO/8cWe09Gk9JjYQjo1efJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z//O3EwB95aPdDSFjOEBNU90Q3Jjofa2EheSYnPSlbMNsWoc5cx
	xFYjcWgArKqLlUolOYOWiBODMqmyIxgRKVu43YT9btIKoAfiKkaYqDtiPLTCNHukoSwW5ST4sMN
	M5b36xcN+y+KIc0VQYqCJQ73o7mvysN2gdSaxDRx6CseaTjPIUMUXKvD1mLLCyeST+EiltUolfk
	Ly3kZAbXqc1VgaInxXHpXrsx5JHW5oE9eVR41fNOOk/GvQan+3Ug7DH+WEhdAD7rAW1GjifBSxk
	K7yRnuD4BEag1rOjJO8Cz2D
X-Gm-Gg: AZFdTZd3tZMpRLx/jguQG4tLQdg0H31hbMKlxG/bgEJEjvCwvXO77LQbZxFyw+3DCUn
	KCWXVPNkUcitpo8pevY8roeLT+3QUCq8DaFV0fauedwvH0raEKEMco9n1c7wEjaj1r55m6FjfaZ
	6zXjZBfza2c0h65rcP2as8xInkz4pnLlWVZI6Ptm380Y5rWegxxFWZlXHqSfu12BNlq7QnDMUoI
	DI5kWjcII7f1RyZQt5+4BZI6EOoFc3dHGcloduTYaQwDh2y9efM1iTwvC+sRaSLe7UqTSP7OM7V
	7AqaU59o44wx3Y/63uncRfZozRjIdgtYc2Vd0gptHFmF9c5YV4U1sbe2qC11Pwb5hmUaSOEPPyX
	NA9d5QRaiQOq6CydGUiaXCqsmMTuyA5jvcePFQVBFLH5IFEXA2/0zXR7JszOLCfkW4N6V6LpDl6
	DEQ0foK/wypa+MokEaj2ENPsr/LU0atF7sZtWifMeh
X-Received: by 2002:a17:90a:da86:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3b1b089e0ffmr12920985a91.5.1794863390722;
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abeb5fa2sm362394a91.7.2026.11.16.13.09.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-920ff6971a1so1221846d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863389; x=1795468189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NL/KdxJnhSzYFms2v6FpM127CH3qOIylfilD1IF7rXY=;
        b=WcJNw6Mm/GJcM6B+pBFfIlovBJdiSIzhdyLxYi6hmViPem5d+kmL7mRElBba+b1oyW
         e0prV0JA00ACra1K6iB36rayRysB/07XppYMQB2e0K8EHPGxeleWkAVV/NkC1JTG8jXd
         rO0+VDz76yupQHLH1LRsGgShOgTFjd/0BkOfk=
X-Forwarded-Encrypted: i=1; AL+hErEVOz+Izox0k2wbUqfQOPo8lNKrFAHwqVTqX5GjMCkSJhfhXM0lbECu/7Kla/bU785XJELEvIt23j5hIuc=@vger.kernel.org
X-Received: by 2002:a05:6214:2461:b0:91c:6258:ec97 with SMTP id 6a1803df08f44-91f2418f879mr190160016d6.11.1794863389123;
        Mon, 16 Nov 2026 13:09:49 -0800 (PST)
X-Received: by 2002:a05:6214:2461:b0:91c:6258:ec97 with SMTP id 6a1803df08f44-91f2418f879mr190159506d6.11.1794863388557;
        Mon, 16 Nov 2026 13:09:48 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:48 -0800 (PST)
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
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 1/8] net: dsa: b53: initialize the jumbo frame size register offset
Date: Mon, 16 Nov 2026 13:09:35 -0800
Message-ID: <20261116210943.1352656-2-florian.fainelli@broadcom.com>
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

The chip data specifies both the jumbo port mask and frame size register
offsets, but b53_switch_init() only copies the former into the device.
Since the device is zero-initialized, b53_set_jumbo() writes the frame
size to offset zero instead of the chip-specific size register at 0x05
or 0x08.

Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
size updates reach the intended register.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index b7aff5e238e8..1f5776dfaae2 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3172,6 +3172,7 @@ static int b53_switch_init(struct b53_device *dev)
 			dev->vta_regs[1] = chip->vta_regs[1];
 			dev->vta_regs[2] = chip->vta_regs[2];
 			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
+			dev->jumbo_size_reg = chip->jumbo_size_reg;
 			dev->imp_port = chip->imp_port;
 			dev->num_vlans = chip->vlans;
 			dev->num_arl_bins = chip->arl_bins;
-- 
2.53.0

