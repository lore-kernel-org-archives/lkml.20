Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381203;
	b=zN+gCschcZ8bCH1e1J5f0kvvq4Vb6Ms6bj6do+e19EOK4pTh/iXQg1c4j3gknDEJ02pV
	 tIk53YhaurpBHET0VMuKEOl3lc6YA1istbRZJUYJGVBM/XwqNpgrrK2vjeLCnw2qrU2rV
	 yq65Zd3BZCFTzP4HErUjXvd1i6UtGEKAaqxMjMc0LkctSE4L8OhnvdnMqONBocn50woME
	 s7xWunz4HUvbe35qwgWcjPqAITCmkaV7kICKRuvqi8WrUNu1E+eWzsj2S/aaF3CDyCUut
	 sOlk0FaMg5v0ZAuN5KSQUbXIeSmEZpOfQmoSY8zbbR/cSzq9QzryBgYurSw9ar7NwRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381203;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=NPKLpLPmDc4WENEsboREhBlmvJlRMIFX3QSaRlQssaQ=;
	b=ajAqwGE1nhjLvdKIkk7XfEfUQrdfnoKTWFIg69I6iljQDSX5+psshEuQgrNK9AxrVTxF
	 KUvlka9sbJuwDu3Qp822HuOHsQSvfpg2HcZzsLKBER01F1tCfD8S1W/LUzqz+BnfpD7ZH
	 Ahwc5YnQ36thcmbecSHwxUaaoBij2ZMFHmHzm+j8uam/ffvvAXfz08Fudt7zUuEHxzMxj
	 cbF7FGbLyx4EjNi3Fi4SYom+75Ixg2gfe2Q2mEKd5VBCoIZxgg30DNgiv4b/MqZ7olkd3
	 cObwRCOubHxu42gUtddDWgQ2YtZ6nxW08xhhp2xKuy7UmaVUr3XKbfZMixzDX/AMWeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YY0rQEIE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E5F606A31A;
	Fri, 30 Oct 2026 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YY0rQEIE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A981F000C1;
	Fri, 30 Oct 2026 17:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793381203;
	bh=NPKLpLPmDc4WENEsboREhBlmvJlRMIFX3QSaRlQssaQ=;
	h=Date:From:To:Cc:Subject;
	b=YY0rQEIEmS+la7GDImC46A7mkh++q+wIznxrby+ZmC6T0A3Er5d1JyHBzYFKNMSQb
	 vCVmN2XYcp2Ekeu+B7rlMP9/jDnRss2klqAmgpklvE1nNBWrl58TMGVW0oQu1NPC1j
	 4Fe2oJRgO2El+PlSjuG73q2W2jYZf+OPgvDsWXNsbcX8HgcoiVn+xCRgp07baZ6++b
	 CQrVJ9nzIdT+wSsewg9jwL4zEVbh0lrng7K8xsJp/mvNZoB4QEu37U2Hs9Byc/ktpA
	 Yz0yVLd6Op6oC4ZFTt4Q1WkF7TR3QN+kbLKm+aGK/Fl+JS1MSAXCoahDDshMKhdLIB
	 hdtGYkZ5ZIlxg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xMqNF-00000004kFN-0E2c;
	Fri, 30 Oct 2026 18:26:41 +0100
Date: Fri, 30 Oct 2026 18:26:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.4-rc1
Message-ID: <auTTUf8alxj9ay6X@hovoldconsulting.com>
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

The following changes since commit c339f4010dea8b0d754f84ace70cd1b089878ef8:

  Merge tag 'platform-drivers-x86-v7.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 (2026-10-28 07:36:32 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.4-rc1-2

for you to fetch changes up to ab89a9dab02d9553eb0cc27fd3e4a4998acbc8e9:

  USB: serial: garmin_gps: fix deadlock on reset request (2026-10-29 16:26:41 +0100)

----------------------------------------------------------------
USB serial fixes for 7.4-rc1

Here are a number of fixes for issues hit by syzbot, flagged by Sashiko
or LLM audits, or found through inspection:

 - fix NULL-deref on upd78f0730 hangup (including disconnect)
 - fix OOB read or NULL-deref in garmin_gps on crafted write()
 - fix deadlock on garmin_gps write() reset request
 - fix NULL-deref on early io_edgeport status
 - fix UAF on io_edgeport close() race
 - fix NULL-deref on io_edgeport open() race
 - fix io_edgeport fifo corruption on stray open response
 - fix UAF on io_edgeport disconnect
 - fix missing io_edgeport MCR locking
 - fix oti6858 teardown order to avoid open failure and disconnect UAF
 - fix OOB read on short sierra interrupt message

Everything has been in linux-next over night and with no reported
issues.

----------------------------------------------------------------
Hui Peng (1):
      USB: serial: garmin_gps: validate packet data length in nat_receive()

Johan Hovold (9):
      USB: serial: upd78f0730: fix NULL-deref on hangup
      USB: serial: io_edgeport: fix NULL-deref on early status
      USB: serial: io_edgeport: fix potential close() use-after-free
      USB: serial: io_edgeport: fix potential NULL-deref at open
      USB: serial: io_edgeport: move initial termios update to open()
      USB: serial: io_edgeport: fix potential fifo corruption
      USB: serial: io_edgeport: fix potential use-after-free on disconnect
      USB: serial: io_edgeport: serialise MCR accesses
      USB: serial: garmin_gps: fix deadlock on reset request

Josef Bacik (1):
      USB: serial: oti6858: fix the teardown order in close

Tristan Madani (1):
      USB: serial: sierra: validate URB length in instat callback

 drivers/usb/serial/garmin_gps.c  |  31 +++++----
 drivers/usb/serial/io_edgeport.c | 141 +++++++++++++++++----------------------
 drivers/usb/serial/oti6858.c     |  16 +++--
 drivers/usb/serial/sierra.c      |  18 ++++-
 drivers/usb/serial/upd78f0730.c  |  13 ++--
 5 files changed, 114 insertions(+), 105 deletions(-)
