Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9424BBEB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973478; cv=pass; b=mHhi0lNSzupxV9IagxsLMF6HfCHDh5Mg9SM9E0Lx4H4SaOYp2plrugXqz4VDG10/mAlBIdmOCDkSlxgoWWBjKsypPN88MYmq0qlmDA5EvuUOWzvq38CpVXFMaRNdOk6f94JWR6dPBaUoK7qVqarKKnsQKLGobrGkVy13UaKA1V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973478; c=relaxed/simple;
	bh=zNRJAWDpmSyQxf+gq4P6PYHSTb8ilgp/59JSal2jEFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qd1H9SlV3msttSZm1D/V8r9MaAt/S92RQQ/wjvvI/QXkgkHf2a4+5WvrjjK0goU277RwiHhBOar7y0/r5PKm/2tpo7GifBGzzYwkRGqCfzMy7FJ1ewy3NTs8DwYTtRK7Ex3+dtJl2pKOenUvLQsxi0znwtjT9u9F659tZdm2+P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esX11EV3; arc=pass smtp.client-ip=74.125.224.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esX11EV3"
Received: by mail-yx2-f5.google.com with SMTP id 956f58d0204a3-66f2399323dso1674916d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788973476; cv=none;
        d=google.com; s=arc-20260327;
        b=c5L27xiWKI0x8q7FmvYhrXmMrqyMs6zHSIMGuSkW0ARY+Zeh5j+kUCaMJEZKbmu2lr
         MR6X64WztHT26Xumu483Ht1P8PoQhI57R7w+gy4F0SbL5SkBMIp5U6Uas0xgp8BDlq5l
         zTNzdSPh9uwSRFuUwsV6f5ekNrgC02xc1ccimf1l7Pe/UFopitoA+wcdrP65nhbBLT4e
         yPhDqiOe9LgKIkK/zqQJZ3gGSXzlbD9dEN2+UK2+x3kHviEhpHH6tPNTsrVXrPWdTm/d
         zFHZvngTcQPwhc3Ay5S3XhuUVwbDIiVjMYgBAOov11+7pqoN9CN6eBRzTFjQjhD9GA10
         LtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=h68yUZkKyOQMox/zVW7HECZ4MPmqpPFgYdtPt3ny8hI=;
        fh=3iuZHXYjeBguw3L/5jYVquQGJSSlXFi3HtrRFGBt9FA=;
        b=XjXbf8DGmnXI4P55bRVcmvfISN+AyLCP5Ks7I+kjBH+CBSn3jqa0VYCzQlVsyIhIov
         QeVYIlK6kjQFR/vo4khYf+bIQSROtFKaGkBAaVO+A6dfTHxaHRXVlSeQm92EqHMp+mDi
         Q1Ar/6iZFv/MMn0j2+DT6QHonMHPXY5yP1zaZRhGNgIIYDEhq+0jWe+6aok8V7NCacr6
         zQnu/9ZOdbipytXzGMx54QXG5/VWUuHjuwzf0kLuTreZDWOjcYtqLFNKkDG2pu2ouXpN
         CJKxzp7IgJwmOmYuV1JJirOOwqShF5OmxsNREfRSNJNVb2baHjD5ZFo6XFduels21Kg8
         56fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788973476; x=1789578276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h68yUZkKyOQMox/zVW7HECZ4MPmqpPFgYdtPt3ny8hI=;
        b=esX11EV3970/+DlnWiJUQ0JrEiqdjYpR0xOVzhmyO7gZzRA2ZzDLWTK6w3wa0s27l0
         hbs3g7Zf8mQWRSYpmxZEqpffB+zsoORKdeCZSJmhMisUzeqb7JQPbMa8/Qds1Y9YHLoz
         YU7i7vEWP2CRduV7ldCz7OXcDe9aaoW/lSN3eVnIbOfNnbx/1J+fuYvAGNGFi5mWIWF4
         PFAU2fXdB7UFgvt26wgvQIDhxXL0HIENTzEhjDQOitXZxhMpiVKqpmxRG2jnIAq137YP
         g35+hMHG2fpySTixvvE9RP2s8sv+OFoieqCS6jKYkc72IuiIPL/A2jjlpho/378ed87N
         2OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973476; x=1789578276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h68yUZkKyOQMox/zVW7HECZ4MPmqpPFgYdtPt3ny8hI=;
        b=pJQga8Nga9OETvERZhsyw+/VAESwA7pTKhiEF053sQl3ex0FC34uzmf1W9XYtb50pg
         9nZ81SGnv0ZrvMXEFwiwAquS+9Sc9EMDDGdrjeqeoPIpH4TO/B0T/m2Sk1cs2cPUZS4O
         3TGoczQzLYK3EOC7fGvg1ckn5lVUeQVHO7PxMdkaQwBjfXBfyWMh9FCjKUmo2QYPXYyD
         8Ozmst2g/jS9SmtrzuQmRGZqZNz0kS25COkXMU7d/8dxuFQXkZ4m5QEXHbjDROrVzXwz
         D0OWBkjGdq65W8++7Qjpl7X4id3rPsVsFABsOqHY9vOl80+mzTPxaOd4c53fKtsnEjXL
         3XyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs7LrFXTpeh0yg9Iizz7D3zkqTYV6PSdmBliroh38x3EJUUG+BLKF/Fkc313y8UowF9DFQ8amxXCr4tQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mGboZAV12DCzhwyrDLdmXIRYri0vSUJKJxxZoYjYjkHlpF9KxR
	AYHhlkU34zfz0FqCWj/BdalweaDArPTXbXbBwsWrbCqrkGU7HTH4fWdDXZ0CjIGrEwfc483Ngbv
	fiKt/yiTetYbYlH+z6aTQSgmhR9JJQTI=
