Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE66442392
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251293; cv=none; b=k1xJ9tzAEIqEWWeG5SU6KQVMxU4Luhe5VDVfEK9afH1be2ydgypG5T1j6FWQLbU4lOpMc43uzSNRLecftIm0WEo1GSqXigC6ig1L2hWJvTKLhiSAb8qCYWtG1f4qXdwdxuH9uFWx8R11OdwxJ+SJrGBXVfTaIxwnMlswiHViYxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251293; c=relaxed/simple;
	bh=8hx4lWUeNsl6WuKb5D+JS28TM0IqYc7QKB2TLo9n1Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=US0qb6p6+XGV2z2BX1W748M4Y7RVNe/o0JsuHFZKJLiRPMW7LO4tm9TbzufvIH/coVDeIp2hwP0rl1zn8xNJtJqNKGaHo1G664Gptn/0e0WdLtqlvkGjLmEmBDQrmNuMbK3rKpPgGrowcb70jYdtJ7dzG/yxf9okpaXV4i4oaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FBuCIVFX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FBuCIVFX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso34874925e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788251290; x=1788856090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVfvd1UCarSJibTs2Zkpk5X8/zVFhGRdvXygnFF/0tI=;
        b=FBuCIVFX5bibuvQUxwz2FA8ozSPuAVeQEv/XzhNF+bRdn/ViHf/q+q11E8ogwnnfIe
         1ifKOr7mQbUhd3UFHnS2uJAB0lwRYeJvALh3Z1vwebu+fSmQ9QA7FFfaLsTvuHgMO40X
         XImps/P+RyiE89pTuEIcljNOBzCOHhgmOqiVdR7Ow3IHZOzHZSuT/BHa9XXoc4eBbbvS
         3AXAr8HqoQGXJ1xfp8/PriUufNeUOpRQxkF1e/6xFS7I3xAl52gVNx1ZYaiDGre2ijoQ
         JLXPf0vs5RJ/yYLVRGny9cgEBdrpfgKOgSrarfjEe+tKfAGQaP6vFgdx9f+mvUyqnErr
         YgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251290; x=1788856090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVfvd1UCarSJibTs2Zkpk5X8/zVFhGRdvXygnFF/0tI=;
        b=S077kmbVVaRalNLEpG4GlgxkBLfm6ZGHB7x0r+KyzVnjSNQfFACalqH41KM1Q5ypgO
         D0cMyIi+RCnqvOPzLQd5BEK8uck47EwaMBpCeFnagLcYe7u7psogZpiokcn/cgKarV1F
         S8mnBdc9UaCzXG3Kvjza1f8LyiqY/L+1KKjBK3RaauscdW8i2hVljKu7p+75hxK/M01G
         o8k3i7lWKfXR3rB9iEwnsFzLu7Lg2gey6KLJMenwwi+1iG+J2UGdsJdsq/OzF8+LlCyx
         fMU6DGYuzJnqM/3daGFXHUo0bca5tuyd4+zg4HiHv+3IBwAx6vf8QyRbay22UrwMFg0w
         hnFg==
X-Forwarded-Encrypted: i=1; AHgh+RrMm6+Cn/HX0xuI8bSASl7K/sGeeayxC13w4JT26SZ5UwjGKM0MqnVK932JZoxF8QnPw4Z3fvvv+TWiofE=@vger.kernel.org
X-Gm-Message-State: AFuF++nFtK1ip/1Yo+ICf375Dqq2HVhxS0XgHRVMpvyWYjuYrcwqIfym
	yZEZ6dXEjGwbf7AD6K3jixjOd2a3Ri6xIKRKFY3jImKAHEFdFyePBy3sslcLpOgDEMo=
X-Gm-Gg: AR+sD115wsOftZWLr78EbZzT32nqrcvc1DRVjTgtrvvHp77HWxzo0LK1Acq59mSVms5
	7IZ6DH/rxaVokvqi7gjzfCJW2o2l76Kmg6WuarhDaTvLlNkxKKH2rOA9dnM4UO5Pwr9I8keZW0X
	BniGnpZqbrG6k7fCOTXgffqGGF7PXTMpnWHprje6CMrzX4tJRmAopsrCUHpVgu6th/OSRRFoV0x
	oq57M3B60nh+5HgpKwXGM95hykokXVCvtwxfEorhjOnlsxGPHObpTjUZ0lCZRVRSfgOqIrtgxH8
	jI42aBbAlqhb/GPNSBLDLz2ZBrb2cwISGDkc0uWYsbcvM7+Rcl96Ik9cN6Dqmz4QdBZIeKcyR7/
	HaUjQEQZG+ygve4rW9WjboK9/jBij1hngpd/gCrRJ/D7CHHHLXyQ/jcOqUsBdDlKyeBqA/lBfbA
	OyvMkquQDy8+jhrc5L8VLy1pKQGgaPZ+snRje8vb5LmNwo+wQCodA/A8BC1RvraaauOUrud2YCY
	oZOrPCvNbn5Y8sv/Ti8WQu1q+f+rUgWKmg1Kqpp
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr437716855e9.12.1788251289880;
        Tue, 01 Sep 2026 01:28:09 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f5:3c01:dee6:bd49:2b83:2f74? ([2001:a61:13f5:3c01:dee6:bd49:2b83:2f74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0d936sm47212295e9.6.2026.09.01.01.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:28:09 -0700 (PDT)
Message-ID: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
Date: Tue, 1 Sep 2026 10:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in
 endpoint
To: Julian Oes <julian@oes.ch>, Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901034949.118739-1-julian@oes.ch>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260901034949.118739-1-julian@oes.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.09.26 05:49, Julian Oes wrote:
> A USB serial port can go permanently silent when its bulk-in endpoint is
> halted: the read URBs complete with -EPIPE, which the generic read
> callback has always treated as fatal, and no further data arrives until
> user space closes and reopens the tty.

But why do you get a port stalling?
It seems your hardware is quite broken.

[..]
> Use a dedicated work item rather than the existing per-port work. The
> latter is scheduled from every write completion and must not be
> cancelled on close, as the line discipline depends on it. Stall
> recovery resubmits the read URBs and must therefore be cancelled
> wherever the reads are stopped, that is, on close, suspend and
> disconnect.

Well, I am sorry, but no.

Your conceptual mistake is seeing the recovery from stall
as an indivisible process. It is not, as it has two parts.
Once your port is in a stall, you should send the feature
request to unblock the halt. There is no reason to cancel the
feature request if you close a port. You just need to refrain
from resubmitting the read URB.
In fact, if you were to be really comprehensive you need
to wait for the result of a feature request on the way
when you reopen a port.

> @@ -128,8 +144,16 @@ void usb_serial_generic_close(struct usb_serial_port *port)
>   		spin_unlock_irqrestore(&port->lock, flags);
>   	}
>   	if (port->bulk_in_size) {
> -		for (i = 0; i < ARRAY_SIZE(port->read_urbs); ++i)
> -			usb_kill_urb(port->read_urbs[i]);
> +		usb_serial_generic_kill_read_urbs(port);
> +		/*
> +		 * The read URBs are dead now so no further stall can be
> +		 * reported, but stall recovery may already be running and may
> +		 * have resubmitted them. Wait for it to finish before killing
> +		 * the URBs for good.
> +		 */
> +		cancel_delayed_work_sync(&port->stall_work);
> +		usb_serial_generic_kill_read_urbs(port);

And that is a race condition. Rekilling does not help reliably.
If your timing is unlucky enough any subsequent operation can be a nop.
A correct sequence would be something like

poison URBs -> cancel the works -> unpoison the URBs

	Regards
		Oliver

