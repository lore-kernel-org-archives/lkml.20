Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467388;
	b=pAznerlVko7zMXlOJCBNtysQSjASTfWhJ1L9nm3tVira2SNM/RE2tCEBSGR+9z10vfg9
	 QFQ1h/M/mXd/p6mdwNeitE9Okbz4AcZPhQv7uwtjuvYJfwhBWdwC78esjeGia5jxlIy86
	 zC0I86jVBA6s/eBj/NY7OjuzqjSG+fmLKv39BNxY5DC6EvoRL0p6ZoKABCULXack4Cqxc
	 Kd/5+YVt6VRrCY4uH/xf3bfILnYy+qhYPUDvI7/upIuApWkefouWA/kZDNgPcuU6+Rlhn
	 NHtrQTAENL4CQ6wDyJGgW2bhpEAGSHl1MI8LwiYifJq9zuBqc/ZVeHMP7e8v1P3dcuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ga64ejtKP8vihbB5AdVC6YmsQYSLFpLgjmPK9HX3a5U=;
	b=l2NLz+LkXLgMCg7k9jTLUzaex0N7oT+MPhpf4AMbxAbW1R6+Y7A/H+u7Gv7dxC/Gdw+m
	 /aifVVQ9E8l3iAp5AksEblsDv1D3bN+Z0OMqFYzo4iObWYeVhh4CmN237tnmm75P8Meem
	 jQ2bXuAFozjoax+/kGOegM5XArj48B9VmMvjQPd2k1WtCYP2DV3NagyhlAmuKDfq9c6YJ
	 Fl0/UzAHZNzmgyB3OX2Z7kdlQxXKK+PqRQ0NHK1amy/gunw4sAdi5P6wAq4P+J1OW7hrA
	 B2lCeX3Tly47GzOPTr4EsofWD9kF2rV1hE6++F03rex9+4cI/mNK52HpCjnGCBBVK2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m3/m0vYe";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3/m0vYe
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9ae391a05so3603405ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467387; x=1795072187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ga64ejtKP8vihbB5AdVC6YmsQYSLFpLgjmPK9HX3a5U=;
        b=m3/m0vYeupFvjQNaPjKDPkFLsUyXx9jEBdrB0K1bpkO3alQdtmo1vE+zim9W8ipoXm
         +9YM8b11z+WNi/nDDC3DMbU5inU+uVXRq7aWUWs9jjGjhBMXGTEfo103skUpDsn7fCnT
         f70uWmd4HO0wtacdDI1d9Xo0oYw8T/ng/ffHRdDJ68onriuRZCcMt+aqS72T8Wop8C6v
         7y6HZPKmg++iVkV+Pe49Z5b+VJOELM1lneEL3VTp+8rIb6PGq1Qwuh2s41IQ6VcWGzxm
         HUzwW78xhHKytox5cImMVH7URg3wjo97rdv5ILq0kdgTrxo3S72CKU6AeYIqa1JxsaJo
         0TkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467387; x=1795072187;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ga64ejtKP8vihbB5AdVC6YmsQYSLFpLgjmPK9HX3a5U=;
        b=KX3avOHLjEh6eqV61CG4kez0ZqLbvbRESi5MCLbtihMvQDQNr4+nKboVivsYHdfRUn
         mQNXAgEAWeryZlI54t7FE5vtGUmDhIT84jUkUnvIbDJ/fjZWThYitMJitpWwB7URqNa0
         eOrZ0DgJ4VTuHropMSq8PSVUvX0/Ul+rGlMrQ2ysq1KBU/uRkvZ/PgVtEgZXmpVb4PJQ
         n5lOnNvyW1EZlwU86pIB2rHaN5137cGUhN7i+MuVXPOsJWVtsjsPOkLlJcmDYQreIFLj
         14CPlOh5ORSgL86aoEymSN/doSPQLmSVOIFFJZU3XdgoI8yTob6A/ZuzfKVbVYZ3fUmq
         +ZGQ==
X-Forwarded-Encrypted: i=1; AL+hErHnNr7rzuCJL46/6SRNEesRPeE6gXswPs17MKmR7QuzvlZ7pB6HddyLHvuR4pl8Ze2qBjk0OgGRUtVPNCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z836ssPgRzJI/OnM9gUv78mUjrNHHudL2vXtl8n28Nc7whA88W7
	lojKyajydevb7N7ISS9ViabsYrH8MGNoe/eq2OCByAFrue9tyHxVd+/dq7njPbz4
