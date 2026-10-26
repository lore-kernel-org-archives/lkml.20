Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028118;
	b=hQSaCYIISB3SUMihZOj+35Z0Nt3V64K0HlL8+1J6Mn8TuWnvnNMtNc4fTBPV7lARBkX5
	 VVm4k5jxxmGGHNCTNamiRMO+YgxXs1aQs+S+PU7+BwWNLGho2YrbITkLPevYuXpmWxfCT
	 F7+kFmESHfoQJmtSXr167SPdkxbBqlmouItfOITfg+xYOh3h+n6EivfJcXM9x6TtloNCg
	 AovxYIW/F2SSy4ZdZsw5dB03U/PIz7horm6/BBBB88zYipuLoVDG1QT56+umReXIM5Zsa
	 eQIxflMNsf0D0t1z6rnHkk5ZGlkpUH6nygROd5O60GQCNuCXCRY4wk56WfLbXVj1KJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028118;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=GufoAbBLk6Ghtl7Jz0h33C6x4w2eCg5HBPMB/M3XR4E=;
	b=byiCwEVNuJEvUcayTgYmobAum8ETBXEVF/EBXyjyy8j+KybYJ3/ZXPHKc3cWhcfGx3qM
	 FYCa/1QXhBOfoq8VxfAJHX29Y79QiONNv2bLxQgqK/VUowWAUG6XIHEjjwYukYuRxOl90
	 E5qYLaP7QZSgqyq1OqSORLH5kXo0L0262EDcNoqwf8rEyL9y1xfwyOx1Sd3yjJwNY39W/
	 Z58s/kxBVnf6cIw52AMQCFP+5f/PGnF6f8OgJ44oa8VtQiygUAAFZcf2n03vPhdV+eDL1
	 zODy1VEb/++walY5g72FCFDwNLNnpaAOtwwDK0jL35SAquH4Ozm8z9qEO2cFIWVEUew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJyiyWpk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D5C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJyiyWpk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23551F01825;
	Mon, 26 Oct 2026 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793028117;
	bh=GufoAbBLk6Ghtl7Jz0h33C6x4w2eCg5HBPMB/M3XR4E=;
	h=Date:From:To:Cc:Subject;
	b=DJyiyWpkn2j9monPW6tOtScnxmT9B5i999ufH7CUChPKep8WZ0BKUYwXoI9fVOjwM
	 wBdMHIzZWDGsjiNuIj7Lqt8v49TC8nZZz6D9T5IenVtR+tQojLo1uI/LXN2fVb/1qD
	 KccV6bROMQ+cHJ2N7A+XbHn+dtHmOro31RfT8D+awqtPueaEgckmqSEyqxIAP7u+eV
	 PX90kRbea2ODLoglWnROd0S/Am7/yETTwEEJAOWf0u/q8XaFRpO9YfoQbmW2K/P2Cp
	 xZ6drkOMfLfzEPzTT/YNkn+mrkcOCq9KicXyYfSEq/sbpuGSbQZx7VyUs+j698GtW+
	 4uIfwjn3RH4jQ==
Date: Mon, 26 Oct 2026 15:21:54 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Daniel Thompson <danielt@kernel.org>
Subject: [GIT PULL] Backlight for v7.4
Message-ID: <20261026152154.GE2195460@google.com>
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

Good afternoon Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git backlight-next-7.4

for you to fetch changes up to eacfbe6f9716d00536edc229a58895405e73c2e4:

  backlight: qcom-wled: Read back the programmed brightness at probe (2026-10-14 13:30:50 +0100)

----------------------------------------------------------------
Backlight for v7.4

- Improvements & Fixes
  - Qualcomm WLED: Fix a NULL pointer dereference in `wled_remove()` by setting platform
    driver data in `wled_probe()`
  - Qualcomm WLED: Fix the WLED3 brightness register stride to prevent consecutive string
    writes from overlapping
  - Qualcomm WLED: Read back the hardware-programmed brightness at probe, expose it via
    `get_brightness()`, and prevent unbalanced OVP IRQ enabling
  - TI LM3630A: Cancel delayed work synchronously after freeing the IRQ and before
    destroying the workqueue in `lm3630a_remove()`

- Cleanups & Refactoring
  - Ilitek ILI9320 / Kinetic KTD253: Fix spelling typos in comments

----------------------------------------------------------------
David Heidelberg (4):
      backlight: qcom-wled: Fix NULL pointer dereference in wled_remove()
      backlight: qcom-wled: Fix WLED3 brightness register stride
      backlight: qcom-wled: Fix unbalanced OVP IRQ enable at probe
      backlight: qcom-wled: Read back the programmed brightness at probe

Hemanth Selam (1):
      backlight: ili9320/ktd253: Fix typos in comments

Myeonghun Pak (1):
      backlight: lm3630a: Cancel delayed work before destroying workqueue

 drivers/video/backlight/ili9320.c          |  2 +-
 drivers/video/backlight/ktd253-backlight.c |  2 +-
 drivers/video/backlight/lm3630a_bl.c       |  1 +
 drivers/video/backlight/qcom-wled.c        | 99 ++++++++++++++++++++++++------
 4 files changed, 84 insertions(+), 20 deletions(-)

-- 
Lee Jones
