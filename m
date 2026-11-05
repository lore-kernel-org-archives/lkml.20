Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913473;
	b=XGBORrJxQbseYhVL89ObHR4qM0o2CwollQ3iZglGUcc+aKi0h5rzJiBi2zSDxMJNtjXF
	 M2ZA8FKJSHB/Sk7ILEJFUzyWYxKKMbHQd9zr1qRzD0wVbrSW8fylQTDS02ttD6SLq2yK+
	 UdjpKRR9LL3LLJWVUWQU1rGLbmeZhAG4ksc45qZE0dCfjiUeEbHFYiktbyRnJzEqI3u85
	 KefH2F9acU2KYG9n8ldL7ba0QN8IB0uYKaaP+MGXy5hzh8CpL7iFWEcTF3kpx9XrTYOel
	 G2y6oL4yEvByxOWmJ2P/VwXfgaYIuWfngifgMgvQT1tZxukpNxrzTOWo8UsgnGEOAag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GAWX7iXnzNaabe24Dq2spKvoT+Xp3KXo5p/hmCUeanE=;
	b=l8NHVHp1QZYSrlrs5W4wbdNqufvdqBwNMBAo7MWTjLb99fo6R/R1U9B2qhq74znsu6Sh
	 UOsfAlmVKl2fTu9Mdu7QXcllHugsvWtG0UI1Nlu/cN7ZkV4sNEnUKWfGfC06cIpa8Fpeo
	 63rRygqtAkArbmCfaqdtan5WogSt3QFnJmDO5FQJNnABVzugjsJf88zeuDDMYtvQJHTy2
	 wH8x3kp05iMi36R4X0vqzL2eld7mLG4YumPLFfZGAx07LhMBnDzJwbZsmFYq6F0uT3kaT
	 iF8bXT540iI8NJYv8Pa6nLWVRVoFNUd68z1NU6Na7c4E5KwVyWeK0wkLIZ4TgjQuIuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eNlESgwt;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F01606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F01606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eNlESgwt
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso25055646d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793913472; x=1794518272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAWX7iXnzNaabe24Dq2spKvoT+Xp3KXo5p/hmCUeanE=;
        b=eNlESgwt5y4hZyER7iDZG4cXKZzugtrRNjqi1PBNQL0+9ixaJNOLd/Chjcps4tsbn7
         psL3Irc3erF4aH6guwxUo9YwpKChAl2zABtFgv0MsfD2St56tp6YypmeLax4rgKtjRs3
         eVrgsyuUvaIZD43iN5NgDnaFHejfngHiw/bIOxsN4iv5wtstGf1kvmukxR+gEYtV45w1
         L2/xrJJrTRARGPKW1Vh7NI4tHvhCO/OJGE1x6Da+1d4oKKBOT0rWXFllPKIBPXvKb0c/
         VrLvNWizFMa/i3G/gu2+k03zB4hAGuHbRElVBVvluf84yrxzVoP93mE/Wvo3f0HRlEgV
         Dc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913472; x=1794518272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAWX7iXnzNaabe24Dq2spKvoT+Xp3KXo5p/hmCUeanE=;
        b=OnrzwEvQ7Ci1M5acGfo7Oz0X/Wrvy+7rL0Scauaf9mhvkD4O5xmYIFVf1rBNwLxBuH
         cgcFc/YGQNDOaD954NQ1PylNRNwahfn+Tlw+Y1BncafEaNFZKJ6qAdIVqodIqTTm+JaS
         NBjTjRZl+MKMCfhj2LCmnzmWtxC1VXatwGOGaIUkXBDJJDJaKLYPuG4mJV8UTHibWLNy
         9ETRbEmZ/MvrORvsYyxKSuolRqyfEbv+t7HXTXmVc5xuTbiRwBI46WxAZjK6jeBcpY0a
         ALZb9ZXH/WsgwNmQcLieS+c/VCr5KdrhwaJm6ucYijiJYJm/NUXZz85p2/kf5JhD+gvn
         YzGg==
X-Forwarded-Encrypted: i=1; AKwUvBzBevzNRNQnCIJGDI0gSg1OnW0KFni3bLjYfZrjoZFjc5QhAKV32gCDZE2zIJ8AkUCn6Z+dDBQpX6fak+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z92J/fBo2MBdjzkpWmIO3JMrRt3gc2kqgh/23fqpZBAAL3vkSkF
	g9F1WoaG1OP1RtW6BvCaeIhDjo/SAa3f0A0D0os8sXFLs2eQcaaAuPdsjaQ+MRpxYoqBu70Ot8c
	Kg552qHaJ
