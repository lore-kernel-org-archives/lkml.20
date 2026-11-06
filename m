Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979914;
	b=12ftvkWkUJ5hoKZ0/E6EAQx/JhQSuOFZn+OWNMG6aPjZUTiqo2dJdyCH4BynC/iHA0lO
	 dzt+U/zMjyJSU4d39HwUWv5VWenu5z2m4Cmvo9PW4fGfqoeO8jPaAbcTmdVM/OXC9YVxs
	 +vg2fUdwbmEcGA9/G75FOY3T2QpJtoo9h+DwGadGcLraN8hZ/rE3FHhHeN3j1hAS+Am/h
	 ekvsFcvAe5vu0+gLJ87qAYL1FKagDxvEeg0siNooWpd3OiJl/gmxvNxh18By4fqOHQQYt
	 5h5G3Ry5Ah3CFUyyG/cVRF3+L8/1q0+20XHMojkbio7+JFJsF9nBdEGLkpDHW4uTXHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979914;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UfVaTeZgwrDZ0aQc6AST8BOEbqRkH0zX7Dg9zJwiP04=;
	b=e/uSqeMGfOJRGMOBfn1Uyf+DUVDF8ok+ikCiUxtYDLVH6AOXMRrZS5MBJ2V2o8qh4lbs
	 1vPeVON94j1rXktRQ6ihFAxRwuVgx+jnmHW/IxsjMsdkI6wfdnG1Glp1qffrU5iTkdjPD
	 heH+fXl8Buij8LR6VMmztot7qe4wtVdYRTEaWCAOdWZsEOVGSp/RWxmQOzcM5Ep4gQgFz
	 eB77/brWopvl8wWKtFgozVDSjImSKBx0ZxjVtQKw+V9sAhdp6fWD+tpeeKdsYOOH+V18H
	 g6JAtQeE1B4tuTRzpnt778C5FyNWxS8cQHORARgiLjVkZQ6qi1MvxBjgNVi89ywIU3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=omelia.org;
	spf=pass smtp.mailfrom=omelia.org;
	dkim=pass header.d=omelia.org header.i=@omelia.org header.a=rsa-sha256 header.s=fm2 header.b=IdwMvvHN;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=F0vg7xhW;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CD7606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13CD7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omelia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omelia.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=omelia.org header.i=@omelia.org header.a=rsa-sha256 header.s=fm2 header.b=IdwMvvHN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=F0vg7xhW
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3451314000B5
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:45:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 06 Nov 2026 10:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=omelia.org; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1793979913; x=1794066313; bh=UfVaTeZgwrDZ0aQc6AST8
	BOEbqRkH0zX7Dg9zJwiP04=; b=IdwMvvHNZ5slloVBjsiE05YrhXqaIj6aMo8Nn
	LZ9EgI9gnKJcHwmV0hJ4KVNCFVVOjxllInfFEd+VLBZdb+Ya+UTr5fZSRfK0MrM1
	yGT4rxGQsRgJnPxpBUfgk1ZTeykI45KksDG8MWuXCf7X+QO5yfsTh+gFzYrbLiuL
	EdYzw9TzKxeMeSf7yBvwm65da3slF4JWiIP98a68liZZkQv07L2YL/CF4sIQTpts
	yFoa9wFtAwJ73KTgBR2AysodrxFtuIeFj2Kly/w6NbfN4U48Wec0HnUSnfThkyjQ
	A2ruNdfhc5bKjXlV8UFTOuWRyV+PmIQC73b4LMj/v9zxZUTLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793979913; x=1794066313; bh=UfVaTeZgwrDZ0aQc6AST8BOEbqRkH0zX7Dg
	9zJwiP04=; b=F0vg7xhWULkwVFuwK1/Xoc86TF+mt7G+RuOa2cQE+RIyfNqOdVM
	FNGlsvsR1XRuK08JStWEpVN9nT1ivUbnI4OdEgGttNtLQLKUOCDUnCg+bGv3fJFj
	PWUrOv7YbcoLlqiajNJRDgbMCQ+2w6DK3s7ceWet1btfY229+1LLHcmHeBPcyRLQ
	tqmDFBlv5BSJ7iW0d1wbpFhQ9fF+inJOSAhSHvL0Q6ToaistmLKRs2iRj8GYqwAc
	ogPDkYJCBhanUjBl3b/MY9hDO1dQF3zNHWdU28N0+PYA9ey7AGalDq9Fmzs5NQOW
	GRQ+Vw0PzI2k60aBCJOneF4lEgeAlh4RPAQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=omelia.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793979913; d=omelia.org;
	mf=PGR1ZmZAb21lbGlhLm9yZz4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:O1erfShD9fRUG8QeKIbv2UAGGRLj9OFnf/KuesgAjcOt8OH
	ofm5cpELzH0OkQV1/ozkVFU9D0p46WXfSnDwkoT0SvSidaq0ThwGClHwQC6bs7qO
	TIZb8dhOJ0qZNnATWmUB+yra6d9EZt7HWzh1uaj2InGNva9TZm8t91ufUFTn/9ER
	6HC4HFgz7XXukNUvyga6Ml3y0gquZNvs5y6n8Y6qSHvUz8j/gKOoOmoeZBxATLbx
	oSLR72rro7n3++BLHvjfwjRvu+H8QJawLYCio6WYJO/+QxSKQVVmptDzpOEojyJN
	b/lu5pK9hV2xU3k9qiefQWGNqhwX3mcX4VrapmQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:y194TR9nmW7eWiRcNZlulredUfvED7lV/yt0Pr89vVk=:cU6pyVB2UT6CkMtXrHzDRcNy3Z29vHIDqsoig9ImhGc=;
