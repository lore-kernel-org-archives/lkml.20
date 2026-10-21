Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548228;
	b=2Ad9UcJGv09mxOEweRP2pBBeLBoICWksKyOlmAAzkgxD0zHcphychPH/QrRXxKohyXqH
	 86yX/tpwXLHszZWKbTfC74H8P0fdoalt271rLQ1pol125z3L1RG6soz6fvVc3ps929M84
	 Qt9ycOFkzP4McsPo6wIQvQ0Yp47c+eceEFr/7LscczCMsHUz08Ta0BIKVmGAZRgVaezWA
	 vyTwWDLr0xY2A9PVCryN7hyTSBR8oVdI3/vWUv1/FbfHV0jkB8vAy4zvQo3cTkvYUJGnv
	 q/uF5eXtj82bwtPy0iGe3wsEwaxpvOcr7y5Ukd2pGdlEkVYH33Ai4KeD42Yiga6wLUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MO3SgQuzAg3V5kXrREryHNzNfwh74+uhBA2alimYoe0=;
	b=V3Itdbmp5plq6GY4B6+LL25bjy0Aj3dHB/QiN9O7jwX1NKV/6aKvL/RK7GK+Eh7JxDYP
	 QjdpzXJQIHDzgcgIn7elTQob+K84nZNfcGpCz7yytXStesTdXHgs6KpWWQjLs7b0BxyTV
	 EAvsPIL+sfbd5kL1Bde5u20qbC/gIjbiAet2OM061f+BOjX/BF/3Eo2BxErv6KW4rS5mB
	 TYJjWSZQfFWUo0hazXm4tI3p8nObq+ykVcvss7LkrqT+m7NrKOh9+Ti3QOUBVb+FiLpEx
	 Z7+gIze/UTHZg2tQywFhTiooDdtnBnZfRJh/YhO+GFjkFmHTlOQC409FPni2012haew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b="h/m2fH6O";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7028C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=h/m2fH6O
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so192540a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792548228; x=1793153028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MO3SgQuzAg3V5kXrREryHNzNfwh74+uhBA2alimYoe0=;
        b=h/m2fH6OaMEnC6tFW0u2SOm4dnJ4dQnTTGMGtxG3gBMRjJpIgeYI5Ph9/yGfHLuJHJ
         l7DEoeCiqzQT8VtZedA4lPcgWm8kT617+FpU3o/RkURArUAMsXsyTQBykQWO8kfYGSZo
         Soi15z+FgGAS5L/q8tkyr6VDOm1aeDpEZElc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548228; x=1793153028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MO3SgQuzAg3V5kXrREryHNzNfwh74+uhBA2alimYoe0=;
        b=hk5ZUI9T8lepWzRZOi/6Mx6ppbIU5WlWhHjkxAvI0MXTJjMsEvA9cRPTCmmf0cl0uB
         Lr6zJSRvklHnDE162y5gXR1E2a+eHai2g8/Y3vpPUGQrdLfeGP5Epy29FkCva/V8fq3b
         rUTYJ8hta3P/6HY2cqdneW3XQruB135vC28lTvDc3Youtq+dJPdI287n6nf+IH2WzKQH
         xhje60jAyM0dOJL/L8Ce0nEK4sGtEo8GflgicVVeCNUG/iJT2PCVyuyRkE334iwGg+Wf
         tOGGkbgPQorqtydEspGnSLt69eKelH4IR0NKhxFHBalDe5CWyXN4OW7+OCxsczA26Kwr
         ESJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVxxraasF4TnT4gN+uHCpd0kZLh4vBX90T2E6aDTOjc05gkf/Ag6IjD5uQpWnUsMtKeDISyQjmzugXe4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgjaZMZ/oeH3fdAorvsYvWxKjJPGpxlHwzqceR0wiqjZ784uh7
	G1B8RX3FfofX2S7ra20vnJcSni/qJV37CvGIDL7aIaa1rxQv+wIaXpweR9v5QIpT9qU=
