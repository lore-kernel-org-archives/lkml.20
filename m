Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278864;
	b=OTNn0wB7aanYBa6QtFj0YWMubTUlDOMG9gHcv4wAHJx97O/xKsyoFQUmUvr8J5MnsPJQ
	 wcxjlICTSxmoU/fwEEdesHghYeSX7wn4I5+sURA5BQOlJggEUWVIdCQVH4REQZMjI9OZc
	 egKJo1dOg7YDCITniAi4u80X1pF74cR70JEXcqs1hkf3DI2Z2d3TDRvFLIosmfemvxDCD
	 5YgUq1FjuhhzMmCHhnvpguSFUh23jrUxM48+YuTW+IeSmGrpPQg7SrR3Pd95ATLpkcX/v
	 OqO5LTajvXsJ1UZJu++matddhfGMFNxYAw6E+zig+m4kNUKLzpzMO8CinccVqiOALZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pqAIggo/SjoAGnKs8jyczcI2Ycl4/WyDK4uIxzW2XA0=;
	b=Cp9ZH+YJEarTVeOOoagye5ciTdojVogxju1CIc2IzdBSjiE0kPQ8WGA8UCrA14WIha62
	 cQwiPHDIVVB5Amax3X9dTJrnxroJaLcirhzuzmfvamSeIMIuDh+ypHpi+4Z2ab1Ml9E3k
	 mYXLPM3BtNHBXYPldqBocih0RWSuHESWwWLbSQSSTdtnZrVNz+RHJujGMcfY02l3h/DLv
	 ZGv6UsoomvXk2+j+vgnt19kMVDd9Jv+onvjh8gbZOGBYjJbx58NucODkfJinh5K/djRbj
	 +O1olpf8JeJ7nNj9xuTKVaHuP23nZg1xnwp6UaewrTjOf/2QTLpwIl7zWu19mpRzpfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsl+kL3q;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215560A2616
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C215560A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsl+kL3q
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89ff475a152so945515b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793278863; x=1793883663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqAIggo/SjoAGnKs8jyczcI2Ycl4/WyDK4uIxzW2XA0=;
        b=Qsl+kL3q8L45e98ETndHKZz15pZIvpRiin4sqLdWC+Ifb5HgzaFfwJP6r87ZGkrC1C
         vq7uUP3Criz/zcp0CKJArxhRZdpD2BE2ZrZHaUUmXa/Y+UmPze9A6eb8WLGLsWeS/BCo
         EOEMulabXdbVMzeVNEIhlEx1HB0xYFoe9JeIObHIXPY7rZkP+ARiLGoxOfwCdayUExoS
         Ivv+TACeCBti0Fz6Krtu+PFcto5HFXb2JLyxrajdMlDx0tYT67aIB5QLjVMlLEY9xqPO
         0QGOdLMWVxonDKerJCZgrB5vtIrR/eC9w+9etW0jprBsb50EReIhIHoqY5saVP44QMSo
         am3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278863; x=1793883663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqAIggo/SjoAGnKs8jyczcI2Ycl4/WyDK4uIxzW2XA0=;
        b=DrCS4V17eZO+k9rtiHZtCh2s6voPA16QgabTFrzHlzx9u4mi2/1cv7zE6Kqpg6lOfQ
         5b2CdZ/StAVFzZFJUSy96//jDaAAAlqB1gr14aDg3wlM/lk5s/F6hnhp8zjPjbZY+dRT
         80dtDtv4tPoDsyvXMWbgvoxea8lRmFVb7b+oL5sKObL/wRQ/YYPgpTNr7RhI1o0NQBE0
         E56vjiJ2CM7uqNTADy2epA4Zse6KQMl5XY2wszOgSG5n8sSERLoz5fqtKFMme3noK8Gk
         gnf8gW1T0sF3pHQik5KtZAO2Gb03X5O/I5kBrcZJA6fhzxC48putUb+a5a0uMTJo13CG
         704w==
X-Forwarded-Encrypted: i=1; AKwUvBxrouoc83n5gcveOMIFgWRWR6shdLgSdqnb/uFWjxPGNCViuRENW2ILmIoQ7qE/jo51XXzwUi+mtmXnbZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBJZZv//Vga0vwdIbkSsuV4WZBXXAU4wG6OnW7WhenoA7xhlEh
	lM9bwm+8Dj3Zm6nOFCJOtgBkdWOB75XIL0vlazHdTLo59bpNCaTFXuD8
