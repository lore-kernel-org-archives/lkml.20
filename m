Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113074;
	b=lVEZYFI0YOjyL/+x9nrWSMYnN8Oa1bslI2QytgOqbqGT8I72oEisVwq8ClhJPNAlc5Qe
	 PfqgIQqPf+pHpylGXXaJUbCLotXodugmT+1g9Auyf0KszK3DJhXtPX72AsKcUsbxFNo9m
	 o+n6AITV/VIthGIYgjKiU1glecGv0au5up7eq2KV+BTCCs//6vcwyPPhTAPjtoiC+3EN7
	 aK+BFacX7HY7cmb3D10YLjhDmcHG6rzgCmOqvjrKVrkj5wOMjeuQQjxEIbg7MJTrETCrL
	 Piibc6/qx/JYjBzrtqs314SSZVO7HU0tRlSH6D2J1QMPUo037K5LY5YB0t7W4j/33hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113074;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FCmJKxkap40C2mKYbXWmosN9QMxBGw6oqmoSkUGuOLM=;
	b=AZVJNcCG+v2hC2OUXeWjl+RzkfzjIlj3F8aBi0DAVDdgCh/o4leBIlpMljUaWnwJT6JQ
	 5IlTeuxdFj62Wq7ZpimQ673ErmZPSyIGiaqtn/3PElJ9lkbjNBArB9D8whE0hMLqwLN6C
	 Y6Uw/ndz9Rll/9mQtHdbaa/bfhnsI7MquabX+8eBOlkkqN6NpE9f01YtsnHeVy1L+ANHG
	 2qOuW40CWm2ey3d/wKAKcpvuuPz/Fio+t95/VyL/W88DRn4gt36EGuIgz4qEHf9QLzXHB
	 O3XJXyWsCUbQf9gpz7TsBcHWQzI2nuIN9zKE7dpHArd5cM0LyQDxWA18/RQASb7Yp1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ogD5JbBM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6F606A323;
	Tue, 27 Oct 2026 14:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ogD5JbBM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB82C1F01828;
	Tue, 27 Oct 2026 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113073;
	bh=FCmJKxkap40C2mKYbXWmosN9QMxBGw6oqmoSkUGuOLM=;
	h=From:Subject:Date:To:Cc;
	b=ogD5JbBMDM56vRyktdGuCJkhGnDuN9af/fKra2gh8B6Mr67qW8FD98HNN14kn6m4j
	 jURUMxTNpZp16Ke1DZDf1oZG7hYHiCRsVTWfLjaTHpUY9zSb9rS+MEFGaxMj4VS2xR
	 qEEIXhjcHGCp+Ho3i4x6p32uq4pVkdU2jDQbm3W0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/19] USB: a bunch of llm-found fixes
Date: Tue, 27 Oct 2026 15:57:40 +0100
Message-Id: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2wpAQBSF4VfRvjY1hxCvIheYjS2nZiOleXeDy
 6/+tW5gdIQMRXSDw5OY1iVAxRG0Q730KMgGg5Y6VVJnYppmcXAjUKY6N7WyJjEQ6s1hR9f3VFa
 /+WhGbPd3Dt4/BWtOSWsAAAA=
X-Change-ID: 20261027-llm-usb-e06293a1d353
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Oliver Neukum <oneukum@suse.com>, 
 Johan Hovold <johan@kernel.org>, 
 Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Roger Quadros <rogerq@kernel.org>, Neill Kapron <nkapron@google.com>, 
 Ijae Kim <ae878000@gmail.com>, Herve Codina <herve.codina@bootlin.com>, 
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Elad Nachman <enachman@marvell.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Rui Miguel Silva <rui.silva@linaro.org>, 
 Minas Harutyunyan <hminas@synopsys.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=ctghQuubkc5B/d1wqbfef3XC4CSUBeUqoPCekyVlQ4s=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr85vch3FWONecchHr7LF2w+Fk9bmNuo8zV5VnSsH
 nfMuf/TOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi188wzJV05vtU53GRK0hR
 1IPnTW1g3lLTOwzz6+Sd7Xd4L36177+dobl80+ujhw4bAAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

Here's a series of some small llm-found fixes that have been sent to me
recently.  Most of them are just minor bugfixes and locking cleanups,
but they are good to have from what I can tell.

Submitting them here to get a solid Sashiko run and some second eyes on
them before merging if all goes well.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Josef Bacik (19):
      usb: core: sysfs: take the port lock to read the BOS
      USB: core: signal the end of an sg request last
      usbip: vudc: free the unlink item if the send fails
      usb: host: oxu210hp-hcd: fix oxu_qh_alloc() deadlock
      usb: cdns3: switch the role unlocked on resume
      usb: gadget: snps_udc_plat: lock out the interrupt
      usb: gadget: bdc: the resume callback is optional
      usb: gadget: uvc: fix oops on a premature STREAMON
      usb: gadget: f_fs: let the request keep its fence
      usb: host: ehci-orion: fix the probe without DT
      usb: typec: tcpm: don't wait for the VDM discovery work
      usb: typec: tcpci: don't act on unread alerts
      usb: typec: anx7411: zero on-stack alt mode descriptors
      usb: typec: mux: it5205: fix oops on accessory modes
      usb: typec: mux: tusb1046: fix oops on accessory modes
      usb: renesas_usbhs: link URBs with interrupts disabled
      usb: renesas_usbhs: unlink the URB if it is not queued
      usb: isp1760: wait for the TT clear in endpoint_disable
      usb: dwc2: wait for the TT clear in endpoint_disable

 drivers/usb/cdns3/cdns3-plat.c          |  8 +++--
 drivers/usb/cdns3/core.c                | 55 +++++++++++++++++-----------
 drivers/usb/cdns3/core.h                |  3 ++
 drivers/usb/core/hub.c                  | 32 +++++++++++++++++
 drivers/usb/core/message.c              | 36 +++++++++++++------
 drivers/usb/core/sysfs.c                |  4 +++
 drivers/usb/core/usb.h                  |  3 ++
 drivers/usb/dwc2/hcd.c                  | 15 ++++++++
 drivers/usb/gadget/function/f_fs.c      | 10 ++++--
 drivers/usb/gadget/function/uvc_video.c |  4 +++
 drivers/usb/gadget/udc/bdc/bdc_udc.c    |  3 +-
 drivers/usb/gadget/udc/snps_udc_plat.c  |  8 ++---
 drivers/usb/host/ehci-orion.c           |  6 ++--
 drivers/usb/host/oxu210hp-hcd.c         | 23 ++++++------
 drivers/usb/isp1760/isp1760-hcd.c       | 11 ++++++
 drivers/usb/renesas_usbhs/mod_host.c    | 19 ++++++++--
 drivers/usb/typec/anx7411.c             |  2 +-
 drivers/usb/typec/class.c               |  2 +-
 drivers/usb/typec/mux/it5205.c          | 14 +++++---
 drivers/usb/typec/mux/tusb1046.c        | 14 +++++---
 drivers/usb/typec/tcpm/tcpci.c          | 64 ++++++++++++++++++++++++---------
 drivers/usb/typec/tcpm/tcpm.c           | 14 ++++++--
 drivers/usb/usbip/vudc_tx.c             |  2 +-
 23 files changed, 266 insertions(+), 86 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-llm-usb-e06293a1d353

Best regards,
--  
Greg Kroah-Hartman <gregkh@linuxfoundation.org>

