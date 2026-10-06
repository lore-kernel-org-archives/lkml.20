Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299F2311C36
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258195; cv=none; b=fb80Kx0O8KUdM+eZ1vk1gTDjJ511RdmdEXmYqt6K/ecQnzc+DbbSnSNIBo6bm8RPXJ6I+hgXNLJz8QI1PDxtow/j2j9tzlaK7orlFiPA4C/48nUhjeP06i+lTEQiWu44c+9k7UHnRi0UjSgAhbAgO47QojKQrRlz6Um/FjetO90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258195; c=relaxed/simple;
	bh=/DEx2L2Q4OAtXo9RI0PfN3L8+9G2YV8tvNAqt24DU8U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iCi6oTWQhDtdruMPYBuwBNLxZDsU9QFU7/AD3N3u9WACGpRmJdc0a2SrvZVl/Id3Ti5ZXXAULB0iDw226mxVQMfwirsN8MVJf4DWa3b6+sBFOFnHFxjTusIVoydzzMIGuzU11z6edfi3OaI3gUwpSaJdWzzX63NPpHe7FT3vW2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fccsQiWT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fccsQiWT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so25838215e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791258192; x=1791862992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/8UFuYlqsJ3dGViD78Fjh+k40ZO86xrNe819xNRZ6c=;
        b=fccsQiWToUhBpa11fM2xTC0kbFLlfzqkiDenYtjmm+PsNyAmzJ/ZHMxDCjf3RxrH5G
         fsldWxzIG18PvpyeteATxGTQws2aMN/CcsbwcyC/ssbG/EZ58DnnjZXswWNiFYarO5dt
         2BUjla/Bs6vY5TeIWD7d9r+S60LbZ7yeWo76wABJnGJMV3iI84uUqCgLsRmJ0oAinjwh
         QsRFs1pUIc/85JbsLP02H2OJh5hTNAIwjA3shMMTgdFVyd1bMPnviXh+ZeMzitVLI7ze
         +0QmQJGZr8HNOuayIQ6E12UUG/ei9qXOiIxr/6E9WjFdVsRAqu+JVEHHqgr/6JyIt8zZ
         VmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258192; x=1791862992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/8UFuYlqsJ3dGViD78Fjh+k40ZO86xrNe819xNRZ6c=;
        b=Z+3pQFMMPN9jyjoQf5IAiOj8WHSmwPc1cmPzuVZiF6m+2xi6t/Hy4U55b6HjhdJNRI
         QTMD7Ye+5bH49LJYtlSnMIU8FLHc8Vku6IEausOqlv4O6ZAo7Sg+YspSc0ppdd4ud7DG
         BLt+DDMTlle+tnbrVAOPokK9iTDK6vfIyz+ryPtZ9f6+seUwJsZVgxvmRDkgUS669o/l
         J+ebssanDFRfTPZVdmNahsrY63zhvvydLEwUlwIDd+Ce9YPxCjdp00ZTLUG90R+Z/akl
         kJFnSk7qxALuExqeJHwYZou5rDNiaxT4wqsc0t7+knxSscEFR+jGWwmoLn/SR47JfmDW
         2SpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlap1JpTXRTpVFitoGdmn5Yx7JvSN1lUbn9kU6WVvf7wzj6CkN8E2r62qPmGxp3RiDaZDS2uuMfhaY4B8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTPiBSajmMhMioK8x99KqN+fea9IfdkhJP1daMAtfmRdVBU1gW
	ItvoOeulLGdkZzv5jKzFnZI1gd3UcrfL/a+el8gPTsy1WMaFUbpoU/ic
