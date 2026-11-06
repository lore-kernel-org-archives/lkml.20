Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965595;
	b=PQko0TRag6o5ps/53sirPjmF1MqB2AC90bLNABVcb4l5B+7cCTKoN4VrkxZLAH8ASlnz
	 9zAszBBJXNmibNkB/dT2Yz/xnGpfe6DNyyZAM/4OM06HTCr4WrHyuIYVDoxg9rWAdPHWM
	 8zNxrl0Di+8FFvXS59OcT+aGZbAFgzG0wfbPZWNGPKtPWh56NgVZPjGTr2kTjGlBBLPPQ
	 biYUE3yGOKnCY9VI2ZjFUDKwfoNyuaFEYqwP3K1enH+FYE6TKMVwurQzHYD2wO/Bu4kD4
	 wbNtpOnOOgpJdTJl7g8pnZenWKTEp69Ogp2DGcovs8uM/tUQ8ZMWnGWWWIYAgGCvL/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PW7RojDyoN5co1CXu90PKl7ieBhUmfH8TTR5WzS4o3I=;
	b=T0VB1S+p/KXIJbKtxkd4TzNCxrAl5IlhObo8eatDrcBWKDRQ9eUHejNWsHDPZniCWHeX
	 bbxnK7cJITmRcA1Vd8Z/DMYh3Q605URcsXavmRxx2IzRaQeq9fANP7x1lgATbXRok2nca
	 z4jLI2nZ1M+/FuLXM8nzICEkGurBtb3H2rthUt7X5MOFR5Bk4d/hUazRRR+MeVqFR9DPW
	 pzm3u4ScGSX1oOV+0n1x6ywTat8+ua+BUKPzs3r+XjCMp8cX3u/njJLrmEFZPUYMSaVfE
	 weTLAecry90Cf7q2+MEWf5B9FQDmyN58TRJSO27+BaGSZHmnEnMfoMpEaG3pRuhhJgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vh0eTN7/";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C989606A92F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C989606A92F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh0eTN7/
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so1084118eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793965594; x=1794570394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW7RojDyoN5co1CXu90PKl7ieBhUmfH8TTR5WzS4o3I=;
        b=Vh0eTN7/JxSWLK60P1Mlw0WMnnGjwEufQsnkS/70TwLqJyiLgyjfzu0TzMvysjSjxb
         9A4tdCkcJWiifGJ91fFW39s6dbSNrbCvQyrf5OL23e3lOErtHxyivpLEJmJ5mFXKDOes
         POZmcdujx1Jwpwg4sGQMNAwTOCQntkckNVJ4LyUhdlLmIMadXQ+iit9qCyrnXMwJgvQj
         TFaRTCi/P5HVLdhMrSQCgRuUiQIXKOTnThoMYbiaC68EwADTAubRICeVz+ElrEmVQlSh
         w2Xv3sCTm/XOt/dvB0+SzqmwhAYSZrwLmHPLVWTMgmI1sGl/2xc9z9yAZKgSGzpsPx+i
         7A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965594; x=1794570394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW7RojDyoN5co1CXu90PKl7ieBhUmfH8TTR5WzS4o3I=;
        b=c3+qGowmRnQAch8WdDw5s+y0q2xC5JHrQHjHgpQTpcvCCuxWu5SByqoJ6BIZ/7pRV/
         q8PWM8rYabvbOr1KFVNDi4AZa9eXxQjTHYqUaLtzDyywpnKGdaHOW7DcLgQ8oVqhHP5V
         2Ah4anKSqLEIzKxaapUlQ8MZ/ntfR6vUM4we+JEkwCA4eEEyTzgcZUnFt2Itpi55l9nE
         P1+LkEkiN6yfhfwCIJ/lfxm9lAivJAjdlJASQPJc/paV1YCfBHnMBzhdPzqFaYnmPkzE
         1u+bmr9O3mzvGVG3cgHIg7JgxFNzvEf6BL5/f8ML7p8LlHPgr9YAHzF3Z8/NdcIVkHtm
         EnRw==
X-Forwarded-Encrypted: i=1; AL+hErHGp4WOwJ3ig8H4e0n6fm4U/JeqVwrtYrXgZa2QV6gxWb7/SCqbV7RhpWH++NKErMg3R3zPzZiDH/Oxn/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2WksDep4V+jmSsZWyf/+4UnggqRc8iQFzeSxXa3F0Lc/dt73Y
	DHg2nPZdnfEzfDglRWV1M/hijpkMRPTRuF1O2toI2TRM1hY0dWk3nxZ9
