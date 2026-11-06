Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923647;
	b=Ocfw2GB/bS5SwqHtjD/ZeZVOYywJ0AIzY5afnWKxVEKKnj48T5BGucBQsPuQa8lsY26q
	 DcwLQ7jSr4jrrQyKKikM90REHNT0gtdl90qGn7WBN3ih6wDe45qmwKujmDLmF5pRLerqK
	 nd69PXWYnok2tnC7HcXCvXAz5uJ5XuTaauTuy2dM9yGMoegJjpPq0EpIj37Tq1G/EBtXp
	 ZgA3/M9Nh1CI2/ygW33DEnAw6wGQ0dcUTZ/UC1f6vOcZgu8wetGt8w+kqIII67/b/td1z
	 GLDT2HXvT+sIyx02vjC1Jg0Wmr9EScc2+paO2fA4R5s3QmkqQApMrZmkbpAjpjbG8fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=C0fUimweQQWnXs3aGMued+lt1XG6IqOCHe0GEvBej9RpE7Ga5AU5zO0AcRH0jxKoVc4/
	 4nNsYcaBFUPz8uGxhV4InB3sPS4FtoOPtcIALTBhNs7nTjphFNB4tb3ONupWU9prd2OIg
	 42NHo37cYc+D4Tu7puuFamokRM1eNaBAdiOQc/ErxMcjXL+XVp76U1vmtGHlnsqzkoIVT
	 AlX2WnsOpsKGNgHN9OHL1/nLzQvv8IX3HQcMYZ1GW6BWLW7sLfs82mS+4J18zq4lwSH0Q
	 oSCvrRwPtBN2bya6n8NosVy48I3/xE0HJz8KkMQ/h9iA1H/aIYjUs0TZm4KHoiv68xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBXSSoGE;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8637606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8637606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBXSSoGE
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so282234c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923646; x=1794528446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=pBXSSoGEuH10m5jyp9FLU+NCx56gkVdN+jrBMziY+7rd2x0asHaOZzSc9l3xI2bLdF
         jKYLvPIeyJdX+fJSFopglZIGBX7rCx2njc0QMSE/uS8mRuc5XoM7rhZmq0ViPYZLJo7B
         9x8Jutl80kkWUslYi8OosZcXBpJlf92d18DkgE3DSkevFFkoG83VBrscgIUaFxxkl/QG
         0b70TBCwt43KsSavEuw6LzndMGuC0OzsWX36ownllGLePT1Yp9OmIY6juL82K6BrqOcP
         /g+9OLdSi9Ex5x+BBmKS/SERZb7Lh3rWEar4fVpCRLtZ4CXP+YUTWwSUhtRQo7RHlQqG
         1zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923646; x=1794528446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=zESNS493PRZwI8sfDMu9e/p2xk44uFTNT+cXkgyFNQsrdnyo2jEtxg1x8EKJcBW/Vd
         mxbE75Ch8lCixTEXYxBZaArC8nAkCJdNliHVuTA3+86k4JkI9SkaMyeqULJXG7I5QR0W
         6aHk9URVVEoBtKlz2HZ5jlLyInHKjljS/CeFQaW61IE4HvCY+1B1NWMdkpO8osQ/r7Wq
         30PhznHUjOz4RPl83CaL/6WxODiZAEQ9Hy8x/HfOUiiTpoYp7PSdgXcjN1LZoY7bYWlP
         FNn62qhHtz6kcLrWPA+8Nrzz4x7r+mC2Jrkw5iarycZbms8uIx/08QK1BJSaWo6+AYOz
         Plug==
X-Forwarded-Encrypted: i=1; AKwUvBz/MSnm2CMKOvCvjbadB3dPsBhTAcVedB+wkWd58uhIKXr0PeoWn0nFIp/kDlgDEsGkq03KQhuHqclrOvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OhMNkYSGqvAORwG/4ujsRU+yK7szRWstBgntpV925AZGePGY7
	lHjBrQRWICfPMP4ltFGurx0v5Z7jRFC1Y6lR7EP6RmDXyrSy7onBLAjq
X-Gm-Gg: AYBFou1gl18U1hhKf8dwEY9o1v0L1ZJtTltnrXVs6z+tymkNumXtPQmlnreAbcBfdfv
	2Ghr50Gv3cWVkqMgI7m5Y43G+8hOgYwEsNVbz8d8mWEfaV0wMFI3mY4osTZ2iRNu7vBvEeXXCTy
	XwjVG513+sF3Fh47XxjVFx8+z5cz3/bBT+qIJLcx1swlxiLNzlHG4iBcpeJlyZ3ePRyHNd7lBJd
	lbcTf3NpZgSwRWwSldN3LB3VygR5U0pgo4ryeRJkweAzVhp/AgL6pwN7yky1qhcb9O+YqNiK7kE
	cI4buAbK0cyFl65CVerukvx0B+nBs9NHiTOfToklXaWKs6yM111eQXvY14aoDc/vF3LOhdYKPyJ
	gkPNPZc9kqy0zk+Dlef33QkgYUFMMFmMKgprjRRf1aC8vbRFC3qraI77OLsoYaxJRwwQoQ8QVWJ
	VJMWpC7AmaCh0sTlej3+SIRgVaLutEWzCSJSrlG6Q6pimduc99/JPq7hKcR/z81pLv78DOZTWqY
	r0tnvH1Kaw83/9tnK5LOI84jqtVvK1uaGxWLbwQ99i0xEzaVmucA4Fj8fioedVvEQzzsmQGmznC
	a/bLn0OxPdXV/sjm0Y0CHOW5ODbxEfi9KwKIwk37Ir8xNPpdBqrfrgEWeZ61OfGeGAnPqFa0f/H
	u2N5TNLvofV1oW/fGqp9x/NnQX0b1KDj5R8fdRbyxZvC7r0xl2iYHVGHL6voGGnUYnqxd
X-Received: by 2002:a05:701b:2618:b0:1b1:4c25:b64e with SMTP id a92af1059eb24-1b25d334f8bmr734634c88.25.1793923645841;
        Thu, 05 Nov 2026 16:07:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:25 -0800 (PST)
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
Subject: [PATCH v18 11/12] ALSA: virtio: prioritize staged capture period work
Date: Fri,  6 Nov 2026 09:06:43 +0900
Message-ID: <20261106000644.20460-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
