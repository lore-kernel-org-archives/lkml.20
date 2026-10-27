Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793144317;
	b=NKDQcxbODgZ9H9Pn7ktzZJrqywWxaHQ/a8rhdVJb89xxJUIY8RQWQwTdFF7GlBQ+acfn
	 es/2QVd0aoHkfWsTiM0B1DThX15CZRl4UPvyEsPobbl6TUMGxP10EqDIGD2TSkyki0hO2
	 rlSZBZ2WLBEYDY1BhirDoocv/g60d6kNog/63/JZ5i9X4GzW0qIrGzoVnIXsvG37Otqst
	 NRHB3sKtP9shF2nPuOPCUhdldbpJS+hXSetD4hsWQEmGfhyMkIsHenND46DT7QyzEUycg
	 +aUhoyKxWy1WUsdKjnT5GGZF5jHOP59Gz679JVoAQialfUEmGOMTYjNK/M9kl5byRIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144317;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=kmmHiMgmASjCLCtz33xP5rUPf2lDmFPpGGlI3n51YMQ=;
	b=nfOIA/Sy1GmMUhN0R7JH4Gze0FdoEbWrfOJeHbyJOeVpc1oAH7bv20nJcPeQx1PpcMa6
	 yUDCtXKcujvRP5EDSU+oYlg4xCDc0L4lboZ9RXRH86EhC9tvHI8mUgeRgbUF+lAS9Ciq7
	 sibpkX0tklKx+4u4V8+a25re92XH7KZqTvW+GHvp3DtvJFnYY7acMOdhpqAD5Y5OTvlfm
	 r/Ysud3JcR7GC880bKsRsZ0FV+Tl6PL4YEJ1XforjJ9t7XBC57pwhwGpLlUzf2/KlbcOR
	 ZEGpHsrdoTTFNT9ruQYHwPwEn0eNhAedvrd+KDHhpW2R5vlvJOOxWFDlCN3seZlOwLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xz0rHqI0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF82606A31E;
	Tue, 27 Oct 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xz0rHqI0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793144316;
	b=bY7/Dt8jf+ehNK6aUuwf7SB8ludCZjuspOLUSSmDzSQccnaCSGMBUiWvV6AeOJtGoeJk
	 DfB3wcoJfY8ewHpi2Hsg4OHz9uZQiwiJGrV6kb6+lhbm4JQoEXwz0Ubc0RcVMI5ySfMsm
	 YleymoDh30wKJd58vmOm/SIjaHHqXpKQif0cGTsQiv5+oPcCdEENlik6LtUDzNdMXzgfT
	 SSM2z0oJdCLfcgUcCjM2ec1BG7Cc4PVho2smjMEE8uv3Lh2BskJghnxKUFLsz3MaNbnUv
	 PbtfQPLNkXlZ5cVjirtewH5LxqLyopnMrwhSzirrOd2wuZatjbfmdevOXTje76s1EgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793144316;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=kmmHiMgmASjCLCtz33xP5rUPf2lDmFPpGGlI3n51YMQ=;
	b=25bEtlJU5KhnL9l3xgzStiV6WE5Sj6YvmOY/Q/HODMan1O65nD1JAAyg9JVYBoOLwzCH
	 yNP6oGTzJpygJONschoh7oJ97668LyfIXPqTk9L/OrTtwvyeVj+3jVYwgmwCbi6QAO8Ua
	 u9SaxGnx0azxRmT1lTHMvvQL6Ewgz9nslmlEwOYmjZhplrvdWBPe4xFgo/LPgCtrujWQS
	 6eICUJotpc7zZj975Nfy2/F/N1JSYOEohcxKrX651bkHI3AGzd97QKKm002rVp5xV1xz2
	 Nl17tN8SanC4OW8yqHskj4sTDphIwxPj/xaKK6CtBhJl9L0cZeO3tdGt5iTSWm4V/eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 522451F01829;
	Tue, 27 Oct 2026 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793144316;
	bh=kmmHiMgmASjCLCtz33xP5rUPf2lDmFPpGGlI3n51YMQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Xz0rHqI0bi+QYaho0o4ktpWFa8zw9bdupwjiEN0lObRagoZyPKFuWJ/Q7SGE/Kc+C
	 2YQ7KY7aPpjqUnJRbRjJyauKHud+HDpOSyPP2G+2nwLSkzOZ5C66huzvlYwQfyt2x8
	 vA7f7JRf/1rnPdyLr49jk175zknB+XDUxSLhRs1piKUXWEKNDBepSyFjsqTiMPleu9
	 RGMV+heQKX7zGJb0mKhGpfmgKrY8iQ0+1JmD1YLsI/sbwBZQgcDjjwK7COgfz/U/yq
	 Y14fbt/ag3T4EnZI/QDm+TSz43KGOvxz2eFj0N0d6RlfFI8dJCqRnFwQj5T9ge7M7x
	 uJrWYtY2rCbBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9C91E452DE;
	Tue, 27 Oct 2026 23:38:34 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v2 0/2] usb: ehci-pci: Intel CE5300 TDI EHCI support
