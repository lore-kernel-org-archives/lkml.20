Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591148;
	b=yM7/z06oFrBSjnTzMDarRZrPOVxM+CTOUBRrbyrRoQPxSNYDp9E0k52cvSHkEW4bvWnd
	 0nnarowbhTlIhvbn19OM3SdtR4jQjq77Nh7UIMuY25EkvROxto49rOxd5WtmkyQ3YBkZ0
	 bUYNxob2BzYs8RSfQsWEyrJqR0t+DWhwbzEQXftIYKYe8U3XAm7OtvEFBWxNo1fW2LZLO
	 TuN+zmlrwARu01bZehrEpgf9MGMPAAopdedmRbwpRAUMhEXai/aqpWG+9U/EknsEgROzp
	 99LX5XpKOmjsq5cSjsiy5EeIcVaVZXDcGNYMq40r39AI0l0dPSKevMI7vTdUrvlUWIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7653Z25URCQw51Ar2IS4ZcgvokQrZoYW0xDq4LSwubQ=;
	b=1paM+6F7PUZAa1I1PJn2lOU9hBj59dB0E2G4VmXPgW+fmO2O4kOMIDiqHhEspyh0i9bw
	 y4YhMEFScHh9G9k+QZ435fMaeeGw+fX84cMpv3KZRuTfXxPOdYjQOO0MzGxUtL2jwzsoN
	 FlODsf/4/71ZUONdMa+TmXJUwu5HAJAJeJRIz8l5bV74urDturbwaFoKmqyPlZQOBb+ny
	 hZsPuTGem3m9MITL2DuCLf70V2JGEOj3Wi8E+wzvii7G0biF2Phjv+3vkXkh1P0gZZzrm
	 qKhfP6C/WpLiz3+TiistyzVzpOJ1kwi4bLS8TA8TcABKNBJ4QBDNSdfSemYwQCBHWKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wul8qBKR;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC57606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC57606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wul8qBKR
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550c917fd3so3540054eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591147; x=1794195947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7653Z25URCQw51Ar2IS4ZcgvokQrZoYW0xDq4LSwubQ=;
        b=Wul8qBKRAP0Daw2OPIL2Cy4HHNJ+FoV/0vVmVHZYOA5NVJ5gWZDkIRPHdDSx8covUr
         uWzh8og36uKFtFcS3tbT3hTw5nyaoGRoegdsnfemQEJTIyMWNuzegAW4uHUBOdgr8ez1
         noUeR0laq2sce1zBSQl8od17Q1KFMjYxdNaqWvhyWMnP8nq6CEjPfEaRT4GB5+tbEnea
         Y3tACXNmFc2MDq6qRmuql5mQqeR+NyU6yFOHIRf88d8YzZoZr03WwRKKb0hKrgsvdy+3
         L3Nf+W0WvLbQBv2mjfZOUdVjrJPw/x/ouWtd6xzBYGroEB3fYV0WeaokxUqQQHho/7tb
         eXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591147; x=1794195947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7653Z25URCQw51Ar2IS4ZcgvokQrZoYW0xDq4LSwubQ=;
        b=GSyNKpxHNx+etOgUtm5noUviKrFPSVjvNR93AhTFicL85FjfjbWuzNN2ntiQh7SAag
         58QocMC+19xas/NvRCrGnitMdpsvckKDt9kadZLFKi7CSLsSfQ6HzUnehyGFFLHd4gCb
         pQUnm0nYqzZfNXPN6a+mgMHcfpOxFO5sZ/RYaiz0xXflZPXq3GX9A7uqYEKMwvNfn0Vn
         RcQXS7ibDiKwW+CKyJ9t0QPp4wkXfRvrM9GRZ+gHTZirxJe5sPcKXVqcoYJ4//h1P0Id
         RFzloMQs4aeg67Kxxr+Ra47FxDDIXHYs7xcULiz8CZMz6RJ/EVBsaUBR6ctCj4KMWCEE
         lCmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKBi6apq+YoQiBqcA2EH7VlaoggrQCm/SiWFzV01ClvyfRiZPONLaMlGJg53yhJYkpatg8bpBYFntJKvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wkKh4ThxVegh6oGTP3DcOMYUpaTdoAGaBJDefogihD83n56Ee
	z9LnvIy54bhxfg5HdixAwTL859vX260p2IG/VWgjT/6pb6MKfWw7JeMeR600qRSw
