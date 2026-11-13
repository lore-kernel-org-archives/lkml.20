Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589223;
	b=kWU2khwjjTA7Gnh1WoIR9RmriM2xyeHBgyLoO90ryk9kJGJi+ckkY3xXcaQRF+WWa8Vz
	 uB/j1P/AKLNT63uIUlvQ/soR+5QXg6Os0Sjb6Ov2IEAbTitpRD7IEHr7ftCHY1/T/G5La
	 NI0I/kFe5UieQ/xFMHVJih1WTJUPZCNUhpA57HvCv2H3qOgyqdp4DeXNhkFqzHpsQgajp
	 MjryfA6RGMCCJq50CnzpGHAJvonl2kRIUE7i71T39FZqPTdcbxZPj/QF15LPALwj6qxvu
	 39jETNJZosdtHX6wYZhA0pP6Acx9v5e9ejl3BNeOoqP0x46iht7f0/1kEtZYA1Sx20g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1bQXyVqVkKDD+UDSio32D6i/c1PAQ3TYrQsw3SnHkYE=;
	b=xj/F859lTqZcmSz8CtkIhexPZVEI+jcKRkspIBkBS4QdVQ3La/D3gFmM5JKkz6RqLaXE
	 l+rfpq7gpl132eSXIDdqgahhxfUvEwvgcxHX4wI87LeDt9AusTLG0+11DwtoCq+3w90uA
	 aRA+y/JVgtr++3YoYoeJnk25ikTbbcDl/UJV9joUw/a/RinBmPYid2PWezxOKhARIBSH/
	 fHYDwmfq0L92s0Ag8GdbzAkAIPOW5SZbIRjiNiUJYzCJ4izk5ExWrK0xsYQWruZd5TW4o
	 XQ2RC2HEyrZlyQ6KFsO0hGage/MKqQFt2J4805MAL1AnvIHfCsFcmB9guefjzdzbTBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A83606E1D8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A83606E1D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4a15c84c5so11802647b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589222; x=1795194022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bQXyVqVkKDD+UDSio32D6i/c1PAQ3TYrQsw3SnHkYE=;
        b=AHNo//BiS4p7eqboqPdXvhLmmXux+BCjMLEDQy4uQG2AijCkOTCCk5B3Kt02CTEUAb
         ntz5Zrvtyb2kFQ5E61AR2UIlPM6u5sqiy/7wq/7oo5+GtU5djh4TU7KXiyfiyevC07PN
         rZmRUvnGxCERWEFPrklwzcQsyH8GykDWfmnd1x2MZK5N1Mho2hBVSEfujvdEdnk0SNRU
         +7rRWsyX8c5LQT8oD+BT6N+Mwp1iXoCBGXd949HwAIyi3ciDFrjt+RZ3noLShEdIO7aW
         6DUqXS3F6rmo1x/gxT3+tp6HWYenj4XDFLJOawfBzHXmdoyfkljQm663HA+3VH0iq3Rt
         HnXQ==
X-Forwarded-Encrypted: i=1; AL+hErE49pxQFlMyxbDuC9DaLMl+dVQRYLGseMkHYXkDXIAfchknsLyCEaKLXIz3LsZG3XuctzCcLgI6DIZ+AEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fz/5tW97YrhmLdx6yXT8fQvEBTAgV91kgnhcqJe0XgDc09UGM
	GRKdsyRl5R6VCdbkuq2YfRP55VtPjmwxarNc2qAhS+Qh6/nF1/g+LeY9
