Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252681;
	b=dglgRJm6QExZ/2s1SaFGb2raMiCEW+IXvYIncakXS0gyhS+uBzy2SJbocd9zVfFu+oAg
	 4Lo/iww09J0HrD6AqiCRGKT+SvUrTgLvs1KGiYET7kuy+RCTBypXQQO12ns3/3M9szQfZ
	 BVJFWNLZDCGsTVvxcGLZz/c6tv7Ruok4MzNBw/BvgagN7djhY5ejRwUiGZSarFfWCkuN3
	 ZJxuKlPNC8a9v9QUEh1m61ndqeLiB6NSr6JjbY+UggTn37RcnRgqM0ug+j8c0MBuHrX1I
	 wCPViYGY7QUpaZcdonrf0JxBYnl6VoCmnjMI8Xz/myAMwzhaoFYneENpvabOENDrYGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
	b=WQRVRvve8ITWg4Eo5fQX++D/5YU/qcui0Khm1LhnfOBcmmXTvZ9qufjFjAX72Ko61rJ8
	 yk6nv16J6wA5xRNdX2ROXn79BHMh5MhLutO72d7JtVDQbdus2lBIy7xx19YhP+q4j4HVa
	 3LozQb5d5w8DMQ7nLTb/kOimNN2S/5mArGwF6jfBhlWClB+FBlS+a69Z2Ka+/ob3nJoXQ
	 J6gYaKXFX5f3V7E2NqI9Vhz0cmCm+po4bswJDXUHTzutNLwSiD0CgcoRMwrVGWwUp4F46
	 B4rAGTlYNaKz/9cus7Ty+7MhgLeVf0Z3n/lY79Xidge7Iqxb1SSXByD6OPZXizLshOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5LmMDWr;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBED606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5LmMDWr
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso191670a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252680; x=1793857480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
        b=m5LmMDWr+lmuQPV0kt4U9ZIwpIoJlXLOh5g8jZKrwbtU120DE8Aq/3Ly2bk9gwfCT8
         B3vtBQ/Jmi92vaT9EYbs6ZoifELrAilDDP97lLN7U6tcrg2hJOAfM4nI2B1cdRZP83Nu
         55jIgfFx4ajlbt2shZ9M4liRCVwwbVXzxvXJvxc+StesB3Mshg6g7LdvTy8vOkfRWQkW
         AbjNzMniweYZckUj1XChiphsWy+1zO6Wzhrr6nIRqGog0VeGlEuEOJqIgxGY/pN7LO8j
         AE21jMY79c7oLQ+fDHw4vBP8CXE/4HAkypSBWsRiAAm9SBMdJa31s5/wOemC6JUa0JnB
         Fygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252680; x=1793857480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/l4dD/5O5m6RU90kbEhUZI1etATEz4+8y2FIjERE5k=;
        b=u9i0A/zcnGd4XucK7xiHH1YRCxUAa0WY9aG65sfKxVZkOW7FgBaNHRBJQcR41jbxEj
         0f+tXn2z11RMA5xkGDSeVHNEw0lnXWXWABgxNn2mTNFnt+k2vJh9c778oxLEVfhd/zR7
         8NKwt5ekGjuJC6Y+CvkgqgZRcbwVUE97KX147rBcn+BMTzJD92zrFyEQaMV/7USurJ+H
         gMm6Lw7c0ilHjd4v+k6wlIWo80D2BUbF0mnQXstRmA86UW49v9tf7ehPhMYJK2NALhjd
         WhzGucYxd0slH9oCA/KIdjB2K0Dg0tz2BHUilLbsN479hfSK+VwDTmUQeidZX9sAKFZF
         7QkQ==
X-Forwarded-Encrypted: i=1; AKwUvByMssYHsowI+gy38DBuGWMWXTKNiZA/QsDfoKMvA8TO40ydmMcckBlDmd7Iiopyo04/+s+dS6RlkhMqX6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqJ55avm6n6KmrQMLDnKf89KUNqKlYzyHcdzgW/4Uw+iHvAkBC
	bGCiCWsBmnfWELBdDJHzOnLgoyOI9gYMsnI/PYWrPFKOtlsFHnNV3Oz2
X-Gm-Gg: AYBFou2PrXd44ajDmzaYSdfiZC+leptFyfZO9vae6ZofJPZLow4KvIxno9AyhD5TH2J
	vQQa1f/XYb/2+CkiCI8AdVOCzcZfgs0W+sFPB5oiSdiK5mrtYDOilTUptwcgFmpyW+Jnsqtha44
	fPGoItRF1I+LfKnV4QmDaWnYWb6j2xZ/kbcV+tS1FL7IAc/Koc5jS2Z9zFTPm+V8bNKAbuljkyp
	b2fEAbN/nMcqSkDIRqijwr9xqN7EnhS5KIG+xmW+QAo9qxHnatbR4XbsCbt0z48/PWxujIwW0b7
	Pvd0D5xbJnYWzOTI/aM8EuAdd+oIaGm6fTG7tcGzOUM3ktIRhnldo6MuM4MnDbsiAi6L2U5AEaI
	K7M+atxwpmbQnJ6y+4Ndy9WQHZxgrZuWVKPjdjtcnntLnGDw6/i39fbkuccGp9dqBGpiH/tY8ql
	FzWrsQh36qHCNv0CxwUhZ4+M4i+zMxaUsrEUAHpY7cR2ulZnU2xG5kibfGkPAlltfkkrnc5aRqn
	kzSPHULiqeHlgz+3NnX8USCNgLN2hk9p61vQqVyzn0E8EYGvy22bs9xkUR4oxns9ki0CAfpy2TN
	9hIwKMMRTtAB3X3IO93iPXM3hvnEKWMoskepJJ261R98QGbNW4ysMVZlKy3HcQMuHybeI637tE6
	l8I6pKx2Nzt84vIMD0yK9EyYHYYFFLXGRU6qIa93PzVV2nOo=
X-Received: by 2002:a17:90b:3d83:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae6ed4d633mr905165a91.26.1793252679788;
        Wed, 28 Oct 2026 22:44:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:39 -0700 (PDT)
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
Subject: [PATCH v8 10/14] ALSA: virtio: prioritize staged capture period work
Date: Thu, 29 Oct 2026 14:43:50 +0900
Message-ID: <20261029054354.2931-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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
@@ -146,10 +146,14 @@
 	runtime->stop_operating = true;
 }
 
-/* Use one notification helper for all producers. */
+/* Keep non-staged PCM notifications on schedule_work()'s normal queue. */
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
