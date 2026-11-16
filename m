Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825898;
	b=qHocDbabQQCQigIYmqL57I+5jt9WKrDRgXObuu9DsXKObib0JCJTh/vMVuBPHLPs7K/Y
	 BBks5ZoLYcs2slSbFYPU9zHwIpz6tOVxeN4J1BThsgme20Il91r3eCUGxIFZkadgGDUvF
	 k+wAQiRCCuuGf4vvUat25kFLVbmniLJlUkfCI/OF7W8Y58MUX8sehlZrwQvFtBP2WA5H5
	 pjxno5O0cp+L0N5fQqQ5vwjDFiFHReO156FSi0aa7+KjNtPpwQud0YvfJZGyuB4TwQ+p2
	 iBozZChSnorfMykcrket7X/SdtSYEWsioOq6Kyv8/brM1WtDwjVYxXuVkZNEzS2FKyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825898;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=wLI3PjbAoDRx59c22OBYPR+fGjQeBoMrj8qIP7eHa0Q=;
	b=efmB1t3KUdJZHC+h/9DB71gZ4FGfDKzWpnmkQaIW3DP/LbAsfjyksJKmaLulZDzUFLCv
	 qrEKfF5tNwJk05rQYTZM++YZLcLFAyDzmAFLuQMIQJMBe9eME3dGPrBK7D1/8FM2RWQ0B
	 MHyAwo27Qgf70pnbnFbVOrP4EXROo/KrJc67mWWWGjO224D8fq3ZyZr2U+DFb/XKSxl9k
	 Y+BMjYyCvzLuxcB/9blJmxF1aDC5epBuFWtFueYNgTjiVHAoBEBTTxefE5QY48ASQJUTh
	 5Tcg7JtpHlWrDBidKdnQV1wbwTPKNHE3npyWX48uoKyHVMkpdxip3tRbazTU5+MdAVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m8ezqvO8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B983606A31C;
	Mon, 16 Nov 2026 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m8ezqvO8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6226E1F000C4;
	Mon, 16 Nov 2026 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794825898;
	bh=wLI3PjbAoDRx59c22OBYPR+fGjQeBoMrj8qIP7eHa0Q=;
	h=Date:From:To:Cc:Subject;
	b=m8ezqvO8+LenOiCqb7g28T8DcvXkdHfd+PKCZhfkLx6ydoF2MgOPBf21MbQRu9qDD
	 KNQcnPQnDXwP16qe7QSutJUlDfY0YKWWpjeYGP4JhK/6smDY7K/DqnwMONrt1QkGl9
	 4Z67HuC6UGF+W8EvMomF4SHCYUn6Q4d58QpM79No=
Date: Mon, 16 Nov 2026 11:44:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt driver fixes for 7.4-rc4
Message-ID: <avreo7CCI_5RU7cg@kroah.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit c339f4010dea8b0d754f84ace70cd1b089878ef8:

  Merge tag 'platform-drivers-x86-v7.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 (2026-10-28 07:36:32 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc4

for you to fetch changes up to 3149e8b3237f58d4dd440fc64c45c93404c4b064:

  usb: xhci: fix 'num_active_eps' accounting on allocation failure (2026-11-05 16:01:00 -0500)

----------------------------------------------------------------
USB/Thunderbolt fixes for 7.3-rc4

Here are a bunch of USB (and one Thunderbolt) fixes for 7.3-rc4.  Sorry
for the delay on them, been stuck in travel hell for a bit and these
have been sitting all ready to be merged for too long.  Included in here
are:
  - lots of tiny USB fixes found by anthropic scans
  - usb-serial bugfixes
  - xhci driver fixes for issues regressions by many people
  - dwc3 driver fixes for reported problems
  - some usb gadget driver fixes for reported problems
  - other minor USB driver fixes

Most of these have been in linux-next for weeks with no reported issues,
the others have been in linux-next for 11 days, also with no reported
problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Ali Ahmet Memiş (1):
      usb: typec: ucsi: debugfs: Fix GET commands on UCSI < 2.0

Brian Ellis (1):
      usb: gadget: u_serial: fix NULL deref in gs_close() after failed open

Chaz Bailey (1):
      usb: typec: nb7vpq904m: Set client data in probe to avoid crash on remove

Cosmin Tanislav (1):
      usb: gadget: f_ncm: restart the TX timer if the TX freelist is empty

Greg Kroah-Hartman (1):
      Merge tag 'usb-serial-7.4-rc1-2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Hui Peng (1):
      USB: serial: garmin_gps: validate packet data length in nat_receive()

Ihor Urazov (1):
      usb: typec: ucsi: acpi: Assume UCSI 1.0 on HP ZBook 8 G2i 14

Jacob Riff (1):
      usb: typec: ucsi: retry init only while the PPM is not ready

