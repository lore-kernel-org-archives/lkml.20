Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41B544A417
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976389; cv=none; b=KtyL2zoUkaRwyVYYsQe7t7nwV+u+JhhWSE3njwmXmgOU3Klc+nzpo/TfG0eJkPCuGQz1GXWMAshSe/FsQFTLvm4fnArNzzWOQnAMgHbbKnmNkHHiEpUcET9SLvsNhFg4HlH5an9snLLO13SEuv+sIRDtI2dB3nA8m6r/7HLwL64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976389; c=relaxed/simple;
	bh=SkBEWpTSogqbSaw0UuqFwkVg9IiaRtWY3W7agnFxLfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDDfFqIWBY1eeEzNV/OaFIh4LuCGFvQskB6gcsm1r4a373flSNoCE0bF7T4fPX+B6a454G4jsZsPah0XfkNKNuXoEKJW5LRZeQW150sxxs2HZRwPmkK3GT8cKIzjG+37vIHb/0vFyryC9Jwoy8/K7LfRuLmHBb2RdtkfcyWrT38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=Z1VaUxqG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="Z1VaUxqG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so179206f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790976386; x=1791581186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prCKrXxOjSoMWYxgstd/oS+K3M5uCiaV+ENlE4JoYxU=;
        b=Z1VaUxqGm0Ywrg1AXzw2VCJu8UlPZeAsML99TBFWqDdP31ji1sDhH4zUCQIUfL98rJ
         TdHjvYwxbenAt/D4DzkEgEYCgZ15KpVgT7GKwAhSLaAJYI0dWlAv9l1GwUvg3bSI9qGL
         qQpmDJltqJzv8cYdf9XpGWXwxtM4RobqRPnnl0LkIoaAkRUKsoE7TMhwkV1/3K5jcusb
         GSRXIkd17OZGIBlMT9OPe/7cx+GcKVoTZyJNg5sy+wpjHfD2pWPKIhVD3gloyqpMnMTS
         sMQRHYkJT2JPwrfiQDSpZpqTfWuHTO1wnOtzpap75aCCxn1+XsE5dw2ycRCoGOqL4mSW
         bj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790976386; x=1791581186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=prCKrXxOjSoMWYxgstd/oS+K3M5uCiaV+ENlE4JoYxU=;
        b=vwP3U4aypyJLbNlsHCDrfXxMhLNHJnsLsjsv4l3hA1Ubq4/4eTkQxUjsJCyMg23ZC1
         6+SPrpXKac6USytYjTHV5w4u/TgIJYmFQCe9Txrx0PSBrPboWDzcSGeSV13EJyhxDjdM
         zjCC/xAYNCRqffgz/JimUUK+JWqwrMcO4Ck1UuSPWbepb7a9WHoSoWvlv/8nzQrRD4u1
         91MvOwVsu9sw7HbR5V9G0KNG/8n8DZBW6byhLXWUGwZ7rTDOW6+dvXgVSQQWYv36FtuV
         LPGc3Isy3M4nYIawMPnYIH+bxEVNAyI59KIw+LJaveXXZrLYQOBMW/bwetPfuumdMxX9
         z2WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDUEe+zPwahU3lg7K5B2ikoi3BXb0bWtxTKSfQ7bfRxu8eDtMnLsXZsY7N4osinNr70F6+SXyB15iRf6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1/cFelcJ2e8QTp4gHoa1xAJME4i2Gp5J2tLJiwAXoRyNll+eD
	y+qLY2yPDMvOxVgjt9J/URx1qb7RIcXgtTdXWekxn/nP0nJZtABnymLpE6+aUFp9lq0=
X-Gm-Gg: AYBFou2adlMygzXSoNK8XKhgJ3eo4RkXhlFL7x+iZLWPkW5egWHjWH9wXUPI4cYRXnC
	v2kUMimBDIbL5RO2210B2A3T6mn6APYgueoPR5FBhWYOdAiQlM2Vn+6MnTCGmSKwVCbrpHzxF6j
	YWOtBpOxJiT4AkcrgEvVsixh2tNVsU9klT8MW7SlcqzbTTYtvqg+X5LevoSXT+jkrliX5WEd3hO
	E5ibHPUvakOUJq3sDIbnefUhhjyN9lgJMj9+m20tDUcl5lt4wwjG+VMr132187FIAlfYn2g3FRz
	L9wONMlfUIU/nT3AX4lZ2duSTKc/rB7LZaF9oH7p8ba8mfhJHLgureVHY9WaAoh3Cl3tx62daKE
	o0DpIsAy9SVf98Tp0rK2WmxVEGg7DC8TWTEYf47rG95sLQOm8SSuUNCO9D3DpkYdsF8MNOwIwap
	WuE0dvN/wf4MBArUcy03EGsK7J9XBpHcl+s2ot5dbm77O679Cy8kvYkszlHvzBTz5rLdJdy/6Ah
	ctLfppKsgtUOfyxiJ6yDjvUQvyCVpJo4OgbHFOh2wOxIVjrtOjHnV729uPyMX2Zl/Ek9ujui43X
	Og==
