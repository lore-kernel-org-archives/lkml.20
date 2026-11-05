Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857729;
	b=3AkyBI+Ge+GYM6ClrhUGu2nufZ3v1ICjkF32bLilUmg4hv6tJRJsGLnVwbh5LWeT2x6R
	 Pz6SJdHlcOn8WkTZS8N9L0LN2hmq2p5/qYkxOoy4D5JSyyy2wLgGmw9Ct8WiQl+ToKYBs
	 sS18dvVfKBS/CAmmyMAI9GXe9kO7avN8iFTFp4aUV6Ob0erSSGcJxH+ife/4xlcpDDkI+
	 1wwMdpll9YJjxOfdLXtLYwuyKTIysAS7yQWUvS1YWVzIOt5FR3bU65wTNF0QsTHg8JdSn
	 E0FW2SmcNu0leBx9HrftKkiydfxlPcAyTgh60kkj2znriALo92WpLx29NO8F3WBpGBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SBNEa9eTphhg5rHtXCs+5fIAeeUr5WbjjNEV8lkSzqg=;
	b=cl+aFMB5ArBmf4GMyvxurHAs4rehjYbjdYeSAiVhxIbkdQcvttFobxQ+BLbhxRyPrpXy
	 HwLK8vu53iZOYUNbt416VUuxzvvOQ38zyIsninKkR/lIz41Ga/iZYcgJ9ZX2Q0RhiAMuY
	 NilOYaTdbbFWKkz9ZgwKTWY4M0eq9TYlsHavfIdoBAuSoObEaWzFkc55sP7J6Eaxtdczj
	 6xEYXiiiZdE774N01TnavmrXDTvQTXcswyDy/dxwUg3jNtb0tyXLUE/qqHoul+XxLQWQt
	 tr9kPTGu7LpICf2dS++oHiAU9MRLITc43S6YPRNg16xJo2vrposI2NO+B6OSYM0aqsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uXkdy6Ha;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D560A606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D560A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uXkdy6Ha
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1302821a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793857728; x=1794462528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBNEa9eTphhg5rHtXCs+5fIAeeUr5WbjjNEV8lkSzqg=;
        b=uXkdy6Ham5BAZIhMEsN8FFeghxIHgMPuf2wC13SXDvAM2DmwalyFPlZXze4fR6qW1A
         LjHlxlXi1MioDoF3tB4MvP3IWlTzwwQi+ptnvqRVMVXlEtTk6b30vowsQwEf/n6wkOim
         kDfo/4i9XIYg1YYYutDKCMhkCJsqJ2GDecWgSC4nOAwnH7r+aBoACqtV6EWUidTYSuml
         4+FVWqc63LcriR3k//8xGsIjCHfYzJLOhnuCtftPyIKFVSy4bhO6M4xvQ/ALxwISJio4
         45vbDrlbLKE+kjWNr2c5HdfrIMsYaS+H5Gd/GjioMU0dz2BcUhApw+Pw5w9vnA5Ia/ep
         yUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857728; x=1794462528;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SBNEa9eTphhg5rHtXCs+5fIAeeUr5WbjjNEV8lkSzqg=;
        b=z/p1vdGDuYNA9ivVTKsGjDYXItJBM3d1+9MZ7p6oFS9/MwlOhvIebPe+QNXgN9k2f7
         VgwCyePlAiGApbuCuEkqJIHUdyghvW6GrHe7G788nhWWJhjp9V4HXL0JKioTEFNMhuBp
         QATopFaQo+zELyZR563m+odBE+kqhE9MK8yEH3wVAEWp2DDQlTR111KPhod6qoqSkjWr
         KVh0wvTEaHmj3ReYFWjBtKZLzVzM6j44cP9qjcMsbZRicyM4zc4p1XlyHnxtPgnMdGFS
         XocR5KdaDlp/QQI7hHA1b6xPG3AcDIFtjZNVVsV+ALxqqNABwgz0ArhV4/ayZ3RCfPsW
         qbzw==
X-Forwarded-Encrypted: i=1; AKwUvBzQlwaVd5jGh07NR17MlXzkm+1jswWQe804y3m8Mh4TFZTUdRsXNDqP3FTVcV0/QFLtONrMYEGolse+D0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z854tKVxtCyIYte1n2d5FHsLN2uJxHYq7fDpeX5Pjb+URN0aujt
	AGCQhtrPRFPTcVF727JzdKk5gI37kUxwI3xCZDbmFXRvs9kCAEwSi77MS00ioU2rzg==
