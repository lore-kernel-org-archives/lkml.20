Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0D3148D9;
	Sun, 30 Aug 2026 22:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788128677; cv=none; b=KK/FWU5+dcS6u4qsj7r4Y72wG8+AsMFrgvqUh6jEphPlGR12b1EdZYQmq6lXeIymjJcpuVADtkIZbhMCPNs4FOzRu2yAC68ps8R3FffyAxv4vIbgKDbH4Oz33mIui/TSJWJJzUrddak72QDtwaJEmn5OdmPdPSK4EafaRzE738U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788128677; c=relaxed/simple;
	bh=Q+VueVM+ZCBGB71Hp7ffTjEo2CC9oUTu9+qzp+qp+eU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CsUIYelB9iAR2ijrZ9w2BW9KPh754wxwCkHZ2/vabLe+ntkxQ0loGPFAXhGFyvnA1kZI7EIkoKZ/2IrHuRgOlJY8h30z2yW0teZtlw0ZAAq1R8jUASo2/jnlOoVOA41LOcnQMmH9/XA5LIXuLXWR1WAvCOrxVWJHzB1lLgeq/nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPnq0r0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPnq0r0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A182C1F000E9;
	Sun, 30 Aug 2026 22:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788128676;
	bh=SZpitwboTbsLvtto0EA/iyiWtyh0MZutPxVZMuk2gc0=;
	h=From:Subject:Date:To:Cc;
	b=lPnq0r0GDVr/HEvkLE59KuAD9GxDlQXnjHfkf4tlffAM8SVsvbF0ilTUxUkxH71Gy
	 YyCt4UdLUL0B08wOlMHSSZaBXxXariT0fwMB8y3JufbpqZKezFlFhq4AQDn1zYh1Mf
	 dUMlCb3+QNedVsgawhPKnznsT4efcuDtG09AMaveLpk1SteuTkOxhpB7y3YNrHXrnA
	 u3nYgHFcnSoUWpHYlMf8CFjfBz0VJ03E0LuhltNV9ucSMps0NhYF01aZSa4TxSxfks
	 z7DW0ryNxs1u1v5//92njCK2GwQ1+nmq6DDXsXjgZM+iVjDXvGJvrU88f3LLzPLw8L
	 u2uVyF6EK++YA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/3] Modernize the Faraday FOTG210 driver
Date: Mon, 31 Aug 2026 00:24:18 +0200
Message-Id: <20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqAMAxA4atIZgM1Ba1eRRz8SWsGq7QqgvTuF
 sdveO+FyEE4Qle8EPiWKLvPqMoC5nX0jlGWbCBFtSKl0fEmXvCKE9r9dITaNJrV0pIxI+TsCGz
 l+Zf9kNIHqCeM3GIAAAA=
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
Linus Walleij (3):
      usb: ehci: support controllers with non-standard registers
      usb: fotg210: use the common EHCI core
      usb: fotg210-udc: fix endpoint and resource handling

 drivers/usb/fotg210/Kconfig        |    2 +
 drivers/usb/fotg210/fotg210-core.c |  276 +-
 drivers/usb/fotg210/fotg210-hcd.c  | 5672 +-----------------------------------
 drivers/usb/fotg210/fotg210-hcd.h  |  689 -----
 drivers/usb/fotg210/fotg210-udc.c  |   97 +-
 drivers/usb/fotg210/fotg210-udc.h  |    2 +-
 drivers/usb/fotg210/fotg210.h      |   26 +-
 drivers/usb/host/ehci-dbg.c        |    3 +-
 drivers/usb/host/ehci-hcd.c        |   31 +-
 drivers/usb/host/ehci-hub.c        |  100 +-
 drivers/usb/host/ehci-timer.c      |    3 +-
 drivers/usb/host/ehci.h            |   55 +-
 12 files changed, 520 insertions(+), 6436 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260203-gemini-usb-fotg2-3873e0d9288a

Best regards,
--  
Linus Walleij <linusw@kernel.org>