X-Gm-Gg: AYBFou3ZLdaotYkESxI4kfFMrAP2ctp6F8pesaSoYT+UH+KBUoXPNCae40Q9d4/5Ogl
	+VxmQDUo1sQSgDAEprAgym1etWmLfpLsjFbMPPUiEeYvw4OpEXSkGP6V8Ke4cPQRYEHJL17kAMO
	Om0zD4FjsO/FSVMdT6Pwza3D1nw0atzvFvoBrBYph/AzNwTVkuemZp0bfjsmpOBDb+xKRerDcuT
	uA/pup0ksJ3qKx03BfTT0gOGgoMOU3o1r0UTYV7XtZzoWFyVy9cyEdewdhWBH6tWl5HXkDLTXPq
	E26q+17IH4a8sY/p2jIT1fhvjGAzra58exCVorh8dPLsfmnJgBqw/mOUCMfNSH2goc5n22M+p3j
	dhnDlNe915aGOxZ1GYWZFJTEWkNu0pCieyLyny0U3KwO5zsnxznVSiAFN5+yYUkmVW6QKoYdFP7
	5ISxSgHg4INOzefWNwHA6NY6t3TyYij9yZZTlYOx0oihApjKrVY6MdVsy6/RVSy77CVGrJjK3Ku
	IEPMCdIhySw2SgHQwNsp/B/ceWaFS8M2/1p2unXANAMIbaEVy6eW76PCffyL3rA53SKcN8d+1p0
	vpxCqRenerqXtHXIhdhLA6s7w46R
X-Received: by 2002:ad4:4ee5:0:b0:91e:a5c2:37f7 with SMTP id 6a1803df08f44-91ea97a22b7mr4156006d6.42.1793913471840;
        Thu, 05 Nov 2026 13:17:51 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5d9sm4853366d6.10.2026.11.05.13.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:17:50 -0800 (PST)
Date: Thu, 5 Nov 2026 16:17:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH 01/19] usb: core: sysfs: take the port lock to read the
 BOS
Message-ID: <6d474d49-25b3-41db-880f-53bacf50f211@rowland.harvard.edu>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-1-b9751ddb9c7c@linuxfoundation.org>
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
In-Reply-To: <20261027-llm-usb-v1-1-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:41PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> usb_reset_and_verify_device() sets udev->bos aside, lets hub_port_init()
> read a new BOS into udev->bos, compares the two, frees the new one and
> puts the old one back. bos_descriptors_read() takes the device lock
> against that since commit 4e0197fbb0ee ("usb: core: sysfs: add lock to
> bos_descriptors_read()").
> 
> This does not cover one caller. finish_port_resume() does a reset-resume
> if the device has the quirk, if its port lost power, or if the device
> does not answer GET_STATUS after a normal resume. In an autoresume this
> runs without the device lock, for instance from
> usb_autopm_get_interface() of an interface driver. The comment above
> usb_reset_and_verify_device() says that tasks which hold the device lock
> are expected to resume the device first.
> 
> bos_descriptors_read() does not. The file is readable for everybody, so
> a reader can meet the temporary BOS of a device which is being resumed:
> while usb_get_bos_descriptor() has not set ->desc yet (NULL
> dereference), before it has corrected a wTotalLength which is larger
> than the buffer (read beyond the buffer), or when it is freed (use after
> free).
> 
> The file was made to give the descriptors to everybody without USB I/O,
> so the reader should not wake up the device. There is a lock which both
> callers of usb_reset_and_verify_device() hold, the one of the port:
> usb_reset_device() takes it around the call and usb_port_resume() for
> the whole resume. Take it in the reader too, inside the device lock,
> which is the order of usb_reset_device(). A root hub has no port and is
> never reset this way.
> 
> The port belongs to the parent hub, which removes its ports after it has
> disconnected the children. usb_disconnect() cannot finish while the file
> is being read, device_del() waits for the reader.

This is not the right way to fix the problem.  It should fixed in the 
same as commit ff33299ec8bb ("USB: core: Fix race by not overwriting 
udev->descriptor in hub_port_init()") fixed the analogous problem with 
the device descriptor.

In this case, usb_reset_and_verify_device() should allocate temporary 
storage for the new BOS descriptor, and usb_get_bos_descriptor() should 
read the updated descriptor into that new location, leaving the original 
one alone.  The address of the temporary storage should be passed as a 
new argument to usb_get_bos_descriptor() (which means also passing it as 
a new argument to hub_port_init()).  The kerneldoc for 
usb_get_bos_descriptor() should be updated much like ff33299ec8bb 
updated the kerneldoc for hub_port_init().

Alan Stern
