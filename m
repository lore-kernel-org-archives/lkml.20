Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793458934;
	b=hbWbm9KdcWDsjn0KeKzLEkYY9X2rG4tOfAfMI0giQE0NSqQTrhhQp+DoKz6igh9z9D2x
	 r9wF/ANrEX6kT0nbEXrw/DD+uomzsjnjmvKjAaPJXAcKNiJ7o/mYf1ooC62XNXgt0yPub
	 d8YOKa/630V3W6GkX3jO5OEsdXTybCIE42oB6gyHOj345rq9y1VoJjWrMRpmUERnMlNKS
	 6ZOAyfFlEN/sGMiA0UsE7yFK8BoHqKl3k+aVwKwvNavNftxNxGS/BcsQKai4//jOe3+1u
	 wjGRrYPBgWACUYfp5/tcyaa8snhK15N6dHhS9si0zErIBqsR9nLoMQPfeVk690Wuo5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793458934;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=nnXs9/jiLDJivYH/VI0f8ccm4hA2wr7h1eXD5kdk5yo=;
	b=4q+DKN1uld2G75ZoPJ6DJHaUeu6dwMkR6dN2dVVP6OCbdlgVlJ8OwUTGj3Lo/+LJtyK3
	 +ZwRazu8Qg13HHV+RAQQy6Ue6oGNjEHBxJBpg5SEG+/nSWyrEWPt7Q+0BCt8EUM6y2R2P
	 Mz8xwMMToG/cgOcZOT5rA6JKQrHwUlOGwlPQjoTWhZUK6AJKkSI3+t7uAnaZw4hz2HL2K
	 k0IASTJXBDHkDne5pPchDm6UZ2LM63b4Xu8pzLDzxWm0LRQBGX2DpqSx/OZRmeXG7iWhX
	 jFq76qsJ6oFOEuNJzHprHYHTVJ7TVNyPa7At52YZbGL03RRjoCAGuSP2vFprF8X/MpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=UusYf9a+;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A12606A31E;
	Sat, 31 Oct 2026 15:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=UusYf9a+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=nnXs9/jiLD
	JivYH/VI0f8ccm4hA2wr7h1eXD5kdk5yo=; b=UusYf9a+Xh3tjomJv5gL5ujEDy
	0bycsLer7E38ogQl98sN4pRLWzCx5gM0lVtnLj8gg/7bRlsQBkWpdp+320rVw2Ls
	tCB4+QxJUhsx91LfPN1fOmDKLcNx0rfnRdfr3S4iHKpJJjcovZSyv/ixf3oT3L1G
	srlvxZ5dzJM5FE7k0=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3uDziAuZqpyJvAA--.1475S2;
	Sat, 31 Oct 2026 23:01:55 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] usb: dwc3: fixes for two connectors sharing one HS bus
Date: Sat, 31 Oct 2026 23:01:52 +0800
Message-ID: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3uDziAuZqpyJvAA--.1475S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtFW8Kw4DAFyrtF45JFyUGFg_yoWxtw1rpF
	WaqrZ2yr1DJrZa9ws7Aa18ua48uws3GFW7Jr45Ww15CF45Cr40qFWUK3W5Za47CFZag342
	9rn0grZ8WFnrKw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxkIecxEwVAFwVW5WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUyFoXUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARERB2rk8FYreQAysO

*** AI-assistance disclosure ***
This cover letter and the accompanying patches were prepared with the help
of an LLM coding assistant; the author reviewed, tested and takes full
responsibility for the content. All measurements cited below come from real
hardware runs and are reproducible with the commands referenced in our
public reports.

Greetings,

This is v5.  It is a fixup series that applies *on top of* v4 [1] -- it
does not replace v4 1/3..3/3, it fixes them in place:

  - 1/2 tightens the binding of v4 1/3 (snps,dwc3-common.yaml),
  - 2/2 fixes the driver of v4 3/3 (usb: dwc3: support two connectors
    sharing one HS data bus) and also corrects
    usb_role_switch_at_endpoint() introduced by v4 2/3.

