Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9065478870;
	Tue,  1 Sep 2026 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257152; cv=none; b=Bx44qMVQ94RM1xEj1AwoGHuICcb4FNxmVEKZMOjsAyUVT/adKZ5GOe8BhraEOjUQk6ltZM7ejEWLgH9tKOmOHpuvh6N0vX3xbDvpgnjVGnEJtlkucrwvBf+mDNJ0AMWedm0GKKUQ1piy71peRzx43GRVHi9oBuk3A3Bzl8TaKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257152; c=relaxed/simple;
	bh=CP2iDjjjM2LmDr+6QCKQ1dQlRgx9KRthcQlcKJm0aSg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ot44GE1WSHIZajFWSU8TjOpYKT+kqfddJTllzX+K8yQ1OM82MA92fwWDSd+QNH+kBVkKWQWWZPea2X4adIdsD8TZS1tSQSG4FJxjuRJrXYHQshE+EaSirSepxpDCNHP8YjezqoHiYm4RPE+F++PttM0jurNNC2RRxE3V8b/e+ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQPaTAma; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQPaTAma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A861F000E9;
	Tue,  1 Sep 2026 10:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257150;
	bh=XDZ+ZClSMASP42h1TijFhfnc1qGMmcP7N0HWSwmjy1E=;
	h=From:Subject:Date:To:Cc;
	b=dQPaTAmaU2YT6/KypFrB2MGNyuFkBqANNPOZkZaMHYPPU0rh3A8NhdntgbgVevlPn
	 Gm4Dl56xv2zENtxsXkMzZ9sLvsegWObLsxHAxvxZajERM2x/L9i+jLz+MWOzBRaQNY
	 gV/uUFGCm8Gm6h377NqG4O9eBMdS8xIwyg3RKkwhlwhvwIDTemyw59AdXqxPFE3Cxt
	 6dmTHwFYOBAGQGRu/6DutX03GpKTx3jNZywoijxESj3U1Amxnp2mWXp5RjQKYza337
	 OuIvlzA9+ilZquNX8IN03tl1Ak/0bE0dkBQ+IvBGRZVEuif5Ru1PY2HhXo2dlHSfXr
	 2FkA1EAchMWJw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/4] DWC3 link tunneling state reporting
Date: Tue, 01 Sep 2026 12:05:42 +0200
Message-Id: <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NXQuCMBhG/4rsusnmd131PyJkvr7pQjdz0wrxv
 7cZ0U1088CBh3MWYnCUaMghWMiIszRSKwfxLiDQCtUglbVjErEoYylLqNWDBFrfIS7tpBR2UjW
 lscIiTVlaFMCQC4yJEwwjXuRjk5/ObzZTdUWw3ugfrTRWj8+tPnP/+4TSf6GZU0YTIUQGMfAEq
 qM2JrxNogPd96Eb4ntz9DXm/L8xckb3S4pcsILz/Q/juq4vvAsg3i8BAAA=
X-Change-ID: 20260504-topic-dwc3_tunneling_state-50588c0e1ae3
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788257146; l=2784;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CP2iDjjjM2LmDr+6QCKQ1dQlRgx9KRthcQlcKJm0aSg=;
 b=N5CgGSE/sCiIZu7jWNrRtdmACoFmtTlOg4qgU0pv6r1XT0/Q250j0GMpMpGxIwiPTNJHYUuVs
 H4ApmArh1K3DAbPoBpzIGraeX7JCdgRtuY3JFqfHo6Az+mBWPGzdu6L
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Currently, retrieving the tunneled/native state of a running port is
only possible on Intel XHCI hosts. This series extends that to CIO-
capable DWC31 controllers (see [1]).

Note that this patchset only results in the correct udev->tunnel_mode
value being assigned. Creating the device links (which requires this
information) between the USB4 router and the USB3 controller does not
currently take place on DT-based platforms, but that will be amended
in a follow-up patchset.

Tested on a Qualcomm X1E80100 CRD board, with a (currently) out-of-tree
set of drivers.

[1] I'm not entirely sure about the DWC version range (particularly
    wrt DWC32 and newer), so I limited it to a reasonable subset. I'll
    happily amend that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Report USB_LINK_UNKNOWN instead of NATIVE if the DWC3 controller
  seems not to support USB4
- Cache the capability of reporting tunneling mode instead of checking
  it every single time
- Link to v2: https://patch.msgid.link/20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com

Changes in v2:
- Add handling for XHCI v1.2's USB3 tunneling and PORTSC.TM for
  platforms that advertise it (!!! UNTESTED !!!, I have no access to
  HW that exposes this)
- Prefer the aforementioned cap over custom implementations
- Bail out of the DWC3-specific check if `usb4-host-interface` device
  property is absent - hence this now depends on:
  https://github.com/devicetree-org/dt-schema/pull/196

- Link to v1: https://patch.msgid.link/20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com

---
Konrad Dybcio (4):
      usb: xhci: debugfs: Expose the USB3 tunneling ext_cap register value
      usb: xhci: Honor PORTSC.TM if valid
      usb: xhci: Allow custom op for usb_link_tunnel_mode reporting
      usb: dwc3: Notify XHCI core of tunneled status

 drivers/usb/dwc3/core.c          | 16 ++++++++++++++++
 drivers/usb/dwc3/core.h          | 18 ++++++++++++++++++
 drivers/usb/dwc3/host.c          | 12 ++++++++++++
 drivers/usb/host/xhci-debugfs.c  |  9 +++++++++
 drivers/usb/host/xhci-debugfs.h  |  2 ++
 drivers/usb/host/xhci-ext-caps.h |  4 ++++
 drivers/usb/host/xhci-hub.c      | 24 +++++++++++++++++++-----
 drivers/usb/host/xhci-plat.c     |  2 ++
 drivers/usb/host/xhci-plat.h     |  1 +
 drivers/usb/host/xhci-port.h     |  3 ++-
 drivers/usb/host/xhci.c          | 11 ++++++++++-
 drivers/usb/host/xhci.h          |  6 +++++-
 12 files changed, 100 insertions(+), 8 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260504-topic-dwc3_tunneling_state-50588c0e1ae3

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

