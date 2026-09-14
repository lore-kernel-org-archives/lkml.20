Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBEC331EA5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380847; cv=none; b=NffQT1XLrrqxQ45sLn3Zgqb+va+DL/5WKbiGBoLrlqWNxrOC1yXRGpBAxjnhRSdZww8UMoIKdu8D4f3Z5FpXOApqnmdWB6k045/AFcjArfEEdqMfIeV1h4TJABgveg5Pjje92hZI8jFyEenSwKyYJKclEgGN0x9ki/I4Cnnawos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380847; c=relaxed/simple;
	bh=PGhJiJ82iM2PEWH6m15Osm3CPEl0Js9TB2uzW353cXs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FrujlejaxFdP7OTP0bICfo2mvto0bJc286K8LOvZRBshsEtY6JnNr/hC2m3bHS4VJEO8OJcsY4wlcBROhbUHXWgdS2uuFsiWGqs8uZstnAjzsNpaXOWDcA4cPuhIxr6gEfr7lYeGt4Qp3z1gFcfjXsyjhTNoPg7ynGuzFe2utX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MiwHHjjc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j294MBHR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MiwHHjjc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j294MBHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789380841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A+kBrLbXZDXCaO+NKnjivo+lZ1mE9aDypzcLuokSB2w=;
	b=MiwHHjjcZAev7JRclyQGT3iOGSSnUXG+XJVI0khnf+Ebze8UW33pBc0PiRGekESmpytG6B
	1Y9CvWsFVYsUtyulehCbXOy/2I9RHLfy6QleNK2KJsQCURKCC7vN5cjKZ5lyI+Bx585/NR
	MoKtcUTNiVuIDI0PR2vmnLlxshEaeo8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-ngRZZxg7NM6XXWWH8Kkr6A-1; Mon, 14 Sep 2026 06:14:00 -0400
X-MC-Unique: ngRZZxg7NM6XXWWH8Kkr6A-1
X-Mimecast-MFC-AGG-ID: ngRZZxg7NM6XXWWH8Kkr6A_1789380839
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e65ecd557so18596145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789380839; x=1789985639; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+kBrLbXZDXCaO+NKnjivo+lZ1mE9aDypzcLuokSB2w=;
        b=j294MBHRDgBSjM6Z4v+uKeHaefJ/rXhrkSa/7uUXdcMBTVOYCHx/Om0AdPhwWfcyyX
         9wKEUmUUcO2K+gc+L90QxYW5vtu6kLvGD3kM0ObVkhpb0SZFbR/fOOfqdSSF86eBUH3K
         6rbNlFlh4ESDH+2YLQc0xamAEika5P/yUFgWSwtvXtb8c8p5qdSqoTtLeLFd+9hufjeU
         9lsOMH4YVF4OSTW7UuWikAnTZBmkSbPomRM/L1KUDGqoMl2NlpntdpCGl+iaEdhbyVxT
         BBbr965AH9dduX6ut3mgMvvQiMhhlppNWI0T1uHKUdkxIWDFOoHyFjpxrtAL948eYnNE
         lFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380839; x=1789985639;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A+kBrLbXZDXCaO+NKnjivo+lZ1mE9aDypzcLuokSB2w=;
        b=QavIxMu+K0W50b+n/YtWfyfrRsPxZNl8f4mwZKSciF0D1/qr+bdE87USbmYTB03ZT3
         s4NreM5y7NGTcghB8uTQPNlhvZ87tmf9XuJdZcnQlBT0pjWM6VRLoF0Ip2yaN5uyYbu5
         RmN4Qq/yvqyE0sQtcMm6Q+g/U6dliiDozWbJd6F+enWd8Wrclh0LKlmeyZR/jT5PuTYE
         so+syqzXJ9NqGqvoRsVH678cPr+pO2N+66iMk/kKqBbVE6Pb5j+md+wYkVR+l90EDisk
         mZAAKOa6RnE+97HtT2jzSFjVjXPKypDwZkBuqvYMhIe3nwS0hBIK9reaE9LXrB8iUGPB
         Js8Q==
X-Forwarded-Encrypted: i=1; AKwUvByOwS/z+36foBog9FVpdhVlo8tsSpeaPL0Gdu+ltEf+UG1z76mt0jP23Cn5njFAY77/hbYe5d++mI+36NQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lnISbkTBuQfCUY6B+VcRsJHHbzZc8wV27Me+72EsalRzCg7gr1
	sU5NgLuhP2gUtQaEP7ftgP+Udhh+PDX53jzy4jtgd1By4Abn5Xz/OnhsWy9p7leyDvUogr/2kVK
	s7BfrMVM+2MzA3eplhK7+HrKak+tIMWPWdN/NP0xOGlOimaOXjlIo8hSrKu8JtI7PeQ==
