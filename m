Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3723783AE;
	Sat,  3 Oct 2026 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791027446; cv=none; b=Wum2M6xPwdJl7Dw5j7uR9GGvT7hHirgqB3yghXpfvmmKHzpoyGcuKyr9d1XUGfmuV1nRgL26YnM0insuEwmZTfGDsgqJLTiCedaEjfPbc8cjLovXvVhaeHDSft2o7p1jCRxzymKQAYolOz+ur9YyyuG/Z7VLyyCj6Zjh2evIqOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791027446; c=relaxed/simple;
	bh=fVaroThSD633dRfKOhbiu9YJs4xPvrbCl6ADa4ViO4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiLAbFTf8ah0JY9FAR60L83s9FL232WGOSzTXzWjVd58XHPw/NuAy5jJUBJGTkiJzerni1Mmmvkk2PqPohb7LzN8A7H1MfRYoWoFPImYyY45DKb/LQ7ejxilpdCHsLfPtiy+bg2iY9eo7RN8bqlAAVFEvtoWILwveCKJagApx+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KspxxLBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KspxxLBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8DC1F0089B;
	Sat,  3 Oct 2026 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791027444;
	bh=eARKefJCmBEcUluMJgktEHkNXpDUyklGsDfmDVQVSlQ=;
	h=Date:From:To:Cc:Subject;
	b=KspxxLBos5t4pdKDAQqN51KTyMyWSkE6nhZkpZv3zlYVvuwx0lmsgaTZd7Fg7oFlk
	 Eqz8FkTnSm6aLtpvJjAlO0gu1/M3EPRnbzs00ByaQcePH7OsgUVX+LNSSsEzlykSvP
	 zqvJK5hb2Q+j/lszt6gvtFUp6DxhAHowjfS7oF58=
Date: Sat, 3 Oct 2026 13:37:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.3-rc6
Message-ID: <asDo8cZTIkqu5jfo@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc6

for you to fetch changes up to a93862fa670a9c99fd9a24fb2ef69e4f948d9bd5:

  Merge tag 'thunderbolt-for-v7.3-rc6' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus (2026-10-01 13:26:31 +0200)

----------------------------------------------------------------
USB/Thunderbolt fixes for 7.3-rc6

Here is a big set of USB and Thunderbolt driver fixes for 7.3-rc6.
They were delayed on my side due to conference travel, not the fault of
the submitters at all.  Included in here are:
  - lots of small thunderbolt fixes for reported issues due to more
    testing and devices and a few reverts as well based on that work
  - more usb-serial device ids added
  - usb-serial and cdc-acm driver hangup and other fixes
  - dwc3 driver fixes for reported problems
  - lots of usb gadget driver fixes as people again fuzz these drivers
    and send in fixes, which is nice to finally see
  - typec driver fixes for reported problems
  - octeon-hcd driver fixes for reported problems
  - more usb-storage quirks added
  - other small USB driver bugs resolved for reported problems

All of these have been in linux-next without any reported issues

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alan Stern (1):
      USB: gadget: dummy-hcd: Fix wait for outstanding request completions

Amit Sunil Dhamne (1):
      usb: typec: tcpm: recover after failure to start the frs ams

Carlo Szelinsky (1):
      USB: serial: option: add Quectel EG060W

Daehyeon Ko (1):
      thunderbolt: Reject oversized XDomain properties responses

Fan Wu (3):
      usb: typec: ucsi: glink: fix use-after-free of ucsi on remove
      usb: cdns3: fix use-after-free in cdns3_gadget_exit()
      usb: gadget: aspeed-vhub: cancel wake work on device removal

Fedor Pchelkin (1):
      thunderbolt: Fix NULL dereference in tb_remove_work()

Greg Kroah-Hartman (5):
      Merge tag 'thunderbolt-for-v7.3-rc3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
      Merge tag 'usb-serial-7.3-rc3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus
      Merge tag 'usb-serial-7.3-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus
      Revert "usb: dwc3: gadget: fix IRQ storm on invalid event buffer count"
      Merge tag 'thunderbolt-for-v7.3-rc6' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

Hui Peng (1):
      usb: core: clear both ep_in and ep_out for non-ep0 control endpoints

