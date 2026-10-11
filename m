Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C4457E70
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729670; cv=none; b=HIKl5BTgSvWTEJRAfxs3Hvxg2ti8vkaAHgmZdXOv0Ic85r+YKADfjizpcT+G55TFzCsZJYreWBsx4qCTvheoHs76qEEk6fU26/zRjC41h2vm8FtlEYDZcERVvJbf899KdajHuQtDC4UyBmKJU8z514XxJYOnaPUDiHoMSbteBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729670; c=relaxed/simple;
	bh=ZRCTAvNWJ7cmE9XDvXQ/sW7gPe2H7lQcxGLvXMC/gks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYXjpzdoZA0XauqIkul4F2EfsIWgHR05R8/fLKp0EiJULIFxjyCj+6R5im67rxPcZDEYcOKE0etMliYItlDsZMJFzVHsHpqa/n1C1cP/WT+8Sxre9xSeIjrupyt2iLTYC0S9jptDI24QHhQY62lTr0Z2aOT2dESMBztaKD+wgFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCgfyKi8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCgfyKi8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so7654095e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791729667; x=1792334467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL9QLQ7HRpWVc/IeBUw4hL8GCZtNDCLqj4qI5u0oC7I=;
        b=qCgfyKi8U9G2bZ1YMQ2THoGaAj4038cjyRj2S6xHUeY7nKn/HnSYa9fOZAz+S4vIfD
         s7q96hdgryHuhAJF6QTLvxzIFkMvz9R27Ib4MuKpRWqv5sCGe5u7f/pkqV33ZwGcyJ1M
         Uhgw9S99naEpY9IEySecdesM0RIcAkwK5UIoLr4YZwc/4C493Fry3RrZAl0rH4M2CY/a
         Mx1wGYI0Fj2lczxHuIEaP1fXzjtflKCuj9KMsQYEg53mwjZQGHBSLjXm/NgO9UwHFx8Q
         y+19Ja9o50CCkfGam/fL69jC/2/m6bXD8QQ+IK0blu0mUkB9OPZQN2L6nIfpoD7uAX+O
         dcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791729667; x=1792334467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL9QLQ7HRpWVc/IeBUw4hL8GCZtNDCLqj4qI5u0oC7I=;
        b=0pW7hG9OQkEvsAqS3KlGcoegYC2pAR94pSS7FUdTXONR5YdqNBnhOiOSaHCdHH+PeS
         1+/aAzvaY3jIEXJMwsTGZbbXYDiTzDDLdKR4NqMel8/m2I1QtLiCio9Xjq4LHwNjtur5
         fToU3cE11DfZYHxOxbtjsAHdvKofddDMX+1OwbD+uWdFRrCJgRA6DxAvk/UlnWJKmfCm
         bsS1ZdoXF4b8amNU9QimB+44sbAUIUecu+kmuKkBbpBWX7ZyxmuXaAaRvsVYeY38PcCb
         oL5z76eRadI00RtDtulTlRChAue078nXU8g3c4RsunEyhJUse0PDVJTDdFxxOCbZJmh0
         r+cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAWJrLTZKmrRND/T/peTici98bdTFb2UCCKzG4+anXlO/G66IMHEq+fOVT/zD7MtMWp6fbch3ijp/5w8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYILHG3SQUAwwU7kBbqvMECVBRo2mmNTDgzNdUUNnW3QLCIUbkNu
	TWt3RnwnxXQaYz2XDK7s4wepz5wkHA+TkAPMgWPPBdCSneLvOe1FTnQw
