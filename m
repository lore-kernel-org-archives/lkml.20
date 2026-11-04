Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758681;
	b=QqGrIftF2BxmSdpE/rjMeM879DlXSF86Br6zbOMEWYUHXDplP/OzBwyjkXx/FfyuUr6e
	 dzQbIY6LBFmqDDfIy/OyNyToGqlL2k+5zpo3KkX5VSkAVAk0N6nsnqcMtqaQugNlN5NXh
	 B7u/VdTwE+Ro91Fk/R2nM667vG71RhmUhZnFE7/KSn38IBO/xpt199up76gPvcUEh7rJc
	 0YqB6poaxwPNBmPAPQbUtLK1/F39BcXCgsC4LsGfmPSw1Q+5wLj4ZAcQgQnTKhwS2BsKD
	 R6NIGqioHYXlvTH/dRGSsSXNPqunmEzUxcu/5q90EsUZznJ7qlxwYUQi9UyEtUqyKjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
	b=x8uvGpgmBDe4wHxVbt8QGeA4vwkkZe4HLqQ6ce/OTJ660kgUMM41S1Fc9gh6+FEcWVwk
	 HtZbIvzyn6qufuumwzm+cItxkAZbonrahMFlGZOh1xQD/LtOKSB36GiVq7WVpeGMys3b0
	 /1oXgTLYA5AfsKMdgjwAbzVdn24BvxmSmxHCgFvuJRKADh5afMcEjU60s2H/MW5egL0bb
	 nMjB+as4D6OTAXuG8DjWXBqMVUBlR83c+2GCLhgyTYHNuyHiaL4CpVXO38D4UcHNuWTGC
	 qiFJ/EjhSQKQoovpiigWZ2xGX8wWXpLVjHpqb0dFAH5hXc8+YKVTKURshju7Tf/s/GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvwynNCQ;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F824606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F824606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvwynNCQ
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070755c8cso135881b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758680; x=1794363480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=qvwynNCQWzyzbn44iaEUNn8gNwqbltYPcnY5DD4n6jcmpA2yK1rbj/naHt/mbyUbpt
         gOOAsmFZ61NojLVWyHKJWJPBL7MI6VcPF2sJMSZ/fga/ETkKImCoe8vAhF3vUEpLxRmn
         MloxzrC1jDXDmSvYvXGO0IvcTiBgkemKfBJJbYQKt+dt71ueEbE1fBlkpLiNfbbnTzmv
         uT7Z3uNF9zgnv9bP+VCOSueJZB/dL7eB6Zd3aY73lBttrO/afM2voooiB9NW0+7vDu9Y
         egfbtkJd6oIO2I1sT0fSRSHYEn7HDxA/knjCRAzOVweubaU6+BU8FnrmYuqqgSUcUeC1
         LSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758680; x=1794363480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=EYSuH/0BL03ewdBVb6IGSxM8POW+R1A9jOkSaUbBgBJQ/h5nc18vqZXphc/HmUBMGq
         Iwv1zpKhA51vEQcOERJO7EIhxP9fVWmcoDR/LQKnIk+hYWT3qJj/z3J72up2zS5xpG1+
         fWZHy7ng/WzzPY7E5hywiaIv/g1b2xqJfpcKRspdNksjJnb0rv3IcTc7m1wCoMszolt7
         NJIioaq/UKwEsZbzk8y4MYZpYpU8wjD3GpSw/F+Ml/dBLHYpwNBYh3C4LKe6jYaTeYF+
         zR5bravO0qmMtQVBOKCr3JM7Ry6CYBmatbTN5wauLDQdLA5oWvRHQqSp9Yc7Tgib8OmL
         xDzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKZOOo+PcGqdEr9wfY7kcaDh61U76yPcK8JYxgbb9MBHTPbCerE3qxx6i3ovQJM4nzwbmVRWdcdkRhaIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KfA60X+xMcdj7Wp14i4uCGWa7tjPojcoktMJ2uv0/gbeks21C
	MM9VVkEDWoCR7RGoccWgQUnCkhNgKBBwqi9t7DbLBEVDoA+ECdgXQbq3
X-Gm-Gg: AYBFou1cD7mRp+e7YB/PaxsTSf/ZIZLGt7OaIGp5wXc6+RiIMe5R0vXk17S9SZoHwWt
	+4I3/i2tYCCv3cReaQvKodYM21QZZrIcxze83dSMpiMMBu/UdGb2BFD9+sndI0leei2uRtCt3Mu
	yrv+mfmdfrYyGdPLL2wBDSApxC/OmYzzjZzMEKWz8ZhTQEPmSaDUuhiujECVq3Io6/Hl7BJ+Cgv
	HHHG2O+3Sdw6HdsArU0uElcl7WVYnxU4zQl7ovosijUkcMoykVonHVEhjCVfkIEn/unAZHCxeUk
	tY1YvceGsVU5E29u8xHRXfr5nya5n0WuyDNrzMc6gXTqueQ4hOWd9YpxA4J6BiuyDiW0I2HIi/v
	m5BoXCcPvz9dOsG4TgHxjD5Rs84zm9DZGt47tG3BN+JZEt1ObLSObqMvZ2HWrBWuoTfvR5bY1Sx
	pfiWva6VbKzr5GBlji6+rypS6Km8k7b2LkQBmWjNNPBKg+hPfKtvETg34j5sSH9y/Cb3pYq5qcl
	cdmWMbwUiMO/XUn4CDpI538oN4bLUD9idfT74XR+xy9XQj5n49jApEAjXgrxsO6cI3V+LI7YmAu
	YtsBAxXqiLqq9Wra4fPNkKNXnURzwoi8pog/fDekbC59doiAq3ghOX7vQ8THJJFADvU598PzVM6
	uqxfVwPopcrCXsfCoNYN4g63TBl/55mEVjCn4HoGGFk/11uc=
X-Received: by 2002:a05:6a21:a103:b0:3de:4fcd:f9a5 with SMTP id adf61e73a8af0-3e928d553c6mr9724186637.41.1793758679552;
        Tue, 03 Nov 2026 18:17:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:17:59 -0800 (PST)
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
Subject: [PATCH v14 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Wed,  4 Nov 2026 11:17:35 +0900
Message-ID: <20261104021745.57733-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
