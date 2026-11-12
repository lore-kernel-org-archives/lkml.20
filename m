Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466225;
	b=lAtutEcZL+09fMR4q1BJrCMZ33v8Httv9vup5m2YVx+ZB2bxdLTTTpHKbvj/WP7523LO
	 cYByyh+lexWXpzbhqdWFq2z4lCtnhtr94dxRhnZH31f4luOKHBm9S8K2g+cJhRbE1QcRB
	 8ureSwKn5LtQXJzaUZK10sZw4aulil+cu1ta12+uwrhOIn5Py4TS0/eK380BXIyE4Rwfc
	 x8IwJOTHYhHSXbAWvyxlOulvIiVR3sL5vagNEEhQ2SbUeqMVtvy6V5REwD9e7Qx4li/IM
	 kVoqziLCuJWo7WXAkFF04AIDXHuPHvBHvY/tvlfxoAigF5oG/sycE/9U+b2fVP4Pzbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=N2FwM4942HjBxzEM5zx34szVlXsIPyADPCzWKL4sa0G7o605jkD7wVcrWPjK9ePjh8HO
	 hC7UFMhwXsYwNZ8RrZJGRMZLczApmGTBNbwSDOxS4qzQ00wPUjhUOLwrobHKpTTp4o9GZ
	 UWirjlB28RX2KahMOpqfdYVWvqZ6Ej00A3cN8BLPAMapWAfkU9J5B62N+GGBUX66cOIrO
	 CzB61MbYsK929YQ15SfrZc1XxQAfzHl/tsOad60h6ooM1GNIpl8EYxcPaxI+yGP5Ljv+m
	 sFiGAkc3QG6r02FqFa+FCuoIQMRAG2nsBdXkhOaFpCl8eSAodXbMDBiVdPmD14qgDgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFv78Z+k;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3F60A2605
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E3F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFv78Z+k
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1968615b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466224; x=1795071024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=lFv78Z+kgkepJBxfjk8Ae6P8qUJ+/yJr49VR3IOLefzWRcStJUMFXO2CcYYj7oKM/y
         NJtvkrSiIy76iiAt7g+ZCLRxgeFe6S/N35VAVoulLWIJ4vfAW8v4uNtyze2FLVlrSM+D
         1G0BRa6rICDOnQwhzRizWZri0/A0BklRRMUWddg1fpbE69sPjcC9gJaCamz8Lj0k+5zN
         5NZpV+B0Rhsd72ZS588Cqh4ylsH8EZGeO3bC8HoN12nwq4o9FSBgCP+xEOD2xe8bfzNC
         xHwIOZhchpU1vuQIRu70Q1oVSajxw3H86P/h8HDrF6169i+1kkOPt581WaXSyLpRjTPP
         pd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466224; x=1795071024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=e4yEh3d7vGCL4SP5GSCcgG5me8jfUy7CFpfTwlXxq3ApHhyCZQKZlcNxvwPON6frb5
         5hYIUT8QJ0z37RYCYWLwlTiJCL2/26wc2S3rX8uQtgdEqsRLuRlE9A7nxeI01QbPI3qf
         uIeRyZZ72HtQwjQCE/dv4bAkRveGqiA+Sj0mkz2ESLNE9gpIOFC+Vmuf/7R1QxAoCXTC
         AlNHfqP6hFvz5rE7CHwVG+ltegRdqpPvatgP2Mdeep6soYM5dxnm2iGljSldIWJ7oTMI
         8dDQTJ5yAzHM8RL9pO4OigpqjD1g//B02Ghf9oe6vUKxvdjPdNmlGshbfik+LTyJQDCZ
         xmRA==
X-Forwarded-Encrypted: i=1; AL+hErHdhBPrWVC5w3rRUPAtN99Om/I44muTLFJ8u4rpMoVIPl/TWaJALajnIAkvFx+o6oZoo+Phf806BHf3CC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z//3nAqkY8nD2DtP86kt4Pbmck2PzhPdHjs//oMiFSGb4fxkFDA
	89JOPaqV8KQuX4IFPvSMmmlCxJ8KYWVkfYPUmex+Re7JVUDXVfXcQYjM
X-Gm-Gg: AYBFou07sruXwiegCRKR1go98FB6Xeb+x+7LNLOcOk6aIYJzGTm5zOZCqzohrlxEiW6
	H4QF9QHpxSJgM8wQo+MFZayMMw0Gijwk0EKtwiRbi5dZwq0bGYdb9u1vNMvTd81Y5rLQQ7xzG4y
	vQl+fM92Wq2U4Nvu0jK+d6DFRsBizfl3Fn3u1zOuwuJ+QpYJWz+N0c6gFpJ2mUDjbJJdoqETHt5
	J6DmRaF+55kb2N5DJpCZiMFWcVjpn3OodwjSt/C5vsZcJ42m4/zdPU+3ANxF7uHRIssDccWx2Sk
	4WGRpnwBtoCUQWaK94u1oEZ+H4l/Ubi+mnB46/JxzECZIVdiKfTXKlUQRy+Ao/sKAZZBmu1U/NS
	x0KgOU4J3F9cVM83zzsSQ742QrdSBpWfUrQRUVs/05sVtjinT1NLLABtIoBEsTqCMpCDHj88Dgu
	Az2kDhW9c8UcTLygHiBgk/4lEva2RckybZzl8fzPtm+UGhvYCIEve+RuTHLm6wYpRgtvkMU9nvf
	akauZxu75Hr2hOJ6w2YhjHxvF3MLfzBU27cTi4agJ+uT63eDlGEzP/VPHxDljqjk41QPjhjFBnn
	XAEhdJV0vuhTjr3P06qW/qpXBqd+A8WcciSed9Vru5cheWQGmlggUmdIsuj/N6JN5EtQ/OGAUdb
	i1XFgQ84dGWBsb3WtbOb/NvSquQXP7/4/cdOg0epOFv2Q6Z8=
X-Received: by 2002:a05:6a00:148f:b0:8b5:94e0:91a2 with SMTP id d2e1a72fcca58-8bc1b6ff204mr5007644b3a.10.1794466224163;
        Wed, 11 Nov 2026 22:50:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:23 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v31 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 15:49:25 +0900
Message-ID: <20261112064929.11211-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
