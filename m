Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218257;
	b=1RByqTmgpSs2PoQSEEeSw+eYVahvYRSTJ/pZ0WLh+XI6RnowJ171AoP0aCN4Ot+gyAlH
	 FHVqKP5hFuIB8/kzEXKCxj5V0mWck+xX2p5AHOt/dkyUpisjW1frLmFi/CRTNiqur7Xj9
	 XtjkCTB8x1u85KWFrVyvwuezLAm5fDVgUHUPmtpGARDxZOQSK44juew7PojzZrVVRFC8s
	 mzYcVeMF82MM8/dhvXJzzyxATjRkKw84AplOeKcvx1z/ZEmVI4VNY0Un3XtsYpBUW1Eb6
	 8O0Lmbz+5vnG8XaECd5P5YeX7BMxtkgBuY+dJR3CGJ6H0jkwodhN98ZLUdGSFCTrLcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YSGDtAVI5NKCQhTmv1CpbLpCOuvRYrihGznKJ/oZidE=;
	b=BaaXSW4S7JYPd8ieFvtsdOEmlcH04xHQDFB3SW9t202/+ZT6MtJarPoJ+U13IYX0/Vwg
	 Ls615vSMeNqC2ojxQWSzr16rI6CUZz1wk5fec1mv98p60tnGqX8WLrQO/VOM8u6pv09zz
	 lPHFjcwKoz2Lz4j5TDcGX1Ac0r/wiEkOXhS9AwFfcMWttXGBqjgw6ZDAFSGpoLei//c8w
	 RyBvo41+CzoeworfgyG7G+Z5hY4o8f1mX5yq4F/juDSGZY2aYKxBsmFwyycRcw4mytxJE
	 h23jROe0AKNgRpLl5OpShiXzW7eQ4DLl0fL4aGybOMaB5fEeC9bSVuAxbNMKay134Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wc85Q+nF;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D93606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D93606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wc85Q+nF
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so174387a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218256; x=1794823056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSGDtAVI5NKCQhTmv1CpbLpCOuvRYrihGznKJ/oZidE=;
        b=Wc85Q+nF1L2NMmYulDMI9aHB8p+FTQdXo5F+8CbjBRtWYH68b2Bwvh7/ZJ2pK9C+xn
         sBXII6wFQ/t7jVRthLl/G65GpVfewrKUj2hPnwrnn0Y0pmrbRMF9l7uIX0ubuDDRo8UW
         j3Im7WwE18LzBPuWlwcRS6c86YSGCa6r5n0lSWSsZqm9rTAtHlEy+OovuAmH6I0Fl9F3
         Puxs/BhkJ/Bex926XJjYWGxy+VhivyXh5B3GNaiSjWzuUb3ldlULylZVr2AKWZx5a1DD
         7e7+dLIhuWaNKsPh74d8HD/k/29VkQprS2yfq+DA2RlxzLazhMAuFNc3ADXTLuK3NT4o
         p2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218256; x=1794823056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSGDtAVI5NKCQhTmv1CpbLpCOuvRYrihGznKJ/oZidE=;
        b=NBvgVYEuPdLIW7SSvtRQfA7l5y+8opiqGq+qMxRKb+e8i1XfzLXEzkI/GVR+GWZL1d
         Jhl/RIkz74op/ImBzEYcNKBXMAYve2zkWVHLtNSAYxFuOEXWPoxPHXzz6lD+ojXRbWTC
         aTL5ghhOzjeWVRrZFjE2+ItqUNJKbuy8ywGCSvogVtsF2dsJbCI7gSzQANmCWE8dqdZB
         CLbby+GHFtfN6P5fY5h36CRPbJ8SJq+JFF7BFowfk4jjcDCUeLW5SOcxPsCj8U9SvXAZ
         cvSxxXx3NjYn0c0LWTKn93lnenHu5sX59zmTOqR6JR5BDtRtuyx1AkhyAXeEpE09cjEg
         LFCQ==
