Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3F23E835F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336334; cv=none; b=nveCN2SXSSCS66tdTOJ9yv42wkCPV75tcBpNN/VgkO++h/88/KAqaV52BHeyXHjNnpeWorSuv6wp/z7bV51eFQLHk0vHHiHe+8q5FT5hprAK4obM4CznkQ1SJJmygi51tKYydfTVO5jk04TurA3oQEt1p05YJ4q3/VGJ4GPtG9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336334; c=relaxed/simple;
	bh=itnWdfTO7rPTGSzm2C6vlZj2LyTW+V62TosmP2CtgTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VU+uBlIk5DkevCl21hC8X+3h9mp7SIfst9FKHZKjF6CORgweCKu31exACTR02vL0Gu9IQP6fuUmmxyAXxhM4TS4rAgecK9AgNPqqsJmQpLb19m3EN3Zd5wWr1DRfWql58kLCq+WO4uRg6jZKWylX4AnrUkMPELC7yERXT0BK/oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=RsKOUk+e; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="RsKOUk+e"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so5902565e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336331; x=1788941131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ODrjT6kBXUsW+2D292UeajaaIrcYqKeGJo03Hcn0Jc=;
        b=RsKOUk+eCIVoLXIEkrvcp5bFSs69wkyJyQdm6hX147S5MQumP3jVXnMO/vTs4CgnBk
         vDU+BBdqpVhI9R1E1fDOlzWEDlpj5ZH7NNwyybW04xiVDo9y1zLR9Ug0S0EmsCp52z3M
         GqCO8YOgMOWepxdkg4LIYJBWNs+i1lN4xefIJpP1BoZHWKa0cu/LxKtmsXsIUb0jL0Sq
         FwcFGyZ0b3iKYa4vBRgUcZMiAzA6n8t+j+yM/CWE3MLIlcWVGyn/ucHB+2pckitiRick
         iu5s497lzvJJLAE9nZsEvd+A/gQBNl/RfwNVwssPhbb2RJV2eFUJ/VTvQN67RH7aM933
         JVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336331; x=1788941131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ODrjT6kBXUsW+2D292UeajaaIrcYqKeGJo03Hcn0Jc=;
        b=OIzVYL/dp3TgPZTGnAD2dbmEr49ERbPDBlFOgV4ipWyazirXCcsutfP/83vAlynutN
         8CTgtQZXLxP6JO08+gHOzOgvu9+QvO6EqDsdGTkGSsZ/CUCDo+kNjzW5x/rCwDirHJpD
         q/6agtretx9IwzvngQAEwIGQhR0uVHgFavVAoQutvK0XizQ/uCTPQaKuFgqFgehA4qU8
         loQ6ZCFw5F22kEj0euV6dxFBooiHQiHaXJSVkQ0Wp/e3nEg7naa1kvhaqeHnN3PO69vL
         S/YFVgzUXn2pjZ46xU6a0MWN0XOmE+kk9AL2xd3DtrZGt5e9imygml08WxWsVLW5m8Y7
         6MbA==
X-Forwarded-Encrypted: i=1; AHgh+RpVR6h7PsDxAJnh8JOcHVoppWKmANoC+qYIty23ngP6kBf2Ktx5UI21Qy/jgPLjBApFb49qBgXTovbCcjc=@vger.kernel.org
X-Gm-Message-State: AFuF++kDCmdWh83xrDwOI24MTvVwbcWdQrCBvn5864iGbM4blHaFxReQ
	x/i3hsHFVQf8WfibdOY4Rvkw/GMoczG6R8v/tswd1alKWkct3TtAo4fMuOQTddbiIeE=
X-Gm-Gg: AR+sD12OzDCtSm0aWP3WKCb9EctFvEc1U2uDXoitAwkiSsyYsFeCGIMQsg69eoGuTb+
	uhgBk7vJMa6yYBuvExonJaLxDBxqXkjPtpCxPWUSPIhIFXS8JuOqfidMgmfHkwhcWIC6YH9nBlU
	qkOe/wQ3CuINXuMZd0lRQ+bKX38F4xJizBBHYfCwafVqBZz0AgaOstLA17mmpd3fvD6Tq4nQ9Sj
	ef9QI9vGMBXjg09NQIyDKsWDAldtfuwLexwvpggDMk4No9alg3LtfWJWitNdv4aKAE+SomJMP63
	RrhD264Cm/2bH63nwodYgjCtIx1ptz/snHpm/WP4Q4uD7bZUJRFiu3hsJS4W9/X56ZQWhwK774g
	vcqAbihvj0HAxlbJhGzDi9FVaiI9CSDsMEqcmSXgOyPq2aRv5J/x59pbm1Bum7LVuAAeA9jmaa7
	UUpPsdmZXoxkeRRrx7YNorUWyxPldseLNcuIz1qao=
X-Received: by 2002:a05:600c:1d11:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49ce582a54amr49962495e9.14.1788336331049;
        Wed, 02 Sep 2026 01:05:31 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7dd5154sm17766875e9.2.2026.09.02.01.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:30 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Th\u00e9o Lebrun" <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/2] net: macb: zero the link settings taprio reads back
Date: Wed,  2 Sep 2026 08:05:27 +0000
Message-ID: <20260902080528.2211468-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902080528.2211468-1-f@lex.la>
References: <20260902080528.2211468-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phylink_ethtool_ksettings_get() fills only what the current link mode
provides. With no PHY attached it writes port and supported; on a fixed
or in-band link it also writes speed and duplex, but only if
base.rate_matching already reads RATE_MATCH_NONE, a field it never
writes itself and so takes from the caller. The ethtool core zeroes the
structure on every path into the op, so its callers never notice; the
taprio path passes a stack variable and reads a speed nobody wrote.

Fixes: 89934dbf169e ("net: macb: Add TAPRIO traffic scheduling support")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 76ee4f506033..a43855db1e45 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4297,7 +4297,7 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 	struct macb_queue_enst_config *enst_queue;
 	struct tc_taprio_sched_entry *entry;
 	struct macb *bp = netdev_priv(netdev);
-	struct ethtool_link_ksettings kset;
+	struct ethtool_link_ksettings kset = {};
 	struct macb_queue *queue;
 	u32 queue_mask;
 	u8 queue_id;
-- 
2.53.0

