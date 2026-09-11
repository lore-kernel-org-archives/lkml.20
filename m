Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8478E21A457
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105716; cv=pass; b=PAEyuuGWF50jvEZ1RIkWE4YTU4Ifqh2ZpmG6ZglMEtkuyIsN3depgIlpcczChLCv+yfD7KSYCZq6qRWxNXMd3jtKE6F+3xtE7PJP+bzFIcT6/uJ6Tdp6z6OsWe/583K2hTzKVCa9ljlD3fGn4LhmbXfAk8EOBwYppzQNj2BkhAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105716; c=relaxed/simple;
	bh=TJnrL6d0hKJDGb4rqpDMjSoPYzhglbMdJOCHJvyEPCE=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=hU+LvMeJTpxlNKqOqqdNNZylMJnrDxK5HqAr8RkP1gQFPm1lx+sr9b7NH2LdXbAacHhmYwvaiOSiNhD/Z+27SVeqkzmwRC/+HLqiqtG2UbYv8YumNKH5i93JsNpJodPJ7igGWleyzBj1PllhyZzs40AmdRJHNh3ZtOaDwTWcniM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=hM+Pbo4U; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="hM+Pbo4U"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d28035so167094b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789105713; cv=none;
        d=google.com; s=arc-20260327;
        b=ZV3yibtetbLZFokH0i+9L4FxhCZJHYscOcj+JAzkIHZqZVofSQVGW3vhd5NvRxuB7I
         +U5DEB5ygPQfRscEsk6rXJ8MkqK6rphOI+cApe/iALIcH1Ob7FSIuPaLKSzpzw2yOufV
         02HiU9g/E81ZMKA0r6rHEgQzlKu1eDwtwdtUJEJOOot5R9oR7ZbwUkfh5J7nPD2UbsGh
         UqIERac4NWrT+XmPimHL6W+TPV+Y6Vt1l/onl2Zf4OrdTIokoHT4mFYSNvzmlFx26+i7
         ll+JQ0uGhrJB414nkuEV+klw0QarUqLJ6qEPgT4CZ3wCvc2PoPukuKU7ieccbI7lHnQZ
         EGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=B/obf48ZGyrDi31Af1lwyeU1ecLj+i6UYByj6PNdSZQ=;
        fh=1iYkMsRTpUxH6qn+3geGsoiDqhb9E/FQnpDoK5zMwHg=;
        b=O6ZuDhQ8B9UmWVsUYRi4lU+MtWULkvtiVaenaeUQ4myOyHeMSWRUKUfcw8mapYRL1v
         wF/V4CcwFzXbI/T9aG+oK6KKXGnltFqSP/FMSqyg09Q1E3avXJzuLHh/adMnqB6jLWg+
         6XWDW9zE5b3bLVuK2vdXj4ojJBXrfPI5sPYoBcMSWLlPjsBckvrytcNGEQrdihLc+tT5
         ZdEIL4puFEwhBHSkDbgEIC2UH7t69Lsa4Mbsf2r6H/3FtlotreicSSBJ34Kh6f+JqQBr
         eJcqaa0x7vJBHXaUAqna7vMhUbY4jTGZA4eWbYpmot1OTkbW3ZS+W3hu28Rk7eUHiJkG
         NbtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789105713; x=1789710513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/obf48ZGyrDi31Af1lwyeU1ecLj+i6UYByj6PNdSZQ=;
        b=hM+Pbo4UeVdShI3H9ZiszxRDnVrmasPPmJTe/z0kizDS2nAvqIPHr3C7tIEbGYCF1h
         55+J/PJZ664p0+ZPK7W/RQYsjoz+tVK/tnnW7fuXayn5+yQ9UZ6vVYmdlBH/iqRaLBGY
         IYfkkE7fIX0HFvhmtrfLElcfFGJZJwJHJCU/WPLsbdHz+jzdmY2YHkLIyEEtbQEv80aj
         GdoPk9HURZNjeKQqY6Pns6u2eIgOqWAK5fdIu1yL0Qtjj+QvECICkS8q2OvXvzYnJYiH
         ws2v+5lcZv19brELxjTxg/+U+RJaI0IBNg3KyU7QS6w8if4OHT6x6WC7qpofDIaN5nQt
         wRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105713; x=1789710513;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B/obf48ZGyrDi31Af1lwyeU1ecLj+i6UYByj6PNdSZQ=;
        b=QrE75DbANUxgvMamngsJqG9QpYm50vckO0lOFC+j+GrH0sdxYK6rhRjLdOzrzXBUfk
         rhHEam5/YvFij02DPhvMMwMhufhxtKaosUIZnZ9cI5JCLgm+OC3OYRkldwVKKxuMAh6h
         iNGEJ5Z+C9x3E7wIxqmSsiYi/OXY4pt8urd/uc4Ban1GMq7qGTEFnAh1nrf+fV/IbHEQ
         C66C2SlsYG6mKj5mBpGHYjS+iwjv5O79HFbuS/2xtTCMxkbY7ij+dnj6Q7QOEGmk99m2
         cabMsOjbJai5fKhGbRuAdtIEKI2DB4O+VGIZf+8Ntae1H2wJANJNANikxjuRwjWrmsvV
         IGOg==
