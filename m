Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDF34252D5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447981; cv=none; b=awjQCtM70Cg/M0vkaSuasbADRkmHBOh4Etav1pTQLMuF+TUZPIR/rsabgi7R5JuyIlZUKiALR4lWbMS5/VJkLuNTCsZY7K/FvLrIW7cJ4OzzIac8jH56Jq2/3yMRZwepkH4hrZD2Fwl2d+hI/6xm4cx80Suodm3e8yRXKr5KEIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447981; c=relaxed/simple;
	bh=tZlGcH7kdTHWEpSMO3QVfn4WCD4FT3cunBUkS42WjLA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBrxriB/tPBsvgYq/99MnuzKTZZlULvK34JoMQ2+dofTR1fJMIaObkHKwiPDS3/PnhG5ayDmw90UCjATd5xiTPKMYiEv5HBhbzOboWy4gdchgclAnx5Ry4YHHRBf+oYAbbLPE7HhlZtwuIoKt8Jp9Lo5NPl5VUkOXN+QsKJePCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyfQU+9I; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyfQU+9I"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a89d1ca907so1634076a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791447979; x=1792052779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CS7qZDwIHCGcSr4m98IhvTEAv/dtevMpM6fVYctnKQg=;
        b=qyfQU+9IA8htJsjIPF89/lB0NK9735Us/3SJRuAMzeqKGor3hvytkoSVmaJOBIb9vw
         csYbMRbvKC1IrNy2XH7n774vWXgCaoz9vez0RaNjqohfJqKFY39YW1FtDuuoQLerp+N5
         mS1Q2WFcdtdj4iP4QF8IyQ0la5/sMcYCKMXSo9J2jmM5SqDi0riHhS9dSoegqUvDfwBF
         0kNP9xjrQ6QT5CJH81VxLyYf9T9cX94n/vUoRa2kJjmXeu5kWS6a2JjgABTDOCheJR0Z
         Fl939DZlKxe6wXkEA9C5HhqXpt8ggndaf4I/gCbN0TSXkHkq4mx4nkt1zLtWJOahl1YX
         Ri8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447979; x=1792052779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CS7qZDwIHCGcSr4m98IhvTEAv/dtevMpM6fVYctnKQg=;
        b=sgn1hy0ZLOSdTpLCR3rHM8SsJuZX1leb15GCCaHo3gPiET86/kjoDzMqtsjCO9KQ2I
         iGAY1vZnNjUTb2RqxuL4gcSbZlYSPR7BO+LDlANDm5PZH94r4S+M/YYn3UlpPF3EJ9Z3
         uBEGK5vgD+6O0rzLlUSnBEy5WS/sIt4FiF9odQQj33ZO+8Bt0PlvldMOtGlW9lRyBUSx
         mDvgdj/UkhXvIoqy9aCMG5FvSd0J47N95CU3M6yBNd0u6V8bnhAID6D9xom7wHkGOU2J
         QfXSRtLHLLastRj9NSoIC43jDVqcxXWMAc4UVh6iDuJE8FRMz7Zlm1WR6/GePdniv4pi
         vMGA==
X-Forwarded-Encrypted: i=1; AKwUvBynB4W0lkKkms80e0gA9MXXVHMYkSt9i7EHQjUYiZ52XrZeGgCHs9ouK36FATKrhLrY/hqnwOl8T8oGydE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJULv6tLYkOrcPuQtf+Wdvww4gwyKEnkPp9f6wiCE9Z9GVRk0oZ
	0yUf/rhoIakuJ2XQEEika/v25L5CKsmGNhu/BLIs5sek3It3p2NwmBI6
X-Gm-Gg: AYBFou0otkgrTXXImv75JLYoWAVXiUvAGZBdvIV0/8iu9lB6w+ogRV7Tkr6frs8rcXt
	0caNjPd+hOZyg5T4Ou4EmcKCbgE5o7BzEtPxTeO75VTBDoC+FWw63WxQwL7hvbN2EeyRWCcugRQ
	21z17Qr5D1RkMfkBuk4lZGi62Mgqa69nWrzO4Zcl027bmHQn0j8PISAQUCM2+/3mAs90qzyBDbX
	tJDoW7UU1vKQi9odO9EZiUSepl5dgc0ud/RlAcoW9vw7ShdgpQ6OvPHnsz1YeyYZekRdEdTWQq3
	LvTreU5/kSL6CNzEwCuVW+1Cc/yyH4HBBdoRvh+GPftTCjbC3NQyGJywzlVaK8uVzqZMlazt0qZ
	b0ApumohFFRPu67elwbtJW3p4YRP4ZNe7UVkuK1Zg+B1/zLILzcmrv1/q1Qe2mVDvaIRe8GFEGY
	5hjIft0BsSN2maF/Lgi9A1ftVZfN6fdvAcE0t2HZKSR0m5Wd4ryLJdZCG0X+Gf38J37Lj/QIOYD
	cuCDzwDMTp1BqqZ6ESvRFTFxALw0Po40zsSOYpjEV2kSdLn/YePGQ5R3+e+zSsrcPFjJ4hVCqAY
	5grTZ8aT3yYSIw==
