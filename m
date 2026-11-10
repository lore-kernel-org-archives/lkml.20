Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278927;
	b=M0Iq2sbu7hc1bhpnSrrpXbZRIJV4a70HIVdAoMg8vQZerj1LKM8fnwQFAsbgxPKkC1nJ
	 IyXHWgD6YcpsOQ4tY6Z5RTlHEabMEPHd4UG3z/BEp/qzEhjEa6h8+MSIwJdDSnziUUWyn
	 fgjrtuCvp0xbZu3xuoHscS/gmCtSwD5u7d9Hj+BzzP3WVZa3g8njtENdu2y4ScxioelWF
	 51CCS3bF7KNFMA9eDYwarbZ26J92610nVe3YO6Dj5TQkluPbQZ2xQtel150AnXSi2Zmtm
	 ilDiSuvDMwQnuxTutFKUXVL2V+LbKud9r6PRZ0lzBWjs4MF3OKx3f0XplOKSk91CEOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BHRxQlIaiWajaJuO9JYYnnOOia0A4g77AOl1VTZui+U=;
	b=gbuSXRAuun7smuh9dDkY9kHLo1aqPmBdle6cmcsfDmvf9uY0hmu4isIHmaBoRRzfplh1
	 M3ZY6fmAs+iAVH0X/FjpCQhc9KsXeMgEj5dRrwAfuGBFy+597W/B6/X7nI/SeMc+ZenE1
	 xKroaFuoNWfI6N20xh7EjSY12VayClWxNEUTuEyjnxBK994VCob6ikfF+XqEdWP+R8At3
	 +PdcQDtGSPjS7XtdnbdVfYd5uR/mUDHOE9H0+p3KfLlWPi+Q33EKk+wAT8waDiH6h+8+0
	 sn5Pi5KnOpgXaRH0+ebS3Lh1oYafFhV/rVD3YiIYDraEfLe5sPfk5ACKcuxCLevnOqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgnnhYpa;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7D606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E7D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgnnhYpa
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843cf077f10so1974965a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278926; x=1794883726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHRxQlIaiWajaJuO9JYYnnOOia0A4g77AOl1VTZui+U=;
        b=pgnnhYpa+hViaNS9YaeVgJvvlt7DjPCEg6CEV7E4a+d7qOuc8AwIxeO70v6WkSc00c
         hNi/hRTrFAPFYd31SrjR/9LifMXpww+K5MEztQGhcvebaKRNFDZ4n4IryECMD67n94Qc
         KLyfDK/fZe0lwqE8cMK8MTMB5VWMPnunpjRMgqECqMGSedq45BJ4LSiolx3b2YF30f+C
         mHmBqajenZ+nYlt2tgZzhtc7QVGit30OlT9dkNvVEUzWMLnj576mJWu90paFS6K4LGSy
         VGKcH1HMOc2OHN53EiYmBR+Lego24QpY+yxHr3sypaM1E7aSeCJiXEzVOavSLGDC+zB2
         KrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278926; x=1794883726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHRxQlIaiWajaJuO9JYYnnOOia0A4g77AOl1VTZui+U=;
        b=wwcXEL4AcCPTHtcm2b6/KWF/TVeSdxXHElSLtQ658QC9QiXSPWtaSpFEyovmFiknYD
         GWtgrb7XgqwlSFAFgs+qyvaL8qo+PUH3whB6gZoYsZ5jmiIRDr9UedjAGKEsflbx+Ruv
         7fPSR5MYFm4kEQHJ01nR+NBJUH0PZ9Fgp0fzoixcw2/mbi0wFA8/TXijX2bLIMDbHL61
         URZ+bVZ5ILOyghsRh0otGIn1mmR1qebn7FrBwQHwS+1I2h/LFlCQk0ln5tOt8LXLwhoQ
         bCxIY/+VVrBcKUkzGhQzBEl+oYoVjgtBf1paeabERooM24ZiQvGv/gxvRMcmjMCKQuYQ
         u8Ug==
