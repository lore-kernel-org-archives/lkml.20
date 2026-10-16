Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548FE3A8384
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792178231; cv=none; b=Q6Hmjbbw93rjTpBYDEr7vwG9CH217jDzhDJ7VP4DQI3aMAY3akiLvWKuDCdLJ9O2irYpLSeh1kAfBEUXADJCKRlqwt8LSwfQumIj36pF9R6/vN5yiiqPCyAb2OhXbRfMGb0oBD/rpvyNmUXAi9nWUdTVV0DYal24M5xOe4Wdwo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792178231; c=relaxed/simple;
	bh=ET917KfXAU2oCz7RCW/M4EQhs4HJ/7oNAHdBONRKMH4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=srDXkzyfPPVKDADTByVSU2A0Nv8Z8Yi+XNQf+3kF5By4Fz96/OFD+5UO2OlmuBRrhUabU07KOFNqG0SMiaPfn0tpSlBvyQj++wPc689l2Nb52J73ue/6/LbDgj39e6BOzjAUPIC66QwwE3QnCVlpgko5qPWsb4tiS51AbOlAtPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzhQW2cp; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzhQW2cp"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso698938eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792178227; x=1792783027; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoDZzK0EmbEwkXW0QdmZPMKiCBUtVL90PEYb/mW71hI=;
        b=LzhQW2cpvdegUxJygLy1kaNexOT1uwZxZA9knjPBsbfPBaVZzt5ITQpGKIzOxV9/Ul
         RvqFou1/dSzhe3r9ZLKzIerpI5YS7qdlVmzxV0CdoDep70Obp3wgWf5FZKe/iMDXH2fU
         3N/HDuT2xDxCVM5m8I4jsknjR7vkm9PXeOVh779tuG73ul7M+bTW8rB2jL4+t/ldg81B
         haMn/fnYlifIf9OwDhGCnwcZsCeJ/lscJMqsxMQEmt/UGVDc0zXLyjk+yxfEfASuHoRA
         uS1Tnmhc3hdFWPs0H9lpWDoke8ijeN82LBTzPTPqdL0ErP2zYo1b97cnfbIHJItTdpCU
         8qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792178227; x=1792783027;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SoDZzK0EmbEwkXW0QdmZPMKiCBUtVL90PEYb/mW71hI=;
        b=t4K5/8Zv8hv086mN1MEOOTismuEpmYZdiUpycP22iadFAI7HldvErr8h37RvKXF8I7
         kSUUNMWQlneFpLFMjofuSijOa/PdR3MtbiJ2ySGItWJkqfu7IESZOIufN2co0hU1BRt8
         dmdtpA2D7ko9paaEqvxmsidaNYoxWQ9S5hA13Z+uQRvWunlBtWaIferdjqjgaSeWo252
         SpRIROE8C5AmORJF5SZXcGI0EgRP+DtB111Fi/cdk3uNRkyGDXJzuP04qG40zapYQ8H3
         OGho+DTwM03QWb772PPADdqPrZsR1SY9mlPjJxOcSLlw6eAsdEfQ8g60HhV0IJyKq+bF
         3tOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPROzC1Phf6Dx6hxNGNPmTJ6J5X6878zExFqDSwVrkZX3RNjNDL/F7l+tdBWZrwJ9nhdTS9iruY8DzNog=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6cQhwSTUBCqV97gTGBRhRRmG1rK+BkBCRYkj5CMFeq1CLrI5a
	eXCBwOD3G6Q5qE6HSLPbA1zLI1fRyoI3ABvTRTehRBS8GxFep4fBZntC
