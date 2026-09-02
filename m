Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E12868AB;
	Wed,  2 Sep 2026 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329498; cv=none; b=Zagy0XaROt2ap/UFQUBElGYLsYtjIevu9EgOqukv+DoQlmJzAyG6QnTwuirM/8qGyns4uEWZjUoWjCecaR8t/V1edWsX6CcAkpPWZpVx+91ti64/7pR29uAsthu+syaOBZinw41wBMYCATtLaazPithMnLfmH6uSvCoBKWte1r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329498; c=relaxed/simple;
	bh=02ZvYA8/oKz8ZE0PBSsfSvPAXvJ/gt3amZPDWR6qCYQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fx6qeU2qwC+ce7a2gj1OX6RHGv67XeSApNofSAAzaUQOnB4DgcGpJGQv308KvcNxx8sz4YgTja/kujaKKIzBxh1Qi5L/MhVkWisVg9PcvppiKSLNtAelmlR+o1NdfZi+Iz/mXjHrm+aILcGJbtTxNcG1TGWU02OHmZjU/im2Xj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bg8BwEbV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bg8BwEbV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9471F00A3A;
	Wed,  2 Sep 2026 06:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788329496;
	bh=mQPBDMsI3HShTC30yyTgN+XkPeoRu61woaJWF3WVAl0=;
	h=From:Subject:Date:To:Cc;
	b=Bg8BwEbVZLnP6y9GuMycxmAzCSv+miSM8Tnm1d0aBbX6RuSRiQqjXP4+dxMnNLvBc
	 bwGgYnhRMeqgDWWNQpPYMVvb7zmZ0W9SkHi2Nf9QdezJv8FnfjZcK2FT8QpfWfKJLE
	 b1i2cvh7hNRVTOWRGVCf6wNaY0p405XM+PGSOMkFfkrVyYxcqsyh5agMK9SDnjRrg8
	 5mtxk+nWK9G5XrS0YI2oUOlkE7tM4FN4CgaFC01gaSCzeVTMqp66uIYhi4TieHh+z3
	 rRrXqHrk896uRlbSjqOn+9MhXP89azodqBO0KEhZUx1JOeknH1OTcKrHoUMWbLrC2B
	 3yWqgt/S38DRw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/5] Modernize the Faraday FOTG210 driver
Date: Wed, 02 Sep 2026 08:11:31 +0200
Message-Id: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0Jm7Zh2arS68h6GRYGhTNTWtEg0h
 LtbcenyveS/P0PmJJzhVM2QeJIsMRSgTQXt4IJnlK4wkKK9ImXQ812C4DM32MfRExp7MKy6I1n
 roMweiXt5rclLXXiQPMb0Xh8m/bW/mDX6PzZpVGidZdbU7hpD5yunwLdtTB7qZVk+qleBl7EAA
 AA=
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

Also clean up fixed-role initialization, power and resource handling,
UDC lifecycle, and system sleep handling. The binding and Gemini board
updates are split into a separate series.

Tested on the D-Link DIR-685.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Split the first v1 EHCI core patch into three patches covering port
  status registers, port reset and speed hooks, and other quirks.
- Call reset_control_reset() without a redundant optional-reset NULL
  check.
- Link to v1: https://patch.msgid.link/20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org

---
Linus Walleij (5):
      usb: ehci: support non-standard port status registers
      usb: ehci: add port reset and speed hooks
      usb: ehci: support additional controller quirks
      usb: fotg210: use the common EHCI core
      usb: fotg210-udc: fix endpoint and resource handling

 drivers/usb/fotg210/Kconfig        |    2 +
 drivers/usb/fotg210/fotg210-core.c |  274 +-
 drivers/usb/fotg210/fotg210-hcd.c  | 5672 +-----------------------------------
 drivers/usb/fotg210/fotg210-hcd.h  |  689 -----
 drivers/usb/fotg210/fotg210-udc.c  |   97 +-
 drivers/usb/fotg210/fotg210-udc.h  |    2 +-
 drivers/usb/fotg210/fotg210.h      |   26 +-
 drivers/usb/host/ehci-dbg.c        |    3 +-
 drivers/usb/host/ehci-hcd.c        |   31 +-
 drivers/usb/host/ehci-hub.c        |  100 +-
 drivers/usb/host/ehci-timer.c      |    3 +-
 drivers/usb/host/ehci.h            |   47 +-
 12 files changed, 516 insertions(+), 6430 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260203-gemini-usb-fotg2-3873e0d9288a

Best regards,
--  
Linus Walleij <linusw@kernel.org>

