Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703372;
	b=xplLTMjYaaLKMIqR7u+c4eRRiM2HiRJsPk1z60wY6CAc3YNbMgZwPw+UGdU+bg8TyO+y
	 W6gBOU1DHi0/RtdiOhOscCnvaAWpC63jGWJB28GpjimlM2eCdm+q4WbW9zMCzH93gBpJQ
	 soNq0vlTN7i+4jTfegHLkltZf3hFhVfprnfv5164dAoRvFd3AcWfIYYhLN7VpFktjW/BA
	 dM6Fno7VRLVIjGUV03jScFiimSRGKg7vkIHQvAieoST4TgS/hKi16b1BWtmKo969vbmTh
	 xYXRwiNqYtv9BqsE3kdRFN08Zno2ciB4AzShNdJjuOgwpPparKlevITWlfnhStESy3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=o5m6x1zTq9mQX096k7d8zrZcnlgwQ3oTTf7qyiSE3PY=;
	b=Hi99apIV9JN3ddCBwx/axXX8tOKk+iLk9X0LCWbFYK0V9sqIavSHi7+8J1oF+U6Nm+3d
	 XSqHGfNIcVoojGJO1tI9Qlq9jJdK5wQWBbUQ4DSIix4o5er3wSppZ3DjnQ4EPd4YhwHCV
	 J1Dn6HwnPZGMqTIOUaWXAYJ1wvzAeYkD6caRWn28aY/Oe6un8fYVH7BzU3Y8nMvGOFlvq
	 OUKwAqgyaLqWyHqz/0uPnLJ6b257mUvBDVuOLNQm1NfaTR8ZaiQZygV6hR9c9vHlEgCY2
	 A6KBOIwrUDNM2tXmE5ETDPF0Smd3p/frRoTMzMD2MhRl15QsjFb236ddgQ1qlBAF4Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XbLYk30j;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC6D606D819
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CC6D606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XbLYk30j
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so587194e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793703370; x=1794308170; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5m6x1zTq9mQX096k7d8zrZcnlgwQ3oTTf7qyiSE3PY=;
        b=XbLYk30jfXunhsEYxjVwplYjk4X+rlhKam6UuehkAzt1FaP3n2VLvzloSSe4MVDJBQ
         nWd5tH69f0pKXulOG8ihw8TZPrCSll9OXe2Mtdu5fz1uZjBsDWZB44nO4YOsbsU7VEKA
         ++XSzzNMTzcWucoBurdROfSfmGsXmuPszhqJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703370; x=1794308170;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5m6x1zTq9mQX096k7d8zrZcnlgwQ3oTTf7qyiSE3PY=;
        b=hhSofA4WERy7gqrtLmj7v8FX8vVGDDRb4cmgsx7tc9afrn1M6VcyfExQPB4u6ijvGk
         ulHR4j9wDaRsi5XSRuzAp0aUeU3vJR985d+Bv/EQkGfhHyMwSmzS4PyDoR9ldUAuyMVE
         4bMUDIDRoSZj2jXnSQavtIyopVE2591A1E6YNngM08s7/XLYx55TXitPmAYuRaDm2yLf
         4uameBiCprCOb/2exrB06O3M2L2m+RT9P76AQzrMf15W26Wypi8Ase8hfmaZkKRn+gAr
         xUroQvdWZ6F6yGm3mBldi/2JCjFptVivanMhhGQgGUIa+67PVMqVRlNTyl/AZdR1wWxl
         5FPA==
X-Forwarded-Encrypted: i=1; AKwUvBxI6Gu3tzGA1ULAeAu6PdmhoL6SsM3Ji0c2L3b7YkGjAbGiM56Kij/rZ8Lo9Nc2f3ZZLpDM5Bs4XmLGOwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oUvUjUACPNR1xH6HiJ5/OmaOK0YIrvfnF8tPWD2r5Pu3PSvL5
	74IXiPPzHXTZBp9l+AxaCPwBLm1X+mdVB0m662aCeG0v7Z/Vd/u9FLFRrs07RzLcqg==