X-Forwarded-Encrypted: i=1; AL+hErHWGdsOLDjX8UsOYSEfHbzvy+hJYOFK+Bd7kp1oxYm1xk1TbnBgJ457U3yUgoMp3G4P/fcleHfC4ATqNY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DoHtuk/cGdAqmO/AYQlJap1DkhHGNt4xO8L6ucNu5L3mZm2ap
	X6lzQUbr8tszJUZ6yfT2MiN6wCIhLlsE9NgT7WfB5m0k72BwgaHAdduJuVKI9g==
X-Gm-Gg: AYBFou2859sji8mUXwBBsXN5BxCBqXDa31a3byL/kTRwDxni2I2nGKW7WUHKUFu7QE8
	K+TPtpffMWHhaiu/4XXZtUD98Uw5ymcJkSXw1UDF9pJ444REvT146lCWmi3f68y6CtR9LK7+Nyc
	SadgG0XylOGnYVV87WD7t+MAdwYg7W/6eTc8LzIOXClZz3tqxjrauQ/dzwGv40islhqpnYfC2yF
	VsCJ2/YIvFUUEpBN7uayP9BIZTF+oBKRQA3bP+pOj/x/lQnArT2cfpzicX+zrG9QJ4kI4SVDd3B
	LnCR13nvsQTPB4TaJVKrgRMKLH1m/vBUhiHnfrrAizUeW8ynUVAY/KLkNCbCVAVaegHaEmlX7vB
	oXf+mOBr1YHEcRSXcTcB29B6GB2FU41ZP8lDhgoY63rzQ4NTLBgmRIEnMmlWBafabxzJ7qRri0A
	j0VeEYFxM0Wvns7JmO/Q5UUQ5ZU91demS9IsyoZ1/LX9o0hwdpBTr85efxVJ97upIYAXtfbJ1BP
	6uc0zjyZ/a3iZBe1vtt3qKtGYsq4Rv8j3UjHaicZl5NgRcxKEhngVrLqsPT/oe6xLJd6T57fGvs
	iIDaQwWLm+J6LxvO16305wjxcxST+RSpwp5vdb8B1wJtA2uP6ie1eMKjgOw5rNLqxk7LNZuw4lH
	n3EvCZ32n0i8OyVS0E92kh4P/nNtRRvF0nB4q1LpomTGr63Q2BAYfzHd1HQ0GYOW/HlMHSZUq3+
	JH1A==
X-Received: by 2002:a17:90a:fc4d:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b12d441a33mr3608057a91.29.1794218255891;
        Mon, 09 Nov 2026 01:57:35 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278d1191sm6728852a91.8.2026.11.09.01.57.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:57:35 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] iio: trigger: fix use-after-free in current_trigger_store() on concurrent writers
Date: Mon,  9 Nov 2026 19:57:28 +1000
Message-ID: <20261109095728.59024-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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
v3:
 - Add a blank line after the -EBUSY check and drop the one between
   current_trigger_store() and DEVICE_ATTR_RW() (Andy Shevchenko).
 - Move this changelog under the --- marker and send as a new thread
   instead of in reply to v2 (Jonathan Cameron).
v2: https://lore.kernel.org/all/20261102034532.33246-1-yuz08559@gmail.com/
 - Move the trigger swap into a helper, iio_trigger_set_current(), and
   take mlock with guard() in current_trigger_store() only, so that
   guard() and the goto based cleanup of the newly acquired trigger are
   not mixed in one function (Jonathan Cameron, Sashiko). No change to
   the locking itself.
v1: https://lore.kernel.org/all/20261026100246.68005-1-yuz08559@gmail.com/

 drivers/iio/industrialio-trigger.c | 60 +++++++++++++++++-------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index 76926fe..74058f6 100644
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
+
+	if (iio_dev_opaque->trig_readonly)
+		return -EPERM;
+
+	return iio_trigger_set_current(indio_dev, buf, len);
+}
 static DEVICE_ATTR_RW(current_trigger);
 
 static struct attribute *iio_trigger_consumer_attrs[] = {
-- 
2.43.0

