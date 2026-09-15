Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CD03CAE93;
	Tue, 15 Sep 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480203; cv=none; b=kQchk0CT86z+7J1jOTv0xdRNNy74xkejbvqx5uOalizDefc1POq/dl4CTKBq576fK2HkbrN967XVGJ7bQBRcQwxWsPsum/JsKbCPCzXWkYNuda1LURz7mRUqSa0L7fasEIFQ09ovQRSMLMZ6yfoig5/BSCWhsYF9vHP69lm625U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480203; c=relaxed/simple;
	bh=jRgUP+9OjlipmYWkzGv7TDSYVuS+Vu/gKZtI9L7747o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fS+DERNZHAR/HKjUsF6VLuNAu2nLT5ER3wt5Q4wPqqOZX4N2i11lDTscLuCKuw2augaPGSaUzuCrEbATeeC4HlXtOh+ERFUbcebFrf3FC+sZgIqBvCu6L6IwQDFlSDc5UPA9dkfVwhZ0q/jftV2sKXiD+S5HxjG5p2Ws1/a/t3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X7/JLwRM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X7/JLwRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=jRgUP+9OjlipmYWkzGv7TDSYVuS+Vu/gKZtI9L7747o=;
	h=From:Subject:Date:To:Cc:From;
	b=X7/JLwRM30X8MIAAJ24d3J2fhthzk2rhnOI6zj5Rs5cVwHQW4BTnLnnRdT2YEyen/
	 ZjqvMR9ca9WHnxfuKSAnAzAaW5LZyhSBmu7sfojXDeVjOKxaP/hRCLi83PwfeJ5LCG
	 WQwZ5hdNacpS+yDk4nnqe7kROTfvXEpMJN6vuaCnX5Xn+PFdLN7gcMr6YPlWLyQsvs
	 0YjySUQAG7hep54gjYKYhL3JShPmiLLHxE+hb533NWZqfp+ZglrgJkuQ4VwFhdWm5d
	 AQiPEONvuZ+0YzIx5lnKHqUixJHVNRwqcv7xgUwQWh1UcqlIwqc6LW33zV00fP6vjJ
	 xZ1b0HJuXLbnQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B06B17E0082;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2920848002B; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v15 00/16] phy: rockchip: usbdp: Clean up the mess (part 1)
Date: Tue, 15 Sep 2026 15:49:47 +0200
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XTwY4bIQwG4FdZzblTYQMG76nvUfUAjGlGTTPRT
 Ddqtcq7F/YSVEF6tCU+sPXzPh2yr3JMry/v0y639Vi3SynAfnqZ0ilcvsu8LqUxoUJSqPS8b+l
 HOq3X+e2Iy3VOZwmXt+tso+UlR0sQ9FQOX3fJ6+8P+eu3Up/W49e2//m46Aa1+1/yBrOagQJlR
 lnA0Ze0nc8hbnv4nLafU2Vv2FAwprBQkZwkRJuZpEfpB6WfULpQWnwWz0GXsXuUeVAG/ZAyhXL
 OWXIgSRB7lH1QBDikbKEkJ68VsSfOPYpaiocU1QFjhGxN1Fl3B3QNhXZIuUp5iTplsiYvPcq3F
 A0pXyjjMnlk7zx3X8UPyqnxrrjuSoPkGAkX7IYBVGs9yagqWNCMDiAFH7iLQYuNNw818QEMh0Q
 qO0pdrIm8K9cPsZp5Hw0EDhwlqy6mW8yMsZp6SlGLI15M6q4fmtj7Jz8Iau6jDQsn8jkA/Ivd7
 /e/IticWJoEAAA=
