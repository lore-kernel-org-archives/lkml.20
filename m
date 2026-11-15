Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745790;
	b=TzKntfH5W9MR2dmvOu4PDh4Yfi2CVm26fLh1ChnOvQBhNyzhV5T0qzTXmCa24aV+GiRa
	 fTtyvmbXw+hY5HMgVFPs4x2QOdFUQPk9Fsl6Dr/o4P/yb/O3FhF22cmHpGsfW8gd7PEbW
	 UbdlxiLlwjoHEeHXiWrRIThEpyszzS65O8RUiyLp/TmAQxADLAP+FucY/QJGP+E2Z/nr+
	 PCt3TwELT43KOACNYFrDpC5nMh609Ur21DWO2vBQ+DPU8TTtHfH4Pm/bjvzn/RVrh6A69
	 Iz2ktBi5JA7E9pXdn80EkvPZlNopWotbbru+SJD/MOzmxanIKXQVaBqCiPuY/eK3O0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745790;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=mE1ReHqAepLbTrPaYJdE+Rdl5/le41qTZkMqekA7MC4=;
	b=OatC2wHJUzgq3iKDug8H5pDoN8UbpLHcAt83lQuegxEjV2kBYtm7wZWEi5tCM00rLauj
	 lSSaaPKmPXtcURGXfe/FDzhGqURxojDInMRwMVCo0DktY474uLZsTRP+Vq9YjqcY4lWVa
	 8o4JXy6mPJ8DJD1F2XVklMpIS4Ft662xKTpYrH8MwiQ0/Ae/7Bd/KszBSoZuDA0BLCH4o
	 mD4HelALEdpd5Chb1sPcwqCYWOQ3tA8CK/Qtbi9Ig8Xc41RsTcQVbAloz2K75NlDkGLws
	 gu9njGR73p2/dzIn//DPYtBd7ph9aa25h7UX0SibeCi9wd92/EJ9803wkNXgiCoc2sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkTXGIcX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B731606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkTXGIcX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681AB1F000C4;
	Sun, 15 Nov 2026 12:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794745789;
	bh=mE1ReHqAepLbTrPaYJdE+Rdl5/le41qTZkMqekA7MC4=;
	h=Date:From:To:Cc:Subject;
	b=bkTXGIcXvwrX4LcdKzHzGcPkqtQdtzsyCLzDopzQ4q0hYSKDnGnVkfRD1n23WL/XY
	 xoJdakADrG9D8jpmbP7vxJqIPj89JV3x0j+LC6hDgAU6IXBYfktYOxcvoV7fxw755N
	 5hD8zPgG9jZ4xiu2b+652d8Y2jS/ScdJbjtta+h/769McYZIS/D5dR39Ub7a0b0inQ
	 lEm1zTRMpMMxmcDRgYJZ7qmWGcxK4rjUcMeb4CxBt2nn4D0+vt4tbJQSddqjMhCC5R
	 bQThpqnQm5q9el3IVJDJrtjB+LZgDWOPPILQZOX0wRM9wTiNgm29e9JBIBVd4VWfIY
	 KZvYgTF2AunHQ==
Date: Sun, 15 Nov 2026 13:29:46 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fixes
Message-ID: <avmlusPLXMDbcBfq@gmail.com>
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

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-15

for you to fetch changes up to 0dc2a4dac3d04e9e4479aeb0b46172feab1cca0a:

x86 fixes:

 - Don't print reset reason in VMs, to fix Xen PV domU boot regression
   on AMD Zen CPUs (Jason Andryuk)

 - Preserve the default VGA fallback for legacy modes, to fix
   regression where a SeaBIOS QEMU guest with bochs and VKMS the
   boot VGA (bochs) loses its DRM boot_display attribute (Hengyu Liang)

 - Ensure write visibility during LDT installation (Dave Hansen)

 Thanks,

	Ingo

------------------>
Dave Hansen (1):
      x86/mm: Ensure write visibility during LDT installation

Hengyu Liang (1):
      x86/video: Preserve the default VGA fallback for legacy modes

Jason Andryuk (1):
      x86/CPU/AMD: Don't print reset reason in VMs


 arch/x86/kernel/cpu/amd.c     |  3 ++-
 arch/x86/kernel/ldt.c         | 12 +++++++++---
 arch/x86/video/video-common.c |  2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)
