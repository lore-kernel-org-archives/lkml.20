Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703480;
	b=4fgPMwsZBupsdaGS8SP9eQMtC/G3IbSnqF1CbHYt/zPGgG7IWuUsldwpNkLY/MYMByrE
	 sp/b+bgquvSb85TCghQQ9ZTeIEvTEHWofDXdVx1cwA1T1vm+bJUKyJfYpwip/qllC+kG8
	 hB2cdN+DifgWWCcruZAmwvH5mW2yCFhskdOuVYc+pcKqnzrw/2tY6HSWpwT2GFKlmt7N5
	 9Owbw3LM0ZiJyUhQwggWSJW5SpiI3deXpGFmKPni3FWGFeb/+y7QJo6NZ1Zo201eUEz8q
	 Z0gvEYyR6eenNA5K9dBMYrjH+nRIYf0SMdk+sbfM1dXUo5KPUQsezSnebRskelBVqzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703480;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=pdc+k/SesN/2ZkyxXS5Fk5LQPEObVcKayv5obo6VCXI=;
	b=QDLe+hD3HVixUFko52pIRBbkT2Ad6/FyUv5tLTm/QPcs23WiBUkGvOw3+1l1SwcOmezQ
	 D2LrRZCIZSHNgrA+MkFADqO4z+MMw8tMqb4g9f1do4eIvUJ2xH3GsXvTlVnBUHQ1C/cL6
	 QbxPYrT2x+kkBHjjLQXTySko6x3GpxV41JEcne7SQiTADx0AwkrPkt7a7jcLC4X6p0DvS
	 C8Jd0Br0LJR4FGK9b0Nzi6aV1GuKxd36+oghOf9YGKi38jQiZK5dKs3ouizkNUKjeyk6t
	 RcmPIZJs75oLyKrep7qLDYtEq6emXx15h15lSLa3ZZWseAiYdUI8YZIjH0bITa0IwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TA7+jLtl;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B446606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B446606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TA7+jLtl
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so234366a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703479; x=1793308279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdc+k/SesN/2ZkyxXS5Fk5LQPEObVcKayv5obo6VCXI=;
        b=vD1yRjg+xGMbNVz2519EAFSfLhbLBJgVO/nPPzIDb4UlxY5vi7eDWWdwWZ+uyfYSqo
         P/UDVIMTBVGaDFB23yNVOMOSCJsCG7cf3uThvvJwRBoki5mdxogeos+crQnMwBSFWnfA
         J6i0Jd/RlKJC/kwNc+A64eyJLXX7BKtn6Khn5x3RAVgO/hmc/CnjXlR81H8DxM27dCLp
         f8ywOCWIpERshrp8RlEZiX61FtYw6KZnv/sRKgjnZHC65uA09QouNBVKjRkawt6gmgDZ
         puUKFkMk7bXhcdU+gsJQhSNvo+iwPqiVzWh3KQT8V/pilQUXRhNyWTqSa7B6Rif256rr
         qnRg==
X-Forwarded-Encrypted: i=1; AKwUvBw5Qog6ZM6nFYc2PLHiji0jb1BdsEDBC5rbWoPI0R5piGJyeHTJ32SnJ2kYIxd4LV0OSQQyaYFuniYZB7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKAXM5mO6fnTMPzc8NPlryxCRmFL543KLvKUd/CdnhAlvmXMoF
	G0Yi0NrXl+FbXmrzwpEEnoeO98jeurR/+Oz0Gc+vLMShvvV/5Irujp+XIS2tO9QTcEZ2ZzDTqTA
	FOkonunPvF/nk1YEN+B3BqWS+HMV2F9qx6X0KHz4N2xPnIUcySHY1c1q3XvrLtPOZN5HL8BVRti
	RfdAeLHV7K3zQE3ZU9ISNTys7P9peSsvyAWqYgvBwHevsO7CBvqJr+mJjKWadltew+lsMaS60z6
	6j8J1+DoUrV4eARq5OX9zYu