X-Forwarded-Encrypted: i=1; AL+hErGFP0uN+pdSM9mWGJPS8EA2oV7vu7NQaweezymxtSR1t1vQGAIyCWj+S5mDGT0Lyyj+bwLEPIZcjfFzGdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZcvHcTJ6F6i8p292xqQIa9yxRjMotN3Lnm24tirg8HvdnJLeQ
	ME6NTIOBkfwHKj5+whf74sIxMfMj8+lVYgH7M5P5lB9/Cv5UO4PO5UuC
X-Gm-Gg: AYBFou2rCNZ+s4f2byFogO4ARCNF3DRt8Dy5nDSnxisy75MFY+kLC88P89SizMLx9Mk
	5GMCGU15BizxzDqf9fBc00ALqNY3cTghrVg7gGHbFbMPzquEjsT7zGzaEdsImLRdHajMaVglB0M
	HJdANI9DQ8LkFaXwp5qS7VsvX7IjxhwvaC4KWH3uFfP7ExmzU8rNdxaDut5c1Edwfbwl73CRP/R
	bUoAaYuKNwYtxQc+Q4kR9c664nmXrKYtQYhUCIbpztx2aqYz2MOhvuWPD5ZMM3EMqdXIlQblTIL
	b+f2U3BEI++y110ALYkHgrAFQh6+12T18ikhId+Uz14zh8UzDHTa7hgsAE/XdKkVU3kTtAObuHx
	PgIn713DS6nRNGszjPxDmmykFxUKtBh9QjWRr/YXjEW5mnikh2jp84YUENiDNK63q2P8ihKQa2G
	WAhfZEvl7KbmNghwBOJOaV6YAWWH41DuyL8n48nDVEPEks9vJlY4gIFU2enIKdr9hd7GSVaAnVc
	a4SdMUwOUpV1yLObrDGNcZkXB839650QvST8cbv2MghmgxwHtYqcE7RtMrRFe82HxC1R/O24eIM
	6dkbFilcv4Mt0oshIG5IRWs7GMP0fku6zo2MITqrsaZJeNbWWkjGx/E70vfoRaag7u+sZQ6p2c8
	RNKJccQ6fYiFAFD6WNbR7cIHealBWxVMqp/fp78Dg9I1yt1m+EPZ0sPvPl5ThOUEPNFCCtytrZ7
	IcooUuh7uS7crKtfYsFoyORYibRvpKY5hxn4K8dsan7aJ3k1Hh0pkL
X-Received: by 2002:a05:6808:11c6:b0:4f4:6421:5efe with SMTP id 5614622812f47-5683cc5d435mr1120533b6e.36.1794278925766;
        Mon, 09 Nov 2026 18:48:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f39c60sm943233b6e.14.2026.11.09.18.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:48:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 19:48:32 -0700
Subject: [PATCH net-next v3 1/3] ethtool: add PHY receive frame and byte
 totals
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
Message-Id: <20261109-submit-acx00-phy-stats-v1-v3-1-fbc6327c5be4@gmail.com>
References: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
In-Reply-To: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The generic PHY receive packet and byte counters describe successfully
received traffic. Some PHYs instead count all received frames and bytes,
including frames with errors. A frame error count cannot recover the
number of successfully received bytes because damaged frames have
different lengths.

Add optional receive-total counters to ethtool_phy_stats and the phydev
statistics group. Count frame bytes including the Ethernet header, padding
and FCS, and excluding the preamble and start frame delimiter. These
counters describe reception at the PHY, before MAC or host filtering.

Append the new attributes so existing statistic IDs and their meanings
remain unchanged. Publish the names through the existing statistics string
set, and retain the unset-counter convention so drivers can report either
set of counters independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 16 +++++++++++++++-
 include/linux/ethtool.h                      |  6 ++++++
 include/uapi/linux/ethtool_netlink.h         |  2 ++
 net/ethtool/stats.c                          |  8 +++++++-
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index eba226c79ec3..5528d0f7afdd 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currently defined values are:
  ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30.3.2.1.*)
  ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*)
  ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
- ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not defined by IEEE
+ ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not defined by IEEE
  ====================== ======== ===============================================
 
 Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in the reply.
@@ -1683,6 +1683,20 @@ by ``ETHTOOL_A_STATS_GRP_SS_ID``. Complex statistics (such as RMON histogram
 entries) are also listed inside ``ETHTOOL_A_STATS_GRP`` and do not have
 a string defined in the string set.
 