X-Gm-Gg: AYBFou0GQoUnJH3C1BX0oQXoMBENU2WjQdJbQGfcdCcXTQQ+UEKIHwXwbfY9Sf7iDmM
	ojKggVQy5bSBkj2OLspwRDzEGQlIDGLKIfseWCJEQVqosp1HnNQUPokghtmtThbZkfi98sirbOH
	eOp5eEWwGiL3RAVqGKbDZwL0K1Iof5KjpoMcrt6L7sdGWiBaZwrsZf4+8T5oD+D4x3hjixPjGAd
	lSC9EIt3ZdmpfSX8OnR1l9biAb+493dqk3v7ZCtK4iLzGUzUov6X5Vd2YDAZ6ckPh4o3iXu80U9
	/4dX7iBcUFcf5naNjtHKBhb+LLglCsBByN9XZZ14dRlN2aDvLdwuUA9UxtD+Xzo4fpBc8A1dNBX
	9EwQx4neKLOx9Sl9iiDMghlZ57SkJh2r01YnawCuRf2JTd61vTcLUGROZnKNe2+b3Id5vSKrwDq
	QMROX0/y7qn30mpNTgZUY7x2V9M3gJ1PhzkB8OcqL/CiD+YQQGGVi9+eVh7MdxjkoyHbpiU1dzj
	STKg3EaBLATsfOpP5fqzlb65BMPcEkDy6ymaQnMiNLLN4movPykVSRsyOCydVAUbU9jra7JIOjC
	uVBGUN5nwSY2R/aU6MfTKRbkXFL0+6r1NPYB7xiLSApyKf+SFRi98TA+/mPvlh1dm8FL1heq6xI
	82pxukNeR4Uk56U8a/Q==
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr14682972a91.8.1793857727976;
        Wed, 04 Nov 2026 21:48:47 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b319f2c9sm1989676a91.10.2026.11.04.21.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:48:47 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Hubert Feurstein <h.feurstein@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/6] net: mdio: add timestamped MDIO writes for PHY gettimex64
Date: Thu,  5 Nov 2026 12:48:33 +0700
Message-ID: <20261105054839.2248046-1-jjc@jclark.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PTP_SYS_OFFSET_EXTENDED uses gettimex64 to bracket each PHC read with
system clock reads. Some PHYs have a PTP hardware clock (PHC) that is
read over MDIO and sometimes multiple MDIO transfers are needed to read
the clock. This leads to brackets in the tens of microseconds.
Applications that synchronize the system clock from the PHC typically
use the midpoint of the bracket as the system time of the PHC reading.
With multiple transfers, the midpoint of the bracket is typically far
from the time when the PHC reading actually occurred.

For example, using PTP_SYS_OFFSET_EXTENDED on the Raspberry Pi CM5 to
synchronize the system clock from the BCM54210PE PHY PHC leads to the
system clock being 32 µs ahead of the PHC. On the CM4, it is about 7 µs.
(The difference is because the MDIO clock frequency is higher on the
CM4: 10 MHz as opposed to 2.08 MHz on the CM5.) The brackets are about
74 µs on the CM5 and 42 µs on the CM4. In comparison, the MAC PHC
on the CM5 has brackets of about 1 µs.

This series introduces a new MDIO operation, write_sts, that allows a
PHY driver to ask the MDIO bus driver for system timestamps bounding
the completion of a clause 22 MDIO write transfer. A bus driver
computes them by shifting the timestamps taken around the start of the
transfer by bounds on its duration, worked out from the MDC period and
the length of the frame. The series:

- adds a timekeeping function to scale a CLOCK_MONOTONIC_RAW duration
  by a clock's frequency;
- adds ptp helpers that use it to shift system timestamps;
- adds the operation to the MDIO core;
- makes bcm-phy-ptp use the operation for the write that triggers the
  capture of the PHC time, allowing 350 ns for the PHY to capture it;
- implements the operation for macb, with tighter bounds on RP1, where
  its timing has been measured;
- implements it for UniMAC, when the mdio node has a clock giving the
  MDC reference rate. On BCM2711 that is the GISB clock, which Nicolai
  Buchwitz is adding to clk-bcm2835 [1]. Until then BCM2711 does not
  get write_sts, and nothing changes.

The effect of this series is to reduce PTP_SYS_OFFSET_EXTENDED brackets
from 74 µs to about 1.5 µs on the CM5, and from 42 µs to about 1.0 µs
on the CM4. The synchronization error drops from 32 µs to about 0.1 µs
on the CM5, and from 7 µs to about 60 ns on the CM4.

There was an earlier proposal addressing a similar problem, in 2019, for
the PHC of mv88e6xxx switches [2]. In the relevant respects the
situation is the same as with the BCM PHY: the PHC is read over MDIO
with several transfers, and one write fixes the moment at which the
clock is sampled. Richard and Andrew suggested taking the system
timestamps in the MDIO bus driver, around that write, and Hubert
Feurstein posted a series implementing this [3][4][5].

Like Hubert's v2 and v3, this series shifts the timestamps to allow for
the time the transfer takes. The discussion of that raised some points,
which this series addresses. First, the meaning of the timestamps
returned by the MDIO core operation is clear: they bound the end of the
MDIO write transfer. Second, the bus driver uses a lower and an upper
bound on the transfer time, including the preamble. The lower and upper
timestamps taken around the start of the transfer are shifted
separately, so that the returned bounds are guaranteed to contain the
end of the transfer. Third, the PHY driver gives a bound on the delay
between the end of the transfer and the PHY acting on the write, which
the MDIO core adds to the upper timestamp.

