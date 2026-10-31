Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412563;
	b=L0wpgw4tyNfHC2I8o6Lm4f5LuX5L43dL7g4RJ6ugFpD1bhAeNMIQFxO2dcZvHWCbw6TR
	 h2g1Oa/hMNpqnO59GYOiG+RbU+Bd6dpOffjudjVuwfruaIXFJs2b5p6iCiEmC1bTDvA9+
	 QoIJ18y84qyfLtOClddE3f3HOxalXKrj8GH/GIaAAzBgDAwqO1pajU8g+XfJS4Xop947z
	 fIlXUaDDT8eMsfY8iPnm9AenTlptl9q3spyCOsRJpIx8dMML+prcl9JWWQYMJPU9dmBFt
	 YqSZrkXkQitkQtp5mqWl2KHrla6POUufndX5+j1d+jZ45UGo7JNuzAAOH2PK5V/b85Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=Wkw6RiPl9FloPf1SfH2Q6NHTaB4v2IoJKPfr3mkRh6ocsBs9qzQp87kNBLTUbUtX8dVT
	 rY5amImBwIUaJIf6RuFpRHyugKG2hI67buOul/GgikFGJMUZEqobz30wgkzVz5pa3jNeh
	 f0S6kJUtYlDt9Bx+YHeO/AHIHTpkDao33CAw7Rb0LgPb0eh2QJ/SnvBA+KdXZl0gR3Hf2
	 CcCIN4D67AS63TcJEILU2frZgmZzVMM2HxnPylO8DfygzL4geETa5XbnHprcWvXKY42Un
	 fWR5Oz7BqtXSml/jgZtIHUZNQZHkEJ+zYLNGdclzrVrDaSBXLyxzif3frhhHHmAw4/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLEar4NH;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF306606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF306606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLEar4NH
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1700642eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412562; x=1794017362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=PLEar4NHS6whdrmAaC7HjlkeXnIV5cygTdxWVs2irViAPaa6qYALbmaCCQvHfx7gG0
         kelX6F/yxvqaHyohJoM2vHYpzkESkEWa2j1yXYwNsWxuSAB0y1SZovIeJYrhAdvRNi1o
         59l7zv/AvcWsHhFiYh4sIUCb8o86GbX4tnQHfxS8N4CN3U/G/QK2HIueGNM4v5nSWUcV
         jPjFkYjcpJad1LP1U09ZrFZFDNaR3sEOzpZJvp2Ny59CsfXU3N63dtdQqYyAMj1NcSpt
         1dQwggw+CCxbWJtDsy1rdwOhg158roGH5TPKGpD4o5oX29r7EU+cCM5FKnnODp3RMttd
         SqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412562; x=1794017362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=vQ2pHhcXUPztADAd+FGCUzdX5d/ki+/TPk5d1oxsH0iFCfB+OR45suBdCK7sFg0Vin
         6hGKMrL8zDUTek3HPpJ3rVZq56Uouw1J8KpYRdNzxbHecoASbYYsNLMgKhZ+kYw7qlPF
         xngfuzcje155xr0taWCrI24OJEo7Nk08fTOHYildk+VJyGzqjIAlc/e3OnWNVgllExkR
         AEXiNcIsCHGgNBvRjXgBecuyvBKmyFs8psJrC/uvkV9oF05hUvGDbM/cOJzODdu3MwoO
         QljzCeVUj513ZfhAzMHSAp6vMOw6wAOll2LzibeN6tENxN38EwhBUpV5rHUHHdYXuGgA
         dasw==
X-Forwarded-Encrypted: i=1; AKwUvBxt89QAyIx3jZtULW5VXx5FbGO6ihFkmIAQLAOLnIosGh2n2s0SEuE/1PrqE+qo56TothxIntHCczEiGuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw5TfLWIyEuJC+lrubSxyeqZoHpOiPgn4pLQuPunAw9PyIpIn0
	pq2Ai7YtfvGn/uQ+Y7Gr8gyJKvneM+Qur6BWHuU8OVOLkx7kr6VDUYvK
X-Gm-Gg: AYBFou1Plj03biJPQU2xbrzJceWlEaqz/Hc1IPDdcKw+T9394zO3PWHWQ0KX8Ti7Y5a
	YbaCY+UO+SkQLidKmDoPxmEJO4tP/g/8mi/b8ie4fY2ag1hKeWZ4fxrvyvz/UMG6gxrjc2PSebm
	mCi0J/DtcsJkbQAfx1RbfsS+8Ade4eORgMYzFtboBm9TW9iTvihmL8LY8jvl+zk65ni0h4FVJD8
	iFMvwBL3eZnqQ15NkmRl4yv3X9dAnkm1kMqxsl6quIV4GNkDiXVNYnGuJdyOjfTyN5oLvtVp43n
	JIUXtq31ZhrC9pvLYyGlsyfxDKzG+zAvtR2vpDZR6ur7nYUHA05wmCNWOqO343AbZDkEQJDaYnJ
	1q6IU+SIi7TxFEUIL/MmDOInIGde19e0umPw6WbAYcay/Aso1C+US4pXtAKlTu5fk+PdLaqtndZ
	BRviD6Q9JZZ62/53wau6pOPIeYDkqG+iVT1UAFpCUxOEmvLJacfca5QywB3oYHJuydQbfiG04D/
	Pm8oCtDP4x80wPu7qUp3lZ86Itd78Gce8AiwIHFupnrjt+VtM72tSP0MM3KI4AwIw0mGt9gLPGF
	u6h9G2uBqprpZiJeeM0s4c9WLMuCl8IIe63E2FA5WOtlXFEl03VMMcTc8q8fQIo44ocjkS9R/xG
	Lxr+J1LzjtNdWrNlZjtzJHiN+fV2pZpoYRz6j8FvZpCjF1tyrERyM4DIVlgms2CRszwU=
X-Received: by 2002:a05:7300:2a91:b0:36a:1bd4:627f with SMTP id 5a478bee46e88-36a423a9d6fmr5462617eec.14.1793412561785;
        Fri, 30 Oct 2026 19:09:21 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:21 -0700 (PDT)
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
Subject: [PATCH v11 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat, 31 Oct 2026 11:08:48 +0900
Message-ID: <20261031020855.2402-8-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in patch 9.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
