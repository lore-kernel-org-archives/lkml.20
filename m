Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235796;
	b=nRp9CQKef0/7bXy0bGP16e9rRsPrvWppxa+akhvReZcFUJRoMjlEDyTkypLeJJdFbaEU
	 6Cv70ywgvB2e445I+8pigjSxGP8CpYjI+xWNDT4FpI8Fovouaybp3Px/pju5JVCCnTTwl
	 dDhRuSgyd1OtpwsGicqLtzfKYUIMhcefDZ3WrWkhFpxcKcJgDA8uiYvh3SF0lKiDBHWaq
	 zwwbtR25+n2Nh4kXPVerEfce8/Py5On0yCjXcnvu5MA9xVMMUe16yRZjrvzpWWABwP3dZ
	 ER7lymCrvGI/c0hFBLwDLQORmsb2kQPOk3Vl/7kbNU57SLafY5SGecG73GFXm+MfQRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4RSmtcwNoe4fGrMvwANPOQwGQ5KlD1ttYfRV5b0y9d8=;
	b=QDW/fgYqeEtDrjuH1f6npreZHqM9jcq6dNUslh8aLF+8fBa5IzY/USbbcPLB4JoCJj1y
	 OqCee+Rd2S5Ei4+AQKyWDzxhAKZJlYF9uq3l0cPJDWdkxXledI0599DIoyT59+bP8p0E5
	 H4kW5maHVjVXxtb/33lZvLnmuitQlWb5n5i5vkxDSMjqHKNh4bspPq+gqeEwUo/BaGLky
	 MLigpzPTEJzcu2m6GguaPvBOmLguoTx58qEgpw0Y1sicuJgsaUeuTWwAPwNur8yJti/8D
	 iH80Uiv49DBg26CxQbEs1hDwF4hvYCsDUTliNJQdOM/cpvYFOcp0V7HcTzJknl/YIFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oKQpSjyp;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B523606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B523606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oKQpSjyp
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53394bffe0fso10143791cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794235795; x=1794840595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4RSmtcwNoe4fGrMvwANPOQwGQ5KlD1ttYfRV5b0y9d8=;
        b=oKQpSjypJV/8BYimCUbLH/doWtwNr2rzEx+IZmgBxwGsp+wz24vzDEwUf7iSUD3qaF
         wN7nu5QreOwFpRBsrxAUfaVDwa44a0HXl5Q/l7Bp8LPEd9h4z+Olpjm+ExUOe6Gcl/A+
         tboUQG1VNVwmnu3dNnuxeX+CH5YL0grbY+79fh32g4rlI+XOgySVLsjAyY2mN9z2l8vI
         aZ9TxRJeRf9z4+ZEAJoOTGh6D9cVuvWTpfIBKUz1KTj4N0w4Lfe5k+8nefwMUOrunz0N
         r47XGgW1pVlYjC8lgpJ4oXfFTY3Cq0tCqsYCWf6J1n4snk6fquYK+ivMFCTQltIN5XQb
         GBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235795; x=1794840595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RSmtcwNoe4fGrMvwANPOQwGQ5KlD1ttYfRV5b0y9d8=;
        b=mdbofnkdFkgKcJ4WzxL4AgFElziarT55VQKkR/TnwZ+0TH1DZr+Dgnq/o/0h6GVON8
         D4OSpcGUOeq1ZaQCtbTwdJFfUOPrzqFOH/OQSmOgpRTplwJQqaaMNj7I/BQ8v+1M0nNi
         r5S4ZmYc2f0dyatV9WaRpBmPxWU6iJm3Mtzy2mCVetcfZrZHQpGNBHfiV8VGyWqSTL2R
         LT/rD3KlY8lNSbhPslzvrPgANrE/V6tGQeKsSRQOB0VdA5zd00qyVMSR08tANYTHdC1G
         6E39NeO2CSOlFSZKkTeTVnvHWZcrnzMBlNEL39GqFAVuo46GASqCbdX1VAwn/0u3+fO7
         qgGw==
X-Forwarded-Encrypted: i=1; AL+hErGw+ztuhoWORLelTeRznVPIDa8UuSw93BIssqjnwQPhXkdlpOYJ7tgy2X6p6tKIACstMgRRzkBqdjqWmr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F+8Wm0EoZ4zgiswiNOdjrv4R3A5x7GoXXAN0NOd4YK56G7k9D
	mK3YKFOMLuXFccvnLt+vLpsbxEynNRUuehuCxe9w9zdGAsym/w3bWCYQnDpjWi8DYt4=