Date: Tue, 27 Oct 2026 19:38:33 -0400
Message-Id: <20261027-ehci-ce5300-hostpc-v2-0-375e9d362d74@telaak.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32NQQ6CMBBFr0Jm7Zi2SEFX3sOwqMNgq4aStjYaw
 t0F3Lt8yfvvTxA5OI5wKiYInF10flhA7Qoga4Ybo+sWBiWUlkJWyJYcElelEGh9TCNhUytFvdA
 9NQ0swzFw795b9NL+OL6ud6a0llbDuph8+GyvWa7e34MsUWJJhnVNUh4P+pz4acxj33GGdp7nL
 1GgCVjHAAAA
X-Change-ID: 20261015-ehci-ce5300-hostpc-8722cf06fc88
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793144314; l=1649;
 i=joseph@telaak.dev; s=default; h=from:subject:message-id;
 bh=PAirIQfrTAEvPYMrQ2CqBNCn+EoDZypmUrkIoD9ioHY=;
 b=EtCjWR7eFV6pB71cSePi2Nb15DZSZidFhoT7vbsiKmxsno2Oa3wvZX80q3cTGKlPTd026NNvA
 +yrm/h6tpTkCt13NsePpgOYlaWfeYJPyru/wekfi0Hg68Vk7s6WtBjC
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=vbM2RxVf3De5c1pQhdR2zZNLas2GaS+BXNVRR5qg3hI=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/default with
 auth_id=1203
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

The TDI EHCI core in the Intel CE5300 SoCs needs two quirks: its PCI
config space has no EHCI registers at 0x60 (patch 1), and host mode
lives in USBMODE_EX rather than USBMODE (patch 2). Without them no
device is ever detected, and the controller is not stopped on
shutdown.

CONFIG_USB_EHCI_ROOT_HUB_TT=y is still required, as for any TDI
core. These are device quirks rather than regression fixes, so there
are no Fixes: tags; they may be suitable for stable if you think so.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
Changes in v2:
- 1/2: new; skip the SBRN and port-wake reads at PCI config
  0x60-0x62, which this core doesn't have. A zero SBRN made
  ehci_shutdown() a no-op. Adds the is_intel_ce_tdi() helper used
  by 2/2.
- 2/2: tdi_in_host_mode() reads host mode back from USBMODE_EX on
  this core (new has_usbmode_ex flag); in v1 ehci_halt() returned
  without stopping the controller. Reported by the Sashiko AI review.
- Dropped CE2600 from the subjects: only the CE5300 was tested.
- Link to v1: https://patch.msgid.link/20261015-ehci-ce5300-hostpc-v1-1-3cae67c11946@telaak.dev

---
Joseph Telaak (2):
      usb: ehci-pci: Skip SBRN and port-wake reads on Intel CE5300
      usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel CE5300

 drivers/usb/host/ehci-hcd.c |  5 +++++
 drivers/usb/host/ehci-pci.c | 22 +++++++++++++++++++++-
 drivers/usb/host/ehci.h     |  1 +
 3 files changed, 27 insertions(+), 1 deletion(-)
---
base-commit: bbf6b99a57b2479bf51c3c8ad0946f4b8c33ed69
change-id: 20261015-ehci-ce5300-hostpc-8722cf06fc88

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