X-ME-Sender: <xms:CPbtatz_8s01MKFrr37n1jQG5IWhyZXUHWcJ5jSEXMcNVjAM9_RCMQ>
    <xme:CPbtat8G1jfIQswtbZbJsm0vdZq2zI15BjTz_ZHd8fZ_ssK4Lk24g02QhrwThTx8l
    C14VtE2x5_ckrxEOwsu-dXLFuiMBTD_fu_lfBXDz60-ROAS8mwrUPE>
X-ME-Received: <xmr:CPbtalgblg-62Ln9e23t3FIdFMq-9AoHUTZT64acyhfmV-GDcfFMWwNAfW7qyHczC59sjilo9opGc-uNDLtvhvuOjrCh>
X-ME-Proxy-Cause: dmFkZTF1OV6dARfuGGKOPJMlxJMnyWlpDHPt00PfnwnC/nPg8o5NeFiAoIL7+maqTBZD++
    zXaqOquTX4XUqvPDpDcxdVPAjlc1ahjfbKzKFvQ5wjqLA3kN6FVhuM7k9y8NVY4ut6yDFd
    FsY00XVPFArVAqgmi+DjzrJGKOLFNdcCa6E2Fb0uuokbREzX9GkgkoDaZQqHgvi2dBLFsa
    NMPpHZAxes6Cppda2TxnWT5e1beXhvzeKeaxe5SyGJwrlc4+fsNBTVgh8c3SKFS0hLlELC
    V3GMztTYHRLvqGd8Z/kSpWf1INpjC+Cs42znh2rOCafyPnnP4PVaEevgeC91zXS6QNpDcb
    M9CWEJMqWcy9bZHZBYXvGxMeZQp5IY2xUnXlwTP4scKqYKbRTbtxnUpvGrm0SXI7DMph0v
    oQTZX+/ewooO071MLRA+gh3k12YHuDGprA5XDvMCDmLYrIYpO6lXqbfwHR2x1q4EeuhXc7
    BryVGcjQ7HmPZdVqEdyREk3C+y0DS1sCMH4Jnr+xFkE1zDHqieSYBCV6FnZtgz8dyU7PV2
    zHpFC9WKKh+mAP4W2b4Sataqd9h7puPTfH8ZsBXKHwPylSgiCEH7DEkjNrodL9YNmLrGPa
    0iJqD4k9Ngi/BBQcDitjo35pUtMLsI4KOWQ2PqF2I2+wDY9brlZYqLxp+IJg
X-ME-Proxy: <xmx:CPbtakEU6Fb6SjAidZnTAfV0iE5_qsp07gHeuqH_r2tkisABg9c-gw>
    <xmx:CPbtak9hyQClrXfwKX84nL0D9GBZ7GVCpAfBA7iEAd9asPRYAO_CWw>
    <xmx:CPbtarxjaAgA3mHketqpdLView39waKf_ciRzXtz9yt6jR2h2iF9Uw>
    <xmx:CPbtagMd6uqMounVRCHcmPcCYnIBYXAx6mTLEp0PtL0TAoDqvGyXiA>
    <xmx:CfbtapSvRZf8gxs_bg2AHAIbzq-WtVk8IWzO_WcG_Zp5ajDKiFXBCNLk>
Feedback-ID: ib28c4082:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 10:45:12 -0500 (EST)
From: Duff OMelia <duff@omelia.org>
To: westeri@kernel.org,
	andreas.noever@gmail.com,
	YehezkelShB@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imre.deak@intel.com,
	Duff OMelia <duff@omelia.org>
Subject: [RFC PATCH] thunderbolt: Tunnel only the first DP OUT of Apple Studio Displays
Date: Fri,  6 Nov 2026 10:44:45 -0500
Message-ID: <20261106154445.517940-1-duff@omelia.org>
X-Mailer: git-send-email 2.56.0
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

An Apple Studio Display presents its 5K panel as a 2x1 tile over two DP
OUT adapters. The first tile's connector offers the full 5120x2880 mode,
which the xe driver on my host drives over a single stream. The second
tile's connector offers only 2560x2880, and nothing uses it there.

tb_find_dp_out() treats both adapters alike, so it tunnels both when DP
IN adapters are free. The second tunnel sits idle but holds a DP IN
adapter, and with it one of the host's display outputs. A Dell XPS 16
(DA16260, Panther Lake) has three external outputs, so two Studio
Displays take all of them. A third is authorized and its USB devices
work, but it stays dark:

  DP-1  enabled   5120x2880       first display, first tile
  DP-2  disabled  2560x2880 only  first display, second tile
  DP-3  enabled   5120x2880       second display

