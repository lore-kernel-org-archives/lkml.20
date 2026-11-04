Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753018;
	b=VIYkwdRci0r/RzxKE/wHGvCGxfjx6FL4zkUwu7sBSSoZpTq9OlxESXi50bmyI0yrNQg3
	 6VPcZ840zWCt9IpEFVIMXz+2wrRCd/r+yOaooZC1I4SaQeI4jDgkgzZGfyllx8z983ZlF
	 aoC+NJeQePzfZ0JNOnVpRL9khoXFfh3FVnYAhQiRxQV/s61BEJKMXfZdLPL+aKV9Mo92r
	 phkBZrowGXmOF2QllO0M3+MXqvxHOtic4zEVFr9MhwIiQ6i9yZ94+vciAXgRPiyjcXONW
	 l4vo90MKU4z9uLTI1MfFNcysx8dtDqi7QMuGEgI9lmJEr4l5aSD23BxU6Bb+e7OCHcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tHFmvMsmtBZ2Nyxofs/T2sfmpchIzAj9501V/rD7FGE=;
	b=2EU8GnafVG4Kx43KhJhgyDhPOQI0eSCbANnTshbaH/r4Rrfzkd/WfWrQmHAtb3RWI8sj
	 jv/8D/AN17nzww1eSupvxh6JhUdgA+w/QzPOgoTcB83p/Ne5WNFppj9ZIcWJQAZGQfOrT
	 ITlPil17fomSh8b4R9WOpnaDjtH5zgTWvQN0RIuY//D3Y3/5wwT/a2BnhM0IlYyau830E
	 emGmgr4hZPqmAFn7wcIZ3VAdISfBvw6ufsvjin8SC+AJYaCG/aism3UZweKRA+BpcjWR4
	 cxoerJnY/1MAV4mj4+StM4JqJ96CqA/mk22BGcQbJSRhWjBvz4oNib66Ee/kBRsisig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MC3EKk2D;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87446606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87446606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MC3EKk2D
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43bf9548df4so222255fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753016; x=1794357816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHFmvMsmtBZ2Nyxofs/T2sfmpchIzAj9501V/rD7FGE=;
        b=MC3EKk2DFXOr8vXA3yOdjcQxjOu8JfFq2gSRGvZ+ssJeIfU7Umeie7mcJs3yFI0MUd
         J0ygBKYV6YkY+SYCTbrqgWjbbY/J4IMwR9EfMBlMfwe0d/Yc+5fsTCLswKXyPN8ntc4s
         hs4ruH1a48OHncj/NuAGiEyvfpNwFF+Z9APLUPUaaMu4S01yh/mDQCJuawlhwmz2vO6A
         CLIKR2h2tucnPNyKVmFnHRXyObC1LmDhBCI6rODtDzT+B1q5D0llbjhFVK1cr3hiB42u
         1SYiVYcMfR+QqBe1M7G9vvLrPgbQD3HnHM5NuL/smT0tAgVMi+FV/j4UnpXSmxwC+Z07
         T0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753016; x=1794357816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHFmvMsmtBZ2Nyxofs/T2sfmpchIzAj9501V/rD7FGE=;
        b=0ghlZaj2uUFlkkbtSiqBDOndfk4S5+44xgv+moIpZ7KhboWUTC4cIIS20/XEm6Fi4r
         PIiawm/b8ovqgeltDsc0puoe8en4sRA2I/L8SBtmHUFUUJmqEXolMYOU2HluDVvmbIT3
         Ddlfn2y10eWfJ6TzpGzU4pCIlUvmSvqUHxNgYYXl1ThleJYK7bzepEkRqIZTc8rXFzXT
         x9p3grif700rjoeZirhuqt77PcIJsSIpAD1gKyFULz4fdCu8qvKtyF7yeGkiQkyn3a3M
         +6dLO0x5H9ckAuljyaSusuHOLI8qyYYuFthU3CTz770ZWk06IMGcK70cwovCZ4emOQ/W
         otcw==
X-Forwarded-Encrypted: i=1; AKwUvBzKa90pbbZ7+aro9xce+XhOiz/dP1D7v3lpu51UR/URGrklyVmkJskVxtxDMbcrDeuTtO8zugZcy+UDlZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pktoEJaIYka5Pd0et8dwFyFAdLBIJcc2GFqOR8JulBew2tyQC
	V+hV42U3lIcyyr5q8HKh/7AI4JTWQcaSGK8N5g/IXY0AAGglPRyhcYCrXlVfUshu50U=
