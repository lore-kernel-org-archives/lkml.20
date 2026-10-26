Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017943;
	b=shWEg/wmhBjWABIHMOjtmAQe+m+DKPsOq5sSn2EZXdO2DTZ7egaG65AYVV3vzu5pCWuD
	 nc+HdVpBPjW3FUxcnItVBOQAq3yVUro3Jbtqzlpbf5wgwXPkQNanMxPVWoqZeiEywm/gr
	 3vLw51vUto8AWzFIpIxWUD6JojDxkdgXVZ/3ct1q8jFVY6yJ+OtcFPoTDd3F3U9aTn9W9
	 rOMi1WVo5xQbpJiYiSY2xk5TktGm5Q/2GEyOSnWwFaxNeojCDQ9Ty//JF2lu5lK9e6Kav
	 VAQ45dFojayjNZ3r9SjBg7cNg7LhZQ2ffrPIu9nNaExWR968AQC6pCiqArbAVs8h+YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017943;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=eE+mAnccoZlpRV2O2QPZrFGyqZNPvDf72mKjaCgbXNM=;
	b=1GgfWTm/wd07/tpsEXCRlG+ziE3p5cjzU0RY6CrBh8BMNJsz6FWuYqofNz/9eS7HekPv
	 T2paSZhyKx2hECbsRmmkRdmxoVftGD7HbINNkF7x1b80JNdzijOnYT8AZhIzoyHogeQkF
	 sp0WMcNEQQPleF7lBilK9xD0AjU6Dg5M5oq3pSXC50sekg/rw8CJ/Pt+uuNYX9ltgmPYa
	 azQu+D22YDzpszaPkSJtK2ali78xSO5pKrPDSGx5R59oMP1JFue6olLVQW2K7VhSxQo79
	 GXWHpkiXrC31UUOMnHCt+4ZCYCkh73Q2TwsayzeZUk0zO3TK6SGTpZ1F1qn7jEkSjIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qpwe8xUX;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A884560A2609;
	Mon, 26 Oct 2026 12:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A884560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=qpwe8xUX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=eE+mAnccoZ
	lpRV2O2QPZrFGyqZNPvDf72mKjaCgbXNM=; b=qpwe8xUXHxJ1MDb/Csuq5W3PV6
	lKdUsCZ0v51B9n95EhpcKjK1lzl3IDcsl9Avvxd5elTGGEwrzZo/H7f8OI/rrWh1
	ZKKeL0B6L66EHY2h8eM8iT2UqrMdLzFbDlvAqq3QRMRGid0FKLY7FFWPOJHXCGBT
	JiQv7SI31kL9QJg7o=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHATZLSN9qClRJAA--.2459S2;
	Mon, 26 Oct 2026 20:32:12 +0800 (CST)
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
Subject: [PATCH v4 0/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Mon, 26 Oct 2026 20:32:08 +0800
Message-ID: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCHATZLSN9qClRJAA--.2459S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WF4rCrWUtF13uFyDur43trb_yoWxZF4xpF
	Z8K3ySyr4kJrySkwn29a18C34rCFs3Ar9rJry8Jw1UCa15G3ykXryjkw1ava4UCr93AryY
	vrn8W397W3W7u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU56yI5UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREMB2reWNVnoAAKsv

This is a formal submission, not an RFC: it supersedes the two-patch v2
series (<20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>) and the
shape-only v3 RFC (<20261019131848.344689-1-xiaqinghuan@mail.ustc.edu.cn>),
and it contains the driver that uses the binding it describes.  Sorry for the confusion caused by sending v3 as an
RFC threaded under v2; the intent was to settle the binding shape first,
but that is not how it should have been posted.  The series is complete
below, with the disposition of every review comment listed.

Two connectors on one DWC3 controller
=====================================

The board (Lenovo Legion Y700 Gen4, SM8750) wires the Super Speed pairs of
two USB-C receptacles to separate PHYs, while the High Speed D+/D- pair is
shared through a 2:1 mux controlled by a single GPIO:

	usb@a600000 {
		port-select-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				#address-cells = <1>;
				#size-cells = <0>;

				endpoint@0 {
					reg = <0>;
					remote-endpoint = <&usb_0_dwc3_hs>;
					usb-role-switch;
					mux-state = <0>;
				};

				endpoint@1 {
					reg = <1>;
					remote-endpoint = <&usb_1_dwc3_hs>;
					usb-role-switch;
					mux-state = <1>;
				};
			};

			port@1 {
				/* Super Speed of connector 0, separate PHY */
			};

			port@2 {
				/* Super Speed of connector 1, separate PHY */
			};
		};
	};

Both connectors are data-role dual and hand their role to the SoC through
pmic-glink, so the controller has to arbitrate between two independent role
requests and move the shared data path before it is reinitialised.

Series layout
=============

