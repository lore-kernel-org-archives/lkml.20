Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664277;
	b=WTeimEQwEDgdIvVyxNDlyx5KfytbQ1cjbivwPbGypYAmydBPiwDU31dLKc0GG0fz+vHJ
	 9+u7UAeL0SK05QkkZuEczZgNKSIbSm1XZVwic92X7r5Vw55dD04NsuTghef3B0Ln4ucx+
	 vOsT9AJ1c406eNIhvt9kWGv+wzwwz+aG530jK0w2opEpjaAyH4nLROhAVeYVWK1kt+70L
	 Ae34dOkRx4R2q2n4nSCEr1avpgAbwDn9a92glcMfL7g4mAtqq1x8GFt0YO6C1/AhQ8JUl
	 0ypuZ6cBOP9CaH410tE95+SqxykfmHZh6cudQMfYyv+4UZuKUqYOt22/VxmmyRBo1LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=h3XBuZ0VQ6chxH1KM1OlqR/TjBTyzbuBqGij3BGXH7VwQ/MNGlFazCWtd7e4gfEBRNDI
	 bl0kyCtH9/Esp5cze56nNlBXbu0W1f1fnx+cx6kBntC/39apQcoGplv77YR0nGSvTJYXW
	 V3Q/jVofSWAgnzGt4R9QpdgxPZxITKxK7JYo+F9rd3Hc40kG2Nk3T+zSXxaHK21bxZSGX
	 g2tOZ+l2rQA9z5jSZ0+nCfM8Up/cwAOWKn0dt3iF97nO9Cd6bsVxN9uZAiO0RuFghYVTK
	 QPDq6YSJjHpuxZghmqEf1GHnK1zcqTBs7FcMqL2fXI4vqR1CsW0Ezo+s3stLwqgKliA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nd2Tf+lg;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0D606EEA3
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F0D606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nd2Tf+lg
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1731914a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664276; x=1794269076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=nd2Tf+lgrd05hb07aD5ySNOnXmx83NsZLjVBLUkumOSD4/Q1gHUo30WOvmV1y52kWJ
         Cn8QuoAbIF1TpKQ5dYTaYFu6//hQUg5j2HsZ42iM9W4VArfMybKJDZiqyb29MR2D69kX
         9cXNZ4C1MDffLzLIsnvysb6GJAqJZnmJITV9y6ErxD+aGMApss3kgU9TUalBPT6nirCC
         2UmvIboMRCXKJPtH1DMAwCvXWi1WxFGVBWPwR6qvR9Y3q+Dag0oWxMEo3qMNDRKMluDm
         xWEoo+D9HGdFeBkrI/8UX6XQNa7gv/5O6SYojTLXCajWHw5DT0H6Lt8deqBz2xasLOwG
         3tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664276; x=1794269076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=PFboDSTLR06OVZn7uqOs6n9g4Mx7Wts1DzSNiJ2aBPm38xC/NTZbbW1cfyCbwLS2g8
         sr7MY8spn1hKj5CFb6qoBimU3CXrfdKDbG5JFV6p1MoUZhRmA0YtS/c5RFFQTLk0MLF9
         3rN+mT1pUiSuKpZ9ITGq7NOkgA6vw1cFk+IlO24NUVLHyiFq6F7M8duDEgSj6fBQL4Db
         evnjaSWd2uWi52dWNflxGzEM/R2uG+/YjZ8ngeTIoKeIDEOLCuceTEhPTjqHlemDEqox
         CDrQOi3e1GjFjF2IeWvR8yZQvXICyaHEw2O3VtwA0K8mjhjr2RmLDQ5ouwfGOvps5x0Q
         lp1w==
X-Forwarded-Encrypted: i=1; AKwUvBwmS9YqAjvyaQJJgpS27LRMk2IBN7m7/NptECvTsiU/olcwG0dWW01IxbosNscqWTzT8YxbfZTO8g8Zx80=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aCCwE1rGpa3l7zwp9C4xjS3jI6mldy7GtKcoezFqPhHGiCoYI
	o69HVgF23qrttGTmWdzN6cDcP5ZlDBgPPYJ7XxQNSmtBMG54qbRHu853
X-Gm-Gg: AYBFou0WJC+qbvjBqh/QfrAwg/y95Pnm+XrLFQSdo1OaU/xQmIL80L7AHqRyOMFMqKE
	BN0V0ogHHX+cPunFSQKNnbGYMFdcbyy07gvUJp/UfsqE003BE2yTpDBeaK17gwY/crmELmdFKRO
	vziLluFtLF6zY0ANuDrIWo/85T9cNFA2PBF1oXpmQ8oLd5SVpzuFkMG5xRZiQw4T6JV/BLDX/Gn
	GMg4xjzFZhzKUDhLJ4cfOGCEf21Es3Fmu1M8EMiWf8K3GDKxpgofVVDyX8sBlwrHKVCi089tNRx
	vAZqy95Md1qmW7pM8kJpvQrRSE64TcOZJ+aBp9aAAB4d54tDiWplk8JqdKfMpxeXcgOMCKEskva
	zpMwYnfIps4n0MIF0vbYHG7sJcLm1W/dXTiwgWpqQmyCn5/HAnOCAQvdG+w6QqSsrgKYxQlSBEY
	w33QZMjQVcRJrenS9AYXS0+Zrm0QzqBvdW8Gwl1XMN9+Ve+doBHr63Hr4KqmzHP3IMK4JVLfqUo
	RgrxWON0MkaK7OneNjuJVn4tZH2RUuL1v5Wtsq14TPQSN14M3mmo46rvW77zdkiQXGfyn1zTHDk
	dq/58BtHufvPCeDl+08z9VBN7zXsR+otAQ2mkQVKAVDDgaqA0jZM0s80ooVJZFjywUEN4c9Mq70
	zvp+q+Go1wkQAEHTCN0OG/HdPt4f55xNv1+sw99GqwNHlvp8=
X-Received: by 2002:a17:90a:ec8e:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3ae897d5fc0mr8022586a91.34.1793664275838;
        Mon, 02 Nov 2026 16:04:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:35 -0800 (PST)
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
Subject: [PATCH v12 08/12] ALSA: pcm: report partial progress under the stream lock
Date: Tue,  3 Nov 2026 09:03:59 +0900
Message-ID: <20261103000403.67106-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
using the period-interrupt path for this event can infer a false ring wrap
when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM timer.
The driver must release its pointer and trigger locks before calling it.
Existing period notification callers keep their current behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames and
reported four available frames after delayed partial progress without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
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
