Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862572;
	b=pM8c3kux3XVQlfs3Jm6gPR2ucI2a2EBoo8R6YDFQfcKgE10CYVLLWFlAnB4td9PuuMQP
	 EiY2QpLCSdLfmVfULSmUWRTuFX5cj9dymNu0Ujfge84XhORDhZSSzA1bjk+4Uk3GQ1vpC
	 66WpfW4zyJdtJZQMj6Pd3LN5hR/OoeLRC1/64UOUgHzG4ztM5Sepnf0aqxlNfsYdeq4S5
	 E3I6QtwkdvqHMyF0tPZNyuERN5f6UCIyuc9bjQjC1Sf9wBncl/xjDdTCFd2adoh9LFCRC
	 YbUv0si+fdUpHGYvLP2Eh/MirFCxESfXhKUHMkVUxt07do887ywHHQ60D+rvoHNf44g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=YF8v7Mz1UAbgUES57iaqtN+sNqyF6Wn3F/KCbolo4uIbhVd7JIFfP/RLw/kk748Bh9Jq
	 M+m45FggwayW6Of08x+s5zgAxXhQWZmlX5yC8jQ3Z5SUN6dUAe8mKasiwwXzMbqVSb8qD
	 l9aX2vGjFgxjrJ2t09YGjW3TUWJxs+rJfEkaj4Koi1PVc1Az0KQzY2rYb+hREVxtJYUb8
	 3y1xCP5PvnEW8lFbQi3P1enI1xe/GiXajrIYvRn1eKNyDx3iIyO8ui/Fa4npxRVUQ3npl
	 sASW92IMJXr2kiIrOX76Z7dNLqQtS8QuAqK5rXsScLh78L4m7cTL3beogXY9fXKPZgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at88dH5q;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C80606D80D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C80606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at88dH5q
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so1102447eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862572; x=1794467372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=at88dH5qI7lHb9egqH+hUXOqX1WqfuRrXRQhay6SFrOiPFxFgiUwzovkfbs4PicPyV
         bLecinhQ5isLl0hAyRu0eiS3k2TEdwbVFUMaiHMP9/y/J0QUE695ZsUxgPVkque0K8lX
         5EH9d6KKjqkf7v9AlvKfE6m4usmHE9ip48S+ImcAx4Tg9pXrVLLxH4EWHksb4cVs3ksB
         QSzIF2XUxWI809ND2saGZHmJvIKyojHtjvtBuhw+2OYJuWi/+LCwpqcQtWDPhTVCT97s
         sUObAbIKRPhLkWSEQltrt3l3wMTROjfgNlhmjxGyZKSKqb1wcdnWHWRmaFLrgkbutGJd
         sSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862572; x=1794467372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=cnM6cZ86xMHf6oBlurlUltT4ayn8iu0atgZ9R1Tu12yir4nLLMvZPryyJ5kFHd95y2
         UF2RkQYnWlVZ0Asw3FUEi3WtU7Q0F4XPcJNxRy9bCYTsH6hE+1jlVsqI6qoxQrUZ7neJ
         57Pa/xTnKgxGgSRNbQ/3BChZ1tvTJJGYgNYoveETxnVj1AirQjiW+/HF1rEm3pRaralA
         Wztg4bAe4WCGBM1IiAzCCsvn8YxvkRdqTsmpBJEi2KOC+NcgQThpAl2l6r7kB1fZALlq
         oM2rvh3VjgVDDeltOz0hVEbwQY6JuCfzb+dxnyNaIMDvIAgfPu/ene9QlthFwMf+Fv+O
         GpWg==
X-Forwarded-Encrypted: i=1; AKwUvBzk59Elv23SzrYtAbBzEmYAAa8Ro/EckpFRhZgo37CNW+VTT7i876SL1WIeg40cJjIURpDS9tWgZZxzKrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/92z6eQHXCQZ7bnBt3jUbSt9L8S0617ZLuzNbkCk3z+AAvHqhO
	1d1/HpBVlFSGtMRoPc1n5dJypjgijp5LqhLkkIsQE3CYzAdf6RTlu+4L
X-Gm-Gg: AYBFou24bONcy2DxH453+AqArX9kOl/pGN54uiReecurxei2pd1aPxA1ZVjF0FErIp1
	FG7/jbwrZr23AbXU8mhtt9S+Xm/z+cAdTn8X9VvXi0IamUEhemOQg/4Wn958/Sc8CLDznAspPWK
	1RI/c1Tfz6ITygWs5AAVMRLlbPpFCHX0BeVLDducblFJvPv/xobg0rIiiZ5Xn33/2BqFTeBeGoX
	JQRsrufVTpIoBcEzJNIohtq2Krv0hsHsb2lSzxR+CaxPofVLof/rQgGOSz02fL2VSRtUGKcs7Nt
	6EUT/oTpldoz9PCtG1zR2dGgqNXPe/GXSIu9niJuvtfI/1dh7zJQ48mmK1kf3YBo8w6mSPeero9
	vWdM51fJ18/TZHWoMLEC6e3OBNv8/f6rbPrMuBUCdmK+bLs4p5TihxOjsk4J2ZDcMc9f7qPhGQQ
	sYRKQvtTm2PjQlGxS/OtEimVUyWFnzyRbRki8MVVBi8mTvO7rLJmcHQlcQfKSK7PCqn8a2wAdwQ
	Zkxak58A6DyPhGP00PC8EkvZDs1rnmZ7xFfO61JT8BMUe1uoWWMlmv+pC8UodklLgZoMhYaD2Yc
	A1pOT7eh3xok3JhsKrWdJrLcQ46aDevmKwjvLoolBpdNZwzc1uilWTCqGlV9ULmA6xic048CXCQ
	5dw00GKu9LJXPTc+ecojQBHUb1DrGKhLQDHDvF+11946LoAA=
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr25031192eec.30.1793862571510;
        Wed, 04 Nov 2026 23:09:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:31 -0800 (PST)
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
Subject: [PATCH v17 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 16:08:44 +0900
Message-ID: <20261105070845.6449-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
 
