Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295004;
	b=wi4uQq0gpe5g/h5VZq9fV/GwZqx9/p/SHm6vSV4rALaZLDyp7y9wHeymOfFJzvxorxJj
	 Z0LL0XoVnrvPykzM/tlXN2dU4CIr71HW2YPNgOxsqo8eZLoEAWMVv9n/Wea9NpRiobKcr
	 kqrNIC38Vf4N8QY7+b4cTGINEol/Bane76A9Dvfz6fvwSdHoBZdHwf5+C3+WYHCUAa2YI
	 PFwpUTGn3PUXbHoQtR8f4xNbZ5S5vIQDQgUFAm9sKGYGCOppdql/2VJchpEQh4SerZosf
	 4sodQ3670hIEOJY+AhvrKO0UKYxMLAvsH6JK6Tzp3g0t1vkTN2KHqMqIxlm898Ga+Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295004;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=6/C1UURtVuJO94N0CHRCyRqkwHx9ou0FWEiZZ5bBN4M=;
	b=WHjAKOh6zX6Y254HnlMPPGZ6c8lAeeM/ZuDsrdWE2aRtosqG5aPo7j9ZscVz4KLB0QEk
	 W5AkC5X2RghiRwpqTgv8xO0OMY4kRP/OqKk5nfHiI0jRyQgMFnNHjeISWltmtLrS+OiRb
	 AbIPSiYJlSh36J2znbXgXO8pNyXNLoJZYF/ZAItSVl2f/PbRKZQ9w6ZAzhRuzd3NJ0DmH
	 AGhO6G3mlK0z0H8HuyDbUZ7c1urnQPY+iROkj+2UCVVuffmG0dz9VWkZvKJipUqZ5xfU6
	 XrNf0N04xVTjzyaYub7uQmB29OXhkbvXes0X50woPeoKbS5/Sc6F+ZWjYi/BvX26lgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5uBmihZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2D0606A336;
	Tue, 10 Nov 2026 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5uBmihZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295004;
	b=vVrFhP1n6KbtdkgR+jXNZNKUfSVDopT5mvB1slnTBWi6bBH3pZKkVUlzDET3UYskHkq7
	 DzQd/YiXT1s96Y0HBfbhUEGTWdC9TlUt73ymTblN8whClABxzBdQD5Nv8Z/goCaHieyo3
	 JI6mqxbb6HZewG3rUCNSzF6mewVXgb/hMgkmnvo8gTpD6Z89mDX6Yc0PpQwpeqVDSVNZg
	 q+o4vV1awQmDunUpYB5kOB8oO30n72UPw5123CF4uYzJPPtanRGh+oxhXEpywd6Jnwomz
	 csUsSrYlf+zVtxLImWHGCEwkb0t865fbDHcDtseCnpiUoae1QJPpodlXqi+1GEVQ7VA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295004;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6/C1UURtVuJO94N0CHRCyRqkwHx9ou0FWEiZZ5bBN4M=;
	b=GwEbcIgTplCblknjVLbdiJOX9S6lLU6RRW5DpP1jH0Tndu48dBbf2bas4lao1yeoaO/3
	 rs9jYcZdXWZshIpiGKuhMBoY9Z4pjRk0tlBYOI0vPR/Cts9gT2e5daFON7HFpOHjTiXjO
	 SzI4yNxeQzpo65J/AfMiMLx2om8xPEUY/k6BC4r2QWrzkjVnZ+Ff7+6BEmjULu9VvO4iA
	 IeGvcUDHy1iAFjoCzAfEfmToiPuui1gdC848lyBgz8glbE77Sm55kqwfUlL+c8T/JpYPz
	 4YubfW3e2pqycIqL+9x4xrAe4UOVtcFAWVTyA7hyr31/dgmayy+BwKj/VKuFF8M/74Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 735241F008A2;
	Tue, 10 Nov 2026 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295004;
	bh=6/C1UURtVuJO94N0CHRCyRqkwHx9ou0FWEiZZ5bBN4M=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=S5uBmihZWROBQEsFLNj2F3ZPahucGh9nXxeh6F6XZRjfXH2iVVJsslPtTn+MY+9Z/
	 RhSJ+cVP+eDoK2FUYB0aKxIHfWSk1bHYV8SUfgwkDLQgHmF72EufrkT+2/v+KSunyH
	 hLpCuK8ifhgKVWbcZOSKyC6/a6s5g+Wfm/+y/OU/6sjy3lv+lnUfRfGUa8miJJIt07
	 NfG+w6+/KY56oBZ5ae2ynOpjRS2Xzxe1xcVzSoGeLpaEQNGgQnD8gZ6E0s+ibhNs3s
	 O6dXORznajwdlNHA/QHv7B1WiQu0iEC/H0T2O95qL65RzyZaWhALU7jRFdN4MhYSBP
	 ydQEOd/bUThBw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0726348961;
	Tue, 10 Nov 2026 07:16:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] usb: dwc3: Keep the host bus across suspend-to-idle
