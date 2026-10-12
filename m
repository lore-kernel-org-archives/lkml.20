Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF60445AEA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792912; cv=none; b=QfiFeQBOmblrWO+jbtZ5FmviAaPrfLGKqQpIwW9+KKJdhP7MJwZYsSl+pqF6xGD305lECUCPkpsnSdcCZJ1QmJ91xqoY78YanLndkhrOeetDi8oPad0i6b+aN7lI684WB3R/a5QEzmReKY0EjPx6rh+dgSQfBRssLXY0V2YNvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792912; c=relaxed/simple;
	bh=ROObucFTsDIGKDF7Z8aakDEPa2dmF3a1EdWKJgLi8Hc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=s8W9bvbz3wCOK7fWtDbZC+3IoxpbUW2eSDynv2KOKFytJwwpqaoA1p7bTeGKUvAVZJn8UPkVLSzYxnK9DiCaAI87HqlL9LJy4vAv2bFaOA5dF8hwzbIpC0oxQvQ186nAmgkDlLJmg817v/vIhotiZ7nTXJy48RbB3OLign58jmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVBctgAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVBctgAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493651F0089B;
	Mon, 12 Oct 2026 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792911;
	bh=lEkUMyHMlBAvoEF5z4XVe5MLmITsomeYb++GA+vuPSc=;
	h=Date:From:Subject:To:Cc;
	b=jVBctgAoZZt9HTls/+F5SCSLEHSA6hNrPUiDe6ha+/68m410dKKe0uXDVa977/7vN
	 OzvISS1u3XKBD+t058Joa0jOpF0r+CHWWFdpuA2Zh9jd5KMLEafcsQ0z52TD5i7oxS
	 DQ6rNH+vD9dclW0aYVDfqmmvRZxyiF5ms4WoU3MvxL+tTG/MfkDD9bb0O3w9s0XGO7
	 8hvZzWzVRfpObanDo3m08ZQeP3HjWiE+jJFt3eUJWVa29ugkEtCE/8+YFk4qzdI4SG
	 QkszaGhQAD/RdjO4gamUJTlFJfXn/eHER/93jxl53gqrcKRQ6I9lknkByCHK88GbfW
	 Reosmqo8PsdbQ==
Message-ID: <53a2dd80-3d3e-4b6f-9419-c71434c41a82@kernel.org>
Date: Mon, 12 Oct 2026 10:15:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [GIT PULL] SOC FSL for 7.4
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 7.4

Changes to fsl-mc bus are reviewed or acked by Ioana
Changes to usb drivers are acked by greg

Thanks
Christophe

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux 
tags/soc_fsl-7.4-1

for you to fetch changes up to a7831c657c90e8f9165f6bbe0cc56262fee075e8:

   soc: fsl: dpio: Free the IRQ before releasing the I/O object 
(2026-10-09 10:15:19 +0200)

----------------------------------------------------------------
FSL SOC Changes for 7.4

Freescale QUICC Engine:
- Fix sparse warnings in GPIO
- Drop GPIOD_FLAGS_BIT_NONEXCLUSIVE

Freescale CPM1 Timeslot Assigner:
- Fix clock leak in tsa_of_parse_tdms()

Data Path I/O:
- Free the IRQ before releasing the I/O object
- Fix cleanup on IRQ registration failure

Freescale Management Complex:
- Annotate fsl_mc_io.portal_virt_addr with __counted_by_ptr
- Drop the fwnode links of the dpmacs nodes
- Register the object drivers after misc_class exists
- Set dma_mask for the DPRC devices
- Fix repeated word 'for' in comment

----------------------------------------------------------------
Bartosz Golaszewski (1):
       soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE

Bill Wendling (1):
       bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with 
__counted_by_ptr

Christophe Leroy (CS GROUP) (1):
       soc: fsl: qe: Fix sparse warnings in GPIO

Hemanth Selam (1):
       bus: fsl-mc: fix repeated word 'for' in comment

Myeonghun Pak (2):
       soc: fsl: dpio: Fix cleanup on IRQ registration failure
       soc: fsl: dpio: Free the IRQ before releasing the I/O object

Vincent Jardin (3):
       bus: fsl-mc: set dma_mask for the DPRC devices
       bus: fsl-mc: register the object drivers after misc_class exists
       bus: fsl-mc: drop the fwnode links of the dpmacs nodes

Wentao Liang (1):
       soc: fsl: cpm1: tsa: Fix clock leak in tsa_of_parse_tdms()

  drivers/bus/fsl-mc/fsl-mc-bus.c    | 64 
+++++++++++++++++++++++++-----------
  drivers/bus/fsl-mc/fsl-mc-msi.c    |  2 +-
  drivers/soc/fsl/dpio/dpio-driver.c |  9 ++---
  drivers/soc/fsl/qe/gpio.c          | 67 
+++++++++++++++-----------------------
  drivers/soc/fsl/qe/tsa.c           | 16 ++++-----
  drivers/usb/host/fhci-hcd.c        |  2 +-
  include/linux/fsl/mc.h             |  2 +-
  include/soc/fsl/qe/qe.h            |  6 ++--
  8 files changed, 91 insertions(+), 77 deletions(-)
