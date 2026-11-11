Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365830;
	b=qAPLJF4RngOiJo6Rq362ItQ8JUWekUJ5yZrNCg2bqoLHVnaHNsBj/W7ledjHustnVZ+w
	 r3lhayY35EdyfDEWGtyudOLIdE5VH8ZSRr4hXM5+c5umv81l4iZvng6nYxk0Ss4YS+FXu
	 NjP3QWhZJ2BmFZ9Ofr/ru/oVkqvoZATdEreWZYih4BDJCQr4rQhXlLL4HcsvFnhuOfdWc
	 0uWG1cFOTO5ldaCQKD6fsTCiXYqNZYjp0qBGSZ5wrgeyi2Pr/wYs10pYrOLhCO6A9vPjS
	 beHjwkijrsSIavl8viQoXYAZc6/XcBt4HFHPx19eDqacYrHzKIij11NhKZwD42+Er2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=JZxKWPu4essll3+fWgA5exNd5diXTbUeH7xHkFH8WLQzniJurhVqgofwqe34xWIvyj7o
	 B9SZ8qIZcqfubbKO2Op7tvREDDAKnVooSLDxqpkEiXE5e8iwOvI6uP2HsZL5PEPrFyeCW
	 NGvydebQZPaPJSAemZRF8IFW4hiQkffBOK34lSi6RXDMcRQst1sPPOkhFTzxVvYNZOHHU
	 0UwaZl5Em8SOzuk1CzjSfcTy34y8Q5V6iA7PpofsGtYbCYXXlIPzIe2DfRZlZnvF77+VZ
	 l9JCxXBUfTGjZNcq0Qj83Rmvmj1Dz7O1TRX0Dvjvp7a5RPHRAxZa9tbvnEuFe+wBSwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i/O1hdCM";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00B606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A00B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i/O1hdCM
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3712b6d9843so2588055eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365829; x=1794970629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=i/O1hdCM1OP0BIqeRklHLj0jJ1JvJ1PdPXkaCIcKxB2++2hRYTfZbkmvQtELZQZB8n
         WLVltsVnPhPOg4/NRGu441B/+qD75ulcPz9OQDYiLqnjzfSpy8Cv9t+bcB8fNo8L7hUL
         gaSwZ3MfGAW3Mc1fk9EtXe+Ev5+2BK65Es7wsE8YrJn4hM7s88AMHA1qb8/roGN3gyEC
         5nSdNKEWs4cGSEtrtbNadxtctg/OixaDAvUtp1knhHIBBHs6wvYyXxIwveiR9uQ9kHMy
         I89e186LG47Wm4BdAQ5GOqasFVZNUayDMsmE+2vKt9y8ZPdtQwtokrsHCjNRg368/L+m
         uwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365829; x=1794970629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=peU7jbaA+40vpH0yz6if1hGprIMp0mwFFwT6D4VMsJD3O8Rlo3hvLSd2xt80ZKl9Tg
         iDgnDnJsbpCLqFOcVDq8a4/mh5iZuQ6kvZN6N75sxHxM+isjNUzQJIc5slZJcmPfsKYN
         cvD/tuBTUZGYLJJYrByR45foMOJZ+4CKr+BD41wTC7MJpr/Jwhrpt5An+vhhQbFIwjh9
         jwSzX+OxWZsSV65uOVI9E6LSfwb5v5Hzexqcaivhe22US8r728wr2Ax2Jt4fLdUWhoBb
         T375EKIaRGtllS9CmpWIhaflEETygGQWk3afy8eltMovHN6nTeZMhZBgpaGJXE8FhB4e
         Epgg==
X-Forwarded-Encrypted: i=1; AL+hErFIBdVhg+h8NA3dC/RJFfFxoTnA7d0ZfRKUVZm3oA7Kbp929mV+nK84rnc7vsPL+TZsB8xOhPvL/9QxZBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QtHSVsSfhDRNAv/BzDGDL2ksxTGuCXZZAi3hthEwUvsWvBqj9
	jTvXPcJ3dkd4eM6iNd1UCnMMIoDZkCugTmzA0F/zLc7VZXJ8iaAWNaEv
