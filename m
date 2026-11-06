Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969632;
	b=fHIgHatMxtC6Z+OyyKl+o+hYRrTudz0WTqIM/5//4PY1K9hQbE9pOxH9VYwpEonhOxRm
	 5a5r2TnReNkPBh6bN6uQturVxM+eaqj/I/eSJFRPF3oz/kksekq88RLBIcua5NGpK8rHA
	 Y7h98yaOC0lQTb7rZv2IbG8xo9UJLUIltVkZ9rNIcww1i738yBAhI6x97dS494eyrxo/w
	 IIPEX6e6rtpjsv9dzOorIKRnuGiJni8n7DpPwrtckDMR1TgK5rSZeETXJKMFGMmbXNLpI
	 LV6q5B5huLMpjkRHqdC7OcT+mtaROl3EjEe3reWS2AVHIPPc3HYUCbgpV7f+9Q+YtdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oTHjiyDX2guT5VBDXE9scu6NOC96wb99UsVWoSwnSP0=;
	b=36S+xmTbyS46ir1jNdza4VWUlSG7PpWlSZTjlwMSVfDiPKMJMvZQzi+ptQK6s6jQdkOV
	 eLh8pM+1tS7mK6E6SBoclnZ3HW1bRBkR3kg6uKWWjx1eow3gqYLQtnjvpxmhSLm1HIjp9
	 HXqG4DCNKMr2e19XVrpSRp4U6OAEpxpzKMb9LP6kk2b1dc6/PIBASg09NYdAimA0J/MD1
	 PMzc04QciXrQHIUneyjRDHDkGDUdABepJZUH8e1puJ5V8cfRdwzkzojxAJKmIk4oxCFtk
	 HBP/HRT7iHuIKISDu+dPlbEXioDYuaRj2xg5c1rr+vhxbP8gxjPZg0a+tSG/l/n06gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTQOMoxi;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DFE606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61DFE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTQOMoxi
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214af2076so4045845e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969631; x=1794574431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTHjiyDX2guT5VBDXE9scu6NOC96wb99UsVWoSwnSP0=;
        b=RTQOMoxix56I3khgiwxSLlG6MqNj4SnKFN0SBhox6cEqvgnl7JGomA1wRtDOmcDzLn
         SMJbxP2clNS4vp9IEQIfNqOTQieTPb/o/DkCapHlrMzsPu6UpPko7DR4mpB3S63dhpsA
         yQIBpXjJ5HgVWdunVyqSVTnmQDD07f5uSMGGmNBys+TeI0//Lgvjg03DukZF8YSSjcXa
         6iBj+12ApuubwP4ZWxCaiBMjqjQQa1joZPEi92XjrxUdybrBwYF7+rkj8D7F62pL697Z
         Dm7VhyarpKwTU6Om6ty0AEYYTNZ8YrIxmj2NZuNBefTI3ypgkCjCScMTGyRuYCr0YEb0
         v0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969631; x=1794574431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTHjiyDX2guT5VBDXE9scu6NOC96wb99UsVWoSwnSP0=;
        b=A6U8pVK/3EJX7AXfGVJQ9dItj4xNMfkSHcCyfmEpK6WXrNm8JYxXVrHA+UDa/EqIRB
         pVsL8nWN+KSv0QwroJVHtTTqTaLqdhcDlocPMb4YarWaxIpuamYBSD0LJ06LOfwfqoQQ
         rUTHtqSksLV8OXeImcnEUCx/NnTs1gfJQ9i/3e3AiLFdOn+Ek2MtSn6Q5bw1c28Uc811
         v97QD6pX7V72/5wa81UnmA2Ik5ORDzeaL0MoyJ78JOz0kLfqFKm18kAMyMBH7JLhDT4j
         iXTBX6pLOYcc4hQ+JyePBNlVL5l2MD6k+nMOyfN+olZfpl8zKEtzQXCuGfbJzeg+QehA
         gIUA==
X-Forwarded-Encrypted: i=1; AKwUvBzzxoEFoKFL7tnnqwq1ZKfgtcgm5iAYfFn50FlucHhhbCeCEhl/GCt/anvCNWkqnPZENYq1RO2C/PsZAPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lvMwG+2Hp3GKvSjUNGLpEQ09YCYsmR6X8TjPmzt7f+Pdg2aDX
	dpGTUaTVy2cOhhFfXv+bUQpU61C5oCxN9fh6tCc31E37WgMq+SSK7uTM
