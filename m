Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444484;
	b=utowUIWP2fubZ7XiJrFV8zjis6HxBROyNGh39WmNadHibrKW8vResc3KmKDf2n2kNawp
	 gKaMT5iX6X5bjXBLTFAQlQUeBERb1Rj1aoCqw1FlcepZGlvLJ3TCDxnuSfmzOBdCC2lsD
	 uYazint6ta9he9bUpQYMxt2XorKc9zKGlmELaw6IGknCTq42sNXKc4IWI/lnb7AzN+xjP
	 6KyQi+TK+16J2yf6AvYWlICTpSgEJDJ3D5+zvJmhl3KL7sJ+0+YmKFvLF/YeCgYpOwPYY
	 uTDbWpx+5S45aM5yDjRXNagJXeRBelNSQRQKI3mETdPZx3ZjZj4VCgZGI5i0VoYYD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=c46ScyQX6mWmXvX+NsjlRARgvK853DIuKjlaXk7L2mCY+Gw4NtIekVpHctvhrEFHKd6w
	 VPX8BpsFHR5zBMiXCyK3zZYtyxGve6GBJaMpT0VjxiwpEP1dKrwKmQHRWP89gKCGKkMaI
	 qWZ2utTzQjI8Cg9y2ifp18K9FHWuZn2fMQojrxDTeWGz75F9t5EK66/1xDNCJTJev9jzw
	 D/sf3rjpDE3Si4Ne8vT2wA4x09OH0+bie0CDSX8tidpOohZY/nM7STEKZUEeUUvlimAjG
	 t1X1cZcIOoT2QSLVC9LdJP0lRaYnl6cK/PDtM9uTg9eUmUZwQFl2zaUJTI5cPb/jVEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzqTg4+t;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD989606C751
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD989606C751
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzqTg4+t
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1931ff67a29so6592679c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444483; x=1795049283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=HzqTg4+twpA8lDsegIEbvtSBpr03NTvCLivNU5L3xONBpBEQtRvcW8xM3WKsr6muWN
         QKdtzb0IPs90xKV0eEz1qinAzmwhnTsu0WWCJWsqX0cDBZ57J+WR6u2QWNqR8nH/T1IG
         Qi5zhVfQLDfRU7zFsscrhL/EauUpHuG4XqubL2blZx7/tHDUXoa14381n5cHUOcx7bac
         +KdvLwrH6GkRaNhXJJzXmlKacBPL8WVknPMQfbq2T1CTZbGHHMz90yYrky810Dh6/2Kv
         dIo/ZYMMbe+cRufkbWybT1vkvdXi8L6p47/XpZZh4ZwgqrJnT19kp+5DDx6r15pd0x2h
         H2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444483; x=1795049283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=CrA+pg8W5NRopT15bKL2yuP8a9d7z+IiRkjlxijubqJjOX/lYCDGW4EzgcrTLqLBaV
         eKFMC6wqcitiP91QMc8pD54+yzbPDiuAosAf2VK8n7g0KB4uuTb81gvbcNxflM/9nT4g
         jxZ6xjTgKG3/HytanLr73NDRM+zQKsC4SBUOBBXvZlKqQUcSIPTZXDAfQGZRzwhC/ezU
         f3PIqTw0QNkZwweRpNA+bKqVYUxhPXflF4zNYtciNqKcLzmwJaWZt9YSi+b3cCHQgrIy
         evIQVygdss94VWpnlR4IaSRJas7swj6y1v9KuSWE8r+6FJ8fxvZw6MpVoWHAZQDPZo+M
         gRGg==
X-Forwarded-Encrypted: i=1; AL+hErHWeMTJASYC0sTFqCcH1FLL8iX19di841ArcWevFVx8YbaQquEX9Xhv8F0uINQSgz+ro1dsJeZspA4IIXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yaj2ghChynmg7ZZx6Dh1SEe2e0MXhNtLFOQ1kJgvZpj2Qqmse
	SBROmCscAuQ+fI1WT5TAVd2oEQ2Yndn6z3Mo6BitTUEpikrwz+d804WM
X-Gm-Gg: AYBFou1N2xHihxxqAwanNcDRhovLRtoaJZb3JQ7kE2THb7AKywQkCGJjGbUYXRX5s8L
	1HzDECrMKtegt/MNMNbdTQO6LCR1DNWWLODEud3YnFV1JHdR2w37MVGxpqzsF6ftO2/lNw1oypy
	oOvQ8Jg6gY0g5RSBTTJCDGKANU/hJ/sksQDeEDze9gUDGQLqBhp/BNkaqhRYKDAOAWFDCyu2e8h
	aUrWx9+GW9VuVGzBl/8Fmh3B8VRy+F2MMw0ux9A/p/OLVTyxdkLQ5gp1yDlYxQm7VNYt4nPnJ6J
	Wr5h2Ka3FVKV8XQWoSKwZxNJqXOeDgh1euKVFCFaithHsTwmbGorXiOLE3dK4xCZnlEXazCACTR
	eRTYhdSie39bDNTnfpAYomCuoKgUO8HcAW2n8qJKgUo5Ky/KfEUKvlCJgUyTpTL+9OB73mW4csV
	JZ0Y9/caIi27MdeGSMqNisQh+cMkXTB8D+RZwMw+jnNuD8CR+tpBj5OPZFDl2yk1Mw1InBjomhs
	dcSfgKxlthXD8AdIcwxClz3IIcMfUoMvFFpE5oG/LNfT/nxViowC6EjdW7e+slk+7/oOmbHLjLT
	MgV89OQSnK65MfFVYKykK49dfHwBFX5oeHdg+sty5gV3xY5SsSKvXsTOsVa9qvlD/vrUyZbCK03
	zOFd9Ti5Mq1ILO/zEh1Lu/84GFFtp+jFfLal+8ZVauxn001E=
X-Received: by 2002:a05:7022:1706:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b3c034619amr3483867c88.32.1794444482628;
        Wed, 11 Nov 2026 16:48:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:48:02 -0800 (PST)
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
Subject: [PATCH v27 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 09:47:02 +0900
Message-ID: <20261112004704.49758-16-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -980,6 +980,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