X-Gm-Gg: AYBFou32DiNevhs2wUi99M05+yPxzrkwuAFVUvHZ82lDou/c/G9wzvK/hWXJ75j043U
	N0F5sOvYaJLOX/L5H7ky4y7vPPL0LHu5nKMBMRrShKEfQXrChib/oLAaenugUN5iw9H4+EPUkaP
	O0tCUxOEn4+1rtZn4PYnx8lOkHQ/H7sVquXUhHwgVBtHMxI1Rr5NaLaei4lh1NvKb1cveRDfwn2
	UNYMi1BtccWsT1Z6SnvgrOncKw0vkQmyMIzg9Qq0ln8LqwMeQqlDMmg1VAlLHrXkYgcfpQDykxV
	QO/9ZAS/3kTbDSZDJHjwVgaGYLvMobkXKauvGzYQ90uI9eorv2WlImwF8mJv1LTvD2QPORZ2Pxq
	NNqvj60SUTivoUuwJ4lipOgu3UfhT9ZbDduZPSAksKPXfAeRtQTo1hdlmyM53I3VM/FQKSSGlAC
	YEz12pizc+955ggKmp9Bj/cm0MlPU3xAGr/jgZHaJgdS0lnwX7BvWkgenZpNFbo0M6lWX4yQ99b
	+xEINNtciUs5WB1UeuBixnGvASU0tZT80RlLi8H/Yerx6eqTLX2FgCLlPDd7P+JjLGCSzdeuLYZ
	bKM=
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr147175805e9.21.1791729666495;
        Sun, 11 Oct 2026 07:41:06 -0700 (PDT)
Received: from shift.daheim (p200300d5ff07190050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff07:1900:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae1c4fsm14233476f8f.58.2026.10.11.07.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 07:41:04 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xFuhI-00000000Qgy-3khZ;
	Sun, 11 Oct 2026 16:41:02 +0200
Message-ID: <76210777-9f09-48ce-af97-90fec06a6f84@gmail.com>
Date: Sun, 11 Oct 2026 16:41:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: carl9170: revert broken devres conversions
 for input and hwrng
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>,
 Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261008-carl9170-reverts-v2-0-3ecb12089797@gmail.com>
 <5771235e-fa91-402a-b5d2-ebb153872c26@gmail.com>
 <aslvBb9VbMvnHmHi@google.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <aslvBb9VbMvnHmHi@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 1:13 AM, Dmitry Torokhov wrote:
> Hi Christian,
> 
> On Fri, Oct 09, 2026 at 09:37:36PM +0200, Christian Lamparter wrote:
>> On 10/8/26 11:39 AM, Dmitry Torokhov wrote:
>>> Commits 23de0fa0d2a0 ("carl9170: devres-ing hwrng_register usage") and
>>> 87ddb2fc29f1 ("carl9170: devres-ing input_allocate_device") converted
>>> the HWRNG and WPS button input device registrations in carl9170 to
>>> devres attached to the parent struct usb_device (&ar->udev->dev) and
>>> removed explicit unregistration from carl9170_unregister().
>>>
>>> In carl9170_usb_disconnect(), the driver calls carl9170_unregister()
>>> followed immediately by carl9170_free(), which frees struct ar9170
>>> inside the interface .disconnect() callback before devres_release_all()
>>> runs. Furthermore, devres on &ar->udev->dev is not released on
>>> interface unbind or registration failure in carl9170_register().
>>> As a result, both the WPS input device (whose input->name and
>>> input->phys point into freed memory) and the embedded struct hwrng
>>> remain registered after struct ar9170 has been freed, leading to
>>> use-after-free bugs.
>>
>> Ok, so you just reworded your patch? Sight...
> 
> Yes, as I promised I would.
> 
>> looking at the WPS input
>>
>> |        input->name = ar->wps.name;
>> |        input->phys = ar->wps.phys;
>> |        input->id.bustype = BUS_USB;
>> |        input->dev.parent = &ar->hw->wiphy->dev;
>>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> the input's dev.parent is set to ar->hw->wiphy->dev and not ar->udev->dev, right?
>> Does this do anything at all? If not, why? The wiphy gets shutdown by
>> ieee80211_unregister() and having the "freeing" stick around after the USB device
>> is gone should not hurt, right?
> 
> devm_input_allocate_device() explicitly states:
> 
> 	NOTE: the owner device is set up as parent of input device and
> 	users should not override it.

Yeah, and this is something you added in 2012... The carl9170 code driver
is back from 2010.

So, was this changed to "break it", rather than the driver?

 From my POV: What's the point of devres then? And why are you so "eager"
to revert the changes.

Cheers,
Christian
