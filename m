Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062075;
	b=LIGwCT5BfvYpSezXkf6nzvhcOFUa9r1O+gbmAevh67v4/M32sJJPVDg6pfPuMjDZwJ6g
	 UOyMZsA16xRQ4czmHy6FJGcLMWg2ERVx/EWdTbQFekxCbrlPOav8HElwS0ukG+lxsSKQM
	 Q9vgiPueunP0Gz+u1TKcaBHo5NsGcWV5SaMoB0JwZiDtiH58ywj1DRSQtZBNFin/kel4R
	 +yms4b6EoksTJp7gs6zjMgeBWaonsd+2KPxHMfCSyMAb2nLQvQC8jqWnXOtUHBjEKp8BL
	 WlvXmYLYT8RPAzAp+ERswvnuSjLZ+AvNOdKHgrBufvlPvRnGUDuvy2F3XKSrjBWNQ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=wbGCBZhET9UJh9HIydKHUKPmaX0qFVXCHpYfrJ+2XvRnisrrcp/yQCj9X8EFk/ONaw/y
	 ik73pab274MBgjd0P4zePEhFkd41KRP9V0pHAIemL5YegFfXZRKYKLbf98MF0g7s4dQ9P
	 yStI7ItIl0/Ds3YjaRotaSnjtsvfWdKRg8Sz0n0wXI80xcBo/F+WqmurWKxGh1B3BY8Jv
	 Dt3p3fxvj0bJ3UWprlstoAgMR/4yz67MGlUoKh6zo0amojOzLM8zF0IlW4dKwquwNMIKl
	 rs/vg8T3YjCFLv6z2GvG3OCXR1G2vgpmf2WaLRsVq6AQHHMlCT40GidBpiQ2/8GGI3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ohn7h6X5;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5C7606D837
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5C7606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ohn7h6X5
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so3571440eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062074; x=1794666874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=Ohn7h6X5HCgN6PCcyOM2avE0mv67HWNEtJ89d3seCgzLfeGvL26NSLFz8ESNHqGrJr
         oJknUm+IuhHB4q47llEwlRd3W4rYQNgnhfE+e5mF0EkgJWlS5Wtk50IKsLxtiL3T5jIa
         5gJG4PKQMgSK+dM7ihc3rClNsRCYdjEHdi2F6ja+nCZgzmoPmwYz8CHUwkcXBAzNTCa3
         wqkYgux9zJDaebbtz3uO6zvM288xgnWNPfrDophZEb2I+3Rys8q68ACp7VLZ6W3nhuoO
         e6VxfnpvfAtd1lrylodR4i1ll54dvJRvwAUnVNtFB7FPbOlBq7ZKEJRPp36SKG8M3+4M
         aD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062074; x=1794666874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=wd1Kum8gTgeghWBUcVyy1JQLZxVXpLmzD0en4y6ED0yc+suFVL5Zak9QlpK2cNhjdE
         rqUdnJ/qLxSI8o07g/wnoJyn1kJfx8mwZXY4Gzx9NEideRIGyGpHEdaOKCLh9ntCWM4E
         Deh7H1rxRNJleuWUTQhEjwlomcKyw9rqnWIFwXKprqTnRgLZ1qjXyX46ffEh1yxHsJ5M
         20Jl7Lb9pFAuM2NCJxLg6Gbw/chsvrLFcOV/qie83wbU4SmXNOTNshkmEdTXgW8huqOG
         Ua5mGLupRF6BzxPoL9vbbPQucqFm0B9XWWo/rEgmysGeZsLJXXm6aYM6kgd1piKaTaTR
         p0yg==
X-Forwarded-Encrypted: i=1; AL+hErH4Y0TDueFRme/UQ3w7Rafi0cnbHFqvuVgn7vJRyr6oNBKWxlRZKd85IZGSIAVtUEhvncIY74ncDN9xTZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h6iZrYxXhuMStPeAhTm6GRA8KYD5SQFsGS8Z3Izxs+65yzvE/
	tVJYzQCSsUj9NP7N1akNYu3zvrCnT1dgHSHOI5lFv88MyfqfUXjFOj9S
X-Gm-Gg: AYBFou1MnN72Mb9u1m63I+3M6aDc2W2OMJZiyMZh1L5EuFBqnIsS0fYc2hYypGzcOtu
	3kTeUuT3wJoyHHm5g3JZaYsmrKdmvXgLfzEiTVmbbFpgao/Vq48o0lHpPwYULLmOGWGZKmQpFbH
	HJjZPXW0uNx5WBi4jcwTfK5JcqdcwGw6sEMrrbB/DJ5fwPyZQZkiTGxeAgp6EEoDdyPVgXG7105
	+7MNCiRVSWNLB59qBrwWXTK3gM59qbBS1+1zv8wLMRvv3zNxZ5MzZyNsLALrPAtzFMBmmz9XQB4
	dnpCgxGY96URalbl2JFmo1dNvR1WjIMOcfgTYi1Mx7ROnthSfrS/BMwk1R3Y23Vk/x/cqey9hON
	JqjGVlHW2zj2aF0HpBsrv7KfiYBoNcxprjHJuYhmM+t5brbawgPT7rvVdsWDoK/KlVvK/HL0a1q
	+NtWPR1P5PUlQcGBxKno+kwmavZnA3jeI9GEF9sFQgs0D2eNoZ5Ate/RQhx6TRp26JKtEIH0flu
	Yfr4sJR6sadK4hDCDNnqPJ+eJGhb5WJGgCmbkY0u4AS3wjADUwwydStzsBhkXR5zo7kPsFGqhSp
	qaE7LFnX7Bf43PWm37ilQ/eBBSjyz6CR9R4zHbLxwdjXazHj2dyYr6U+LReOZAOaPmaXYMmoF18
	wPN29EC75+cYNEw7GWpdRAx5+O5P8ATQKUaZpERnBvjW20w==
X-Received: by 2002:a05:693c:6096:b0:36a:1b62:da with SMTP id 5a478bee46e88-36f75440a42mr9647838eec.12.1794062074059;
        Sat, 07 Nov 2026 06:34:34 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:33 -0800 (PST)
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
Subject: [PATCH v20 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Sat,  7 Nov 2026 23:34:12 +0900
Message-ID: <20261107143422.29319-3-mynameisjune111@gmail.com>
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
