Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964516;
	b=rb3lQFIlRtbMEQOeQNqXhdaC/lIApZ/tfAm3f42CvqpvLfXQsW3TNdIHoQtxpdMIhgxl
	 DdK8IpYtMGXZEbEl7AyRyAhXHLAIYU+Qzcd8G1idzyYZCQOw5PAixmOCUtbFzvHnOBQGV
	 BvNjlzKG5eMxo09AttrIJCXydh8eJL5I5LFe2kE0PKejnoDtVQ2kq4/oc/d9j71Elf5Fn
	 ZmXGCFahS6JOGoh2U4P8vNJujGBuCdXjooHhk7k454g/S67pJzf3PwDaWjECb/63h1LjZ
	 TWoinWEwsbqBDMWrk4ra6VobTqt8m9dFuGRm1BneKcgmQSR/iAuVTYWiC7WCUi06NTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964516;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=FinBAtHMRWwLAn0AJyprJ9a2l/6W8bmPZj7Q1QcvOac=;
	b=L5smCH82FaP/HpQKstX4lm/ZJVKiXPoxTxXtAE9O2mjkF6KorvFsD4rBzZZBCjPaiTm8
	 6pcRnIMrhSi5agkHv46uPsS4nngMIBilvQOIhzWXe1sUPt14W3pIXlM417lOPoEUkgomD
	 kIRVjLjwdA9POHXtA51pWMp1AegAGDduoJ5rWMEYtzoplWQifQBC7MzQmbT+zdQogtzJ5
	 /TcZW+FHvbQ6mMfzday2B7LdOZ9BA8YIgDxUbf1O07nopC+bwvTM7E9n7aMowbbAJswjd
	 +EnxZJC30yEA3Z5ATQ/HrXeVj2ExML7eMfCEblY+69n3KG8mKqBwaYi3QWTHPQmVIYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=gaLoOWwZ;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944AD606A329;
	Fri,  6 Nov 2026 11:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944AD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=gaLoOWwZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=FinBAtHMRW
	wLAn0AJyprJ9a2l/6W8bmPZj7Q1QcvOac=; b=gaLoOWwZhRuuorfQwfePel/Ya8
	563Ooa2LXaQGNfdBMYt8taVXzQi++Cy9zxT5PX3IhX0fqNyWMXkoncro19Vlq0Vu
	h46e0SSZGXDXwRvrt3us3Nv1YcqvSfx/KF5r4z97umBNa/FxlB3n4Ugx+4Gy2KdN
	jOoFoMjsXMdpuCy2k=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.184.75])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3P0TLue1q1i6PAA--.473S2;
	Fri, 06 Nov 2026 19:28:12 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] usb: dwc3: two Type-C connectors sharing one HS data bus
Date: Fri,  6 Nov 2026 19:28:08 +0800
Message-ID: <20261106112811.963923-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgC3P0TLue1q1i6PAA--.473S2
X-Coremail-Antispam: 1UD129KBjvAXoW3CF1UuF1DuFW5KFW5CFy7Awb_yoW8Gw4fGo
	WSqw4F9w18tr1Y9F1vkFnrGrZxWFW09r43Zr1Uuws8JF4kXrW8Ga4fGw4DXFWfJF4F9FW5
	Zay8X39YkrW7tF95n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYn7k0a2IF6w4kM7kC6x804xWl14x267AKxVW8JVW5JwAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUqiFxDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rs2VhhrAAdsD

*** AI-assistance disclosure ***
This cover letter and the patches below were prepared with the help of an
LLM coding assistant.  The author reviewed every line, ran every gate
quoted in this letter himself, and takes full responsibility for the
content.

This is one complete, self-contained series of three patches: the binding,
the role-switch lookup it needs, and the DWC3 arbitration between the two
connectors.  Nothing is to be applied on top of it, and no patch of it is
posted separately.  It supersedes the v4 series
(<20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>), the v5 fixups
(<20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>) and the 11-04
posting (<20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>) in full:
their content is folded into the three patches below.  3/3 additionally
answers the two High findings of the review of the 11-04 posting.

Two connectors on one DWC3 controller
=====================================

