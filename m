Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1484F39768F;
	Fri, 11 Sep 2026 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119504; cv=none; b=lBuq/EJwNp8Efv16f2G6gbFMaVS3XhFV7S1oSBPhFmK2QhdS2DLX7t4t5RDDsca2Tdkx3Vrm40RKb2+2BBK4n5hkQw1i1KNS6/4OK6K3f0UoRkPK0i+sdsg+xrQuGQXFWn2Ekft6Uzkr7FD2poYIVgH31R9cr0HFO0QGkxlFDNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119504; c=relaxed/simple;
	bh=6UkByw9iNPFBz6vhOQioMmi9FyBqjkYd6iuFvLRpQb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y4mO9/iTtse/UMTkiQ9zsxa8zUEbhQnlGVrGk5FITCkVsaAPt9yN1ZJGcu/bIDssSZTO03IsPjB5yOF7EEk33Ly4QN0W1bNrhTEZA/RwBBGh1IrzfpStIH331fo7bORkfMJqnlDu1x39RkjlXINxuMpRDZsxIY0sO4k7Em7rtfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEfISOXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEfISOXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E9E1F000FF;
	Fri, 11 Sep 2026 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119502;
	bh=Hgw5Hni9J0kDflGKhzyxqzPs/bDVlRLxB3w8xl9rQA8=;
	h=Date:From:To:Cc:Subject;
	b=kEfISOXeLied2s/OCNN2TaUHLyah3kDbUWOawKX9E9A++9OA8zAT5E9ZiT6rJuNmi
	 ihTM0sDnblefXdZxCCkAM4vRc7pp3Qz2wqFVN/H2MHDmIKQkNse5W2USrLBEjbflzS
	 jE6+TIRCd9sos88VGjKA/w1drQsFqa7Gettjb3oacuV7Ox8pYx8ggwhcFGTIiH5UtC
	 prbiXIA96EpGzAwSoNLWrK9cqqxeLeb+vNkQO1WBu81IDX9b4ZZct+rPEJzXYRO3OY
	 +dbWfkam4UBMOfo3fEo7CaXUTZDDqMJiMk+4+kxOX0aMLVaJF/hr69RnhePLJyaKUo
	 7Y8YmskHZfkAg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x4xi8-0000000335Z-2EQa;
	Fri, 11 Sep 2026 11:38:20 +0200
Date: Fri, 11 Sep 2026 11:38:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.3-rc3
Message-ID: <aqPMDHBQ8bUm-Ohg@hovoldconsulting.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.3-rc3

for you to fetch changes up to ae0e61d95677efa778379853e495d748e6efbf95:

  USB: serial: fix ioctl hangup race (2026-09-08 11:00:48 +0200)

----------------------------------------------------------------
USB serial fixes for 7.3-rc3

Here is a fix for a long-standing ioctl-hangup race and a couple of
fixes for port lifetime issues that can lead to NULL-pointer
dereferences when disconnecting devices or deregistering drivers.

Included are also a fix for a related dynamic id leak and some new modem
device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Carlo Szelinsky (1):
      USB: serial: option: add Quectel EG060W

Ian Lin (2):
      USB: serial: option: add Compal EXM-G1x support
      USB: serial: option: add Compal EXC-T1 support

Johan Hovold (5):
      USB: serial: fix port tear down use-after-free
      USB: serial: fix dynamic id driver deregistration race
      USB: serial: fix driver deregistration order
      USB: serial: use iterator for driver deregistration
      USB: serial: fix ioctl hangup race

Sebastian Sjoholm (1):
      USB: serial: option: add Quectel RG660QB

Zhao Dongdong (1):
      USB: serial: option: add support for SIMCom SIM8260C

 drivers/usb/serial/bus.c        |   6 +-
 drivers/usb/serial/generic.c    |  10 +++-
 drivers/usb/serial/option.c     |  14 +++++
 drivers/usb/serial/usb-serial.c | 126 +++++++++++++++++++++++++++++++---------
 drivers/usb/serial/xr_serial.c  |  10 +---
 include/linux/usb/serial.h      |   1 +
 6 files changed, 132 insertions(+), 35 deletions(-)
