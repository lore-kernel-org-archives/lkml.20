Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587334;
	b=cgB0N4fSZRyebs5spzPDrVu3aszr4DMgL+0pZl/laCmg8U+10mkm2ZtW+Sa527SC99Z6
	 SEPXwMSwfX47A9oSoSvqNJu8S1J69qMQPLgZgVAvmQb6lc33e1MxjPypQ2W1wvNm1637t
	 TLwJL04HBFIgpN5y8+os25NCEJgVZ8LIrGchBycyZlQVxSd0IEKE7TY47qngMmbsOJIqg
	 azamVkwvCaNQ4++ug+yocB1Kvqodd+KssfCiOdPhhHwI7wgk1PHcbBllxJpRziR/ZZRjq
	 IzVT807ESiOWWlIKcTXQIZLp462T718tnuZN2BH5slGUHFzmDlL4kkmWY5itmfB42Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
	b=S8QDxBFV9OHYfVX8aKwAS/DmRJmk76Qz/YKtn+8UaLQtxb9yD4EyPRSkX9dOxVx3tkpF
	 sz/gUYCaV0TRbsB90D6bTq9ErTNMdW5vP3VDp/hGL+bKOKsKh0gnoS2xcqLqqkAOlzBmi
	 izpyOK3ICNhfDLOrfRwq19mdNVDvGUSQLod1kOq3D554PG5a8DnkzsPQPwoVFEx0sw2E5
	 0vbXy2VNFvfDEVKu+N7EkcwEZdXSqwggVUIj6W/xunZjYyY40YNEwSwuQ4Vkoaeu9q70q
	 p1VS/R8SjU96ornOHxgRVTw2hIK/e+JJY0T70Dqc+TItgzmlnHcbkpuqY8CCqkrqplg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=FzCmt13c;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01514606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01514606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=FzCmt13c
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f3c895a0eso235883185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793587333; x=1794192133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=FzCmt13cG+aKsnwVBtMJ9Fmc970lVhhc0e6juVp8IQ97lKL5tpXK3/7CBqRRs2hyJN
         Tze0XcdilstpMTPfqXpq8JvpLywnDzkJFC1em60OFU2G6Cx/netBP4j7KLlFiynKpB5T
         4wjfPJjpyh1zg1x10htvP77jqd854dNdSDKFpzQt7uhTCr0aW3s37SZ2jl9yQ6SJruqC
         mO25pb1tsMdmfK4+VqtiIJUDekdVFkmmOAuCNqcPMROcLtJ/H0h64e7TLmr4QS42uCck
         7/OZebM2x4eqGwYljgydfAXealLtCmRC43f6V733FbDl+vvQHAKuxsetvrkovYH9HTDI
         nT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587333; x=1794192133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=pSs82MNIN4ZCGIGPSwBK6jXAWeW041fdozdD+7dFCNO0U+F07Px+n8O+QN+7HGyAMY
         1y595I2Va+/HS+K1f4mCbd337SPOfRC85nRpGJcXpLQgAEHu0h7+42xg1r9D+cH80gnc
         W1jkGcBv8qxOkZ+Q7mE0FefP44RzcnVrx3A6hoQfPNJjec4Bz/lECVh2ByF9FwxhrtB/
         hO3jZI8W27L4Llc39+yMkj4sCdYns+1cUCUOu6ZuX5ksGNTN8SqbUW42rr1hAzQaezh5
         n3JIW1a8hxQwWEpNwCq00Fy9X92bJVVYYwZrOimD0KwdGGyZpGh2e1lSJQDVIhIs0182
         wdAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxopn3fvoneCoh0zmC2g58rKEP97y/fuslryT7IxiDoczPmKsWYsboS41cjxkhbyeHrejfUg+HW30yOKyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKedS4szR1uWNBUJxpT3s7DM1bq5o7J4FOkOIie6moIkZC8L5Y8
	sxTy1kmhgfbCprANqAXq9E831VAsjhib6SBIBwsLVAOE2Wq/Q32LxZ+sZWZABgvfyA==
X-Gm-Gg: AYBFou1WlJgeGWOeOFMYIdi7vuu8QMFz7eYENXpwJhuNr/7QotNooPPQ1CZsURLMSn9
	GuDf9NO0tG/Y9Ek7sq1RkWeeTbiWerY+RZcl5JyV9iAWex+HeS5s2N13s49k6Iz+ZUBrpoGDiMf
	g8qvYp6c2BcW6rtvXxd81p7vbBtCtALPR/K5J/1ziPWIDINCX8BuqYioKlNqzpdt9+m5GB0sLbD
	x/Es08QzOwIh4IlJ7NbC1qoZFIsmNq8YBX79Udg+GDSDfl6NT1R+tYbeJ4yJRfRcczSJn7DmJP0
	BEJDNClH9wL8/25EC6QTG6eByJjsr0QVh+3xNt5zwSlgCN3N6sSFMRywRCfvaC0akhvBbxAtYcH
	AMjvJg2ZwRcKsRz5Qyp81P7UaS5w3zqA72iK8u5zy/i7JXWBP+gyFTi70THpDpvrJRdSb2dhXfu
	y1XVrhQAfBXEXHr5fVD0NXzagOnrVR98LRqnhUWuVN41Pc145ku81hJTxQAqFYHZf1PxbdADlcG
	Or6MPCXEx6KqEBuV9iWz3246KjOGZoJS9O1sVcQoVar7ZkWKr/NgRkNZj1GhosUY3j9FvazRUL9
	Y6TNUnbH82Kbnx94DN76fX/LdvmS
X-Received: by 2002:a05:620a:3916:b0:93f:47fa:b722 with SMTP id af79cd13be357-94421618771mr1465258685a.13.1793587332748;
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a7195esm724633685a.27.2026.11.01.18.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Date: Sun, 1 Nov 2026 21:42:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <b666dc31-1dde-41c3-be0c-3ae5091b9683@rowland.harvard.edu>
References: <20261030151919.3511106-1-jjc@jclark.com>
 <sashiko-outbox-191184@kernel.org>
 <20261031032449.3536559-1-jjc@jclark.com>
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
In-Reply-To: <20261031032449.3536559-1-jjc@jclark.com>

On Sat, Oct 31, 2026 at 10:24:49AM +0700, James Clark wrote:
> On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> > However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> > undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> > usb_unbind_device() does:
> [...]
> > Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> > to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> > usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> > the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> > second time and emit a duplicate USB_DEVICE_ADD notification without an
> > intervening USB_DEVICE_REMOVE?
> 
> Both of Sashiko's points are correct, but both are pre-existing and this
> patch does not change them.
> 
> Before the patch, a probe() failure returned straight after
> usb_generic_driver_probe() had run, with neither the configuration nor
> the runtime PM reference undone. That has been so since commit
> c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
> The -ENODEV fallback has re-run the generic probe under
> usb_generic_driver since commit 88b7381a939d ("USB: Select better
> matching USB drivers when available").
> 
> The patch deliberately handles a pre_probe() error other than
> -EPROBE_DEFER exactly as it handles the same error from probe(), so that
> the fallback keeps working. This is stated in the kerneldoc. The only
> new code on the error path is the disconnect() call, which undoes what
> pre_probe() set up. A complete unwind in usb_probe_device() would be a
> separate change.

Since your new pre_probe() will interact with the bugs mentioned by 
Sashiko, perhaps you could submit a patch series which implements 
pre_probe() _and_ fixes those bugs?

Alan Stern
