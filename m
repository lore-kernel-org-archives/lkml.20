Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590030;
	b=fvTcwyPpO4IYSBGhGvJJXVNSbmnbojHXlCBKHfGW5FNpndn1YqCincyDLltdpOS4mjfG
	 yTZaTHqOniEOIhndx7IIyUgyhptczFhqzPxFaBd8YVaMCwsxlVv6nksuqJONPrioct9It
	 QIEUaGhauO9iZej7izxVZWSGa6+UnGnVOKrmT7YkgLQEyrtZv9Mj3DbZwo3TvezO1EJ3H
	 PPldt1RrMB+jCSI3TJy/lwN2b8MoA3aWYAsVk6Kiy3tNjZad4OfV6XhEnHHs9Sw04HtwB
	 Gbw8r5sk+NH6+yTzTlWEjBe4BhGtCK4NuZZrir76jNG6AAZl6dPj0e8d8b4aHhmZJAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qCcEEZhb+6X/eOhEZOJf7Q7PZICUyrmwcXum+u7HmKU=;
	b=1Ey3ruvmXqSdr1K+5OCosmCm/k/GAyxSbDdqTcw7YOR3YAOzSJDoRshS/0o7woSK7S1t
	 X78Dei24JSUwUo33j/IRzZuYlj+gtjH7jOW2tKGmjRL2+kot93d22FffhMzGq4i92xbPo
	 6ksag4qAFkp2fk45h+6aUJ0khXhlGg6Yj7C88xQUCfQlQ0YaL3N3fJSlUKg8W5utbkarz
	 4sy/opx1Xkwe1iuDmQBlkc1RMRixoSKxy9Wz8sC05s4WUvDvV9PTaqq3uRfSKJtMuEi2S
	 BT2xWVzkw7ygngTHKlNOrP6t1nlhv5ZySg8W2AK7fNvUJ+EbpdhhU6wDBKH8wvQgw4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CKD/anro";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F960A3812
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406F960A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CKD/anro
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-844a8bf7e25so1652648a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590029; x=1795194829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCcEEZhb+6X/eOhEZOJf7Q7PZICUyrmwcXum+u7HmKU=;
        b=CKD/anrooXAdTesQ5AHoN/+Wi6tR8Oawe0LHd6426sI1K2mO4CfKcooXALBiCwfMi0
         7fatyoeP+ALyXYlyV2F9x97jo69fNpLAEWOGnlE1fxsenB/CgAebftVlrjVJEa3ViFpj
         x3Wtb7Ljq9WbosO4KRE4+Isi1ODihnJ7AfxWJQ+rxmZAlgIP61PgjC/YpANd96DDhn0O
         JnPiBYxvy5mLS2Voj4kpE+YypdsC32S0RQbqEU/SIp/V7I8eAuQaG7+57/tmXggzGtbU
         ZzVD+uJZTVu4s4uyGeISbxipdpjB2Ph3ZHDLtyuvZqAp/B12qB3WeRaWTIxj5sT46f9b
         tXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590029; x=1795194829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCcEEZhb+6X/eOhEZOJf7Q7PZICUyrmwcXum+u7HmKU=;
        b=ydCmMAG6DVPviISACDLfVu6P95Eqa9X8R+6Crd+GDbV1M4ZF2T3EQGev/GFQHk10yf
         Q8oS6S0ZmIIC0mp4jH1L0cev4AcJFUbQLefnsXQcqmQE3XyJ5F02iNRWxc+6AtlLwo1X
         k3unhsoDsWTT+u8+37U3OlWU310tYGBvr0Q3KEnvMZ8VwaQK+aPYQTryCmIMEMwlOQCK
         zIP6ZlN3MccNzW2xk3iVIwUgT/r6RIzRgbGSplG+uEs2eBqSPu8y6LnN1weUuXzHa4Mb
         UHiLeiviwukZ4oaz/9XzHtfnApAavWpfCok30OuQ6gq8HwYLDVPxImJPgkBf90Rs69xb
         Qz4w==
