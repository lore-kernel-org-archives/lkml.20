Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355557;
	b=W99RWWbh64BhHZUbrNUU0x+kanrMUKngfyq9ssCcbdbT4A6XkNYNr0J+hsF2DOc4cGWM
	 sfvgx6WdDt2iz9Q8NB+vTC9oK6/RH42ME9cJFMegIgfybxwz478O8Tm7l5FqCvoUDFYnB
	 4G6H1+Uti8p5/GapK0SXTozfu/LoN+UadW1gcl82JOJ9eWrT9Bb/Z7NFtKNUqdGZFvjTU
	 qBIdwKbd/lgVaKNZnhghsPwRcJSF9A592/MZriFwlXqOEFGKkOHG/iBkw8GeofyGpaNKh
	 yAe0oPVvyUDkdG9xaWpUCRXCvLsUrDmXpFgf9dpLtfn2mbRyKkbG2VWhKsc24F+KudQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
	b=oWgjFZbF648Y4bKqi0D0who9lpT/nkjssvgnMACTkF9pe5tllBDXPhdn1YxHhLAFnA4G
	 ZOQE6dn0HIaO9dnSUsJRKzITFlYnjD/YI8Y6YPcIqK6ZKM8TsBOaZ5spUW88GGhQsqhcD
	 o6M1ceJ6yWySyYJ4bHhT9nwu6rTi70D/avBPixORhxehDduDyDIdoWzkRpbAU9K9Hh3bx
	 H+73+3WkcDUgVAtlDW2xiTpfiULUQrBK02R07gEmTPo3RR08ZNF0JuuSXZVunj5LEjuCP
	 UOtAIOjCyQviq9e3mBwdRHci6we/0RI4iTwaIOunWjf7K4n5rZvChjpNSfuORBukYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLCiXCou;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819760A260E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D819760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLCiXCou
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1820131a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355556; x=1794960356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
        b=TLCiXCouxRQsySRLF4jYb4EARhU/XvlRWElzYhgGKvt634MXWfsCR5W2qWiQGNiB+S
         RByd8Ib5etlaMk4WuH639pCCns/bU188ErMFjtgMAqtVWTbqk3r48R/1646DasJSB5jw
         ALYPokjYhOsLTpUots+SFMfsXC3scwrf+P8VTj1BHaUchkpLryKjMlyEJr1jQaAUI+yy
         Xgv/2uW2w285W7hzy7xRdw/hkkNtQtGNoW/kTd2pa50+5JBOcd9RGfFW/60wNXxRoHE9
         WGOOyLg4/YMrGs3aCiNp1Er+nfhQYFPOTY3BxhR7SOT6cCAU1ARPK/BgqxRjRzV9TfmI
         /XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355556; x=1794960356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
        b=NyxlBSm4bLZ1IKGbQKrLSG3FnXuUlc3i/eGwHkRp4+e+FYQrVHBHWvqiK/V9xt5/ht
         5gNY6wUh/ZEHMBZREeG/dG+SDZpp7cOFkuMeai77qsJtBY/ATM6CvkVak8hJD2GEgmnB
         Ci6garu2hzT6+IFt9JYtlbKUhjQdVxyxaNjk5ysMq4hD5fMOCLL5necn2R3mONnjO6q8
         0DTxZN+5YZ60iq0vrEraq7oK9ABZ0pfXsMS98cbwRnur9bc2AIRif+dsWrtRbj7JSn0r
         EEfzkGc9qATozAWHLrT4B2Mf5TmKD2hdYh70/R/79STPpcTYBbPFYcpfp5QxKoBnApCe
         hBrA==
X-Forwarded-Encrypted: i=1; AL+hErEu1kdSbrNIE1mEIF01N82pAqwCp7q0VSJYVGMQQE7KX7RXiy07N85Igw4Y67iN+qas9sWDdZkqtKNH8SU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i8VkFpjkC9ItwQZs6DS0xFqGXwePABwwo2bzpXKazXu3aaZ+X
	e8pMe+J9BEKiBHAVPfS/jcr8OsSTsZVvUFTEsnxARgbqYa6a7LNkOqHo
X-Gm-Gg: AYBFou3yv8XDJWjXJCnShU97htAyU+/oK3Hm8fH9oXBH95QMmqzzeuNRj2CrkiicYqg
	IzCNH9p1G4DbOfJBFwro9DrAKDNr3tSEuszE7qe/idozNoTG8mR4fJgttfOf4kSF+ff2TWRMYee
	8Garx0BpXgbdbC1+npEW3/xMylTjtY/L1pxAKjAXeQikPK03HbHKEk4oODRXdDB/fiyL7tdaNSQ
	69N4HEDihbZu8t+MvCm0spsFwxuj4RRTLWWz7OaJ4y5NArNgErYeK8u+5idPnevzWC+OKG8JcD8
	AdBzwmye+ATWmk+oZDftWv2uAHAfadV5EvbL5ihqVZjjyOMb9ElwVoQ22HSC4oKOiVhGNEBUanv
	CCs54bIWCkSwl6A0+X31xXpYRsbNrcXNGvUvu2UZtcNGZSpPNfAxEAR4hTeC1DB6zt3jnzXrDkz
	KQ3uaxv4WOAyFHiV/fbI5qAprskwSSoY+rxr0iTn/f+J6kn+FROKsGDVA62qWLTeLr1eXaPQFr/
	0ABex5aEkx4NjTq8G1JhaVEWJbZRt7QFye8ndX5QdSVhNadVFAYknCtLkU35r4DQ2KzV2lg2Law
	52RRYlxeXDy14g/oMM71Gy5QbNKXi5g8zX+216gTHK3JJIDXTVFsszk9v4wlwyuE1ZmbRRx8kqw
	oqDuu5xQlei+gWySkpGT6Pf44poNSNFRBCNOoKS2LXgUk4UM=
X-Received: by 2002:a17:90b:4c:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3b182df3c21mr660693a91.9.1794355556265;
        Tue, 10 Nov 2026 16:05:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:55 -0800 (PST)
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
Subject: [PATCH v24 02/16] ALSA: pcm: report partial progress under the stream lock
Date: Wed, 11 Nov 2026 09:05:29 +0900
Message-ID: <20261111000543.28550-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

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
@@ -1919,6 +1919,30 @@
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
