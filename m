Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703373;
	b=4B8UewAnTmVvxCGOevcZr72BXFRvfInJijvsnQJrUiEg3JWfA9c579i75PiRiNoKzzAs
	 O5RsBRNXSimJTJ8k2mLRbSTv+X8FfrchVcXEX/n7vjBgdIHE/6OiOeehM93h/jObhbUjr
	 eSmeDl8W+atFFHputlzvdgatdRujk+dzOtWzZV9kjG3wxOjH4ivcy92eG1dKs5t0Z3G3w
	 TOGr393Juwg950YMr+RnA8LWn6JfGpl8iulDRCSD7t0XDvS84N0J/4pFGADc+hJA/jqrB
	 /t6KNuRFDoQGWUregOTwdQXYm/KuvMqSpThbR9aiHGayHB7xWjjCY1o+hWGdpm3VXqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yKR6z/tivkvMCUb5ROAsGb0r4GFzf/k7VChj5fSZuh8=;
	b=RVXPiMTvSxJDrBz3IH9EM7/mVXvFap7CGhxZTmBBU/3qClo0i3iqcoO96U2Ii59S2Y4x
	 aCDUHa6jqpu00QoCtQGWazrnXpUDIUEQj3npRZC4X1Mvlau3+kKVkgXukMFb/Q72hOuAJ
	 sPceprdIIoAT33lmZsrNN2UwYvXW5tiZudrqALNXYX1L2ko4GNImISi+aUbS5gH5y1Eyk
	 hY+mCFPSt8+gceUsIc8AGbukHhwBH53JMwuyvmUHpv+YOsL+kSsJWOZTDN2zv9j1Se85U
	 B15VnMfTrmL1C5sB90mQBtB72ULNlV+ynv//u/rzS9LdtQ+q0KDjSfvefvtYGqityMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U5XLIyQA;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB89606EEB4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB89606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U5XLIyQA
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so3698576e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793703371; x=1794308171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKR6z/tivkvMCUb5ROAsGb0r4GFzf/k7VChj5fSZuh8=;
        b=U5XLIyQAQ7xr07tOMX3ePVaRpwIzstaLqVeCqgtBITo/8XqXmzudY8QRelIzK2WVYJ
         gNalBp7TxuO/ON2Df4E4TNztGYb8wkhI9I6pqGpNjxzJFY3YhcNe1Jr6hvABEJWkwMil
         JdLz+vz7iD75uCG/5Y8PskbJQSOXCyYLXZ8zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703371; x=1794308171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKR6z/tivkvMCUb5ROAsGb0r4GFzf/k7VChj5fSZuh8=;
        b=WEquTm4Mx2UG1U+uORulNnnYLkNAdlVAIJeVYJiRraoFsog1dlplUM+2kJ6nhy6vxm
         FIRrWfHZJ0keAcwjpKumyEBC9OhLBIk9By8MZLogGwbbbldfHj1lBwNHgbetFErhu9OX
         tZiLf1SLSoKfUXx1J5w57ADVQUfEPTPD20+lwCBlej8zAIJ4LOMBoUC1HinB70GkKG47
         i5kMoHNkM7KiWcqsQS7AIbwcuEBO6pBlkPKnOpFt5YY0DuyRC0WJrV0l7NsAuBmS4TO+
         r9oZ4xTXANiXxw3X8MbWRHlbzkc5O91tOvOkrt5bmwRb9Scr+lEO1PXEZ1g25v6CztEp
         2hqA==
X-Forwarded-Encrypted: i=1; AKwUvBz1IAAt1fSZRaEQ8VjgoVSyuwl8zwV1DCjsttpDwXnhkg4PPYaM4zDUY9+1HoLrmhOwdCV5lqKpJJSAEnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yXMyjBHy8pgiQjiordwdPqrdXz9Nsm1xLgDQpJiymXC6qupvo
	wRQIpUbkPKoGjFexQT5n/JlXgCTzJZQU3sw0+ibKDVSoE5yMlBGg6TrsrH7JH0S/Wg==