X-Received: by 2002:a05:6000:46cf:b0:48b:ff5:d297 with SMTP id ffacd0b85a97d-48b12741723mr4903984f8f.25.1790976386011;
        Fri, 02 Oct 2026 14:26:26 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253ae9sm7183149f8f.2.2026.10.02.14.26.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 14:26:25 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next v2 1/2] amt: mark relay data as a UDP tunnel packet before sending it
Date: Sat,  3 Oct 2026 00:24:57 +0300
Message-ID: <20261002212458.34247-2-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261002212458.34247-1-omar@blockcast.net>
References: <20261002212458.34247-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_multicast_data() encapsulates the multicast packet in
AMT + UDP + IP headers, but unlike other UDP tunnels it never calls
udp_tunnel_handle_offloads().

If tx checksum offload is enabled on the amt device (off by default),
GSO packets (e.g. from a UDP_SEGMENT sender) reach amt_dev_xmit()
unsegmented. They are then sent with neither skb->encapsulation nor
SKB_GSO_UDP_TUNNEL_CSUM set, and the lower device drops them:
__udp_gso_segment() fails because csum_start does not match the
(outer) transport header.

Call udp_tunnel_handle_offloads(skb, true), as other UDP tunnels do.
udp_csum is true because udp_tunnel_xmit_skb() is called with
nocheck == false.

Also reset the mac header of the copy before recording the inner
headers. amt_dev_xmit() pulled the Ethernet header without moving
mac_header, so inner_mac_header would point 14 bytes before the
inner IP header. That makes tnl_hlen negative in
__skb_udp_tunnel_segment().

Suggested-by: Eric Dumazet <edumazet@kernel.org>
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---

Notes (v2):
    Found by an LLM-assisted review of drivers/net/amt.c. Reproduced with
    the selftest in patch 2 (x86_64 KVM guest, CONFIG_DEBUG_NET=y), tx
    offload on, UDP_SEGMENT bursts of 8 x 1200 + 100 bytes, IPv4 and IPv6
    inner traffic, 40 runs per kernel on net-next eb0c18404c89 and 20 with
    this version of the selftest on 071876fd5048:
    
     - before: 0 of 900 datagrams delivered and tx_dropped +100 on the
       relay's egress device, in every case
     - after: 900 of 900 delivered, no drops and no UDP checksum errors at
       the gateway, in every case
     - with only the skb_reset_mac_header() call removed (two runs, an
       earlier version of the selftest), the packets are still dropped and
       DEBUG_NET warns in skb_udp_tunnel_segment()
     - tx offload off, and non-GSO datagrams with it on, work before and
       after; amt.sh passes with the patch
    
    Not tested here: hardware UDP tunnel segmentation offload, hardware
    checksumming of a non-GSO CHECKSUM_PARTIAL packet (it now leaves amt
    with skb->encapsulation set, as with other UDP tunnels; the selftest's
    egress device has tx offload off), a forwarded GRO packet as the GSO
    source, KASAN (the netdev CI's debug kernel ran v1), sparse, udp_csum ==
    false, and amt.sh on the unpatched kernel.

 drivers/net/amt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 0277e4c..a8236d4 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1078,7 +1078,17 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 	if (!skb)
 		return;
 
+	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
+	 * header. The tunnelled payload has no link-layer header, so the
+	 * inner mac header must coincide with the inner IP header.
+	 */
+	skb_reset_mac_header(skb);
 	skb_reset_inner_headers(skb);
+	if (udp_tunnel_handle_offloads(skb, true)) {
+		kfree_skb(skb);
+		return;
+	}
+
 	memset(&fl4, 0, sizeof(struct flowi4));
 	fl4.flowi4_oif         = amt->stream_dev->ifindex;
 	fl4.daddr              = tunnel->ip4;
-- 
2.50.1 (Apple Git-155)

