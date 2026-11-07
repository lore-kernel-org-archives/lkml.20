Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062107;
	b=SWOsG4KVFUjx1S++jGAYvd9XAkVWhTzpTWHFr+oK9U4ETZLXoRpWpVsgEeotEzqfF8n5
	 RhhQbEm9f3yGtjb+OrOK2z9jdB3b0aKh9982XQewkzDahH6xEmUapLpZx4p1+afrHn0bZ
	 tZjqTvYq+y6g5YcmTUU/UV1Xg95ngcgwmGyMk/GIT8chjFPx6bdS6aR4Fu/MbFsXJ4mhJ
	 L+ceFu+oNGGEKCw+9SMpTyiUfqOMfbwVpxhHBxDCcK7aZOTgR7rteqV5v5UxFnYVOFwwi
	 rglrs4O3a+IInV6g9ynJepaN2joq07TXyuWyaBr1FD95SdETgk36QuMAJ5sLM7+ws2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=rVxG5C06phrE9sM8susvygnSEWJcHDBT9z5CzHf8x4iy1oZzc6kwYLe0Xdor2y0jHSpC
	 9tZkUNrfjy4Y2liFPYySIOLhV4VA7h/ZKe6CIljtpySoR1t0q279sq2YRQ5sPStdCLRGK
	 I2SNP/v+FgjuGZfWhfU/we6tYmg2GgUrz6zEC6A3c59YYAsfwRVBTIoTTdfU9icikjKHw
	 MVmA6kDBo8WVI5ej6yGoZgwO06I7FcQ/V+laM50sthXOghAcoL/kNOVw0MhgqtkUb0Gcz
	 Aw0va1ABRLJ60qKmpNAOrTnTQ7weeKCBLg9iGZ/47z9PUvQTHn2rmlUQfE5uqLQsLlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=It0tjF7X;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61860A3809
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C61860A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=It0tjF7X
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2584048eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062106; x=1794666906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=It0tjF7XWj++NO97QlIi+MzWsqv7dS+rLoAjkHiEBDKsdOwkLwXkcxT7Ik7ap4Urjn
         YI8UTGIEzQo7stz5MHOmV30obduE2A44pHBsRy89yax5YgZPFcZP/I/ZjPM0PbTZ8anh
         kE3UVi//VVoYYPYw+MD/c0+acOFFpYGqmnRZzHyK+1Ynu5aRuW1Ktirfj5RGHoDSMXcY
         yx0+sXtBo1Z7Gd6IJoueeJi2Kr8NvRjuMQxx5CfOdnBxdeZ3sDK0qigZEnY94G09p2H2
         6wG33TspzAHEgFIYLN3nhjmMxdOD9tpWr7Vldo5sroGRSsGU+5fCbivBb7dTslLwANGj
         GzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062106; x=1794666906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=ui9gQ8p3ncZT0sJUwYhiRVXYksFnKHXyaJbtZOj/5yOC2YqL++vx26faZtBnUWfyCm
         rACSwTePlABZrG3tQMyVKRXDpgYu5GGRwUbqKfSNM6udLxyOxOvataVjB9J8gmE5tihJ
         /KBKz5M5XL5GrkoA6q5I8NIhtX0DdLx0SGQYPy1Qh6dUYcpy9OToYlcklYEULbjXE1pY
         gziV2TvXppYUMLpLmSqscDX6rRcF5bFMJLcxFWvpJhwW/qKHSmBWV2OtcftuR1ZOMDQy
         2RUlU7iDH5O5OjTYMVX23fILdKWRUjOYlpg/B4vURZS+fsQwzeNoBNtegqvgqsDfHtxH
         Jy0g==
X-Forwarded-Encrypted: i=1; AL+hErG0KIEwVha0hsK2+KFBzGTHaLsVqLdIPY2brV8yWAhT0zpYuhBMVC4N75OtEkU7LXIT5FIqpqogJKDNjks=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wpS29MzfEpTO/hEoCGNZ9dmY7/U9QxckkuQjoY2SP/KE/HoKk
	KDDs6Ql/3RHCM+No6aAEokZcrMvh0+U92FzGCSjtNHB+ogkZzpVkJ92i
X-Gm-Gg: AYBFou2jRxboZEEX2FD3N9GbsJpjoswHJ8Ad++GFJQ7BQs33Dme+PhlUCHbWa7f/rlY
	fm83vFAVoR0hcctD7jMYhthwKDLSJa18cW0C4qMFhYKu1rUZPEgr6cBOhpUwETApxip3qCzGDS/
	CTEVvN62JNeoUCe7Ds1kY6dN8MEH5Gpz85DJ+yjUwcK7qeuI5+OlGaNQAIfIqiFKQwgBne26qtr
	HOVdRhDl27wLNCX1+3eauklNpVyds64V4ZLnG/qRoamp3K6m0pIaYjLNbhKj2UnGNdGslZ2MWei
	k2V4vJpiXuzJz0j8mZtMZ+LwxTxIt181k0Mn1JygqKn4tGqBLvTvXlKkDpA/s+nT0WO7YtLkALH
	vWfcGcgae9u2Lvn3dSSEFpxi0aMI55IUrOTMAvx0SlkyZr2S2UPIgXXGJqA07k+6+emN+SVZYV5
	5St61nLCBNnjyQnzUxIBfk8Oi5y+cg2W0L5j1C/hTYMf34z0MaLcH7lPMTNaVp/gah1EjtYd/ir
	qxelBBjs4hy6Lr5/w1odfrkACCh8R3MhMV5oONX5MsMv0U2r9CiYpe4pr9bnBEeTqdgvisx9u4e
	tr1I5KbyMzwurmOCtzuO72P6dHYtCyJY12c545/c1zO8pKb3p9IZPNB+ohTmR89DioRqay2JrXr
	CNPN8i27stD3fgBi1cpISexULKWu2TFZ+q3EOdsDhq/SJjA==
X-Received: by 2002:a05:7301:d805:b0:36b:f09f:924a with SMTP id 5a478bee46e88-36f7592e4d4mr7639013eec.14.1794062106044;
        Sat, 07 Nov 2026 06:35:06 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.35.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:35:05 -0800 (PST)
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
Subject: [PATCH v20 11/12] ALSA: virtio: prioritize staged capture period work
Date: Sat,  7 Nov 2026 23:34:21 +0900
Message-ID: <20261107143422.29319-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
 
