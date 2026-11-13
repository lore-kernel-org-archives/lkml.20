Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614339;
	b=wq4ltdSReCYtrmmnPQWVbQE+HCPEbZ+hiZTjLHpYwpRDfW69AtUKcQddaHTsqAbHlajS
	 a4gtwSn+M3uHCzObKPnCAGQ1Xl5ExUwm/ZM9x9Pjvlmrxg0/+a0gPChm2K3xzvRqO8BiN
	 jEC2FsUSc9t9yPLntZ5hheZY24fK/n8+N8RavojBPUI0WLGqfgjJuCFsQ1g1C17JTsEc6
	 muH1D3e3IsuIfp53pSV8M4aRRmdI9EA6jgU/+1FKC2CJzpmMZN7wdHCvxrLWiVz8BgFnn
	 eYUJQCgB5KcoPhS2Fjn6e5f+KrK+OYMMGVK8MWbMpW2sIjd5wzHteFph8SjjfQOZfLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P94FGP68ZZgSuMQ+raENon5xMjnwilC1ilibSCmAWWY=;
	b=3Be4y66WkpxFKtTHBTwVhq9BuDKYcFP/XHyFcOIr5Ftssn1ipi6kTxm/McI7xa38HvoJ
	 K19djHO+/InoHKPrfXuBqyA5zF783vl8JQlr/MhBZDuRIIBKOXYVHi70SXILRwx0D1Ea2
	 WLHJl19gG1YeoOdAswvxRpXz87q2JwOdnnl7xiaCRNKQRJtMKT7WdfBljrU7bH7vCSor8
	 Z6O14iTUHgu7tPDDpQpCsUYf5qR+RNJUdpTfUZEZ6WrXWklkTED37RyeV65x8Wq7PHwon
	 Tr2ZEPw6S8jZCUS44IOdoUfd/OTNUZYQ0f3vqnlslHlN2nJsoX9S2ai1pmMWN96F0Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QDCi725j;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51964606A899
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51964606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QDCi725j
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d30639709so276126766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614335; x=1795219135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P94FGP68ZZgSuMQ+raENon5xMjnwilC1ilibSCmAWWY=;
        b=QDCi725jAY8cUue0RnUbX3KnWcAY3EZb1Nom1G9NjTRENmxjOL8Oomd7F8M2P/T8jN
         KoP+vT5zGC8VZJSHeiTdB3gK4rxTHih+R9D947GTbBXkZnFzUnfjWrDZWQVz+ZHStQH3
         UCQnyGpFWRZpWiW+GBkrHzF/M7WdDyQirkObeQJR5ekS7ZwjMz8qi/N21xe6Se6hGHl5
         X0NyVtTPaXTv9DL+Uh1go1EezC04K/AdJjGVp6Vmt4M6ghskrEx/gMJyTJotVxhf9Oey
         AZx5H1CfA9X0KJzivbSR7UH6PO92f2y/y9VArCotuWL1Gm50gA2RBWaqJrjeC6+IwOqk
         h/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614335; x=1795219135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P94FGP68ZZgSuMQ+raENon5xMjnwilC1ilibSCmAWWY=;
        b=l/JH5ksluMWcvdjSzWAhwfa+x3tcIgN7zHLUj+WOLkvs7YNR0t18LMEF5L+2M3XtfS
         l1EGpr2B50bLK4++7Gu5hnyU+mVt6ZIA7pOD0FLlEYEy7dfxFAfHbtcfgRXMTqP+gaIp
         06XBiT2w3URIZtyyRLLlC+7UMPybeG20EMVxV6zav+OSPnUdYsao3Qu4301FV/4ZFKA1
         LHY4m3g/ivpq2KsgTa3Xy256Yb0wY3ks9HAsBVZWlTP/BOO1g+Htreek5IdCNh4gx6n3
         aOpZSOq8GGujq4hGiIXuAJH0m9IuuO/FxeGe7PGw1S0JyNLNfUS8f8y7q/W2wOiTCTjC
         lgKw==
X-Forwarded-Encrypted: i=1; AL+hErGqhf1sRrynXEq71lI1/dGlgRsf3B6gZSlEB/aro/iT80D3wtQlQUm7kyFwABIQ42i9MCLbPHjc9zGdu6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nlnQhl4jmEMZ4eHgT+0Q++504k4tX/UvzBoRLM6y1IJyt0sFd
	UO2QlfHvvSf8hw4Ysi9zqybp3mYcqIWy/v8ebFphgGFRo7WB2NmrkLf4
