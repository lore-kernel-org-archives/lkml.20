Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013739;
	b=wusuefz6Wc3lZzZQbPIAUki2xvFQywh8B9NeiIKjjwK4pwG3lDWw0L3wEC1G1M8mzzIP
	 A6OZG40fRYS6sfOxaOyOQr31chaOfKHKLrChOpXh8V+utD5hbw5qyKkec++6OUlBsT4c7
	 3Sn8BJmzBZMoo6sde35mlHkKJ1N/w2D8woNFCscfUbkrlPKBRythHbHll0WwBzG7TPYuY
	 Vydg2tDBw67d0sLsfTGFMpR4Haa1MoGdJ2CCGbL6sjMQWJX7MSec6o4riOcNRu2g48Y4E
	 knZdha9NUbRnKJjfBI/EXXKQ6OkRA5OV+V03NcSRhb6NiWuKTH40c3r+N8o+5tRFDIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s4qQ/bFBK5eaOJIStGYxhCTOPxN89dq+twzU6uM3Z7c=;
	b=O4b683dbXJmS693/uaVUqjURIzX3gyRSgWLENGfihZoLwd8+Wr+vSKJ5Td1AypbkpdB/
	 LbOQHRAtQJk6vzp0xQvlTRa3pRRai/CevidA2ujQzbBCkuTsEknrJUCnCwKLry2umb05z
	 4e8oImfoPTH59ummEaMKF3pDpw7uP5nIjBQlJrDWPCyZAlBvqMM9DiRN7i1/JLukrqLP3
	 g0A/PvB+bCYiS3b5gcWagiP+L5GeNOTiOK7VisdzI8dyI8ZNr/+CxO/RBGY1Ek/NAzwYW
	 EJXJgR1MVSGzhO2kOyJ8IwI2vAVciFz3Xt04VQ+Z3Pnt3yu4JTThXrYsX5EhAAMaT2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MoyEVzA4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6966960A2614
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6966960A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MoyEVzA4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so5332615e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013738; x=1793618538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4qQ/bFBK5eaOJIStGYxhCTOPxN89dq+twzU6uM3Z7c=;
        b=MoyEVzA4BlfgrZmr/+xem5km/GDXPU4lmttZ/MbD1CCdRKwUQ6cUTdkFM0JJwIuQ/e
         fi0dECa5qaYr58c1v9ebxC9HUXtLgrX9gQOGOBgJm6IO71s1GRREbVuNEZloj8HoDj4F
         5fseC0ckMgoARaJfjYociSVZpwAz2kxIhT0p7S+trrjPbS8kEpjGDWZ/VBBSRfoZLb01
         AgXRmYO7JGaZG5xy0jfV2rH39aRBLq6j/vcV9ETaGxTafXEp2uOjE5hCURUPJC1iQci3
         0aPlWA3zqm3+o4Rz3MlCyMzmPnJ9SB31zbDKIy+UPqW4rlpuNWlXTqCssRoa+uHeIb3r
         jJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013738; x=1793618538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4qQ/bFBK5eaOJIStGYxhCTOPxN89dq+twzU6uM3Z7c=;
        b=R7p0PtY9z1Wap2FKOchvTvJ5JCTwnP2trhiv+UdTpnnL9hdBr+BI0j+2f84KP8vGMQ
         E6ARE9lVfrJjRGQn9V94mvMAYUC3v8/oE4U4xCnl3hHxsPSn8Ffz/VW8tTpQE/6CYZHa
         2bSWTwZ9yisWjv7AaRHwzZ3DC/WfVMhKLXZcSLJEsCTD3BEt6QUGQxkNfs2XSzu5VZOb
         hQLq7RmBIWsansP/ZPZQvORlysgiYBS9vGoDjYpLzA0CRVF8H4N01z1iBqm8LzK1wX+G
         S6vgdoC0gofuddOe7lGn6ueFDY+Nq6gtd0XsQuUIKMlj17CtuJcuk/iIzFMndCVU7F0s
         HWLw==
X-Forwarded-Encrypted: i=1; AKwUvBx8TbnOFEPg4mvzJVIZLwA35hF4uU1TZMq98NyqJ5qTxpxY6Q5KLNcXjd5MOXpOWw0dxqx3dps187mUrow=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfT+Tgvpx2WedX+BpVtJD0cGsUcFwbBuTFBSVpJjIEdO62QRyE
	QiymoI+u2iqlOJnUpP9+g6b9BPLUOC6JCRccWy1KtDKjOUqNB2mpioE=
X-Gm-Gg: AYBFou3UrM5EcWRKjjTduLNjxE2Z+X3E1gds/oaUqPi/nJfX3jcaqJH6YaVXe1aLaU1
	OXoE5nEtwy7LfQJlhDmt5sn0A411Mw5JrWq6xF8e4h8DivLA4JGNKStpVRtO64j8ZuzyUOMZKbE
	7FS14CybfVIcjvMTF6327Cu3WrVFlML/HthSX85k42pjHiqFC4JOTORdESw9GsWzMFEtykEndYs
	N0xO38iBEHZUCTOY+bziGQwBFcUny5UAGIlDBTYI0ad64aQp2EyxlXVN6ooPHapWErcHpgJcua2
	71oba9eF47dRUl2//zRAktQGN6AZGjxkNCp7m6VLVtDusxJ7M400WLw5YcM2HZmGs+I1a4jrCKu
	VlGRdDmOxOnKjO7opaOLBLSRJmY8F5/Png0u+q0PgMWhIpJNKP7btkzCNLb5edWj37l6GEVdR9V
	UGmKnDHws+OIyZrtP5i746kuPIJk02XvhwFXxYC2IKea12rwqQlcw+TUjK7DCjXDIjkdtuF00xx
	jcSLolxpyHFVuLY7YtBcj80tfdjwnMk/oT0l0DTSTwohg==
X-Received: by 2002:a05:600c:4f05:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a35ae71b30mr134739435e9.5.1793013737744;
        Mon, 26 Oct 2026 04:22:17 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:17 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 3/4] ASoC: twl6040: cancel headset jack work on component remove
Date: Mon, 26 Oct 2026 11:22:11 +0000
Message-ID: <20261026112212.2519775-4-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112212.2519775-1-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

twl6040_remove() frees the plug detect IRQ but does not cancel the
delayed work that the IRQ handler schedules.  If the work is still
pending after free_irq() returns, it fires on freed memory.

Add cancel_delayed_work_sync() after free_irq() to drain any residual
work.  The IRQ is freed first to stop the producer, then the work is
drained.

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f9615fb..826bde1a9ba46 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1136,6 +1136,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	free_irq(priv->plug_irq, component);
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
-- 
2.47.3

