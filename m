Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412566;
	b=bTEpV1m0R13nZ8ejF4y3jAsI7adcmhOFqUAGKkMuY+dw8mYiaajNzYIzcLTTEnnzDecM
	 IuRL2t5OVf4GvIvwmTE4tZ6FRUf9go96E7vF7dU5kkgsdqXfWYRaTIrk/2ATfeyGMUDke
	 5p1QuO6XwLTYBVl6WtkneKIiOsEDBcfDRDp7XQTYHwdIfoVHY+AriRl2QjjoBNGNZano7
	 N162Tz/NW3pfHctQYEkYdqHUV3q/JZCReuF8ApqRqOZ76d5bSlkmkI6uypWemwCmmIcEQ
	 ojoza1w3j/N5hv03fFOoE5imgwETghocZceurxQHXJB8W1qzjo/s8ez8UEze1kcNFvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=C+y6c40N1LdJZtWx7PVfn3hiPjyLM7Ui1U+LJxCUPuqOebOswN3JrQiVzxR/GmFWS7D+
	 Y8w87hJ6GJOrOkldXkFSOoYcUoaEOL72ZZZvtPLAH0uzP3PPi7uzWskZ0u8hG6N2+GoiH
	 2l3qpo2eKQdGQ4EQ2AoEn80AzPn3Fa6nJa/S2y8rKCDnndcgMYZ2cZWXgkhh1ToPNO60L
	 gX7KJLy4/1QzMFfTy8WQ6+0RlehaHoTIiwtsUtIQEcLTMd9DPiiBr+PVJwKf1X9ifstVQ
	 VeFAERKRntQouVSuCjdtT890OmptBwVHE3tKSSBBvtvmJSEA6Xjk4QqyT7wJKXMsW/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FftBoeWM;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2651606A332
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2651606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FftBoeWM
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2217889eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412565; x=1794017365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=FftBoeWMKrGJov3vr943GXnzD5UwGoMRdcw0WG3QsWb7coV2Vd8GP5g4gavePatn2Z
         iKktiTHSMczlgv5VUJNmaKGju21HvVOMj+2drbJpc4dPv4EWrfHuK+N7ZblsQVFnXsqg
         2IKiNcWfqHMk3PNduFEEIhN9+5u3+dqNZy7zD/4ENqseyHTZ4tn0tM+ukk695SGgbqAT
         +IdjfaPrwkaPd84Q7y6sdEFi7Zm7EgzSvCPHcAJqRBt3zu7ZMFCa/9clMXScXxSJBqD9
         FplLe4k/doPq5GCTrXUaJLkxKLPPYPUp/ijUq8EdVGLvIWabtrLLFd4BDiHzniKmx7Bi
         9eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412565; x=1794017365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=D0vH9M+OgFelrMIllWbsqRsZLGNRiTopAzVuXJ5rrrOLIATOIROkLPiNcI5nX1KPx7
         l7dWm2wM0u4PuoruPQWNkB2NKuD1edv4KIynpQ4W6XklrlAv6DNcSOCVgrOKffkghUhv
         qn5UjTLUZKEW9j3Tr7DzLv1+XCjgByyXc8dJt05SvXdt3ZqFt7n8yFLYYfdV6MjrTwTN
         88JvKdN9QKf36L70DqhKXpiTPiQdhIuBo5S3lX5bDqA9aHx2Ol1ECouNCl2+n0Zh1Xx2
         4/PveDLEdfzFilOpF27RJEMnx0Pu8JWOsk8aVB/wl+kJLhjpMtHm818ekBBTpa+GuEr9
         dH4w==
X-Forwarded-Encrypted: i=1; AKwUvBydbp5hnt29NZknxEUH/Uv7QL4cRK7Q3LiwZHp7Ss6NjeVzO0VX9+o05V4hdvhqzfeg2p17aIPSAt5QH68=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9teAoib0qT6bfRcUWE5eLbSiUecCP6Sx8pMiaZme9cRJHPiZ+
	BQBlDJo1wR905XOpYkSVyW+qXynlNAk0ppOT/oQLR8/U7gvzLuV4Cowy
X-Gm-Gg: AYBFou2Z87WkZ2HGaQYrDEdYCqI3xRyahjsgricaJSH9c7iGk7u53xMx1NJGz1aHWSk
	dUOOc5r7T9/vcNLqw4Ctx4X7NZ/OVORlwUTYB+0XvQ9b9zVyNwyAzVHkXfU21XxQqzEct/SvflI
	Lfp7aZHCcOaW2nqm9Ok+YmOw3N6mcAcEVAXiD8a0tBaaRN5bbToc2j1Hij5iXv2Z8guq44a70zG
	TC8cxz5kbgvAC2T4oqnWW28z4MKGSvRIGK3NsB2H5DXr9zd2jDAedj8BmrWg/YrZtWkMJ/2GSeh
	Z/Q42YhqQGcpKasxKdPNdr8rk8OD04tNRDgnBKQyQ3fPde5Uif5RmkSvgNF1t+a98gEjchvSO1U
	Zc15uO+NG3/QZRFipIs2dAyf+ZXj5Sh1mo7jk+0qtyctbrc7e3CpCXvhNJQqeDVl3ozcQ7F8z0p
	icnv7W8S1zaJI8/tVHvoF5Vytr5HYeskhrps5U6kDiaFsp510KOlv8oX+NFaEomrnkQhlmaZG9J
	0TmtT4DiwhnPF6TdSUSrmTrLO6/aN2fErQx5jvNNdQuT0A2Eab/K/KlAVQK82+uhsWquIsMPPOx
	2QQfKQPLuamuN2GsccE6zIjUM+pROmI+BU8JPRRLydPtUfUYhcadOl9uMGOEpCctPwK3oFD8iQi
	D3EEjP8C/jW00m+cAB1wym0NtpTVgwScveKUwdrS+WXZIug==
X-Received: by 2002:a05:7300:c00e:20b0:36a:2289:c599 with SMTP id 5a478bee46e88-36a4243a674mr7312950eec.29.1793412564948;
        Fri, 30 Oct 2026 19:09:24 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:24 -0700 (PDT)
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
Subject: [PATCH v11 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Sat, 31 Oct 2026 11:08:49 +0900
Message-ID: <20261031020855.2402-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
