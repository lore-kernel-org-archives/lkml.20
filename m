Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230798;
	b=yZuPc47VKHndFPQypF+Z3y7p7aydQai6k2C2HcR17xoUtRAPLUWP2vQimVNqW1FVvl4E
	 lqyR4L6rEQRsblHqR+Q79iViM3kCV64JKqjuAx4DhP0iWpvafHWcMRAzGFr3wXhuhDLnr
	 qIMGfht+d3AcUmD1tlko7YSIdoE4wFEoYcf+Q7P/qOgrzReRoISSR5XdHywW9KklghMUW
	 M0luGWvO/hOwsJuDNLW60CE4olQlAXv0RwGWSfjGMtX1GHNISUwPhl+QaWnG7NZYxi59e
	 FcSIgOD8i/G3KV5qGgcRDH6DG1zRq4AVGRfjJhsTD4ViBkZH59yfrAM7hZ5mah+4NUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=;
	b=4bnV3ZA7qLVg1MKa5nKyDmlnJp5046lPdV1dHWpiQU072YE8OdIwK/3c23XqoMo2o7ot
	 C+rprBD6lmK8eYsQC6ObuU+Kq9R0bNHUHMXSxofg9Lz5cYEbpGBi99kB5d6hSOyzatxnZ
	 uM68GFQ5bjqUowIJwtM0OuoeN4Y9lVztpz3KcEkw3vSZ3A55UbL7whO/b13dXFmSYWM5X
	 ovkFTLTrRVjoqlaOXlLom1NF7ymlRcmH6s/Scg0GsDVYV9J7nvplFUbMNM+OKysMy9E2b
	 8Se91tBu+Dlp0DM5zqj9UnXYEdCH0XZu/YPlX3p6PISt9WpBXh4AQn4h1aDTb310JPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWAnA9Lq;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287EE606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWAnA9Lq
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so297653a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230797; x=1794835597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=;
        b=XWAnA9LqdM0p1McSygOHFQi1k4/3YKYdEv0qzWF/05pBFysKR/RI+uf1GN99jAvJLr
         gZbyJIRx4Qn1eiW/GWZZdQtBk4cEpyROHQuSJglfa1n0AMCSwTgQ22vR8lAUGr/m1hxo
         udUIW2jqu434G6xbb7BVjXSL17FymUnxFbr4rcBpi2LKYztw5Uo5qGMT+4dBVqSzw2qO
         7XdRSCBE8GvEldkRmjif9rlOARg051T8bmHEOacq7gUCNjNempC5JzHF8efFW247E4l9
         UayMykSMdMMOt1LGM+igMZIvOYrR3EOZvjksVGdXACrxbT3mTPXnZiufyNsd6fEASWxD
         C20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230797; x=1794835597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=;
        b=23CWCIOhDwSOI6mVBs07DNaT9yR86oEVL5JGh1AFlVCPVj1Y5xIkTtSdnoYitg+wc5
         tLmSyuMWWrMIThzedwDxXiKfKpyIETRFY0TUaVm/dE4N94H0U8BRqH8D9UbmXkH54On+
         rzb5aKTVnHF62JzBms7Zyr5IvV5zb+eUwNMfvd2pfwcRb9arNkviv2Px8XW0FgTdU0nO
         xs3N9Jh2PeG23b3ern2hORwAkvVRcV19uT74Egp6GV3dLXwnFQ0C1phzwGxyegRDIpfq
         zbnVWMhJpnUSIBORmAPSPZIJhjP0vmW+7h/aDY6jPKupDICSnVwH027N5ZT6o25+u4Xy
         yb/w==
X-Forwarded-Encrypted: i=1; AL+hErF+I6otcuaiFQjlSb1H1bKw3ujSubL/dF+s7ykWh1Ybve0pynPhHTaE7kdIy6N0bIDBgD4HmlDea+Qf3Ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w9tT55yyUV3jwNJO03+kpvqN1fAftgLVbUcy58ArnFGCkj/8n
	8djpF8kHezCNC+42YOHTKyQ8yODje29fY7rj/Z0ZdzsB7FtqRwcMQkny
