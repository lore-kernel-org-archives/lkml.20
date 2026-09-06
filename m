Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56D22B2D7;
	Sun,  6 Sep 2026 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788687487; cv=none; b=Te56pd90YJxI2Qf9fNM6CPthg8+4WsKkG0yJ+64yeaXQBBO3uzMqKjVfC0FRiCbjspqRRDfjsOF6JseLRJu9mSGUFCU0FprrmHGfHW1cyBzcYjEKDW+dT8VPj7wCah2ZRN1Lw6P9eLp5xBcKkKWMCAmVtrgGB+XrqpXgdO9ZEpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788687487; c=relaxed/simple;
	bh=ryXs22bCuOO0xykjJhIarS5b61/GHzylL3wifg4LIps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iT04D/LgfgBcF/JcFooTX8fUkbk3cTyT5SBYhUG9EOGkfY8l6La8SaymNp7xK5Cjzp5klU733OlW0hBz5ZceX/uet9XeQhVRUbyyFHImYYFZ6zKjIEXrU+vw8COaLlqjXQx5T1cH6zVuTWs7SKgxAJrXs7966EHyBePuYoPjbDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vHok224r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vHok224r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07711F00A3A;
	Sun,  6 Sep 2026 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788687485;
	bh=0rCN0mHo53LZhkeVw8/aHpz528gp0eJjZLOnJQVFYRE=;
	h=Date:From:To:Cc:Subject;
	b=vHok224rwfLbYZlqFZ+o3gVsVa5ya5/ZrAGIqFHkOewrRu6hNSwhjO10IT0/+p0Nq
	 i3dKY/8Ulkh3kMNKgz+ik9Ok0+xvTUfsi31LRAyEhXgE6jbpZcBHH0AsEZVLPwH9TA
	 iaRg4jNfzhMPnxmtbY0oktJKcCR/casL5PBbGgXk=
Date: Sun, 6 Sep 2026 11:36:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.3-rc2
Message-ID: <ap00FN1hfHYkcyhq@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc2

for you to fetch changes up to c9273c83885835dbd1e8835d5665dfb8503d65e0:

  usb: typec: qcom-pmic-typec: drain cc_debounce_dwork if port_start() fails (2026-09-01 16:50:25 +0200)

----------------------------------------------------------------
USB fixes for 7.3-rc2

Here are some small USB driver fixes for reported problems and
regressions.  Include in here are:
  - xhci driver fixes
  - cdns3 driver fixes
  - usb gadget driver fixes for syzbot found problems
  - typec driver fixes for broken hardware and other bugs found
  - kernel data leaks in mdc800 driver
  - usb storage driver fixes
  - other small USB driver fixes

All of these have been in linux-next this week with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Aleksandr Nogikh (1):
      usb: gadget: midi2: Fix null-pointer dereference in f_midi2_free_ep_reqs

Amit Sunil Dhamne (1):
      usb: typec: tcpm: constrain TCPM_SOURCING_VBUS event handling

Andy Shevchenko (1):
      usb: f_mass_storage: Bump local buffer size in fsg_common_create_luns()

Arthur Gautier (1):
      xhci: fix lost bounce buffers on TDs spanning several ring segments

Chang Wu (1):
      usb: typec: hd3ss3220: track VBUS enable state per consumer

Chen-Yu Tsai (1):
      usb: xhci: Fix HCS_ERST_MAX conversion

Elson Serrao (1):
      usb: dwc3: clear forceRM when issuing EndTransfer

Fan Wu (3):
      usb: typec: qcom-pmic: cancel reset_work on stop
      usb: typec: qcom-pmic-typec: disable cc_debounce_dwork on stop
      usb: typec: qcom-pmic-typec: drain cc_debounce_dwork if port_start() fails

Griffin Kroah-Hartman (1):
      usb: image: mdc800: change kmalloc() to kzalloc()

Ivy Lopez (1):
      usb: gadget: f_midi2: fix use-after-free in string attribute show path

Jameson Thies (1):
      usb: typec: ucsi: displayport: Fix OOB altmode array index

Jeffin Philip (3):
      usb: gadget: f_midi: initialize work in f_midi_alloc()
      usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
      usb: gadget: fix null pointer dereference in usb_put_function_instance()

Liu Qi (1):
      usb-storage: ene_ub6250: fix race between scan work and probe

Lovekesh Solanki (1):
      USB: gadget: fix NULL pointer dereference in gadget_dev_ioctl()

Marek Vasut (2):
      usb: typec: mux: Fix typec_switch_match()
      usb: typec: mux: avoid duplicated mux switches

Michal Pecio (1):
      usb: xhci: Fix isochronous scheduling regression

Myeonghun Pak (1):
      usb: storage: realtek_cr: fix use-after-free on disconnect

Pawel Laszczak (1):
      usb: cdnsp: fix wakeup from S3 after controller context loss

Radhey Shyam Pandey (1):
      usb: dwc3: google: Initialise probe properties with DWC3_DEFAULT_PROPERTIES

Sven Peter (1):
      usb: typec: tipd: Fix Thunderbolt altmode VDOs for cd321x

 drivers/usb/cdns3/cdnsp-gadget.c                   | 111 ++++++++++++++++++++-
 drivers/usb/cdns3/cdnsp-gadget.h                   |   1 +
 drivers/usb/cdns3/cdnsp-mem.c                      |  98 +++++++-----------
 drivers/usb/dwc3/dwc3-google.c                     |   1 +
 drivers/usb/dwc3/ep0.c                             |   2 +-
 drivers/usb/dwc3/gadget.c                          |  21 ++--
 drivers/usb/gadget/function/f_mass_storage.c       |   5 +-
 drivers/usb/gadget/function/f_midi.c               |   2 +-
 drivers/usb/gadget/function/f_midi2.c              |  17 ++--
 drivers/usb/gadget/functions.c                     |   2 +-
 drivers/usb/gadget/legacy/inode.c                  |   3 +-
 drivers/usb/host/xhci-mem.c                        |   2 +-
 drivers/usb/host/xhci-ring.c                       |  43 ++++++--
 drivers/usb/image/mdc800.c                         |   4 +-
 drivers/usb/storage/ene_ub6250.c                   |   2 +
 drivers/usb/storage/realtek_cr.c                   |   9 +-
 drivers/usb/typec/hd3ss3220.c                      |   9 +-
 drivers/usb/typec/mux.c                            |  21 +++-
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |   2 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |   5 +
 drivers/usb/typec/tcpm/tcpm.c                      |  28 ++++--
 drivers/usb/typec/tipd/core.c                      |  17 +++-
 drivers/usb/typec/tipd/tps6598x.h                  |   4 +-
 drivers/usb/typec/ucsi/displayport.c               |   2 +-
 24 files changed, 284 insertions(+), 127 deletions(-)