X-Change-ID: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14930;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jRgUP+9OjlipmYWkzGv7TDSYVuS+Vu/gKZtI9L7747o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQHHEHqYYV5wvgdyOcADseJSS41Q78Xyl
 SvnbuqsWOvEOokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0BAAoJENju1/PI
 O/qaUr8P/R8sCoiDOHj1fCYk6n7jEUzuc9b2WRs1Rr2XFsiVx4DxJj+9BaSfCpAwSLW9z/+5gzH
 k1xbqaqmgzXkKS1ecpasKJqbM5Wpe0cnIgyPgIye5Vr48rAbZXaqLbQ5GwBSk9JWmjHlhbIyCkB
 pQwZo4OxynDNyLYQR7imh7sZjf1oHZNV+t3LgoxLNPev4gu86n2wDiNZp2aRLdcY41S1uQsguiq
 GPit+PZm/QgiEPEJc1HAiAL/9uzrF46FUxA8TY6PlXRdTe50XvFIhci79AmvOwB2FCOiQhkVMgj
 y7N3xu4hWo5c/1ozssBH56ZmnVWtaMkue5LGGRDai6iuA3yHO1d48CFoxNByc9xC20fXSVyy+iv
 fzRv60PHaWo8HdlBcvggMcW/iRUKAS+Xd9gmCruNDI1jvA2brUoFHz1Tk3fzDdWKTPaBgFeByqx
 vk2jmGw0EaMqGm0+c67j0cPUrW5Tr+kGCPRIBOx6MUQKf/II6A35Cp3S/Yc1H5zis0OQg3Xpm5z
 R4T0dOVEIm9VzMy3KF92LU5vX0GGRjQXuhuKxa6a2NrKW9ILzcwCVFSfwCW7ephyBfcuRIywPn+
 uH9Zs/P2f/EeyGT0XKyuLgHjtxjlwkAijFH8Jibmr8jcBdGwa2d3jGRTr9oS1aNkk1yAzWWDOWb
 KMdsqMf9/tfAL4hJMEbQxrw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This series is the first part of a major overhaul of the Rockchip USBDP
driver. The goal of the bigger series is:

 * USB-C DP AltMode support
 * Fixing sporadic SErrors happening when connector is hot-plugged
 * Fixing USB3 support when connector orientation changes after
   hotplug
 * Fixing USBDP PHY not starting up properly initially or after a few
   replugs

To fix all of these the whole set is needed. As reviewers preferred to
get this in multiple series I've split it up. Technically its exactly
the same as the previous big series. Reordering/regrouping the patches
is not possible without basically starting from scratch. This first
batch contains a bunch of smaller fixes and cleanups as well as the DP
aux bridge registration unblocking the DRM side. It is missing a bunch
of further cleanups and fixes that will follow in separate series.

Changes in v15:
- Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
- rebased to v7.3-rc1
- group the first 16 patches into part 1, remaining patches will be send
  in separate series depending on this one
- patches from this part are unchanged to v14

Changes in v14:
- Link to v13: https://lore.kernel.org/r/20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com
- move PHY reset handling into Rockchip glue driver (Thinh Nguyen)
  - new patch: introduce Rockchip glue driver for dwc3
  - new patch: introduce dwc3 post PHY registration hook for platform glue drivers
  - register the PHY reset notify handlers via the new hook in the
    Rockchip glue driver instead of directly in the dwc3 core
- new patch: recover USB gadget connection on cable replug
- Collect Tested-by: Igor Paunovic <royalnet026@gmail.com>

Changes in v13:
- Link to v12: https://lore.kernel.org/r/20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com
- Drop "Clear USB status on PHY exit" patch and fully rely on
  "Fix power state handling", which also fixes this problem
  (Sashiko reporting further problems with this)
- Check for highspeed mode in "Avoid xHCI SErrors" (Sashiko)
- In "dwc3: core: support PHY reset notifications" ignore errors
  for pm_runtime_get_if_active() to support !CONFIG_PM and use
  per-port bitmask protected by lock instead of atomic counters
  (Sashiko)
- Update commit message of -EPROBE_DEFER patch to properly mention
  the reset happening in the PHY init routine (Sashiko)
- Fixed bisectability issue in "Rename mode to hw_mode", which I
  accidently introduced in v12 (Sashiko)
- All other pre-existing issues reported by Sashiko in v12 are fixed
  by later patches in the series.

Changes in v12:
- Link to v11: https://lore.kernel.org/r/20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com
- Add missing U3 port re-enable in Avoid xHCI SErrors patch (Sashiko)
- Mention possible deadlock issues in phy_notify_state() function
  documentation (Sashiko)
- Avoid runtime resume in dwc3 reset handler, which would result in
  a deadlock, if dwc3 is suspended (Sashiko)
- In patch adding reset notifications to USBDP PHY, also send the
  POST reset notification if rk_udphy_setup fails (Sashiko)
- Rework 'Fix power state handling' patch to adapt to these changes and
  avoid calling rk_udphy_u3_port_disable() when the USB3 PHY side is not
  requested by software (which means the USB power-domain being enabled,
  which is needed for the USB GRF). Previously this was guranteed by the
  runtime PM in the reset handler. The new version is better anyways as
  the old version would run into an SError when DWC3 was not loaded.
  (myself)
- I've not fixed various "pre-existing issues" reported by Sashiko to
  avoid further exploding this series. Also most of them are already
  fixed by later patches in this series anyways.