X-Forwarded-Encrypted: i=1; AKwUvBy+OM2jnSa3t9DNAUYSdg8zTB8Z/1Mt9rQgkrM9z3MnhHZLmq/7dCGa2Yx2LBHgb7Bg1BU8VVgeb1ZO15E=@vger.kernel.org
X-Gm-Message-State: AFuF++njprSQpp3FF0tZAJ8cAe/8LwFfI8MM8qK4CO0yxw7ZihYDgPMH
	wZasAMLRYQBhO5f8czdoOw0iyLs882cj8XdLq48O5r8kJ9mC0jc/OgwzIgjOIPp7t1XOa8igF01
	FfsTtSph0x2RxAnIl0qziugZLsq4SMUa9kq1DkrTV
X-Gm-Gg: AYBFou3Z5bAdyNrLnoqC0xjHvsrM0mHcKenYXQ0SwEfCvaaSoabDDWqMDvyHYWWrCKE
	VlmFQKdUZytccIrWrzn7n64LsBQQDv2pfyKKNoaDauYmnk6kLbC7arlJmJ77eVw5Hi0qe6jIIAO
	GbR+PbfmNdvHfjE8xULlYxGo38EN1+MJoAyUKq5dRRgzwoGhIMSKr1RkM50Qg46C9uGq1ASzwh+
	qFj6DwL89W05nvnNdkq9HtiqjHWMlxFpVxSk7itLePnCRAidv+W1TKml48a1I44axz36H748VEI
	tHXkzYZWO7hQaVrH1ItAOZqkreLBSDldddcK3I9FXioMoqt3cLe5Ieciw/bH+K3Zvi1OJhwQRje
	XJRbM+TDehkJOWYc7t++b0k0gZc97WYwYnHt6sJjPGRo=
X-Received: by 2002:a05:6a00:2e20:b0:869:44c3:c24b with SMTP id
 d2e1a72fcca58-86b0d065277mr3199091b3a.0.1789105711800; Thu, 10 Sep 2026
 22:48:31 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 05:48:31 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 05:48:31 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 05:48:31 +0000
X-Gm-Features: AcwNN1XJiM_-mKtor9wgRc0cKID8IrHW-RYw1kk88Sw8zQDxuASJ1G3ckAlh4HE
Message-ID: <CA+0ovChNv1=1dfdKxSXnBN0KVC6eO6kZqTFTsozOoJYCvT8T4g@mail.gmail.com>
Subject: [PATCH] media: cx231xx: don't free the media device on err_analog
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When cx231xx_register_analog_devices() fails, cx231xx_init_dev() jumps to
err_analog and calls cx231xx_unregister_media_device(), which frees
dev->media_dev while dev->v4l2_dev.mdev still aliases it. The next line,
cx231xx_release_analog_resources(), releases the video device, so
v4l2_device_release() takes the freed media device's graph_mutex in
media_devnode_remove(). Remove that free from err_analog and leave it to
cx231xx_usb_probe(), which frees the media device at err_v4l2, after
cx231xx_release_analog_resources() has released the video devices and
v4l2_device_unregister() has dropped the subdevs.

Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
The device was emulated.

--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1505,7 +1505,7 @@ static int cx231xx_init_dev(struct cx231xx *dev,
struct usb_device *udev,

 	return 0;
 err_analog:
-	cx231xx_unregister_media_device(dev);
+	/* dev->v4l2_dev.mdev aliases media_dev until probe's err_v4l2 frees it. */
 	cx231xx_release_analog_resources(dev);
 	cx231xx_remove_from_devlist(dev);
 err_dev_init:
