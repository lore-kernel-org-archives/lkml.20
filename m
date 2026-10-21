Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536614;
	b=IJVrPS9VpUxAyw0X9OiLXw/NUL7AS17t36zM2ZG+yWxTvZ8OASSlHoEpXXf3eei1qFuw
	 oCCsf+ky+0jFseeSYiz2Xqk7H2n3pVKexzKe4BtZREWy2XDMwiwyMrgNmr/sH/1Jqm97U
	 nCcQpm/ctRN99PkXUgWrioJRX17Rl4JnwMpnnonqGVCHIzdFwhGdTJ4Ma1AYvOjIYSJgV
	 pXoGdAHRjUKXs5q2ymywf1E7kmvSKViR1EOYKWVVtUsxSwhF36TyXIVNfTg/PwmsItKsa
	 9w71t8rRs+J19PAAg5ifQydz7co6978OpyX3F/EA+du1MsmDnsfZxtkf1jFLbLGrq9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=19wjVHCaibD5UIJAy8r6oN0ZlDD7tIr+wntuQPjoIEE=;
	b=aK7pWo751adwLUZhXJ59kpyz8Fq62S4ABjdkizZC0WQjtud2PhIC4kwA3BGb14/fLQpJ
	 R4JhanAzDfCjReIezgiUPcLeSnawnI3VIR9EKK0abshxBW2CvjMXNT0nnZDgehrbLcqIz
	 a/emQjIV709MD112cCzq9b3pZrz2MqZQ23maUs7n0nKrD/zMPBV1WYcVqycKSlRIPXVqm
	 h68sQmtVDFXTmYCKj1OuoC/MbOH9mu6m2wb7sBRm0wxXSsYiMCuCw3ta3nlIZYBRhq4kW
	 GcX4aaFDyifn0hFSzNmlvwdoE/hhRSy3DHseHEurT36wgUZJPYfbS2QUozXfQ8Ca8Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mRT4TwSG;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6E606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E6E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mRT4TwSG
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso569255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536612; x=1793141412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=19wjVHCaibD5UIJAy8r6oN0ZlDD7tIr+wntuQPjoIEE=;
        b=mRT4TwSGWDRnuh0cCmyIEeJq7GUXr4Y6YlnO0uxDP83vepiX74FHlIlG5AOllXegw2
         ujRzkLqgBh2J87eC5U299NzqB5SVJMCYD76izGIHkBEZxk+xF4gdD/3dKcoHqUzq0IAW
         ZhBTyO5MsuLjDU19d4NlATZQZX38YBP/hG/CNu62/PvD9vFw5dzZbopFW1tQkcF/3w6Q
         mqxkGtsw7fhS5DOwDduhuK3FTYuHmYKVT1ul+AEmZlV9ebrlFqsihvw1hjuH/wMHiz2i
         FSv2w4yS0izw8n0SbrcQP1w1Lpycv89h/npTL4qRK9l7cq2cQ40dEnrbdTS35Qhdta3s
         u8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536612; x=1793141412;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19wjVHCaibD5UIJAy8r6oN0ZlDD7tIr+wntuQPjoIEE=;
        b=XCKJt/t4H+JXN02wg7GdrvPAEH5fKsbR7AZIIrSoB/QlNrfkhFSx7Fi+NMZsI/+vIF
         5RbqqtsFBPm3OYrgtwdtRZnUb5W2WDSH7CAWHgcA7pQh8ES38yz17BTAONuekdkKjglj
         36rlWxMjKbHGnDd5TNvEzbUxDwzNAdaLUt0RA7FS7GLpIJchPzta9jCaTlRYUOAlj1z1
         LuBMUFbeW+w3zawBYkxUeiStiz59D1ra/b6gsmO54THStUXPtmdrI+ykmyJf6LRzrWEd
         neXw/BfAPXsswqJeZf1o4huXNWqcempQimuFYcIiLNkoz1K5YrNBZykNkwXZZaIZpSej
         HvoA==
X-Forwarded-Encrypted: i=1; AKwUvBwIL5f25v3UUwoXYCFUt0bShhJCPuOLe64VzXVuNhD4XWu6QLbP5xuG/6ZwrQwPB+gDnuuuHMGDwH12dhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIugPDgsmA56v/wcUcc6S2p9rUx1mTh7YasqTCvG+mZkLZPSL3s
	vet+QKI9mIIK5jpXkTIVqEmS+6a+YEc9OO8glG/3fsAJoB4BjCznnbVl
X-Gm-Gg: AYBFou0i4WELqV0PUHYny7ahUHRpJi13ANXq1YLzjwwO+Lo25xcHDNHAwYfh5xt/0KF
	SWhEhY3d+8GyIXDWByMFoN8bfo3/WR8jrP0+fB1qRLQd8K8Z8H8gz0aO4QybidGa+/St+8I+79B
	Ov5bBMUZLythlvA94QiaCAxRSwTV/iFbW8QIJX3vQI8edhlB9IeROsgw0qNonVIQ0br5rfTH+RE
	+ktv8NSUmEeML0Uj3lXu6TfULYNeWu/QoBw+Q4afw+gtbWkox6ys2fnZSsdUynvVa0ysX06ZGcl
	KiSfKEuojO9ThLbpFOZcDxcDdStBu1PYUcZiIapBDZAXm7T5jZRF21QaUF9DFHbEClGxTd7+gw0
	oHCNotI+j5ijrrCFqSu04YloEFSbTn+t4RDay+fBN/iAKGAjryU501XYjezEWG0/zwFv1o5P5TP
	qqHn/Aq3tqfdgq4Lm8KI8uHzrA3hHfxRkQuBIBPCGucycrgBLMcIkewWQEIYUqG25eYErrUFn6Y
	JT9luUxGU6pTvQ97qBpCRC+
X-Received: by 2002:a05:600c:19c7:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a1fdd2f2ecmr2163415e9.16.1792536611838;
        Tue, 20 Oct 2026 15:50:11 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:11 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/13] drm: client: add splash client
Date: Wed, 21 Oct 2026 02:50:01 +0200
Message-Id: <20261021005006.2341200-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <fafa7327-e624-49f2-98b2-83fd602a0ad7@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-4-maximpedraza@gmail.com> <fafa7327-e624-49f2-98b2-83fd602a0ad7@suse.de>
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

Hi Thomas,

Thanks a lot for the thorough review. I was preparing v6 when it came
in; I will hold it back and work all of this in first. Answers below.

Am 20.10.26 um 12:28 schrieb Thomas Zimmermann:
> This lengthy comment should be a list of per-revision changes, like this:
>
> v5:
> - exit when firmware BMP is missing
> - foo
> - bla
>
> and so on. We keep these in the commit message right before the tags.

Will do.

>> +	select DRM_CLIENT_LIB if DRM_CLIENT_SPLASH
>>   	select DRM_CLIENT_LIB if DRM_CLIENT_LOG
> Alphabetic order please

OK.

>> +	  The color can be overridden through the drm_client_lib.splash_color
>> +	  kernel command line parameter.
> No extra module parameters please.

[...]

> As I said, no module parameter for colors.  The color is something that
> the SoC firmware vendor would know at build-time. There is no reason for
> the user to modify this at runtime.

Sorry, I should have answered this the first time rather than keep
the parameter without a word. Let me explain why I would like to keep
the command line, for the colour and also for the parameters patch 12
adds, and you tell me whether it holds.

The build-time defaults cover what a product normally shows. The
parameters are for what is only known at boot: the bootloader finds an
update pending, a failed boot count or a recovery request, or reads the
product variant from an EEPROM, and wants the splash to say so, with
another logo or a red or amber background. Any bootloader can do that
by adding to the command line: a setenv in a U-Boot script, a recovery
entry in GRUB or systemd-boot. Changing the device tree instead needs
fdt support in the bootloader and knowledge of the node, and is not
possible at all when the device tree is signed along with the kernel
in a FIT image. On x86 with the BGRT there is no device tree, and the
command line is the only way.

There is precedent for this kind of setting: video=...,rotate=,
fbcon=rotate: and fbcon=logo-pos: are all about how the boot screen
looks, and console= wins over stdout-path the way these win over the
device tree.

So my proposal for v6: the defaults are set at build time, as you ask
(the colour already is, and the BMP's file name becomes a Kconfig
string), and the parameters stay, only to override them for one boot.
If that is still a no, I will drop them all, patch 12 included.

> How could we find out about the bmp's file name? I assume it is just a
> file in the initfs, which we have to know about?

It is requested with request_firmware_nowait(), so it is looked up like
any other firmware: built into the kernel with EXTRA_FIRMWARE, in the
initramfs, or under /lib/firmware once the root file system is there.
The name is fixed by whoever builds the image, so

> In any case, this should again not be module parameter. Please make it
> build-time configurable via Kconfig.

a Kconfig string fits it well for the default name; v6 will have it.
splash_bmp= would then only pick another file for one boot, such as
one of several images built in with EXTRA_FIRMWARE, as above.