X-Gm-Gg: AYBFou3ddeK7/e8bbT6fOAnqAfH/isVe0ZvPpzFegidTzDCxGTz14r2YW7GqnjrUY1C
	TuiP2Z6apSmNC9Uml4AmNMXN2vLotYAV9zQEA1wjjWMKPPtkmcK0Gu2uUsGhJDUWgUJvepDUewc
	uPX7rJ5ThYFsfbkcrvpOx8hM6lTGzWlkIWKzalG+sQtFs1Z+uYmrNUluI1OC6MTNSfWvGBO6xNL
	/UXbwS5t383NgEIFJlWioB48hxCK0mJjg2+xA5HLb/CnaJN4Au7chKi4IhYkM1IyV6G60F4O3lG
	u4lORbL0r9uM5RwLhnN+NFkPEXdWoSObV8tZAjtB1BjPBnxuHdiRwWPhjHFLccQBOaUmgmvqyla
	HesFXzvsD+03pBC6fO0cn1Q1MVM/lqidgvjTaV/xiHtfm2Lx9UHBDph0GBDtIGiC2VbszVBrWJn
	tBKycs0PeI6pyihSKki9K215wQSeleXY5LV9MpJ1gEoh0vH7OJlvcc58qtHHjnbcIM1H8E40KWj
	X8iIopuDltE59cEC1FXgr8beb+jhMfh6GDbzL4PlL5tA3zrYl/Hw0Bmh0V9ltx1JcOsBvJcwVnx
	MwTYLj4LVbchX7ugHA75buQeva1S
X-Received: by 2002:a05:600c:1913:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4b6de0ce791mr41196125e9.16.1793969630568;
        Fri, 06 Nov 2026 04:53:50 -0800 (PST)
Received: from m2.. ([37.142.148.124])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d676sm58687815e9.7.2026.11.06.04.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:53:49 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: Re: [PATCH v2 03/15] HID: ft260: add GPIO support
Date: Fri,  6 Nov 2026 14:53:40 +0200
Message-ID: <20261106125340.18483-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7a3kc2tj2mh62aklablkma5teiinm6b6z2rlvrfwk76xcnd2rb@xwsgziioxz6u>
References: <7a3kc2tj2mh62aklablkma5teiinm6b6z2rlvrfwk76xcnd2rb@xwsgziioxz6u>
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

On Tue, Nov 03, 2026 at 01:53:26PM +0100, Bartosz Golaszewski wrote:
> There's a lot of sashiko comments to address but a few additional nits
> below.

Thank you for the review. I am working through the Sashiko findings
for v3. Below is what I plan for each of your points.

>> +	mutex_lock(&dev->lock);
>
> Use lock guards from linux/cleanup.h.

[...]

>> +exit:
>> +	mutex_unlock(&dev->lock);
>
> That way you'll avoid this label. Same elsewhere.

I plan to do this as one new patch at the end of v3, which converts
the whole driver to guard(), and to remove these labels there.

The reason is that I also maintain an out-of-tree version of this
driver for kernels older than 6.5, which do not have linux/cleanup.h.
With the conversion as the last patch, the code before it becomes the
base for that version. It builds on older kernels with small changes,
and I can simply leave the last patch out there.

>> +	dev->gc = devm_kzalloc(&hdev->dev, sizeof(*dev->gc), GFP_KERNEL);
>> +	if (!dev->gc)
>> +		return -ENOMEM;
>
> Why is this dynamically allocated? Make it part of ft260_device.

Will do in v3.

>> +	if (!label) {
>> +		ret = -ENOMEM;
>> +		goto exit;
>
> Just return here? Why the label?

Right, it will return directly.

>> +	snprintf(label, label_sz, "%s%s", prefix, dev_name(&hdev->dev));
>
> devm_kasprintf()?

Yes, v3 uses devm_kasprintf().

>> +	hid_info(hdev, "initialize gpio chip on %s\n", label);
>
> Drop logs like this, they add nothing except useless noise. Same
> elsewhere.

Agreed. In v3 I drop both "initialize gpio chip" messages.

The "enabled GPIOs" message moves from info to debug verbosity. It is
off by default. I would like to keep it there, because my hardware
tests read the GPIO mask from it.

Two messages stay at info level. "registering device /dev/ttyFT%d" is
the only one that tells which tty belongs to which device, like
"converter now attached to ttyUSB%d" in the USB serial core.
"chip code" was in the driver before this series, and it is the only
place that prints the chip version.

Thanks,
Michael
