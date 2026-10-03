Received: from cvsmtppost23.nm.naver.com (cvsmtppost23.nm.naver.com [114.111.35.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E046231E858
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023960; cv=none; b=S3S12jPqJNcnHhUt0RS9ktM4DyDFG3TQ8g+X15zcP1jqHRX2TcDT0m2rwnBjJFAU8gJzGMqDHAGqoM3iV30szI/acC7RJ58NiAXKmU7dQZyqAbSyqmpv6Zuh+ZGlOq3oKX1JVcRAFCHq/ui6fB/GWORwZCUQqfxFGls1Byrt1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023960; c=relaxed/simple;
	bh=ib+ao0AD8SW6XlrhQl2lXH1GzbVG5HubBKMs4hbDJ8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRyHkr30O4PXJA56UAdo9hGFBnTq15XmMUxJ+Lk7Dp4f4Qw6Q5REyO/eK7KrYHhsc3ioAYN5IEzJL+tnkbNBsuJcY+KVlyFBmrUQVPx7rt4qi95t949RaRdEhdk8TXN20MB9yulhxq6bO0rXb52g7EKDUUxRhBTr7hXA5PeqoaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=cmAOYUmW; arc=none smtp.client-ip=114.111.35.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="cmAOYUmW"
Received: from cvsendbo008.nm ([10.112.24.37])
  by cvsmtppost23.nm.naver.com with ESMTP id Q-CHICJJT3iloHF6jcQGfQ
  for <linux-kernel@vger.kernel.org>;
  Sat, 03 Oct 2026 10:19:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791022742; bh=ib+ao0AD8SW6XlrhQl2lXH1GzbVG5HubBKMs4hbDJ8w=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=cmAOYUmWvgtgUvvBV51uunnj6m91BdrzwAalztx0hKkNr+nKcRwmk3tFUSoL0TSxr
	 E+TeEWo4AQ38GvnFfwwWGvaT4yiW9KxXF07e8JLAoBb0H0gZDXMR2x7oMd6kVsYZBT
	 pCGJUsShdy15OtUD5R2LuoT7H0P9YOz1NzC28z8F9F/fFid90OvfldWZmAuGIulL2q
	 oGCYymwRGah32VUhuuVwQTHEfMeAPflMQdiNXIntXPXaJu1YwgSbxjaCjvZw82nmBS
	 WxXGnkhjp+YHRh4dlAwnRmMOPrtPByP6sRl5QHZmG37Hh1jRE2hBawutwGDy40752d
	 JK5lvidNBVaDw==
X-Session-ID: K-byLlITQeSpla7n2Rm6OQ
X-Works-Send-Opt: OP+wpzGdjHmdKHFOMr39Ko3YKHm9jAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: AwblaxglFqJZ+HmZFAKm+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp002.nm.naver.com with ESMTP id K-byLlITQeSpla7n2Rm6OQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 03 Oct 2026 10:19:02 -0000
From: tjdqudcks0424@naver.com
To: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: pcmtest: handle multiple wraps in random capture fill
Date: Sat,  3 Oct 2026 19:18:54 +0900
Message-ID: <20261003101854.1423146-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sung Byeongchan <tjdqudcks0424@naver.com>

The random capture helpers assume that the data generated for one timer
tick wraps the DMA ring at most once. However, b_rw describes 200 ms of
audio because the timer runs at 5 Hz, so it can be several times larger
than a small ring.

For 48 kHz, S16_LE, four-channel capture with a 512-frame buffer, the DMA
ring is 4096 bytes while one tick generates 76800 bytes. After filling the
4096-byte tail, the existing code issues a second 72704-byte write from the
ring base, writing 68608 bytes beyond the ring. Both interleaved and
non-interleaved capture are affected.

KASAN reports the first write into the adjacent free page as a
use-after-free in the random-byte generator. The underlying defect is an
out-of-bounds write from the live DMA ring, not a stale DMA allocation.

Split each random write repeatedly at the interleaved ring or per-channel
block boundary. Keep the hardware-pointer update exactly once after the
complete logical write.

The issue reproduced on three of three clean boots. With this change, the
same vulnerable geometry completed six times without a sanitizer finding.
Boundary, pattern-fill, no-timer, open/close, and module-reload controls
also completed normally.

snd-pcmtest is a test driver, and selecting random fill requires an
administrator-controlled module parameter. The written values come from the
kernel random generator; no privilege escalation or attacker-controlled
write primitive was demonstrated.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI Codex
Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
Changes in v2:
- Use an ASCII author name in the From and Signed-off-by fields, as
  requested by Takashi.

 sound/drivers/pcmtest.c | 42 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 5d5281e4deb7c..186e982d42e1a 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -280,39 +280,35 @@ static void fill_block_pattern(struct pcmtst_buf_iter *v_iter, struct snd_pcm_ru
 		fill_block_pattern_n(v_iter, runtime);
 }
 
+static void fill_random_block(char *buf, size_t buf_size, size_t pos,
+			      size_t count)
+{
+	while (count) {
+		size_t chunk = min(count, buf_size - pos);
+
+		get_random_bytes(buf + pos, chunk);
+		count -= chunk;
+		pos = 0;
+	}
+}
+
 static void fill_block_rand_n(struct pcmtst_buf_iter *v_iter, struct snd_pcm_runtime *runtime)
 {
 	unsigned int channels = runtime->channels;
-	// Remaining space in all channel buffers
-	size_t bytes_remain = runtime->dma_bytes - v_iter->buf_pos;
+	size_t pos = v_iter->buf_pos / channels;
 	unsigned int i;
 
-	for (i = 0; i < channels; i++) {
-		if (v_iter->b_rw <= bytes_remain) {
-			//b_rw - count of bytes must be written for all channels at each timer tick
-			get_random_bytes(runtime->dma_area + buf_pos_n(v_iter, channels, i),
-					 v_iter->b_rw / channels);
-		} else {
-			// Write to the end of buffer and start from the beginning of it
-			get_random_bytes(runtime->dma_area + buf_pos_n(v_iter, channels, i),
-					 bytes_remain / channels);
-			get_random_bytes(runtime->dma_area + v_iter->chan_block * i,
-					 (v_iter->b_rw - bytes_remain) / channels);
-		}
-	}
+	for (i = 0; i < channels; i++)
+		fill_random_block(runtime->dma_area + v_iter->chan_block * i,
+				  v_iter->chan_block, pos,
+				  v_iter->b_rw / channels);
 	inc_buf_pos(v_iter, v_iter->b_rw, runtime->dma_bytes);
 }
 
 static void fill_block_rand_i(struct pcmtst_buf_iter *v_iter, struct snd_pcm_runtime *runtime)
 {
-	size_t in_cur_block = runtime->dma_bytes - v_iter->buf_pos;
-
-	if (v_iter->b_rw <= in_cur_block) {
-		get_random_bytes(&runtime->dma_area[v_iter->buf_pos], v_iter->b_rw);
-	} else {
-		get_random_bytes(&runtime->dma_area[v_iter->buf_pos], in_cur_block);
-		get_random_bytes(runtime->dma_area, v_iter->b_rw - in_cur_block);
-	}
+	fill_random_block(runtime->dma_area, runtime->dma_bytes,
+			  v_iter->buf_pos, v_iter->b_rw);
 	inc_buf_pos(v_iter, v_iter->b_rw, runtime->dma_bytes);
 }
 
-- 
2.43.0

