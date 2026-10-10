Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0973B36A017
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673026; cv=none; b=AC99hCX27JslXkd2EINQ8FjDt31PegkBS+K8Hr5Y8BdBS4G6sHC2neze+xBUrd2rBariEbnjBAxK2utC9LmrRwmgnGnomn2J8SVbms3mWpPN1p81BGemK8Ta2uLIcGrwYS8mlSRMevQpN+mn2EB9eTpPYCmVRLDu9Anyp3Lf0T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673026; c=relaxed/simple;
	bh=v9xElfPDtUKLBbAOUyC6WEp4xXa0Taz+orpIfsa4F2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoyHxQitsxxPLmaaCUMt6WTomwu7VIzy2jYmBeP3HWUtcpoJp0Fcx1VIvzTFnZyhm341qxfqMzuL6eAY+aZy9Csr2rgel0k3YGsmglgjYusEdYIG+2L+ZNEFdqktETewDcvDJaZz8lJ/LLKdxgD59rUgzdO6tbCPOjDkcHtLqG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4hV3XB0; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4hV3XB0"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso319411b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791673023; x=1792277823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ch8jJvcOl0DuSm2wf0+1Uy+KIAeGMYwyi2l0FK4u8IM=;
        b=k4hV3XB0n7HKRnRRBlNcsms4eFbcoBicAczlCBdu7tF3omduleLqeRJ0Tn/cKgjGLw
         8fvPT+O8Wwy5C1282XYk26GVDcULGccr3sdcHeJl816B1fzHbTgU+XF+3mGE4kjpGzHa
         gQQ4B3WpaSgCYbrD1UqtFL98ney19hcSxbdnWGdjWANGGarqWwyRN+5dV2DB655ZsKO6
         rsLdNYOtiWvy0crmsP16Uev8VU1gykhCflFq0CHJqj0VrSXnXj3zdSLoG6/6jxA2aG2O
         bn2kdwcs03gcwEB1Qux3bHmCjPO5RWoK28FAgDB635EyrDD+1k5l0w0iIW9o8Ryq0WR8
         6ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791673023; x=1792277823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ch8jJvcOl0DuSm2wf0+1Uy+KIAeGMYwyi2l0FK4u8IM=;
        b=gCckJfqI1A7xTmd21NY7sTNVndJpHU2Z1Dsderl9lAlj5/PS6JFnzZsXoIrA2qll24
         GaUqn8GCabGgZaTcW0TXo5JOdN+airMrby203B86fvua0V2MP75kenlqbipokeXM5b2s
         XZxj0Bsy4a6artFShuTyqrSEJ8Mne2o/IjoizpJ9Mg2wxr0Som+JBQVMRFUQBXtbOpsH
         WoCLqrnRBI53NWU7Sx+cHycLp+WFEB9LNb/ardV2EY6kCkTgQqb+T2nqmfH8dls6304D
         hVy76CuYnwn2pTe6okedVtSrzDmTybmDgkmVMwsPFz7sbRZ1kmAdhUsvsA/8IS3BnMy5
         lkkw==
X-Forwarded-Encrypted: i=1; AKwUvBwrFHACJlFUThWNoNORU4K/PEM5tUYxF5X210GPeihE8gp1HPBfxaii1ELtpD+4m6P6eS9DTbA5YoyMEM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk+o6BR7wDngzqGA6jRi8MdNqmyTC5izDhQdEbi1V04WXI+c6k
	1Lpjf+l3A8OescNFiAV5+lsGtyUKL/F1ThEcfE8BoZYw5pchy1AYXL5J
X-Gm-Gg: AYBFou3oSro+2eO3kOnwjgzp8C/P/lgrgbElxMv+Hs78YirL9P4fBV4PouPGKo1GBHT
	cvA27ohFu0B9Ox+m6Lz8tagLyuhjV0Lxkf/ii7zEXQNiNwXcLfgw7/ltIOgn1U8EEfq1EFbaJ9k
	Zb/0fOxNqvm07W3e02QFmofTXdgXUsOHC/0lwtwM7qTwAO2nZ1GSoh5+u0qLisrwN3OMTWTc5Ha
	vJsgJWFXeXiJR/n8ZGIdIcJgy/dkYT1SduCqAdcPVbJIchxMOezLD/S2v//QOmi6A58UltqrRb6
	cdgc2r9y9mj/25VWUYo9RVP1J6EGzxYq/YM6QBbC4jtM7+NkUMwgGwqU03uHQFzhfSQT4+XXdJ+
	4sZHQYofr4Om82fWx95P+e0SWu0zYdTRCja/VXy1xuputl4owFRWDwbPvrg7P7rv+3aBt0QPnZf
	+4vQMTMwZmyBtXh2PmZ/wNdipE/lpkQ+mRHTpYg5YR8hDftoDDwV56k5ZtD/7juihMh/OhQCxeg
	DYNoxQYCg/fTnelcpWPqX0YGXxA