The board (Lenovo Legion Y700 4th gen, SM8750) wires the Super Speed pairs
of two USB-C receptacles to separate PHYs, while the High Speed D+/D- pair
is shared through a 2:1 mux controlled by a single GPIO.  Both connectors
are data-role dual and hand their role to the SoC through pmic-glink, so
the controller has to arbitrate between two independent role requests and
move the shared data path before it is reinitialised.

	usb@a600000 {
		port-select-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;

		ports {
			port@0 {			/* HS path, connector 0 */
				endpoint {
					remote-endpoint = <&usb_0_dwc3_hs>;
					usb-role-switch;
					mux-state = <0>;
				};
			};

			port@1 {			/* Super Speed, QMP PHY */
			};

			port@2 {			/* HS path, connector 1 */
				endpoint {
					remote-endpoint = <&usb_1_dwc3_hs>;
					usb-role-switch;
					mux-state = <1>;
				};
			};
		};
	};

Series layout
=============

1/3 documents that wiring: "port-select-gpios", one High Speed port per
    connector (port@0 and port@2, port@1 being the Super Speed lane), and,
    on the endpoint of each of those ports, "mux-state" (the GPIO level
    that reaches that connector) and "usb-role-switch" (this connector has
    its own role-switch input).

2/3 adds usb_role_switch_at_endpoint(), so a role switch registered
    against an OF graph endpoint can be found by the consumer that owns
    the other end of that link.  Without it the endpoint registration in
    1/3 would have no lookup path.

3/3 implements the arbitration in DWC3: one role switch per connector, the
    oldest pending request wins, the GPIO is flipped inside
    __dwc3_set_mode() after the previous host or gadget instance is torn
    down, and a connector reads back the role it requested.

Reply to the two procedural comments
====================================

Krishna Kurapati wrote, on the v5 posting: "If v5 is being sent, it must
not to be applied on top of v4.  It must include (v4 + any additional
changes/improvements)."  Agreed, and that is what this series is.  v4
1/3..3/3 and the v5 fixups were squashed per patch instead of stacked:
1/3 = v4 1/3 + v5 1/2, 2/3 = v4 2/3 + the usb_role_switch_at_endpoint()
hunk of v5 2/2, 3/3 = v4 3/3 + the remaining hunks of v5 2/2.  Applying
this series to a v7.3-rc7 tree gives the same three source files as
"v4 + v5", and there is no "1/2 on top of 3/3" left anywhere.