X-Gm-Gg: AYBFou37H83HH0yo9DNSzui0L126QDsuWAdvzwSI7narzP4/ptBMBal0lBtzDaRdstq
	6M4fMjmHMZZelZaQQqUcoFkyX5tNdjoWLYVamS1KiE45MFmIQV4J8xmjpgcPpk6+wbjgObpXD05
	vjwjKBOvNHTc5okBNW7uvfLsDtpr9urQ0zVPPg49EogMoBYFTAn2x57KLyUEQRqaqZWVkecIHF2
	G0HGmOxC1FFYTeEQEPQslJhgI+mXK1+Tlnp1vE4s+MstSMC+RlwnRJoxPPaeG0CSvex3Qfiui0b
	6m0M20sfGVsdwsgjaampcc0yiJGt80zOu9pQo71ePmC/9AOd95nkH1c41qYWhcFG2dUZZqOo5Cx
	9auDwzPCuCBJkcUXX2reK610MCuX7zuCZu58rwwEFh2aS6YvPg+f5Bbj5VEPSvnTMHi6CwCz3tF
	vEHW6lscOo4xiXXZqLdKY+6DsZVtHCI8LSYk3bVI17biFSzXh5BTqlwtdTAgpSVGrspEGJRm/X/
	qNT2bVHQGBUJoi8FxyC0sQb3yA4gv/k3gU/BJXG5C9yB/JHw2s2l+HHLamJWCtabeF/xZ/SUWBI
	Y3eYsqPArCQewNuY0tkDQ+crcUiZ/6KW3LveYDHHIjU+UKMPHepLa+fEgD0HNf6g7f+gmfFAZB7
	IRmM83b3kyD0gQiSZO76jBvMZ2RMK1ao=
X-Received: by 2002:a05:6512:1325:b0:5bf:a34f:14ce with SMTP id 2adb3069b0e04-5bfd11e9f41mr4389560e87.11.1793703369932;
        Tue, 03 Nov 2026 02:56:09 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0754779sm2103257e87.82.2026.11.03.02.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:56:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: videobuf2: publish buffers in bufs_bitmap
 under mmap_lock
Date: Tue, 03 Nov 2026 10:56:07 +0000
Message-Id: <20261103-vb2-mmap_lock-v2-0-054e11dcd013@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMe96WoC/3XMQQ7CIBCF4as0sxYDVIx15T1MY1oYykQpDSjRN
 Nxd7N7l/5L3rZAwEiY4NytEzJQozDXkrgHthnlCRqY2SC6PQnDJ8iiZ98NyewR9Z53qkGt9QDO
 2UD9LREvvzbv2tR2lZ4ifjc/it/6TsmCCWVSKW+QtmtNFuxg8vfw+xAn6UsoXYTpcyK0AAAA=
X-Change-ID: 20261102-vb2-mmap_lock-959e0cc4edb3
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

vb2_mmap() only takes q->mmap_lock, not the main queue serialization
lock (q->lock). Commit a286b0837e13 ("media: core: Add bitmap manage
bufs array entries") started setting bits in q->bufs_bitmap inside
__vb2_queue_alloc() before buffer memory is allocated and without
holding q->mmap_lock, allowing a concurrent mmap() to access a
half-initialized buffer and hit a use-after-free if allocation or
.buf_init() fails, and prematurely counting tentative buffers during
partial-allocation .queue_setup() re-checks.

Patch 1 fixes this by dropping set_bit() from vb2_queue_add_buffer() and
publishing the range in q->bufs_bitmap via vb2_queue_publish_buffers()
under q->mmap_lock once allocation and .queue_setup() succeed.

Patch 2 adds smp_mb__before_atomic() / test_bit_acquire() ordering on
q->bufs_bitmap for lockless vb2_get_buffer() callers (such as
vb2_find_buffer() called from stateless mem2mem .device_run() while
VIDIOC_CREATE_BUFS runs on weakly-ordered architectures).

This series was generated by an LLM, but supervised and reviewed by a
human (not the most handsome human, but a human).

---
Changes in v2:
- Keep vb2_queue_add_buffer() without set_bit() so __vb2_queue_alloc()
  stays unchanged, and add vb2_queue_publish_buffers() using atomic
  set_bit() (rather than non-atomic bitmap_set(), since vb2_get_buffer()
  has lockless readers).
- Split the smp_mb__before_atomic() / test_bit_acquire() memory barrier
  pair into a separate patch with an explanation of the arm64
  VIDIOC_CREATE_BUFS vs vb2_find_buffer() race.
- Drop lockdep_assert_held() from vb2_queue_remove_buffer().
- Simplify the !q->bufs guard in __vb2_queue_free() to 'if (!q->bufs)
  return;' (still needed as a NULL check now that __vb2_queue_free()
  indexes q->bufs[] directly instead of going through vb2_get_buffer(),
  since vb2_core_queue_release() and REQBUFS(0) call it when
  q->bufs == NULL).
- Clarify @bufs and @bufs_bitmap documentation in struct vb2_queue.
- Link to v1: https://lore.kernel.org/r/20261102-vb2-mmap_lock-v1-1-fe550fe03ed8@chromium.org

---
Ricardo Ribalda (2):
      media: videobuf2: publish buffers in bufs_bitmap under mmap_lock
      media: videobuf2: order buffer initialization before bufs_bitmap publication

 drivers/media/common/videobuf2/videobuf2-core.c | 74 +++++++++++++++++++++----
 include/media/videobuf2-core.h                  | 14 +++--
 2 files changed, 74 insertions(+), 14 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-vb2-mmap_lock-959e0cc4edb3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