Ian Lin (2):
      USB: serial: option: add Compal EXM-G1x support
      USB: serial: option: add Compal EXC-T1 support

Igor Paunovic (1):
      usb: typec: tcpm: fix use-after-free of the kthread worker on port unregister

Jameson Thies (1):
      usb: typec: ucsi: displayport: Current CAM OOB index fixup

Jiazi Liu (2):
      usb: dwc3: gadget: fix IRQ storm on invalid event buffer count
      usb: dwc3: gadget: fix IRQ storm on invalid event buffer count

Jie Deng (1):
      usb: cdns3: Fix NULL pointer dereference in cdns3_pci_probe

Johan Hovold (8):
      USB: serial: fix port tear down use-after-free
      USB: serial: fix dynamic id driver deregistration race
      USB: serial: fix driver deregistration order
      USB: serial: use iterator for driver deregistration
      USB: serial: fix ioctl hangup race
      USB: cdc-acm: fix racy TIOCMIWAIT implementation
      USB: serial: ssu100: fix baud rate overflow
      USB: serial: quatech2: fix baud rate overflow

Jérémy Carrat (1):
      USB: serial: cp210x: add Corsair AX1500i Power Supply

Kurt Lieber (1):
      thunderbolt: Disable CL states for the Anker Prime TB5 dock

Linkai Gong (1):
      usb: typec: anx7411 - stop the IRQ before destroying the workqueue

Liu Chao (1):
      usb: gadget: f_uac1_legacy: validate bRequest index in generic_{set,get}_cmd

Lovekesh Solanki (1):
      usb: hub: use shorter 120ms post resume hold for SS root hubs

Marek Maslanka (1):
      usb: typec: port-mapper: Only match USB4 port if host interface is available

Marian Rotariu (1):
      usb: typec: tipd: don't send GAID when probe fails in APP mode

Mario Limonciello (1):
      Revert "thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers"

Mika Westerberg (4):
      thunderbolt: Fix KASAN reported use-after-free when request is canceled
      thunderbolt: Use separate lock class for each ring
      Revert "thunderbolt: xdomain: Notify peers after enumeration"
      thunderbolt: stream: Announce support for FMODE_NOWAIT

Myeonghun Pak (5):
      usb: chipidea: tegra: disable runtime PM on resume failure
      usb: ohci-da8xx: disable controller wakeup on cleanup
      usb: ohci-s3c2410: disable controller wakeup on removal
      usb: ohci-spear: disable controller wakeup on removal
      usb: ohci-st: disable controller wakeup on removal

Orgad Shaneh (3):
      usb: octeon-hcd: fix the FIFO-flush timeout computation
      usb: octeon-hcd: fail the probe when the USB core does not respond
      usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers

Pannarat Wiriyaarritham (1):
      usb: typec: ucsi: acpi: Assume UCSI 1.2 on Acer Nitro ANV15-41

Prashanth K (1):
      usb: typec: ucsi: Get the connector fwnode based on reg value

Radhey Shyam Pandey (3):
      usb: dwc3: am62: Fix runtime PM usage count leak on probe error path
      usb: typec: tipd: fix uninitialized typec_partner_desc in tps6598x_connect()
      usb: typec: tipd: fix uninitialized typec_partner_desc in cd321x_update_work()

Runyu Xiao (1):
      USB: dwc2: shut down wakeup timer before freeing HCD state

Sebastian Sjoholm (1):
      USB: serial: option: add Quectel RG660QB

Sven Peter (6):
      thunderbolt: Hold a router reference for each allocated HopID
      thunderbolt: Make the DP tunnel activation callback mandatory
      thunderbolt: Fix domain reference leak when DPRX read is canceled
      thunderbolt: Don't access a DP tunnel after its DPRX read was canceled
      thunderbolt: Mark discovered tunnels as active
      thunderbolt: Tear down inactive DP tunnels when the domain is stopped

Syed Labeeq Sajid Bukhari (1):
      usb: storage: sierra_ms: reject short SWoC info transfers

Takashi Iwai (1):
      usb: gadget: midi2: Fix the jack descriptor array sizes

Yuchao Zhang (2):
      usb: gadget: f_fs: Fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
      USB: cdc-acm: skip URB restart in port_shutdown if disconnected