X-Gm-Gg: AYBFou30fbcd8P0nKkIo1+5RFqNFcgbM6DdSLzl8KLuOgEze2Q0PVK5Pw04h11q22pG
	T0eKxlMVLwFDQ3+qOYc35JJ0WZehJiMZdRU/93p3+jfwDCcrRdgf1Fce9rAH06OcJK709CHBcfr
	jUKzds6LStyBM5IOQtfywjKGuQ+qa1flQbohxJe4lL3iuJDS74JYGNp8S+x8ffkjQ35Xhsd13hs
	h7GD5CRqbbEhhsefQ+Xcbi0ZBmcq4g/uwvhGlNysrHDVuuzEkkY3Ek4IFKibQVDbtAoAvt9lQkC
	I2HU1AbYXpWZgADhcTswRSSc///59yZDB4aWXyBuktyX/swlMj+Et++a3fri6bxJHEW4L0M7z0v
	/K+ylneJxkCOQZDaJ8E8YMwRvia9VhRSkjSYtf7zoj2giYbOZRrqVK8q/iVkFtqyV2iXeXFmKT9
	VUfXo32hELPej10oyIeS4jWHFwhowQJ8cxUuwBxEjZ/QbVf9KrTScO2zvcjJqBIGEWXEl7e8Nhj
	ZL8vcPdZ1QMjLPnBU/pwPRk8GT5NVsd9pgq9q588nmeBm6TcuelTbWv9Fhxf1xFnsGiTgvyUGq+
	inC6EeO9QIgMBOKi3P2J4nt8ci/yEKYXJk2QVFThgDa3MfZICyQKKzWIfYskY3gMg6X8xHWv2q7
	Sc3X+GToQ9mYynceMJejK+8IFhJAqGkLpA6dycQhKngTtspA=
X-Received: by 2002:a05:7301:df4c:b0:36a:270:ce76 with SMTP id 5a478bee46e88-37686c3b606mr1546950eec.33.1794365828493;
        Tue, 10 Nov 2026 18:57:08 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:08 -0800 (PST)
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
Subject: [PATCH v25 02/16] ALSA: pcm: report partial progress under the stream lock
Date: Wed, 11 Nov 2026 11:56:41 +0900
Message-ID: <20261111025655.63951-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

Allow a driver to publish subperiod progress under the PCM stream lock
without generating a period timer notification. Use the ordinary pointer
update, XRUN and wakeup path. Capture DRAINING can publish its final
tail while playback and other inactive states retain their existing
behavior.

Handle capture DRAINING separately in the state update: a full buffer is
still readable capture data, while progress beyond the buffer capacity
is an overrun. Playback continues to finish draining when its buffer is
empty.

Refresh capture availability after the unlocked copy and application
pointer commit while DRAINING. A final tail can arrive during the copy;
subtracting only the copied frames from the earlier snapshot can
otherwise finish draining with unread samples left in the ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

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
@@ -215,8 +215,14 @@
 	if (avail > runtime->avail_max)
 		runtime->avail_max = avail;
 	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
-		if (avail >= runtime->buffer_size) {
-			snd_pcm_drain_done(substream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (avail >= runtime->buffer_size) {
+				snd_pcm_drain_done(substream);
+				return -EPIPE;
+			}
+		} else if (avail > runtime->buffer_size) {
+			/* A full capture buffer remains readable while draining. */
+			__snd_pcm_xrun(substream);
 			return -EPIPE;
 		}
 	} else {
@@ -1919,6 +1925,30 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Capture
+ * streams may report their final tail while DRAINING. Unlike a period
+ * notification, this does not imply an elapsed period or tick the PCM timer.
+ * The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream))
+		return;
+	if (!snd_pcm_running(substream) &&
+	    !(substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	      substream->runtime->state == SNDRV_PCM_STATE_DRAINING))
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
@@ -2405,7 +2435,11 @@
 		offset += frames;
 		size -= frames;
 		xfer += frames;
-		avail -= frames;
+		if (!is_playback &&
+		    runtime->state == SNDRV_PCM_STATE_DRAINING)
+			avail = snd_pcm_avail(substream);
+		else
+			avail -= frames;
 		if (is_playback &&
 		    runtime->state == SNDRV_PCM_STATE_PREPARED &&
 		    snd_pcm_playback_hw_avail(runtime) >= (snd_pcm_sframes_t)runtime->start_threshold) {