X-Gm-Gg: AYBFou0xLbsqxRdCzJ2paWbzGybzICY093e6fzzROCSOPPyr5x2YdEBOnKjZEk0BViX
	feyYMEZ2TisOvglGhnl/wxxHNAB6c3LdVzPJKA23CcGgebiMExa4fUrNFz4ovl5P2joq9b/MYxY
	qu9+tzHsoyGk94IgHdC/fCKlsRXE9wFaZ2n/H6wTfVtXoq6GBz7oC40uo2SXVtggBXrogLPRWOS
	bEAku43xuYxidLi6IBpMZ0tWBumxxyvP4oFgrbhW/dP+HGXto8xFonSBahs2SfdXVvuCi6WoSQt
	L40G26gAJXwlDCEK7kKPASPxuFScGlsrqiaRVdU51hzRtKlIqVqVFsB6hGZzgiHTOci7/Vtp2ho
	iDqdcDMYUop8DdVkmDkXHEC3obuYVrblkNaI0K3i/XignVTLdpLOLvJN0rfhUJn/oiNd4FWBtit
	XwJCKYZHouU8TO5dq4beT+8tzZIzoXB6tRMVyUpjsnTlmsc+zpwiK/8ag/XShkrdP/yjYwKnbrd
	SquZfkUaVfylQo8xtxXMISKGMEr+xILilfs+JjbYLzxMRLQanq4ROlbo3bE6OpR1Lq8OFWl+ZvY
	C8SsgmM1HQugW8IpTpHpGHjXOtdJCpDEbqhkcewiEtH723OtZGGMFpNGC+2JVuso0cIyuZnOz+M
	XWC5wecsBDw==
X-Received: by 2002:a05:6512:2354:b0:5bf:d6a4:a133 with SMTP id 2adb3069b0e04-5bfd952016cmr4597256e87.3.1793703371356;
        Tue, 03 Nov 2026 02:56:11 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0754779sm2103257e87.82.2026.11.03.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:56:10 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 03 Nov 2026 10:56:09 +0000
Subject: [PATCH v2 2/2] media: videobuf2: order buffer initialization
 before bufs_bitmap publication
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
Message-Id: <20261103-vb2-mmap_lock-v2-2-054e11dcd013@chromium.org>
References: <20261103-vb2-mmap_lock-v2-0-054e11dcd013@chromium.org>
In-Reply-To: <20261103-vb2-mmap_lock-v2-0-054e11dcd013@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Stateless mem2mem decoders call vb2_find_buffer() -> vb2_get_buffer()
from .device_run() without holding q->lock or q->mmap_lock, which can
run concurrently with VIDIOC_CREATE_BUFS on a streaming queue.

Both set_bit() and test_bit() are unordered, and mutex_lock(&q->mmap_lock)
is only an acquire barrier. On weakly-ordered architectures such as
arm64, a lockless vb2_get_buffer() caller can observe a newly set bit in
q->bufs_bitmap before the kzalloc() zeroing, buffer initialization, and
q->bufs[] pointer store performed by __vb2_queue_alloc() become visible.

Pair smp_mb__before_atomic() in vb2_queue_publish_buffers() with
test_bit_acquire() in vb2_get_buffer() so that any reader observing a
set bit in q->bufs_bitmap also sees a fully initialized vb2_buffer.

Fixes: a286b0837e13 ("media: core: Add bitmap manage bufs array entries")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 8 ++++++++
 include/media/videobuf2-core.h                  | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 70ef38c3d16a..d0dd4b22b646 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -461,6 +461,14 @@ static void vb2_queue_publish_buffers(struct vb2_queue *q, unsigned int start,
 
 	lockdep_assert_held(&q->mmap_lock);
 
+	/*
+	 * Order the buffer initialization and the q->bufs[] stores done by
+	 * __vb2_queue_alloc() before the bits that publish them. Pairs with
+	 * test_bit_acquire() in vb2_get_buffer(), which is also called
+	 * without q->lock or q->mmap_lock held, e.g. by vb2_find_buffer()
+	 * from a mem2mem .device_run().
+	 */
+	smp_mb__before_atomic();
 	for (i = start; i < start + count; i++) {
 		if (WARN_ON(i >= q->max_num_buffers || !q->bufs[i] ||
 			    test_bit(i, q->bufs_bitmap)))
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 2e93e6985d5f..20b961da21e0 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1288,7 +1288,11 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
 	if (index >= q->max_num_buffers)
 		return NULL;
 
-	if (test_bit(index, q->bufs_bitmap))
+	/*
+	 * A set bit guarantees that the buffer is fully initialized, pairs
+	 * with smp_mb__before_atomic() in vb2_queue_publish_buffers().
+	 */
+	if (test_bit_acquire(index, q->bufs_bitmap))
 		return q->bufs[index];
 	return NULL;
 }

-- 
2.56.0.385.gac671c819a-goog

