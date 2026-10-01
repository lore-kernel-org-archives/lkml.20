Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96636A017
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892127; cv=none; b=VZMQnVF0L8qNCpkus26R/1klls+ARnZ8VGrONW6p0vMdO5gEhpR2sxE/gd0PgyxpfwNZleSDCDxQzEZgZWyOIIoSlgMOHxrnF1XgVsRyEdEg9PZDz8FsSi2tAUv9jgbSsOiEm6GUZJnLRlYSdb9/TuwP3Sw1w/Ylqm/ffLA6+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892127; c=relaxed/simple;
	bh=JjygOzXkqKng+9yvRLyl5HsDYVO+kYdxgW4/DBjOsZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mt842jL46Cn6TkA1IgiQw9w6nnxh03BK4XVGKpGozAZGl6wZVEljAb1c4qJ6BperMnMaT3U9zrCNxGRK3oaSGHhWzVx69jm0vcNnblxA2LCMpzGVPoH0aM3KaPTT2cGMkikV1BObMLaw5YJMhhVMAUSByRrvtixV49BZ44QWpEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zg7rysBK; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zg7rysBK"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso6907281eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790892124; x=1791496924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bQSqCxLaeYIZqKCGpCRqtTz31RfWsjshUpxQ+xDyGIo=;
        b=Zg7rysBKo+oA6dqNNEtcuwNalMWiFZAe+JO/gzOMXN5ECF41ExKiDkPcfJHiSBpFtV
         SEnnujNzgnD4XvarpgH3wAH6fL2jEgS2KZNLaJ6Q1Zt6mWtBPK14txFIZPTSA11/vWeD
         RAjt6nkW0zxLlMri8IYqJi4gyn6WCveonbUYcy2Kd1YTOhUpHjRB4eYwrUvG6DwW0IIF
         wUyVquArd/VWUaS4+pzCVFDQJWnilH/7+xBom/Qce3ZwFqmDg+VNWGefuNZdMUmOfQtG
         J5gp7Iq7p/R8D8K3BpjholkA0O4xnTKxRUZkRIbKhNAGeCXzL0RwsMqAJd+n9be6LaSc
         7dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790892124; x=1791496924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQSqCxLaeYIZqKCGpCRqtTz31RfWsjshUpxQ+xDyGIo=;
        b=Wl4G7Tmj6Tpz+b74aghZfHz/1nxAWaJBU/UsVhAScNydgS7spyWPsmf+1167zxc5yN
         /ozfU7jR1yWbbeOa/uVoY/VzVwivW/H8C/dsHqW0RlaWAlmYgAec1WWmIKkOZHUG3Fzj
         eKnYBtdFmAgmtlhfcRv/FKEkFEkebOOL+TdHKvDy1ymFufoDHIHk4hsbt072MGTIwBbg
         MBkV8s1fIL0/YzuW1lcH3GOFZ7wdga74WfQwUngb6/U7GR+PQ5puhRwJYkLrKnHmSsgG
         AiCIh8Fkcn5uGGltmp217SxLLzWZhNbTda3fgtOoGwjOHgNm6J+dTu3/w/tv6KXJnrKg
         xQvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0NmZxflAuJ16MNyxocqaKBHt7Fa+ftlCZU3JYjQAtMQx9DKR1IvLpo4O6k1CJ8etx4+1oVivVAkQ7D54=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB7XRNLk2RqqDgLeu0op4EbxIjvei+mkwvpYS/PL94txAtfaub
	WKUR4O32Lbu+r/LIJeYFhpAqYfP7+ok6dojr1SlcbVmN5W+Ly6XPP3TZ
X-Gm-Gg: AYBFou2SAWSPDwnbq2MxLdBcmBL7HY3snY5d5f9Gs3TVgHtyxbQFLRxPZWZ1d5hy9l1
	k03ZZ2ZdZ5IBW60LHKc3dEoK42XyUdbV5ZC9f283FqoqBc17zKukS547h3JmbITfyWouqXN13co
	qOJga9s3G+y8GjrGGKhBq67lrBKclRrUiuruMHYqnW+d8iwLN81B2wY1lAJglxvriRPhQikeduM
	v+3XJPjh0oySmbMK23bF6CnQ2J52CYR+Jfvyx+O2XzMBOT8mj7GDZj79bl1Lp1p++9TRZSjPBw1
	ZdoMGKCMfiEKGs6h3hTyyqmSimnNxfTRPNb/55EWfmlrIUOI3QFhNd1YkWLjrbxgScZLizVVfZl
	1AnLGZWzHQ+RYMpRGq/O8e+0laX9wYGnCMNN9e+zx23ULGbBV/E1hXJoIRzbKUTWP+G5/fmkGVP
	0V1Tmkkndjl0oHFsNvt7paQB03zKe/r2OTSpAm5tXwo9AG7dedHvs9oxhXqkdXZUSxriiZINm+P
	tlKJsQzLyE6MNowXda6H5HwWoOIUSCuCI3OA1qSqw==
