Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165771;
	b=cTIa/fKyDbvxpfu75oKh0ba1Q95FuhRYAJnfTuheoqbDKRNsKHGT6oDrFKizLvAjZkTV
	 D0e8+2fHh5jjKPXiMJa8szd7mxS5nHV8idw2g/fnoU3r4qh5CgpVqrgmQvC1JDvkrAHm6
	 MDOhHfEX82BwkGb2uThd7Ya7HZ0nrUknqG2OnhsNZQaTogmApkEdEopW0FjlZjWD43+I8
	 Ibjb/fcp2wiVgAPEjkAFihvetgCLZOzNDI9lTzdcNYfrsXYPJauTx5pjHF3QWmPh3kpVB
	 CZY/mMEmFiWJ8JTTsI1oYKYA22Q6Lir8OnSYHitDmvUtESTKKaLWcx5/Dlh6TqSTBig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DI5+oYzxxf+I5AkVpJRfiCXI+dYqK3qbDT75rBnUA90=;
	b=sH9/rzn0rXxI3HsVkPB9IJUO2FVVhvQMKcUa4EWuEruNH0vKJnjKJAAPSueLk0mcV71J
	 O3BNpTkcdj2jp2EmuVI9iDNMJbcUlbMd0TuXCXbjt8tXbFAY1S0Akt7tbJv5AqL1VtviZ
	 BlVg7VqZizB/+kNP1ucPLEaMf4Sp/lt3wlsEBB33VJXuMEEth+pT204pL28f0sugE9M/o
	 83/qr8kzZ8UfchGzrhbO5Yq6sEXZ6BnwmiAJM3mkGBmy8sUhvtGQlGTSIMrJJOZCHrA4Z
	 RSd7silTnk2CK71deeyEDKKnX4SfVrPr6iyrJI8xLX2NfmrA6EXkP++H4dNy5YTWkPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDCYfar6;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBF9606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBF9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDCYfar6
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1301795e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165769; x=1794770569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DI5+oYzxxf+I5AkVpJRfiCXI+dYqK3qbDT75rBnUA90=;
        b=uDCYfar6LTvsDSmd+Fo+lBbxFR2vWqrI6yXZbqkhVgCwg95kAfZmdQgvv3/xGkoFrA
         6vYDI+5qt/ahiosK5dGDX42VDeszxcMP20o1MM2zGNxCeP+E7CvFuKB7ImgvLZ44ooMT
         rHFDQT6Xq4dXg3T4Rt1Lxl1H+3cw/pBFTVGogpTNHFSIw1D6kdmWwLbGMZuT1rEbNge7
         4YJLVvFMpPeeOb4/qnZjQi7KpuzCPnWgrhvPVdeJrN+YNN8JyRMLIL1vtVf8QlpTjAE/
         zelsFdLVw+fr8+0lZst47sx1vsr0MqNwTXjVRtW5KjIvmS8Pb3oP5UT0Lpdmge72GWO7
         gpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165769; x=1794770569;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DI5+oYzxxf+I5AkVpJRfiCXI+dYqK3qbDT75rBnUA90=;
        b=XySMn/GNDpFVENVrz6r7N1P/6xa+tOIyZOcT1nINA2Fon7MMKP7p2+bRoGLVsEoXup
         1bxewEs1O/VyUrYO2KsUR94YN7xrJ9aYkiT3bVefPE9negNdGiOco7oloWB3mLWYO+Yn
         6MvzzrZfZDoJdrBLScef1gA2gZ865idogYcH3GiObMP97shZYiz+4OU6J+TROGo2t01f
         oBEytrgoQCnx3QNJWVIdpsYjz55Df6OF2vf8+ONPUecKO7nLsefCuSoSOBL+qQ0VV5bN
         3ZdRlx47seWfOLEQPGhE3VfhDvFaM8yBHquyeV2JYVskz+OY4vPqjlNGl/SGVRbcauU3
         Wucw==
X-Forwarded-Encrypted: i=1; AL+hErF9oup6NakxnS/6/o4SCbTlbSdvZiBPFLd3DP6DmaAb0KwvmfdU1oRF7DBQkpl+uasHUGpI7EBusYxGfyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Om4/KW0FttZPVEQph8/tOq1qn3PqRKW32A1KgJGfwl2WODWd
	n+ubw4jzRIrvtWDMhVbgMac0m4o6fzN4TVoVpxzP4XN4IxyWsXoXJpFL
