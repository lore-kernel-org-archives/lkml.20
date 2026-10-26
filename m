Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017585;
	b=Ihs5OejcoA8WRcz8+IvdH7ZVcvVSMvgG6QA0o2ZcHfvVX18mggRFJCpbmyIIsBhxpnYX
	 L3DbP6cBvCPNifW/89LL/unlucHHdrfJuNaj4nkquRBafHcc4mYPvAu+VdG8k2N0sqV97
	 gKArbJ7VuaUquQ1yU2902fHNLWl/qd9TOhf5x5h7D7YdXfwkUjhwV472BfHbihpiuDvh5
	 3BPGgwBTyAKpl0J9ZxF8NaWBqWoIQZ+u0R5BPlN049UqzpMu5MX97E2hDCtHVK7arp8iA
	 X2BYCr2l19/aQCb4U1cvEuXIxhFwC0tQGua3ivCgvfa4xQXq5M4XCk/JjWQcO26vuVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mXaPzB2LTZSPLIrdOOZClzIPyJgWgWO8rm/whSLIkPM=;
	b=KrpSA7ONd2gu9WwSD4jZpkusW7pZlDfLcqZ/8nxbzldoD1N9AdimHvffEQkk/kHlpd60
	 JNeCE/p7CIuGhJt2UtTcenoD1Bii3ZUjF6qaP6RKD5Zi9twg7TqJmayixkBDSKfUbTJw0
	 rpm3H+Xu92Zu+oB5L+vKMOTvIOVhOdYceoWD9mkZjfvzFroOFXAD93QbYwGBayiipw9gy
	 ARc+nshXxsQPw6xk6VYy3enEZLUI+vgL2cRGfI7LNsIyAQgh7hV5FcC/baTMOL9HrEqZ3
	 IRQhjZtnMvFYQWOixLmNTLXytC13Hm7IhL0v9FeGg5cOuyKhbwWdRa4f1FZgsTvSEwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J7RUKdBm;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D92606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D92606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J7RUKdBm
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1461747a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017585; x=1793622385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXaPzB2LTZSPLIrdOOZClzIPyJgWgWO8rm/whSLIkPM=;
        b=J7RUKdBmFWCFYf7Jm5iuhyIacJuMljP4DULL6+tfAbY8VnPD5NPIWoyJzDLqhCOK8F
         PniBYrHIfIa2L1Fl8LV7ahoG1/HQP3n8pi5GBdaqyYwFuOmJnh35QV/ZHqatgA+le6HO
         HNAulxRUnjbWO05GSaogpGkqryhZSuLSsqOYXzljsrH9vveEqXa5sSKco6lilfpvmoBw
         +F2ugaUMD9M21S6iqpDuSg4jHDaEpwwd31Elh7UOxn2KqC7k8/UAei9qMxhU52eVKsYg
         UhrZ8KtR/n3mMPgG+f74DQQi20v/K9j/xk3m5XfS0E6yz2xztPD1K6EWJldKHSIKfbsr
         kFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017585; x=1793622385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXaPzB2LTZSPLIrdOOZClzIPyJgWgWO8rm/whSLIkPM=;
        b=t7C4wiFkUDumJmPJZ7eErDnzCXFrZI+xHXlnvRSa/qYCtPO4XJQ1tkA4UQcKBYa1Pp
         YQtK7TOnTjokvFkqIQMaUQn4AalhHWe70M57RLA+cYu3U/8bYn2VNltXhs9Mt/abrxqu
         HUW1JAGgS2dyRUaigSGOspBiITcinUyVOggfMuGvvLTM1R/OtnPswYPsOAbMQVeuNkuX
         ZLJlcrYxrdd8DjjjZwvdzgHZCqt08UCteZlG7WexVQYDQIECOXaY0eUFin1iNY0z2Cay
         nyzVqLlzmCh2PZeQQutTT/MHewX/11YuE/pO1u/TbHsUL8XpQ8SijZHlYpnNQVVp3qxE
         WFYw==
X-Forwarded-Encrypted: i=1; AKwUvByF8/R6V7IllhyFHdmLBUkADyspVHiff0M06czDMeqsbGcCQdF95OvV4zKOn0j7XImJqal+PVbF6ojF+Uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQbSzDCof3dhoXYXRarI4UcoGEG32KXt/7r/agNkc+6WyCWW/0
	atxsMYJ6B3w48ldXaZgnzD/MAfd8aoELDl65aMT/AwhVSEOl9TfqNuk6
