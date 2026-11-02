Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623980;
	b=EQI44O1kpj2dZPdUqM/hJGYCT9lKOFK/XWNmg2KoOZXxcILwCEE+lSafb396GObNYihp
	 GN8Yj35vTT1WG2htIt7dj2pz621h9uSG0Y5OfIk9BNYNwsMKK3A7KYJI9OrCSx6pXwex7
	 ldKJJMb4xGUfkBT00qQw/XybYjDBpjDyhCJzIN2FjvG1EjwTs16eqxCjpzCuSU/j2HYHu
	 pGtbQbA9E3TmXrxrSs5T55dIi/xi4jmlOEd3+OMVokKnn5PvKx0QLMhawVVrck9dAYG+I
	 2tQJYv5BUQ0O8ieERKujDtl8FWayTK7GBLTCuMExvW0kHkNtMMwxfe9/qvSPjOSdmfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623980;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3PialWx1gJazCwMTuiaUjmHYkSCF0pla0P3jT1wYUtE=;
	b=oyIxRLP0knWJQebBU+CgJxfyVWZtcrwMeMeJM2UqG7Ad3we8JMWIIPvf9eiEAWiXxWdv
	 ewppFujsbxXYCkg5no3v3lRcDKHhXWm9Br5t9TiWYBiiibqBmrUhf++OwkMoA9AtedDJq
	 B9iz8aNW3+J8u8iA9yp0ASOAZbflds02DQ/X/qwenZ2qQ0221XNtjJuslxLaFoPGcySnv
	 5doN652o5V/G8h8ZlsbtmS/LClV93UYfEZi+GheS/+yUP5FsLaKNGoR1Uv6/5YNrcyKUD
	 AU7zHVKCBOmRaoS239aYeire2Lb9GGxtJ3rAO8WjkXY4hV9LJFs/ekNTeROTAvghN0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DD606A326;
	Mon,  2 Nov 2026 12:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 248DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 224CF188FC;
	Mon, 02 Nov 2026 17:52:57 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id D911D188FA;
	Mon, 02 Nov 2026 17:52:46 +0500 (+05)
From: Andrey Karelin <a.karelin@ideco.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 2/3] staging: media: av7110: check dvb_dmxdev_init() result in av7110_register()
Date: Mon,  2 Nov 2026 17:51:30 +0500
Message-ID: <20261102125149.82725-3-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102125149.82725-1-a.karelin@ideco.ru>
References: <20261102125149.82725-1-a.karelin@ideco.ru>
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

av7110_register() ignores the return value of dvb_dmxdev_init() for both
the main dmxdev and the optional budget-patch dmxdev1. dvb_dmxdev_init()
fails if the demux cannot be opened, the filter array cannot be
allocated or the demux/dvr device cannot be registered. Probing then
continues, and on device removal dvb_unregister() calls
dvb_dmxdev_release(), which dereferences dmxdev->dvbdev and
dmxdev->dvr_dvbdev that are NULL or, if only the dvr device failed to
register, already freed.

Check the result and unwind on failure, releasing the corresponding
demux as well.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 drivers/staging/media/av7110/av7110.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index ecc15bb222c5..3371e33db103 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1283,7 +1283,9 @@ static int av7110_register(struct av7110 *av7110)
 	av7110->dmxdev.demux = &dvbdemux->dmx;
 	av7110->dmxdev.capabilities = 0;
 
-	dvb_dmxdev_init(&av7110->dmxdev, &av7110->dvb_adapter);
+	ret = dvb_dmxdev_init(&av7110->dmxdev, &av7110->dvb_adapter);
+	if (ret < 0)
+		goto err_dmx_release;
 
 	av7110->hw_frontend.source = DMX_FRONTEND_0;
 
@@ -1337,13 +1339,17 @@ static int av7110_register(struct av7110 *av7110)
 		av7110->dmxdev1.demux = &dvbdemux1->dmx;
 		av7110->dmxdev1.capabilities = 0;
 
-		dvb_dmxdev_init(&av7110->dmxdev1, &av7110->dvb_adapter);
+		ret = dvb_dmxdev_init(&av7110->dmxdev1, &av7110->dvb_adapter);
+		if (ret < 0)
+			goto err_dmx1_release;
 
 		dvb_net_init(&av7110->dvb_adapter, &av7110->dvb_net1, &dvbdemux1->dmx);
 		pr_info("additional demux1 for budget-patch registered\n");
 	}
 	return 0;
 
+err_dmx1_release:
+	dvb_dmx_release(&av7110->demux1);
 err_unregister:
 	dvb_net_release(&av7110->dvb_net);
 	dvb_unregister_device(av7110->osd_dev);
@@ -1351,6 +1357,7 @@ static int av7110_register(struct av7110 *av7110)
 	av7110_av_unregister(av7110);
 err_dmxdev_release:
 	dvb_dmxdev_release(&av7110->dmxdev);
+err_dmx_release:
 	dvb_dmx_release(&av7110->demux);
 err_registered:
 	av7110->registered = 0;
-- 
2.56.0


