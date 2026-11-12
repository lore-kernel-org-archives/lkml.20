Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444487;
	b=v7EqdcYL9t8N9LjgtQZ0WCNMkRFQLTi/lIOOf8XaSUIbRGdQ6I/VwI06qnI7MfUkWL53
	 +0EgXfZPRtaIF+u8LTm4zYTNUl7aX6vYJmd9yc9+78weNxuHUyLlYgLivSYkvzqkIhZCO
	 2999CL8zzDhZNNXJgGB0+1IrESMRkpO4D1SyVsUG5TibB6LzpwPmXHYRyFdHdCDqcBexx
	 xhb2cfChMyIEjCXNAZ+4Zb4R6ZTi8HInZfBj8zosOHEihaMWFp+katl+RQn3dtpkX+Qy6
	 4CP0voDNz0udj+UTdUoUM/IqnlNfRcKb5IB7u7/1nzYdaPQK1eTkPx2PWYzbJnbYQRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=bG2kHAICZRYNgWZw+r4iayKmonz0YRBA2iA+gJbNsi/GSL29xO+LQHrt/8GRglSuq6n4
	 FGHTJVYe0UpQKLiOK5x+oYhD4MowkRS9v23wr25fMatMM+y2QFVm77jbeojg3yGc7wl0a
	 /NzD+cJedPXbvNBv4rd72Tyr4TEsFxlRQomQun+8c8FaDj2g7wTP/g3RF0jav7GO5rgwZ
	 CxtHLu1Cl/q9LnxqZ1cdVPaW5F7SxZq6l8XcNW29uX9R4KOSNFqj3XsERAmsI4OZrSi6/
	 jK/NWPJif1FYSxHg3nJq+jgBG7q/JXBgO7EI9DKC5Eh5cOLpewGBiZ+aIUUkYZ5yzzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VRyNuhB/";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B4606C751
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238B4606C751
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRyNuhB/
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2927053c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444486; x=1795049286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=VRyNuhB//q4Mh1RlEwxvl/TskKyubrjCDwlj5azMequWt7tGf5cEhBKtRXs1UgQfAP
         TfUPRsukE0v+O0XcSw57aV+6jm3lH+9FNI4MeWbxHSXQ3MiWjpNOOFazcch3CEXn6h6S
         NBearu9sxzWfRYlSeSUcBSqaaDa+eiGC6A0ZAJlqoLPx/rujuNhE5hHqEb8S57p08cFe
         l4AO65WD228JNjuf4MztRaONJz7m+NI8tztR3LmBeL0R4JVjYwh6C0OlR+ElpXiF+hip
         p/Ti2+FCER21AGZOh1QUoaL/oKSqWP5O9Qij/nAWiarXR2DD1CqwM5WILvA2h1e8/Diz
         mhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444486; x=1795049286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=kgtS+DuIzfSn8ce01iXRecGHPyIItdXC1jz44ac6PnHE8VbzflMECbh/ho3SDRyILl
         cUNZA6ObYk++6fQR7rr6HiRnC1IkEE8BgVOfN+3b+j9nG30nOiSa2j7C9bdWrs5U+ATk
         CTinlY0EUw/eGrhClvF2bx7q6XQGoq15K2i6Sbfsk9WNwdVHT7oIdzigzS+mMAS73vII
         y/dNQ2kFivlloZPD0wfAobCaY735Zo9uC//1bi2Xxc/+LBSjt9zVd0BurjXxpp/96YFY
         hl1gkcmyX0m4s5xLF6yBZCXOdI5Qfwf9WGoZ5H3rBrAHsfrdDuXo8GQfpP//F+OTFjiD
         wFXQ==
X-Forwarded-Encrypted: i=1; AL+hErGTw7BfZbTA0KDuAnP6cGmTuZW8L+Nxs+FoEn+3iLMWbdPYDnQMoU1lBIrkM/QcbIW7KDl+4Y+FnQxZPNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9js9XSVZ2655S0JK6qlFL6h2eSLHi7mql+12rVeSsbbOF1X/cf
	O89WCQAkS3Vqe4tMEH+D7+9V89QMSfPgWeNjxQR3BE+Xqd8zRlNiYdHg
X-Gm-Gg: AYBFou34B1+jvaC/0734gVbhkskRoU1dMwm0ThG78lYtBeMlYhW0xUXqLL3MT7dolMS
	9ijNbaPJIlhZfus0ohPktdOxIbYFvvav2kmBxMSQt7lTIjpOrnOiBa99ADdCKCoQgcvR2gYBSmi
	jkGtldTTr3J+xbUf/ArnyHtkWCzy2+nfPeo9v/nn6B+l7bF7eEysVVKX88FtdBVub/7LhWo93l8
	lhskrNHLGh8GaFwKushvFmc9kZMsq74ZIAss1jEPV/eP84amuQJBXyKGI1DhtO6fERtu0EPBPvL
	Y8epsD3plvA1QEVWEfsD5Hv26R/gtoXeEOqFWg46EqjStRN4Atqec1ynsJin++6Fc/MeFw6ad0U
	OZZMS8m7cs6wVpH7l2nCq3uXoJez/dvCbRwdgg2+Ja9JloyFlsnzaQ8Qovuv862IdQwfdOk3Dl6
	WewDoTHzt+FzcUaq+P8r/RlL6LNicIj9MDPCWGYTuXj2fv4lbR+ca0YJVHHfLOeMxhnmPKnecIU
	byUFVumfPgByZnOIHfHSXPXUM/AqdKOrAhAuuGuN4bVPaMqTCNt5QyYG6MJjsvmNAnH3KRjerOv
	Jvarc8ziBGpeX6h6hG8onCer2YsktIPHOsn2dI/4Pk/nUZFG7AfymuFwo3hLFYvAFVV1ZXtERXK
	0IQrj1BXsCudNzguo3c7DuLfIwN1t5vEy2CbTO6Ku80369bw=
X-Received: by 2002:a05:701b:2504:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b3c0342f23mr3517225c88.29.1794444485979;
        Wed, 11 Nov 2026 16:48:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.48.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:48:05 -0800 (PST)
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
Subject: [PATCH v27 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 09:47:03 +0900
Message-ID: <20261112004704.49758-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*