This series also differs in having a write_sts operation, rather than an
sts pointer in struct mii_bus. This allows the bus driver to compute the
transfer time bounds at each call, from the same divider and clock rate
that it uses to set the MDC speed. Unlike Andrew's suggestion, there is
no fallback in the core, because a bus driver's write may return before
the transfer has completed.

The earlier discussion also raised interrupts arriving between the
timestamps and the write, and the latency of the posted write. In this
series, the bus drivers take the timestamps with local interrupts
disabled, and flush the posted write before taking the upper timestamp.

SPI introduced a similar facility to allow a device driver to obtain
timestamp bounds from the bus controller in commit 79591b7db21d ("spi:
Add a PTP system timestamp to the transfer structure").

This series implements the operation for only one PHY driver. But I
surveyed other PHY drivers and identified at least two for which this
operation could be implemented: micrel (specifically LAN8814) and
dp83640, although they would need updating to use gettimex64 first.

The measurements come from the method described in patch 4/6, with
ppsbias (https://github.com/jclark/ppsbias) timing the PPS on the GPIO.
On the CM5 this is consistent with an independent check: with the MAC's
PHC synchronized by PTP to an external grandmaster, and the system clock
synchronized from it, the system clock and the PHY's PHC read with
PTP_SYS_OFFSET_EXTENDED agree to within about 0.15 µs.

A coding agent wrote the initial code, which has been revised numerous
times on the basis of comments on earlier versions, my feedback, and
local Sashiko reviews.

Changes in v3:
- Rebased on net-next after the merge window
- bcm-phy-ptp (4/6): the capture delay is measured from completion of
  the write, as the mdio core defines it (Sashiko)
- UniMAC (6/6): the reference rate read again at resume for a
  standalone UniMAC
- Assisted-by trailers dropped; tool use described above
- v2: https://lore.kernel.org/netdev/20261018100257.566267-1-jjc@jclark.com/

Changes in v2:
- Improved measurement method (described in 4/6), which measures the
  synchronization error more precisely
- New timekeeping patch (1/6), so that the ptp helpers (2/6) scale the
  shift by the selected clock's current frequency
- Patches reordered: the ptp helpers (was 3/5) now come before the mdio
  core (was 1/5), which uses them
- mdio core (3/6): sts required, clause 22 stated, and frame-length
  constants for the bus drivers (Andrew); an event delay added to the
  upper bound; the wait and its 1 ms cap explained (Andrew)
- bcm-phy-ptp (4/6): a 350 ns bound on the PHY's capture delay, found by
  measurement
- macb (5/6): wider bounds unless the MAC starts the frame with the
  command write, as RP1 does; the MDC rate recorded when the divisor is
  chosen (Théo)
- UniMAC (6/6): the reference rate from a clock on the mdio node
  (Florian, Nicolai); a suppressed preamble allowed (Andrew)
- v1: https://lore.kernel.org/netdev/20261009143506.2507607-1-jjc@jclark.com/

[1] https://lore.kernel.org/netdev/41c32f5a6f38ec9df8a79ce896912fb9@tipi-net.de/
[2] https://lore.kernel.org/all/20190805082642.12873-1-hubert.feurstein@vahle.at/
[3] https://lore.kernel.org/r/20190816163157.25314-1-h.feurstein@gmail.com
[4] https://lore.kernel.org/r/20190819172827.9550-1-hubert.feurstein@vahle.at
[5] https://lore.kernel.org/r/20190820084833.6019-1-hubert.feurstein@vahle.at

James Clark (6):
  timekeeping: add ktime_scale_raw_ns()
  ptp: add functions to adjust system timestamps
  net: mdio: add timestamped write operation
  net: phy: broadcom: use timestamped MDIO writes in gettimex64
  net: macb: implement timestamped MDIO writes
  net: mdio: bcm-unimac: implement timestamped MDIO writes

 drivers/net/ethernet/cadence/macb.h      |   2 +
 drivers/net/ethernet/cadence/macb_main.c | 115 ++++++++++++++++++-
 drivers/net/mdio/mdio-bcm-unimac.c       | 138 +++++++++++++++++++++++
 drivers/net/mdio/mdio-mux.c              |  27 +++++
 drivers/net/phy/bcm-phy-lib.c            |  27 +++++
 drivers/net/phy/bcm-phy-lib.h            |   7 ++
 drivers/net/phy/bcm-phy-ptp.c            |  33 +++++-
 drivers/net/phy/mdio_bus.c               | 107 ++++++++++++++++++
 include/linux/mdio.h                     |  10 ++
 include/linux/phy.h                      |  39 +++++++
 include/linux/ptp_clock_kernel.h         |  55 +++++++++
 include/linux/timekeeping.h              |   6 +
 kernel/time/timekeeping.c                |  54 +++++++++
 13 files changed, 613 insertions(+), 7 deletions(-)


base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
-- 
2.56.0