X-Gm-Gg: AYBFou1nLWG4RbnPUodTc8YAtbN88iE+WyIruTnMB5d5Nji9WlSw+vaLb4Pw9FkLPaA
	EN/6xYol0iWY+5JLmKsMi4AsFZh44DuiznpWA/C2gEx92KBGl3ygzDev1fQhJ0VCep9YQ2/HaJd
	OIFepp77QbYDjtp+tWvhO3QX3yQYmU2cy8UUksWVEW8wRZMn0515NVfCKALNE1tWBy84Nke41iq
	FFjhaoi10kUA9y1JYVMztigi8yhA4MA/3EkDKEdCPcCBpvanehrgFXwy27ZgLmm5koLtGhb6vKe
	68GvP4JUgmT79xQuoJbe3Uowecl2ZNCdsvR+jXlwcyWWguYiuq7MhCkQcd1WqBT4VuNv311SjAH
	fLcYakaf4GOwfBgSvhOmVaAgjQH0HnqEQYU0NO+NN+wZDkQRFjGgfM2Oi9mD6IYOizX/snCTUFc
	tjCB/CAsrD6/3BFMFChXCDzYYraf9DqAHlKCz+u/r+y+5AFsrFYv8vaaHHfqReT1VVK/eLgixwi
	GbkQLa61w2VA0NSmJjpaJsToO7dEof072D8tny4SvGIVYEI/aYpMlvN1di1/CyQ7FCB+ig+spI7
	ZWEFabIF3L94jkbiZlVCwZhsyUqiFAdPbwIXan57owPxqrkjrafzPKR/sZv2m+06EB/eBrXrbg6
	jfVnTmopOUA==
X-Received: by 2002:ac8:5fc5:0:b0:535:1740:d334 with SMTP id d75a77b69052e-552a21effafmr59868371cf.3.1794235795175;
        Mon, 09 Nov 2026 06:49:55 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5525e68a565sm42604271cf.0.2026.11.09.06.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:49:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQQgz-00000001QsI-2Q0x;
	Mon, 09 Nov 2026 10:49:53 -0400
Date: Mon, 9 Nov 2026 10:49:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Yuho Choi <oss.patchbox@gmail.com>, Eric Farman <farman@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] vfio/ccw: Flush notoper_work before returning from
 reset
Message-ID: <20261109144953.GN663069@ziepe.ca>
References: <20261106191029.469837-2-oss.patchbox@gmail.com>
 <4cb58287-4273-4518-8cac-aa3056dc28e2@linux.ibm.com>
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
In-Reply-To: <4cb58287-4273-4518-8cac-aa3056dc28e2@linux.ibm.com>

On Mon, Nov 09, 2026 at 01:38:44PM +0100, Christian Borntraeger wrote:
> Am 06.11.26 um 20:10 schrieb Yuho Choi:
> > vfio_ccw_dma_unmap() is the DMA invalidation callback, which must unpin
> > the pages covering the range before it returns.  It calls
> > vfio_ccw_mdev_reset(), which raises a CLOSE event.
> > 
> > On the normal path fsm_close() calls cp_free() itself, so the pages are
> > unpinned synchronously.  But if the subchannel cannot be disabled or
> > quiesced, fsm_close() falls through to a NOT_OPER event.  Since commit
> > 0c11f61a876e ("s390/vfio_ccw: Move cp cleanup out of not operational"),
> > fsm_notoper() only queues notoper_work, which is where cp_free() then
> > runs.  That commit flushes the work in vfio_ccw_mdev_close_device() and
> > vfio_ccw_mdev_release_dev(), but nothing waits for it on the reset
> > path, so the callback returns with the pages still pinned.
> > 
> > Because notoper_work runs asynchronously, vfio_dma_do_unmap() can exhaust
> > its 10 retries before cp_free() completes, hitting BUG_ON(++retries > 10)
> > and taking the host down.  A further CLOSE cannot help either, as both
> > CLOSE and OPEN are fsm_nop in the NOT_OPER state.
> 
> Does the the iommufd backend have the same problem?
> iopt_unmap_iova_range() keeps calling the unmap callback and gives up with
> WARN_ON(tries > 100) and -EDEADLOCK. So that path is also fixed, I
> guess.

Drivers are not allowed to refuse the shootdown, it is broken if
someone has done this.

Jason