Zhao Dongdong (1):
      USB: serial: option: add support for SIMCom SIM8260C

 drivers/thunderbolt/ctl.c                   |  63 +++++++-------
 drivers/thunderbolt/domain.c                |  26 +-----
 drivers/thunderbolt/nhi.c                   |  31 ++-----
 drivers/thunderbolt/nhi.h                   |  21 +----
 drivers/thunderbolt/nhi_regs.h              |   4 -
 drivers/thunderbolt/pci.c                   |  23 -----
 drivers/thunderbolt/quirks.c                |   3 +
 drivers/thunderbolt/stream.c                |   3 +
 drivers/thunderbolt/switch.c                |   9 +-
 drivers/thunderbolt/tb.c                    |  37 +++++---
 drivers/thunderbolt/test.c                  |  58 ++++++++++---
 drivers/thunderbolt/tunnel.c                |  73 ++++++++++------
 drivers/thunderbolt/tunnel.h                |   8 +-
 drivers/thunderbolt/xdomain.c               |   5 +-
 drivers/usb/cdns3/cdns3-gadget.c            |   4 +
 drivers/usb/cdns3/cdns3-pci-wrap.c          |   5 ++
 drivers/usb/chipidea/ci_hdrc_tegra.c        |   4 +-
 drivers/usb/class/cdc-acm.c                 |  39 +++++----
 drivers/usb/class/cdc-acm.h                 |   1 -
 drivers/usb/core/hub.c                      |   7 +-
 drivers/usb/core/message.c                  |   8 +-
 drivers/usb/dwc2/hcd.c                      |   3 +-
 drivers/usb/dwc3/core.h                     |  19 +++++
 drivers/usb/dwc3/dwc3-am62.c                |   1 +
 drivers/usb/dwc3/ep0.c                      |   9 ++
 drivers/usb/dwc3/gadget.c                   | 108 +++++++++++++++++++++++-
 drivers/usb/gadget/function/f_fs.c          |  15 +++-
 drivers/usb/gadget/function/f_midi2.c       |   4 +-
 drivers/usb/gadget/function/f_uac1_legacy.c |   6 ++
 drivers/usb/gadget/udc/aspeed-vhub/core.c   |   4 +
 drivers/usb/gadget/udc/aspeed-vhub/dev.c    |   2 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c    |   5 +-
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h   |   1 +
 drivers/usb/gadget/udc/dummy_hcd.c          |   4 +
 drivers/usb/host/octeon-hcd.c               |  54 ++++++++++--
 drivers/usb/host/ohci-da8xx.c               |   2 +
 drivers/usb/host/ohci-s3c2410.c             |   1 +
 drivers/usb/host/ohci-spear.c               |   1 +
 drivers/usb/host/ohci-st.c                  |   1 +
 drivers/usb/serial/bus.c                    |   6 +-
 drivers/usb/serial/cp210x.c                 |   1 +
 drivers/usb/serial/generic.c                |  10 ++-
 drivers/usb/serial/option.c                 |  14 ++++
 drivers/usb/serial/quatech2.c               |  19 ++++-
 drivers/usb/serial/ssu100.c                 |  18 +++-
 drivers/usb/serial/usb-serial.c             | 126 ++++++++++++++++++++++------
 drivers/usb/serial/xr_serial.c              |  10 +--
 drivers/usb/storage/sierra_ms.c             |   7 ++
 drivers/usb/typec/anx7411.c                 |   5 +-
 drivers/usb/typec/port-mapper.c             |  21 ++++-
 drivers/usb/typec/tcpm/tcpm.c               |   6 +-
 drivers/usb/typec/tipd/core.c               |  11 +--
 drivers/usb/typec/ucsi/displayport.c        |   9 +-
 drivers/usb/typec/ucsi/ucsi.c               |  17 +++-
 drivers/usb/typec/ucsi/ucsi_acpi.c          |  34 ++++++++
 drivers/usb/typec/ucsi/ucsi_glink.c         |  15 +++-
 include/linux/thunderbolt.h                 |   3 +
 include/linux/usb/serial.h                  |   1 +
 58 files changed, 726 insertions(+), 279 deletions(-)