Date: Tue, 10 Nov 2026 07:16:42 +0000
Message-Id: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3ZTyZGPdYqPMlJxUXbNUY2MjQ3OTZFPzJCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgC3GCXQbwAAAA==
X-Change-ID: 20261110-dwc3-s2idle-6e332174c57b
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295002; l=3467;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=PwjfIXRd+K+b78KtgZc1IBgteLcDSdF0UU+U6AOrVfo=;
 b=MfuwgkRtd7OQMwCdUOasDnUYZU/UDYBYlvntOc9sKjXx18dHJg3Cm7pMuWGpf+iDqsX8p7f5S
 hbQiLIx8R9+CO0Hjwmun3x8u0k4OMgIZwUAk60OPPKnwO27CTfWFK1d
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

In host mode, dwc3_suspend_common() tears the core down for every
system suspend unless the controller is a wakeup source
(dwc3_core_exit(): PHYs off, core reset). That has two consequences
for xhci-plat on top of it:

1. xhci_resume() is not told that the controller was reset. It writes
   the saved operational registers back and asks for a state restore
   (USBCMD.CRS), which fails on a freshly reset core, and only then
   falls back to a reinit:

     xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit

   xhci-plat already has xhci_plat_priv.power_lost for this (cdns3 sets
   it). Patch 1 sets it from dwc3 whenever the core was re-initialised
   and clears it when the core was kept for wakeup.

2. Every device behind the root ports was put into U3 by the bus
   suspend and expects to keep its power session; resetting the core
   ends all of them. On resume the USB core has to reset-resume every
   device, which only works for devices that come back within the 2 s
   usb_port_resume() waits. A SanDisk Extreme SSD and a card reader
   behind a hub do not (2.4-3 s, measured): they are disconnected and
   enumerated again after each resume, which kills a mounted filesystem.
   Patch 2 keeps the core, its PHYs and the suspended bus across
   suspend-to-idle, as the wakeup path already does and as PCI xHCI
   controllers do, and marks the device as being on the awake path so a
   power domain with GENPD_FLAG_ACTIVE_WAKEUP stays on. Suspend-to-RAM,
   hibernation and needs_full_reinit controllers are unchanged.

Patch 2 depends on patch 1 (it clears power_lost on the kept-core path).
Both are changes to the dwc3 core; no glue driver is involved (the
RK3588 nodes bind to the "snps,dwc3" core driver directly).

Tested on an Orange Pi 5 (RK3588S), suspend-to-idle through rtcwake:
- Patch 1: 55 cycles on a kernel with patch 1 (and an ohci-platform
  change sent separately); the "xHC error in resume, USBSTS 0x401"
  message is gone, the controller re-initialises without the failed
  restore, no other change in behaviour.
- Patch 2: 47 cycles on a kernel with both patches: every USB device
  kept its device number, all 7 SuperSpeed links were back after each
  resume, no "root hub lost power or was reset" and no re-enumeration
  in dmesg, USB drives readable afterwards. Without patch 2 the SSD and
  the card reader were disconnected and re-enumerated after every
  resume and their mounted filesystems went offline.
- Not tested: suspend-to-RAM and hibernation (unchanged by this series;
  the test platform has no working deep suspend), other dwc3 platforms.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (2):
      usb: dwc3: Tell xhci-plat when the core lost its state on resume
      usb: dwc3: Keep the host bus suspended, not torn down, across suspend-to-idle

 drivers/usb/dwc3/core.c | 43 +++++++++++++++++++++++++++++++++++++++----
 drivers/usb/dwc3/core.h |  5 +++++
 drivers/usb/dwc3/host.c | 29 ++++++++++++++++++++++++++---
 3 files changed, 70 insertions(+), 7 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-dwc3-s2idle-6e332174c57b

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


