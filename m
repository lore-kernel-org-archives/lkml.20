Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458168;
	b=h7shEBFLiOCqJfM2hNONVT445mppChOgIhN3IfvnyGy1QmxQ7w4O4onRmOXZQjqRWh5e
	 Atr41oEEpJyD30sVMeElPzi3yqyzv8eGzrut65/SlotzILg9+cRhvWEwUeCEZzEp9gFJM
	 FbH8Q4CCqMOIFUCpyLtW9QMN3I8GWFndN5sycT1ns35tKQFE8EWegjJFlHVKh+Ti7lNo+
	 yOOc2JWm3YtBQ+bZQIqkj2gxx2/+XoMhwKUdIqeT/Bmlkbf7+rVPJwLJBQhmRTbasItXq
	 08lsZf89TzXp/5bC9voHUVb0G0MLyv1+ZLMVQF5BLu8doW/2qqx6ZBBncS4rSMrdmBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=w2vETTPbI6hG1JlZE6fFKEz9joqff3P2pkX9Z8X4CbEYvtitZscv8Vu69w1Y+5gNFaUY
	 J4nf59wDGNIXSBtXrHcc6d6uVesVsxIL8EhsyQcdfvaRRcBsvtVo7HuUgnHYfm4OchZOQ
	 T3jaaYFyVnLjWz37F6Wd4S4LqRDtgL+m/kx9eC3CdsjK8tqUmHWKIniv9J2CJejokYS+K
	 HKiFRSu5PyLmQ/rDcbh6ARthgXpJPan9nAs35++3q6CTTOhwcaMhxbW8N53ic8QRehtqH
	 qZTmkGenhCXG2Uod2cvh4F49Qc8jZo4HbkMTb+GAZu2gfGMsT94hLkkthOn/Rvux5cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj1OkUdt;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F960A5BFD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7F960A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj1OkUdt
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so3017085a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458167; x=1795062967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=Rj1OkUdtmbxGEVuEwq3gv1vxTpCakSmGThRFYjHRytKFYrE87uT05b5Ts+d5PMxEEE
         0NHFjqH681W2ACMe50OI6nvf0QDDgwVDeqFplhLZIFL1EldDU+TP9Sr9tdWPfu6G3Xj4
         a5pFxBIqg8jD+TRXi/Kil0qBj0BOQ1kU9JxjbYOuuDzoAY121UtZ7AsOKRMf/EzCzlo1
         UlEbZxJagD/5fxQ87QB1yFhk+GBi+JipQZ7QleLsf+WQcg2D0QGVnrdHKigu2ekxrOe6
         GDYcnlXJcyFw/9aB9/F4ZYNFkMApFNCJR2Loqb1grYZY+ids78ShmfH3CSdDhx9bn9e5
         A6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458167; x=1795062967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=uMruQI/yYE/UElyfIkJW1++0osOr+g0HyXlgBPOCKPy21lbjVHZMkVHfj63ddpqGfV
         hUYTlC2rt6K9O4WpdR2k1rwIXu+O7ZYIAODT9bjneRNAz5cDsEuH4hiFmYW1gNFQDYkH
         t53Phku6BXmImcjX9tvS+ei1hKddAoxUygoHKkyHpOy6cp0zdYsyLaRjzMc+u+ubwQbX
         0kfvp+KOeHGwh2rN9EkWmciY5bgDMX3fYYTv/CJMpAJgtKv7LdcTrGiRnjNj9SFG6a/a
         uZKGiMv60ulyeGJd2wVasuwoW+pIYjUOuUljuS2nVjiOEOkJH3tQVp2wz8878v/Zl+Gs
         4Okw==
X-Forwarded-Encrypted: i=1; AL+hErHlCnsFvFu4fZ6aZLQ3I+qTHZupnTT3MBcWch8wosdZThQyiYdEAX6ci9jYjaGNUjvOkwzEq13jXQI/BFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dDcATi+wxEKGhy/hWw1f4rHfOI6Xl3pyUIlXAdMe55RTHr4dM
	xvA//AYTSrm0QcgDOnIhXl8MaKwTSZc/kHZYeYF+a9sufaMd+afV/EGc
X-Gm-Gg: AYBFou1934y24PZyNUa/A/ZkTmb+utjMFBCsW7x531fCYuooVDINUFGs8d1syX+cgb3
	edl9CT3rb1h7eh5q2RfrfUiX72I0uLswe1xmCEfB1qucl2Cb/wF+WSxkpxeAPpoYGOJa62R1rcL
	1HS5JkAkW6iUIN4lnEluKgbJ3QzamxDEGLTleV/y5M8DphKp4okUzRxLAzKIpz0LVWq4Z8YfwZz
	hUYKmnh4B4Sjst/q0ZR5gKokTM6bg1gzcgIPMrBntfXzGRUDj8ksfxc2Us34pgFmdLHTS4vt4LT
	1l9hXqGnnTbD3uO1ogVy905ypsddzfQAl+EdLQ2mK6NCDjft4FM1aMLH8/0h4v/9J4oibbdvcJS
	hepv75m5GTY8a/2U0N4+/zM0v6TCr+q7dkFXcwSPn77U0isFyYRCd/t67ba88uXpKDksrBl0HTE
	TCy7EgOepLtOv7meWO79cNPqY/ZR8QWyWk9L7JAN7xZfrT7jSigdDsu2Rh5Q/DlNU9Yf/DCYJS3
	SnkGKls/NnonGN39vyO9m42wKcfRM8LfXuf1CGltGOsst+IazCAzQuSmAAf4wA9RJnjER420yZp
	d4Tu5xFnoCMjlMLG2QQAPMaOho6mJnXQPyZFwLdgOmOZ4q6eybWUT1br2pPERqOmoNvqNzGWxtv
	6qFQlaISSatYd+q9FjKFReekzOTWMdw7z2e2/riQu1pAtRjs=
X-Received: by 2002:a17:90b:3b8c:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b182ee6991mr4517896a91.45.1794458167001;
        Wed, 11 Nov 2026 20:36:07 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:06 -0800 (PST)
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
Subject: [PATCH v28 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 13:35:12 +0900
Message-ID: <20261112043516.37010-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
 
