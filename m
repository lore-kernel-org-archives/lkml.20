Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B734FDE7F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648654; cv=none; b=J/uOoUCWk0iR9+wAAvVtamg/AJmLOY3v4w+alC963nufO1SEaIxGTEvL/pVOaaVt6yyGc2uLpvhIK23lJ1UuHJMi69j2oPT0Q309mQwApiRTQuFN+3NE/tHQt43Jy50i4jtdSi3fv/WV6i4rYp8dAb+aCT/s0CK04vKGYTntSDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648654; c=relaxed/simple;
	bh=UjrMYB1SJaVixFfmpvISBt1Okp74qLFloaIEp+D4dWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UaGkA1nOtYxAwUAF2j/5cBy08KNuCU5dJN3yUEj+NnAsVCQ1SkjVQlODnYJpgVO12ydv8XWFje8Vwh1GLveF5FhMqnqGHygpAfq6laKlkQc29nFBtpQVI9SdmVsLCt4gvuVez8IjnOvIZxQuw038mSrwlZkFEiZRX/VtfONqZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pdp2Dl2I; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pdp2Dl2I"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso626131a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648645; x=1790253445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wQAdV32Fk3OyDL+A25ZncHwDoalpqgqwEDF4cMme34=;
        b=Pdp2Dl2I9K8jYceUeoTqYt1lNhldV6eEbuM9/H7su8YgfKBXEM0t3VFObJaJzgQWFQ
         /Hbba4wEMfjrPWrpW5YO3t2bTxS9r10d81Zj1s1Vw2hZ/FO/WffYSICsSzqRZ0mOt0fv
         cwsXnYIKRx2gwujHOTuGNAYfizGAhpyXkYlZa18ruJ1DCRukd530swSOJZZtGjI/Q1DV
         bdd47bmR89GobBGrp/7csp4RyRJtUlzTpg9sBoifJ9rLc944IHGoFKdg+bRCKg2xLlTt
         +J6XmLZ3VfjuvEg41LIDHYznVT78HCL0z2T+6kZCzd+quIpi4CLHl55+8thcLnQ4vDLU
         1z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648645; x=1790253445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wQAdV32Fk3OyDL+A25ZncHwDoalpqgqwEDF4cMme34=;
        b=okWWWNrQpUkRdS7ybpK3eB4Z+eFEe6gENfGFIh7EcMTwDJzY4T3jJN0WtG9+hL58dI
         +lwTGR4KzhUrs7lCWPgmbzBPw+lmnBWbpBRj5ucKRiGK2xr5Ta0yV89vaDRsuW/dKBfL
         O34LNWwrKouB+ojYr79Y+anTm07ZMVKGqrpWgFA2xggRDDuSARjvwRFNhCAvTzXnUpg/
         lqFyGsVh2MpT6jkLDbzfqw0xdA6hxnaWihyWlnSMJQRzkq59PVMyIWADvv7GciTchpXx
         ilkrlZ2Oq8J4FDAZGlwGD+sJYxZQcUHH5qhBo/zzGB8Wf/l1ARz/5njgqgQ9liGOIhU4
         4vCg==
X-Forwarded-Encrypted: i=1; AKwUvBymHfc3F9NrjyW/a1vT2bfYxM6pS+osoR4Rd3WXtElkmAjr0YRJ1FAHR3lNt4WRFg1vVv7hOAE7gSxfiWc=@vger.kernel.org
X-Gm-Message-State: AFuF++nCnZesiazcMam1Iy1+zw6R8Tr7kWLZoiDdbIlMDle+us4tULL5
	dVQlyFAvNvjeMsS4ifTKo9pdFD013YoL72Ym70zmWVy7YfJTIj2rgw5ahocDfLY9M/91OYnV
X-Gm-Gg: AYBFou046/avDozwQMC2Tho2N7aQeMUdHVUYW84arGM3DaZ8p9dB6dOHCHoKSJBfDAu
	7cKwnoNBg5bAx7MOrjZchQhkSw1u3iD+i9+ukaEd+SStq/wFkvt9HGb+8w/yDAlwRmU48FjBYSr
	8Mt5E/6rQwu6mmBUSTfafDz3cx8qOKulLA8wTiZduXFnvVMt9BozFyUqX5c0dVeiVnkpx43thrc
	KVyCuqaQ1AhPNbJ0rrgNovO999klcJEYl+MwnKU8ZuBb6MQlJzE5vsPusjtuBLjx+ue3r13A/uY
	CAZ5XF4W38Io97ZVfaTs6lpYs+bdK68XXdaZrkxPoM/2N+jpxC+WC2mglXfj6N0JpLz62NL3+4R
	JipOiR9Iyjb8GcLWTlPHUG5pyRleOiwS3kJkIRgz8xi3xsT7ltf5RiJ0QXOS12SNfOn3OFuNQd3
	DdNf+gRC/WJZWt8P+2FtxH7GdQTLPKmLqwm2w7OrxjmTyQnTMlhOiaB521FDx7ZmC2VBG3unw5a
	SUJqqAUQ0ZgsI1v7WRIPCCkjFixd2Nx9Z8qCuA=
X-Received: by 2002:a17:90b:314c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-39e1e4e3559mr13681823a91.19.1789648645405;
        Thu, 17 Sep 2026 05:37:25 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:9190:e5c6:16a4:8428])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362f0f07sm6057546a91.17.2026.09.17.05.37.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 05:37:24 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Paolo Abeni <pabeni@redhat.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zjamg <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] can: restore skb header initialisations in init_can_skb()
Date: Thu, 17 Sep 2026 20:37:16 +0800
Message-ID: <20260917123716.63116-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9f10374bb024 ("can: remove private CAN skb headroom infrastructure")
removed the skb_reset_mac_header()/skb_reset_network_header()/
skb_reset_transport_header() calls from init_can_skb(). As a result, RX
skbs from alloc_can_skb() and friends again carry mac_header = 0xFFFF.
When such an skb reaches packet_rcv_spkt() (SOCK_PACKET), the push length
calculation overflows and triggers skb_under_panic -> kernel BUG -> full
machine panic.

The same issue was originally reported in 2014 on linux-can and fixed by
commit 969439016d2c ("can: add missing initialisations in CAN related
skbuffs"). packet_rcv_spkt() itself has never been hardened: only
packet_rcv() and tpacket_rcv() gained dev_has_header() checks in
commit d549699048b4 ("net/packet: fix packet receive on L3 devices
without visible hard header").

Fixes: 9f10374bb024 ("can: remove private CAN skb headroom infrastructure")
Cc: stable@vger.kernel.org
Reviewed-by: Oliver Hartkopp <socketcan@hartkopp.net>
Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
Signed-off-by: zjamg <ndaugoing@gmail.com>
---
v2:
 - Remove in-code comment per Oliver's feedback.
 - Pick up Reviewed-by and Acked-by tags from Oliver Hartkopp.

 drivers/net/can/dev/skb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/can/dev/skb.c b/drivers/net/can/dev/skb.c
index 95fcdc1026f8..14edec5afb57 100644
--- a/drivers/net/can/dev/skb.c
+++ b/drivers/net/can/dev/skb.c
@@ -210,6 +210,10 @@ static void init_can_skb(struct sk_buff *skb)
 {
 	skb->pkt_type = PACKET_BROADCAST;
 	skb->ip_summed = CHECKSUM_UNNECESSARY;
+
+	skb_reset_mac_header(skb);
+	skb_reset_network_header(skb);
+	skb_reset_transport_header(skb);
 }
 
 struct sk_buff *alloc_can_skb(struct net_device *dev, struct can_frame **cf)
-- 
2.53.0