Base: v4 3/3 (fd69bd54e328, "usb: dwc3: support two connectors sharing
one HS data bus").  Please apply v4 1/3..3/3 from lore [1] before this
series; the `base-commit:` trailer in this posting is informational only,
since it names a commit that is not in any public tree yet.

Hardware: Lenovo Legion Y700 (4th gen) tablet, SM8750.  Both High Speed
connectors share one DWC3 controller; a port-select GPIO picks which
connector owns the bus, and each connector has its own typec port with its
own role switch, described per graph endpoint.

Changes since v4 (all points are replies to the automated review by
Sashiko [2][3][4]; no human maintainer replied in the v4 thread yet):

Binding (Sashiko on v4 1/3, three Medium findings [2]):

  * "hs-port patternProperties does not match what the driver expects /
    escapes unevaluatedProperties".  Fixed: the endpoint name pattern is
    now the same one graph.yaml uses, so an unnumbered endpoint or
    endpoint@2+ is validated too instead of silently escaping the
    unevaluatedProperties: false rule (v5 1/2).

  * "usb-role-switch should not be required only indirectly".  Fixed: the
    controller node must now carry "usb-role-switch" whenever
    port-select-gpios is present.  This is a driver-fact fix, not just
    schema cosmetics: without that property dwc3_get_dr_mode() forces
    dr_mode back to peripheral and dwc3_drd_init() never runs, so a DT
    that passed the old schema did not describe a DT the driver could act
    on (v5 1/2).

  * "mux-state complementarity is not expressed".  Fixed: the two
    independent `if: const: 0` blocks only rejected two zeroes; two
    endpoints both claiming mux-state = <1> passed validation.  The pair
    is now a single oneOf so exactly one assignment is accepted (v5 1/2).

  * On the standing question whether this should use the standard
    mux-controls/mux-states properties instead of per-endpoint role
    switches: kept the graph-endpoint shape for now.  Reason: the
    arbitration is "earliest request wins" between two *typec connectors*
    that must each be a usb role switch consumer, and the endpoint is the
    fwnode the connector is attached to; a mux-control consumer does not
    give us that per-connector identity.  drivers/usb/ has no
    mux_control consumer today to follow as precedent.  Happy to reshape
    if the DT maintainers prefer the standard property.

usb: roles (Sashiko on v4 2/3, one High finding [3]):

  * "-EPROBE_DEFER is swallowed by !IS_ERR_OR_NULL(sw)".  Fixed: pass the
    error up, as suggested (v5 2/2, last hunk).  This was also the root
    cause we hit on real hardware: the UCSI glue kept a NULL switch and
    the connectors never bound.

usb: dwc3 (Sashiko on v4 3/3, five High + three Medium findings [4]):

  * "dwc3_set_mode() under dwc->lock self-deadlocks".  Fixed: request
    decision and issue are now paired by mux->lock; dwc->lock is only held
    while updating the individual fields (v5 2/2).

  * "glue layer is never notified".  Fixed: dwc3_pre_set_role() is called
    with the effective role, outside spinlocks, before dwc3_set_mode(),
    mirroring the single-connector path (v5 2/2).

  * "same-role request that moves the data path to the other connector".
    Fixed: dwc3_set_prtcap() only clears SUSPHY when PRTCAP changes, so
    that case now clears it explicitly (v5 2/2).

  * "registration earlier than the initial mode request races with a
    connector driver".  Fixed: register and request the initial mode under
    mux->lock, tear down in reverse order on failure (v5 2/2).

  * "fwnode references leak on error paths".  Fixed: dwc->role_mux is
    published before the error paths that used to leak the endpoint
    fwnodes, so dwc3_role_mux_exit() can actually unwind (v5 2/2).

  * "sticky mux->error is reported to the next caller after it already
    committed its own request".  Fixed: the sticky value is dropped; a
    failed data-path switch is logged and counted per connector (v5 2/2).

  * (found during on-device testing, same area) dwc3_mux_role_get()
    returned USB_ROLE_NONE for a connector that did not own the data path,
    hiding its pending request; the connector driver then never sent the
    set_role(NONE) that would clear it, and the stale request kept winning
    arbitration after unplug.  get() now reports the requested role
    (v5 2/2).

Test evidence (all on the SM8750 tablet, kernel built from this series):

  - `git am --3way` of the whole series on top of v4 3/3 succeeds;
    checkpatch --strict reports 0 errors / 0 warnings / 0 checks for both
    patches.
  - `dt-doc-validate` on snps,dwc3-common.yaml: clean.
  - `make W=1 drivers/usb/dwc3/ drivers/usb/roles/` (arm64): 0 warnings.
  - On device: after the -EPROBE_DEFER fix, /sys/class/typec shows port0,
    port1 and a bound partner; with function_graph tracing, 12 consecutive
    plug/unplug cycles each went usb_role_switch_set_role ->
    dwc3_mux_role_set [dwc3] -> glue notifier -> dwc3_set_mode with zero
    WARNING/BUG/lockdep splats, USB data and charging both stable
    throughout.
  - The binding topology (two HS connectors on port@0 and port@2 of the
    controller's port node, one endpoint each, mux-state on the endpoint)
    matches what the board DTS uses; port@1 is occupied by the SuperSpeed
    path to the QMP PHY, which is why the two HS connectors are not
    siblings under one port.

Known limitation, stated up front: the role *arbitration* detail (which
connector wins a simultaneous request) is verified only by code reading and
the stale-request test above; a dedicated per-port role-value trace is
instrumented but its data set is not yet complete.  Everything else listed
above has been exercised on hardware.

Thanks,
Qianhui Xu

[1] v4: https://lore.kernel.org/linux-usb/20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn/
[2] Sashiko on v4 1/3: <sashiko-outbox-185247@kernel.org>
[3] Sashiko on v4 2/3: <sashiko-outbox-185254@kernel.org>
[4] Sashiko on v4 3/3: <sashiko-outbox-185299@kernel.org>

Qianhui Xu (2):
  dt-bindings: usb: snps,dwc3: tighten the two-connector shared HS bus
  usb: dwc3: fix the two-connector shared HS bus role handling

 .../bindings/usb/snps,dwc3-common.yaml        | 105 +++++++++---------
 drivers/usb/dwc3/core.c                       |  36 ++++--
 drivers/usb/dwc3/core.h                       |   4 +-
 drivers/usb/dwc3/drd.c                        |  65 ++++++++---
 drivers/usb/roles/class.c                     |   7 +-
 5 files changed, 140 insertions(+), 77 deletions(-)


base-commit: fd69bd54e328c407b1853378b25d15803d3453fa
-- 
2.53.0