1/3 documents the two-connector HS data path: "port-select-gpios" plus two
    numbered endpoints of "port@0" carrying "mux-state" (which GPIO level
    connects that connector) and "usb-role-switch" (this connector has its
    own role-switch input).

2/3 adds usb_role_switch_at_endpoint(), so a role switch registered against
    an OF graph endpoint can be found by the consumer that owns the other
    end of that link.  Without it the endpoint registration in 1/3 would
    have no lookup path.

3/3 implements the arbitration in DWC3: one role switch per connector, the
    oldest pending request wins, the GPIO is flipped inside __dwc3_set_mode()
    after the previous host/gadget instance is torn down, and a connector
    only reports a role while it owns the data path.

Disposition of the review comments
==================================

sashiko, binding (v2 1/2):

 - "model the board mux with the standard mux subsystem": not adopted.
   drivers/usb/ has no mux_control consumer, mux only selects a channel and
   cannot express "oldest requester wins" role arbitration, and gpio-mux
   drives its idle level at probe, which would override the selection left
   by the bootloader.  The mux is therefore described where it is used, as
   a GPIO plus per-endpoint level.

 - "port@2 models the second connector as a controller bus": fixed.
   The second connector is now endpoint@1 of port@0, so "ports" keeps
   describing the controller's own buses.

 - "usb-role-switch does not belong on a graph endpoint": kept, but the
   missing lookup path is fixed by 2/3 instead of relying on a downstream
   only helper.

 - "conditionals do not require ports": fixed, "ports" and "port@0" are
   required when "port-select-gpios" is present, and the endpoint
   properties are rejected when it is absent.

 - "two ports may carry the same mux-state": fixed, the values are
   constrained to be complementary.

sashiko, driver (v2 2/2):

 - Critical, "the init error path leaves drd_work queued": fixed.
   Both switches are now registered before the initial dwc3_set_mode(),
   and the error path cancels the queued role work.

 - High, "dwc3_set_mode() is called after dropping the lock": fixed.
   The request order and the resulting mode request are taken in one
   critical section; dwc3_set_mode() only queues work, so holding the mux
   lock across it is safe.

 - High, "an in-place role swap overwrites the request timestamp": fixed.
   A request ticket is only taken on a NONE -> role transition, so a
   connector that is already using the bus cannot steal it.

 - High, "registering on the endpoint breaks the lookup": addressed by 2/3.

 - Medium, "fwnode leak on the error path": fixed, the endpoint reference
   is dropped on every exit path.

 - Medium, "error and desired_role are never read": fixed, desired_role is
   gone and the sticky mux error is reported to the connector on its next
   role request.

 - Medium, "add dwc3_pre_set_role()": not adopted in this series; the role
   is set from the same place as the single-connector switch, and adding a
   second entry point would duplicate that path.  If you prefer the helper,
   I will restructure the series that way.

Testing
=======

Mechanical, re-run on v4:

 - checkpatch --strict: 0 errors, 0 warnings, 0 checks on all three patches.
 - dt-doc-validate on snps,dwc3-common.yaml: clean.
 - W=1 compiles clean for drivers/usb/dwc3/ and drivers/usb/roles/.
 - Full arm64 Image.gz + dtbs build of a v7.3-rc7 tree with the series
   applied.

Board behaviour: this board's daily kernel carries this series, and it
registers both per-connector switches, visible as
a600000.usb-port0-role-switch and a600000.usb-port1-role-switch.  In the
earlier revisions the mux logic was exercised plug-by-plug: host mode on
either receptacle, moving the cable from one receptacle to the other hands
the controller over, and a charging-only connector next to an active one
does not disturb it.

The v4 changes are the review fixes listed above: registering the switches
before the initial mode request, taking the request order and the mode
request in one critical section, ticket handling on NONE -> role only, the
monotonic counter instead of jiffies, and dropping the unused field.  Those
were reviewed and built but not re-exercised plug-by-plug, because the
author's test setup talks to this board through the very USB link being
switched; I would rather say that than claim a test I did not run.  I can
re-test on request if a maintainer wants the swap sequence confirmed before
this goes in.

Qianhui Xu (3):
  dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus
  usb: roles: look up role switches attached to a graph endpoint
  usb: dwc3: support two connectors sharing one HS data bus


Qianhui Xu (3):
  dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS
    bus
  usb: roles: look up role switches attached to a graph endpoint
  usb: dwc3: support two connectors sharing one HS data bus

 .../bindings/usb/snps,dwc3-common.yaml        | 109 ++++++++-
 drivers/usb/dwc3/core.c                       |  29 ++-
 drivers/usb/dwc3/core.h                       |  39 ++++
 drivers/usb/dwc3/debugfs.c                    |   4 +
 drivers/usb/dwc3/drd.c                        | 219 +++++++++++++++++-
 drivers/usb/roles/class.c                     |  40 ++++
 6 files changed, 437 insertions(+), 3 deletions(-)

-- 
2.53.0