X-Gm-Gg: AYBFou1kyg9ODpYILoTHigxQrpWBWJfv4EkAmH0OBQvkw6yPAN/Cv0gQP7MYHTmyfAK
	IWFHpnw22EYK6JIkYBcu8sD4+mHsltuDtWJUni6lfd+zUZZQVgMo+RUdkFvY5AcxYJy8LJFotJ3
	UGUnSSa6WQ/UAD133o0qmz4YwkTX4GHoZeCdYHYcF7PweSOxmQmAoDI+22zZLtlg593g9jr+diu
	5b41u12/tOcdjtR5S2jnYpGme1HWmy2sbnQdoQHMTMdjWxUPGP4wmEFMmr73xbkZeMO0/p7aZdb
	lgkDW5t2qWU9r5PgAj+aRrqICrffhq76CGxq3LXriO41VNw4+RLGwa7DhM1PDPXCPM96slJAjcq
	EnQullxZ91VqCaZm9HCj9G7GB0TixR2h8ldvagj8zVgb5q6Neh48Zig9qs1L6Z1nFh+ktl/8=
X-Received: by 2002:a05:690e:43cf:b0:66d:273e:117a with SMTP id
 956f58d0204a3-6710ff00773mr1220253d50.39.1788973476283; Wed, 09 Sep 2026
 10:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHzb5FEEU3+aw8z6-_3yxDeKgZoLRMGyUSmHettjJvbAetraEg@mail.gmail.com>
In-Reply-To: <CAHzb5FEEU3+aw8z6-_3yxDeKgZoLRMGyUSmHettjJvbAetraEg@mail.gmail.com>
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Wed, 9 Sep 2026 22:34:19 +0530
X-Gm-Features: AcwNN1U-LckANOu25TWKJ6Y_QMHpGD2IzN4hcXhSspsZzhvVHSuyrWdUHiqq9W4
Message-ID: <CAHzb5FFHj3WG93sR5sXb6RYAYC=v1QctLQstau3b=sDizQ2Ang@mail.gmail.com>
Subject: Fwd: [PATCH] media: hackrf: defer v4l2_ctrl_auto_cluster() until
 after error check
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cf896de36144391bcde1@syzkaller.appspotmail.com, 
	syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Wed, Sep 9, 2026 at 10:30=E2=80=AFPM
Subject: [PATCH] media: hackrf: defer v4l2_ctrl_auto_cluster() until
after error check
To: Mauro Carvalho Chehab <mchehab@kernel.org>


In hackrf_probe(), v4l2_ctrl_auto_cluster() is called immediately after
    allocating the auto and manual bandwidth controls for both the receiver
    and transmitter.

    If allocating the master control (dev->rx_bandwidth_auto or
    dev->tx_bandwidth_auto) fails, e.g. due to memory allocation failure,
    the pointer is NULL and the error is recorded in the control handler.
    Calling v4l2_ctrl_auto_cluster() with a NULL master control causes
    v4l2_ctrl_cluster() to trigger a WARNING:

      ncontrols =3D=3D 0 || controls[0] =3D=3D NULL
      WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
  v4l2_ctrl_cluster

    Fix this by moving the v4l2_ctrl_auto_cluster() invocations down after
    checking dev->rx_ctrl_handler.error and dev->tx_ctrl_handler.error.
    If control allocation fails, probe cleanly aborts with an error without
    attempting to cluster NULL controls.

    Fixes: 81774395a8d9 ("[media] hackrf: new driver")
    Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=3Dcf896de36144391bcde1
    Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
    ---
     drivers/media/usb/hackrf/hackrf.c | 4 ++--
     1 file changed, 2 insertions(+), 2 deletions(-)

    diff --git a/drivers/media/usb/hackrf/hackrf.c
  b/drivers/media/usb/hackrf/hackrf.c
    --- a/drivers/media/usb/hackrf/hackrf.c
    +++ b/drivers/media/usb/hackrf/hackrf.c
    @@ -1427,7 +1427,6 @@ static int hackrf_probe(struct usb_interface *int=
f,
         dev->rx_bandwidth =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         dev->rx_rf_gain =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_RF_GAIN, 0, 12,
12, 0);
         dev->rx_lna_gain =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
    @@ -1439,6 +1438,7 @@ static int hackrf_probe(struct usb_interface *int=
f,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_rx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->rx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->rx_ctrl_handler);

    @@ -1450,7 +1450,6 @@ static int hackrf_probe(struct usb_interface *int=
f,
         dev->tx_bandwidth =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         dev->tx_lna_gain =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_LNA_GAIN, 0, 47,
1, 0);
         dev->tx_rf_gain =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
    @@ -1460,6 +1459,7 @@ static int hackrf_probe(struct usb_interface *int=
f,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_tx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->tx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->tx_ctrl_handler);