X-Forwarded-Encrypted: i=1; AL+hErHA5rWkfYhywX0+j1SlC3W/flc9VuaRdAwOf2NJdsngPqEp7HCLDFS8//WzT6Nfdj7Jn1p/Xz6PDN0tGpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xqHJyCmIiRcCbBqDD8AxY94FsLQ+r7wpe20dWgDgDc/CcbPfr
	BzNfVChTCrTucMIVDBJv9Pxgv89UxtTBQdrONL3UDZfSq92ASfpWPfBa
X-Gm-Gg: AYBFou3rQSiGoGEDlYtNi0fhCDJRa9MUYJTafg+K8nwQFQAYLaNr8KcPyplUPxWF9CD
	1ZjbqhDlB4ZV/8LCfOx+1qxQBu1hy5ks14CxG/+3GoXjcjXxjfoTl9EhDrhzDz5bNMi4/L5JQ6/
	kQaWTzUm46URaLBzZ4IsNZGf4+vvtWxpJ2xL6l1jLrj+5GGymSow/oHCZ7xdqlhtg6/ZENnVSg/
	SaXj9KITRX6QBZo/AqKbXtS5X2BxRiQquWSzDjhY5NQa6eiMPPUv880gve5zIaEqsi5v88VxdBo
	vAx0A8aYTS5DvFcMxUkaiVwC7sc0CvqTRi659/z7TdXu6N4UvA6rej0y761ojjuV7rv88UqEGOL
	soo98P6t85qjc23ccoIcO9h1rJvy6rAVVhkvDxx7evh7crg/i7jvCzGLi6O0g6kk4YQR7fPR4/B
	aUsawJKBSVeyxO8aG+Ukgx0ot+I/w9Xquj/qBoOONO7tK9p8IT8NjPkHJgyOAuKp7KWf1uPNGiR
	5CwztGzwapdTR4uFAXemudP/SwhgMdIMyJYC7cHOeQbTwgpZ32/FZJg/tpJaWeKKaoOy+YX+4RX
	NQDC8w3oZj0wbaQfzWrfnIm2tQZCEkSeZy+fOy44NDbBHqL+xmW9gTXXzagVqzoBpzwZPKsPbaR
	pGPQBXKPSJiq8MURZaEnE68fYx01vzkHjqW8fGcfwDI/+Sqj+eNF494bJxNu6ApS7smZAz3skXg
	F2PMfb2Lfo+MzGE0rZrJZycpVT9BEvrbpcQ0R4LTkRfgVPbNwmgXt7
X-Received: by 2002:a05:6808:4f25:b0:4c3:9892:96fe with SMTP id 5614622812f47-56e605b4ec0mr2987668b6e.3.1794590029081;
        Fri, 13 Nov 2026 09:13:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm2565805b6e.9.2026.11.13.09.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 10:12:05 -0700
Subject: [PATCH net-next v4 1/3] ethtool: add PHY receive frame and byte
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
Message-Id: <20261113-submit-acx00-phy-stats-v1-v4-1-986b8a4a1871@gmail.com>
References: <20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com>
In-Reply-To: <20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com>
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
Clarify the same byte boundaries for the successful-only receive counter.

Append the new attributes so existing statistic IDs and their meanings
remain unchanged. Publish the names through the existing statistics string
set, and retain the unset-counter convention so drivers can report either
set of counters independently. Correct the documented group name to
phydev, matching the existing name exported by the kernel.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 16 +++++++++++++++-
 include/linux/ethtool.h                      | 10 +++++++++-
 include/uapi/linux/ethtool_netlink.h         |  2 ++
 net/ethtool/stats.c                          |  8 +++++++-
 4 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index eba226c79ec3..40dd454d4ad3 100644
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
+include frames with errors. Both byte counters include the Ethernet header,
+padding and FCS, but exclude the preamble and start frame delimiter. These
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
index c3a41fbd5426..f3e0fac8fdfd 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -481,11 +481,17 @@ struct ethtool_eth_phy_stats {
 /**
  * struct ethtool_phy_stats - PHY-level statistics counters
  * @rx_packets: Total successfully received frames
- * @rx_bytes: Total successfully received bytes
+ * @rx_bytes: Total successfully received frame bytes. Includes the Ethernet
+ *	header, padding and FCS, but excludes the preamble and start frame
+ *	delimiter.
  * @rx_errors: Total received frames with errors (e.g., CRC errors)
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
@@ -499,6 +505,8 @@ struct ethtool_phy_stats {
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

