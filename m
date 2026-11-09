Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794248317;
	b=l1VURJ42KGDVBQkvzXPVUogeEutw0Ya6eN2Ejf1tSKZ27PfVg3fSH9a7/hg6zTslvvt/
	 Hi1WfyZ1OJFWcw+0pSt3Izb2a4UyofkhqfSXJExEi65Q8rskMD8lZ4UOKJMvkd9nENxPY
	 tN4C14YzC45jHBgOI+qPMvjZg6/fD6nVJQuiarshMxKuJDeJBJQHIEZAWMBKihUs1IGmC
	 foHYxnx7N0l+YxLh/wRp38JmBriUqYX6aZrFWdS4L5PtdNfbj5A7jrx48UwqaR24ygK4C
	 QR4RWOS3jHoeYYoBO/PQZQFGUvkuwXyksWQNRoY9QLzASTW+wdA6M7fNyCpVf6+KdiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248317;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=l+iSsMiUGE0vqcpx9f1qd0Z2+JsoDRwpOwdAvwLAk54=;
	b=h0Q7/cL+xtQky9UaUADMQ+4qO8HGx/+Hqp/v37GLQ9iLeJI7YfIAbUQJqkVRCkMTVivl
	 b8yf18u3dSqMdA7VSxiSZ+2RGtTL9pF3eHs/7nqtfMHBbR7SxI8fvY6rXkERuRibCf1rs
	 AHkom3rvLpqF3Y15Le36r2clI0FJeOvVZlYAyVC+7khEawL4fI8Q5RsZVE5JWgtmIrNi6
	 Y3+iXCp9BN9R4C1AHrWrPYEEej05oeQe/JQP8h+dopKUt1HdNmwO12OS4H8QC/NCiFoGX
	 cWSq5yG1eyhETxl2JdZrJ4zayfEzfqig37eUP4ZVfadudqbo6KbnXnuXVC/iBeoHe5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vo0+SRiq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E004606A325;
	Mon,  9 Nov 2026 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vo0+SRiq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794248317;
	b=ZuqL50qYBOH7oZ/4NlRX0TkE6LpwTWTph32caIOMogIOT3ebeZ3REWPrflbYmS7HcMr3
	 I31J8XgZftgw3QGih/qMtA7ZaUvJHkQrdEnkU6mXrq7exG5/P2MeCkMZxI2XysVXzNE6C
	 v6VzTzzE49ZujHKCLwXNWA36ugJrsuiP8J1Am042GY6HDWf49UjNIAhiLBmEmjwfA9lWi
	 wgSDOGNLkzk4qEDwk2dRX60SLMoqydK+OH1GL46PNf/76vRYuy3reRpDfcKW2K5lE7Gkz
	 GrCxc+gJRFaWRjJ9unXFrd4ty47fmkgh/VYCTLDs2ZeqHBpQZ3RR4ZCgcJkCP1vQscw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794248317;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=l+iSsMiUGE0vqcpx9f1qd0Z2+JsoDRwpOwdAvwLAk54=;
	b=nMO24l7BgPmv+5sZPsvYxSV/RXkZ6YG+ZFBxduBJhk/uOF8wImpHJkAQ511mOvkshKuR
	 H+YeuEY0pBFJvtFOL/CsjSnYv+LImgs9Bb3XHl800bwJKOWYLQZ6A3aM4YC9anOqBHrUp
	 CWajOeCmkPbtd97eeEKaec0ExFo/TBzTNJNcTbpsuQkS9n1d5B9sTTh8xU3MScX/WWoDk
	 TQAN1PdRlj9+E3PoLNt8p0vT7nARmQK8HXldxGsz0CK8ggpKilvcTaaBpUs4Cwk1Q2uL0
	 exn3GIZJsaoBlDVGzwjwk3fF94zxC7Xtprg/UqVUxOlUyLehWiUjJ3d8A8toDLeYiFg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 691E61F008A5;
	Mon,  9 Nov 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248317;
	bh=l+iSsMiUGE0vqcpx9f1qd0Z2+JsoDRwpOwdAvwLAk54=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Vo0+SRiqKfaJQzSvZGQ2q7GRFuWeUEhQVYh7xWSEiXrk5qylGGqk6BMiXPq16h3SZ
	 qrRTHxxM0g7WKbkMOoxuZv1Fbek3p3dwz4802S7HdPXse9mE8E8DNXJGWHI70ZjYH8
	 ODxFgev95JdQpqNmFsyFRKupcVFUjus5CX+GDku7cDyXLvI+WwGB0DTgV1+gNgwwiT
	 C68aZzoBuI480BjEIvcVS+tC5uDmR7c5aT9udYlLWb4viV2GLIYayYwj7O3cpWfZAC
	 OTIGwtRvy0KTivAj2pwspfjV4hci603Xgo+qbLedqSS0GWEKMe9NBAyesie53FEvbB
	 9zqJkKvtvD8rw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BA5E5485B5;
	Mon,  9 Nov 2026 18:18:35 +0000 (UTC)
From: Tin Posavec via B4 Relay <devnull+tin.posavec04.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] media: ov9734, ipu-bridge: Enable the camera on the
 Intel NUC M15
