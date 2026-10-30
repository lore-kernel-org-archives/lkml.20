Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338023;
	b=KX003uydnYV/4MZ3hC+qWtFJqkmG1dQZTAhP6VnXognpyi6ao932Hcc+YQ7JYeufJ+3U
	 TXoCNiPITNPKa3rAZCJq/88h4639SXV9L+mT++6aYRjqVyBjUK9w2n9rAHoGg8q5EZ83D
	 baCFtJaK7lzVKoIz1MAT+6ckHM3oX77z9Q4G1tpfzU5mEbZeW3jI+QHr5+42ilhQ4eRBn
	 mYCbgiEOKIbuvaB7H28qn0mZsDi9NNKxdzDVXJ0EpYuvE6xAEde861R5OKKtPQNbEfMJc
	 5G6EDUGJrjiyqUWUAXA7J32zsSYyNsbRkxRXUQCa63hSo6SfUrcqY72aVoxYvG/8gDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=WuYxmcSuBgJlDCsl4+c6OXBTtxtpqLqKqolZ+ljT2GOI2IKCkbK2Dr9n1NXxPfUKjJB9
	 PSRS/p+upmdteWBhHhdqjThD6s9d6UHcARvoTTMubi+Ferw6e30d632aLfd/pTp+oej+z
	 UrVzeiewGM3LodXjD78Gal2R/2bXEcdYIXEtie7vSbIr+YZz7RhvW7PHYF8oMa2D5mXUy
	 +G8ZSvvRXtYNw5rQK0UJvr/ywH2gQwsU6kNnHUbkCejk7qlIVixREk8H7bhKGpt1Sd7ao
	 MftfVYTelmAnIHpBIALrsG0rV15/k+DdrLxK4utiMDHEwPSIacff11dJp5mcofm1YuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJalwrOw;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483C606A334
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D483C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJalwrOw
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso107638a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338022; x=1793942822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=tJalwrOwo+hAMP9G1MHcdAbrPfN1IgBT4xsFRsooJsDGhT95P/+dyfMlnUAiuCluxt
         4OmIo83tg7+qN9oiss1N8GQPe1m2uza2Il5k5t9uMjYyeBM88EbviXPmF9Gj6OZyDwBn
         Nj3yeZZ9Hqg+z5RLFUxLc0k8FCACdZRj5wdcFn0W2Yv1u72+Izc8Wv4WykpKfBVNiuF5
         Yx09zR50u0/wgqbfKa7UWgawo6fmieb48+MBhV533Tw171p/EFq9Wj2TG1fpJFoWB1z9
         SM7zlVa+TqozoSwyO2/9lnvynwbKI63FcuKUyS36K5MjGVeOx7SLO7rvtgF7Z5ASwndc
         3vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338022; x=1793942822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=yGHWQtiemGKFIsBHq39BYoaBpUNFi5N1VucAgHWxlV7eOuA+Iqmor+KHxt82owkwE7
         5O4uvL4kL/IVQ0Uqh4pFvrhhUqhEjvsyyM+o/e4rDZ9V+ea9tNNANR8F9pP52L2ZZfcr
         yBeQQsg4Ce3OJClXg8yNZVShdID/Fy3/S0aqaBOFLGrzBipufx8Gm5JWlIomTuOymhEG
         ZXVNpZOOy/VBdO8yyvhQx/3Xkz/82StGhwTsv61AB5vnb+7mDbVsNDCBv59cCgzeihLJ
         hUjW+MLKYpoTbv/kerxNZEb+zQH4csmHEgClV2HxnGiQ9XRg6c28SUCXmxIi9npqZSva
         uMEw==
X-Forwarded-Encrypted: i=1; AKwUvBzCRrY0ysLMf32dDfxsPX6F3DuqB8R6PIGn9gExbYqLGwcCY3Ab7OGD3aZCVBb8mNqSEItob86DzuQDXmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeVhlVAgspnnSoA7cbryw05SWvoXCIFyJKWIVgcV2Tk/mmVBNi
	5tsiBlYKzFoGiRzGKqL2fKgOxWmK+TruKJCT6mj6nZMyl02C/N5Z1k/F
X-Gm-Gg: AYBFou0+Q8NpdodtJf5IVN6nKNO15wZl/leqIT3fmBnWQ0cs/+887cFO6lfmcm6Nnat
	N7KgE9EADA9LAk1VjiRWXVlo5KbxZU7q9/lI6SoMW/OcNaxGU9ZTUAhi64sz+Uw7z1B3cLU86Qf
	frD/R6MsnOrI2DNcPEnJ2Wn5Sd8oPVsFHsMCcV2BJ5iUHDHGCxeYd8e1VTIY9/SRlV3VSwalKK/
	FZwE2CO9a/9SIRQ6inj+SWuNTWlRgqvSMzv06uNHybg3V2LPzC7OlX+iD7xEIcdRVZmR5dbFPlz
	m3Gx6QoqT59Rv2eMHGhwf6Fxbu1bEGt6xnFdjtksSvSRLpA6h7jLrNv0cpuzUFZXlhBS/bam2Jp
	RDW+9T2JjYz+wRCZ51MieRYTQqvhVQ59v8rxtqaOTL8Q3V3O+FDO6I5b8ArOsLcPHu6tpbXFUCD
	p2L7UmcliRYw3cjzoFPaUymxTHoYo4aLAoVfzsGuVW7iNKkDqrSB6JMLdqfavGfjBg4ilNbRsv4
	KMPgoLpZFrwUlTCbAQFjpk2YbmegLzWbnW3EiGSJ/c9ttMnDShzLQxIwrYmB04vprsUakEBE+QC
	Hh1cPlkLE07BeinWjiUIX+AJLiyiNrGfIeFCj7Lq7ZPXkPTWk8WOgQemeUWNUkscE/zStvIa8H+
	EZTP2ekBUp0LKgb/rIiBgOBZKNCeFeSCsnnpdC6zCWFHlzGQk
X-Received: by 2002:a17:90b:3b51:b0:3ac:d19e:85f1 with SMTP id 98e67ed59e1d1-3ae897dc967mr988753a91.53.1793338022165;
        Thu, 29 Oct 2026 22:27:02 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:01 -0700 (PDT)
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
Subject: [PATCH v10 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Fri, 30 Oct 2026 14:26:23 +0900
Message-ID: <20261030052629.27742-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