Changes in v11:
- Link to v10: https://lore.kernel.org/r/20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com
- Fix depreated -> deprecated typo in DT binding (Sashiko)
- dwc3 patch: (un)register PHY notifier in probe/remove instead of
  phy_init/exit to avoid AB-BA deadlock (Sashiko)
- dwc3 patch: replace pm_runtime_get_sync by pm_runtime_resume_and_get
  and add error handling (Sashiko)
- implement error handling for PRE_RESET in USBDP driver to match
  this (me)
- dwc3 patch: add reset counter to have balanced runtime PM count if
  dwc3 is removed during an active reset (Sashiko)
- Keep code to disable USB3 in highspeed-only mode in phy_init (Sashiko)
- Always set lane mux in last patch to make sure orientation
  changes are handled properly (Sashiko)
- Update commit message of last patch to mention USB reconnections
  happening during PD state negotiation (Sashiko)

Changes in v10:
- Link to v9: https://lore.kernel.org/r/20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com
- Add 'deprecated: true' to port in DT binding, since ports replaces it (Sashiko)
- In 'Drop seamless DP takeover' simply remove any handling for
  pre-enabled PHY as there is no known bootloader doing that and
  Sashiko keeps finding things, which I cannot test. (Sashiko, myself)
- Use on/off instead of enabled/disabled in PHY reinit message,
  which is shorter (myself)
- Use notifier_to_errno() in "add notifier infrastructure" (Sashiko)
- Rework DWC3 PHY reset notifier patch, so that it works correctly
  for multiple ports (Rockchip is single-port) and keep a runtime
  reference while the PHY reset is going on to massively simplify
  the locking logic. (Sashiko)
- Drop patch renaming phy_needs_reinit keep the existing logic to
  set it whenever the lane configuration changes (Sashiko)
- Update "Simplify power state handling" patch, to mostly depend
  on the DT configured or TypeC negotiated modes to avoid
  data stream disconnections when DP is hotplugged in a dock or
  USB is used with runtime PM (Sashiko)
- Ensure sw_mode is not set when the PHY enablement function fails
  (Sashiko)
- Add new patch adding USB-only mode as USB-C state, which results
  in proper powering off the DP side when the remote hardware is
  not capable of DP AltMode. (myself)

Changes in v9:
- Link to v8: https://lore.kernel.org/r/20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com
- Update DT binding to explicitly mention that port@3 is for the
  DP aux channel and not DP in general (Sashiko got this wrong)
- Add a 100ms cooldown sleep in "Drop seamless DP takeover" after HPD
  is force disabled (Sashiko)
- Update comment in "Register DP aux bridge" to explain why port@3 is
  checked, but port@0 is used (Sashiko)
- Check for high-speed only mode in "Support going from DP-only mode to
  USB mode" (Sashiko)
- Add new patch for rk_udphy_reset_deassert error handling (Sashiko)
- Add new patch to avoid enabling USB3 in high-speed only mode during
  PHY reinit (Sashiko)
- Add 3 more patches to handle the LCPLL lock issue mentioned in the v8
  cover letter after feedback from Rockchip. Apparently the DWC3 does
  not cope very well with the PHY disappearing resulting in the PIPE
  interface misbehaving, which in turn results in the LCPLL not locking.
  The new patches avoid this by asserting DWC3_GUSB3PIPECTL_PHYSOFTRST.
  As this assert needs to be done when the PHY wants to reset, a new
  notifier system has been implemented to support triggering this from
  the PHY driver. This also means, that this version now also involves
  the USB subsystem.
- Drop old patch trying to solve the DP-only -> USB mode switch in
  favour of 5 new patches completely rewriting and simplifying the
  power status handling. The new code ensures that the PHY always
  has the right modes enabled and also makes sure a re-init happens
  on an orientation change.
- rebased on v7.2-rc1

Changes in v8:
- Link to v7: https://lore.kernel.org/r/20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com
- Move patch "Limit DP lane count to muxed lanes" after single lane
  support, which introduces dp_lanes variable to make sure series
  is bi-sectable (Sashiko)
- Force disable HPD in "Drop seamless DP takeover" patch and update
  patch description to mention potential issues with SErrors for
  bootloaders really keeping the DW-DP on. As mentioned in the new
  commit message this is untested as I'm not aware of such a
  bootloader anyways; this also means we need to keep the HPD GRF
  register defines in the 'Drop DP HPD handling' patch (Sashiko)
- Fix mode logic in "Properly handle TYPEC_STATE_SAFE and
  TYPEC_STATE_USB" patch; I blame the heat (Sashiko)
- Improve "Support going from DP-only mode to USB mode" patch to
  better handle starting in DP only mode; due to TypeC logic
  starting delayed this does not really happen, though (Sashiko)