Krzysztof Kozlowski wrote: "Anyway, this is misthreaded - missing rest of
patchset.  Please read submitting patches document and switch to b4", and
separately dropped v4 1/3 ("Unanswered Sashiko comments plus some
confusion with duplicated posting of v5 without the rest, dropping").

Both points are taken.  Posting v5 as a two-patch fixup and then re-sending
only its 1/2 on 11-02 was wrong: a series has to be complete and threaded.
This posting is the complete series as one thread -- cover plus 1/3..3/3,
"base-commit" at the bottom, and In-Reply-To pointing at this cover only,
so it applies with `b4 shazam` (or `git am`) as-is.  Nothing is re-sent
piecemeal; the 11-02 1/2 has no successor and should be ignored.  On the
"git log" remark: the per-revision account now lives only here, the commit
messages describe the code as it finally is.

Dropping v4 1/3 is fine: this 1/3 replaces it, together with the schema
holes that were reported against it.  No action is needed to "un-drop" it.

Response to the review comments folded into these patches
=========================================================

Sashiko on the binding (three Medium findings):

 - "hs-port patternProperties does not match what the driver expects /
   escapes unevaluatedProperties": fixed, the endpoint name pattern is the
   one graph.yaml uses, so an unnumbered endpoint or endpoint@2+ is
   validated too (1/3).

 - "usb-role-switch should not be required only indirectly": fixed, the
   controller node must carry "usb-role-switch" whenever port-select-gpios
   is present, and dr_mode is required to be "otg".  This is a driver
   fact, not schema cosmetics: without it dwc3_get_dr_mode() forces dr_mode
   back to peripheral, dwc3_get_extcon() skips the role-switch branch and
   dwc3_drd_init() never sets the mux up, so a DT that passed the old
   schema did not describe a DT the driver could act on (1/3).

 - "mux-state complementarity is not expressed": fixed, the pair is one
   oneOf over the two assignments, so two connectors both claiming
   mux-state = <1> are rejected (1/3).

 - standing question, "model the board mux with the standard
   mux-controls/mux-states properties": kept the graph-endpoint shape.  The
   arbitration is "earliest request wins" between two connectors that must
   each be a usb role switch consumer, and the endpoint is the fwnode the
   connector is attached to; a mux_control consumer has no per-connector
   identity to hang that on, and drivers/usb/ has no mux_control consumer
   to follow as precedent.  Happy to reshape if the DT maintainers prefer
   the standard property.

Sashiko on usb: roles (one High finding):

 - "-EPROBE_DEFER is swallowed by !IS_ERR_OR_NULL(sw)": fixed, the error is
   passed up, as suggested (2/3).  This was also the root cause we hit on
   real hardware: the UCSI glue kept a NULL switch and the connectors never
   bound.

Sashiko on usb: dwc3 (five High and three Medium findings):

 - "dwc3_set_mode() under dwc->lock self-deadlocks": fixed, the request
   decision and its issue are paired by mux->lock, and dwc->lock is only
   held while individual fields are updated (3/3).

 - "glue layer is never notified": fixed, dwc3_pre_set_role() is called
   with the effective role, outside spinlocks, before dwc3_set_mode(),
   mirroring the single-connector path (3/3).

 - "same-role request that moves the data path to the other connector":
   fixed, dwc3_set_prtcap() only clears SUSPHY when PRTCAP changes, so that
   case now clears it explicitly (3/3).

 - "registration earlier than the initial mode request races with a
   connector driver": fixed, register and request the initial mode under
   mux->lock, tear down in reverse order on failure (3/3).

 - "fwnode references leak on error paths": fixed, dwc->role_mux is
   published before the error paths that used to leak them, so
   dwc3_role_mux_exit() can unwind (3/3).

 - "sticky mux->error is reported to the next caller after it already
   committed its own request": fixed, the sticky value is gone; a failed
   data-path switch is logged and counted per connector (3/3).

 - found while testing on the board, same area: dwc3_mux_role_get()
   returned USB_ROLE_NONE for a connector that did not own the data path,
   which hid its pending request; the connector driver then never sent the
   set_role(USB_ROLE_NONE) that clears it, and the stale request kept
   winning arbitration after unplug.  get() now reports the requested role
   (3/3).

 - "add dwc3_pre_set_role()" (raised against v2): this is exactly what the
   folded code does now, both in the single-connector and the mux path.

Response to the review of the 11-04 posting
==========================================

Sashiko reported two High findings against 3/3 of the 11-04 posting.  Both
were real, both are fixed here, and the fixes are the only code change
relative to that posting.

 - "torn port and role state in dwc3_mux_role_set()": mux->desired_port was
   written under dwc->lock, the lock was dropped across
   dwc3_pre_set_role() (which may sleep), and dwc3_set_mode() re-took it to
   write dwc->desired_dr_role.  A mode worker already pending from an
   earlier request could therefore snapshot the new connector together with
   the old role, move the port-select GPIO and bring the controller up in
   the role of the previous request.  Fixed by publishing the connector and
   the mode request in one critical section: dwc3_set_mode_port() sets
   dwc->desired_dr_role and mux->desired_port under a single hold of
   dwc->lock, after dwc3_pre_set_role(), and __dwc3_set_mode() snapshots
   both under the same lock.  No window is left in which the pair can be
   observed half-updated, and the worker cannot start before the glue layer
   has been notified.  In the same area: a request that arrives while the
   worker is already running did not re-queue it, because queue_work()
   returns false for a running work item; the worker now compares its
   snapshot against the current request at the end of the run and re-queues
   itself, so the newest request is not lost.  A failed data-path switch is
   not retried, because the comparison is against the snapshot.

 - "race and reversed teardown order in dwc3_role_mux_init()": once port 0's
   switch was registered, a connector could call set() while the mux was
   still being set up.  On a failure while registering port 1, the error
   path unlocked mux->lock, ran cancel_work_sync() and only then
   unregistered that switch, so the call could queue the mode work after the
   drain and have it run on a half-torn-down mux; and dwc3_role_mux_exit()
   does not synchronise with mux->lock, so the same call could read
   dwc->role_mux after the error path had cleared it.  Fixed by refusing
   requests until the mux is fully set up, and by ordering the teardown:
   mux->ready is cleared under mux->lock (set() takes that lock for its whole
   duration, so no request is in flight once it is held), then the switches
   are unregistered, then the work is drained.  dwc->role_mux is no longer
   cleared at all: it is devm-managed, so clearing it could only turn a late
   request into a NULL dereference.  With mux->ready gating, a request that
   arrives during setup is refused with -ENODEV instead of racing with the
   initial mode request, so a failed setup has no host or gadget instance
   left to tear down either.

Changes relative to the previous postings
=========================================

 - 11-04 posting -> this series: 3 files changed, 92 insertions(+),
   11 deletions(-) in drivers/usb/dwc3/{core.c,core.h,drd.c}; 1/3 and 2/3
   are unchanged.  That is exactly the two High fixes above.
 - v4 1/3..3/3 -> this series: 5 files changed, 143 insertions(+),
   80 deletions(-) (binding 1/3 and core.c/core.h/drd.c/class.c), which
   is the folded v5 fixup plus one documentation fix: after the reshape to
   port@0 + port@2 the "port-select-gpios" description still said
   "a numbered endpoint of port@0"; it now names port@0/port@2 and their
   endpoint.  Description only, no schema change.
 - v5 1/2..2/2 -> this series: 3 lines of that description, nothing else;
   v5's code changes are bit-identical inside 1/3, 2/3 and 3/3.

Testing
=======

Mechanical, all re-run on this exact series:

 - checkpatch.pl --strict --patch - (mbox on stdin): 0 errors, 0 warnings,
   0 checks for each of the three patches (138 / 63 / 553 lines).
 - dt-doc-validate on snps,dwc3-common.yaml: clean, exit 0.
 - make W=1 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- for
   drivers/usb/dwc3/ and drivers/usb/roles/ with all 19 dwc3 glue drivers
   built as modules: 0 warnings, 0 errors.
 - git am of 1/3..3/3 on f66469d9905b (torvalds master, 2026-11-06): applies
   cleanly patch by patch, and the
   resulting tree is identical to the series tip.
 - scripts/check-series-selfcontained.sh on the series directory against
   the pristine base: PASS, 3/3 patches replayed in order.
 - git send-email --dry-run of the produced mbox set: 1 cover + 3 patches,
   threaded with In-Reply-To on the cover only.

Board behaviour: the same driver source runs on this board's daily kernel
and registers both per-connector switches
(a600000.usb-port0-role-switch, a600000.usb-port1-role-switch).  With
function_graph tracing, 12 consecutive plug/unplug cycles each went
usb_role_switch_set_role -> dwc3_mux_role_set -> glue notifier ->
dwc3_set_mode with zero WARNING/BUG/lockdep splats; USB data and charging
were stable throughout, and /sys/class/typec shows port0, port1 and a
bound partner.

Two honest limitations: (a) the arbitration detail -- which connector wins
a simultaneous request -- is verified by code reading and by the stale
request test above, not by a complete per-port role-value trace; (b) the
behaviour evidence comes from that daily kernel, not from a v7.3-rc7
kernel with this series applied, because pristine-lineage kernels do not
bring this board up yet for reasons unrelated to USB (no display/platform
support).  I can re-run the plug sequence on request.

Links
=====

11-04 posting: https://lore.kernel.org/linux-usb/20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn/
review of 11-04 (two High findings): <sashiko-outbox-196628@kernel.org>
v4: https://lore.kernel.org/linux-usb/20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn/
v5: https://lore.kernel.org/linux-usb/20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn/
Krishna's reply: <ba544091-1da4-4616-b1d5-fe23f32679d9@oss.qualcomm.com>
Krzysztof's reply: <20261102-armored-arcane-serval-43faf4@quoll>
v4 1/3 dropped: <20261102-screeching-utopian-avocet-492500@quoll>

Qianhui Xu (3):
  dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS
    bus
  usb: roles: look up role switches attached to a graph endpoint
  usb: dwc3: support two connectors sharing one HS data bus

 .../bindings/usb/snps,dwc3-common.yaml        | 116 ++++++-
 drivers/usb/dwc3/core.c                       |  93 +++++-
 drivers/usb/dwc3/core.h                       |  43 +++
 drivers/usb/dwc3/debugfs.c                    |   4 +
 drivers/usb/dwc3/drd.c                        | 287 +++++++++++++++++-
 drivers/usb/roles/class.c                     |  45 +++
 6 files changed, 583 insertions(+), 5 deletions(-)


base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1