X-Received: by 2002:a17:90b:498e:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3a8a0f2599amr4163262a91.41.1791447979142;
        Thu, 08 Oct 2026 01:26:19 -0700 (PDT)
Received: from 4470NRD-ASU.ssi.samsung.com (c-24-19-224-150.hsd1.wa.comcast.net. [24.19.224.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d5ced5asm4299357a91.0.2026.10.08.01.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:26:18 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Thu, 8 Oct 2026 01:26:17 -0700
To: Anisa Su <anisa.su887@gmail.com>
Cc: linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dan Williams <djbw@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>, Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>
Subject: Re: [PATCH v15 0/8] DCD Prep Series
Message-ID: <asdTqSxNO0OoHpOh@4470NRD-ASU.ssi.samsung.com>
References: <20261007201828.952-1-anisa.su@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007201828.952-1-anisa.su@samsung.com>

On Wed, Oct 07, 2026 at 01:16:33PM -0700, Anisa Su wrote:
> These are the first eight patches of the Dynamic Capacity Device (DCD)
> series. They set up: DCD enumeration, CDAT handling for DC partitions,
> the event interrupt plumbing, a preparatory refactor, and
> documentation of the DPA partition layout. They stand alone and keep DCD
> disabled. They are not dependent on the rest of the series.
> 
> Patch 1 detects the 48h command set and then leaves mds->dcd_supported
> false. The flag is only turned on by the series that adds DCD event
> handling, so every DCD specific path added here is shut off at runtime:
> cxl_configure_dcd() never runs, no DC partition is created, no DCD
> interrupt is armed, and the CXL_PARTMODE_DYNAMIC_RAM paths are
> unreachable. The intent is to land the enumeration and plumbing while
> the extent to DAX pipeline is still under review.
> 
> Based on v7.3-rc6
> 
> v14: https://lore.kernel.org/linux-cxl/20260918203049.7273-1-anisa.su@samsung.com/T/#m0b6ade9da2d4fefa8aab3bb7db7c29516bc3f955
> 
[snip] 
> Testing
> =======
> This series leaves mds->dcd_supported false on purpose, so
> cxl_configure_dcd(), cxl_dev_dc_identify() and cxl_dc_check() are
> unreachable at runtime as posted. The tests below are done with the rest
> of the series on top, otherwise testing would not yield any meaningful
> results.
> 
> HW:
> Waiting on results from partner team.
> 
For the series:

Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>

Test adding 1 extent/release to ensure interrupt configuration and DSMAS are
read properly.

FMAPI Add command is issued from BMC:
busctl call xyz.openbmc_project.MCTP_SMBus_PCIe_slot \
  /xyz/openbmc_project/mctp xyz.openbmc_project.MCTP.Base \
  SendReceiveMctpMessagePayload yayq \
  9 101 \
  8 0 72 0 0 0x53 88 0 0 0 0 0 0 \
  0 1 84 0 0 72 0 4 0x56 72 0 0 0 0 0 0 \
  0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 \
  1 0 0 0 \
  0 0 0 0 1 0 0 0 \
  0 0 0 0x80 0 0 0 0 \
  0x7a 0x1d 0x4e 0x90 0xc3 0xb2 0x4f 0x57 0x8e 0x6d 0x21 0x5f 0x9a 0xb0 0xc4 0xd3 \
  0 0 \
  0 0 0 0 0 0 \
  100

To add 1 extent with 2GB size, tag=7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3 and
shared sequence num = 0.
The device is shareable, so adding fails without any tag or seq num.

[Thu Oct  8 16:59:57 2026] cxl_core:cxl_mem_get_event_records:1875: cxl_pci 0000:0b:00.0: Reading event logs: 10
[Thu Oct  8 16:59:57 2026] cxl_pci:__cxl_pci_mbox_send_cmd:264: cxl_pci 0000:0b:00.0: Sending command: 0x0100
[Thu Oct  8 16:59:57 2026] cxl_pci:cxl_pci_mbox_wait_for_doorbell:75: cxl_pci 0000:0b:00.0: Doorbell wait took 0ms
[Thu Oct  8 16:59:57 2026] cxl_core:cxl_handle_dcd_event_records:1779: cxl_pci 0000:0b:00.0: DCD event add : DPA:0x100000000 LEN:0x80000000
[Thu Oct  8 16:59:57 2026] cxl_core:cxl_extent_dc_partition:230: cxl_pci 0000:0b:00.0: DC extent DPA [range 0x0000000100000000-0x000000017fffffff] (DCR:[range 0x0000000000000000-0x0000001fffffffff])(7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3)
[Thu Oct  8 16:59:57 2026] cxl_core:cxl_extent_dc_partition:230: cxl_pci 0000:0b:00.0: DC extent DPA [range 0x0000000100000000-0x000000017fffffff] (DCR:[range 0x0000000000000000-0x0000001fffffffff])(7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3)
[Thu Oct  8 16:59:57 2026] cxl_core:cxl_extent_dc_partition:230: cxl_pci 0000:0b:00.0: DC extent DPA [range 0x0000000100000000-0x000000017fffffff] (DCR:[range 0x0000000000000000-0x0000001fffffffff])(7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3)
[Thu Oct  8 16:59:57 2026] cxl_core:__cxl_dpa_to_region:3100: cxl decoder9.0: dpa:0x100000000 mapped in region:region0
[Thu Oct  8 16:59:57 2026] cxl_core:cxl_add_extent:517: cxl decoder9.0: Add extent [range 0x0000000100000000-0x000000017fffffff] (7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3)
[Thu Oct  8 16:59:57 2026] cxl_core:cxlr_add_extent:444: cxl_dax_region dax_region0: Alloc new tag group
[Thu Oct  8 16:59:57 2026] cxl_core:online_tag_group:732:  extent0.3: dc_extent HPA [range 0x0000000100000000-0x000000017fffffff] (7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3)
[Thu Oct  8 16:59:57 2026] cxl_core:__cxlr_notify_extent:394: cxl_dax_region dax_region0: Trying notify: type 0 tag 7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3
[Thu Oct  8 16:59:57 2026] cxl_core:__cxlr_notify_extent:411: cxl_dax_region dax_region0: Notify: type 0 tag 7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3
[Thu Oct  8 16:59:57 2026] cxl_pci:__cxl_pci_mbox_send_cmd:264: cxl_pci 0000:0b:00.0: Sending command: 0x4802
[Thu Oct  8 16:59:57 2026] cxl_pci:cxl_pci_mbox_wait_for_doorbell:75: cxl_pci 0000:0b:00.0: Doorbell wait took 1ms
[Thu Oct  8 16:59:57 2026] cxl_core:cxl_clear_event_record:1080: cxl_pci 0000:0b:00.0: Event log '4': Clearing 9
[Thu Oct  8 16:59:57 2026] cxl_pci:__cxl_pci_mbox_send_cmd:264: cxl_pci 0000:0b:00.0: Sending command: 0x0101
[Thu Oct  8 16:59:57 2026] cxl_pci:cxl_pci_mbox_wait_for_doorbell:75: cxl_pci 0000:0b:00.0: Doorbell wait took 0ms
[Thu Oct  8 16:59:57 2026] cxl_pci:__cxl_pci_mbox_send_cmd:264: cxl_pci 0000:0b:00.0: Sending command: 0x0100
[Thu Oct  8 16:59:57 2026] cxl_pci:cxl_pci_mbox_wait_for_doorbell:75: cxl_pci 0000:0b:00.0: Doorbell wait took 0ms
[Thu Oct  8 17:00:07 2026] cxl_core:cxl_mem_get_event_records:1875: cxl_pci 0000:0b:00.0: Reading event logs: 10
[Thu Oct  8 17:00:07 2026] cxl_pci:__cxl_pci_mbox_send_cmd:264: cxl_pci 0000:0b:00.0: Sending command: 0x0100
[Thu Oct  8 17:00:07 2026] cxl_pci:cxl_pci_mbox_wait_for_doorbell:75: cxl_pci 0000:0b:00.0: Doorbell wait took 0ms
[Thu Oct  8 17:00:07 2026] cxl_core:cxl_handle_dcd_event_records:1779: cxl_pci 0000:0b:00.0: DCD event release : DPA:0x100000000 LEN:0x80000000
[Thu Oct  8 17:00:07 2026] cxl_core:__cxl_dpa_to_region:3100: cxl decoder9.0: dpa:0x100000000 mapped in region:region0
[Thu Oct  8 17:00:08 2026] cxl_core:__cxlr_notify_extent:394: cxl_dax_region dax_region0: Trying notify: type 1 tag 7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3
[Thu Oct  8 17:00:08 2026] cxl_core:__cxlr_notify_extent:411: cxl_dax_region dax_region0: Notify: type 1 tag 7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3
[Thu Oct  8 17:00:08 2026] cxl_core:dc_extent_unregister:528:  extent0.3: DAX region rm extent HPA [range 0x0000000100000000-0x000000017fffffff]
[Thu Oct  8 17:00:08 2026] cxl_core:cxled_release_extent:70: cxl decoder9.0: Remove extent [range 0x0000000100000000-0x000000017fffffff] (7a1d4e90-c3b2-4f57-8e6d-215f9ab0c4d3)
[Thu Oct  8 17:00:08 2026] cxl_core:memdev_release_extent:1201: cxl_pci 0000:0b:00.0: Release response dpa [range 0x0000000100000000-0x000000017fffffff]
[Thu Oct  8 17:00:08 2026] cxl_pci:__cxl_pci_mbox_send_cmd:264: cxl_pci 0000:0b:00.0: Sending command: 0x4803
[Thu Oct  8 17:00:08 2026] cxl_pci:cxl_pci_mbox_wait_for_doorbell:75: cxl_pci 0000:0b:00.0: Doorbell wait took 0ms
[Thu Oct  8 17:00:08 2026] cxl_core:cxl_clear_event_record:1080: cxl_pci 0000:0b:00.0: Event log '4': Clearing 11
[Thu Oct  8 17:00:08 2026] cxl_pci:__cxl_pci_mbox_send_cmd:264: cxl_pci 0000:0b:00.0: Sending command: 0x0101
[Thu Oct  8 17:00:08 2026] cxl_pci:cxl_pci_mbox_wait_for_doorbell:75: cxl_pci 0000:0b:00.0: Doorbell wait took 0ms
[Thu Oct  8 17:00:08 2026] cxl_pci:__cxl_pci_mbox_send_cmd:264: cxl_pci 0000:0b:00.0: Sending command: 0x0100
[Thu Oct  8 17:00:08 2026] cxl_pci:cxl_pci_mbox_wait_for_doorbell:75: cxl_pci 0000:0b:00.0: Doorbell wait took 0ms

> cxl_test:
> ndctl's cxl suite against cxl_test (7.3.0-rc6, CXL as modules)
> 16 of 17 pass, cxl-features.sh skips for lack of FWCTL, and
> cxl-dcd.sh passes.
> 
> QEMU:
> Tested extent add/release and DAX device create/destroy.
> Tested that expected errors are printed from malformed Get DC Configuration
> payload.
> 
> Anisa Su (1):
>   Documentation/cxl: Document DPA partition layout and ordering rules
> 
> Ira Weiny (7):
>   cxl/mbox: Flag support for Dynamic Capacity Devices (DCD)
>   cxl/mem: Read dynamic capacity configuration from the device
>   cxl/cdat: Gather DSMAS data for DCD partitions
>   cxl/events: Split event msgnum configuration from irq setup
>   cxl/pci: Factor out interrupt policy check
>   cxl/mem: Configure dynamic capacity interrupts
>   cxl/core: Enforce partition order/simplify partition calls
> 
>  .../driver-api/cxl/linux/cxl-driver.rst       |  35 +++
>  Documentation/driver-api/cxl/maturity-map.rst |   4 +
>  drivers/cxl/core/cdat.c                       |  97 +++++-
>  drivers/cxl/core/hdm.c                        |  24 +-
>  drivers/cxl/core/mbox.c                       | 285 ++++++++++++++++++
>  drivers/cxl/core/memdev.c                     |  94 ++++--
>  drivers/cxl/cxl.h                             |  14 +-
>  drivers/cxl/cxlmem.h                          |  88 +++++-
>  drivers/cxl/mem.c                             |   2 +-
>  drivers/cxl/pci.c                             | 176 +++++++++--
>  include/cxl/cxl.h                             |  29 +-
>  tools/testing/cxl/test/mem.c                  |   2 +-
>  12 files changed, 761 insertions(+), 89 deletions(-)
> 
> 
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> -- 
> 2.43.0
> 
