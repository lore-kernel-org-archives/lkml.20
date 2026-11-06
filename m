Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981932;
	b=Q4qvUliLvTKin5sSMBIX/BVmygVQuFjebGpPT5o6ef/YvhBJL+QHo8IMEd27+zFclUxF
	 e15ubvod3ps5qq7BnrF8Y5Qv03chZB+rZ+rdf4u4Am2l6IMi7PrUHRw/zy5Q1l+GWuCwc
	 QNElZDSiM7Hyvq1JYrOa+kAWI6zzF9IiVswrsMQY5csbO/Y+MlU2DoIvXBlABCQgImrPV
	 nzc+NkWIs1MrnPpzQy1Ckx/GUDqQjNeRNN+PZ9WG9qkZgZluw+BV7G1dlqDMQ2HGNwlCm
	 NYUJ2Qdu4M4vGHfdVAio3b2f74ZQ84sB6IjC/KQ83v5ymi6gblQCWkvNFSSiHOSUPBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=cSBt2ueXrumVxdyc5t5pSfGCtLiMYMn22b5dedOmrJIXDilbZKKeAiKt01vPc/svPy4C
	 x0KWdyYAK48uJmu9z9RmtLys06c50j2TZmyA7SVYvKNT6u8dcv3qRq/1w6SEDlTnlHOuW
	 GBSg1M5KtGzRBMYnCtmUU1ttT6E+VVeDiLLf0GsxvFwl0cQFtON7lUTOe/wVnILjkSGyv
	 eHlvwaJve7w39MSNEJHAOwvyvYBVJ3KjTt7miXqm5pAbAbpDOg+Q3MTE7daNHbMpWRZgN
	 3OGWCRUc6sVCnZuCngiVcked8jAoteoGnRps3fKODesu3T0yiFmnlSOhNn3Z3PiUKOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hG9varOW;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7979606A33E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7979606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hG9varOW
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1adbf62dd31so1176948c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981931; x=1794586731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=hG9varOWFRVuV6LI+jW10ZhVS1RPXr+sYEnAs3cEGaiueJVRa5q+eNCwBCU5lUi4bX
         onWnntWlKYEVvtNTHV1XkK+/2kpWwuBKGm4sX5rD+qDc5PK2enfDjAHXDmZhiy77yQ8Y
         RLXdE9RSpefZqCNSMjx6u68GwfvnqzTK5rgVQjnmJ42ROoEGt8PzocMT2T6nn7qR0E0k
         IkrqOjzv1hduUXuNG4jF+fkkC/rlMSacJV2OazF4fGeDnBD32JtHlzG1QspxO8sPo5W4
         R6/gP7tDhF5Tf6hecup88uFns/VLVHKitk2iFJzBF96PR5VLCo8eCmYQVJ1Xx37/OC5M
         Pa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981931; x=1794586731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=mcEfYbT7PpXRRLRdHKoe+Ayx1bTCdCiA21iAm23JUAX/2xx8m85AccIQNxCZfLALJS
         HnnAe0EiKOMy/tmJrIsCqewmTVw88tCuSN3ML3629j+i47fI/nVhSYwNJ4Thf24ZzNPt
         VTLXUN4Ws6TTP9CLL282mTENv4Vocjlhjy6jnsHky6sjF42nNvnbIHyI0WkcRQs3EU2p
         NDFWhw8zFeX75BtpUmGn0HcBJLSqURY5sqBBWxbEkK22h5iZc9hu6xoudeR/mKg4gajD
         ltbU7F89SHAEKoH7S9ncDoesi0zE5a2d8SKfO6J2YIqHSUiqrLBT5XtAMG03dwdVZdKN
         y5Dg==
X-Forwarded-Encrypted: i=1; AKwUvBy96QEFZAdgl9k8jxEmMNhKCai90ROqqKXz2HdnsbxIL5hCLv2aC64tmCQ6T0q/JoNCpR7ME+WSsW4AVdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z97mmwfXGObbYrtJRAN2isaUIlktNC3vQZu4YLbLJpOcXaU0Xd1
	tEtB61OgVeYlGjSXVIVqmiACyqVv1Y1CTb/nC8rBF/DkvPWERVz1APP6
X-Gm-Gg: AYBFou0raYk7gT5CpKvKl7gIB6m7b9flvYUjiomiVZ8nyRH/wESUmDGHBA+QDTlXUlT
	JN545cCOIlcCDxo4ttdl0FAJy8Mme0aPFAUh55okKtuNhvqXyN2Y6/+HoqYUFpPEw3+KmkSAZBp
	cDjRCYqRzk1xAPgovLsvgqDwojGDYYONL4S19g0uVye6max4Wloq+vsAAkWDGsyK6GxWbDUZSoi
	omjs1bm967+/FUV7pZn+s3yE4xaCFGX1kb+yqrdk5Q9ViS84p4CQzToyUS8QgIWU//VrAzZ+KUI
	wSU165TsJ3s3WaRHJhYgF07r+zFM730+8F704E+S/F+axdjS6rq7c4grsJv6jfPNg0QMh69iFFa
	Yelb4iS2OkJHVt5TTEFt7dKtzGrvtyvPDciuFbfatDt7jQ8PAz0xSe4ZIHWM24aehEuWQBQ8cG0
	xmYJ6HMmsH7u+ZSJYQYtDdrakYiqIMU2dMm/MNZAuoDVAmuWkhOAJXbrZCONiT/flKDgtJhToqV
	i5pFrorAFKBTiKCK0+wnIDIBCkrKeBTjTqzx7XqXNs9Z8l6maIkOf8NIMZDniQn/siLwBAAaPLN
	l25zfN4jyisaO5onaO6INEVrJ8TCJWTdM0d4DDh1gjwjblXJx6GkhzuUgSXWh+sXvanha/QKGpi
	MPv7toLv9EvgUkMrxYV1zPnenz6Zk+W3IaTBSRchuobSu+OU=
X-Received: by 2002:a05:701b:2505:b0:176:a225:e364 with SMTP id a92af1059eb24-1b25d38aaafmr3408405c88.35.1793981930826;
        Fri, 06 Nov 2026 08:18:50 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:49 -0800 (PST)
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
Subject: [PATCH v19 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Sat,  7 Nov 2026 01:18:28 +0900
Message-ID: <20261106161838.94308-3-mynameisjune111@gmail.com>
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
