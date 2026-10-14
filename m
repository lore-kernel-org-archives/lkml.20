Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AD23A5E88
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946412; cv=none; b=boFaH4uZKgqKu12eHIxMQx64AKrGRd7UflakgeZAY2JRzD302IGm6e/yMlI7od5Smkz97Hf71n4dWMX/RVslQliW7WkK/Cxa/twscUi98+b7gDMqgLJmu5pT+23yCpwmxDmmFH2+kdx7HLvlAuf36bEKvJTPdGt1lH6ncUpxwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946412; c=relaxed/simple;
	bh=iewhjjnaDn8n3LvHPYGwnXZMaUGK9eNKhxffGIffUbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaIX/qgAuj845nKdlIofnCTTqfi2bhTqQkfkrSPEdSIThRNnBnl4x8AgSp5Kce9vDRuxio8h77plv5ZSS9u1gYHiyXN5vFmHA85iNZgrC7dB7N4ttWdP9IqR/JYtksCqEpHqbhhphmWFaX9tdWoGvc33WYrjcrRi3yPxdIoid68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=AyK/qaFZ; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="AyK/qaFZ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so1493416eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946407; x=1792551207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leSND+5gisN5Md9k6LWpzUNyWGXK/I4NhOs2RkfudTI=;
        b=AyK/qaFZWuk4UuU0mChSgvJR8y0lomGws/Lpqlry9lSFEFzeZMTCX1INQo4us1hWPM
         EbjkdFOpvNtVs5Pb4feP43ruuQKRoyjWM0SiwdHNXK90tRuvEMr/wAFMpaIBuDWD0EYb
         +tGK9TcskTMUlc8dDUFxrO6Krnw/0lPSd1NA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946407; x=1792551207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leSND+5gisN5Md9k6LWpzUNyWGXK/I4NhOs2RkfudTI=;
        b=c1DQyRUVB8vtf/EiUOBsDyr2A2E1sosj2C0rDRGZO8vEK4JxXd8I+RM7/Cs0wPDMCJ
         91B7K6gw0yo9hQpIvoEhez5bhMRhq+DAGy83qXHnAEsBLjyFAw0Y56swEsMQXtFlhBZq
         BLpnoG0rwP1Z+MPtfBaoLwUM8p+iKX7P+IVlV3HC9ja5n/1E0ajQFFMjhJD7IZWQMQXV
         FLTHcGKoREK65ahGZPVO5ByKhhY2botZ56mQxdqL7VVMWKXoyYzs78CMxgyd8RWOuKls
         xMubWvKUw12ijWkrRf1OTpAU17qtReglkC6jkbWz/7ZCf1zd2BSn7vxvSICbmbfcLfq2
         +u5g==
X-Forwarded-Encrypted: i=1; AKwUvBzUGAHvzCtu74mkge1lWQ/Lhzhf81TlQbcfRgHGrbdXlzUZx75LHe9q70PzHe3tGy/jKfgCIqx4Wx0hrbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3seTTpZYuO/6boa/dQqVzPb9h1UIC2sOvNabBpUAqM1IDjzEJ
	yqwFE1FOiXc9IesGo/peIMWl9lvuCXDUHbufzrR7Yhq/+52TcGLkIsQyDFm+ZwlAU3c=
X-Gm-Gg: AYBFou0nFTcT+eVDVpGiE+826MFbbNfYcWW+N1hOJYW+/QNwvYhHtfZ009RruJm2nlf
	uQq6FKsLkvinuObUiXMZOFp03Bpoox1wherxVsCAnCMbAzvaJQx5McgBGAwAwNXvMaweuGRsUml
	GMYgD2NzebG+ZPuXPJkxJGeUCoW/sc3oHfCD5NttQ0EK3KsUiGR0oAMaJFUObSKZPQtRjrS/0/n
	eYxTBOO3Feh/DRY/vH/Y7yGIPU8rRNLIoWzNlKYVZY7iSpZFSZustOgQO22Vf8qpNGaN25NzHzV
	P1mpWzUGJJ4QDyhCoDDkxXc5N8PBPGMlwBCTFBcGdo7RNatDylSDzBsQFLEhzfTuQWCNWE3/ZCD
	0VIiW5C1gJzG16D20F0DV+lrsMzaBPRBksI1SOMkRxTrCw6xqiyTq5lLreeQ2zc4QpeaqH1c3q8
	EUsueh8wZJn80w+qMVLuR0IHuOBI4B9BUYjzC8qRn7fqS26fAHomIuAveLQQWncpTomHOKqsF7C
	UgZ14jg3da2CSeSKGlIOoh7nIc=