X-Gm-Gg: AYBFou1PJw8ICjRAPdkMa3S/e0WE0lo7Gve7XETEtOBkixIGGN6jLpP60AmKkOQWVtQ
	8/emuDYi0zwZ+Mqq1DB9IYN0CqFejslsrvUjH8zq+XFPBQz1mk55st7zEU4AmwiyhA/zeCHB1eD
	KxkFqmD1uifEP4wnA3B1DNTUjpGQuzhJ6hb7e7h2q5X0Z1ZfyxtIzF3xBOVkf+BwafdMG6yfGz7
	uL5wy1Hid9zZVMmq2prZVTD3Y/aU1Uzi7WWns9w5wAle8g4vNgL46nA8YwRrHC4hnIdYuhRyST/
	6OXBelbW+Ube72cG6MmYUDfQwM+SPwcghPG4KD5RotKgV0ndUGcgKRrYoiLVDdwaCNtXa5A+doH
	Cu/QdXx0S8z+JvpEofSV9TRBWD8gUEVquJXwp/aQtUHhwdxqSgV8iKzyq3HBfNBi2dG2W3y6pu3
	2yZEYybIyu4ptXkjLvtJOxnUxlntOlAj8rGwkHZirHoVG0ZFaTo39JGzVhSQZYyQbl4FSFry3pI
	2en3/nEmCdLyUPdrOxbBDkuVBTt33k9rFA+1H+n0rxP5oaZ6btKv5BzV/nyouysneIOPP5CxTeX
	CstLo7LJ4rx6Y20MfFrpcHp3Gx769C/fQ/YkXsqK/EYP71g+sY8sYYF+DQnglAnjNrzZwE3GdxZ
	5QICJly4/98t24CCvp+1YsqLsuuGOVQJBt0llL1WUvqFzIH9m4mliQyvio+Fw3RZp6vUGNg2xQs
	8QxF8G
X-Received: by 2002:a05:7300:6d22:b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a425e10f8mr21842182eec.36.1793591145568;
        Sun, 01 Nov 2026 19:45:45 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm33470820eec.21.2026.11.01.19.45.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 19:45:45 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] iio: trigger: fix use-after-free in current_trigger_store() on concurrent writers
Date: Mon,  2 Nov 2026 13:45:32 +1000
Message-ID: <20261102034532.33246-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026100246.68005-1-yuz08559@gmail.com>
References: <20261026100246.68005-1-yuz08559@gmail.com>
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

current_trigger_store() holds iio_dev_opaque->mlock only around the
INDIO_BUFFER_TRIGGERED / trig_readonly checks and then drops it. The rest
runs unlocked: it reads the current trigger into oldtrig, acquires the new
one by name, stores it into indio_dev->trig, and drops the old trigger's
reference with iio_trigger_put().

sysfs does not serialize writes to the same attribute issued through
different open file descriptors (each open has its own kernfs_open_file),
so two threads can run current_trigger_store() on the same
.../trigger/current_trigger concurrently. Both read the same oldtrig, both
overwrite indio_dev->trig, and both call iio_trigger_put(oldtrig). The
extra put drops the trigger's refcount to zero while it is still in use,
frees it, and a concurrent writer then dereferences the freed trigger.

With two sets of writers hammering current_trigger between two software
triggers on an iio_dummy device, KASAN reports:

  refcount_t: addition on 0; use-after-free.
  WARNING: CPU: 3 PID: 3467 at refcount_warn_saturate+0xbb/0xe0
   kobject_get+0xf6/0x100
   current_trigger_store+0x15c/0x4b0
  ...
  BUG: KASAN: slab-use-after-free in current_trigger_store+0x168/0x4b0
  Freed by task 3468:
   kobject_put+0x125/0x220
   current_trigger_store+0x2cc/0x4b0
  Allocated by task 3454:
   __iio_trigger_alloc+0xc7/0x100
  ...
  Oops: general protection fault
   __module_get+0x27/0xd0
   current_trigger_store+0x192/0x4b0