>> +} __packed;
> These types are already in efifb.c can we move them into a header file.
> include/video/bmp.h should work.

Yes, I'll add a patch that moves them there and makes efifb use the
header. The header keeps the __le types, as BMP is little endian
whatever the CPU, so efifb will read the fields through
get_unaligned_le*() like the splash does; no change on the little
endian systems EFI runs on. That patch touches fbdev, so it will go to
Helge and Peter as well.

>> +	*data = fw->data;
>> +	*size = fw->size;
> Why does this work?
>
> We no longer hold a lock on fw. If a concurrent thread calls
> release_firmware() on splash->fw, data and size might become invalid.

The only release_firmware() on splash->fw is in
drm_splash_image_cleanup(), which runs in the render thread itself
once it has drawn, and at unregister after the thread has been
stopped. The firmware callback stores the firmware under fw_lock, or
releases it itself if the thread is already done, and never touches it
again. So nobody can release it while the thread reads from it; the
lock is only there for the hand-over from the callback. I'll put that
in a comment, since it is not obvious from the code.

>> +	drm_info(client->dev, "splash: request %s as firmware", splash_bmp);
> drm_dbg() here. drm_info() is log spam.

OK, here and in the other places you pointed out.

>> +	int i;
> format_count is an unsigned int. i should lik

OK.

> Values like px_width are deprecated because they don't work in the
> general case.  Rather pass the format as drm_format_into and do the
> px_width lookup within the drm_splash_fill().

OK.

>> +			scolor = *(const u32 *)(&sbuf8[src_offset + 3 * x]);
> Please build scolor from the individual entries in the color table. This
> type casting is fragile. It also only works on little endian with
> unaligned loads AFAIU.

Agreed. It also read one byte past the end of the image on the last
pixel. v6 already reads each pixel with get_unaligned_le24(), which
builds it from the three bytes, in this patch rather than in a later
one as in v5.

>> +	bmp_width = (s32)get_unaligned_le32(&dib_header->width);
>> +	bmp_height = (s32)get_unaligned_le32(&dib_header->height);
> Why not make these variables unsigned?

[...]

>> +	bmp_invert_y = (bmp_height > 0);
>> +	bmp_height = abs(bmp_height);
> That's the answer to my question above, i guess?   But what about bmp_width?

Yes. Both are signed in the BMP header, as in efifb's struct
bmp_dib_header. A negative width has no meaning, and keeping it signed
lets the format check reject it as such (bmp_width <= 0) rather than
see a huge width that only the size checks further down would stop.
I can read the width as unsigned and check it against S32_MAX instead
if you prefer.

>> +		 * On x86 some firmwares use a low non native resolution for
> 'Some firmware on x86 uses a non-native resolution for'
>
>> +		 * the display when they have shown some text messages. While
> 'the display if it has shown some text messages.'

OK, thanks.

> The entire if-else block below should be a function drm_splash_blit().
> Please also see my comment on using px_width.

OK. Together with your comment on patch 9, the blit will become a
function from this patch on.

> The client receives a hotplug whenever the attached display changes.
> Returning here would likely break anything after the initial one.
>
> Best is to kill the rendering thread, rebuild the list of modesets and
> reinit.

Right, today an output plugged in later stays dark, and a restore puts
back the modesets of the first hotplug. v6 will rebuild on every
hotplug, keeping the image around so that an output plugged in later
gets it too.

> Why does it use a rendering threat?  Wouldn't it be much easier to
> schedule a worker?  You can also try to put it on the power-efficient
> work queue.

The thread mostly waits: for the BMP firmware and for the next
redraw. A work item queued from the hotplug and from the firmware
callback covers both, and makes the start and stop paths simpler,
which is where v3 had its use-after-frees. I'll move it to
system_power_efficient_wq.

> I don't think this is right. (?) If there's no fb, the restore should
> disable the display. Just run the commit below.

Fair enough. The early return was there because committing modesets
that still had a mode but no framebuffer failed with -EINVAL and a
WARN. v6 already clears the mode of an output that gets no buffer;
I'll do the same when the buffers are freed, drop the early return,
and let the commit turn the outputs off.

>> +	mutex_destroy(&splash->hotplug_lock);
> This line belongs into drm_splash_client_unregister(). The free callback
> is only for free-ing the client instance.

OK.

>> +	drm_dbg(dev, "Unregistered with drm splash");
> 'free', not 'unregister'

OK.

Best regards,
Màxim
