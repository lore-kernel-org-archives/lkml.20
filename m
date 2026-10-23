Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757817;
	b=QBZx3WfAHj+V2aMJDLKiLCxrvEMUbb3LL5HOAiTaD/FsARtk2CF0bZT4OWvsRGOfq/Qw
	 p+un1yo7tG2QP2r+Vjn/J+/o+wdTTZUUUM22NpYDgsG0ZSJ/qrdywnU1xRcWsspGQYFnr
	 ZdDeoDuPqfQ2aqPiiTlW7Bau+5rM8SRTIhsNvII6ARpYpbQggH4PZaUYR8dgOUG3FeV9A
	 lR+z/o7hguX9cgthSMa04bK8v35Eoj8glQ3ZvAMRCKM3q9rtj4eCCrPdmb2XhUutxASwL
	 YNbEQ4PhL0A9rL6PSm/yGPjbDAo7ClNaUqPkC6vGTYKOvzyTnkCQ5nKKGpQ/YUEABPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757817;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/XmCjE4OX0loj66PC5ea7hhz5FfDYotP2jId9vPq7DU=;
	b=Q3iLWlQHJYAD0sjyc5jc4fUxuklFofUv22DuWCAPT8IP3lXCHjhTzNHrIcPLg9kI+2Df
	 HjqHHfCR1aipCJZj56iNW1OXy8vCS8ooiCjXo4LpxreHovAbjcyqjTMbNWLqDrQO6qo1u
	 k+I8oJTtme78e/Qdcv7G7KFNXqvd4XxZ/YCEiZ+VRdxcxtw1EOPlkNPP1yNh5xWSkhquN
	 YOl8NgCY+icJn6tFTF7cGh6FCjd64r1MuQDn8Yd/x1VRzURve7hkEQnKZD8QepcQTlbU2
	 n2dOMkKZ21y/cOHdOE+jAaET6bzu5AXVD4NRhc/RM0MmOD3ICU7aodoI5xeqCV57OTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fU+NfYA+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE94F606A338;
	Fri, 23 Oct 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fU+NfYA+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9771F031F2;
	Fri, 23 Oct 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757815;
	bh=/XmCjE4OX0loj66PC5ea7hhz5FfDYotP2jId9vPq7DU=;
	h=From:To:Cc:Subject:Date;
	b=fU+NfYA+9cgitBxqDPU9KcJ1rD43LEDww56QBZN/jNNeUyK58UsJPUoTTabH2s42V
	 Q1PXqXDosmMDcWBC6CHCWZ9r1WkBU9Pwipvl6WyisNxEPS9HEA5FzBFeUfQlVu1iha
	 cVfgrEajY1ye68vQXGRbrNlpnfSDnGQNkmYe0BsZotgl0Ke7S+9AxkQJp5K9f4t+Nl
	 W+pqqfV2NF/YxlM5lIstitoeWBaFaAhaK3337uVDPmCS3kdw9ftB6trijTKEzcU/8Z
	 MRPcugHWUnxm0JDNRmiXKTfubuCto+OqFT57aBEmLJ3MBocmgigyBOtp9TKRVnVHTI
	 N1gVbu6O8L/BQ==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xKECb-00000000mZM-0BIA;
	Fri, 23 Oct 2026 14:16:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] USB: serial: io_edgeport: fixes and sync commands
Date: Fri, 23 Oct 2026 14:15:18 +0200
Message-ID: <20261023121530.186541-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a NULL-deref triggered by syzbot, a memory corruption
and a UAF flagged by Sashiko, and a NULL-deref and a UAF found through
inspection.

Also add the missing serialisation for MCR, drop the modem lines on
hangup and close, and switch to synchronous commands so that operations
are serialised as expected.

Johan


Changes in v2:
 - reorder fixes
 - add open check to edge_write() to handle tty_wakeup() racing with close()
 - use openPending flag to detect stray open responses and move termios
   change before fifo corruption fix to allow extending critical section
 - fix command URB UAF separately from switch to synchronous commands (new
   patch)
 - move MCR change after termios change to avoid taking mutex in atomic context
 - free command buffers also on successful submission
 - specify command timeout in milliseconds rather than jiffies


Johan Hovold (12):
  USB: serial: io_edgeport: fix NULL-deref on early status
  USB: serial: io_edgeport: fix potential close() use-after-free
  USB: serial: io_edgeport: fix potential NULL-deref at open
  USB: serial: io_edgeport: move initial termios update to open()
  USB: serial: io_edgeport: fix potential fifo corruption
  USB: serial: io_edgeport: fix potential use-after-free on disconnect
  USB: serial: io_edgeport: serialise MCR accesses
  USB: serial: io_edgeport: drop redundant sanity checks
  USB: serial: io_edgeport: drop redundant open sanity checks
  USB: serial: io_edgeport: deassert DTR/RTS on close() and B0
  USB: serial: io_edgeport: replace atomic command allocations
  USB: serial: io_edgeport: switch to synchronous commands

 drivers/usb/serial/io_edgeport.c | 302 +++++++++++--------------------
 1 file changed, 105 insertions(+), 197 deletions(-)

-- 
2.55.0