X-Gm-Gg: AYBFou2srsdhSs8e41CNGJJJ9Pz12r8bnS4iciwJki5UIR08OukEa5uqB+IFenZXW3o
	YkIEPfHZNhqn4tQlZ1Kwm21wkvw2sWtPZeZeguWr6314adcUbKx9zSrn3HS0zOOjrtBn5zQEyqP
	O82aeFN0ws+e302eQXyFUHeuloGKE7gSx8rc5oZ2Uqp5NOSXXHJxvXTUa+zvDKIsJiEQUisN36g
	LUIGZCIuhLg36O0c9u5CbjVy/6LE6rav56bDdJiHuJU/cwXeEdWe3mcgBPK2iLer3Nt6+/x0OUk
	50DWIOeyHumBQneOxRq5hJyKGYjLU/abxKKUbhfO2SrrKlDy5g8CK9DR1lkBo4K0ftVosOX1D8s
	cPup8PqrjVLYrbmyPQ/R0SOAyi3n/FOr/AnsoW2OHB/fnugcHE3eWWaDITciWgYKhFA+53u8xjA
	TbP6EehVd2WAHD/VKjnDaqKeJxnERRbS6kjR74ZLMbyVj4KKdvMP+fucLgBCYmcRJBfE6HREloF
	yL2wdDwKf88ow41Z1GBviZDRteNl8btg14nvHpJ
X-Received: by 2002:a05:7301:1828:b0:355:cd68:6f03 with SMTP id 5a478bee46e88-361a283f7demr874960eec.33.1792178227023;
        Fri, 16 Oct 2026 12:17:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:34f0:f27d:9a5d:56e0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm10395097eec.20.2026.10.16.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:17:06 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:17:05 -0700
Message-ID: <30bc6e07072076b0591fd416f50f4fc3@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shihuang Liu <shlomojune6@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] Input: joystick - replace strlcat() with strscpy()
In-Reply-To: <20261016170411.51025-2-shlomojune6@gmail.com>
References: <20261016170411.51025-1-shlomojune6@gmail.com> <20261016170411.51025-2-shlomojune6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Shihuang,

On Sat, Oct 17, 2026 at 01:04:07AM +0800, Shihuang Liu wrote:
> The pxrc and xpad drivers build the physical path by appending a
> constant "/input0" suffix with strlcat() after usb_make_path().
>
> In preparation for removing the deprecated strlcat() API[1],
> replace it with strnlen() followed by strscpy() into the remainder
> of the buffer, as commit 34b228b739f5 ("HID: usbhid: replace
> strlcat with better alternatives") did for the usbhid drivers.
...
>  	usb_make_path(udev, pxrc->phys, sizeof(pxrc->phys));
> -	strlcat(pxrc->phys, "/input0", sizeof(pxrc->phys));
> +	len = strnlen(pxrc->phys, sizeof(pxrc->phys));
> +	strscpy(pxrc->phys + len, "/input0", sizeof(pxrc->phys) - len);

I really dislike this conversion pattern, and I do not want to see it
open-coded across 18 drivers in this series.

usb_make_path() is just a trivial wrapper around snprintf() that already
returns the length of the formatted string. Calling usb_make_path(),
ignoring its return value, rescanning the buffer with strnlen(), and
then open-coding pointer and size arithmetic for strscpy() (along with
an extra local variable in every probe function) makes the code much
uglier and harder to read than what we had before.

All of these USB input drivers already include <linux/usb/input.h>, and
drivers across other subsystems (drivers/hid/usbhid/, drivers/media/rc/,
drivers/media/usb/, sound/usb/caiaq/, drivers/usb/storage/onetouch.c)
all use the exact same usb_make_path() + suffix pattern ("/input0",
"/input%d", "/ir0", "/button", etc.).

If we want to get rid of strlcat() here, please introduce a generic
helper in include/linux/usb.h (or a USB input helper in
include/linux/usb/input.h) that formats the USB path together with the
subpath in a single pass, for example:

__printf(4, 5)
int usb_make_subpath(struct usb_device *dev, char *buf, size_t size,
		     const char *fmt, ...);

(or a simple const char *suffix variant if formatting is not needed).
Then each driver can do:

	usb_make_subpath(udev, pxrc->phys, sizeof(pxrc->phys), "input0");

and even drivers/hid/usbhid/hid-core.c can simply do:

	usb_make_subpath(dev, hid->phys, sizeof(hid->phys),
			 "input%d", intf->altsetting[0].desc.bInterfaceNumber);

instead of repeating this strnlen() + strscpy() boilerplate everywhere.

Thanks.

-- 
Dmitry