X-Gm-Gg: AYBFou3a3t7lrRv4mZOINweOEaNGRJi4awDJCe32atCUclCjXtxCxponNXJ5fo529u9
	SHU5Ir6aMqe4Y5S6ONSbEx1YLVnuLn24AHQ/4lf4mVnC7ZB/q+h5AOQZUJe6y0MR0XrhCsNnMbb
	LDZfo47rUcd0TF+H3TA5hOytftC8pCLNjmfXfv9uL1f6cVHR/R3uG+Z4nsMNVsTtNBS7UFZ0d4l
	3U4vQQteUuB5zijVhgBZz6lcXHvu56tg6foW/slzCr6l54vb950/EciC3tohFn91DavRwR9/MvS
	WNyff6C1XR9PzJdc0ERD3TY62mEKbn8lu1VaXR0RZIKQUC4t9U2jPHHS+ekOzWZ4vjFgW5lYkG9
	iLea6C+WRJMtlhYQBx31XCKje7/2WFwa/t1/9Stgkzva/u6p3Cb2MoAHOpnIgul6DAnIZ8zdux1
	Q1A/W8YAyhqPxfX6aG6atYDONI0BNqbn5LwAHfMrKbgGSucpj6RoYycWhRtsbBjxBvpxKQuPOzZ
	eppS3j9ROTF2bfmjTuH6jbznjG6jZKpraSMOx+rtlSB0zXKBuI7jql17KBpC/SSiZ1/nmtn2dik
	+Dka2RIWcGx7YKQUxvh8zB0zHNIgHDo/Ag==
X-Received: by 2002:a05:6870:c69d:b0:49d:c3f6:4194 with SMTP id 586e51a60fabf-4a90764b95fmr9096189fac.9.1793753016228;
        Tue, 03 Nov 2026 16:43:36 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:35 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] soc: toshiba: tc9564: config system controller
Date: Tue,  3 Nov 2026 18:43:27 -0600
Message-ID: <20261104004332.2141282-1-elder@riscstar.com>
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

This series is comprised of some code that was previously sent
separately.  It now incorporates a new system controller driver
that advertises clock and reset functionality, as well as regmap
access to its address range.  This combination is being treated
as a new series.  (Details of previous versions are below.)

The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
It includes a PCIe switch with three downstream ports.  To one of
these ports an embedded PCIe endpoint is attached, and that implements
two PCI functions.  BAR 4 for both PCI functions provides access to
registers controlling blocks within the SoC.

The system controller driver adds the clock and reset devices
using the mfd_add_devices() interface.  The clocks and resets
are implemented by drivers included in this series.

					-Alex

The system controller, along with its devicetree binding are new.
My hope is that this new model addresses concerns that Krzysztof
Kozlowski has expressed in prior versions of the clock and reset
code ("fold into the parent").

The clock controller driver was last posted as version 3, and all
feedback from prior versions has been addressed.  This driver has
essentially been completely rewritten.  There are now three clock
types (PLL, fixed factor, and gate), and each defined clock has
a parent, and the is_enabled callback is implemented for the gate
clocks.

The last version of the clock driver is here:
  https://lore.kernel.org/lkml/20261012152408.3729237-1-elder@riscstar.com/

The reset controller driver was last posted as version 1.  All
feedback received on that version has been addressed, and it's
a bit simpler than before.

The last version of the reset driver is here:
  https://lore.kernel.org/lkml/20261012164354.3872326-1-elder@riscstar.com/

Alex Elder (4):
  dt-bindings: soc: introduce toshiba,tc9564-config-syscon.yaml
  soc: toshiba: tc9564: add a new syscon driver
  clk: toshiba: introduce a TC9564 SoC clock driver
  reset: toshiba: introduce a TC9564 SoC reset driver

 .../toshiba/toshiba,tc9564-config-syscon.yaml |  68 +++++
 MAINTAINERS                                   |  23 ++
 drivers/clk/Kconfig                           |  12 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 288 ++++++++++++++++++
 drivers/reset/Kconfig                         |  12 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-tc9564.c                  | 135 ++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/toshiba/Kconfig                   |  12 +
 drivers/soc/toshiba/Makefile                  |   3 +
 drivers/soc/toshiba/tc9564-syscon.c           |  42 +++
 include/dt-bindings/soc/toshiba,tc9564.h      |  46 +++
 14 files changed, 645 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 drivers/reset/reset-tc9564.c
 create mode 100644 drivers/soc/toshiba/Kconfig
 create mode 100644 drivers/soc/toshiba/Makefile
 create mode 100644 drivers/soc/toshiba/tc9564-syscon.c
 create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

