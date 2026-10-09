Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77994CDA3C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545721; cv=none; b=k5MjRt+VYHrITE58XJE9tl3bN9rrMpdtgRwBeAZQqpKTNJsHTc7TEJ/X5iHn7DTxDeWxShWjwjXA3B1NMwB2C20DI0ZMmX6Uav9UCh7RiNswGWqhR1O4Hio+RzsjxXzFEYe6xbUmXOOJXe9CEbqTBLRxFdrg0z5Co1RAKA5UKy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545721; c=relaxed/simple;
	bh=2R2FAHfjSDMObepA1OdjpbsG4zBRUy4e93IUDKml36g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R6digeTYWpHQj3ZW9/cn8efutSrhiqYiuakTAPmVCyvh+WAhpaKB93vfGlB3V0o5WLdHKju5x1bH8Oq7A9Y6U9oS8cNerR8PB+T9u4rVJ8g5sNIzZvDftLrwWIR5XElySkDDXxLauW+KxD4c+AwYAwdFqhgCKhK+U8CbbpneWSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HO2gQITE; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HO2gQITE"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49429181ce9so2160543fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545711; x=1792150511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q8+wh/N/g5AwFI5ghv77Z+PvaYgxRtZHcThuJwPsrFA=;
        b=HO2gQITE6M1SH9xUCNzNQJmFKHcCDtSeBKmKu45Dg9SGlPa+718IEjjg/aP4uf4XZ0
         o3WQLWzTAlJ6TsN71f7APaoYDH+0o1RX8p7bdHLjvjPtgOxkBFllEu4wUYKDrI2xCswi
         AV3EiFtx0wsLzloyqgptEPzQbfgamq/lquZBSR8KyZ7PxQSAc2U/HFG+I2tP+MEaI/cC
         UZH5sGdQhxvvo21Ls6xEAIhG6dizoj3PC9dvrr8k+ALc5qkzF5ldppdtMd9o+B1YFJpV
         vpOSiBak8qySBJfz8ul6zhgUlQEC/tD+bz/NGAsecC/Nw/OYedNQo/hOKGWEFIAj97B7
         Yk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545711; x=1792150511;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q8+wh/N/g5AwFI5ghv77Z+PvaYgxRtZHcThuJwPsrFA=;
        b=hRbmw8rN6PtJK9WRIgZwp/6bgytrBFlKCHPTKWPfSpg4hCqDa+Z1rdDHA6TJfPCVL8
         5VN/EF48QgC4Q1GuBbRnx4Hh6+F0GkZjIXytdyyFoMIBtZ2C+CdupQ9ESaPtZu+IyJ23
         IuBVsgve367l5kk8Lg5GDfJerkJ1gfXcjgJEUcY5hxLTj5z78JXEQnMGSB5x021LQzAO
         0DjRNaf09O4fe0qrigFqvJJsklUHt0Pfv3N6O0Xlhx64+cMSN4gJBkKm55Muyo82MrSe
         yiNIj1OabE6NwhUAwpYb52AH9mAxaMeLwIzrC4hNG7N0IiPEO35OmiOoJeXOIJZ/Qkuk
         4iCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAtQt0O9uBM1rzJnpSOiHJFJvp5vFYxXpBn+yph1p0Z7zP1nTGVIwSrornby/j7Nws7SKpyIGtAbDIpsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYID3d9SNVGky1CF4tOY2aFAO3bNJ/OFucKCS94q4ddgKcjpXH99
	A9ConUt6S26uO9eA2m5XhUPPppqBI/EWP6d2g4Y7TKWKNStAfHAQUy4X
X-Gm-Gg: AYBFou3j+e2KsKJ3yrGp/y021qRG2T7KuDK3gB8ODLVnUAKokysqPMDJGAvvw6gX0Bo
	sdnIcfIpqiBOVnEZZFqMWDHYefCgt3rI67U1YEV00S9MiErgS45FPtxVHoEkQrA8X1tBFZc/lek
	MF23fC0IfFt6p5CavwgXE/P6N7SwMZLh8dxpxTkMKHGDM6/PnI8fQyOz55oObAw4GxJbnfEAL6p
	d1RfQrCGkSBrYCpcc00AQD30orvbZC++HPaO4I+EzFXZFcS+qaHedlprUy6Pnn9dLIvd5lsRTov
	YBCSS25PuzXfZJKOjhOtjL1/cfn+Toj8hmOim4bbr/voUQxX772uzIWbz06HpSIAN2X+BznpQcJ
	ICLZcSf6cFxkkpIIv7XRsK2jPNv+zsJi0NYsJT7VbLmoHhg0TdhsZbQ0XL98aC7Pb5infI61BSw
	M/ie48658L79wDWDygy6AaIzIThoDMVV6pHbfgSBzKfrzHxxgF7yrLixvA0pYTEets+Uej
X-Received: by 2002:a05:6870:2803:b0:49d:6a41:29ff with SMTP id 586e51a60fabf-4a2a89b4321mr1308706fac.51.1791545711234;
        Fri, 09 Oct 2026 04:35:11 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a84a1457sm1374829fac.4.2026.10.09.04.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:35:09 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/4] eth: mpnic: add basic netdev statistics
Date: Fri, 09 Oct 2026 04:35:03 -0700
Message-Id: <20261009-mpnic-counters3-v1-0-7dc7644cc500@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjRyGoC/x3MQQ5AMBBA0avIrE1SbUK5ilhQg1kY0pY0EXfXW
 L7F/w8E8kwBuuIBTzcHPiSjKgtw2ygrIc/ZoJWuK6U07qewQ3dcEskHg7Oy1pqprU2jIVenp4X
 Tf+xBKKJQijC87wd+6+YgawAAAA==
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org
X-Mailer: b4 0.13.0

Add basic netdev statistics and report them via ndo_get_stats64 and
netdev_stat_ops.

Track per queue netdev statistics such as Tx/Rx: packets, bytes, drops,
etc. The driver keeps per-queue state for statistics that is updated
mostly from the NAPI poll and ndo_start_xmit paths. The stats are made
available through the usual driver APIs.

When the netif is transitioned down, the per-queue stat counters are
folded into a global per-device set of counters, and then when the netif
is brought back up, the per-queue counters start counting again from 0.

Extra care is needed for implementing ndo_get_stats64 since the instance
lock is not taken. When ndo_get_stats64 races against ndo_stop and
ndo_open, the reader can attempt to read per-queue stats while the queue
count is changing. To deal with this, the writer publishes the
aggregated base stats and the active queue counts in a single RCU
versioned object.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (4):
      eth: mpnic: count packets, bytes, and drops per ring
      eth: mpnic: report per-queue stats
      eth: mpnic: count Tx queue stops and wakes
      eth: mpnic: count Rx allocation failures

 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 182 ++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.h |  29 ++++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 185 ++++++++++++++++++++++---
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |  30 ++++
 4 files changed, 408 insertions(+), 18 deletions(-)
---
base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
change-id: 20261002-mpnic-counters3-d08883b96372

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