X-Gm-Gg: AYBFou1NZlKOMBC6kTeK7fZpjwxvtzCXfTP49mobaR98MMwsnUTrnWJ9hWqKPMcxMOi
	s4zmPU/iDFa+Tkrm746FMooYchbGB1VO8qaXJ6wHu8sXT8a8lrAdAkVcs4xqCPsKMa6eVLuu+R9
	kn7KUzd+ksj0QtICE7FIZk2wWsBNlzF0iX3GGkXyV79OAXGEeZJ8GSbzqr5borMDi8dnQ+WH4ye
	du9NfYmBuXNIrlOyEO2jkyJr965oPG3Od18Cpox26SmmNPPPO/O4H3k2m2guLF2AxDxDGykBCGD
	eWFaHpRWhd8jHBw5UIWN4MWpsKLF+IFrF1lcFygOg/qb5CC8l5sxxvCj+egHvxyK3G0zWYxPNZz
	wDWi3kTIykkaWIS9iH1dGFybRKTNRIISfHA2ZkF3DGiNTDBoviRRySQvLjg==
X-Received: by 2002:a05:600c:46cd:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49e7a66b2bamr22984835e9.20.1789380838755;
        Mon, 14 Sep 2026 03:13:58 -0700 (PDT)
X-Received: by 2002:a05:600c:46cd:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49e7a66b2bamr22984415e9.20.1789380838387;
        Mon, 14 Sep 2026 03:13:58 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm307694265e9.15.2026.09.14.03.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:13:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com, holofermes@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amit.barzilai22@gmail.com
Subject: Re: [PATCH v6 0/6] drm/ssd130x: Add support for the Solomon SSD1351
 OLED controller
In-Reply-To: <20260914085931.66857-1-amit.barzilai22@gmail.com>
References: <20260914085931.66857-1-amit.barzilai22@gmail.com>
Date: Mon, 14 Sep 2026 12:13:56 +0200
Message-ID: <87mrtk16or.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

> This series adds support for the Solomon SSD1351, a 128x128 65k-color
> RGB OLED controller, to the ssd130x DRM driver:
>
>   - Patch 1 adds the device tree binding.
>
>   - Patch 2 switches the SSD133X family from RGB332 to RGB565, bringing
>     65k color to the SSD1331.
>
>   - Patches 3 to 5 are preparatory cleanups requested on v3: constify
>     the ssd130x_write_data() 'values' parameter, convert
>     ssd130x_spi_id[] to C99 initializers, and reimplement
>     ssd130x_write_cmd() as a variadic wrapper around
>     ssd130x_write_cmds() so a single loop remains.
>
>   - Patch 6 adds the SSD1351 as a new SSD135X_FAMILY. It gets its own
>     primary plane update/disable, encoder enable and backlight
>     callbacks; only the callbacks with no family-specific logic
>     (ssd133x_primary_plane_atomic_check(), ssd133x_crtc_atomic_check()
>     and ssd130x_encoder_atomic_disable()) are reused as is. It also
>     sends command parameters on the data path, handled in
>     ssd130x_write_cmds() via a new cmd_params_are_data flag; see [2]
>     for why the split lives there rather than in the SPI transport.
>
> Testing:
>
>   - Patches 1, 3, 4, 5 and 6 are tested on an SSD1351.
>   - The SSD1331 RGB565 change (patch 2) was kindly tested by Javier on
>     his SSD1331.
>
> Thanks to Javier, Andy, Krzysztof and Fabio for the reviews.
>
> [1] v5 of this series:
>     https://lore.kernel.org/dri-devel/20260823111959.17029-1-amit.barzilai22@gmail.com
> [2] Command parameter path discussion:
>     https://lore.kernel.org/dri-devel/20260811122603.30773-1-amit.barzilai22@gmail.com
>
> ---
>
> Changes since v5 [1]:
> - Patch 6: move the zero length check to the top of
>   ssd130x_write_cmds() so it guards both command paths, and comment
>   the len == 1 early return.
> - Use the "Assisted-by: LLM" attribution form.
> - Rebased on drm-misc-next.
> - Collect Andy's Reviewed-by on patch 2 and Javier's on patches 4, 5
>   and 6.
>
> Amit Barzilai (6):
>   dt-bindings: display: Add Solomon SSD1351 OLED controller
>   drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
>   drm/ssd130x: Constify ssd130x_write_data() 'values' parameter
>   drm/ssd130x: Replace positional ssd130x_spi_id[] initialization with
>     C99
>   drm/ssd130x: Implement ssd130x_write_cmd() on top of
>     ssd130x_write_cmds()
>   drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
>
>  .../bindings/display/solomon,ssd1351.yaml     |  42 ++
>  drivers/gpu/drm/solomon/ssd130x-spi.c         |  25 +-
>  drivers/gpu/drm/solomon/ssd130x.c             | 421 +++++++++++++++---
>  drivers/gpu/drm/solomon/ssd130x.h             |  10 +-
>  4 files changed, 433 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
>
> base-commit: 766bfba0f3bae329f99b42dcabc3ef11fa368f0b
> -- 
> 2.55.0
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