X-Received: by 2002:a05:7300:e9cd:10b0:33c:e82:70c7 with SMTP id 5a478bee46e88-34f21985077mr718743eec.30.1790892120960;
        Thu, 01 Oct 2026 15:02:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:786c:ba70:85d5:57bf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f660f1sm1043250eec.13.2026.10.01.15.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 15:01:59 -0700 (PDT)
Date: Thu, 1 Oct 2026 15:01:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] wifi: carl9170: revert broken devres conversions for
 input and hwrng
Message-ID: <ar7X4ul_AGHU_mUY@google.com>
References: <20260930-carl9170-reverts-v1-0-7033b5716c14@gmail.com>
 <1a007951-8e77-4ca5-8dc2-093251357e0a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a007951-8e77-4ca5-8dc2-093251357e0a@gmail.com>

Hi Christian,

On Thu, Oct 01, 2026 at 08:30:29PM +0200, Christian Lamparter wrote:
> On 10/1/26 6:45 AM, Dmitry Torokhov wrote:
> > Commits 23de0fa0d2a0 ("carl9170: devres-ing hwrng_register usage") and
> > 87ddb2fc29f1 ("carl9170: devres-ing input_allocate_device") converted
> > the HWRNG and WPS button input device registrations in carl9170 to
> > devres attached to the parent struct usb_device (&ar->udev->dev) and
> > removed the explicit unregistration calls from carl9170_unregister().
> > 
> > Because carl9170_register() runs asynchronously from the
> > request_firmware_nowait() callback after probe has returned, and
> > carl9170_usb_disconnect() frees struct ar9170 immediately in the
> > interface disconnect callback before devres_release_all() runs, both the
> > WPS input device (along with its ar->wps.name and ar->wps.phys strings)
> > and the embedded struct hwrng remain registered after struct ar9170 has
> > been freed, leading to use-after-free bugs.
>
> ? Do I have a different source there ?
>
> carl9170_usb_disconnect() does a wait_for_completion(&ar->fw_load_wait)
> before doing anything.
>
> For this completion to be "completed" either the firmware loader callback
> went as far as running through all the initialization (includes
> carl9170_register(), which registers the WPS button + rng) successfully
> and the device is up.
>
> or if there was a grave error (usb protocol error, firmware not responding
> the way we want) and the driver basically has to give up... (but then
> carl9170_register would have never been able to even get as far as
> registering the wps + rng)

Sorry for the confusion, mentioning request_firmware_nowait() in the
commit description was a distraction. The issue is not a race with
fw_load_wait, but what happens *after* wait_for_completion() returns in
carl9170_usb_disconnect():

1. Normal disconnect / unbind teardown order:
   In carl9170_usb_disconnect(), right after wait_for_completion(), the
   driver calls carl9170_unregister(ar) and then carl9170_free(ar) ->
   ieee80211_free_hw(ar->hw), which frees struct ar9170 immediately
   inside the .disconnect() callback.

   Because the devres conversions removed input_unregister_device() and
   hwrng_unregister() from carl9170_unregister(), both the WPS input
   device (whose input->name and input->phys point to ar->wps.name and
   ar->wps.phys inside struct ar9170) and ar->rng.rng (which is embedded
   directly inside struct ar9170) are still registered when struct
   ar9170 is freed:

   - The devm_* calls were attached to &ar->udev->dev (the parent
     struct usb_device) rather than &ar->intf->dev (struct
     usb_interface). If the driver is unbound from the interface (via
     sysfs unbind or rmmod) while the USB device stays plugged in,
     devres_release_all(&ar->udev->dev) does not run at all, leaving the
     input device and embedded hwrng registered in global lists after ar
     is freed.
   - Even on a physical USB unplug (and even if &ar->intf->dev had been
     used), the driver core runs .disconnect() before
     devres_release_all(). Thus struct ar9170 is already freed before
     devres runs devm_hwrng_unregister() (which dereferences the freed
     ar->rng.rng to unlink it from rng_list) and
     devm_input_device_unregister() (which reads the freed ar->wps.name
     and ar->wps.phys when generating the KOBJ_REMOVE uevent).

2. Error path in carl9170_register():
   Even during initial bringup, carl9170_register() calls
   carl9170_register_wps_button() and then carl9170_register_hwrng(),
   which calls devm_hwrng_register() *before* carl9170_rng_get(ar)
   issues CARL9170_CMD_RREG over USB.

   If carl9170_rng_get(ar) fails due to a USB or firmware error, both
   the WPS button and the HWRNG have already been registered.
   carl9170_register() then jumps to err_unreg -> carl9170_unregister(),
   and carl9170_usb_firmware_failed() calls
   usb_driver_release_interface(), which runs carl9170_usb_disconnect()
   and frees ar while &ar->udev->dev remains bound.

I can send a v2 with updated commit messages that drop the mention of
request_firmware_nowait() and focus directly on the disconnect teardown
order if you prefer.

Thanks.

-- 
Dmitry
