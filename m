Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349497;
	b=i3bx/JqbZb07Q9Wsxo4V1FqrcMLgXDHXob31ZjkUxDYjoKfCqQfbb+MPNKt+Fu7CcSD2
	 FfLciRHEk852A3gNHUJWtBPo7D2nJxqnyj7TUln7qEuRGzR0t2J0lrDsOM/Mj8nQLmvKj
	 cBt7Rhv5NYegpMFUm61S8S2Rl13xAOn/rh3WdSXiIq4N+2N6yKhzvZHcJF+DMKTntNG5d
	 ISJnaJtaxamKrzBGIQE8dcnl75A1zI5LUzmwrBdFna6qEHPztzQFs7/Eck1sscOiAzbol
	 RjcjwslqpFIs8ckJvExw+d3gWBAGG1lu/LOGSXjpwJ1cYy2PJ2SY+/ZH2OGcRNEi0yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349497;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L4YbgbPAe+FGPn8GCTGk5ZnAVwhjkVIrfVtDvzogHW8=;
	b=lN0FAwzTZsdZCpgNgpMBKAopG5uggfrCploFo4q9NOvu1v3I77cdBQsM6n1eOkQwQf8v
	 m1wsBvXm3mqNVDa78LqDFmvXLADam9b6xiWLA5iM+6MxHs8bbVIPOfUht+NudPgZh53iY
	 wknNxa1hMI2g6G4xQAvv6mHEweZU+ZMwQV+FU4Qk7H3D2pVUhozRblqCCR6qCf12GVxvD
	 XGLjkYYk5KQroS+FoAhqSlXfjbkI4Xhy4xRpUSjQvhosDZ0RQevP/NbKdWnM9N2tRNyK/
	 8zklVXPVnMsWJhR3c7RLQB5eKvjIg/RvuE2BBveoMT6lpFBTubYan33FkXJ+haQe4/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PsBg8u8s;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0DB606A330;
	Fri, 30 Oct 2026 08:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF0DB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PsBg8u8s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PsBg8u8sWJIcN5izkL4AEKIdA3/ccU2KyHe6crzrBLhF1ywkoGRjUALPkuVVsZFLN+YcKx5ATxKRA
	 Pt13nIzsYHu7juaOcJfItLe5YJB2Gv5aBbfGeP5a5YibF1EjvMwhynphS+uSGhS9Jl8LgpZxo3aSHj
	 4C/MkLsUmh+sebyk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36ae45775516-3f4b5;
	Fri, 30 Oct 2026 16:38:13 +0800 (CST)
X-RM-TRANSID:2ee36ae45775516-3f4b5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36ae45773be2-53d9b;
	Fri, 30 Oct 2026 16:38:13 +0800 (CST)
X-RM-TRANSID:2ee36ae45773be2-53d9b
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] ASoC: mmp-sspa: Fix runtime PM refcount leak in mmp_sspa_open()
Date: Fri, 30 Oct 2026 16:38:10 +0800
Message-ID: <20261030083810.1597-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

mmp_sspa_open() calls pm_runtime_get_sync() to power up the device,
but when the port is found to be in use it returns -EBUSY without the
matching pm_runtime_put_sync().

The ASoC core only invokes the component close() callback (which would
drop the reference) for streams whose open() succeeded, so every
rejected open leaves the runtime PM usage counter incremented and the
device can never runtime suspend afterwards.

Drop the reference on the error path, and also check the return value
of pm_runtime_get_sync() as the ASoC core itself does.

Fixes: 7d98cc648253 ("ASoC: mmp-sspa: Add support for the runtime power management")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 sound/soc/pxa/mmp-sspa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index f9066fbdd..eee15a6cf 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -421,14 +421,20 @@ static int mmp_sspa_open(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream)
 {
 	struct sspa_priv *sspa = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	pm_runtime_get_sync(component->dev);
+	ret = pm_runtime_get_sync(component->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(component->dev);
+		return ret;
+	}
 
 	/* we can only change the settings if the port is not in use */
 	if ((__raw_readl(sspa->tx_base + SSPA_SP) & SSPA_SP_S_EN) ||
 	    (__raw_readl(sspa->rx_base + SSPA_SP) & SSPA_SP_S_EN)) {
 		dev_err(component->dev,
 			"can't change hardware dai format: stream is in use\n");
+		pm_runtime_put_sync(component->dev);
 		return -EBUSY;
 	}
 


