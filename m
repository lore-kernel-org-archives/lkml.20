Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355600;
	b=FLLlLHN0KwoyXcf5mmZmg35vUkNTv1YnLhMxpyuIEBGuqzjWcpjpdogyhd/SWtAXtqdb
	 Dkk2WPv2nNmprf1i4gWqeBjYpLxv1UbGAyQyMAfho+8CD4EKoaOxOTRpTWhJKmYD5kVF/
	 IQHC9Nq+RMKNPNTjQHiHcBqfrzbsmue/wAlgUSCXxV6YE9MkI69ahDm+9GfMdBoFHbOFL
	 xgPUfYWNbYzX6S78pgOODimQvYZiBsOq9pyvxHTVrtcFKdOpTiPlJOZ1/SCG+SdzaEqb3
	 tFb/MMoeGwBGlw/a8Q0wSHuVvqh6CkmgDuvnF+FRAsyR+zhvJoY0Q1Iie546+G2dnZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=LwTWDLHeuozvmNxKMd8x+B6kWkapiiYeLJQiA68Oh3/SPOqYStQ7OCz9ijvO4lbsSak4
	 pGzrPDGhoER63HZKcQ3Uo6CpbOANHHhMfKLmtPpVo0BHH2RG1tvtZy++Oyqtnfuo4MIxl
	 n0lru248qrF3omosyawdHAyuYjlXGiUdEV5VoCWk0zJWfHjVTNj8KOLjsHFI2gi0brlwh
	 NNmnLw0uo1/1GobfHkM1vEVBsZPWmVdMlJ7lQEvWdbngAo+1p8kvWfHrl1V/DK/7uy0MK
	 jhPvckAokcywcY6b8jJBN2kU6/jMnCeT3smlE73lCRBqqfB+W2/NcGBjB05qhq/h2jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sdWHdi/B";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3266560A6F4B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3266560A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdWHdi/B
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1240665a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355599; x=1794960399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=sdWHdi/BDb320Xf9zcow7XYiM8pDXzFkLV3hBsrBsEfCQjIB/xcMQoUpdHDQWUdzlm
         dS81UlFA8iTZQdDTzxGwvpfdWlx3aAuLSVucGyPrEN+2bskQTyRUUHpaub1O97OojkOb
         U4LMM8Yl+ZWjWg7jD/3zb/z5PWWhZI2tXKWiY+nGA/pUTDWPyR6ydWYrdOOcBqOL3obv
         uT6GJzuh8sYhAjcmr4cNxGx9KQ7iXYrZJFNbiBbbAGK9pyo8kZKsj1SD3WSAr/jnBfMs
         II47eqJdNLExAQS9wNzsgOtT3zW2bEu/0YhSyEc78gpWUjVXE3M9JO9hw9sac0iCNY0R
         q0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355599; x=1794960399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=jkNvVR395xQ9HGqmuv1+hDwLgq35inA/lMSMMj6R09LgpY1h5LsdArwGYk924CjOHu
         F+wr3I1ztA1GoqUbHP816b3RGrSQ5Qvol/U6rYpJcBwWHJgMBaxLss+FYsFzHvICL2ff
         nyadF4mvUJ9BXFGehfW2XN489tvtvR5VTSS6okl+m3AJvQBvkHWfkm2wP7iT6z35nBtQ
         j41SUGmBUWpl0LLhN/2hcd1tdI4PudWPEU8WmQ7Y0dRY/WtR4EKzzCiSLCY6e8DGamDK
         pZz5dPkVGXe3l7ZEdqkN6uVyEa41tLggaORjceI/rNEnOG0Zdz3wFu9fLczlHg7G+M49
         BbWg==
X-Forwarded-Encrypted: i=1; AL+hErGqgzfS0F8kjLLcMdM+S3W18NzAhaqA3XLcBNUEw7cM3aZ4rrloaVHKqvaC7i/nJ2xn3X68nTdV0JALe1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z88zpoFy0vJJSOFpwOqH9E26W4obUawHC23751I6gT2oXfvJVfD
	9e3ZsrLfmvKNcAKySI3B6tFszXpMgBn3CZVwk2lXGx2iEjYilatpfcRe
X-Gm-Gg: AYBFou18MvRmq50zBbt+tCN4hdT/rlL9vcn/sweklwXUwB6Ph5gq9OmCVH2hgZTDMUP
	PvT7o2TnX5WvySBDqmGjdjFBDSBWV/wM0NwzumqvIKGpVfBzSHeAh8I+fUyJqxD0WuudqyBAEnd
	woX7xkKaY30u5OlOic/Pke+SMfwEqKt8EptSkkClph4XlCow+OnhzYsW4guznn5D+ML4LzC6yh1
	HWyyIR3qqcCDQmddRNZcmJtPpfcgWqjUGCbWjToyev0QSdH4qaJQJbIO/hV4EKSBzUb1hDeqRT5
	/9kA9gdngys1cDBS7se8pt8y22HRRFXXBJ9E1xtupbQOjug3E6dApniCtOr5Vu9BEhbnvjbMGkU
	P8ZOZ8iNWWGmmD4IW2UGSIzoLucQJiFomT6KUqZlDVlrWEzd2gX6ZADfV/1sC8htSFHE3g9BCjB
	xIr/Psg2AcGreRsXiGzZD1RU2ERkjQaDobl4htOBD6kcSO7bFfDOqEVV5GdtDmT2Qh45JTHtn3w
	Cdy8vYHBxC5S9G1pSYUI58jom8EaVakJTDKnbWQEGMEUk25rbawAff8QiB3ucoVEPplN1PLNjPB
	HKX2C1xdzkKnmzYeEozZy8TP6LBSRsGfGwv2Gk1k2/TnNYgkWSX5cng9R7dpFeF93dXfxL/CpE0
	9ks/sUa0fGEv1E/5LkyrSlWkFRG+uc0HX/xnQBNK40SNsFbxljUeMiWDXLmwH/vHz23mh
X-Received: by 2002:a17:90b:2e41:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3b182f9e1ebmr573001a91.52.1794355599623;
        Tue, 10 Nov 2026 16:06:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:39 -0800 (PST)
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
Subject: [PATCH v24 13/16] ALSA: virtio: prioritize capture period work
Date: Wed, 11 Nov 2026 09:05:40 +0900
Message-ID: <20261111000543.28550-14-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
