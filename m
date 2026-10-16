Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C3039734B;
	Fri, 16 Oct 2026 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139074; cv=none; b=ghkwiE8dHfrzDB2wnsIWfVWfjB5g07CPG/DX5U9XFAd1vaxcEda4/8Rk3F9yabE75odPI+DoeeYhU1s0EbhzwW5/pXjvD9oAvResy04qhpRZkmjDJFlI6XqWwtfbUavSFMqkF1qV6PjfI/okpiThyKtf5BatBydfddXhRcYrZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139074; c=relaxed/simple;
	bh=w0fbt38X8W/g2CpTR/FGoD+K+v/tar0fOVqNJl9vECI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WVKFETFhosgf02CeauB+q5ViZV/JTngSMpm0hbXgUEhXuu43eN2YSDyKoq1SdvNS2+0GrzON+sYsR/E6ni4Tqb8X8IUAuShadDqCZ1zsf0DPnZxPOwmpdgxkbTYgXY+JpV7+dSHlz4y0+5FeVtsQGoC3RqB345kAA/VmM2NaT88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOcquN7P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOcquN7P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227AD1F000C4;
	Fri, 16 Oct 2026 08:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792139073;
	bh=aIVYGwUNWbhqIhMNtrd7an+mjBXhbAz7wQg6yHPzJNk=;
	h=Date:From:To:Cc:Subject;
	b=EOcquN7PmFxhpnrHfmrWflanPkGT6E60mjMWyLyfI5y9IjCGxp3zfUOm2bFk03mVi
	 J82tkLn0oHSPNY4AU8HIz16cY0k9CPAO+dSAqqpML1Ki2rTLANARlg0E7j1AobSRYe
	 s2YnOVhrzyX50L9zS28HkCcAbwYR+q/0ey89rEo7cx5jJLUk+O8oi0GaNZqAoZ94PX
	 7kMhX03lfK0y+J9pGeTxOODtOy4JYj+dUpqkn3JyKpSHmRRLUiwn40R1wQHXAUnWoU
	 /m7tiRb99Frer2FGO/kGLdwuVXFHce2mOuiswzEGoopBo3aEQ7Vyi51F30w0Ci1rmz
	 BOOma1merGkZw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xHdEs-000000075EJ-46Je;
	Fri, 16 Oct 2026 10:24:30 +0200
Date: Fri, 16 Oct 2026 10:24:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial updates for 7.4-rc1
Message-ID: <atHfPtcketplfkrd@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.4-rc1

for you to fetch changes up to d446199711161e35c7f97f1556753c81546fe0e2:

  USB: serial: mxuport: support RS485 mode configuration (2026-10-15 11:28:49 +0200)

----------------------------------------------------------------
USB serial updates for 7.4-rc1

Here are the USB serial updates for 7.4-rc1:

 - fix urb leak on sierra write completion
 - fix urb leak on usb_wwan disconnect
 - fix data corruption due to missing mxuport tx throttling
 - add support for two new classes of mxuport devices
 - add support for rs485 to mxuport
 - add new modem device ids
 - replace the last __get_free_page() with kmalloc()

Everything has been in linux-next with no reported issues. The mxuport
changes were merged yesterday, but they were contributed by a competent
vendor (and passed my smoke test).

----------------------------------------------------------------
Crescent Hsieh (6):
      USB: serial: mxuport: clean up product ID definitions and device table
      USB: serial: mxuport: clean up firmware version handling
      USB: serial: mxuport: add MUX50U-based device support
      USB: serial: add generic write control callbacks
      USB: serial: mxuport: handle SEND_NEXT transmit flow control
      USB: serial: mxuport: support RS485 mode configuration

Johan Hovold (2):
      USB: serial: usb_wwan: fix urb leak on disconnect
      USB: serial: sierra: fix urb leak on write completion

Michael Wyraz (1):
      USB: serial: option: add support for ASR 1286:4e3c modem

Mike Rapoport (Microsoft) (1):
      USB: serial: usb_wwan: replace __get_free_page() with kmalloc()

Reinhard Speyerer (1):
      USB: serial: option: add Rolling Wireless RN947R

 drivers/usb/serial/generic.c  |  11 +-
 drivers/usb/serial/mxuport.c  | 424 ++++++++++++++++++++++++++++++++++++------
 drivers/usb/serial/option.c   |   5 +
 drivers/usb/serial/sierra.c   |   3 +-
 drivers/usb/serial/usb_wwan.c |   9 +-
 include/linux/usb/serial.h    |   8 +
 6 files changed, 391 insertions(+), 69 deletions(-)
