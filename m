Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728761;
	b=tjsYvmzljpsc0vXLAtzWIdPXUc9yhaLEcq0zHBsTWHVWYy8khGj1iJwdPbfrwkwr6SCu
	 TSHqgnqpMmlZauxYqUtyMZXXmvllgmvAGiq3/VuHyh2GBVJkBxFkYO7fUqu5H+6E+hZTp
	 pjiTyWbaHh56xUjO33BxiDp1swFMpPSCFhaMPumEBr98b8Sq7Z85xxPykPTfNGV3sG21S
	 9aT2936FyWAmcKw1yzUTMxRojBGpa9prr37TR/UDqh75pUf960JehqFfoURJYuOQ5GWHw
	 Cq/P2AIheVOP29DkuTksWIp0K52MnhMgxJEZHO2LzTEHnzrS8btFGZm02okA6oRhj6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
	b=XYbX/3NhWtpItZOZhwoSV6R+zWAd5aB+7y7LuK9BNHg41sVhwZszeNZxAlmFs2Jfflnp
	 RkGanRf90Zeloa7FJYn7Y5zgrRW54tOoAZbFJErJNFGyZd3eGncOKk38/45YNLMQ5VYOH
	 OMLRgBjMEMMpWk0sckGgqkeFo7E/zbd+h7pyTy9dt+5rW4zeLoswm+ihZOeUyAtbOiXk2
	 gCweYZjD5sAE0YiBS8WjhSGXte++S1tM3w3bYJj591BJht1OzuVsBv1lCBP04QfdAzOhC
	 C4Ib0/OLTDFGblHSVDuzAMVZo6AC9r8QC37GmT/r+cm9te86RJ9wwhWbLA0mYCwscYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbACdJm;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0E606A897
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF0E606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbACdJm
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-71ab5e64742so2262368eaf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728760; x=1795333560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
        b=CrbACdJmIISrCeuPJihcOxY+P7oEzmYBO/8U4A7vqDSB4myAAzYVUCqgXtJWZeOm95
         76FysGZ9fNXGfIgHrVt807DwQRefZwLSTz7LlDfHEelYnq7czbaKcluZdap7w8xV+n6h
         6hwXMbdHIUrdBfLHsLmXMM6l0gx+1N/Wjf46LmJLqwewst7JR7FeM/3RY5esQJG2WyBP
         7icIMhrnLT+2/145sOy7Tes9R4PTlcBzrWknzwsmSZx7RqhljOGKuOsKf2hlmFDEkjyY
         VuppOABeog5pSUvbfdPdA9j4dTelNTqvJtStr3h/SaYkGsUYcb1+tN1mjmJtuff2gZR+
         mBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728760; x=1795333560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
        b=1cBqVL2dsCHESV1kSuU4kMj/fhReZ9u0ipxa5/cdj6ok+i2zWhz4GvDDfhrD9fg7uV
         tMhH9tuP5N/MWrsGF2ieI6Gma2YcDKofbeGGt8YqSa4EllmmByhOpphcYTJZOGBM+plE
         H7uOtVSbT/Iki3hiERMrZ3m4vTuHIWEQgcXJ9KexcBAQQ2ua3Ed2C8Yup67QPJoWVW9k
         H/IVo5pOpHe6DXU7CRFcRVyfuP3cVox9LJAoCr5iZXtPQchEWweJ9MfpDy7GsnuqkGXP
         x1yjgShdDeIuzlTrP/ZpwWivnUaHh5I3SGvEdbQVfn8XhJexLHPEXmyyGPaBKh2cCpuB
         N8Ag==
X-Forwarded-Encrypted: i=1; AL+hErEgc5FJUDiQU7DUONTaNXFnaNkhDrO/RZrweaM6ir/Pr0NuRgIS4r9QZdeCpEspnT9kv4XoajxQenmJsnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9noTZPQrg9yTuBXTbqL9RiunLFZlKdi+AadRfUDPc+5thGQkd+
	kvjxoveEqVOlI+vF/rDD1l3Y5OarHL97abfKDrWOZ9AP8x80/xLG+z+mwALnnQ==
X-Gm-Gg: AYBFou2NtHAzbaIlK+GoVyPmUEE5rzR/mxQrpJbtftNjnknbPd3JIzAlA1F/Qlj3uhE
	xuxsTt7fs/yfplRDMuh211ymYFHmP/1H192zOOCN9JBv+LHRqfPiWGIjuR0LwpTr+bLgt1/P8T4
	vCKHOcxQw+v/1pa0saaLkmyjKUHvnDlkdXbL4KPmxHXxytZEUudND8M1XhLIO14j6Bj/8PIU4/c
	2P5dMv2HOBVLALJsWjVhXSMWU986mG6JOSKfH/MWM0dsnddCc1wXAJ08NbsaD8wA1o3JfRhIaUq
	gudd+YS8hiB/3/WdtY8wttBEMDn3e9j6UtPHOWWLTdgrrWCLcLPYrfVsaUK4FbJb4St10Cqw09p
	tdx4o49Sh8ffrKspe5F4IrJml3IyV38CNqhH3ifdApJ397kTswTzfaiXG9nCHxUGRkmOV0n0VDd
	qlytx7Y17B8+dHi02W+mEMg+n/yphZTY+89G6EUZWaXUrjTDQIt1UDMJ3kAqGUnzKpDoQggqZCR
	+JL4Lk3xLRb9HfeWvGcvDx7bBpum+wQm81CslbzMBRv9pinKGUQjUHRoHYIo8VVjsvRsJToSfoE
	YsyZDrkDtQysbhPHvc0Fc6nMn6LlXcd34xoc0qe/ssa0r/H4DQIW6o4XvhwuLrbgQIttEdE7DF4
	6n4IN4hmpSnHt+m6X6nDmTkXwZ/hsBvsImvvudxf2UACK3lE0I5gmlYR+Y7wvlcHW69LJxWpDj5
	bBEZNV6IUCVSpGM2vc3bNy5F/vtFcyHLCDPgCzSkSLtkfLwcVw80CZ5DA5HvaxDWMFper8oRse