X-Received: by 2002:a05:693c:2a16:b0:35c:6fbd:a1c2 with SMTP id 5a478bee46e88-35c6fbdd020mr4737812eec.4.1791946407006;
        Tue, 13 Oct 2026 19:53:27 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm46522557eec.28.2026.10.13.19.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:53:26 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] net: usb: pegasus: do not advance rx_skb->data on dropped frames
Date: Wed, 14 Oct 2026 10:53:06 +0800
Message-ID: <20261014025307.25233-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
References: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the 0x8513 chip, read_bulk_callback() skips the 2-byte receive
header by advancing pegasus->rx_skb->data in place. This is done before
the pkt_len > PEGASUS_MTU check, and when that check drops the frame
the goon path resubmits the same skb with the advanced rx_skb->data as
the transfer buffer, still PEGASUS_MTU bytes long.

Every frame with an oversized length field therefore moves the receive
buffer two more bytes towards the end of the skb data area. A device
that keeps sending such frames makes the host controller write received
data over skb_shared_info and past the end of the allocation, and the
corrupted skb_shared_info is used when the skb is eventually freed.
With an emulated device sending frames filled with 0x5a on a KASAN
kernel:

  BUG: KASAN: slab-out-of-bounds in dummy_timer+0xade/0x3f00 [dummy_hcd]
  Write of size 1536 at addr ffff888105821202 by task swapper/1/0
  ...
  Oops: general protection fault, probably for non-canonical address 0xeb4b474b4b4b4b4c: 0000 [#1] PREEMPT SMP KASAN NOPTI
  KASAN: maybe wild-memory-access in range [0x5a5a5a5a5a5a5a60-0x5a5a5a5a5a5a5a67]
  RIP: 0010:skb_release_data+0x36f/0x800

Only skip the header with skb_reserve() once the frame is going to be
passed up, so the receive buffer always starts at the beginning of the
skb data area. Unlike the old pointer adjustment, skb_reserve() also
moves skb->tail, so the two header bytes now count against the buffer
size: lower the length limit for the 0x8513 accordingly, otherwise a
pkt_len of PEGASUS_MTU - 1 or PEGASUS_MTU would trip skb_over_panic().

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/pegasus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index aba1a640fc26..7c7d6b69998f 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -461,6 +461,7 @@ static void read_bulk_callback(struct urb *urb)
 	u8 *buf = urb->transfer_buffer;
 	int rx_status, count = urb->actual_length;
 	int status = urb->status;
+	int rx_offset = 0;
 	__u16 pkt_len;
 
 	if (!pegasus)
@@ -510,7 +511,7 @@ static void read_bulk_callback(struct urb *urb)
 	if (pegasus->chip == 0x8513) {
 		pkt_len = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
 		pkt_len &= 0x0fff;
-		pegasus->rx_skb->data += 2;
+		rx_offset = 2;
 	} else {
 		pkt_len = buf[count - 3] << 8;
 		pkt_len += buf[count - 4];
@@ -522,13 +523,14 @@ static void read_bulk_callback(struct urb *urb)
 	 * If the packet is unreasonably long, quietly drop it rather than
 	 * kernel panicing by calling skb_put.
 	 */
-	if (pkt_len > PEGASUS_MTU)
+	if (pkt_len > PEGASUS_MTU - rx_offset)
 		goto goon;
 
 	/*
 	 * at this point we are sure pegasus->rx_skb != NULL
 	 * so we go ahead and pass up the packet.
 	 */
+	skb_reserve(pegasus->rx_skb, rx_offset);
 	skb_put(pegasus->rx_skb, pkt_len);
 	pegasus->rx_skb->protocol = eth_type_trans(pegasus->rx_skb, net);
 	netif_rx(pegasus->rx_skb);
-- 
2.43.0