X-Gm-Gg: AYBFou3yndX+IixScLsdYxVDXzXM3jr8P+7QrIDLoID6wV3/T/KaWyNxI0a6fY2eKiA
	E0COmv0kZyXgw2eeqrl5EKUDeXXdh3A9tr00x/lfkKboBF4uhtDn21VYe+f2rqMh2Q9JUlGNjbZ
	ICaaDdlaTLx62OyimDBUr7PDgCexe6DeLjdayBGOo1Wb/iFXWQejT1qV6htMgA0aHYQBnS1pF3J
	C32OTQBrLhXIcpK4JHCdH4Ksbzs644D4p2eTUhX67YqT5lfMX3HOAzV74P75y3prGr8Yh1JfXx2
	GL9tI1+y38nQxH8F4LJbjWUDfptnZvaoaWaVCqXR/EboqE+yUSCOO5sHMIww9MH+6eF/p4LadkT
	RF954JbX69aTMd8va1l5xYRMYU3gncr0Cw0MBNjxFJCqRf0r48OFiQ2G07DJSg7L2/FqqIrHKby
	Vzo1ZRaMo0MF4yG/mLYM2iBx0kioOiZcKQaIH9nSqKTLw7dd8d54e+HI39rDpuDItCJ5RU2X6+3
	BLX9DKxDZmlOtq87DczxuJKrPXhadHx1RvJV4xaKpUM8J6O39uo10VMabiNempzr8mWrI9FqID+
	l/Zln/B3cg==
X-Received: by 2002:a17:90b:380e:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3ad86f73897mr573324a91.42.1792548227728;
        Tue, 20 Oct 2026 19:03:47 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([203.125.131.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035a117sm1934124a91.16.2026.10.20.19.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:03:47 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] net: usb: pegasus: check rx pkt_len against the received length
Date: Wed, 21 Oct 2026 10:03:10 +0800
Message-ID: <20261021020310.34045-3-law.wei.jie@gt.tech.gov.sg>
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

read_bulk_callback() takes the frame length from the device, from the
receive header on the 0x8513 and from the trailing status bytes on the
other chips, and only checks it against PEGASUS_MTU before passing that
many bytes up the stack. In two cases the stack then uses bytes that the
device did not send:

- A device that sends a short transfer but claims a long frame gets the
  stale or uninitialized remainder of the receive skb delivered as
  packet data.

- A device that claims a frame shorter than an Ethernet header gets
  past the check as well. eth_type_trans() takes pkt_type from h_dest
  and the protocol from h_proto without checking skb->len. If the
  transfer is also short, those come from bytes left in the skb by an
  earlier transfer, or from uninitialized memory.

Drop frames shorter than ETH_HLEN, and frames whose claimed length, plus
the 0x8513 header, does not fit in the bytes actually received, and
count them as length errors. urb->actual_length never exceeds the
PEGASUS_MTU sized transfer buffer, so this also covers the existing
PEGASUS_MTU check. Valid Ethernet frames are at least 60 bytes long
without the FCS, so they are not affected.

Found by code review with LLM assistance. With an emulated USB device,
a 101-byte transfer claiming a 1500-byte frame was passed up as a
1500-byte packet before this change and is dropped after it, and
frames claiming 0, 4 and 13 bytes were passed up and are now dropped
and counted in rx_length_errors. The extra bytes happened to be zero
in the first test, so disclosure of actual kernel data was not
demonstrated.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/pegasus.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 7c7d6b69998f..68e4b6658dd2 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -520,11 +520,17 @@ static void read_bulk_callback(struct urb *urb)
 	}
 
 	/*
-	 * If the packet is unreasonably long, quietly drop it rather than
-	 * kernel panicing by calling skb_put.
+	 * Drop frames shorter than an Ethernet header, because
+	 * eth_type_trans() reads the header whatever the length, and frames
+	 * longer than what was actually received. Passing either up would
+	 * expose stale buffer contents, and skb_put() could panic on the
+	 * latter. count is at most PEGASUS_MTU.
 	 */
-	if (pkt_len > PEGASUS_MTU - rx_offset)
+	if (pkt_len < ETH_HLEN || pkt_len + rx_offset > count) {
+		net->stats.rx_errors++;
+		net->stats.rx_length_errors++;
 		goto goon;
+	}
 
 	/*
 	 * at this point we are sure pegasus->rx_skb != NULL
-- 
2.43.0

