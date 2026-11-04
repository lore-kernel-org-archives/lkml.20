Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762839;
	b=hFO08pfSUOUHhU4cAExQ0h8gyHcRd08Nv5+SwFepeL734GHOHY2EUld46zuQz35ZjjxI
	 TNmKrTHdUoTfyAaPecQe7vQ8W5XOTCM3+7HHHUWDVOPSbPYye6jh85oRkMd8a5xNnn3iu
	 5uxZ6o8h0qQ+V6culDUomIWznmsr0MJGXkQ9TMk2PZ/rAQExe6g1aOqwnoiGwVH1w/Rmg
	 D1WsRYkeC8cpONNDA7kRUzpklcfczjgbdnBzBQPhg9r4Kevx8zzuoiOMzD38dNB0/R4yQ
	 RPDUlJc8QvaxdiIgwjKCi4Kh4HwvR2+/gU/egXjtpSZOARNjwMxHREtsFzPhk9pE42Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762839;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=lz98PLnnqo7/+DiU9yT72mkPbPkl9TSUGzJY9dI8TPs=;
	b=e0rcY1POHVcw7aadrC1H8aqTzRtPJt+i3A5mYw1YGwrCAiHo7K/WflRTI17J1Jc45Wyw
	 3bHUahSRwmGhylddgzkUIjMN40MaB4q1gVsXKKfAoOyx46dO4yX+aujCjAwqVGNbzKu7v
	 oWEFV/zx8XtTqmbg7U9A1MyaANcGKorxfOi1+B8AQsbYL6lvu421ZdQBGE6xiJYxBW6WW
	 arR7lH8zEM19aw1nC/ejOvU4TGkAuxqxMSMbi949FIKA70K5vgDonNdO2O9wxLweq1dhY
	 Vq+tOiDUZ4nwCraQPmqel5VCVUoGCnQ0lhkJU9J90ejKj+SOuUYuTZYvp7hCbxcmoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=uz882CMV;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61EB606A33C;
	Wed,  4 Nov 2026 03:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61EB606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=uz882CMV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=lz98PLnnqo
	7/+DiU9yT72mkPbPkl9TSUGzJY9dI8TPs=; b=uz882CMV0sPgPmZUPl/Ey29a8q
	Vkgw4ycBZuA4xywy29qswdrvUxQUbkf8gQVyboLRaj0ptoTsSLDi+Fq9FI8sKLjY
	GhY6bwY0qrvXahkn1koFVhx71ii7X9aSSyWqSM8cUThix4SRfAh7gBiyjuNGLcSf
	9mUyjE/tzSNmbfMj0=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.194.56])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3eT4KpupqijSAAA--.137S2;
	Wed, 04 Nov 2026 11:27:06 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: dwc3: two Type-C connectors sharing one HS data bus
Date: Wed,  4 Nov 2026 11:27:03 +0800
Message-ID: <20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgD3eT4KpupqijSAAA--.137S2
X-Coremail-Antispam: 1UD129KBjvJXoW3CF1UuF1DuFW5KFW5CFy7Awb_yoWkXrW7pF
	Z8KrZ3tr4DJr93Aws7AF18G348u393GFy5Jr1ftw1UCa15Gr40qFWxKw1Y9FW7CrZ3urya
	9ry5W3s7W3WUu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUg6V1UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2rqNlcjBwAjsw

*** AI-assistance disclosure ***
This cover letter and the patches below were prepared with the help of an
LLM coding assistant.  The author reviewed every line, ran every gate
quoted in this letter himself, and takes full responsibility for the
content.

This is one complete, self-contained series of three patches: the binding,
the role-switch lookup it needs, and the DWC3 arbitration between the two
connectors.  Nothing is to be applied on top of it, and no patch of it is
posted separately.  It supersedes the v4 series
(<20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>) and the v5
fixups (<20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>) in
full: their content is folded into the three patches below.

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

Changes relative to the previous postings
=========================================

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
   0 checks for each of the three patches (138 / 63 / 441 lines).
 - dt-doc-validate on snps,dwc3-common.yaml: clean, exit 0.
 - make W=1 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- for
   drivers/usb/dwc3/ and drivers/usb/roles/ with all 19 dwc3 glue drivers
   built as modules: 0 warnings, 0 errors.
 - git am of 1/3..3/3 on 24a19b953e: applies cleanly patch by patch, and the
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

 .../bindings/usb/snps,dwc3-common.yaml        | 116 +++++++-
 drivers/usb/dwc3/core.c                       |  47 +++-
 drivers/usb/dwc3/core.h                       |  39 +++
 drivers/usb/dwc3/debugfs.c                    |   4 +
 drivers/usb/dwc3/drd.c                        | 254 +++++++++++++++++-
 drivers/usb/roles/class.c                     |  45 ++++
 6 files changed, 501 insertions(+), 4 deletions(-)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

