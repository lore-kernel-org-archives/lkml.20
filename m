Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737554C0439;
	Thu,  3 Sep 2026 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470271; cv=none; b=usGGcka/wnNcmiN3bKHXzDfJ/VtGgjy/El41qOiytYPWxLcc4IDAG6oc2y6it38zpB0CjZqJY/4UD4yjOQbCe7Ngz4t6aEWWXWg/ommXHFaRaKOdJGbtMu0OHvqBHTBy735ppPsoyoRdgNAYHg6PMvFPySBeS+gmzTKlEzdGu0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470271; c=relaxed/simple;
	bh=0RPzfavlNFqzhDzU2URQ01zj40Mo9eiEaeqhr369uyk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GyaI2DPRnF4VdBjFJH34QEaEKdoxDlIziW7MBVooRWyawAa/CLSkqoWmESMqvzJgNCexMBgZbNZKGjLy2kGNJpzxQHMFduk49VuLvW1N/YvLl45aLn0lGvigCsR6QcLpYf2CKbPZftoKPlEIfL7GUS464u7zqRV2eNCOcH6CONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuUvydrG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuUvydrG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7C11F000E9;
	Thu,  3 Sep 2026 21:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788470265;
	bh=swZYQQTCbW1fbUdAz1e+PV19j1qGLegG2IRQFSNfaCw=;
	h=From:Subject:Date:To:Cc;
	b=TuUvydrG9hKw7ekObNe7tw9APLMFoFQTJk/UW6FoCXmLr6F8blVoA71RvM/XINMgd
	 R5vfiYJIKye49obP6ed+zXB2f4wRkCg9U4wrl7cbIKvhY3NEVeV+vqkntFk1XV+vPA
	 Gu9A1mvywBO2LV8Au632zgZGe9rFWbWMGjmSj8N+HRIkoGl/27Shw6gO0LfZd87ZYp
	 M0cTRUNX83jxpEX06GPa9lrVxFoMDlGNcpxUwvmf7D9ue5oL1qXUbQMk6mpnzKRegM
	 QAJWRnECtKYhLwMr3pTUw2RClAKpsitsb94K2OPqqFMRgWk+HiPnzS+7t0G/2PXWvC
	 8uhhLCy+W8AvA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 0/6] Modernize the Faraday FOTG210 driver
Date: Thu, 03 Sep 2026 23:17:37 +0200
Message-Id: <20260903-gemini-usb-fotg2-v3-0-dd92ecf5675b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auQrq2ZTkGKK+9hXPAzlEZtTYuNh
 nB3Cy6M0eX7JfPMxAJ5Q4Hts4l5iiYYZ1PITcbaobaauOlSMwTcAYLkmq7GGn4PDe/dqJFLVUq
 CrkKlapbObp5681jJ4yn1YMLo/HP9EMWyvjElxS8WBQeuakUksM0biYczeUuXrfOaLVrEj1AB/
 hEwCQBFmYPKq6JTX8I8zy889gWo8wAAAA==
X-Change-ID: 20260203-gemini-usb-fotg2-3873e0d9288a
To: Alan Stern <stern@rowland.harvard.edu>, 
 Daniel Palmer <daniel@thingy.jp>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Replace the private FOTG210 EHCI fork with the common EHCI core and
quirks for its shifted or missing registers, integrated transaction
translator, speed reporting, and reset sequence.

This is a late reaction to a comment from Daniel Palmer in 2023:
https://lore.kernel.org/linux-usb/CAFr9PXmVXqAX73VUzAt_M2yPN93in9Y_LHyYcEA1Dfj_m_4ZHA@mail.gmail.com/

The fork was originally made from the v3.7 EHCI core driver. Arguably
this was a bad idea since it copied over 5000 lines of code. Correct the
mistake by using the maintained common implementation.

The quirks added by "usb: ehci: support additional controller quirks"
are left unconditional. With ARM multi_v7_defconfig and LLVM=1,
drivers/usb/host/ehci-hcd.o grows from 391,324 to 391,488 bytes, just
164 bytes; its text/data/BSS total grows from 43,629 to 43,745 bytes,
or 116 bytes. The checks are confined to controller lifecycle paths and
full- or low-speed isochronous submission, so Kconfig guards would save
little space and have no noticeable effect on normal execution.

Also clean up fixed-role initialization, power and resource handling,
UDC lifecycle, and system sleep handling. The binding and Gemini board
updates are split into a separate series.

Tested on the D-Link DIR-685.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v3:
- Split the EHCI port reset and speed hooks into separate patches.
- Add a hidden Kconfig option for deviant port status registers,
  avoiding extra state and runtime checks on standard EHCI hosts.
- Gate the port reset and speed hooks behind hidden Kconfig options to
  avoid extra state and runtime checks on standard EHCI hosts.
- Document why the remaining EHCI quirks are not Kconfig-gated.
- Link to v2: https://patch.msgid.link/20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org

Changes in v2:
- Split the first v1 EHCI core patch into three patches covering port
  status registers, port reset and speed hooks, and other quirks.
- Call reset_control_reset() without a redundant optional-reset NULL
  check.
- Link to v1: https://patch.msgid.link/20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org

---
Linus Walleij (6):
      usb: ehci: support non-standard port status registers
      usb: ehci: add port reset hooks
      usb: ehci: add port speed hook
      usb: ehci: support additional controller quirks
      usb: fotg210: use the common EHCI core
      usb: fotg210-udc: fix endpoint and resource handling

 drivers/usb/fotg210/Kconfig        |    5 +
 drivers/usb/fotg210/fotg210-core.c |  274 +-
 drivers/usb/fotg210/fotg210-hcd.c  | 5672 +-----------------------------------
 drivers/usb/fotg210/fotg210-hcd.h  |  689 -----
 drivers/usb/fotg210/fotg210-udc.c  |   97 +-
 drivers/usb/fotg210/fotg210-udc.h  |    2 +-
 drivers/usb/fotg210/fotg210.h      |   26 +-
 drivers/usb/host/Kconfig           |   13 +
 drivers/usb/host/ehci-dbg.c        |    3 +-
 drivers/usb/host/ehci-hcd.c        |   31 +-
 drivers/usb/host/ehci-hub.c        |  104 +-
 drivers/usb/host/ehci-timer.c      |    3 +-
 drivers/usb/host/ehci.h            |   55 +-
 13 files changed, 545 insertions(+), 6429 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260203-gemini-usb-fotg2-3873e0d9288a

Best regards,
--  
Linus Walleij <linusw@kernel.org>