X-Gm-Gg: AYBFou2bwWzXfkBwAtlIgYPxuH9amJxMF/1nIr7y1gomL93Ptm9KYmFmaS4MctWEogm
	KGcLQEbiMxM7pc8AkHQCQ/tBJNDlxPcuVBf4B0CUAu/pQVPbuTkF85zPggngz9SubRcFZ7qYYRk
	CPWHvMERsB31RVyhVmnH05gn1Vmrm5Q9eKuMmhI3PDJRf3PizBtwB2YhCxdjqCyvMykBbawMRSV
	H9AYZjSMydD5SpXNT7QZ2ocZK0DLttKftidcXjzRG2QxvNv2aQkM+dhXB+ahYQwApPnCnz3Wtj2
	ilEwAfWzC7iv7mzsOz+HFXBDaMEawAMRA/grxB1hEg27zGSiZ3GLyHdzuAnpQmVz+cJ4aZbQBp2
	m4q1UjAWK68RMlj26gyLkPNsDXNtl9RmOB4ekFckOhg6uhbWWdDMkCdSO6jztd+UESf35ndQKuY
	JkWiGoP0KneV4NZNkFucI7d9VpWPOYoMK9/VTxctBRUCzPAhMSyQVmdPzYG86C/1WCfONQyf0P4
	fXWS6Ra/56xds1/QMJw9jQRz1AbG7MpJMznBXFgIOntUA0LaeW0wKCMhk1+Q2+fosaRPfrnnfJP
	Qdo2OgwDisgbHJaZgR/JXA==
X-Received: by 2002:a05:690c:7:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b4aa0d0fb2mr20304817b3.7.1794589221869;
        Fri, 13 Nov 2026 09:00:21 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:40::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa96b441sm24729017b3.23.2026.11.13.09.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:00:20 -0800 (PST)
Date: Fri, 13 Nov 2026 09:00:19 -0800
From: Breno Leitao <leitao@debian.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, catalin.marinas@arm.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] gpiolib: fix leaked descriptor labels in
 gpiodev_release()
Message-ID: <avdBln4BCz_FJjFj@gmail.com>
References: <20261113-gpio-label-leak-v1-1-c6c00f8ebfff@debian.org>
 <avcs8emo3oWpYGBG@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avcs8emo3oWpYGBG@ashevche-desk.local>

On Fri, Nov 13, 2026 at 05:29:53PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 06:38:28AM -0800, Breno Leitao wrote:
> > We are seeing kmemleak report a leaked descriptor label on linux-next.
> > 
> >   unreferenced object 0xffff0005d420f280 (size 32):
> >     comm "gpio-cdev-uaf", pid 21987, jiffies 4297166145
> >     backtrace (crc 7ff222d9):
> 
> >       kmemleak_alloc+0x40/0xd0
> >       __kmalloc_noprof+0x300/0x670
> 
> Unneeded in the report
> 
> >       desc_set_label+0x50/0x190
> >       gpiod_request_commit+0x1e8/0x358
> >       gpiod_request+0x88/0x290
> >       gpio_ioctl+0x7e4/0x1b48
> 
> >       __arm64_sys_ioctl+0xc10/0x1360
> 
> Ditto.
> 
> As documented in Submitting Patches, leave only significant lines in
> the backtrace.

Ack, I will drop them in v2.

> > The test requests a line, removes the gpio-sim chip under it, and only
> > then closes the request. By that time gpiochip_remove() has cleared
> > gdev->chip, so gpiod_free_commit() skips desc_set_label(desc, NULL), and
> > gpiodev_release() frees the descriptor array without the labels still
> > attached to it.
> > 
> > Free those labels in gpiodev_release(). No reader can reach the
> > descriptors once the device is released, so they can be freed directly
> > rather than through call_srcu(). gdev->descs is NULL there when
> > gpiochip_add_data_with_key() failed to allocate it.
> 
> Hmm... There are so many patches are flying in this area. Can you for the
> starter elaborate which Linux Next tag you are using?

Today's tree, aka next-20261112. The splat comes from a next-20261112
kernel running the gpio selftests (gpio-cdev-uaf.sh). The patch is based
on that tag, and with it the leak goes away.

> ...
> 
> > +	unsigned int i;
> 
> It's okay do define it inside the for-loop.

Ack, I will move it into the for loop.

> 
> ...
> 
> > +	/* Lines released after the chip was removed still hold their label. */
> > +	for (i = 0; gdev->descs && i < gdev->ngpio; i++)
> > +		kfree(rcu_access_pointer(gdev->descs[i].label));
> 
> Sounds to me like something that Bart addressed very recently.

If you mean commit 82028344caee ("gpiolib: synchronize updates of
descriptor labels"), it is already in next-20261112, and the leak still
happens with it. That commit serialize concurrent label updates. 

This leak is different: once gpiochip_remove() has cleared gdev->chip,
gpiod_free_commit() skips desc_set_label(desc, NULL), so the label of
any line released after that is never freed.

Thanks for the review,
--breno
