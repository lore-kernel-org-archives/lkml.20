Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201424;
	b=wkztReBbso5j6S1bk6AChk1RIrnGnvPLgU9lYj8HNojbaknuvKIS2UdKGiVr/vw/6GfT
	 WPLNBh1OIk4f2Kn5NC4PKsQqLY69lhD04kbrSbaIYXVo+Z7mxATN4psMq1Kq1WFBJ1/U/
	 5l0HTQeDrj2+/ZBlN5aIL8kSQG9zB7ZBrQrpBly08+TRpdVlX6rQRNVx250oUgD+hnjs9
	 k/61UM13ZIy4+KFprLmayLBcAb2X6DktYrUpBuHJhdeHEz4T9MWpD28Zn+F3zymh0OAl9
	 wUlUXp+aULmfsstqUDYWvM6Pz/UaVOC6uMYKAj1VoUGaD24N2p24Ejoxljf3HGcYq4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
	b=5bZk9pBOIFUN1vxRXo+Ucl7U9b0yRxpc8/lu2cqLOOziI6qCGfjBOHWlPAFrslWbX7ja
	 Nu0Eib5+6txI+N5FDSJB+FbQkwLeoIbbxiPI99nXS6mJjNuqrkzDWkKueIf46RY5Z4ZP7
	 Roez7rG23dMAMXMGjVtSva67zxeeZy2QWDZV4YlFvtBCVBCBsNkPGHeL8WMzmFKFIzJ6f
	 ixcxouYwStzMLEPlxnEChwRLlwzbOTuJ1H+SOQkWi0x+b3t5WXSYo0YUZ1TQyOuCyBzpH
	 4yCogyO0KI2lKRCx3MjXEO2nx16nTyiKOrlCNAo/L1vdOQO/LwdyX/q/2OCkQOCulcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vun2rtUx;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D74606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D74606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vun2rtUx
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1aefd1bf74aso390114c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201423; x=1794806223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=Vun2rtUx+CEwInyc92H3Nuh5Z1WVo5bDXABFoh/Dwa4onkkyKBoI4LCH+6wc4J5FtG
         djwFvQaHM/I6+yCYaeIr2f+8Be1i81Ztl5UcvsMnH95QbN5DWW+iSyzwWXx558Hepmhi
         GGlP65PB3FNP82P55DkSjrr51hiWFtaD0JsWWZC1vU7PkLcs3hzwfaEhXYpfFCbxpEaF
         ogPVk7YBpjQ032nA3wOp+ggfkATSKLhsWhDUf7Lp5GMnmmumAZKmWapGn54f+lm9Nbrk
         A4av9NDSr/PsMytwuyxwAOVCYYyAtEPIOAZO1iLnayPm/xYOtJC/qbsfXVSlk12JYQ5O
         iiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201423; x=1794806223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=AMSK+FxmTRJoc9u01XOiIuDl0hgY8sMXK0oAs/46+ovAwgsjxScFp/+oFNxQLyCerY
         UIvKLMIyvRkETxIGO0RzOjbst2rX9zsocGOmN/atusjMKxHhcHbYdY/9lraU6uOcCzCw
         42k04N1me5bfUkb6bKCPtM1ALTuh8YvIt8Kex8nTs1glV8e4FI4Pve7spcIfLhV5Pxoe
         +Ev2Zwnz5YTKmZhDzZr51CvFUMn0eJTqNBphruOA1B9DlUuMGT859D9573TM/ICoiMNX
         gUxCqhDJCl/t8zx0q9SVsWxX9Ua8bxldtinHWsPeehNfq2d93Awoud9ZG/8w1O/CRNzs
         BWKQ==
X-Forwarded-Encrypted: i=1; AL+hErHzqkyOTgV6ece739n7lvlXmkCJJHOZaO3JtLmKy5V9EPzwIalK9vrjjPXIdQAaUFnavPcHabSvxH3uQZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xudeyrYJ1CVHlw3/Z0bpkGRMX45fni99p8E/tVLpywU6fvbuF
	EYZwb6f4JUTkO7aw/AmQcte1ZYqJyv2OpbIRHVHJmJUYt9EsyEnjOevQ
X-Gm-Gg: AYBFou1ZiXWhdCpcBn2xu6lOJm6n13uAYF7OnfVyYM/ahryzL1mNvP15/aTQ5HHKi5i
	4v8Swj3f0MN3u1UMkV/m8j67Tk7oQ6ZtGU0xH2Veyd0QhjWyHUUZDJ6x+vLa5LuBMkGb+/9/MzN
	TqDF9y9fFAEzn0gvFynbf4QZI9mZxCuLOMBGb3ZYhCQF2Bbz4+nw3coN8JY8/UaJnFwXS/dXvty
	4U0YhzYTQXZDvUbqgmvSpai1U1zJdU4Y8sPFcfBdvab4CFnTnVmvY0o/keRaO5fSwHxnB0Adzi3
	kjtgN+Gemb7GM3LZ4s/U2bYEZQfNydajiF/1UYdNIsw7Y9SwqcwnkrNNef7Bug71FeWq9bIhWNf
	tdcfUTSTD5Q2BmKfrnVY8BYqeiuc0v/G7vOCWbZKW+gFCBHtjvfqs3OjJM4gmQoIm+8OPkT8C7d
	wFk1k3vx3/af1heekhnUzcHU1yY/Go9JfBSnxEdXkkTZVMVgQfLkBT1+P9DCySLqAs8ycUEmARl
	Yyr1pRdBmrYFjehSW8HwSD46SIc4quTbNvcrwJhLykTrjDVkzdKMR+uzhHz6luBdfkCA+bGI2AS
	R+PXwGjyBLxRUAQD4Xi/jPtpgcs3P9HILPr08JeQ6haeV0VThc/2d7t6OIHaEodsvVZPzD3mmLA
	sDwcdSIAkgpXMnf/gcN9dnwwv5WRGwnAbywxWSz0oR7FhGcs=
X-Received: by 2002:a05:701b:4244:20b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1b39fece05cmr4832119c88.19.1794201422928;
        Sun, 08 Nov 2026 21:17:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:17:02 -0800 (PST)
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
Subject: [PATCH v22 12/13] ALSA: virtio: prioritize staged capture period work
Date: Mon,  9 Nov 2026 14:16:17 +0900
Message-ID: <20261109051618.22506-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