Hold mlock across the whole operation so that reading oldtrig, swapping
indio_dev->trig and dropping the reference are atomic with respect to
other writers (and to buffer enable, which the -EBUSY check guards).
Acquiring the new trigger with iio_trigger_acquire_by_name() under mlock
is safe: it only takes iio_trigger_list_lock, and the buffer path already
calls iio_trigger_{attach,detach}_poll_func() with mlock held.

The trigger swap itself keeps its goto based cleanup of the newly
acquired trigger, so move it into a helper and take mlock with guard()
in current_trigger_store() around the mode checks and the helper call,
rather than mixing guard() and goto in one function.

Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/iio/industrialio-trigger.c | 60 +++++++++++++++++-------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index 76926fe..cfc6af0 100644
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@ -421,37 +421,14 @@ static ssize_t current_trigger_show(struct device *dev,
 	return 0;
 }
 
-/**
- * current_trigger_store() - trigger consumer sysfs set current trigger
- * @dev:	device associated with an industrial I/O device
- * @attr:	device attribute that is being processed
- * @buf:	string buffer that holds the name of the trigger
- * @len:	length of the trigger name held by buf
- *
- * For trigger consumers the current_trigger interface allows the trigger
- * used for this device to be specified at run time based on the trigger's
- * name.
- *
- * Return: negative error code on failure or length of the buffer
- *	   on success
- */
-static ssize_t current_trigger_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t len)
+/* Must be called with iio_dev_opaque->mlock held. */
+static ssize_t iio_trigger_set_current(struct iio_dev *indio_dev,
+				       const char *buf, size_t len)
 {
-	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
 	struct iio_trigger *oldtrig = indio_dev->trig;
 	struct iio_trigger *trig;
 	int ret;
 
-	scoped_guard(mutex, &iio_dev_opaque->mlock) {
-		if (iio_dev_opaque->currentmode == INDIO_BUFFER_TRIGGERED)
-			return -EBUSY;
-		if (iio_dev_opaque->trig_readonly)
-			return -EPERM;
-	}
-
 	trig = iio_trigger_acquire_by_name(buf);
 	if (oldtrig == trig) {
 		ret = len;
@@ -492,6 +469,37 @@ out_trigger_put:
 	return ret;
 }
 
+/**
+ * current_trigger_store() - trigger consumer sysfs set current trigger
+ * @dev:	device associated with an industrial I/O device
+ * @attr:	device attribute that is being processed
+ * @buf:	string buffer that holds the name of the trigger
+ * @len:	length of the trigger name held by buf
+ *
+ * For trigger consumers the current_trigger interface allows the trigger
+ * used for this device to be specified at run time based on the trigger's
+ * name.
+ *
+ * Return: negative error code on failure or length of the buffer
+ *	   on success
+ */
+static ssize_t current_trigger_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t len)
+{
+	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
+	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
+
+	guard(mutex)(&iio_dev_opaque->mlock);
+
+	if (iio_dev_opaque->currentmode == INDIO_BUFFER_TRIGGERED)
+		return -EBUSY;
+	if (iio_dev_opaque->trig_readonly)
+		return -EPERM;
+
+	return iio_trigger_set_current(indio_dev, buf, len);
+}
+
 static DEVICE_ATTR_RW(current_trigger);
 
 static struct attribute *iio_trigger_consumer_attrs[] = {
---
v2:
 - Move the trigger swap into a helper, iio_trigger_set_current(), and
   take mlock with guard() in current_trigger_store() only, so that
   guard() and the goto based cleanup of the newly acquired trigger are
   not mixed in one function (Jonathan Cameron, Sashiko). No change to
   the locking itself.
v1: https://lore.kernel.org/all/20261026100246.68005-1-yuz08559@gmail.com/

-- 
2.43.0

