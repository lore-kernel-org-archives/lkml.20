Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792866091;
	b=OssllCjwGc1tkXVRbIpXzh/g6kkKyi8h5q4Jhhw48fLy0egQVkGKOORYJOh2UMOvV89J
	 zIOPRcinGzPG8Lc4fQcVe7iOBDulTom0igE3aO2fAlRKTS7/idR/6lVJg5/dOs9MoIpm2
	 31D6vc5rSzIBFMVk4d8jDHAJHNMLSAtgaxgb8R+hgbeTLRFTdlfcJP5v84XUUVVEfJPJl
	 NYD2Ny7vy5CKPhWey1AeVei0p5xc9IJpBMyZp3OqelRrCi5rY1US39jW+Kkc471NJP4Y4
	 DJXhI7bBxMeRNiN0YW9BAhHAudsUt5jHHqAWl0sKe+4roUdJc0HgMH6JF8gVqgBN9Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792866091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sE9T+23rqSR/uL0cEE3JGokRaJALUOJfvl8GLVOXXYw=;
	b=Wag+AIMTavpQixS+NxIgJ2Kuyq77kleWDUgXJtheb7K2+cJZ10oRFTUpxBHc7LZuX9kK
	 iPyfoloWnUD+YvKrs97VBnraXumHL21bRvCtTUTi603ZaTtZ1g/t2PVUTt1KgF13xmWpj
	 d4wD41lTNGUCj8DdOHxuhvXUQGWMBQUA7Oe6O6JQ9vdmlrpxhDT/VYf4E3Dp453QNWFLR
	 cRkuzRsJyXTZwc5acXHYZKX7+UjkEukHmfOBpklbk1i3d3LX1HopEXzFFmwv2EmSZIaK7
	 chrGJL+zZl5wcCnx1RLcgKqJsK+dIz7iD4mYjDNVKi2pQeqhtb3rIN8fhKGRLHHNHXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pRKIBgID;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD59606A325
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD59606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pRKIBgID
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2202949c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792866090; x=1793470890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sE9T+23rqSR/uL0cEE3JGokRaJALUOJfvl8GLVOXXYw=;
        b=pRKIBgIDrstUhL2irTAdk1XZ5sW3G/0L1k8cyVk1GlrZC3Z4nxj6eQoSmc5ZQEaeK9
         TnY8VMIcqWFwyyCdLo85K/Em3hr0oje8RwiWImT2jOB2szuJoNl3n/stfbd4SE071sQJ
         xBUYdcH3dUSv+U2t92V7EejJeMsXT86D+5jFY1T6GtmxTmpq3SXq/tA5IJhuYqXW5Mev
         wOBzuMT3i2kKdeX8IJIxno7IJl3KE5uUilD+Eue10XRVA6BcwoaBUlZ17cxNgr3r2CD8
         ei/IMt4+P9CoR+qniSjvDOmmcrWVp2SDIsoq5038BjLdjZNa2Cm4VmbY5XDrQ/w9LDwE
         53rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792866090; x=1793470890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sE9T+23rqSR/uL0cEE3JGokRaJALUOJfvl8GLVOXXYw=;
        b=vSO7ACjh4yF97JmwV46IRNyR0p2ljqy/gN4Oh97hBQV3WVXa2XhI9jIgGcsMbzFsgI
         z2muFPYZUgyNKJRYsU/Jk0JaGwhlIuyDG83QXrduM6SS9nOv3a9geZtrFc5BjC2WJsA8
         uOp92o6+vz9AmHaK4R4PwgT2ho+lv04Pj8yS+reZc+3ZP+//zL4/u1avP6qH4CekI7Fw
         htAnG7EX5gVOv7lE0VD/4pi5p/U7uXjAf1VRlMSHQFOKyFbeEipy8dYdMyBMbjnY6J6q
         QXZ3wGCsD+A9scY8U2k/nKL6kqHNUFmfyzDTpaldtCYnpHsBB538ittaWx3Gru9BZ9Fa
         0fkA==
