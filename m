Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110327;
	b=2AKrOm8MOLjfsAbBnDBpXd/LH1NzHKpLgPE9s/fLdyWvnvtMXx/uOkXJYsxYdUTqkGQz
	 XIgO1R4Tsrbz3zK0kJoaKmXi2B6ioY0KIp7Mf2yEPHiqZWwvCtzWIhc5Avw0/JqYix/cd
	 TDLvLO4rR2My2TNdxFrf7zjFYje8rGrpUWc0Bs5tjAcPRz69mysKYS7CQcZc1pD8n/3hP
	 EbFyRW7cP08zyjNALP2M0CJjFK75vj3kdAds7gZ3faINIvZkhjfT0VTEqxak3fE7ZFChc
	 zFYo+ajgru3/ZE6zq4E6ZNEVP1qP29MIfLl/DD1uL93uaSEpVUwkioZeMt7jo3Q8QNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110327;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=akoXbAN8FKSRzdYW3/gw5wVBq0x50GTrXIIzaJJLulM=;
	b=gHzgV4GlJSH+ACyG04j+BYWpSnS1awTHHyX4RMptvkUnmcKnDQqBk4qlXb5ihP/ACO7z
	 pYKQ/5jBpIhrXbDaKEqA4E70W/9fzt12L5/k8vCGvph+XAxFHGHblU3NI6crDSxqhmtRm
	 JBJCs+gZiBFSpSZFADwmxFGnKU3nvX93FGdjnBXAQuA3x8hVVDDzmcb71VFQKlw7+pYoJ
	 Z+AXQltVN9TkhHG695aYmRj7wWkn4pV3PzB5ZkbaFqg0PeNGgVvX4GGAxra5bYlkMnI5x
	 BXWGVhI5bHcJf4Tim2f3vbYq5jM6+yEuzIV/A7yStPEThqH70mlrbfaPZtb3g5LpwIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JTOoDWH6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5226606A31A;
	Tue, 27 Oct 2026 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JTOoDWH6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAE41F01825;
	Tue, 27 Oct 2026 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793110326;
	bh=akoXbAN8FKSRzdYW3/gw5wVBq0x50GTrXIIzaJJLulM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JTOoDWH6SzIpvsKIcOdMxJGqFPvbvKZtjVonlzHX3pEjZuku/BIh774YiCFF5+7pG
	 L2WqAv8WhYcOTCJLhqltH0+bipTKGML2UWWix8MjmZqrOk9bKug7LLbDF8+bAdbMxG
	 B6PG4iP0RD1rsryMSvhY6/qsQ4Rd5w+hQBy4sM7Y=
Date: Tue, 27 Oct 2026 15:12:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: usb: devio: usbdev_release() has no barrier against an in-flight
 async_completed() callback (use-after-free window on  struct
 usb_dev_state)gregkh@linuxfoundation.org
Message-ID: <2026102727-data-sequel-ce41@gregkh>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>

On Tue, Oct 27, 2026 at 08:35:55PM +0800, 徐晗翔 wrote:
> usbdev_release() ends with an unconditional kfree(ps) while an
> async_completed() callback that has already moved its async request to
> the completed list can still be running inside the lock-dropped window
> of cancel_bulk_urbs() -- when the two overlap, the callback re-locks,
> rescans the pending list and wakes the wait queue of freed memory.
> The interleaving itself is proven reachable on a pristine Linux 7.3
> (600/600 controlled window openings, with usbdev_release() entering
> the window 445 microseconds after it opened); in the HCD shape I
> tested (xHCI, single MSI, HCD_BH), the kfree() is nevertheless held
> back by an indirect barrier -- usb_kill_urb() on the sibling URB waits
> for a giveback that shares the same per-CPU BH worker with the
> stalled callback -- so I am reporting this as a structurally proven
> window whose final reachability depends on the HCD's completion
> topology, with the open shapes listed below, not as an
> immediately-triggerable crash.

Cool, can you send a patch to resolve this as you obviously have a
reproducer?  Same tool that made the reproducer can make a working patch
and test it out.

thanks,

greg k-h