X-Gm-Gg: AYBFou0zrqnOrryZ0Z8rOtCIzUnk/FUtY9K/riiKCzns7b6rTbBZrVQDMBVoLeXczTj
	mbGK0Rq2epvPq+e1geHyx0glGL8CaPUPaJA4jV1OMedgVseXaeWFv+vfVLPriwOoLEzLNGjTFAE
	83ri0OajUS1vPvOV9z+swmC45a5D3Ln1qd6aLTWXruHpHG23pxeogEmN8eT2Ry64piiDu1GEAIV
	cwk8LG1piyveCDkC0alnowtOiKhjSIL7eMqhh0FOaJqLqvuURyhqSJ5HV37I4KNN1FLlesni8it
	aA6hIS7+wYLfDappsm6G6VYj2hZBEk80cYcdpS53VtR9mAdMuhxN2z7jZq5Pw34FW+/ouWRS7Ox
	luka4NbKTFo2ruN/8e8cCo9SmFur4K4kj2S109FAwx6p9U2t0hWcvpIu6HIj/uBSqi4Gm2QVCau
	ZdMCEPxhYGwyGR0j6jUaMmdh80eT2RD26Q/p+BDj/TIp+AyWudb+eFtwxH+LN1ggeG3CGojXM4q
	O2pQH3q5vjuSvp/+YoVgtN5BZv9EYcCpPeUgkBZpWmAAILJ627Rfj4hBiJGIEhF/Y8kqm/v6axn
	41Id5pBqjQX1WqqjGyevQr2G+cQsVjwGJn2sfXQOomsYasB+qQs4E1k+Q75NukdZDbigfqhW/eG
	rJDIcYKcp
X-Received: by 2002:a17:90b:57ee:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b12d564a3emr3973293a91.46.1794230794140;
        Mon, 09 Nov 2026 05:26:34 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:33 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 00/6] resctrl: Support mba_MBps on MPAM
Date: Mon,  9 Nov 2026 21:26:15 +0800
Message-ID: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

Resctrl offers two ways to describe an MBA policy:
- The percentage interface writes a fraction of the maximum bandwidth
  into the hardware control register
- The MBA software controller (mounted with -o mba_MBps) takes
  an absolute target in MiB/s and adjusts that percentage based on
  the MBM counters sampled once per second.

The problem is that a percentage alone isn't enough. How much bandwidth
a percentage actually corresponds to depends on the memory frequency,
the channel count, how many threads are generating traffic, the access
pattern, and the traffic of other groups. Neither MPAM nor x86 resctrl
reports the maximum bandwidth in MiB/s. So an administrator who wants
to enforce an absolute budget (a tenant SLA, a noisy-neighbour limit)
has to measure and re-tune the percentage on every machine. x86 resctrl
has had this software controller since 2018; MPAM has never been able
to use it. This series makes it work on MPAM.

What this series does
=====================

MPAM refuses mba_MBps in two places:
- Its MBM counters are assignable, and supports_mba_mbps() refuses
  the option when they are.
- Its maximum bandwidth control is a soft limit by default, which
  can't hold a single requester down to the target.
  MPAMF_MBW_IDR.MAX_LIM reports whether the hard limit exists.

MPAM also makes two generic defects reachable:
- Writing the control register sleeps (smp_call_on_cpu()), while
  the worker runs under the RCU read lock
- A 16-bit fraction lets the minimum control value reach zero, which
  divides by zero in the estimator

The patches:

- Patches 1 and 2 fix the two generic defects.
- Patches 3 and 4 make the loop runnable on MPAM: the worker takes the
  CPU hotplug lock around the sleeping control update, and assignable
  counters are accepted with a fixed assignment mode.
- Patches 5 and 6 handle the maximum: the driver sets HARDLIM and
  records the MAX_LIM behaviours, and mba_MBps is refused where only
  the soft limit exists.

x86 has no assignable counters in the mode where the controller is
allowed, and does not set the soft-limit flag, so its behaviour is
unchanged.

Testing
=======

With the MPAM MSC model in QEMU:

- From a 9606 MiB/s baseline, a 7000 MiB/s target converges to
  6888 MiB/s and a 9000 MiB/s target to 8766 MiB/s.
- The memory-side MSC register shows MBW_MAX.HARDLIM set.
- A modelled MSC that implements only the soft limit refuses the
  mba_MBps mount, while a plain mount succeeds.
- With mbm_assign_on_mkdir forced on while the controller is in use,
  a write of 0 is refused, and the user's value is restored after
  unmount.
- The KUnit tests for the MPAM driver pass.

Jinjie Ruan (6):
  fs/resctrl: Avoid division by zero in the MBA software controller
  fs/resctrl: Do not update bandwidth from a failed counter read
  fs/resctrl: Take the CPU hotplug lock for software controller updates
  fs/resctrl: Allow mba_MBps with assignable MBM counters
  fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
  arm_mpam: Program the hard limit for the software controller

 Documentation/filesystems/resctrl.rst | 13 +++-
 drivers/resctrl/mpam_devices.c        | 55 +++++++++++++----
 drivers/resctrl/mpam_internal.h       |  4 ++
 drivers/resctrl/mpam_resctrl.c        |  9 +++
 fs/resctrl/monitor.c                  | 86 +++++++++++++++++++++------
 fs/resctrl/rdtgroup.c                 | 48 ++++++++++++---
 include/linux/resctrl.h               |  5 ++
 7 files changed, 179 insertions(+), 41 deletions(-)

-- 
2.43.0