X-Gm-Gg: AYBFou3i72OgFSubOxU3Tc0+cONufC3e/ThXNDjC7ZrvutSRg5tdD7sm9jBGVaYI3Sj
	E+Dttfq/MpTZmDbvfi6x8C2JAdDq197OeqBkDsgOC1UbQKAz/bpp4X0tKnDPQKb4bHE+UmrNyOx
	dpq/uFKd/1jkuiLebrOcrP2DEoe/JZp9wDQHCnTq5lSohLWznMm/JobnLjw6E9Bh65n/6EjbfYy
	r9LyCFLy6BYn7WEfzLiGTWNg7CRfU2VkSB1oGsxY0Vcs9YI3W5zT220GrvxUfX/+IUT6oyuFvZh
	Fm+lj5xdoHC5879GNOeGW89Iy0Bc431XVNIS+v4pc0HfjIHjUi5f735DuDJRVyHeIBKqolPVCPd
	GtmfWkcsgBF0X1ZQnuEsWEc+GtpjogUvkBNA0KHnDrmsObi+xtgXGtoeBRgZ+hYhpeeO3fK1YGg
	PtdnEX6zauNU9VueuvcMJ8CTgCKT2YbmGXGFN/yNeEBTjT8kDBoKpHBB3iSqASdBvbjQO5x/6Ny
	aDj2S0NwohxNOBBwSaEu4DRvds63SO/notvPaTV3Y3EhRaYUeQOIqoFnJM7SOwXLGEJsmKxGgEy
	bxAUCdbSowIYRPlvF85vfCdbkGa2lS7DiC8=
X-Received: by 2002:a05:600c:c10f:b0:4a0:1fe2:d4c8 with SMTP id 5b1f17b1804b1-4a1680dd3f4mr101835215e9.5.1791258192149;
        Mon, 05 Oct 2026 20:43:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5d8dfsm38419705e9.14.2026.10.05.20.43.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 20:43:11 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Leonard Crestez <cdleonard@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] iio: trigger: Return an error when the trigger has no free irq
Date: Tue,  6 Oct 2026 05:41:47 +0200
Message-Id: <20261006034147.2370-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iio_trigger_attach_poll_func() prints an error when all
CONFIG_IIO_CONSUMERS_PER_TRIGGER irqs of the trigger are in use, but
returns 0. The buffer of the extra consumer is enabled without a poll
function.

Disabling that buffer calls clear_bit() with a negative bit number and
drops a module reference for the second time. On arm and arm64 the
clear_bit() goes about 512 MB past the pool bitmap. That is an oops if
the address is not mapped, and a bit cleared in unrelated memory if it
is.

Return the error from iio_trigger_get_irq().

Fixes: 995438233579 ("iio: Fix error handling in iio_trigger_attach_poll_func")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Found with an experimental clang warning for a function that returns 0
right after it reports a failure.

Tested in QEMU with three consumers on one hrtimer trigger and
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2. Without the patch the third write to
buffer/enable returns 0. With it the write fails with -ENOMEM and the
buffers are disabled without a message.

Disabling the buffers without the patch:

arm, vexpress-a9, st_magn on three emulated LSM303DLHC:

  Unable to handle kernel paging request at virtual address a1a2e690 when read
  PC is at _clear_bit+0x20/0x38
  LR is at iio_trigger_detach_poll_func+0x88/0xdc

arm64, virt with 256 MB, iio dummy devices:

  Unable to handle kernel paging request at virtual address ffff000020b94348
  pc : iio_trigger_put_irq+0x4c/0x74
  iio_trigger_detach_poll_func+0x4c/0x90

arm64 with 2 GB and x86_64 show no message. On x86_64 the reference
count of the dummy driver module drops by one per round.

 drivers/iio/industrialio-trigger.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index 17781c12bc85..09d3dfc9d812 100644
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@ -293,6 +293,7 @@ int iio_trigger_attach_poll_func(struct iio_trigger *trig,
 	if (pf->irq < 0) {
 		pr_err("Could not find an available irq for trigger %s, CONFIG_IIO_CONSUMERS_PER_TRIGGER=%d limit might be exceeded\n",
 			trig->name, CONFIG_IIO_CONSUMERS_PER_TRIGGER);
+		ret = pf->irq;
 		goto out_put_module;
 	}
 

base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
-- 
2.53.0

