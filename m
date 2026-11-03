Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684401;
	b=kfNNo0I/H1xb6EgvBe9C2MtTniI4bV8OVYg1A/qCXLA/6SHiyibCLITlzPvm1vZqW1sX
	 abIiUVadXrh+POIaMELNQ+qMPt8Z5Z6k5nZRVLER6hjqwCh3P85I7cGQtLIQ2/BNqjwdW
	 DJDMiKpiW43Yzl0hUcJB/Rm8LkcpSL1cl/nQdhctCfyk2y5kOVTi95yMTwv6QREeWJ/mD
	 hmNZGpK4kxwWY9wm9CofTzKKuFkS69WfSTdtfuhCX64IzUH9tPml4MAuyfxaicmO5a0uo
	 1HgIGKDHx/96g3RaJKZUhc7hBMDSGG7s4s1CJzpZVTZ5mgA3jv0Z5tF6vHtFfuioIjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
	b=vC3OLxBz9MIKJZaZ8l1b8OlghyY7gboRbIW6WNyaJC6Il1Gg9eHSOd3AFpBDMcwgBmcx
	 F/tNUz7sY+OlsFESdFUjnEB7jaPIzma8twJlrNzN798bsBvzDT2vPAKvqp1lD2C81CX9W
	 +KKj1Q00d1v6vIUiBavmQI/3RqkoEFb1yhfft9L5VGmwMwGBITR+bl6kvSXQaXbw7YEuJ
	 Tw/Bh1fgbccStFSEX73soJQuW4tsTi24mrJYILSOwRqAJNV+EowX8/V+A5P0YVZpkswy6
	 v/5YeW2ULIuCSUWcTymWXU779kYuK9MOidZ3bFxWWZwaMw4YILzd9P97Hdku80GONkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XG7lEL+c;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3BA606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3BA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XG7lEL+c
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9d7791b00so29819855ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793684400; x=1794289200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=XG7lEL+ceAJMrb013ECErNIArebvo21jKlpmwlwCIk72+UgmBRv2fFMHRknWaEXY+W
         iV0+e3X/dEY596kCb8JdOOQYDsW/+cqZGOf/B7uediCRkGs/hwXE/NP2iHHdqFCNJCqy
         Wc/04viUI1tAfYqtI88RHCoj/ywm/gJvKLpUleWDv9FkBAx0SUV3TFanEYbDWt8BeoYC
         PLyzQlrE4z51j1NE2aE65wV4rcZbI8oxFoepRZPIMrTSjvy+Q+gzNCqIcTml2Vs6HJCC
         o0NBfiKkgkBNGM52WZ7Ze2Dg1NJ5/lmYmt3z1WsfSt50xk7xo0zGaTBw3j4NHKsfgDfm
         YfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684400; x=1794289200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=H6aR4s+hUp1Sfo8+EFyQtD4o+aThIJsK5hpET1SgdpfOxQ+LVQXqRGvbVG8vQiklpR
         OsHA2OGI+N7P83MT2bsR/c71z9oOLs/4gCTHtI+bizk9r1xE6O7Frw0CoZ9LE8sd/1uc
         vhm08/khlQlEslPTTe3JKqKPj94ToHCfuMauFHXiywkgyp9+8+aXUYVCBvcNpX0SBs6Z
         FBwRN3nbfsN7U/e2YdLAnbYabCNFy49Y+ty4BFkVJSdEpv8oECRlVSS8AEonGH+kJOqF
         zCzejOK2YP3bX1/6sUeFXPY6bAKXdsmB9KUvuSUek5W+RDGLileWubfxspd3RkP9p1XY
         P5Jg==
X-Forwarded-Encrypted: i=1; AKwUvByCSXeo7zlpCwtIWPN0J6/cSZwJctNCGKFsotxb+xdSXsgaZQ4aul5k9BsF2GYU/kcpnonvbMo5vMRGScw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YSopZLyebG8wf/C3rOgoyN1dUvs5I6shRt5chFjaL4tQcDzaB
	CIANtetWQfPkEuDBYH5ceZPI4QXo+5iIWvDhec0Sti+LVggErRtIl6rbjWRM/tf3Ng==
