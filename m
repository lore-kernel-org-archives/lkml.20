Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062068;
	b=Fn44c+Wb+cVCB09bTiulCqtCunEaqeSWCUQW9qXtA6qPFqOTmgQd2AerHxn+oOxOvjf7
	 IuyqhqbuHhipQDWluNjrzrW1mlGBQIs/eVV2/3JRmb4AFqL9dMW3PorQMaY0952qdglU5
	 +amKNCpoU8z/TSSLKL/qCMxeFjczYX55+7KdoMPxlR+pjuMEjjvIJ2sahleTOHvE1VU6E
	 LbJWvOV7kxCGpY+mbV8Ri0Knir4vE1TtozQ0YpGLhBUzf2tX4QdHxFfhMU4JKUjfL3gY3
	 O54YgCWeacTMa1c22jm577gafa2jvSdd9yF95siICvBjFXPyLKltOCJsPkwIB1K7Saw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
	b=2xWInz218FUJ3X47FLAaiOSToCFrudK0vl51WPrqotYBSfVP/f8V8x+FHYpOI/s3csKv
	 0rGpbAQ2UB8o/tSpzrx/+jOR2Z1JCQzdX04lOiOmOePJUvkeeAwzwk6QTv2EeuDSb3ljl
	 RoyqStJ1rLjCgfet4hDDxZd4bRT35wOEVkaJA4XSz+8nrR/pZohHJdMyY7YG7SQUgd0nY
	 DOc6EUdNs53iNRUQYfol7mQjsz+oLAecCGuRtPJahWG/Nb9ihbVqFz8TywK6l7w88ZAw5
	 vku+cvCCDRavaURifxay38UeSGhu4C90cVHcNDx+1WPdWVBgnYnBgU6AGwcmiMQuKHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k/R8jpmf";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EDB606A335
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40EDB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/R8jpmf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36fb88ea38cso670701eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062067; x=1794666867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
        b=k/R8jpmfOfJfq09NGfHnd11AgXL3mVYVqfHKIqKiP+jSRBnkcz02FmHvEadYIgV8yE
         0dPt1XcmXl13xxtkUH7KoamOPyumrG9iT4cnDz710OQTxc8VsmY6pPbKevs5sqkdyHLT
         WoEDw8boiklHcAwJ/TbZmknA/GYYb+gSDZ6Y2WhjO//yoOuMHWeQFUtEajTmMLDjN5va
         JWQwam6fJrEIhVVCalG18yHrb9kssQ15J3Zl9uOXmeoygSoe4YEk8N/QCW1afc5C0SBw
         n89oVoOijyMmneT80QZKwo72CJ7Vfti7v3wOXl556zYIOHeCwqwKgTrZPrgCMWdr6DtO
         9nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062067; x=1794666867;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
        b=BBhvLNAQZBCdqsfwIRWC9jJ/x8gIQi7VUFivpm4lBwj1RVyaZEAoCw2uOwitLVo8go
         7Gg3vIWoTg9KT3KLAnDKEV1e2mvne4mwrB7WGb3ZnQpBXA+ZhLQ4EsXRGfqjALd+Vaad
         6tCWzvnKlmWyvPFLtewpztlkSVI6ncb0YyRJdrnZ+oK9x6W/1ke9x2rHNFeSOD8YjnFc
         jQmPoosz2WGrVxM9/uKT4TvRvb6hV4g17LiKAFuu3xdlFwQKh4Z8R03fKqQ9umL20i6U
         2P5QBdahy5QIxfJVqRPzz0r1434dWO/SwgzENYm08KxwWUcc9/7siDAL2Zia6qKGbRaA
         wfjg==
X-Forwarded-Encrypted: i=1; AKwUvBzFX2akBAvdXJdtJ6mjrzCTnRFgx3ZrhLW78zmh1D3ApyjQy9wMva3rG4FFemhH8YnKZc42QH+CKiUzqW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aeLi4xfRH4KXk1Xu44y8kPvLtmZSKt0nzovM9lHEbNS6I+w+H
	dnAl1xPtaZ/ZV8Wfr+aCo21IAqIVOi/h2/pwkX/fUjeQfFfyZmrmWj1u
