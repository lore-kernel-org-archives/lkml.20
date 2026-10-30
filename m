Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338030;
	b=eu9y6sGaCDv+XhAe+GBNZmhEb7dy6JN658Td79OEdOAsDE5OVE8a6UsyikCBmbHeO90o
	 T5d6cpQzoExzKBcjI6g+dtOLZ7w71d8A8cp0y5fXImKAy7jRTV2YipBACeGIhF1/od5ji
	 wlnq1yS1mnldomrl3yxoJJDyxNTio5y9R6hi2PsqBTWRYd+yYyCrauCQc2NK9lH7RY+v5
	 +54JTF2864jL1VHxFMUFG0cnSF49TjHOtvRoa2GfdvqzvZE7+W1ddd8OgyfUHTMhgQx4r
	 TUCG4NZoAHD7m6LQqyuMO0+Y6gnPNkZzjYCSzhtBeGGuDE4fUpYXvMaXwgkUmmUFzYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
	b=e4yNhjqydNl2rUlU8SsLx1+uy6kFe2zPadE2jLn+ubi2/iylDsHSqfdONqVtVtLDhQrN
	 YnNT8KNmZtx2aAUWmNl8XSvLmbW+gALmOMbYlxotgqBHkccuLcM8/ynPoamFh/Lywe+b0
	 51zs9nQ5cjsoI+T4CIMdRmiNiZ7u2XBdSZ74561bVJVK+jurhige4o4LhdHie0lh+3m5q
	 6jzpE0XhXuDUBSuHjBnHuv28vuANaEHENkK/+mvh+TfS/IJsTHdKig72B8M2T54o5CVvq
	 w0l0M64GePfZXBJakR/q6pVqGSokigwdnOqU2XP8dOtceKr75ySHHLjBjCk+xknXNDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLvzlVs6;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E274B606A330
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E274B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLvzlVs6
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so190194a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338029; x=1793942829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=QLvzlVs6hP0Up4p+b1uHdE/0OZ75yhCf3T3UuEsBrDPr095qMJQ0bX5rMO2IZt5ODL
         NEcMCJDKSNILAzntGoX7GInybOmFblYr9Vk0bWLxPLw8lwoAq/rmZxy0e5+4LYlTh3t/
         x24l9g4gadtmUiColcLZJErwDx4v21AWfc6KOewjcb4ZhI135rT8II8Ay+bcPv7sn5wI
         CyY0dOyWAlzcZoMJMRNV681+SDH50JfXwDgmUebcLg6gWuXT0sY+dUYt9ietWBw8NyB8
         1IvKL3BNJl8tyZNyNla4iu+lPGDqV/HgtE/8u7jHNAy5Q2FS491lCYRhkvVPVofBOayP
         /m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338029; x=1793942829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=khslNqu3ajBEDb/DZRDVJqBgKVMKVTLK02Z4xa+6C9yaKvP5gWrsm9vXVXIvBgYi+m
         6G0tDkV6DMl2T8IO2AWXwnTrqpy7KDx0nIXef27z4RHSA2Fm8RTBQA2kfUUMMmQV+DjP
         jENovL1ySOgujGEyDI6Kj626q1cvXFeu5+TpMJsfCi6lbWJHKklFb/irz8WAK7zQzXDT
         7ahETkX9M4rMVj8vcvD2eZh20mOzMI5zscnxsiO+Cqwdy6Ro89UN6ToDxeW/a7+raAu/
         JChnlOnaabOjiGK0tEgNZT/wCRXPI9WL5yr3EG7FfcU66qkDFq8ohjX7nC4g0b3Cqa1T
         EQew==
X-Forwarded-Encrypted: i=1; AKwUvBwr29Ez+6nt7nHvnPFcJbhuEgkCZaRz8v7ctlGFSdJUEcImdV8ryQwsHu6YyKSQTO/Yg9sWCnt39GgKayg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAh7ylF1uO4JC4rPHZykR54GSC076D1LnTH/zIgM4xXyO85xGc
	bO333lTD4OQtuIpjyO+gLgm0zAeKnNp60ClWotdNPNOnteqr6T3NQFsT
X-Gm-Gg: AYBFou0W/jce6HFXQLyd5Gf424UbPIsWDtqNLLzqxf4+tOhhFsCaxfQKWjSAZwdNy41
	u5Xmee/iGaF/TS6R9dcxMs7VrhXBuXgt1KG8ZDicOlIOXFEkKmSRvpK/Fh9Nc4nMbVlfk4F7H2d
	RCg1IKMTS+IV6fLVlwyWvCPqZLCgkk+2ZM2AafIgVRf+p4+h067UFpWWoN6gu4mGUpTtxAJj/Fe
	7CCUj3FhdVx5UkWzIsfdg1R0lSqCh1UlFWdWcWfUkUq24zDA766YPChjCKtzVvMmnZAMXu82w6j
	b6IpW3d5qbTQsGjVU5JaLbiBypfZju56l72r2ni1VKnNC82bbgQ00Up2EF40YCSV7sZDKSUUvyj
	L8Kret8tcdI+kWnZkqIe6YzmGUnmdsRV24zxRTUZ99Qy8WrPRXCHdgMvgO13ExkCMSP3xrWyzJ8
	hgLwVZ9o9nIPbCMy2hpVWUg34olMQx58+SJaDy1fBp0KdyBxO0GPw0U+fyPW8XdVCRzhM8t9rzG
	n3SH1C1yW57Fbot3r8QRKKjUf2BSfMSqMcXlh2mQ3KsYzdK4JMq53wjTJYgz5ZHYWtJSIExTs82
	36WOOqn7gsh3BS0Aw/Qm7ugUj3/eLcMQ3+orn88fSvATCuFqmKmdC66LsyWH7lgPZ1EbDXcW9FG
	e9CRn9o5JlTII0rSXgAzPqNbJAPuz7EuklPQX+4okUtZRwHI=
X-Received: by 2002:a17:90b:5827:b0:3ac:17c:6e74 with SMTP id 98e67ed59e1d1-3ae897c212emr943776a91.53.1793338029049;
        Thu, 29 Oct 2026 22:27:09 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:08 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v10 10/14] ALSA: virtio: prioritize staged capture period work
Date: Fri, 30 Oct 2026 14:26:25 +0900
Message-ID: <20261030052629.27742-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -159,6 +159,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
