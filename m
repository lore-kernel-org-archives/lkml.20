Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C33A5459;
	Tue, 29 Sep 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697290; cv=none; b=EHF+1ED/CmUqmNc2b7OPmvfF853qcvDD7GiYsggcm3zXT6IuhukgRBNNl+W0APev7BmnJYfD1niSMSNvNG4OWFNmDeH3iOAPy4U8qrx4ysXAgzNiEN9FRXTLVAOydZ3Gcs6D0U5OcAJf0j9zwwRkgwthWG2maIS4H/b1svTFFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697290; c=relaxed/simple;
	bh=zpzCca85dXa2XToP2DIm24ldqkAp/nnXdJLqQM89g+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=clYVVxbVsReUfJLfekJR80sZTvaQnF43mdjzibBrZxxO/x1aykwRk//1DCHCnaW19sP3sXdgv5YNiZrNNr3vJiFnA0o/zq55KVfm41LsyYXYgplHolk3sXa9eYKrLp7XBuMWxL/ldeRgrZHBY3rA7MVCr2gKO33DVVUxhT1Un1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=najTeb0P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="najTeb0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E0B1F000FF;
	Tue, 29 Sep 2026 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697289;
	bh=EBMfgJzPvZ60pSzEKnvxYWypCtsXYEGWk+3M6fC3dOs=;
	h=From:Subject:Date:To:Cc;
	b=najTeb0P8kYWOu3FMG5W5k0lfX+k37eadzz/3EkOzESIGg8lMuOAE9v22U6NfyRfH
	 eLhtjz7HOUGiy+4b6atHG+qTJnXleaH9qqhg+LPz9lbF2DNh8o90xaHNCm96N26ola
	 LQh+nYvikDd6XxGrQtIhuxGjxpyLsva1etXM2awiHwTZnViuhXeZoi7sOEkFiz9uLv
	 gg3L0Qmt2Uc1jyGpzhjIPUzLlE/MFvSrBdtfQjBRaZhjWz9c67S1vNyVNmhi+znk33
	 dT15JcCSUv4PEM1LYdpooE48KzgDBJ2X9hK8HTGvpbrRjEz/fGGwsvMjBj6rHek6Ct
	 YwHiJtcgZws8g==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v4 0/4] DWC3 link tunneling state reporting
Date: Tue, 29 Sep 2026 17:54:40 +0200
Message-Id: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ4BMRQF4FeRrlX6S1l5DxGp24uKaZl2BpF5d
 x0iNszmJCc5+c6DJKw9JrIYPUiNrU8+hlLUeETgYMMeqXelE8HElGmmaI5nD9RdQW5yEwKefNh
 vUrYZqWbaGGDILUpSgHONO3974av1u6dme0TIvdgvDj7lWN9f7y3vd58jPXTUcsqostZOQQJXs
 F3GlCaXxp4gVtWkBOn/WvEVZ3xYFEUsO2VmlhnO539E+RXnjA+KsohC7BygMw61/iF2XfcElha
 QK4EBAAA=
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790697285; l=3342;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=zpzCca85dXa2XToP2DIm24ldqkAp/nnXdJLqQM89g+4=;
 b=BR2km41TfXmiDFiOf6us7o6zmFhm7madjlQxPa108qdap8BIxLQiAjCDl5f05ivm571kY5Ix9
 X0ZpL+lZ5XsDefmjXf7EimFNsJyvbvJrN7MWQbShwau+zNJxWEHnsVh
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
Changes in v4:
- Rework the check to use .update_device (Mathias)
- Drop tags for the top 2 comments accordingly
- Link to v3: https://patch.msgid.link/20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com

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

To: Mathias Nyman <mathias.nyman@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Konrad Dybcio (4):
      usb: xhci: debugfs: Expose the USB3 tunneling ext_cap register value
      usb: xhci: Honor PORTSC.TM if valid
      usb: xhci: Use update_device overrides for tunnel reporting
      usb: dwc3: Notify XHCI core of tunneled status

 drivers/usb/dwc3/core.c          | 18 ++++++++++++++++
 drivers/usb/dwc3/core.h          | 18 ++++++++++++++++
 drivers/usb/dwc3/host.c          | 14 +++++++++++++
 drivers/usb/host/xhci-debugfs.c  |  9 ++++++++
 drivers/usb/host/xhci-debugfs.h  |  2 ++
 drivers/usb/host/xhci-ext-caps.h |  4 ++++
 drivers/usb/host/xhci-hub.c      | 44 ----------------------------------------
 drivers/usb/host/xhci-pci.c      | 38 ++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-plat.c     | 18 ++++++++++++++++
 drivers/usb/host/xhci-plat.h     |  2 ++
 drivers/usb/host/xhci-port.h     |  3 ++-
 drivers/usb/host/xhci.c          | 27 ++++++++++++++++--------
 drivers/usb/host/xhci.h          |  9 ++++++--
 13 files changed, 151 insertions(+), 55 deletions(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260504-topic-dwc3_tunneling_state-50588c0e1ae3

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