X-Gm-Gg: AYBFou3ULW94sMVFoPNAWewSSnWKaoGL6zkiVnnzLX+44whTWzhRCwWFtfhP/N/AG5l
	7UXalVtYSIZiP0WdNyLw+QlajNJqjInUJqGDx3j9sg/7/ZMZ9u/m2On68c3co5DJyrJ2AF3SGac
	K4YUzVhA6IXYv6P1E4eDNzxBenBVZDf9kIXGr1UI+SrYvPfue01qaFT/Fk+bWu2pnM1IoWeIT9l
	drlybY2G8FJsI+OMIVtWOmzRgmiHUcU6Fqmm0KkmB+fBFOQQ56BEIuu/pPnt0ofctOwHOa/cG6d
	CyVhKyeyL4OwUHvNqkir4EeM/ke8t03QRb/1YFS9/W+DcNsBk+tRA/GQ+/bcfHJgueQM6+JkulC
	duANGPlEj0/Dv3T2T70xzMCwwV40Q/7sxq7wV73VCRWHkQR0vQfX6CiIls/lVCa1bTyI3rGdduM
	0F5uuP2MJ386i4+PI406YceLqN8Uc3W+2nkUkjARpSg1Fq6aS8iioHvlOGIdV2OeY1TbBYixuA7
	Wh3zNCHvwdc9IFIS6h+UD8k1Sh0yZIHsP8fCKOzAwggo5zCbmDoOTAxYjY22si2FI9UJ7acKsoz
	qdUGWRt75fu8ecBQCRkJY8MhFags7SNtG0iFEKwaG3dL9tkrHOvq4Sr/wAC/y3Vt
X-Received: by 2002:a05:600c:34d6:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4b963c6c2d3mr40350505e9.6.1794165769075;
        Sun, 08 Nov 2026 11:22:49 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501502asm119907165e9.2.2026.11.08.11.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:22:48 -0800 (PST)
Date: Sun, 8 Nov 2026 19:22:47 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Christoph Hellwig
 <hch@lst.de>, Jeff Layton <jlayton@kernel.org>, NeilBrown
 <neil@brown.name>, Josef Bacik <josef@toxicpanda.com>, Chris Mason
 <mason@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
Message-ID: <20261108192247.54ff3629@pumpkin>
In-Reply-To: <CAHk-=wgLpWDjmcNWphCMkKXKwuZsa8KWRPvJ4j=C_ktCL4gBzg@mail.gmail.com>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
	<CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
	<20261104-allein-bepacken-hitzig-5e517d3c129f@brauner>
	<20261105-genehm-dachrinnen-infusion-9cdf4868d32e@brauner>
	<CAHk-=wgLpWDjmcNWphCMkKXKwuZsa8KWRPvJ4j=C_ktCL4gBzg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Nov 2026 12:10:13 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Next comment:  3c7a6276d211 ("scsi: core: NUL-terminate what is
> written to the host proc files") is nasty.

I've been looking at the similar sysfs code.
Most of the 'driver' functions are passed a char[PAGE_SIZE] buffer and
use sysfs_emit() to add text.
They are expected to add the trailing '\n' - even though it is pretty
much mandatory.
There is also a lot of code that loops:
	offset += sysfs_emit_at(buf, offset, "%s, ", xxx);
and then has to go through horrid hoops to get the line terminated.

But the outer wrapper code can do it easily.
It has the buffer and length so can 'fiddle' with the end before telling
the seq_buf code how much data is in the buffer.

I managed to build a kernel where the buf parameter to sysfs_emit() is
a pointer to 'typedef struct { char c; } sysfs_buf'.
Pretty much all of the changes just changed the name of the type or
replaced printf() with sysfs_emit().
Even with just 'typdef char sysfs_buf' it would be more obvious when
sysfs_emit() was valid.

Don't look in the amdgpu driver it does:
	off = buf & (PAGE - 1);
	buf -= off;
	sysfs_emit_at(buf, off, ....)
AFAICT it has proper aligned buffers - or my build would have failed.

I did find one disk related driver that copied (probably) 512 bytes
of hex data into the buffer.
That is nasty, normal sysfs has the option of raw read/write, but they
get lost by the time you are in the dev_xxx() functions.

OTOH the outer 'attr' structure has some padding (even on 32bit)
so there is scope for some flags.
(There is one flag, but it gets set in the file permissions word
which is all rather nasty.)

Then there is some of the raw code, I didn't follow it all through
but it really looks like the user supplied length isn't checked
properly.
For sub 4k buffers using the same code paths as text might make sense.

There is also the pre-alloc code added for some entries to avoid kmalloc()
during reads by allocating a buffer during open.
Looking carefully the normal buffer is allocated during the first read
but not freed until close - so it wouldn't be very different to just
allocate it a little earlier, removing some other little-used code paths.

David
