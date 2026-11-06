Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981961;
	b=dDZFcGIZeihF5dTbaZDdBHagUlb8F4iCqvDDu0/BZA5kotQvlX99tay0EcPTisVsFEWd
	 zcAPi9kCMn0r7uL/L6seCyVWeeXv7pJlVyI6hpf9RRbzpSzx9DJKGvmDsK8a0uAikFtgX
	 0QPJHvj1UsH/rzSenNWrkod8yNkBnNi16ksciuK7dcUz1J9NZdtpVhZpZkKiIwLY6xiOF
	 7CmKQUViPlyRyjYjMGLYtkEICvUF33FkueukU4Lto1wZcpPJvxYS4KTAlbc2HfNUKH6Hk
	 6bzG2wceMc0pzdmX/zrBnWLnAdvqYEzRxeVEazDMMArleP0Uvcm/UDhwRTupZ8O5aUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=CYOEBlSzjiPUr5JKQOPlK+PrClJPxeKqIMuVIHvCOrHhTphTp1ViMUo6v0t4TOgT/P04
	 DkmZYxRjU34HN4/GYokxWJ+OPag1w9nWAy5ebP7kHMvxHpHPLH5iQnCQ59XSP+HgDxglu
	 d9650Z9nxbf8nMlCH3PiFqXAnIRHnm2w2Wg0at3tYuLk57sNwsUfUeH8APmrhFXEWY/OL
	 zpmsPE6vSkoULIw/n7b4rYhen62zZrslko0tyms42Q5RP35uIF5NoZlpDN7fQJbZ19bKU
	 vrajOdZ/kqihyw2ra8Pk8eFoI4AwQEsNs6a0u55JWNMQ2bR45U8TOiuxhqslPp6vpmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lKBiL5kR;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B6C608361E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B6C608361E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lKBiL5kR
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so1493016c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981961; x=1794586761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=lKBiL5kRm9gtUqJ1h+dHeCxWYpulv4/s2XsUQ2lNdJ7xrrd53veE3fraO6xmIx6SOB
         8Fbtf8ylUzysFcU0b4OY9xgKIdcWV/h3KNox8JSpZ/lLYOrMYYeiXN9wqdh66DK5rXrY
         6khmDRLKI3DAw+jgbwmkRJriI1oYK5AxVLhdA75BHHQpWbVl+Pz/aRXgS6JgAjB3EAgk
         PEMTklcvOXDkcX2Hm10J879LvhYmjhyWAhIyrRKKYoszFtcq7BNA1+SDwtvEmT7zixIS
         sPJibyUJlL1b5kwE1uQtjUqO1ur1JS5IAtRKYIa3kRIXCGAinSQiAa/hT8noUUV0PXVc
         IyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981961; x=1794586761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=cOsp/7rku+LNxOUxeBLb8ht+aSix02uOGurQqg/yLXaJh7KOu6GxlHjZikHB81ucDy
         NEfgAdP7F36JJUDNHPTtQE44jLfhA6zNH1QbN/PAkxzfw9VsVPt7H1BeL92/B96BUwY4
         v0CRAiY9wy0VDehHySBoGWddq6SlG0HIJ3Z/ue3PGtUuwHr7HKCbbNL8qc0l7P6bJM15
         pqMo96NFpt3/tZfy/9X1Y8GtsfNyXQYEuIQlw7Qeuc8hY8dQLAuwo9+FtY0gmLLAbZ0j
         PdCJ5vJLCnRuLtfJqt5tFSDlLrFnFr7wA8LjJU5VmwaFho6LzOIQDI/TQFMFnIW2km1g
         9i5w==
X-Forwarded-Encrypted: i=1; AKwUvBxnC5xHg619Reicrnav1N/6mdCMaUlVbfcSpfZjNd7wjIDuU7JxUn/5MxeLvYxsNi9zetSa7903mWZlbhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z949wyC6JpARDiS+kVP/RHoiyPmdZ4lubWN+YH6PSqe2yvzrSZ6
	anTriMz1BlgLJ8iWQ370lpavur62bp/G/RzZQXRZ28k7pjKGuqnPRgHfGynVMvS8
X-Gm-Gg: AYBFou2zo1NMpUieAa3imgzTd9UpmBQAw6Y5GOVeoQs3gS0r7xuHqezLxsV+xwKmMsc
	4g5/iFq/zcYnyRquVJ+Bp18j7URrLvwGnh3IaY2jF6hWu2VxOiYrOpKL/J1z5cANkMS7ET/VQnD
	1r0b2Qa7txPGuM/yDGYVtGIQsW3gmXYd6lY+4L1jqZFU84XSGbXIBAWHMUNvPM5Z5lbq7+2KqWP
	PsKsjuCUZYsus8t+aN5zArlacWe5H4pbuYlt3JJujlP9r/rZ6Pa6lhqVrmDxMZ4Sp44xvEVbOyE
	6VYOhSsiPD93gYvjhXZbxn0TIPorE7BR7OoOlmc4NxE/48TxfOH5a/nb/di7KPi5Cl28bwAWPLY
	QtRlRHRE9R7Yp5z/JCWb6tkfjALnxT7AB60r665+2+n3j1pDIobjKNxMTrcuWI/4ldszMedsBva
	7tqyoqume8fU8V3bU29/hxmZdgd9gOhR1XRIKUAFB+64cfYg0/ww2m/mqSICcJFiDp3djM/LoTy
	glnE31C2au9TqtzAldmhShF3wH48wYb+F2YbNvi3h7A4LGporq66RVwZkB6yj5uYWSrOxb1rBMQ
	vYY0H6VHtZCtT02JsZjea9tmnJwR1ui+AqVxKHl+2vhr2fZwNp1Gq2qY1hhbqLWK9gSxZZKDLbb
	RzWIFbWV/ikf7PcA7irZMIl7RB2bIZTd/hhzsfMoxfgi9ag==
X-Received: by 2002:a05:701b:2719:b0:136:b50c:c0e9 with SMTP id a92af1059eb24-1b25d309c43mr3587753c88.21.1793981960370;
        Fri, 06 Nov 2026 08:19:20 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:19 -0800 (PST)
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
Subject: [PATCH v19 11/12] ALSA: virtio: prioritize staged capture period work
Date: Sat,  7 Nov 2026 01:18:37 +0900
Message-ID: <20261106161838.94308-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
 