Johan Hovold (10):
      USB: cdc-acm: fix NULL-deref on hangup
      USB: serial: upd78f0730: fix NULL-deref on hangup
      USB: serial: io_edgeport: fix NULL-deref on early status
      USB: serial: io_edgeport: fix potential close() use-after-free
      USB: serial: io_edgeport: fix potential NULL-deref at open
      USB: serial: io_edgeport: move initial termios update to open()
      USB: serial: io_edgeport: fix potential fifo corruption
      USB: serial: io_edgeport: fix potential use-after-free on disconnect
      USB: serial: io_edgeport: serialise MCR accesses
      USB: serial: garmin_gps: fix deadlock on reset request

Joonhoe Kim (1):
      usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes

Josef Bacik (2):
      thunderbolt: stream: Undo more if the start fails
      USB: serial: oti6858: fix the teardown order in close

Krystian Kaniewski (1):
      usb: gadget: u_serial: pin ports while TTYs are installed

Mathias Nyman (1):
      xhci: keep port link_inactive and connected flags in sync when polled

Niklas Neronin (2):
      usb: xhci: clear stale bandwidth data after hibernation
      usb: xhci: fix 'num_active_eps' accounting on allocation failure

Olivier Kaloudoff (1):
      usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)

Radhey Shyam Pandey (3):
      usb: dwc3: xilinx: fix system suspend and resume PHY handling
      usb: dwc3: xilinx: re-assert resets on ZynqMP init error paths
      usb: dwc3: xilinx: unwind ZynqMP platform init on probe failure and remove

Rishabh Jain (1):
      usb: pci-quirks: always assert xHCI OS ownership

Sonali Pradhan (1):
      usb: gadget: f_midi: fix UAF race during IN request handling

Thinh Nguyen (9):
      MAINTAINERS: take over dwc2 maintainership
      usb: dwc3: trace: Restore request name assignment
      usb: dwc3: gadget: Reject requests to a disabled endpoint
      usb: dwc3: gadget: Track a timed out End Transfer
      usb: dwc3: gadget: Clear delayed stop on End Transfer completion
      usb: dwc3: gadget: Issue no-op Start Transfer only for stream endpoints
      usb: dwc3: gadget: Wait for End Transfer completion on ep disable
      usb: dwc3: gadget: Reset endpoint flags on controller start
      usb: dwc3: gadget: Recover from End Transfer timeout

Tristan Madani (1):
      USB: serial: sierra: validate URB length in instat callback

Uttkarsh Aggarwal (1):
      usb: typec: ucsi: Set ucsi->connector before enabling notifications

Xu Rao (1):
      usb: xhci: disable the correct slot on alloc_dev failure

Yiyu Zhou (1):
      xhci: give back TDs and clean up ep0 after disconnect

Yu Zhang (1):
      usb: gadget: f_mass_storage: take filesem in nofua store to fix backing-file UAF

YuanZhe Liu (1):
      usb: usbtest: prevent divide by zero in simple_io() with zero length

 MAINTAINERS                                  |   3 +-
 drivers/thunderbolt/stream.c                 |   6 +
 drivers/usb/class/cdc-acm.c                  |  18 ++-
 drivers/usb/dwc3/core.h                      |   4 +-
 drivers/usb/dwc3/dwc3-xilinx.c               | 123 +++++++++++++++----
 drivers/usb/dwc3/ep0.c                       |   2 +-
 drivers/usb/dwc3/gadget.c                    | 160 ++++++++++++++++---------
 drivers/usb/dwc3/trace.h                     |   1 +
 drivers/usb/gadget/function/f_mass_storage.c |   8 +-
 drivers/usb/gadget/function/f_midi.c         |   4 +
 drivers/usb/gadget/function/f_ncm.c          |   7 +-
 drivers/usb/gadget/function/storage_common.c |   7 +-
 drivers/usb/gadget/function/storage_common.h |   3 +-
 drivers/usb/gadget/function/u_serial.c       | 170 +++++++++++++++++++++------
 drivers/usb/host/pci-quirks.c                |  13 +-
 drivers/usb/host/xhci-hub.c                  |   6 +
 drivers/usb/host/xhci-mem.c                  |  16 ++-
 drivers/usb/host/xhci-ring.c                 |  73 ++++++++++--
 drivers/usb/host/xhci.c                      |  21 ++--
 drivers/usb/misc/usbtest.c                   |   3 +
 drivers/usb/serial/garmin_gps.c              |  31 +++--
 drivers/usb/serial/io_edgeport.c             | 141 ++++++++++------------
 drivers/usb/serial/oti6858.c                 |  16 ++-
 drivers/usb/serial/sierra.c                  |  18 ++-
 drivers/usb/serial/upd78f0730.c              |  13 +-
 drivers/usb/storage/uas-detect.h             |   8 +-
 drivers/usb/typec/mux/fsa4480.c              |   9 +-
 drivers/usb/typec/mux/nb7vpq904m.c           |   1 +
 drivers/usb/typec/ucsi/debugfs.c             |   3 +-
 drivers/usb/typec/ucsi/ucsi.c                |  47 ++++++--
 drivers/usb/typec/ucsi/ucsi.h                |   1 +
 drivers/usb/typec/ucsi/ucsi_acpi.c           |  35 ++++++
 32 files changed, 694 insertions(+), 277 deletions(-)
