Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423700;
	b=hb/A5ynf7GmQWW8L9QMSHmcLKiWclrmX363bpaIo5aSakEhoog88MzwERbpf5OgF/jKf
	 IfKbj1Aq/VwpgjLYZPP7mJfQ+QDF/zZQB8+T3eJtNuoRGuah4mThnztnzDIbUGw1aXZAP
	 B9xqBn1lqq8TFspfJTWTKzFklf73CNqBvtMS0hW20JKD28ytA80VeHnyV0UOGI0nAavO2
	 5mwDJUsYPG1XW5CopRGvct0vxBz9g3+E3wIyb8d1G4utUPPvzUsABnROzVRhffGgYUFfv
	 o1W8M4drAbZxtlwkMt0Ws3myhzsr5TQl+ZbufrOGG9CPkIPlTko8ggRmvvP3JwpxxXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
	b=nSgYySrxNV+KudqjlKoldoYlkwccOHd8QwF4njKakDaUUwbi3Q9diaVUcnbWrvdDbJfP
	 wF+CRyEADW6JxWERMw4Nc3qMHDLmvV7HXhzYKjyzOISW+Gp4A0jKQDHvV6AEvjX0cYcKO
	 Q2T33hKPNQXafWtYjZEsa187kUR1XTaTmqj3AY0Yeg63V66iCle4EJkDy8EWYKbtCUWTt
	 KJC0bMy+k14Wl9+Oc+5IuLMO1BqVWyn47tl8eujK/gFi+Kyx/BtbjQ0PdHnjyw6H6ROiZ
	 IH2hfXv4U8xR9458Ze6hxuO8omlVJWHTTyr8DjJ8IfumKulBIeL/KFCYnF9x3vEY3xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWDA+WnM;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0156606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0156606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWDA+WnM
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1069250a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793423699; x=1794028499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
        b=JWDA+WnMMH12lHiudOQ/fEdIv/tWVSEeKrrVSFX24lrZNuiVTatl70OAjfbS8e0YhJ
         1zTGmz5uRYSXXXa8cyBpzpXo7pYhMBmYIq48kuC1bcrd07f61aXw1iS/5XSvPwF107BT
         EilCUPRxb9/loFmfx6Z0vFr4oKvNbTHgIEee9Hdu8CvmWj0LAWl+90zUA4q96gNSRPEp
         Jm6Mv4UMDNL/1HWv3ifq8pI8d5A8ifjE+xUTHEAIhTx6GZ28snul68rBx+7m1CJblV11
         uIePHpi1Ln4HFyoHEDkzBOA8uZ57X1SxraUsnPlYz7w5rTR+ciPMMNI0ARr9Le3wKmoN
         bCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423699; x=1794028499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBuI8GbK7I2rZVu3DyJr0WlSlWPuOWJHWuOqPUTFLms=;
        b=Ws076El2Bed4gPkChlfLP32apMNAl3WYHkpGjFjJ9ASdfFyTlVBEnl1sNFjllX2aTw
         GG/AsTWYYLDMwv2N5+yCkLxdwDiSvcv0OdhxF8SqMjXtP4hXCWtrcyMrz1l1N+ZjJMON
         LAT3yNW1oy7HC1TSoKaXeDhJgKqrt7v3OVwxm91LFHTiNTE++e+VKBWfi62l3ZG40nJ8
         HBM6WaHaQFlAOl0GiE7ANOMj8ok5mvQLPaUQ858wuE1fzieYuN/qGqY+LbLcTkgyXPhE
         LU68jprFyEQokdCLE/jz7ChaZjxi8mLl+1yHY89W9z3W80i/2s1uRihM8is99fzVM9Ui
         rBYA==
X-Forwarded-Encrypted: i=1; AKwUvBzqzjdKrGlU7TEVnxkJPLmZBWProTjAFrb67IHJ25BH15uu9zeJXitz0uOoApSmk0NgJK6NV3lo4vIu0HI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNXM1QeLNN0rGWduC1K1h/psUwnt6qBcGp2wBCjIosERhhylcs
	51dbmI72kjz71mn7deGreMMwK6OWRTfwOuXvWXUJ8NS4Ap3v6nsXyAE8
X-Gm-Gg: AYBFou2o0LncKzmmy2Z1Oxb0bWOBsxhaefEx7qgZN65QWhAE/m7WPuv3QntLNynSXm/
	KZsIbvRi5caMvKATotN1BBG2es+5sDy2jdeFRYZwLC1aerYK0i/9HnQ+U4bMiZX5nZ+RTaVAlCk
	FCioaEXeO7Zhv4Onm411BvsdstTvNs5243Ck/mjkpenB4fIAjL/Y+IOkge3BNKbrTB92DU2SIka
	I64ELSqhjVxVPVy8gvNUTaCvtCx9T0V7pq0Di1rr9ww5NzyXFx73JtO3MxXiMdQIa8c9s8S01oq
	BosgnJCTuI+ILhLPYN9Ji1pj2uyqrs4BAPZEgSDRZrS7mLHSGOS944Fomh692uWC9hiYgB6+qmY
	5iin5UAfTDdMIMvv51+9/GlYOhjWaEkHFP6kyyCAINq9TCeFoibnN8bXfydvecKh0yWx1689i17
	JSZl3cV4+tsXshijEnm545xTFv2JD32Tv5OoSyimKvWl8Y9jdS/z+d2NdKf8Mu405u4ZOR0q2l/
	69EegEOq1FjgiUdgh5O9qAzD1uTYcvuenDWucpntqn8T65E3EQmrnCHjW1KRrmut3wEIi46pxRI
	JtL+Lni2hRqkoEicnx3/Tkjh
X-Received: by 2002:a17:90b:53ce:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3ae89817b01mr3689286a91.41.1793423699053;
        Fri, 30 Oct 2026 22:14:59 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm6216305a91.14.2026.10.30.22.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:14:58 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 4/5] ALSA: pcm: Refuse to open a disconnected PCM
Date: Sat, 31 Oct 2026 13:14:29 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-4@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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

An open that found the PCM before snd_pcm_dev_disconnect() can still
attach a substream after it, because nothing in the open path checks
whether the PCM was disconnected. When only the PCM is disconnected, as
on an HD-audio codec unbind, the open then succeeds on a device that is
going away, and its file delays the remove until it is closed.

Mark the PCM as disconnected under open_mutex in snd_pcm_dev_disconnect()
and make snd_pcm_attach_substream() fail with -ENODEV for it.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h | 1 +
 sound/core/pcm.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1cf511f8d880..04f58c2ec5c6 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -548,6 +548,7 @@ struct snd_pcm {
 	bool internal; /* pcm is for internal use only */
 	bool nonatomic; /* whole PCM operations are in non-atomic context */
 	bool no_device_suspend; /* don't invoke device PM suspend */
+	bool disconnected; /* disconnected, no new open */
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	struct snd_pcm_oss oss;
 #endif
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 064df4cd3b50..567eeff23095 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -897,6 +897,8 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 		       stream != SNDRV_PCM_STREAM_CAPTURE))
 		return -EINVAL;
 	*rsubstream = NULL;
+	if (pcm->disconnected)
+		return -ENODEV;
 	pstr = &pcm->streams[stream];
 	if (pstr->substream == NULL || pstr->substream_count == 0)
 		return -ENODEV;
@@ -1101,6 +1103,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 
 	guard(mutex)(&register_mutex);
 	scoped_guard(mutex, &pcm->open_mutex) {
+		pcm->disconnected = true;
 		wake_up(&pcm->open_wait);
 		list_del_init(&pcm->list);
 
