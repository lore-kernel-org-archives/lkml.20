Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267663;
	b=s0bH08c1U6pNuF8nwzv/dHeeC/3z+0xPKRKHtg8aR9u0it/RpLTnlnIxADwQmJuWp0qw
	 +GzN1GF1fO4T18l40ZfuZA98N3puogxs6pPPZF/GfyCJSJN/4pM/nH4jF3xERsdanSCPs
	 8UFCvdTnFGgGAXEuwZR6wUEoKhVobUVKI0a0Au+Y3fQbr/4QpGO7T5qHHOdgL1zNOwUnt
	 fwsYyq0axrXbpMuafx2xQr2ksXw43NKLrXyCmteJ1Bq+23uILAC3uuimuSb99AG1jS2m8
	 dyJ5Tje1VxJaKboRNI7euHzydcEpIWSt4N/Xd6I7H89xKijmoocra+feNPjqfqO3uAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
	b=FLNHQEJTnd3Dpx/iHrLmz4CqZAYV4iSCdjAKrOtCWtKlGw99VgMXDFG9/N327dQ2kstl
	 GuBfEYQxfGe/yvwipMDKVN0Ujb2sSFYMJH9yXOhhY9aOKLN60AYOr2xyjJuywjI/TXZLi
	 /4YTwK1gLE907G162CMMWmrnswazvZLk3R0vwI8Jnhzq0N7+qnPnt4e7nlIYJC0RnAJiL
	 R1cLqgpVBac5JZrZYl7QVNyDgJrBSx0viCzHqpLMWqYLbIkt70FLwkCapkeNQihDqBofS
	 XXyf1B7P9BvYmGkUQNVc9Xo34uRiLqIZiXaY47GKP6hfmX23gztKglj4EL8tNvDigCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQlG78H2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1978F606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1978F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQlG78H2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so2320589eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267662; x=1794872462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=vQlG78H2my4XhG4ZqYO+LiSmKyKJxSB+VDFJjB8p3fCcjaVKLBbdZWXpFzRHwfQGNw
         GiC2PeRe2HQnrPpXPnQHPtMGWQxl1D84rRMBzVJqwIb2/5Wk0FvVBW52adlOFRsXg9dY
         kOSLD6HGzZbbb+cFyUK5FpurUxUoSwuoCCB1+apvr1Xc1AOFZ1L7g71jTKpTwVm6MfEw
         pifQpdCRyxisOYZ687883L4RBYOgd4yFasYYCiIVo6KdzEIsdkunQCw4iI7YL16Xp1S9
         Y/fHfvG8OuSOxmf1Csx2KxHXH/AaUcTsoFLnKFMXL8EBsf4fgLGkmj9eN0GyGjTts4DB
         VU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267662; x=1794872462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=kDcGfUlA7AlFd1I2HJEUosqyQL7FaZXrqKejiA4G3+14VkrBGj55iVO2XaLBnDsh8E
         lrkxBpn7DxSsiNfuH+iwTye75gJPwPwwAv4IHLzp/KhlDT7Lq5bVgatIZvV4aItRkWbr
         wIaAWLjnFdAkt7J4XfbuJCgYz5BMyxaalfqlUJFgwWdQW75TLed/rUwO3+ekYoJnvoQ+
         ucY4PAodDUxyQ/JdvEfIaDwWB4hh6k3/MtzGvGDTYSeWtbP4845efDWDUErwJbj1ucAH
         uGrh7K9sOxTMwHNvuZERJ4DRqA6201wrxT0mew0NeingYh8kwyYocpXPOsKxHjSpTCRn
         oQBg==
X-Forwarded-Encrypted: i=1; AL+hErGf5mVwsKofDammf8yTK1e9bhyyG8k0AXghwKggdr1jaciCsKtVszPDUmukxBb1uolTo52mvs5PJiu66CU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oK2Pomef1IoZVim4A3LjQ8hG/9sQiFWt34Wthwes2qEDzI+rP
	Ixq1w+JdbVOVWqPCYzrU+Ccwhg+ffETAQHSO1XaKw4YyNg8jh5hNuM6N
X-Gm-Gg: AYBFou1xHt2v3eKOu/KfTLTL/SAxOKU1p/v17Xk5EJB9Hv6ZJWsIbkbdkYhf6bXqy+Y
	wE+nCWS8nIYm0FB0aD6BYZh0Y7r/1GsRUFbHBl2pG5L3h5wBsNxwJ6FFhsmhOKV3JM2fgzMgqFi
	LMoAvpKeO2Crw+xVZo1gY342U4gXjFxVegZ8y+PjYCFk5Vat0RCkaVf1khN5qqZr0owaTdw2r+S
	kfGHrDGpEoStZ1+RQqYMRRwvMa+ST7lSYRy4Cn4UwosAW0ctOpdZ3Zw6StPyqcFvA4719Z4B2BO
	ijMcaXeI6ixG2ioLd7gyNvXslrK9PqfbM/ZdpOfoc2TX2L7a9RWyllCRViS9PxXIVHMbqSQgX1a
	iBkfAsUfTEOpj8nEAzRJ+l4kbXM4QqDNWznj01ZAAOrhD1piEQUHvToKqVmyV4zjNNxMe8q1483
	uYm9TjZEJQOPvsVT1fiRc6q345GsFyMhXb9A8TSUgIWdKiA1Fs/5Qx/KQxN4Hf0ruXNBi4gObQl
	MH504AUPMQcA3vj/fNA18Vg1gMMMrCj+wOROXvIuS4006evQfCwWk0ocyAIahSwZq3LRDlC5nkX
	RshsBdoLHpy/Gda5ajmGLlSvNi3RVquveGK/a1/0SF2aEXgXLiWkbrDSLM89Edd4o9SVcuLoKhZ
	gg87DWBKFtqSb8qjfojhzOswoaq2Ew5qTA5hH7RWse/F7mOs=
X-Received: by 2002:a05:693c:2a12:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-3751fb32251mr859755eec.9.1794267661936;
        Mon, 09 Nov 2026 15:41:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.40.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:01 -0800 (PST)
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
Subject: [PATCH v23 02/14] ALSA: pcm: report partial progress under the stream lock
Date: Tue, 10 Nov 2026 08:40:37 +0900
Message-ID: <20261109234049.79534-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
