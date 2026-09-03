Received: from audible.transient.net (audible.transient.net [24.143.126.66])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0BED34FDE73
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.143.126.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464870; cv=none; b=Zv0r9HYk0P0741+GY+E9D3HC8gJRDuZCOAk5Mrwie69dchDj/3UYye9+uir90qM8jErWL4hZRfvq9ibe/LyA1B63WSXe8RLISl3j3drtviQ4+PRpG+aZ8jGET+BRzJ5Lcj2bOtJVMUFr8uTNsSf2fL0DFugv/zW3kF0Xm0PBFCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464870; c=relaxed/simple;
	bh=ZLfdQzZx94/zTxf9CzwKTICJJZy0Ai/0I+JqJ+gQmQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fn78+UuzySE/dbKU8zxKhSBE/QUUOn4Dx3KIZ+9FH/XpBvdCgyUcTjfhXY1SD9UvPijmUkh9XnHjU7V192/KP/Qm40IjXtuvRx0eJonstMxASrXVRld9AS/Pn3kyBjYjYkd6ib5lERo2m9DqMr+eJEowTU5DLIw7DJp9EFlob+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=audible.transient.net; spf=pass smtp.mailfrom=audible.transient.net; arc=none smtp.client-ip=24.143.126.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=audible.transient.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=audible.transient.net
Received: (qmail 15191 invoked from network); 3 Sep 2026 19:40:55 -0000
Received: from stink-foot.audible.transient.net (192.168.2.99)
  by canarsie.audible.transient.net with QMQP; 3 Sep 2026 19:40:55 -0000
Received: (nullmailer pid 3627 invoked by uid 1000);
	Thu, 03 Sep 2026 19:40:55 -0000
Date: Thu, 3 Sep 2026 19:40:54 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, dakr@kernel.org
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, lyude@redhat.com
Subject: trapped reads in 7.3-rc1 since nv50 instmem handling change
Message-ID: <apnNRjrFPD48m4hO@audible.transient.net>
Mail-Followup-To: dri-devel@lists.freedesktop.org, airlied@gmail.com,
	dakr@kernel.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lyude@redhat.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On my workstation with a Quadro NVS 290 running 7.3-rc1 I'm seeing
this sort of thing show up spuriously:

kernel: nouveau 0000:01:00.0: fb: trapped read at 0100ef56e0 on channel -1 [0fee0000 unknown] engine 06 [BAR] client 08 [PFIFO_READ] subclient 01 [IN] reason 00000002 [PAGE_NOT_PRESENT]
kernel: nouveau 0000:01:00.0: fb: trapped read at 0100f85788 on channel -1 [0fee0000 unknown] engine 06 [BAR] client 08 [PFIFO_READ] subclient 01 [IN] reason 00000002 [PAGE_NOT_PRESENT]
(repeated 16 times)

I bisected it back to 34e27b90552a (nouveau/instmem: use iomapping
interface for instmem handling).  The rest of the salient dmesg during
initialization is:

kernel: nouveau 0000:01:00.0: NVIDIA G86 (086f00a2)
kernel: nouveau 0000:01:00.0: bios: version 60.86.6c.00.21
kernel: nouveau 0000:01:00.0: vgaarb: deactivate vga console
kernel: Console: switching to colour dummy device 80x25
kernel: nouveau 0000:01:00.0: bios: M0203T not found
kernel: nouveau 0000:01:00.0: bios: M0203E not matched!
kernel: nouveau 0000:01:00.0: fb: 256 MiB DDR2
kernel: nouveau 0000:01:00.0: drm: VRAM: 256 MiB
kernel: nouveau 0000:01:00.0: drm: GART: 1048576 MiB
kernel: nouveau 0000:01:00.0: drm: TMDS table version 2.0
kernel: nouveau 0000:01:00.0: drm: MM: using CRYPT for buffer copies
kernel: [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on minor 0
kernel: Console: switching to colour frame buffer device 240x75
kernel: nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device

It doesn't always happen at boot, sometimes it takes a while to show
up as it seems to be related to how much I have going on at any point
in time.  That commit reverts cleanly for the moment, but I'm happy to
test any ideas or enable further debugging as needed, assuming this
wasn't intentional.

-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
