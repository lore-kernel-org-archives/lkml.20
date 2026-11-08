Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182115;
	b=4DOhOHKNIU/AeAHTyDwMrx9iJhmQSSV9W+8sGgPRbbuh8zS4OFNGNMez8yfczDo0Kw1Z
	 9DyilXhAHSbS3zvGLVdwttnnXUVShUqjrooW3pNl2PPRmvG+LAmbw1TLhOYGb/Yq+qEwv
	 x6PvVHYswluvSEdZ7UpUi76ax/FYmznYkNKFl+STxR2K/PIeR/56z55qR5Xbs7uWtbkE1
	 nUpGCPa8H0tinF8rxv1xwUM5XPdUUUo+rq7/H1LnIqjvkki9F4n9oERVnyq3r4tlgeIov
	 jrlvfCO2KKQElWvCpabiHtuGwLlW0tq5UcLVfCUiSXh1ZQcEu90FkI+tEGPl1qMHrVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=SzY1EH8caatsaiyKA0kdQ3BdqOMtngD3Pq1AHtsohOyKdiYSwaQ4sjEX0ROmhkbYV8rO
	 66dkgCYOlDAfGsJgCXehGpUzdHKKAfUp2hKgPrFg++TgpfT27bQBDXDdy/N6iu3wCI/Yg
	 4awR/N6lYaaRmB//TxY4my3j1tiassCpJa6nLqkrs14n/xMuL85bSkjkrLRUnkj8csFPu
	 BcxtEnIf7szZeAi0jLjQQi3fD6EnMV2wcj9bJE4cOTuEpbgbzS6JkXtqEoAy9mNA328nT
	 pzr+qrblewqV4GRQooc+FULZY+CPQX8WU6NkEvykZ0fo0DaCllWeth1lGtRjwnmMp9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBIczwu;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9311D606A337
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9311D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBIczwu
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e987b4a710so1362785ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182115; x=1794786915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=KZBIczwuLkGkhh8jOtFgXeYfwkZdQ1LFnHavSzMhfPHIZq/O/vzePbTmIhhSjCHqcH
         fcRvmWKFvWGt0ot7/blINy35dq/XvsSXPCnzieM/BG7cWTxWf5mRHGL1z7tw7EzjnpiI
         Gslrrc072qMkBZv5oldz1diYmgX0GhNT4XF17lpSOfWLmx5CQJ21zr9GJE7XxNvPXMv2
         O0KukkwKNkGQ7ErDczOigHd2d3hKlcukilY3bl7q7aemWaK6e4+6Bu7/Yg4Qgz0QamIu
         DNmqR6IcSR/1IqZECcXPaV8jPmsvrBO1hy5wmC9deeppANk77/h/7fhkspVd0Jhi/Nra
         zWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182115; x=1794786915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=TPO0W79wwRZa2JEJuXhR5wH2L2feFMir1KxSiK89RyViQ1ztGIKTld/vdlUCOz97BI
         dF/JEYkyTo8SZKZuIW7rGiYtpHRVz1t5DYjvdlL7MFSDMRGU66IKRzzhvjdqm3PfF1HE
         MEgCbrenCJOOlTfwdEfoDH8xcHSyEEtOKvQ7z19jK33U3D96VsEpZfj2O5PB/shUYCoj
         47U9JyOU4MsaeZBdqX5ujNemctwwAfmz8Nhy6HLD5gd0L/ldGU4HUwJm3fzQnINvi1mx
         rUQ0xhBhWzYv+fGqb/N79e7/XJ/zxf1EhLuYEhTNl9nD8nspThJ39PA7le6gOFZH56HM
         beeA==
X-Forwarded-Encrypted: i=1; AL+hErFSkIgb26ImGG9wXofZZjLRSIsFjX4eCjQJNmTvYgEnxVoR4WnajUhn+TWp8UPaRWbgLr5VheMA9EOdKzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NVJMZ7fM7ZxsDpFgprJ43HsTptxmWYR4/05t/IK61i9kNXqB/
	ae1UikoAJAMURvkq4d2/sWDH2oJL0x+M/eYyFQh0P3lPZZE2Hkl0/BPL
X-Gm-Gg: AYBFou2PIYDWxfoM+F/ZF0+uOL9jBYKvAr6j46tB7fPp6fqFjwN1hJ+I3cdiEucZ97O
	Pgb6nq4FGvRNTnYWDaGaAl6w7lsFjzYHamuVuPsscEH9tn0hEMExn2MsWkriWwMaBpqfqcs9DSi
	i56oWEFaXrAKE9hVMHG/8Z3QtxU9rlzaTqoewKW5Bl1BcWOZMBnn3ifjtpszL/V+Sn4P3zjeOYC
	XguofO4Fh7KqXaSzF+3sR1v+16EML3ugKtPqY0LkDVps65ZLyYeTu9SLXyQz7ZlQo2QVyzPoKx8
	p1LAy4jwzfpTeJVQ5Xy8Eb74buaZwBJTYN4xEY2/yZ+1emtudAPFIiAzkgukUjWsgAykoKQX1mK
	wRNFqg2ElWbaH5ELP5CMyS2Du34EdZY91dNVyeh3rcyfxLxhTIuwj5LB6plmJ2Ip27HHfIdwbRh
	9DMqcRzvHsrkgnLVX21mTigkBQM5fFwihUd0ARZni+jCuRzm1zTw9rK0MW8obGiuHgLLHaGk18k
	FjMV9ZNzfmSiJMJhKXDf8H+AHH1oj0mtuEKkXp4dydNeJgQoqHAnZSaP7J83npnMDgRNeostEvt
	jDP65IEC4HIrcrGuFWZJXFsc4I8ndUevhY+ck31TXKmVXX044TZBi75i5zJtsb09qPyOch9ITac
	Ss7ZUFX9GQlNjsHCU25nLLdw65Qpwv6lS/1osgA+O1GMAHR8=
X-Received: by 2002:a17:903:acb:b0:2e9:93b7:23fc with SMTP id d9443c01a7336-2ed6809d0dfmr37072905ad.17.1794182114866;
        Sun, 08 Nov 2026 15:55:14 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:13 -0800 (PST)
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
Subject: [PATCH v21 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Mon,  9 Nov 2026 08:54:47 +0900
Message-ID: <20261108235457.12688-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
