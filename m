Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A293A16BA;
	Wed,  2 Sep 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342903; cv=none; b=s58NW9Ka6w8XS0SOfl2qWyWEY+M5UEYoOPmUYzfiEgAxe2bPuWy/bBjaIfo4rWqMZMzNojtTdd/28PfVIxr/CwDOYF/YNJQ06xCGqSMyaD18WzPkahVWsS8nXAmywA+BHdZhova/43/ClnWcEKBzSj3DAuh7ybfzdW7PstabzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342903; c=relaxed/simple;
	bh=KnVVlJVS5DSDVwMbdz4GLidsfSYLw1Mv9DWRbNw2Dms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ArM9ULzYOYl6cdE3VzO/Wb1e1GTXPR3/lxeRqkHfdnHD3YPl/o9OWf6wuimZE8dGspc2M67h+9fqo6Wpif0NlPDVLgj2klF58/dEExEA9RLVlOi7MxkjbzO96wL10Ch1vLEc7FGFSU1IoBJRNVCIXd+r+ipSaLNx7RmUCF/bP6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIvZrQQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIvZrQQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DF01F000E9;
	Wed,  2 Sep 2026 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788342895;
	bh=SN5nR5tzjhmyfRpdmGMBV3gbD1T+zPmCfIPs9JNL398=;
	h=Date:From:To:Cc:Subject;
	b=YIvZrQQMzirqrQeburYLUvN3s+MFqtljRGUc15nyuRGeA9PjN9BhwA90FXjT0qF5P
	 AYpMJlbs84mr78l/JJtCizsAUAwea3prNlEamzX4rl5TGPHlxHZxG6czBbt2jI4kRU
	 Wk0GZ3qD8cnBxuCXl/v4cAFon5YpQQxcBf1KWQFkHTkgJy+u/9x0tjFRduhfT3Oug7
	 /uTSrH8JnSv4S2WsHxvN9v0tFg6B54NsJrzW64V0EqapVo2zewZYzm5D2t5z61mBew
	 mh4Vmna4DKEFhQG0CFZb5R3nPhGoBFxfJT8wO/nJEbS2q2B5bX+yKaVZQlzSW+xEUZ
	 UbyV9iwnslcgw==
Date: Wed, 2 Sep 2026 09:54:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	tzungbi@kernel.org, chrome-platform@lists.linux.dev,
	Sean Rhodes <sean@starlabs.systems>
Subject: [GIT PULL] Immutable branch for coreboot directory rename for v7.4
Message-ID: <apfyaxKEEJz20wRC@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git ib-coreboot-rename-7.4

for you to fetch changes up to 44e33a5aaa2de3f5cf2701d6f4b0a7c63d4fe602:

  firmware: Rename google firmware directory to coreboot (2026-09-02 09:24:30 +0000)

----------------------------------------------------------------
Sean Rhodes (1):
      firmware: Rename google firmware directory to coreboot

 MAINTAINERS                                        | 20 +++---
 drivers/firmware/Kconfig                           |  2 +-
 drivers/firmware/Makefile                          |  2 +-
 drivers/firmware/{google => coreboot}/Kconfig      | 74 ++++++++++++++++------
 drivers/firmware/{google => coreboot}/Makefile     | 10 +--
 drivers/firmware/{google => coreboot}/cbmem.c      |  0
 .../firmware/{google => coreboot}/coreboot_table.c |  0
 .../firmware/{google => coreboot}/coreboot_table.h |  0
 .../{google => coreboot}/framebuffer-coreboot.c    |  0
 drivers/firmware/{google => coreboot}/gsmi.c       |  0
 .../{google => coreboot}/memconsole-coreboot.c     |  0
 .../{google => coreboot}/memconsole-x86-legacy.c   |  0
 drivers/firmware/{google => coreboot}/memconsole.c |  0
 drivers/firmware/{google => coreboot}/memconsole.h |  6 +-
 drivers/firmware/{google => coreboot}/vpd.c        |  0
 drivers/firmware/{google => coreboot}/vpd_decode.c |  0
 drivers/firmware/{google => coreboot}/vpd_decode.h |  0
 17 files changed, 76 insertions(+), 38 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (64%)
 rename drivers/firmware/{google => coreboot}/Makefile (51%)
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