X-Received: by 2002:a05:6820:162c:b0:71a:dd93:2974 with SMTP id 006d021491bc7-71add932e3cmr1368333eaf.0.1794728759631;
        Sat, 14 Nov 2026 23:45:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:45:46 -0700
Subject: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
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
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The generic PHY receive-byte counter describes successfully received
traffic. Some PHYs instead count bytes in all received frames, including
frames with errors. Unlike frame counts, the successful-byte count cannot
be derived by subtracting a frame error count because damaged frames have
different lengths.

Add an optional rx_bytes_total counter to ethtool_phy_stats and the phydev
statistics group. Count frame bytes including the Ethernet header, padding
and FCS, and excluding the preamble and start frame delimiter. The counter
describes reception at the PHY, before MAC or host filtering. Clarify the
same byte boundaries for the successful-only receive counter.

Append the new attribute so existing statistic IDs and their meanings
remain unchanged. Publish its name through the existing statistics string
set and retain the unset-counter convention.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 13 +++++++++++++
 include/linux/ethtool.h                      |  8 +++++++-
 include/uapi/linux/ethtool_netlink.h         |  1 +
 net/ethtool/stats.c                          |  5 ++++-
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index 8659761ebc69..1dad86561823 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1683,6 +1683,19 @@ by ``ETHTOOL_A_STATS_GRP_SS_ID``. Complex statistics (such as RMON histogram
 entries) are also listed inside ``ETHTOOL_A_STATS_GRP`` and do not have
 a string defined in the string set.
 
+The ``phydev`` group provides separate counters for successfully received
+bytes and total received bytes. ``ETHTOOL_A_STATS_PHY_RX_BYTES`` (``RxOctets``)
+counts bytes in successfully received frames, while
+``ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL`` (``RxOctetsTotal``) also includes bytes
+in frames with errors. Both include the Ethernet header, padding and FCS,
+but exclude the preamble and start frame delimiter. These counters describe
+reception at the PHY, independently of subsequent filtering or drops at
+the MAC or host.
+
+Each counter is optional. Drivers leave unsupported counters at
+``ETHTOOL_STAT_NOT_SET``, and the kernel omits them from the reply. A PHY can
+report total received bytes even when it cannot separate successful bytes.
+
 RMON "histogram" counters count number of packets within given size range.
 Because RFC does not specify the ranges beyond the standard 1518 MTU devices
 differ in definition of buckets. For this reason the definition of packet ranges
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c3a41fbd5426..fedc127d9a8a 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -481,11 +481,16 @@ struct ethtool_eth_phy_stats {
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
+ * @rx_bytes_total: Total received frame bytes, including frames with errors.
+ *	Includes the Ethernet header, padding and FCS, but excludes the preamble
+ *	and start frame delimiter.
  *
  * This structure provides a standardized interface for reporting
  * PHY-level statistics counters. It is designed to expose statistics
@@ -499,6 +504,7 @@ struct ethtool_phy_stats {
 	u64 tx_packets;
 	u64 tx_bytes;
 	u64 tx_errors;
+	u64 rx_bytes_total;
 };
 
 /* Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*), not otherwise exposed
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index fa5d645140a4..2e81f7345f72 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -202,6 +202,7 @@ enum {
 	ETHTOOL_A_STATS_PHY_TX_PKTS,
 	ETHTOOL_A_STATS_PHY_TX_BYTES,
 	ETHTOOL_A_STATS_PHY_TX_ERRORS,
+	ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
 
 	/* add new constants above here */
 	__ETHTOOL_A_STATS_PHY_CNT,
diff --git a/net/ethtool/stats.c b/net/ethtool/stats.c
index 9b0d8cb07675..9b9ada615ac2 100644
--- a/net/ethtool/stats.c
+++ b/net/ethtool/stats.c
@@ -88,6 +88,7 @@ const char stats_phy_names[__ETHTOOL_A_STATS_PHY_CNT][ETH_GSTRING_LEN] = {
 	[ETHTOOL_A_STATS_PHY_TX_PKTS]		= "TxFrames",
 	[ETHTOOL_A_STATS_PHY_TX_BYTES]		= "TxOctets",
 	[ETHTOOL_A_STATS_PHY_TX_ERRORS]		= "TxErrors",
+	[ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL]	= "RxOctetsTotal",
 };
 
 const struct nla_policy ethnl_stats_get_policy[ETHTOOL_A_STATS_SRC + 1] = {
@@ -295,7 +296,9 @@ static int stats_put_phydev_stats(struct sk_buff *skb,
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_BYTES,
 		     data->phydev_stats.tx_bytes) ||
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_ERRORS,
-		     data->phydev_stats.tx_errors))
+		     data->phydev_stats.tx_errors) ||
+	    stat_put(skb, ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
+		     data->phydev_stats.rx_bytes_total))
 		return -EMSGSIZE;
 	return 0;
 }

-- 
2.53.0