Plug order doesn't help, since whichever display connects first takes
two outputs. The hardware isn't the limit: with Thunderbolt turned off
in the BIOS, all three run at 5120x2880@60 in DisplayPort alt mode.

Skip every DP OUT adapter but the first on these displays: vendor 0x1,
device 0x801f (2022 model) and 0x8025 (2026 model). All three displays
then run at 5120x2880@60, each on its own output.

Commit 49521be4809d ("drm/amd/display: hide Apple Studio Display
secondary tile") reached the same conclusion for amdgpu, and its panel
IDs include both models here (0xae3a and 0xae46). It hides the tile from
userspace, but this driver sets up the tunnel, so it can't free the
output.

Signed-off-by: Duff OMelia <duff@omelia.org>
---
This is an RFC because I don't think a device list is the right final
form, and I'd like your view on a better one:

- Not every host drives these displays over one stream. Bernd Behler's
  report [1] has a 2022 model on Arrow Lake with i915 driven as two real
  tiles, with both tunnels carrying video, and hosts without DSC
  presumably need both streams too. This patch skips the second tunnel
  whatever the host, so it could break those setups. I have neither to
  test. On my host, the tunnels show about 17 Gb/s consumed on the 2022
  model and 22.5 Gb/s on the 2026 model. Uncompressed 5K at 60 Hz needs
  at least 21 Gb/s, so I read the 2022 figure as DSC, but I haven't
  confirmed that from the xe side.
- The driver could leave the second tile untunneled until the GPU needs
  it, or tear down an idle tile tunnel when another DP OUT needs a DP
  IN. I don't know whether it can tell those cases apart.
- If a device list is acceptable, quirks.c looks like a better home.
- The Studio Display XDR (device 0x8024) isn't covered, and I don't have
  one. Dennis Wang's report [2] shows the same two-sink pattern on Panther
  Lake, and says masking the second sink with video=DP-2:d gives a clean
  single-stream boot, so a general fix might help there too.
  49521be4809d also lists panel ID 0xae42, which I can't identify.

There's no Fixes tag, because I can't point to a commit that broke this.

Testing

Hardware: XPS 16 DA16260 (Core Ultra X9 378H, xe driver) with two 2022
displays and one 2026 display each directly on the laptop, and a CalDigit
TS4 behind the 2026 display.

Kernels: run on Omarchy's 7.2.8 and 7.2.15, which carry Thunderbolt
backports. Not run on mainline. This diff is against thunderbolt.git next,
where tb.c matches 7.4-rc1.

Built against this tree with W=1 (x86_64 defconfig plus USB4=m, gcc
16.2.1), with no new warnings. checkpatch --strict has no complaints
about the code.

Passed, with all three displays back at 5K each time: reboot, cold boot,
lid-closed boot, s2idle, and unplugging everything and replugging into
different ports. The displays have been stable in normal use since.

Debug log with the patch:

  thunderbolt 0000:00:0d.3: 701:10: DP OUT in use
  thunderbolt 0000:00:0d.3: 701:11: skipping spare DP OUT tile

AI assistance

I asked Claude Code (Claude Opus 5.5) to get three displays and the
TS4's Ethernet working at once. It traced the problem through the driver
source and kernel logs, wrote this patch, and drafted this email. The
testing above was on my own hardware.

[1] https://lore.kernel.org/linux-usb/CAM=hwCxiJwODObeut=JcCA8jbu4C-XVEKJpR-y2MnDJibBQyOw@mail.gmail.com/
[2] https://lore.kernel.org/linux-usb/CAOX-mXs0ZjpiLtviUDqHLrzWh2Dyz+Y9gZUcenW_yV4iQUa=7g@mail.gmail.com/

 drivers/thunderbolt/tb.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba..b015a71 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1862,6 +1862,27 @@ out:
 	return tb_find_unused_port(sw, TB_TYPE_PCIE_DOWN);
 }
 
+/*
+ * A Studio Display has a DP OUT adapter for each half of its panel, but a
+ * host can drive the whole 5K panel over the first one alone. Tunneling the
+ * second only takes a DP IN adapter that another display could have used.
+ */
+static bool tb_dp_out_is_spare_tile(struct tb_port *port)
+{
+	struct tb_switch *sw = port->sw;
+	struct tb_port *p;
+
+	if (sw->vendor != 0x1 || (sw->device != 0x801f && sw->device != 0x8025))
+		return false;
+
+	tb_switch_for_each_port(sw, p) {
+		if (tb_port_is_dpout(p))
+			return p != port;
+	}
+
+	return false;
+}
+
 static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 {
 	struct tb_port *host_port, *port;
@@ -1879,6 +1900,11 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 			continue;
 		}
 
+		if (tb_dp_out_is_spare_tile(port)) {
+			tb_port_dbg(port, "skipping spare DP OUT tile\n");
+			continue;
+		}
+
 		/* Needs to be on different routers */
 		if (in->sw == port->sw) {
 			tb_port_dbg(port, "skipping DP OUT on same router\n");

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