X-Gm-Gg: AYBFou0z6aQLpHadbbtL3eFOAcpBKGZeaxgn40YRIX7dxbqpotBidwlgLHeZlpDo+nb
	fIdVd4NN07KMWUcxv/Xfm0uzjm0k58HoVsYyTJUIC8QiqFKJtJWGjlTI8P22p6GgfHKkEEPk+yj
	HW72+OLoWNKk6MqTrF9mOOmyr0yeqaJ6Wk5mVShgjCtkCK/vIVr0+fWRDIe10XlS2bmu1qE2XF3
	MS2nqxGkmK/lrdHswnjcdTu5QZsbXStpExX6zvZn6YbZHXXyii9Br2vxfnSGMdoq3VmSYx73DiW
	kHF3vJAfeGTeZv3OcOswX5+TJOSa2UmD6VzusVm36upa/+akHqc+MNah/8mb0OzTe8EMElsCdNJ
	qwQJsbYOQtnc0tdi1Mv/S/qphU9i14gDirOUqB/BbgD2u6mmT10pzd3+4maWFDSkfJbkFxysUAI
	ZTxfxUO7ti30nPNT+9c5vVLs9iPCRyqIZdGlbb4lrDlxtL8mJ2aOgZj8mT2+0AjnbqB2F9jmP46
	n4Gxb84YO0tzZoPA8CrAu/TSYlYcz4pnIED/hVOMGf6/A9MUMG8fw/fL232JQMdEdfoINZjjHZ2
	Pm/4+boFr2mDdjYilf4wWGjChwtI8WumrEBbtjR5
X-Received: by 2002:a17:906:4fc5:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c509643c050mr381566766b.32.1794614335551;
        Fri, 13 Nov 2026 15:58:55 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm153454266b.32.2026.11.13.15.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:58:55 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/7] net: bcm4908_enet: TX ring and DMA fixes
Date: Sat, 14 Nov 2026 00:58:40 +0100
Message-ID: <20261113235847.517308-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
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

These fix the BCM4908 Ethernet driver. Patch 1 fixes a TX stall seen
on a TP-Link Archer AX6000 under sustained load. Patches 2 to 7 come
from reading the code and from review, and have no reproducer.

Tested on an Archer AX6000 with OpenWrt and Linux 6.18.55, whose driver
differs from net only in one tree-wide change, with the LAN going
through this driver: TX and RX at line rate (941 Mbit/s TCP), and four
ifdown/ifup cycles of the conduit while it was sending. I ran the same
again, plus a UDP stream at 1 Gbit/s (944 Mbit/s received), with the TX
ring shrunk to 16 descriptors for the test, so that the queue was
stopped and woken over and over (about a million qdisc requeues in a
minute, with the ring full or nearly full in a third of the one-second
samples). No stall, no errors in the counters, no DMA timeout warnings.

Sashiko's review of v2 also pointed at older problems that this series
doesn't fix: open() ignores a failure to fill the RX ring, and fills
it with napi_alloc_frag() from process context; a failed RX refill
loses the old buffer; and the driver does not work without its
optional TX interrupt. I'll send fixes for those after this series.
It also found that a TX completion reported before start_xmit()
publishes write_idx can be missed; patch 7 narrows that window, and
I'll look into closing it.

Changes in v3:
- patch 3: leave the TX ring empty after freeing it, so that a failed
  open() cannot lead to the same skbs being freed again; wait for the
  TX channel with read_poll_timeout(), as a 2 ms deadline in jiffies
  can expire after one poll; leave the skbs alone if the channel does
  not stop (Sashiko)
- new patch 7: order the TX ring index accesses between start_xmit()
  and poll_tx(), and publish write_idx before the DMA kick (Sashiko)
- add Florian's Reviewed-by to patches 1, 2 and 4 to 6, not to patch 3,
  which changed

Changes in v2:
- patch 1: stop and wake the queue with the netdev_queues.h helpers,
  also when start_xmit() finds the ring full on entry; the changelog
  also names the slot that poll_tx() completed without a frame
- patch 3: wait for the TX DMA channel to stop before freeing its
  buffers; free only between read_idx and write_idx instead of
  clearing slot->skb in poll_tx(); drop the OWN check that could stop
  the queue for good; fix the RX timeout warning; the changelog
  describes leaks and stale frames, not a use-after-free
- patch 6: the comment and changelog no longer say where the DMA waits
- patches 1 and 2: more exact changelogs (the measured rate and what
  stopped; what driver.rst says about NETDEV_TX_BUSY)
- drop v1 patch 7 (RX frames longer than the buffer): its trigger is
  not reachable with the driver's own settings
- wrap lines over 80 columns; author name without the nickname

v2: https://lore.kernel.org/netdev/20261112195051.597102-1-kudzo51@gmail.com/
v1: https://lore.kernel.org/netdev/20261109235700.2586821-1-kudzo51@gmail.com/

Kordian Chmielewski (7):
  net: bcm4908_enet: fix the TX ring wrap
  net: bcm4908_enet: drop a TX frame whose DMA mapping failed
  net: bcm4908_enet: release the TX ring on stop
  net: bcm4908_enet: unmap the buffer of a dropped RX frame
  net: bcm4908_enet: unmap RX buffers on stop with their mapped size
  net: bcm4908_enet: publish the buffer address before OWN
  net: bcm4908_enet: order the TX ring index accesses

 drivers/net/ethernet/broadcom/bcm4908_enet.c | 143 ++++++++++++++-----
 1 file changed, 107 insertions(+), 36 deletions(-)


base-commit: 86706ffa990ecd46a4326f8eecbccbbd60a6cb8d
-- 
2.56.1

