Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201391;
	b=ATeo9I2vYnW8VrKGCNpHLXXCDWlFw6BPehD5CBy3w9Y9xuw2X+0CUUyVhWAUEz+1SXZT
	 G12WvfMi3XoLW7n+o8js9OhSErzaIRPjReGdLJOnSHnXK03xcPOo/6K/eO3RKd81AMxSS
	 tg29esZgwK6EVFyZ3Cp3E+RbFQhtnC1t+qG5zaCUH/HMO7Jr0JH+5zIVSdR4i/FB65271
	 NBvZakCmHGD0H5mX5MLOGjgNn5Er8/5UdVS3A6d06OPIJ+W/ENORx4SNwFSF09hT25yOW
	 vi4dEubaN3Gb4RbpoXA5EiKrceEYXyIBFGQIpc/7Lw4VcK1wXiFI/pgU+xRsQMkC0CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
	b=xL8t7hAS89v5NnaiuPfZ5gvEVmHfMz26qzr5OPmuI0uGdQl4O1tNRQ6YSf854fOICire
	 v00426tJAeiXJw53k83ovM4OHJG5fsvCjSvkoimnNKL4Zs1plGUIre5MnMZVn2W2CywH2
	 vSOvPLU7a4fO34nZ4DC1BFHNHiAgfJzCPB9cJUlR6spO4RKQMKjVMYWySi2cjvbcK7pgT
	 LV3J03le/hwo9vWgxtK4iTRJS/roApRrB+kgiz3IPVyCmXlh7wDvx7lutJLtrZPSyXDp2
	 0IRKHCNH+MVYt1i5nSWO1UVGdqDC6bat2DTkyMQOsQtWTQJp9ueLu5QHCeRzGQ1PL+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="q6//wb7x";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195ED606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6//wb7x
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1799497eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201390; x=1794806190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=q6//wb7xNb9npoBwL7E/9igaV0A8UxA6JLgLNUuVkh5SM6Zx9G934sxRSzBmdh6pg+
         g+MFs3PyNEIMuYpehy9LDb+zQYW1EL5Df04xLDsSa8UPFJqnFiw7nZ8jlulXoOlxei33
         M2yEXVYm46+TTFlkqbq+N5fXclRvbO5n5P6xbzHRlGNoFsrr2TSKOWrcb5yjU9ZD77oS
         eB1Gi/jURNFou1LhprEkKOfqI7Vp5DF0CP8gEVunUuuRWob1WuCdDLJYi8WaxX1cJuYG
         pBPsgxATiWFVdAf4KJVotIcbSVWV7syeqnUP2Jpl5ndAPHWQ2YFsPPSI8kY8+K1/ddQl
         StMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201390; x=1794806190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=ZHF25Pw8wfFKJG4ZQlcrxdHZTi7ChZ6AwfuvbFtdMN2cl/pFvj8gMUGR765xjSwUZt
         gorR/2TxX/keWu74z6Y11/e3POsUMO1ZNgeX8076UFXlZvY2QR8V4IjcS3Hieg5wTy/1
         QoXmTzybRCcCKntK+OKeSQ6M7Au4pMw9Cp7VemWSexRuHOoBdvmOMxXmwBx/3EjFRotG
         TM3IW3jWrJ+/ENGPUFBHrLwG8kifdLkBbyHqdrjFEsMsIh+qRfS/aHHIofFfFNBcYjyo
         CtP3KkPhc4C/V0LcyAxkTQfuybndtmmcceWmv1vv+y1lsbtxBtL1exX2FU/OEJ7eKSMH
         6rzQ==
X-Forwarded-Encrypted: i=1; AL+hErHPJvu9Tf5rxdx2sZcWl/d9H9MLCgxRLsPTH2LwHgVjw/zKI6iOwAmzUmyoTkCSf5N09GXsmFDYX36DavI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A2DeplYUVRCTT7T8E+Eaehkqejgh74bsYHPan0HNTMxYKmDNo
	i3OrVZcAcWIawlPJi2n3RJ/vt9fwJvkmJvxiQKMNa2EPDTty7EH5pk7n
X-Gm-Gg: AYBFou2Zh7O/xtZi9txQxwEwuoV+DV49dyZMlyyxycUd+ZABVhfXLspdODzYZGnGlqI
	Cqgvv2dwGm84jj/gO917SUPoVf3usYH3J9NzG7N43CY4eE4L7XptgylUy9KxoTnayZoSPY4JELw
	c50FWE4HzVD6Z2AXqo5K7eFxqonwX3rX2MVwD+CVihIxzO3NAeuMdEEUYg0F3H/J3yRcmx8JN3J
	OQb7RoCkfq++ToYItLJdyJXMV3T9p6b09NiLGzx7Ntway3JeFsgjB2Cvw0LNYFg8Rpb7Cp1LSpq
	kiGxTu8dAcZID0aF63Vc9gYmmWQBL1iP6+O5A5o8eLlHbg743FNWBmHHbjh0cvgMibvr/NjpW7Z
	lm7u1OkeraucyU8SGsAvHnfUEwKp7dhMYUjGKWSgc/ft18wNAgYJXAW7MpgyTzG7JPdiFbhDVx1
	1CBP3KbLMV5Bqme+tEs/WFxmknj3XKsmBXMnd1SdryKQhmGNFxeXMefffXCPpZ3TalXFB1i6dO4
	GiDZvcJVk6fgT7b5Xa7EOOcRFj2oQ1LSslLXowsWPkbDsNp0+uxLIMEayZfe2WtBsCGhlI5WWel
	3Hr3NyQ3IMUxOl3MZr3zdgXUsg3u1rInm/Q9sMMb43gMpsFjd8JZFngiqZuMrHXJK0zcXnIkUNX
	NYLnVxURw+te8qgI6dDU5F64SuOkvBFEkHGUJbWaKg0f4qic=
X-Received: by 2002:a05:701b:2902:b0:1b2:539b:496c with SMTP id a92af1059eb24-1b39ff1388fmr4548819c88.35.1794201390152;
        Sun, 08 Nov 2026 21:16:30 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:29 -0800 (PST)
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
Subject: [PATCH v22 02/13] ALSA: pcm: report partial progress under the stream lock
Date: Mon,  9 Nov 2026 14:16:07 +0900
Message-ID: <20261109051618.22506-3-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