- Improve "Support going from DP-only mode to USB mode" to avoid
  checking previous state and instead power on USB state based
  on previous requested state to avoid effects from the flip
  callback (Sashiko)
- Update the debug message patch to include some more info
- Ad one more patch, which disables USB3 at startup and drops
  the -EPROBE_DEFER logic

Changes in v7:
- Link to v6: https://lore.kernel.org/r/20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com
- Add new patch handling missing clock-names in DT gracefully (Sashiko)
- Add new patch handling rk_udphy_reset_deassert_all errors in init check (Sashiko)
- Add new patch to handle Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB (Sashiko)
- Add new patch to avoid xHCI SErrors

Changes in v6:
- Link to v5: https://lore.kernel.org/r/20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com
- Add explicit <linux/string_choices.h> include in last patch (Sashiko)
- Add new patch moving mode_change update after error handling (Sashiko)
- Add new patch fixing error masking of devm_clk_bulk_get_all() (Sashiko)
- Add new patch dropping seamless DP takeover as it is non-functional and buggy (Sashiko) 
- Add new patch limiting DP lane count to muxed lanes (Sashiko)
- Add error handling in the patch that keeps clocks running on PHY re-init (Sashiko)
- Also look for DP being configured to second lane for the flip config
  in DP single-lane mode, which should at least keep USB working for
  this super unusual config (Sashiko)
- Drop useless ret variable in patch introducing guard() for the mutex
- Add error handling for PHY re-enablement in the patch fixing support for
  DP-only -> USB mode (Sashiko)

Changes in v5:
- Link to v4: https://lore.kernel.org/r/20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com
- Picked up Acked-by from Rob Herring for DT binding
- Fix typos in commit messages/comments
- Add Fixes tag to "Do not looe USB3 PHY status" patch
- Collect Reviewed-by: Neil Armstrong for multiple patches
- Drop now unused code from "Drop DP HPD handling" patch (Sashiko)
- Ignore mux events not involving DP AltMode (Sashiko)
- Add new patch to support going back from DP only mode to USB combo
  mode; technically this is a fix, but DP mode does not yet work
  upstream, so it does not matter (Sashiko)
- Add new patch adding a few debug messages, which are useful
  to investigate potential hotplug issues in the future
- Sashiko comments about the DT binding and property usage
  are wrong as the first port is for the superspeed lanes
  used for DP and USB, while the last port is just about
  DP aux. I ignored them.
- There is a pre-existing bug, that can already be hit with the
  upstream kernel and that the series doesn't fix properly:
  Accessing the USB3 controller registers requires the USB PHY
  running, since it provides a clock. Re-initializing the PHY
  means there is a race-condition - if the system tries to access
  the USB3 controller in parallel to the re-init, the system will
  hang and/or fail with an SError. By keeping the clocks running
  and only asserting the resets this time is minimized by this
  series. A proper fix for this will be looked into independently
  from this series.
- I used v7.1-rc6 as base, but the driver has no changes since
  6.18 even in linux-next and there are no pending patches for
  it on the mailinglist either, so it applies to *any* recent
  kernel branch.

Changes in v4:
- Link to v3: https://lore.kernel.org/r/20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com
- rebased to v7.1-rc1 (no changes)
- Update DRM bridge registration patch to avoid registration when DP aux
  port is not connected to anything, since this results in errors and some
  boards use USBDP instances for USB3 only.
- Add patch renaming mode_change into phy_needs_reinit
- Add patch to re-init PHY on orientation change
- Add patch to factor out lane_mux_sel setup
- Add patch to handle mutex via guard functions

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com
- Add patch to register the USBDP PHY as DRM bridge
- Add patch to describe ports in DT binding (used by the DRM bridge)
- Add patch to drop HPD handling from the PHY

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com
- Added new patches to fix USB3 SError

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Frank Wang (1):
      phy: rockchip: usbdp: Amend SSC modulation deviation

Sebastian Reichel (13):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Update mode_change after error handling
      phy: rockchip: usbdp: Do not lose USB3 PHY status
      phy: rockchip: usbdp: Fix devm_clk_bulk_get_all check
      phy: rockchip: usbdp: Handle missing clock-names DT property gracefully
      phy: rockchip: usbdp: Drop seamless DP takeover
      phy: rockchip: usbdp: Keep clocks running on PHY re-init
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Limit DP lane count to muxed lanes
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function
      phy: rockchip: usbdp: Register DP aux bridge

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/phy-rockchip-usbdp.yaml           |  24 +++
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 183 +++++++++------------
 3 files changed, 104 insertions(+), 105 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

