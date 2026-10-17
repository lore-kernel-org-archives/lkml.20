Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094302DB78C;
	Sat, 17 Oct 2026 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224822; cv=none; b=DMrVGrdE+Y0snXfdJilxA7Ni+0CHGpuAFoPORbW9lUDqyaAjNCwTRii1h4+geXMaYmB1YGr4U5y99T/synbmBri1wV+UBuNO648ELH64lTyU+lc8vTRTimSI8UYtyGgTs/+jE8CQhB5cCiHuwULaXFeWDBT6BGuiRIs6mHAfTWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224822; c=relaxed/simple;
	bh=rG9XUPTQbMpvkVm4atpgpeX/R1CF3cIvZk+Art3/Uks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RcLI2HuoVZc+VUc6Xw/qMxrMc7eS/tUcsOFHmh46A+f0gedvCQf6n7Tt2X9y5RuIhCqZOZAY+iWJLqmO6GhJydY/j8wPUiuDdBE3QDBuGJlbi8Az+ltDel4o6Ptqn6H6vKr1EoKTp+KLR3YGHbwEk7ncCf358WgtyGdJrREfrho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=AlMIxwqC; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="AlMIxwqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=pXjj8p8Ag7
	UinF7wrisRm1hq4bTy/5tI4GQhjj3Cjr8=; b=AlMIxwqCLzRIdtdjVtpR8p8uTb
	LqjiJDXpye5/I8DR629O1+807AOBS3ZnuKSivNu2YD8FR58ZZBlAkX1b1GrZh/ql
	v/+YAkzcZQEALzehgTWUUazldCv1/nFpjHdAgYkLiusl4CkBWwN+kAKFEpKum/3M
	EG/+aM7xZi/p6gLDk=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.230.12])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBH1EggLtNqndoCAA--.2781S2;
	Sat, 17 Oct 2026 16:13:20 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] usb: dwc3: support two connectors sharing one HS data bus
Date: Sat, 17 Oct 2026 16:13:18 +0800
Message-ID: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgBH1EggLtNqndoCAA--.2781S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW5GF1rXFWkZw45uF4rKrg_yoWruw18pF
	W5KFZrKr4DtF9akwnrGr48A34rZw4kJ3s8Kryrtw1UGa15Gay8KFyaka45uFWUCrn3ta4j
	9rWjgr9FganrZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUqX_TUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rSe1QUgwBSsG

v1: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>

Changes in v2, following the review of v1:

- Drop "dt-bindings: usb: snps,dwc3: document usb-psy-name" entirely.
  Krzysztof is right: the property is not a DT convention -- a supply is
  referenced by a phandle, not by a name.  The driver does read the string
  (drivers/usb/dwc3/core.c: dwc3_vbus_draw_work() ->
  device_property_read_string(dwc->dev, "usb-psy-name", ...)), but that is a
  legacy/ACPI-shaped lookup that the board can avoid, so documenting it as a
  generic DWC3 binding property was the wrong call.  Nothing in this series
  needs it.  (For reference: on the affected board the same current limit is
  reachable through the standard "power-supplies" phandle on the connector,
  and I will follow up separately if a binding is really warranted.)

- binding: no longer touches usb-psy-name at all.  In v1 the patch that
  documented the property and the patch that described the mux raced in
  ordering, so the second patch read as deleting what the first one added.
  Krzysztof's "No, you just added it!" was a correct reading of that diff.

- driver: a failed GPIO write no longer aborts __dwc3_set_mode() half-way.
  Reported by sashiko-ai: the mode change tears down the previous host or
  gadget instance before programming the new role, so bailing out between the
  two left a torn-down role behind with a stale current_dr_role, and the next
  request would tear it down a second time (double free / use-after-free).

- driver: no more flush_work() on the freezable workqueue.  Reported by
  sashiko-ai: flushing system_freezable_wq from the role-switch path can
  deadlock against system suspend.  The mux now keeps exactly the same
  asynchronous semantics as the existing single-connector role switch --
  dwc3_set_mode() queues the work, __dwc3_set_mode() is the only place that
  programs hardware.

- driver: dropped the "mux_role" variable that was set but never used,
  reported by kernel test robot (arm-defconfig, clang, W=1).

- driver: "oldest request wins" is now actually implemented, with a
timestamp
  per connector taken at the USB_ROLE_NONE -> role transition.  v1 selected
  port 0 first, i.e. static priority, which contradicted its own commit
  message.  Reported by sashiko-ai.

- driver: the runtime-PM reference is no longer taken on a path that can
jump
  to the error label before the reference is acquired (sashiko-ai).

Konrad: to answer your question about the wiring -- this is a real board
topology, not a hub.  Lenovo Legion Y700 (4th gen, TB322FC, SM8750P) has
two
USB-C receptacles driven by a single dwc3 instance (a600000.usb).  The
Super
Speed pairs are not shared: each receptacle has its own SS PHY pair.  Only
the
High Speed D+/D- lines are routed through one 2:1 mux, selected by TLMM
GPIO
29, and each receptacle keeps its own Type-C PD/role input (both connectors
report data-role = "dual" through pmic-glink).  So the controller can be a
host on one receptacle while the other is charging-only, and plugging a
device
into the other receptacle has to be able to steal the controller.  Without
the
mux support, the second receptacle's role switch is simply not registered
and
nothing happens.

Relevant excerpt from the board DTS ("ports" endpoints carry the mux-state
level of their own connector):

  &usb {
          dr_mode = "otg";
          usb-role-switch;
          port-select-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
          ports {
                  port@0 {                /* long-edge receptacle */
                          reg = <0>;
                          usb_dwc3_hs: endpoint {
                                  remote-endpoint = <&pmic_glink_hs_in>;
                                  usb-role-switch;
                                  mux-state = <0>;
                          };
                  };
                  port@2 {                /* short-edge receptacle */
                          reg = <2>;
                          usb_dwc3_hs2: endpoint {
                                  remote-endpoint = <&pmic_glink_hs_c2_in>;
                                  usb-role-switch;
                                  mux-state = <1>;
                          };
                  };
          };
  };

Testing (all on the board, 7.3-rc7 based tree):
 - two receptacles: host mode on either receptacle works, and moving the
   cable from one to the other hands the controller over;
 - charging-only on one receptacle while the other has a device attached;
 - single-connector boards: the mux path is only taken when
   "port-select-gpios" is present, otherwise the existing role switch is used
   unchanged.

Qianhui Xu (2):
  dt-bindings: usb: snps,dwc3: describe the two-connector HS data path
  usb: dwc3: support two connectors sharing one HS data bus

 .../bindings/usb/snps,dwc3-common.yaml        |  63 +++++-
 drivers/usb/dwc3/core.c                       |  29 ++-
 drivers/usb/dwc3/core.h                       |  38 ++++
 drivers/usb/dwc3/debugfs.c                    |   4 +
 drivers/usb/dwc3/drd.c                        | 199 +++++++++++++++++-
 5 files changed, 330 insertions(+), 3 deletions(-)

-- 
2.53.0