X-Gm-Gg: AYBFou0iWg447NE8svmIdrWs0D/OJH6YUYQU1oF6uUbvqtn8ca3Kt9WUUkaAeOx8NsB
	ujJeE+Y74h5QOXazBYQwSnK0D6mzoK3IaOJeQ39dQWhX6JjSt6OlWdYjXjwkArceMJ66EwwVb/V
	G5xKZZSIesH3+ZPn56Ry7pLQ0KmXZa0UFiumoE+2h2YMAvDfQv7H7bnhPs5VdjM9usrAaWlSk8P
	X7oO5L8i6UksmPr7TYTHvA/krBDOBmbge06cr5DLHQwwHHZoJaXDLxDVMAvCzWcQQzsyeIOpuie
	wgOolL5/mzZyhkPUj+G3LfLM8OGItP8T/D651vLfbbsNikZY1uU/P77nqePYqvUQgiNgZFyB6N4
	Bm8kFjn3G6623ATkYST2iEhl224LEU2fp8EMdNDkFjL39eKbGV9z5tGxRLEpXxun3RY+w0AQmFl
	WY6qzmJ7N62FRnnw5FV1Euj8iLtRfM3FROI8VtEZIL7Ts=
X-Received: by 2002:a17:90b:558e:b0:3ab:9c73:12a with SMTP id 98e67ed59e1d1-3adcddb7ba8mr140992a91.2.1792703479462;
        Thu, 22 Oct 2026 14:11:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adcb1c92fdsm277826a91.6.2026.10.22.14.11.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:11:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso4687466d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792703477; x=1793308277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdc+k/SesN/2ZkyxXS5Fk5LQPEObVcKayv5obo6VCXI=;
        b=TA7+jLtlklgsV7T9U/3xcg8bTcjGGtb5F7Nto6PyjP4/bmt+yv8kDXl1L4FI/Ku/fs
         +meUsnQ6RkvCuYN7LViNsZYs2jt9vG1Zmxa3ypOf8MQn/eZ1jzDznYd7F7Gqldp0XmiY
         9BOZ9Ck2g7vJRLyc65GBp4YtUrDLihpW2fopY=
X-Forwarded-Encrypted: i=1; AKwUvBz2z2ufFdoTVsKCQsj4UA/aXDUvHJjxiTmXdkRTd0Gc1+kHr4JjaUw9HPT5gnTWZCMdRIY5GRlZE9WUgJ4=@vger.kernel.org
X-Received: by 2002:a05:6214:4993:b0:912:517b:7bdf with SMTP id 6a1803df08f44-91c3a8c0921mr213976d6.42.1792703477155;
        Thu, 22 Oct 2026 14:11:17 -0700 (PDT)
X-Received: by 2002:a05:6214:4993:b0:912:517b:7bdf with SMTP id 6a1803df08f44-91c3a8c0921mr213416d6.42.1792703476428;
        Thu, 22 Oct 2026 14:11:16 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396afa91sm2472036d6.11.2026.10.22.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:11:15 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 2/2] net: dsa: b53: restore the NSP IMP port 2 Gbps mode
Date: Thu, 22 Oct 2026 14:11:04 -0700
Message-Id: <20261022211104.2091128-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022211104.2091128-1-florian.fainelli@broadcom.com>
References: <20261022211104.2091128-1-florian.fainelli@broadcom.com>
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
 drivers/net/dsa/b53/b53_common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0880310c9ce3..1f4964c28fc5 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1663,9 +1663,13 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
 	}
 
 	if (mode == MLO_AN_FIXED) {
-		/* Force flow control on BCM5301x's CPU port */
-		if (is5301x(dev) && dsa_is_cpu_port(ds, port))
-			tx_pause = rx_pause = true;
+		/* Force flow control on BCM5301x and NSP CPU ports */
+		if ((is5301x(dev) || dev->chip_id == BCM58XX_DEVICE_ID) &&
+		    dsa_is_cpu_port(ds, port)) {
+			tx_pause = true;
+			rx_pause = true;
+			speed = 2000;
+		}
 
 		b53_force_port_config(dev, port, speed, duplex,
 				      tx_pause, rx_pause);
-- 
2.34.1

