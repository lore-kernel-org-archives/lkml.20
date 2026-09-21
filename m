Received: from audible.transient.net (audible.transient.net [24.143.126.66])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B9DF53EC805
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.143.126.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975771; cv=none; b=TBmaa9TOuPzKwYp/DgbtbM1RwZeltkts+R1nfORlRnhMabr6mgOrDUjzyONRgrS/x1hcljwPjLYl7dNmwmbeVYunXGMLT8f566BDFriMzw7A4+TEP+QCeB6H6qnYJT4EmXmSXPpICQ4zNkuA8tfHjldSFXP3Lid+4m2Agi5WUv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975771; c=relaxed/simple;
	bh=yrXyB4kDn5Z6TIZzfXYdW5iNooIY+mENdByYRbozaqA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCS+vi8YAeby1uJLC7PmqItLkYtEbqes1k9FW8JYfHB7QrhfZgxJMMbERQv9zhZDpFfE5PWkQMZb8g4cQJciLWkK7ux57sdLLiPF02Pr4QJjG0G/eaKzjseVLP4W3f+ecp2YEjIabtoH0bp81cO7s2WK+TtK/BQ5oYDP1HvKo6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=audible.transient.net; spf=pass smtp.mailfrom=audible.transient.net; arc=none smtp.client-ip=24.143.126.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=audible.transient.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=audible.transient.net
Received: (qmail 22312 invoked from network); 21 Sep 2026 07:22:05 -0000
Received: from stink-foot.audible.transient.net (192.168.2.99)
  by canarsie.audible.transient.net with QMQP; 21 Sep 2026 07:22:05 -0000
Received: (nullmailer pid 6931 invoked by uid 1000);
	Mon, 21 Sep 2026 07:22:05 -0000
Date: Mon, 21 Sep 2026 07:22:05 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, dakr@kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, lyude@redhat.com
Subject: Re: trapped reads in 7.3-rc1 since nv50 instmem handling change
Message-ID: <arDbHfeXuHDCKQNS@audible.transient.net>
Mail-Followup-To: dri-devel@lists.freedesktop.org, airlied@gmail.com,
	dakr@kernel.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lyude@redhat.com
References: <apnNRjrFPD48m4hO@audible.transient.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apnNRjrFPD48m4hO@audible.transient.net>

Jamie Heilman wrote:
> On my workstation with a Quadro NVS 290 running 7.3-rc1 I'm seeing
> this sort of thing show up spuriously:
> 
> kernel: nouveau 0000:01:00.0: fb: trapped read at 0100ef56e0 on channel -1 [0fee0000 unknown] engine 06 [BAR] client 08 [PFIFO_READ] subclient 01 [IN] reason 00000002 [PAGE_NOT_PRESENT]
> kernel: nouveau 0000:01:00.0: fb: trapped read at 0100f85788 on channel -1 [0fee0000 unknown] engine 06 [BAR] client 08 [PFIFO_READ] subclient 01 [IN] reason 00000002 [PAGE_NOT_PRESENT]
> (repeated 16 times)
> 
> I bisected it back to 34e27b90552a (nouveau/instmem: use iomapping
> interface for instmem handling).  The rest of the salient dmesg during
> initialization is:
> 
> kernel: nouveau 0000:01:00.0: NVIDIA G86 (086f00a2)
> kernel: nouveau 0000:01:00.0: bios: version 60.86.6c.00.21
> kernel: nouveau 0000:01:00.0: vgaarb: deactivate vga console
> kernel: Console: switching to colour dummy device 80x25
> kernel: nouveau 0000:01:00.0: bios: M0203T not found
> kernel: nouveau 0000:01:00.0: bios: M0203E not matched!
> kernel: nouveau 0000:01:00.0: fb: 256 MiB DDR2
> kernel: nouveau 0000:01:00.0: drm: VRAM: 256 MiB
> kernel: nouveau 0000:01:00.0: drm: GART: 1048576 MiB
> kernel: nouveau 0000:01:00.0: drm: TMDS table version 2.0
> kernel: nouveau 0000:01:00.0: drm: MM: using CRYPT for buffer copies
> kernel: [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on minor 0
> kernel: Console: switching to colour frame buffer device 240x75
> kernel: nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
> 
> It doesn't always happen at boot, sometimes it takes a while to show
> up as it seems to be related to how much I have going on at any point
> in time.  That commit reverts cleanly for the moment, but I'm happy to
> test any ideas or enable further debugging as needed, assuming this
> wasn't intentional.

This is still present after deced5fa01c5 ("nouveau/instmem: handle
iomapping already existing") and in 7.3-rc4.  Apart from the log spam
(which has made journald angry once by flooding the buffer) it doesn't
seem to have any other serious consequences yet though.

-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
