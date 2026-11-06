Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001064;
	b=YZl1mU6RdYZnsxz324jAWS91zcLbMkuk4mqGDv5k+ux2G+5yV3Yx+sCBFo5BIWWchYzN
	 VHWBEEpnN4AENq+ivJiY6r+Xp49FLRNpXjyjZYYz0p6tPLpluXTk1Ju1j7NIbJ2dYRK8s
	 B6ldqXfOrBgwsI6WW4cdVJe4ra/+uo3MKBeZWk6xgc0kjU29/VtZX03Mhut10WFvUVuuD
	 FpPvqY0P5Ter4mGwOBTIdN4YHOqs+xfMOVbPI2ZEqed959Yg9J6/sLxBGyOXws5WxgwD3
	 niqdGmjE9v/dZlroeBLVBrZgvQ8cq8LUx4ZM+hlpxFUPZhaysvgpBqhBcASSJAGf9Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001064;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=R3WhphMQ/dC8k15O8g1wb7NUZP03SLqWHIRamdHyf2I=;
	b=zIYSRoKGz6R6nXuAv8PQfX/B56tBwvZHOQdS7MX5M74+h3W9XRbQlVlmfeOovFF4kcSv
	 TeeTEU1PcprX2RcrSHoYjTrmKB1Fmdlg1MTSPB/QQAHYrNtsy8cqd0ck/iqrkM2HjJgHo
	 nH3NQRZolLbFPh+uVZPydqDXsTjozE2VmWtY5eX1plgzWyXpUKdCgmwEDGfLa2G/qzymJ
	 9APUd/irv8GNMUZzJc2QkdRUyiseVd+n9dea/FGMYpumsKz1i5SrAbfYl1jc+9fmDtI4G
	 T7LwEen+m99fbWs0r4CnEABwBUd/GlcJZcrrXicSqmUU1huu91/LHe22yjyyzTbso4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Trjm9rFv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6B5606A326;
	Fri,  6 Nov 2026 21:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Trjm9rFv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BB91F0089F;
	Fri,  6 Nov 2026 21:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794001063;
	bh=R3WhphMQ/dC8k15O8g1wb7NUZP03SLqWHIRamdHyf2I=;
	h=Date:From:To:Cc:Subject;
	b=Trjm9rFvQ9mnVOhIZ19ag6reTS7jqti2aDOR7rEaAiqxzwciRxXUK7ek6y++zIy24
	 sl1NAH0CJpBMaBX5a/UQIUpzf6ygUhYorYOuCMjs485Rxt7ajbr1iyPals8S9HNnEq
	 hlZpiBTPQKLKCTOd4MmBCNC32+ddVQMpxBi4TUN027noeTFtxVUulwzgbHWZYC8sjr
	 /2gUHbCV8rRPTsgH6VJmsGc+57tkumTx+vBeYkXByq44LQw81MkJMC3VnrwEuQ+NHY
	 ws9pW/kHPut8suHgTFToJfehBDiRE4HZR6FUCY6xoiYYhgX4JKWCj3qNMZNoj+JDLk
	 Mo8VW67LbvIcA==
Date: Fri, 6 Nov 2026 15:37:40 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree fixes for v7.4
Message-ID: <20261106213740.GA1851347-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull. Not fixes themselves, but all of these are patches that 
didn't get picked up for the merge window. They all fix new warnings 
because the corresponding .dts changes did get applied.

Rob


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.4-1

for you to fetch changes up to 9c1075791172d936935ca20d7f0c1da601c4f408:

  dt-bindings: usb: add Altera Agilex5 DWC3 controller (2026-11-02 13:25:21 -0600)

----------------------------------------------------------------
Devicetree fixes for v7.4, part 1:

- Add Altera Agilex5 DWC3 controller and Raspberry Pi RP1 PWM controller
  bindings

- Make "peer-hub" property optional on cypress,hx3 USB hubs

----------------------------------------------------------------
Adrian Ng Ho Yin (1):
      dt-bindings: usb: add Altera Agilex5 DWC3 controller

Josua Mayer (1):
      dt-bindings: usb: cypress,hx3: make peer-hub property optional

Naushir Patuck (1):
      dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml          |  66 ++++++++++++
 .../devicetree/bindings/usb/altr,agilex5-dwc3.yaml | 112 +++++++++++++++++++++
 .../devicetree/bindings/usb/cypress,hx3.yaml       |   1 -
 3 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