Date: Mon, 09 Nov 2026 19:17:49 +0100
Message-Id: <20261109-ov9734-ipu6-v2-0-0481b512c4c0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4V0bQ0dkYcr/8OwaMsIY6QlbWkwh
 H+X4tblubmvlXl0hJ7dspU5jOTJmh3glDE9SNMjp25nBjmUIhcVt7GpLgWnaS550emmE1UDGmq
 2JyaHT1qOtkf7Yz+rF+qQKpJDSY9cOWn0kCSDS0jyQD5Y9zleRJHi/wej4DmvS5QKQCJc63s/S
 nqftR1Zu23bF+z3bkLPAAAA
X-Change-ID: 20261017-ov9734-ipu6-4dc9d1792c28
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Afonso Figuinha <afonso.figuinha@gmail.com>, 
 Tin Posavec <tin.posavec04@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794248315; l=3284;
 i=tin.posavec04@gmail.com; s=20261109; h=from:subject:message-id;
 bh=1PlHlu8TNlYrqMNUeipl48+lGoBqTAH//j4ns2X12X4=;
 b=I1IftJgBIRkvh3kpNAlcE5dM4y+M+jtu8LbAFoA06eNVaWInyx+OcTQ+AlDXxA1xFhdhaiQ7N
 efXkQNTrmYoA3NusRHYQlhAqq/S4sG7ZG4+1t5R+uc20BlqGnGQYKoK
X-Developer-Key: i=tin.posavec04@gmail.com; a=ed25519;
 pk=h4O+VaAXzwd3B9L6H8RltugTkzF65lam1c1ls5knAVg=
X-Endpoint-Received: by B4 Relay for tin.posavec04@gmail.com/20261109 with
 auth_id=1463
X-Original-From: Tin Posavec <tin.posavec04@gmail.com>
Reply-To: tin.posavec04@gmail.com

Hi,

The camera on the Intel NUC M15 laptop (LAPRC710, Alder Lake-P, IPU6)
does not work with mainline. It is an OmniVision OV9734 (OVTI9734) whose
avdd supply and clock come from an INT3472 discrete device; its ACPI
device has neither _PS0 nor _PR0.

Patch 1 makes ov9734 defer its probe until ipu-bridge has created the
endpoint, patch 2 adds power on/off sequencing with runtime PM, and
patch 3 adds the sensor to ipu-bridge. The camera needs all three.
Patch 1 relies on commit 8015a49d8b33 ("media: v4l2-fwnode: Return
-EPROBE_DEFER on parsing NULL endpoints"), which is in v7.1, so a
backport to an older kernel needs that commit as well (v1 did not
depend on it).

v1 was tested on the NUC M15 with Ubuntu's 7.0.0-38 kernel (7.0.14) and
the series backported. The sensor streamed 1296x734 SGRBG10 at 30 fps
(libcamera, simple pipeline, software ISP); it was powered off when
idle, and s2idle worked with the camera idle. Not tested: S3 and kernels
with lock debugging enabled. v4l2-compliance: 45/46, the SUBSCRIBE_EVENT
failure is pre-existing (no V4L2_SUBDEV_FL_HAS_EVENTS).

Afonso Figuinha also tested v1 on a Surface Laptop 1 (IPU3) with
6.19.8-surface-3, with the ipu-bridge entry of patch 3 added by hand:
probe, streaming 1280x704 NV12 at 30 fps (libcamera, IPU3 pipeline),
runtime suspend, module reload and v4l2-compliance (45/46). He did not
test probe deferral at boot or system suspend.

I no longer have the NUC M15, so v2 is only build-tested, not tested
on hardware. The main functional change is in patch 2, which now waits
for 8192 external clock cycles (about 427 us) instead of 20 ms after
power-on, so testing on hardware would be very welcome.

I used an AI coding assistant (Claude Code) to track down the cause,
compare with how other sensor drivers handle this, and draft the
patches. I have gone through every change myself and I am responsible
for the result.

---
Changes in v2:
- Patch 1: Drop the endpoint check and return the error code of
  v4l2_fwnode_endpoint_alloc_parse() instead (Sakari).
- Patch 2: Drop two comments, wait for 8192 external clock cycles after
  power-on instead of 20 ms, and request only the reset GPIO (Sakari).
- Patch 3: Drop the NUC M15 test result from the commit message, as it
  was for the whole v1 series; testing is described above.
- Patches 1 and 3: Add Afonso's Tested-by from v1. It is not added to
  patch 2, as its power-on sequence and GPIO handling changed.
- Drop the Assisted-by tags, see commit 1e035297ffda ("docs: remove
  Assisted-by references").
- Rebase on media-committers next (v7.4-rc1).
- Link to v1: https://patch.msgid.link/20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com

---
Tin Posavec (3):
      media: i2c: ov9734: Return -EPROBE_DEFER if no endpoint is found
      media: i2c: ov9734: Add power on/off sequencing support
      media: ipu-bridge: Add OV9734 sensor config

 drivers/media/i2c/ov9734.c           | 124 ++++++++++++++++++++++++++++++-----
 drivers/media/pci/intel/ipu-bridge.c |   2 +
 2 files changed, 111 insertions(+), 15 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261017-ov9734-ipu6-4dc9d1792c28

Best regards,
--  
Tin Posavec <tin.posavec04@gmail.com>


