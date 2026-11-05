Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845949;
	b=qaw//RG/WxA6sF2vV2V5yeovuepUC7JPxWVaaPbFFA/w87IcJHhh39pyPQpb1Fc1rXgl
	 jRedaK3tzMWTmD8pkoTYyuyGi3HMqmq2v7rp2ghC6uRKeOjbjn5Bb+BNv1hSF7z45FvSZ
	 GD/UhBEAjTXIEI8zHEawjNutHpbOmpGdwp7gvspZINSfxZ0iuFoNubQC3cJw8lsF22+Rn
	 OICU/FVpjpI0nvMTA2DBVZRBvBaqInHyrqq5JD4deMrx7XMtZGiylw80kPTlEIoT/7ps5
	 iSFe8hV3HX213XOkPJKtN56fkvKSrwt9BqEzz7WM7lkf2eJ8X3nZRJil/13TurDHw9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=cBu77hZvvJ+g0w38vDK9Xb8EpVuYB9QhUBkMgo0bBpyCo8BXxNKEoNtABzQVYn53PqQ/
	 9HdYmkVa6IfvT5K8cairp0HWmdXYf0aRp83Ihr57NyJC8BKj1bbavC9CZ2byjKnbI6UEL
	 sKomtlhVjZZz95HJMnD4kZ6aXY1KA2pfx5EQYKLk9gysK6CbqXX6wewWxQP6kw2jdepHD
	 ofweiVpbKUpLH7QIdMeO14n08ywD/2/NRO6kCd4PX70hYoUtj9VXjrWg2STcpC19h3F19
	 vbl2rgsMC3YglrY7hX3EFgl0SQuijfDdiCOwJQmWFhsVT2x4m5ncnU6WFEVH9qw0n8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4MG+WAU;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9EC606EEB1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC9EC606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4MG+WAU
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89f85edd210so651002b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845948; x=1794450748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=h4MG+WAUIg17ayp2jqseAit3lnCAASZn9oBrxo06jUVEVyzrP5pajRT4SgFbgwFahs
         lXUbg+ClgfxJ0b4rxjD4sgcXczw+CjE4jDyOfjurh+Acyeq2RVQHm5Kj+KElr+b2Gzd8
         b0C/+AmK7AxNxWEn8uwASsIY66kpWBlAdk/emVZ0sQOWPc/9lV8zw2wUPLWIqdMa/7MB
         hRDsX4seWw7aJb0TvSYSjJdCoj/hB0pQe1oW8sXseYkUWAhjyNu9iyf8IFa5EjylSNQR
         aJQ9BmlepHHi53X8jtJ1TCS+au64Ukr9u77j3ZpyAjRCPshnOwQ217OtHO4Mfz12zXRH
         wgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845948; x=1794450748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=1RpQFAAKIxnQ32tH4YGLqx2mQ4BP/gnGPuXRDZ2sssH4Wwn+yBlzcQ3eC8W8uhHRqX
         5KnwvH7CQawT0ZPQLuMfrQJBWSwa47l4Ay6j4yyEbXmq/k/oHOo92ltd8WfBGhntPfHP
         QvtBErw/8wxN0bjC0AsfIo4FEl//DWPOt7rZ5G29JMoeJTxoP7fsHHVPGZWyBrU+28cq
         y1lsh6xRhVbBSU5oxFbhsJjk1JrURy1ITbxoCkoDuVJb6wW4Su8/Z88niDh0SqXH3P9b
         YNBnU+lhPj+Lf09VMLDMT/GfoLHAKdxD3wcRSCtaNVVetb6ddDb6z7YNUr6mqx85c7Fd
         6rxg==
X-Forwarded-Encrypted: i=1; AKwUvBz7zJ81zPJAh0rCpwag2icRrrjheJYE2cP7rOUe/kDLkFAzLabAIjXr6flo+mZQnqg+AGMjEzMMVDoiBPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GcCbTUsLXiFajY1+Blsh+R8Bw3MG9D4OGEuhoPyw0eqMQ+fJN
	pyyfVy79bc0iJ6T8jp8Uk1YkvDIsUJTJL1+26HwrsLCVEuqTxOP9T8cR
X-Gm-Gg: AYBFou0YBSlHuDueSRKjO4H1K4FmiRo73N3mtjjnmb35x9hN3lrbMqSobVEMLV7iaFH
	trZ14cg42jXSgr5drfN2XTfqYfJQXrnLSN1QDVrvSEcDjzci1azP1aysCajo664973WNpJmgSRI
	dhsPKdIu6cMmODR1wpBSFbm51QiiPgsgbWSERjIfd0xfcRxm6j84rwYmF+/2FMlLmXAjSTugUXZ
	j2gVAVSNF3FswPVx9RFWd+/P8XJ9D4g0XA3tGOQ7PH98IIrFTSkPPl6EiHQ43ysDvCfshO/5sNI
	CkzjfndbWhqmJwAsx9FJwqWtmHOESEle3o+fbwm43MKUpFq5iCPRo/aBHqcixPaldFxr+eL0285
	01gDfA2qRQ4YuBR2jy13F4HzE22MnT7zZ6nBXnKZ0cv3O+WrhoTXCp3FvMexQHqi9DEUH4l/NSP
	W/jt9Yep8aXtUrqk5oWGvcZeVEtWGhoNQBqbBNUN51DtvXi+h44D6FxMeb5UaSrT22XQQJjPdwG
	vDrUl4kuGZh9MJwUaBZaUM71DmtNVEk2hqaSyEGCxq2DxMyM06tjQEJ4mtbMa/UtinftnD0Awah
	CZZPD9q6C/Fy8PY6V8lk8FlYWPCxv0Khc8JfS7EdAGoKFaiLJ94hOUrkaLew5Ubo9vhKsI4VYVg
	ZyU7h/ZIb+Qc6xotvJdXpV3UzXLp8Sg+W9S9sj2h66V4ujNg=
X-Received: by 2002:a17:90b:3148:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae897364c0mr14242904a91.22.1793845948373;
        Wed, 04 Nov 2026 18:32:28 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:27 -0800 (PST)
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
Subject: [PATCH v16 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 11:31:39 +0900
Message-ID: <20261105023140.18373-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