X-Forwarded-Encrypted: i=1; AKwUvBxaYEP5cHcOuXzPpDCZ6/lfs8rLHkQnQxufhTWs5NlOMmvoziZNO/hXhfdjDI/gf/CgvtQn1QckbD9sCU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZXIl4cURFMKP6ck2et75BMQdEMIFIE2en+2V0YJfAYluZCw9o
	iOlytN6qGA+tz6Y8Z6ORhBQtsqUQWRVyU6Dx92G+4pE/w2K2LcPajia0
X-Gm-Gg: AYBFou0TXwfO0Mt3xfT5OLlsAYyvSOQqOv3mnGJmkDDyeMlczvsB5p0bitaHNrPOmu+
	joNHHnTVRUxCFEidqhL8hvR88yRWXud6Uskdb16guNDDAGnolNC6UNCSzKcNkCAN2eLGSOiqOlx
	CCr4p3BBJgVXPEfVBf517VgT+Xa3LSla1ua9U8M6fDtwhW4DQ9KUOzbexgm5g33mxyR74KQXsMn
	t9siMEXgvyKA47aOl2rMAmXXx9i6zR4jHv9FK0GI1n4xTF4ieWBXj4ZjvpDoXsocUIaDWHl89nP
	OEO3laO6Z9iKcToi7cGCThcarlfZaX6WJ0MeufDEJRHh6XzbDN0m4N5Vogu/0Fc3l2Kn9i8PyZj
	TEOOrf6LiMxnaaxjIlafE0JzOrRdrVvmfwb+TOqGPTsVmNYLVqYWNo7OQSmoAke43TVPjLM8/kS
	nklEOTcsT9Ixs9v7Bgaow9VWYLbTsXFMiVZF1oSICB29vbPMbA/uDvpKwLeo1nOFsinerBgDMXv
	VOsG1JhCyll8g569ERIpOV+oi+UtGQ8ksWTALmKmRrtc0jilJwrx7ZQfVWT5ryTH2pTxWgI32z8
	vvA9mg==
X-Received: by 2002:a05:7022:ea45:b0:19b:7b7a:a61e with SMTP id a92af1059eb24-19b7b7aa68emr1432682c88.26.1792866090404;
        Sat, 24 Oct 2026 11:21:30 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm8174893c88.21.2026.10.24.11.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:21:29 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 2/2] net: dsa: mv88e6xxx: fix 88E6171 statistics type
Date: Sat, 24 Oct 2026 11:21:24 -0700
Message-ID: <20261024182124.296988-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024182124.296988-1-f.fainelli@gmail.com>
References: <20261024182124.296988-1-f.fainelli@gmail.com>
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

The 88E6171 uses the 6095 statistics operations, which advertise and name
BANK0 and PORT counters. Its stats_type bitmap instead selects BANK0 and
BANK1. Since statistics collection started using that bitmap, it has
written a different set of counters from the one advertised to ethtool.

For this chip, get_sset_count() accounts for 30 BANK0 counters, three
PORT counters and five ATU/VTU counters. Collection instead writes 30
BANK0 counters, 26 BANK1 counters and five ATU/VTU counters: 61 entries
rather than the advertised 38. This mislabels the tail of the returned
statistics and writes past the advertised statistics buffer.

Select BANK0 and PORT counters to match the chip's statistics operations
and restore the filter used before the bitmap was introduced. Tested on
an EA4500, where the two-bridge forwarding and multicast snooping tests
now pass their hardware counter checks.

Fixes: 5595e3613ea7 ("dsa: mv88e6xxx: Move available stats into info structure")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 67daf3b9cb48..ebd9f69a7ed7 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -5960,7 +5960,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.age_time_coeff = 15000,
 		.g1_irqs = 9,
 		.g2_irqs = 10,
-		.stats_type = STATS_TYPE_BANK0 | STATS_TYPE_BANK1,
+		.stats_type = STATS_TYPE_BANK0 | STATS_TYPE_PORT,
 		.atu_move_port_mask = 0xf,
 		.pvt = true,
 		.multi_chip = true,
-- 
2.53.0