X-Gm-Gg: AYBFou1j3Ls66nAkXRnAn4h20cRKDiptmaSRABmyybUpQ0ZNEJ6nz+IkRpZalpeZFSH
	UmIxlokdXCaTaS3Q4USWrXPZCQepVbBm3jCABnv1XY8PHZqDeOxuZVBPLYwQ1BDiOECnzcVyADs
	cAz8GLX3JkQu8K7KDWemzVLP4grYeslc1QyGLDcteIbQHl/pIfq3G/qBcZm6X3s2bMJybZg6Gbj
	lsTjkGiaAfqAmpnX3TDcfLWpg1EtO9NL6gJPxcFi3MNj9kWKQJxRTCrI4+y2F9qMEzAhNcuGUlE
	6Lz1D54b1ZR+NSvChCF+s7iMQHut9v1yqYZNyVxLbL7/y2gca7N7owGh18L+UuyjYdVj2At1iS2
	bLNWmd4axHTy26PlzQ0FODVZh+Z/0liclUXQjGMBx8hzC4nsH3aAc/b1RQfta2WCKvyymJMpsoM
	B84ucDbHgAVFIXmxmQBQFrL+qwScn6fOls7FObB0wROGNgllub3UFoR3MHIhxxxjVO+4pbYA0MV
	I2DZPPKUuTKJkhZDurTpHSpNQ0nQcMPvd2RxizMB5/6gL2fyg6pvm5lDh2cW2wBkhHYi5/hBlUe
	UJZgTO3XV/k4dz4EPtO5DwgCl2w0AU36NN5IrWEy2igU
X-Received: by 2002:a05:7301:1522:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-36f77eda447mr2941017eec.33.1793965594008;
        Fri, 06 Nov 2026 03:46:34 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:51:1d31:c2b6:f9ff:fe77:10a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm6167055eec.17.2026.11.06.03.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:46:33 -0800 (PST)
From: Amaan Cheval <amaan.cheval@gmail.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com,
	hramamurthy@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	bcf@google.com,
	jordanrhee@google.com,
	przemyslaw.kitszel@intel.com,
	maciej.fijalkowski@intel.com,
	pkaligineedi@google.com,
	maolson@google.com,
	csully@google.com,
	willemb@google.com,
	yangchun@google.com,
	npl@google.com,
	awogbemila@google.com,
	shailend@google.com,
	nktgrg@google.com,
	maxyuan@google.com,
	bpf@vger.kernel.org,
	john.fastabend@gmail.com,
	hawk@kernel.org,
	sdf@fomichev.me,
	daniel@iogearbox.net,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Amaan Cheval <amaan.cheval@gmail.com>
Subject: [PATCH net v4 1/2] gve: block XDP on the DQO-QPL queue format
Date: Fri,  6 Nov 2026 17:15:50 +0530
Message-ID: <20261106114551.212675-2-amaan.cheval@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261106114551.212675-1-amaan.cheval@gmail.com>
References: <20261106114551.212675-1-amaan.cheval@gmail.com>
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

Commit d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ
RDA") enabled XDP on DQO-RDA by dropping the queue_format check from
verify_xdp_configuration(), which until then refused every format but
GQI-QPL. Nothing replaced it for DQO-QPL: gve_set_netdev_xdp_features()
advertises no XDP features there and gve_xdp_xmit() rejects it, but the
core only checks that ndo_bpf exists, so a native XDP program, and an
AF_XDP socket on top of it, can still be attached on DQO-QPL.

The DQO-QPL RX path was never written for that. Its page accounting
assumes the driver keeps a reference of its own across every handoff:
gve_xdp_done_dqo() passes the buffer to xdp_do_redirect() and then
recycles it with gve_reuse_buffer(), so a redirect target that releases
the buffer synchronously, such as an AF_XDP socket in copy mode, can
drop the page's last reference when pagecnt_bias runs out. The page is
then freed while it is still DMA-mapped and registered in the QPL, and
the driver posts it back to the device.

Refuse XDP program setup on DQO-QPL in gve_verify_xdp_configuration(),
matching the features the driver advertises. A zero-copy XSK pool bind
is already refused by the core for the same reason, and a copy-mode
bind never reaches the driver and is harmless without a program.

Fixes: d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ RDA")
Cc: stable@vger.kernel.org
Signed-off-by: Amaan Cheval <amaan.cheval@gmail.com>
---
 drivers/net/ethernet/google/gve/gve_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 2437cd8ba633..4e9e692a0ed0 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -1723,6 +1723,12 @@ static int gve_verify_xdp_configuration(struct net_device *dev,
 	struct gve_priv *priv = netdev_priv(dev);
 	u16 max_xdp_mtu;
 
+	if (priv->queue_format == GVE_DQO_QPL_FORMAT) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "XDP is not supported in DQO QPL queue format.");
+		return -EOPNOTSUPP;
+	}
+
 	if (dev->features & NETIF_F_GRO_HW) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "XDP is not supported when HW-GRO is on.");
-- 
2.47.3

