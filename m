Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923617;
	b=uJklLkKrXUoT3GELTyEJdtf++iKG5N05B1LozGgfIlnfbmnDUL72sTKTOhu/LAgfQfOK
	 dZzzPNxuFNe94ifrpawtiEOr5vq6xn4mo9xw8FOjaBUj7KkUQTdZFplTu+WREMJwMGi2P
	 QOAiYvZggBba3pTjOceV/mNxLqCQrH+DYa6SjkB8x8K0s/9NwhJ6i858NxagYaxgYkXTA
	 /uThiHqH6CBoxCm/ID5HOqBHIM+J4ItnBTf43seoq2vNADwxJwxaGkWY/m0pobpeZA5c7
	 PMX70lEnBx3YsNXuHP5FN8R04y30pU4hdYJNTfh+EoSHk0dud/oFkOdUfHBBpBG4XmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=N3fy7ES05IxVGFBfCHyLCphmRRtzoemkdV7GwGP4uLC+v6fk6COum+5WN2tYiZ8Yleoj
	 hHQsDNiuuNkxe04RqLck1Ivnwrvi8mhnuGEBcYmDvuCLEA4ftZTpDEA+q3SPn6iO2ZYqS
	 SKBx6URQFmxfYKWE9KofTt4tkbzF5+mJ63BmjaOIXrKOkA+R7O1dTW3qnnsghL9VUh8AL
	 e8u68CnCVR4DjXlNBe45ab7gfgeOv7dZK+Idna6ig/HVVrGwOlcWI6wZv5UfiAJShTrEN
	 fHIJqTYxUlGxOLbJ9FBu2JCVLYNBt2J7uRvf5TwoEjYtKnkL8WS0Ud9iw+xXnhONnWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKIPV015;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11884606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11884606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKIPV015
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15dd124bbe7so270659c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923616; x=1794528416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=TKIPV015QX68EFJn4+P5vo+8AJJTVzCEXwrQpRqtHslgsG0c1c7uRhofueORAGg55X
         a18LTagKezCVYqP8/bC5uyxDqDtHPpkY7j/tBSAuKvwCkUHrYhKvqqCxz9ZfAiQCWJ3r
         HoOP80q9UXmOfKvq1zJR/Q2MSumiCLuEXFGWJMtZtEPZVt39YbFzPJud+XDrSrX41j1m
         VvRYndn1Dpcd2H9ak5LYQMTbj9QUyL9BVCmYKJ3NJ08HPHD/H+IDT99L1Yo7bdm7OTo7
         SNiM98gyTE8WDSR4pvi7gZ85zH5GpwtLC++Ar27DeH6gvas5qzeEHGfXmO3l1LffXh0j
         +5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923616; x=1794528416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=kGy1GeXxk8Co//4S6zFpUOC5eciW/OSj/t/RLyVeDnsbc/KBCeairbncRbN5a6hGfv
         nYfkgV7JrGR9vwvxCFN629q96E6AGqFw2dr6lxStZ+BkxMl1lFYjHO/8C0qoyEMcbnj/
         Wi0BG0HHp3bAxWM3w1Pk8v73zbRxuOlSTuONYekleVa4Eiy2miMUiOAzchTIvRiUcb4h
         YpkW0xQFevggNohyl1GsOnBdnsZupuhHaAXMIphgWKDk4n6wMKDr3P7LD2U8GHl9UA7z
         b6xvvVg6JrBwTtqCj4n6zHLubNqKZXDHJT9k/g8bmsxLkZGyxDjH7sFLFFtolxUherTQ
         XWEw==
X-Forwarded-Encrypted: i=1; AKwUvBw13WPlul5YSPmbeaHHIXqSzwmKrG1WQBjCuY4EbEWogKSxNsk/KOG3pp3p1xzBZEeqLMoU3M5a0eSl0XQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IpX4RtRN01JPeSAz8TRGoNgsfaNYnb03/CRBi1tYPnLarns2u
	Lc0MXQUNaiYOX5594kKkKBOUZxYvGKqbCmhMJEPdSdBA7kYGFIM9AraD1wHW8A==
X-Gm-Gg: AYBFou0q3e4RMzPRtWzLkTiPKsyUB+5RW8nAnOZStSaHFipxE2bnNxVhROi4y/Tu8Yx
	pEDlfC/sdwlHbpd/WcDEZJ79o+xmKW4II+qj/HThLLzl22r/XhpPHrHgH3y0er3NxL22QT+xYiH
	/3U8a5o/rum1AH/rot8C7ik5SsUzW3xqbQ/PTBSMcgBS6nV/HDv/pSi+Iek6JZJvcMnWfW924Ht
	nZMmXdXEVz69wyZe1r4nPDWMfd0NLt0Apfo8oHiiLMLFtvAKY2ALkyt3HUKulIO1oNEC5EanvIT
	Ajy5lj6GF/gWDN9sG3i8jgE83vZ7ScDN3gkRbh2RnMKg+6uQ8gX4qrZLA593FlYO+tueeD3WDag
	o/l1yrAq1ZZSoS4XnRZKMIa6GEXROcSHNKEISof+zMaLHMQFGNjUzKiGIe4MUPEj9KUs2Z9Ir/W
	Mw8HFaF6P0ePkVJf9A2Lcu6MwDYDy+CmTMqFajvRtomduvoKqq+I4Vmdg2WPIwbPTcgqqA+j9mZ
	3dUzU0FJIqMOnj7Z6wtb8f+uL30avS06tohi3b19ZpgUFsE03Km66Iz9uHrSkZavGwH/7Pf8BF/
	GqtHiairOFzJB8Tf606XouD8xLGtFSLSAr4S6s+OhjI7HbmpOZPoSviEv/KtcJwRJTu+zCUqllJ
	T06C6sBOvQyiBiIJ+UclS1OW+wsFC/Qw3eLiQe2eMDVgbwEk=
X-Received: by 2002:a05:7023:a8a:b0:144:de98:eec1 with SMTP id a92af1059eb24-1b25d30dee3mr1114593c88.11.1793923616042;
        Thu, 05 Nov 2026 16:06:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:55 -0800 (PST)
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
Subject: [PATCH v18 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Fri,  6 Nov 2026 09:06:34 +0900
Message-ID: <20261106000644.20460-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