X-Gm-Gg: AYBFou1H0kW35mPlupRPQhZca1Jt9ZYwNQuZjicyxXHlEkCRG8oG/1kZMHEoEoWeovh
	J5OgopxDOgQTJbnuzaTLeWiVB+JPzDc8HvSz1uIF5J90kP9u2qLOt0pFsuJrQ81YXeoPnEq2wF0
	i0UyzyJiWOuR1vvbGKc2ZbuzXG495yYvTUNUwma5k7AYSY0/k75p7ttilu6gCvB/QQtBmh6iyr/
	nfXbNWog7bUcKUF4WqlyH8bvH1hiASVrs4ISVVj5L1Z1hOoAmk2gs7siKpGPd0d2DxNlnHqBBmu
	gaizpzovh4FDlvmddeifuIZPhNO8KsMJifXA63/ksVWAspnHnJf5fMdXtZlT+WFk52Ox8hHEdmY
	mcjDd4esfgLPVhTAAY4ujJS6H6e+quhfY1VY5f0f7RjO4v5wi6/hv9wI2iGgOAGa1WbB7axEfU6
	iCh4rvpFcrsWF/HnQF8tt1oqUaOvcUot31+SzaSw4Jj3QZnvu3iiuqN0TQsYuYDjxYrupk3XUgZ
	JqP72pnDgveMNluS2iDNmW8e58pecTRv+AwRf2N0uJYyyjCZCjn2+fgZXWOJWTXCWcLVJ/3jXts
	9Zcev5+5A12s6P1hpbZRfoatHUZHkE50T2LYwPxKwL0VPwir+w9qMZvc0mtmG+QeDJDAwu0OajP
	yYiSk0t31l6w=
X-Received: by 2002:a05:6a00:3918:b0:89f:c71e:abb3 with SMTP id d2e1a72fcca58-8a6e80ba876mr4394429b3a.50.1793278862696;
        Thu, 29 Oct 2026 06:01:02 -0700 (PDT)
Received: from localhost.localdomain ([2400:d802:dd7:8000:180b:d22a:69f7:ac40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662d96asm2290764b3a.26.2026.10.29.06.01.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 06:01:02 -0700 (PDT)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: core: Do not put the device when device_add() fails
Date: Thu, 29 Oct 2026 21:00:37 +0800
Message-ID: <20261029130037.5505-1-izaiahsun@gmail.com>
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
Content-Transfer-Encoding: 8bit

When device_add() fails, rproc_add() calls put_device() and then
removes the character device.  The reference it drops is the one
rproc_alloc() took with device_initialize(), which belongs to the
caller: after a failed rproc_add(), every driver frees the rproc,
either with rproc_free() or through devm_rproc_alloc(), and both drop
that reference again.

So the rproc is freed inside rproc_add(): by the put_device() itself,
or, with CONFIG_REMOTEPROC_CDEV, by the cdev_del() that follows, when
the character device drops its reference on the parent device.  The
caller then uses the freed rproc and puts it a second time.

With one allocation failure injected into device_add() (failslab
restricted to rproc_add) while st_fdma probes, KASAN reports:

  BUG: KASAN: slab-use-after-free in slim_clk_disable+0x38/0xf4 [st_slim_rproc]
  Read of size 8 by task insmod/69
  Call trace:
   slim_clk_disable
   st_slim_rproc_alloc
   st_fdma_probe
  Freed by task 69:
   kfree
   rproc_type_release
   device_release
   kobject_put
   cdev_default_release
   kobject_put
   cdev_del
   rproc_char_device_remove
   rproc_add
   st_slim_rproc_alloc

followed by use-after-free reports in kobject_put() and
refcount_warn_saturate() from the rproc_free() in
st_slim_rproc_alloc().

Remove the put_device(): the caller's rproc_free() drops the reference
and releases the rproc, as it does for the other failures in
rproc_add().

The problem was found with kbound, a static analysis prototype that
checks whether callers rely on an object after a callee returns a value
for which the callee may have released it, on v7.2.12; it is present
in rproc-next.

Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
warnings.  Run-tested on QEMU's arm64 virt machine (TCG) with KASAN,
using a device tree node for an ST FDMA with a SLIM core, so that
st_fdma_probe() reaches rproc_add() without the hardware (no clocks,
MMIO windows only mapped), and failing each allocation in rproc_add()
in turn with failslab: before this patch every failure in device_add()
(9 of 9) gives the reports above; with it nothing is reported, and the
rproc is released once, by rproc_free().  Not tested on remoteproc
hardware.

Fixes: 7dbdb8bd7c02 ("remoteproc: core: Cleanup device in case of failure")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5 kbound
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b88bf179507d..e4f44a3c8b4d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2309,10 +2309,8 @@ int rproc_add(struct rproc *rproc)
 		return ret;
 
 	ret = device_add(dev);
-	if (ret < 0) {
-		put_device(dev);
+	if (ret < 0)
 		goto rproc_remove_cdev;
-	}
 
 	dev_info(dev, "%s is available\n", rproc->name);
 

base-commit: 82d0bbd67c42a44f0e18b0b7b0da0f3ace0c9527
-- 
2.53.0