X-Gm-Gg: AYBFou1FP6xuif9PtNAX2ZRmFWnrqTKHYrBIFz4v3Crm4Kkgtn7HEEZ83QT0TBafl+A
	GGZYNmGYNA30WxxB/q4bkHJ+xtUzkNBUUZZCX6tDQ1YEy85VrnEy9OAKKAiXq7uPt/gmmFBYabY
	qG9YiHyfB6QmmVMewcWLyQcRPuAVphz/55TYMVBTRk7XcrSutjfzVgIyoiHGclG05cDGkcuWhVg
	qPzh1KAiluxe7Yboj4mGkeuwGIPqA0MG4bhVGvkLAS8zUXc5KKHnPZot2p9blXdLw4qnB77yD9i
	7XO+d8S9t/EnVGpaxp0CCmXEqW6WNeARoZ15NM1Dd8n0ItkCkEgg85wK0DB6SA3RpYcpHiLeWQc
	ylRdpjRlyDrBayRCTQ/FfxA8QpFtGc720rtmWL1KFcBDhK7ALT/zyiZ7yBX73JJDxSttOpI+S+e
	51KU5548YV9yo4mscvQVkn7hQNQHB3ODOXNsdE96qPn2Xq+nNmHniJ6xrFy+Ef+22zNG1CvQ+Fh
	tHucfYxuu65IvilJEgBYt4JPqiOk4BnkvdeG8VycIFqErZvr+vDRVI/KJ+Zfc5AmccU2q20FR2n
	oLUHoUDDQOmAr6nGM9z7K/F8B3xvyW5SrfyksPiLXN6TMJOjnegFLeTiftFFKlyAadpkGAiN3Uq
	mH6nWSUOSDL0+Lwg4cg==
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2eb364b55camr111236385ad.31.1793684400160;
        Mon, 02 Nov 2026 21:40:00 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392494edsm35154505ad.31.2026.11.02.21.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 21:39:58 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Tue,  3 Nov 2026 12:39:52 +0700
Message-ID: <20261103053952.1138398-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-194542@kernel.org>
References: <cover.1793669297.git.jjc@jclark.com> <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com> <sashiko-outbox-194542@kernel.org>
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

On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> to configure the device, bind all child interface drivers (triggering
> deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> all down a few lines later in the error == -ENODEV block via
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).

This is deliberate, and documented in the @pre_probe kerneldoc. An
error from pre_probe() other than -EPROBE_DEFER is handled as if
probe() had returned it, after the generic probe has run. This keeps
the -ENODEV fallback to the generic driver working as it does for
probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
from probe().

> Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> unwind the generic probe and runtime PM state. Because really_probe()
> clears udev->dev.driver to NULL when usb_probe_device() fails:
>
> - When udev is later unplugged, usb_disconnect() -> device_del() skips
>   usb_unbind_device() because udev->dev.driver is NULL, so
>   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
>   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
>   remove the port entries added on USB_DEVICE_ADD, leaking struct
>   usbport_trig_port objects and sysfs attributes with a dangling port->hub
>   pointer to the freed struct usb_device, and usbdev_notify() in
>   drivers/usb/core/devio.c never runs usbdev_remove().

This was raised in Sashiko's review of v2. I missed that it can be fixed
when the device is unplugged. I will attempt to fix this in v4. I think
it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
device that has no driver.

> - For drivers with supports_autosuspend = 1 (such as
>   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
>   reference, and hub_configure() enables autosuspend on hub devices; once
>   the device suspends, usb_resume_device() fails with -ENOTCONN because
>   udev->dev.driver is NULL.

This is a pre-existing bug that is new in this review.
usb_suspend_device() does a generic suspend for a device without a
driver, but usb_resume_device() refuses to resume one. I don't know
why resume is refused. If a generic resume is safe there, that would
fix it.

> Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> returns -ENODEV, the error == -ENODEV block runs
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> used in usb_unbind_device():

I will fix this in v4.

James