X-Received: by 2002:a05:6a21:398f:b0:3dd:85a9:55a3 with SMTP id adf61e73a8af0-3e16bee802emr5923819637.37.1791673023130;
        Sat, 10 Oct 2026 15:57:03 -0700 (PDT)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm2603662a12.5.2026.10.10.15.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 15:57:02 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>,
	Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>,
	Anisa Su <anisa.su@samsung.com>
Subject: [PATCH v16 0/8] DCD Prep Series
Date: Sun, 11 Oct 2026 07:54:51 +0900
Message-ID: <20261010225852.10727-1-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the first eight patches of the Dynamic Capacity Device (DCD)
series. They set up: DCD enumeration, CDAT handling for DC partitions,
the event interrupt plumbing, a preparatory refactor, and
documentation of the DPA partition layout. They stand alone and keep DCD
disabled. They are not dependent on the rest of the series.
Patch 1 detects the 48h command set and then leaves mds->dcd_supported
false. The flag is only turned on by the series that adds DCD event
handling, so every DCD specific path added here is shut off at runtime:
cxl_configure_dcd() never runs, no DC partition is created, no DCD
interrupt is armed, and the CXL_PARTMODE_DYNAMIC_RAM paths are
unreachable. The intent is to land the enumeration and plumbing while
the extent to DAX pipeline is still under review.

Based on v7.3-rc6
v15: https://lore.kernel.org/linux-cxl/20261007201828.952-1-anisa.su@samsung.com/

v15 -> v16 Changes:
===================
A quick respin:

 - Patch 2: cxl_configure_dcd() took Identify Total Capacity as the end
   of static capacity, but Total Capacity is only required to be >=
   ram + pmem. The static end now comes from the last static partition's end dpa
   +1 instead of info->size. Check that DC starts from there. (Richard).

 - Patch 3: dsmas_entry.qos_class initialized as CXL_QOS_CLASS_INVALID, so a
   DSMAS entry that is skipped for lack of DSLBIS, or whose QTG lookup
   fails, no longer reaches update_perf_entry() with qos_class 0, which
   is a valid class. (Sashiko).
   
   The DSMAD handle check now checks handle > U8_MAX instead of
   handle & ~0xFF (Dave).

 - Patch 6: when the DCD vector cannot be requested, tell the device
   not to use the vector: dcd_settings is cleared with
   Set Event Interrupt Policy, so a device does not keep signalling a
   vector with no handler while the
   host considers DCD off.  The Set command is re-factored into a new helper
   cxl_event_set_int_policy() (Richard).
   
All other patches are unchanged.
I kept the review tags on patch 3, since the changes are minimal and
dropped tags from 2 and 6.

Patch organization
==================
 1-3: enumerate DCD command support, read the DC configuration, and pick
      up DSMAS data for DC partitions.
 4-6: split event msgnum configuration from irq setup, factor out the
      interrupt policy check, then configure the DCD event interrupt.
   7: preparatory refactor -- enforce partition order while collapsing
      the ram/pmem specific partition helpers into one.
   8: document the DPA partition layout the previous patches enforce,
      and where Linux is stricter than the specification.

Testing
=======
This series leaves mds->dcd_supported false on purpose, so
cxl_configure_dcd(), cxl_dev_dc_identify() and cxl_dc_check() are
unreachable at runtime as posted. The tests below are done with the rest
of the series on top, otherwise testing would not yield any meaningful
results.

HW:
Tested add and release of one 2G tagged extent on a DCD with a sharable
partition, driven from the system's BMC with FM-API Initiate Dynamic
Capacity Add / Release over MCTP, to confirm the DCD interrupt
configuration and the DSMAS attributes are read properly. The device
is sharable, so an add without a tag and sequence number is refused.


cxl_test:
ndctl cxl test suite
16 of 17 pass, cxl-features.sh skips for lack of FWCTL

Anisa Su (1):
  Documentation/cxl: Document DPA partition layout and ordering rules

Ira Weiny (7):
  cxl/mbox: Flag support for Dynamic Capacity Devices (DCD)
  cxl/mem: Read dynamic capacity configuration from the device
  cxl/cdat: Gather DSMAS data for DCD partitions
  cxl/events: Split event msgnum configuration from irq setup
  cxl/pci: Factor out interrupt policy check
  cxl/mem: Configure dynamic capacity interrupts
  cxl/core: Enforce partition order/simplify partition calls

 .../driver-api/cxl/linux/cxl-driver.rst       |  35 +++
 Documentation/driver-api/cxl/maturity-map.rst |   4 +
 drivers/cxl/core/cdat.c                       |  99 +++++-
 drivers/cxl/core/hdm.c                        |  24 +-
 drivers/cxl/core/mbox.c                       | 285 ++++++++++++++++++
 drivers/cxl/core/memdev.c                     | 100 ++++--
 drivers/cxl/cxl.h                             |  14 +-
 drivers/cxl/cxlmem.h                          |  88 +++++-
 drivers/cxl/mem.c                             |   2 +-
 drivers/cxl/pci.c                             | 207 ++++++++++---
 include/cxl/cxl.h                             |  29 +-
 tools/testing/cxl/test/mem.c                  |   2 +-
 12 files changed, 792 insertions(+), 97 deletions(-)


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