X-Gm-Gg: AYBFou3WdxmhtZ8+QvuX50ZsR/hb8Yz7ck1QN9vkhdSXuIyhKdde6EQZy1J2OJJhAv1
	RIbgzkU98NdmWTtTjcuViaFvkJqaSRcx+xxXO/dr0fPawYXkSm1krb6zite4gRU8N5Sm9WuEfko
	FUnF/XiXdM+yt2Lhrh8+d6bCXXKy5ubUxvY8SaqIOjruWWpdWoaN7vtNYC/wp1blZdwmBpL36Ly
	C6AdJtVLNzSb12DD+Y+EQfSXAl9EqUG1PjGg9tEAdlo7MA36AlQq4bHmP8CD413OW1yOaq0wtun
	ghkXraIvdHOI9T/mhGjMdWOV9DyitxVXapPGkjLT8SdBeTBOO9lK9xZC+rGx2LB8aDB95/knSAJ
	KAJsNMdg9eGFtrLmiXY2J72UVcaex92JGG+PuVzwf5DFvZuw6jDY6j9qwMsnMZlY/KYkT3uPXFQ
	WATFEn9Nu6M+3AuV0wUiJUeCxXc8QklxZ+LeMOrJXJq+aTuTqEpSdDC83TILrfxhCMrDszxhh+d
	XnQLUeJEq+yRNsC+6WrdhTGWVUKsL8DWr/YoiI64OT9RqXMOQG9xOznQix3M9QuBichVPhZo6A=
X-Received: by 2002:a17:90b:5105:b0:3ab:752f:5f9c with SMTP id 98e67ed59e1d1-3adeafad11emr5076749a91.31.1793017584676;
        Mon, 26 Oct 2026 05:26:24 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm8894148a91.2.2026.10.26.05.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:26:24 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Gerhard Uttenthaler <uttenthaler@ems-wuensche.com>,
	support@ems-wuensche.com,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Sebastian Haas <haas@ems-wuensche.com>,
	Markus Plessing <plessing@ems-wuensche.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] can: sja1000: ems_pci: fix UAF in channel cleanup
Date: Mon, 26 Oct 2026 20:26:15 +0800
Message-ID: <20261026122616.97845-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When a CAN channel is absent or register_sja1000dev() fails, the
driver frees the network device but leaves its pointer in the
card->net_dev array.

The cleanup path iterates over card->channels, which counts only
successfully registered channels, while the array is indexed by
physical channel number. This mismatch can cause the cleanup path
to access an already-freed network device and skip registered
devices at higher array indices.

Set the array entries to NULL after freeing their devices and
iterate over the entire array during cleanup. This prevents
use-after-free and ensures that all registered channels are
properly released.

This issue was found by our static analysis tool under development.

Fixes: a61a8423c71d ("can: SJA1000 driver for EMS PCI cards")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/can/sja1000/ems_pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/sja1000/ems_pci.c b/drivers/net/can/sja1000/ems_pci.c
index 986fc8786fac..ff680486a299 100644
--- a/drivers/net/can/sja1000/ems_pci.c
+++ b/drivers/net/can/sja1000/ems_pci.c
@@ -213,7 +213,7 @@ static void ems_pci_del_card(struct pci_dev *pdev)
 	struct net_device *dev;
 	int i = 0;
 
-	for (i = 0; i < card->channels; i++) {
+	for (i = 0; i < ARRAY_SIZE(card->net_dev); i++) {
 		dev = card->net_dev[i];
 
 		if (!dev)
@@ -399,6 +399,7 @@ static int ems_pci_add_card(struct pci_dev *pdev,
 					"Registering device failed: %pe\n",
 					ERR_PTR(err));
 				free_sja1000dev(dev);
+				card->net_dev[i] = NULL;
 				goto failure_cleanup;
 			}
 
@@ -408,6 +409,7 @@ static int ems_pci_add_card(struct pci_dev *pdev,
 				 i + 1, priv->reg_base, dev->irq);
 		} else {
 			free_sja1000dev(dev);
+			card->net_dev[i] = NULL;
 		}
 	}
 
-- 
2.43.0

