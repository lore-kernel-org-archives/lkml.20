Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548226;
	b=BIXYDIf+8BuvzaRXCprVZ5ooSJKS7igj7PxZE6MGr/F/6tVuIF/jigrRBTZpN7EY3ia3
	 hmUCE/6JRwI+gAm2lZN1Oca8S1OGfqdMrpo0OD2cRdKen7EGLLjHOt/gZOwkq9brQT7ta
	 WgDA9snL5T76PoG0uxMk4MjZ2wi5WXN5i7SNJQWFA34XF9pGTBDe4OCaxX/WvUdBy7HnR
	 lyYa6bRPJCZfIHoHjsdeoNRaU5rPgrQoGu2tQ8RjGXm8yTxNQc+i06jppdtN/8MnpPUV5
	 UQa+IK0Zkh0nwlxP0l0v2v08hs5xLT7A4+BexagdCMapJ04VGqMA21fmUTndtYPYHcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=leSND+5gisN5Md9k6LWpzUNyWGXK/I4NhOs2RkfudTI=;
	b=e1Ob6Sgod7TQdH/HiQB/esN9jsaY55i8k+k2npcpOBHyvNRcbfFjkLuCjIX8ZzR6RuHo
	 vX22rDeZqvEdB0jxLWURO+ouBMpKq+tcmD4qjosGtmI2TPbgKT1VcXoXsNYEiFz5OztR0
	 VbXQAgL1Ogh9XNR59ojC1ddG2iTze50VdKcKVkOVogHEatXDmgKr0yu0n3aKEXH5RYizG
	 8Tz5gnbBW+G2/Fm2s3eFllp8+OFkIngXylS8zy9xj6GOQld1snop8uBe1HSWzHxC4ETYh
	 ypLgHVyjItEzVCsiEwckkvPkZh2BGe6+Rmbr+SfYAudPu90jqyhTleSdnwTI35k4Ahw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=jXal9uMz;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C7F606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C7F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=jXal9uMz
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso146186a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792548225; x=1793153025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leSND+5gisN5Md9k6LWpzUNyWGXK/I4NhOs2RkfudTI=;
        b=jXal9uMzh3jrSLhx4Iks34YrLTO492g0SltRzGyW7vr5OChLsja1yNHkoUYr7Q2G3x
         DB4saNOn/xjxdQVyYRHQap9zOxY/RjQxtfREpxMZkve8dGYWpbzhkffHofY8pex8kZw4
         aXBR2avmTiw9HPJEkfhCJVNYk9jBX37zwq8C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548225; x=1793153025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leSND+5gisN5Md9k6LWpzUNyWGXK/I4NhOs2RkfudTI=;
        b=YB883bUW4KpHnxRK4tMM0CdzqRG3c1NpYZFbz/ds3+EkfqRwxaCm7Bj8AbotkM2RQ4
         Ko1AJAVuXdFhAL2an0ow8tma7DBxcDJqMkzMS+ZGjedaOKEbkr6Oy1Hi27M7p/f+36Zg
         h2oGIkuVjmDbgbTVY+JKkXBNGvJ3n00PnLj2vsClDu/gjOo1sy5WwZe4DXLMtBYKTt9b
         p4swPzzN4/2goQEOoU6PQ+il8K3wxMAFRjiKRNxCe5qhiSKCfb5qwAMaTm29m5vSbl6D
         jxjqJOQp/Oe1QInbZyVPqAqEKy2NYRbmIr0gSmomjyo67H37SyJuELaYPxKaqOvzqmIa
         BbfQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5SGr8jUzMVblUQkZdemG4rGt4pINiasXy86+bcsLs9BM9Lm87JENCyFDWIAr8LgB7Sro+Bo0ekt86mjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVOK3tXtpUkHqTrwjcSq/NNBLta2MAf5vFOYwMdu4IB57UC2cO
	ES3dVRqENXtSGTqLxJjleP3G7SKB6eBoFNaOTXscEvK9s9qn4NXyA8gZ61zm2RDn8Y4=
X-Gm-Gg: AYBFou3RTTcoN92p3QwrXHHq18IVmnLEPt1Kbnlp1V7z6+HJjCBy0BaYNcf9kRwpp0e
	T3qMzi7w7LYNpEr2Z3M6Xh0ecvTdjQ22V9HjmLlyP9F1TPHNWOkWoSRok0fpkv6nq4uC39jaFJm
	5hKHJGSFa6k7yhLP6aSQEe1VPW5FjhmzmBimY2iT2L+L7nuY1L1LVDoU6khSh34rk8bVxoRwE1v
	IGsX2y9EXBaqEsP0kMSBcjUN559TyJiF9g1/+OKQsM++/ZcLgHZ0kQUYkoPGOn9YmdNsBfMS+aS
	ucYlKHtNNWxm03jgO+YPhfy6IqDCMwbwIWFwXekidcEJ/OaKOmfwNj56DgXIZ1xLqPpHi1j+md6
	0lbY8TTmvolt9yrZVtshSq8h7o1fyuiCSWWqtRvbXYZ0cyRrVoGR5jgp4PQO1V2GDrYzScVElkJ
	14EKS4ZD5QtjdTDKV5qkzDMb1lJXSk092sBe03xRJmuesK0B/XRX7fa2NcFi0jHB1XoazvIcwSC
	t6UdrpJGvMDW6FNVgdiSSDXUR3TVUZteNa7a1E2+EAqfgAeTXU/1L4TesU1khdCtSF2d0I23zS6
	Dhn/BVAO0g==
X-Received: by 2002:a17:90b:4b11:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3ad86cdda5cmr529688a91.64.1792548224392;
        Tue, 20 Oct 2026 19:03:44 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([203.125.131.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035a117sm1934124a91.16.2026.10.20.19.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:03:44 -0700 (PDT)
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
Subject: [PATCH net v2 1/2] net: usb: pegasus: do not advance rx_skb->data on dropped frames
Date: Wed, 21 Oct 2026 10:03:09 +0800
Message-ID: <20261021020310.34045-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
References: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
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