X-Gm-Gg: AYBFou1eKTsQEbeejmH0gRbHZQUNckqQj8Wc7h0G0GqL23rpjc33DkEV1yJlssV2aKZ
	7dDM09WxOBDK0PPKZ13ASd1cbHdH+qtr1mmoZKgTT3RfxY50qiJiWQQSnquCXKKfN2lloZZsWFX
	vnKaRQi9RPRHeLZ0PgUP3vYwZsvfMFlW9Bn0yChUSttlf7MttGIPym0ypdqP60BoJ5tLfBpCPoi
	+2shmcJWBxkpSEoQwYL/QFJpt38z0IxKM/wjHdVv0cYRCn4oNdBzyDFttvRpZazzemUWjCpEqNu
	lv2zCyvpgs8EW+kdscO9+ZFahQaAdSHWOw+9vW5CkPSPqIlPqyeywOIeKgtcR9IMi63+/+mlcbO
	zbHjLSY2/uKIN8AmyXSklZrtHcBUo4vYS6+JM9nuzaXm/uZpKbC2fD87fS/uRSpPqeyoOy+c2Ft
	75fT1/Hx0L8menZEOxWfNz2WBcvl7+M27onwKAXk0lexJOEI/90iE8587CjuHHSq+AO4Zba/ncZ
	qzx3UFf/lLaaEnfgtBHh+NCHhLzOsy//TxMTthgNPBT61v1GPzP+CqDGDauuRPWjnfbhLCySV4r
	DFW+QvLzq5/yakK+VhObOZzzuUPJQ+UCRzglXT0FHJdPurDZmORHcPhGe2hA4C1cUv5nB2SczMV
	K5jk3HQmQ27aCAyrudU/tawyWVfV+ly5HO5t/aG+WMzY=
X-Received: by 2002:a17:902:d48a:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2edf167035amr12354095ad.10.1794467386732;
        Wed, 11 Nov 2026 23:09:46 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:1866])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9baa5sm28966385ad.45.2026.11.11.23.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:09:46 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	paul@crapouillou.net,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] iio: buffer: hold a reference while DMA-BUF is attached
Date: Thu, 12 Nov 2026 15:09:40 +0800
Message-Id: <20261112070940.2527455-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

iio_buffer_attach_dmabuf() stores an IIO buffer pointer in the DMA-BUF
attachment without taking a buffer reference.  A delayed DMA fence
completion can release the attachment after the IIO device has been
unbound and its buffer freed.  The release callback then dereferences
the stale buffer while detaching the DMA-BUF.

Take a reference when storing the buffer in the attachment, and drop
it after the final detach or when the attach operation fails.  This
keeps the buffer alive for the asynchronous completion path.

A KASAN-enabled test with a DMA-BUF-capable IIO test device reproduced
the use-after-free on the unmodified kernel.  The same delayed
completion sequence produced no report with the change applied.

Fixes: 3e26d9f08fbe0 ("iio: core: Add new DMABUF interface infrastructure")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>

---
Changes since v1:
- Dropped the nonstandard Assisted-by trailer.
- Added Nuno Sá's Reviewed-by tag.
- The fix and the QEMU/KASAN tests were developed with AI assistance
  (ZCode/GLM-4); the author reviewed the patch and the test results.
v1: https://lore.kernel.org/r/179378580164.73301.2666197876060323279@gmail.com/
---
 drivers/iio/industrialio-buffer.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 4294101810fd7..bfa6d19471126 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1597,6 +1597,8 @@ static void iio_buffer_dmabuf_release(struct kref *ref)
 
 	buffer->access->detach_dmabuf(buffer, priv->block);
 
+	iio_buffer_put(buffer);
+
 	dma_buf_detach(attach->dmabuf, attach);
 	dma_buf_put(dmabuf);
 	kfree(priv);
@@ -1741,7 +1743,13 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 	}
 
 	kref_init(&priv->ref);
-	priv->buffer = buffer;
+	/*
+	 * Hold a reference for the asynchronous dmabuf completion path
+	 * (iio_buffer_cleanup() -> iio_buffer_dmabuf_put() may run from a
+	 * work item after the device has been unbound); released in
+	 * iio_buffer_dmabuf_release().
+	 */
+	priv->buffer = iio_buffer_get(buffer);
 	priv->attach = attach;
 	attach->importer_priv = priv;
 
@@ -1789,6 +1797,7 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 err_dmabuf_put:
 	dma_buf_put(dmabuf);
 err_free_priv:
+	iio_buffer_put(priv->buffer);
 	kfree(priv);
 
 	return err;
-- 
2.34.1