+The ``phydev`` group provides separate counters for successfully received
+traffic and total received traffic. ``ETHTOOL_A_STATS_PHY_RX_PKTS``
+(``RxFrames``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES`` (``RxOctets``) count
+successfully received frames and bytes. ``ETHTOOL_A_STATS_PHY_RX_PKTS_TOTAL``
+(``RxFramesTotal``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL`` (``RxOctetsTotal``)
+include frames with errors. The total byte count includes the Ethernet header,
+padding and FCS, but excludes the preamble and start frame delimiter. These
+totals describe reception at the PHY, independently of subsequent filtering
+or drops at the MAC or host.
+
+Each counter is optional. Drivers leave unsupported counters at
+``ETHTOOL_STAT_NOT_SET``, and the kernel omits them from the reply. A PHY can
+report total received traffic even when it cannot separate successful traffic.
+
 RMON "histogram" counters count number of packets within given size range.
 Because RFC does not specify the ranges beyond the standard 1518 MTU devices
 differ in definition of buckets. For this reason the definition of packet ranges
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c3a41fbd5426..7a7b434ab1fa 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -486,6 +486,10 @@ struct ethtool_eth_phy_stats {
  * @tx_packets: Total successfully transmitted frames
  * @tx_bytes: Total successfully transmitted bytes
  * @tx_errors: Total transmitted frames with errors
+ * @rx_packets_total: Total received frames, including frames with errors
+ * @rx_bytes_total: Total received frame bytes, including frames with errors.
+ *	Includes the Ethernet header, padding and FCS, but excludes the preamble
+ *	and start frame delimiter.
  *
  * This structure provides a standardized interface for reporting
  * PHY-level statistics counters. It is designed to expose statistics
@@ -499,6 +503,8 @@ struct ethtool_phy_stats {
 	u64 tx_packets;
 	u64 tx_bytes;
 	u64 tx_errors;
+	u64 rx_packets_total;
+	u64 rx_bytes_total;
 };
 
 /* Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*), not otherwise exposed
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index fa5d645140a4..db26cff28f12 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -202,6 +202,8 @@ enum {
 	ETHTOOL_A_STATS_PHY_TX_PKTS,
 	ETHTOOL_A_STATS_PHY_TX_BYTES,
 	ETHTOOL_A_STATS_PHY_TX_ERRORS,
+	ETHTOOL_A_STATS_PHY_RX_PKTS_TOTAL,
+	ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
 
 	/* add new constants above here */
 	__ETHTOOL_A_STATS_PHY_CNT,
diff --git a/net/ethtool/stats.c b/net/ethtool/stats.c
index 9b0d8cb07675..b4c4bdd8fc4b 100644
--- a/net/ethtool/stats.c
+++ b/net/ethtool/stats.c
@@ -88,6 +88,8 @@ const char stats_phy_names[__ETHTOOL_A_STATS_PHY_CNT][ETH_GSTRING_LEN] = {
 	[ETHTOOL_A_STATS_PHY_TX_PKTS]		= "TxFrames",
 	[ETHTOOL_A_STATS_PHY_TX_BYTES]		= "TxOctets",
 	[ETHTOOL_A_STATS_PHY_TX_ERRORS]		= "TxErrors",
+	[ETHTOOL_A_STATS_PHY_RX_PKTS_TOTAL]	= "RxFramesTotal",
+	[ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL]	= "RxOctetsTotal",
 };
 
 const struct nla_policy ethnl_stats_get_policy[ETHTOOL_A_STATS_SRC + 1] = {
@@ -295,7 +297,11 @@ static int stats_put_phydev_stats(struct sk_buff *skb,
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_BYTES,
 		     data->phydev_stats.tx_bytes) ||
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_ERRORS,
-		     data->phydev_stats.tx_errors))
+		     data->phydev_stats.tx_errors) ||
+	    stat_put(skb, ETHTOOL_A_STATS_PHY_RX_PKTS_TOTAL,
+		     data->phydev_stats.rx_packets_total) ||
+	    stat_put(skb, ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
+		     data->phydev_stats.rx_bytes_total))
 		return -EMSGSIZE;
 	return 0;
 }

-- 
2.53.0

