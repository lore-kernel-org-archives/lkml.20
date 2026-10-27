Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140316;
	b=Jz+LwuQAfsgRlcwdk7FIcagKkp2I3rt+vF1V0OnF5TUbOcjxOFewqR3BU84fay181lVn
	 tSdO3NEe2ya39LSDOyfA6TNJhGyLPg1qXIVEhKeBkXYtpWRPuM4w9Hrh5ZJJ3mrhPZgeF
	 WAqiw+LeuYtturqeq721ze3WSiUBvL2krSrzn+G7yEYmzYPTBb2TcegWcEWMCZXkhhU60
	 +dx65wLgiMNpNy6UjdMvzBqAqY6DUV+lCV1nc7yLLQQ/NT5Q0L9klIL34z94Xf4ADC5Tz
	 bt69kj5n5tToiHXpbJf9FN3W3Ro13qXCU0v6fS0iRcQyCUS+tr/oocSs9Xl3tDw392w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
	b=qAmX0XWlvH5R93TRUzTRGbEcHv2CiP30byC+D+SZfutYTBPPvQ+iqDH1+QRTckXDn3Br
	 5vMhLCmAxgPQZx0bRm8FZomVBOPPuszHsPckryxbDO48mw9Yw+Q1JbZvzyr9XkOg7+KL5
	 I7YQk/tTF1K0mxrP2SHPRT0QcEE/Tyu9GBJRzuWVU1vqPcjdLimbiqzmCC2RwbMHEt5BO
	 IgSRVYuUYpIVX4LQmfaIK+eQRcpwBIE/lmQnca6lcRAdsFcM05+SO+Oqmhy2YZnY89VF3
	 gqaXeUbf/x4SNysi4EAWFuZV+5YuUVPJq6MM/OsD97W4AF73GoAchHbSWuhmMPpl7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mc7y6MPo;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45E606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF45E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mc7y6MPo
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso481776c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140315; x=1793745115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=Mc7y6MPoCxLoMSH8hXPBCGQTPGIfVuD+bp9hGWdY/UwSmcCT0ZfwTo8AQVVE7FhLpD
         jKG/DJgiy8dhkv6kuzfCxOylDqFCVh2d7nQyCb5oAnA2F4FeD7ejbkZZx3OmJBfQX+F1
         xHR5vX3Gcu4xTEcSsd2icgJNPYM7tEoQ2yVarMebfopTULOqvE1zmO6YfU7tbCQ8M0vq
         BL9u/vhFWDkkSRCSt0Y06YSjox3C0EwZVU77iFu665GMGV3juyJauwV8Evf3MLgna/AP
         ugpek/HVNkTvLpCJBaEI1zOrvEHBnv0aSySDWXt86fmy2iUjd5VBPbXGl4kpsTt4YGpl
         Y6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140315; x=1793745115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=ybAPYucTRNdDPsTemWScK/gq/bJ0vPwSw9DT6m/3lc3amYpHAqp9hrGZBzokuCFpF8
         +HZHdzttr5OmWmeQ1c+me2Z2azQho3F5SuAfFKvEedZdgFzO/j96A1TMHNLbRiLJvxXz
         QRsIozK7nmdkO1Pj3xFhoe+2PNyOX0lgz2ccmFkVC6Q0kybtusYVE8MUqukAf2f1eDOs
         nyDh2Dyia/2QCf4s52IUPLF2CoQGF/hY3uM8B/KRhm9pCbsLD7tpWewkvzPw/yXQiPFy
         4vEyavC5xnbb+SfEmMJ/Fa61h38qPn1joP9qahYb5w6nOuYYCTDEjVdof2kZ3J5+bZCK
         9oWg==
X-Forwarded-Encrypted: i=1; AKwUvBxfL4Yxbs6LtKB/SBMgRSEltB2H+z6pscc86DwcUAUmfYrb+1dslgsQ2a7o4bMdnK5yBp9IyOfqhmYV9Og=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2ZEAXaMpoeWfKlaBpq05cEQeZSj6H5OF+DiYPe9Prr6ayq+lT
	acpehe2wlMb2EoafmA3h0WgtcIQGxdiLkFTiIZh5BX3Crfn09Deoxafc
X-Gm-Gg: AYBFou3KbkQXnMn1EgXTwFpmohzxp676NbdLNhIiuw21RIM662r9e/9nzRpQl4qVziV
	6dAjpCAudopN2DqOgodwoK1oVMjJB0UOG5qlKHTz29UEsrzlORwwG1Wd4cbnzowrelZ1LNlrQA7
	pqRGMiyCtXjMI0en0TqXDKPzEW308X1g0q4w3aC2zxyepr9jbZNtubManRBuWjIdc+dfjs7zCYx
	ho8KPlZ/i4/PaRiIxYgLaGOUGrsDrXn6dBl8aohF5jYq3A5Kbi+xDe/AgtG8g8NDcecBOePM4AS
	oQ36LO7Ks1tzcngCTz1JM6NMhia0hoV4jhFjT5kXbhovJIaMAIMGRn9QoomMgFHYEJ1aqRkFDo9
	nD/wmHJwMMdlrCCbksxFgkEXutoGC27lJ9BIUSQOVgLtADR7VwRVvgDbec7VYu7IxqpQflZ+PWt
	6yd0j3smvGZZ3II1Xv8knWIr1OpRtypSjvdvv8uRfD8Kq4UMRZ9GblV57Izrny9yyZH3TP4gCmm
	pYge0j3q3RUsx9kWZFZHkfewhnSLJe63PkzR+SOvsQ68ANbEywnMAgAmqvpb/YZ13FtNEGhoYOI
	mfDLoA==
X-Received: by 2002:a05:7022:f90a:b0:15a:4155:3d9d with SMTP id a92af1059eb24-1a6cd77adc3mr688552c88.31.1793140314586;
        Tue, 27 Oct 2026 15:31:54 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:31:53 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net 01/11] net: au1000: recycle RX descriptors on allocation failure
Date: Tue, 27 Oct 2026 15:31:30 -0700
Message-ID: <20261027223140.3774570-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

An skb allocation failure retries the same completed descriptor forever
in hard IRQ context. Return the buffer to DMA and advance the ring even
when the packet must be dropped.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 8682323d693f..cd25248f4e3a 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -788,7 +788,7 @@ static int au1000_rx(struct net_device *dev)
 			skb = netdev_alloc_skb(dev, frmlen + 2);
 			if (!skb) {
 				dev->stats.rx_dropped++;
-				continue;
+				goto next;
 			}
 			skb_reserve(skb, 2);	/* 16 byte IP header align */
 			skb_copy_to_linear_data(skb,
@@ -820,6 +820,7 @@ static int au1000_rx(struct net_device *dev)
 				pr_cont("\n");
 			}
 		}
+next:
 		prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
 		aup->rx_head = (aup->rx_head + 1) & (NUM_RX_DMA - 1);
 		wmb(); /* drain writebuffer */
-- 
2.53.0