X-Gm-Gg: AYBFou3DCw56zklAryHV0NgBo6u08DojXmz3a+vYTDhBfrGTMjGtyP5ILliPNK6hFU9
	hT7K6V3G6KjjKCS6b4eTVHIY8xl6nLvoDVLtiROQT+A3wbcG3yCofI9nvqDk9v6+dJBsuQ0lPCA
	MNse6w4foQRzBW6CopYQDVkVklnQSWhdRPH/V3x0WM/RMP0mFUx+B/XDnr0NKmzQ8dWyEjq/bQR
	FFwKFoMXq+joTNPmLRDlruhV8NRRfRhfRnquVBNey1xw/1Upgy3DmCxPSmwHmj984+Ecax+MIvJ
	8wp5+ro8YV0UfSCMVLsaoYgQGEx/yke3/KGUJnJ/QRdKi/dGJB/vpuF912iqIIMsfS2V+87bglv
	4V8MHSkt4SKbylObJTBpJj6VOh45EOwjR8dJ1azi9tJRdOBxfO18yaHT/LdH5oTDPyYUhZEZQZA
	1tB0cOTgAsC3kIBcH5ASuJswKn+oV9v9bF3+MM5mMJye+6jCPsGIchDLM8uRkijgOGIWjvScEa4
	3Ok9W7fn2pVRsBej6pfemPtqB56YHtcF44oDTMzsDHcXihV+zKyUKMQIhNYDMLNkjksW6ojPjEr
	uk2wD0771n2ICGAN7DnRPkNRL+DC1vgKBwayzj67Ym1MJJlf048u7aC9pRdABdZurZk47TW1Msb
	k62rZC0/zph8YhLHIs2dCd7JcSARgzVQ3UNkVH6+HiAnPgQ==
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr3070962eec.14.1794062067100;
        Sat, 07 Nov 2026 06:34:27 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:26 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v20 00/12] ALSA: virtio: fix capture accounting
Date: Sat,  7 Nov 2026 23:34:10 +0900
Message-ID: <20261107143422.29319-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This cumulative resend keeps the twelve-patch series on the same base,
a4311e9447bbb219044db38897f95be112f46a8a. It covers PCM stop-threshold
sampling, locked partial-progress reporting, the optional reset operation,
VirtIO ACK error propagation and recovery, PCM and control DMA ownership,
signal-safe teardown, staged capture lifecycle and work prioritization, and
capture parameter documentation.

Relative to v19, patch 6 moves the virtqueue initialization summary into the
commit body and removes the unsupported event-message ownership claim. Its
source diff is unchanged. Patch 7 also rejects ordinary indirect capture
appl_ptr advances that are not aligned to runtime->min_align before converting
the frame delta to bytes.

Validation:

- The final ARM64 W=1 build uses KASAN, PROVE_LOCKING, and LOCKDEP. The
  cumulative stage build checks patches 7–12 incrementally.
- A synthetic exact-validator case rejects an odd frame delta for 4-bit
  samples before indirect accounting changes. An aligned sub-byte delta and a
  byte-aligned frame delta pass. QEMU does not advertise IMA_ADPCM, so the
  sub-byte case uses synthetic runtime geometry rather than a real stream.
- An actual S16_LE capture accepts two half-period ACKs for one completed
  period and then recovers a full-period read.
- Ordinary and staged capture passed RW and MMAP reset/reopen runs. The
  14-segment oracle matched the QEMU sample sequence.
- Inherited v19 raw SYNC_PTR and paused-lifecycle evidence covers the existing
  accounting state machine. The transport timeout and PCI evidence covers
  unchanged control and teardown paths; these references are listed in the
  manifest.

No physical-device validation or KCSAN run was performed.

Previous version:
https://lore.kernel.org/r/20261106161838.94308-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
