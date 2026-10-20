Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485977;
	b=bX/Fdq8NrNPw/+APA8XtymFRsbMlR11j8qIRNVQa/RSINOQlF6r/sBUxTrF1W9OIDJFm
	 ZvAeVqdWLB2l1LVyDp1bc+eg8j/v5aoISufd8F6MfX0VaOxQY8tbC/x/PEVW6FcqDuvYp
	 hoA/jpBdOYiINizsmZCMsqi4SxYXMTcAJuhhrCJJ6DJbABKO4Prsd1tzRHoN6bBuuIJq3
	 QDandehZ8JHlC9qntoha/P37gDYiwmUVDp95jajW/ckBG2YJ7dFEkCgbZoRcp/esukxIz
	 6YDV1Dk/pxeZ/yhj12n2iRkYVrsAjNCmE4EeG8PzKkmwPWwnZ/NXXgmXfSfWAmES64A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:Cc:From:
	 Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=58BbleitPsJoz6q3EjDgcPxgw/nmtVLy4GsoSeahJJs=;
	b=CwJM8WnaRrrN8zc59G9tW2ytvKnfLkxg9RhHWD1hLzSDxMOn7u5cIOViCqOhqK9mg9KL
	 jS4kDS3Kz73UBKJA1jNQ9b3coqwoRNLgugOKsTT62fOHFjZXHmbb3WKLXCGhlm5ELLziW
	 t4CW11UnK/1sYHNFtkVgK9jUKi4badfeFJbU2QFvCm1FAW6BFKpWQqfZvO/DTaKH35bB0
	 JENG6bm+0nBBkwn+/IpngGlgXFlmlAZFBn3PKF1S60UvWlXqYNLCrVyWtun4b8GCTVQNj
	 HZkvJJSNWhCWnZvbgPVCuP5bWEgkcxgmy8etCWaWeBH/y+S6Sl8Gdb/JoF8d0M4uEVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="JiGvJP/C";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147ED606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147ED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JiGvJP/C
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2271635f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792485975; x=1793090775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=58BbleitPsJoz6q3EjDgcPxgw/nmtVLy4GsoSeahJJs=;
        b=JiGvJP/CTmLewS8lxrgtQQ5NQaUIciYwuczcA53QItl548K2g6Y7UgdTm5ooanBjhK
         Mgqf3ykoFYsIRgG94G0yIAxNS0Ay2laqRxMIOJwTJl17xtKGLPCLs1/6pBZg/eJrD57Y
         8e6fxsZwxK0xZ5vnaFkcagd6jl8YuIFYArCI+Xunbj5dVzBr+UiuvGeSUDQcihetQgAC
         PpGyi2F8X+EnyPpTAWtZVli/xS9nu45j2D99l6P9wxA+MVrhIWXpPn/p+q1LIe/e32My
         t9V/yR02fbVy8qCANweqY7WVBBUVetFA6ikxogNXDsrZxcxn/JjEA1Cn8Yr5lB/NkcfS
         fFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485975; x=1793090775;
        h=content-transfer-encoding:content-type:to:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58BbleitPsJoz6q3EjDgcPxgw/nmtVLy4GsoSeahJJs=;
        b=ZSNvg5uYeL45i24lUaL+AD1AkOnnQB5YWhatU66MuwPJyx4YhJQw2pAwrXCZLEfp46
         5XZ5v79jXMEOxGy5mquFlYKlzBOqr/0e0HqZ+ae1N4OxEbB5oHjjdhRQUBWxJ69EMA45
         tbVh0WjG+8h2QMFkbm12z+jdZARN8pKxF7lcmE0nCwoWzYmtC4PODuS+esAQ/yONnznM
         43HmvlKPP0E5rNyPy1I5E4uPB/cbQjmE90JH7W2FUd4PgqE5IT19TlPTeC31a5htN0Ye
         zyUK+54+sAT2rW/BJzmArXQ0f5dgJDpCXtA0tYRqQ/pD7h/ziCiAjuoTPV+zNVieXBnn
         rMNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoc0evYMsNAQB7rAaRfWuJ878lcchWi5GZAsORBDgUb0iZBMVaZ+oAnbHkP4oGWzumUNQw9AuUDDFXx5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo55jj14aJ9yMlvce++qNjjyyzrvX3DUK6UaEQ2NfmwHyQYsnX
	V/tDXcXY7EbfiWULSZlJM6ZstW7BL5h3E41MurYHciy3h9t9NCC8HSac4yxtYEfKEgg=
X-Gm-Gg: AYBFou2WtE4tSVFNHS5uJ5Ik9yk/24jafZrOzTP2QY59YaLROQcMXDwyI85fGZXk4PY
	yj6SkcrS5/PXRC3zAkHCH1uxPK5NdEMDo6RLbVTsGHiY7pvpMNUXYCZ+PbzWiknHkzEalIOtWqq
	d1Xxsbslobip6+LkF4Bit+/KAfHwPaE0g44RcgxBPYBzllQxsJ5w4izvrTWNnryO5ezRY2IE4io
	xRWBOM1BvyGNwzAY2lKkWulZ3JCzZ7cDqJzOC4dFyTnddOGfbVHREleaW5nDDFvgmyhptYcbVIf
	eft+66LsSMkRSM4JdKjm52sSoWiPdYU+yYe9T175ePqvxtOtM2cKIDoFOei+BMDd0EFltAc4Eog
	ArxnvnJ4VCksj4qRF33/Znokcz8tsyfKzhocQ+B5ulej+2wYegV4gtdaXw79JEkkCYlJGyFxewU
	wzuxL3OytTFptpINDabZThgcDzs1MIPyo7fNh9k8rIPVDfv8o+gnMyYz6esZlMTWhVA8TZ4stJW
	hPxOJ77qZQ24UTUyexUqx3ngtqCnrGYQiCK
X-Received: by 2002:a5d:634c:0:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48e07bc6411mr13861381f8f.21.1792485975301;
        Tue, 20 Oct 2026 01:46:15 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fafdsm4811846f8f.9.2026.10.20.01.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:46:14 -0700 (PDT)
Message-ID: <71c66d25-389b-4d28-b031-1d7d5261decf@suse.com>
Date: Tue, 20 Oct 2026 10:46:14 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Kees Cook <kees+treewide@kernel.org>,
 Priya Bala Govindasamy <pgovind2@uci.edu>, Binbin Deng
 <18983559317@163.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Petr Pavlu <petr.pavlu@suse.com>
Subject: [GIT PULL] Modules changes for v7.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/ tags/modules-7.4-rc1

for you to fetch changes up to 08abfa5a161e1b6e6244cb2090b0530bc0920798:

  drivers: Replace __MODULE_STRING() with __stringify() (2026-10-14 10:51:18 +0200)

----------------------------------------------------------------
Modules changes for 7.4-rc1

- Ignore local labels and mapping symbols during module load

  These symbols were already ignored during kallsyms address-to-symbol
  lookups. Filter them out earlier during module loading to reduce lookup
  overhead and prevent them from appearing in /proc/kallsyms.

- Fix potentially incorrect access of SetOnce<T> when setting Rust module
  parameters.

- Fix a potential read of an uninitialized count when printing taint
  information for unloaded modules.

- Allocate the kmod argument array using kmalloc_array() in preparation
  for conversion to type-aware allocators.

- Clean up includes in linux/kmod.h

  Add explicit includes of linux/umh.h to files that use usermode helpers.
  Then clean up the #include list in linux/kmod.h, notably removing the
  compatibility linux/umh.h include.

- Remove the error-injection.h include from linux/module.h

  Add explicit includes of linux/error-injection.h to files that use the
  ALLOW_ERROR_INJECTION() macro and currently rely on it being provided
  indirectly via linux/module.h. Then remove the unnecessary
  linux/error-injection.h include from linux/module.h.

- Replace __MODULE_STRING() with __stringify() in various drivers in
  preparation for removing the former macro.

The changes to several #include lists have been reported to cause trivial
conflicts in linux-next with the drm, drm-xe, and usb trees.

----------------------------------------------------------------
Binbin Deng (1):
      module: Fix uninitialized count read of unloaded taint tracking record

Kees Cook (1):
      modules/kmod: Allocate argv with kmalloc_array()

Petr Pavlu (10):
      umh, treewide: Explicitly include linux/umh.h where needed
      time/jiffies: Include linux/sysctl.h for proc_int_u2k_conv_uop(), ...
      module: Bring includes in linux/kmod.h up to date
      block: Include error-injection.h for ALLOW_ERROR_INJECTION()
      net: Include error-injection.h for ALLOW_ERROR_INJECTION()
      syscalls: Include error-injection.h for ALLOW_ERROR_INJECTION()
      drm/i915: Include error-injection.h for ALLOW_ERROR_INJECTION()
      drm/xe: Include error-injection.h for ALLOW_ERROR_INJECTION()
      module: Remove the error-injection.h include from linux/module.h
      drivers: Replace __MODULE_STRING() with __stringify()

Priya Bala Govindasamy (1):
      rust: module_param: Fix potentially incorrect access of `SetOnce<T>`

Tiezhu Yang (3):
      module/kallsyms: Rename is_mapping_symbol() to is_ignored_kernel_symbol()
      module/kallsyms: Refactor current symbol filtering into is_core_symbol()
      module/kallsyms: Ignore local labels and mapping symbols during module load

 arch/x86/kernel/cpu/mce/dev-mcelog.c               |  2 +-
 block/blk-core.c                                   |  1 +
 drivers/block/drbd/drbd_nl.c                       |  1 +
 drivers/comedi/comedi_fops.c                       |  5 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  3 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |  1 +
 .../gpu/drm/i915/display/intel_display_driver.c    |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  1 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  1 +
 drivers/gpu/drm/i915/i915_driver.c                 |  1 +
 drivers/gpu/drm/i915/i915_pci.c                    |  2 +
 drivers/gpu/drm/i915/intel_uncore.c                |  1 +
 drivers/gpu/drm/xe/xe_device.c                     |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  1 +
 drivers/gpu/drm/xe/xe_ggtt.c                       |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                        |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c                    |  2 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                  |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |  1 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |  2 +
 drivers/gpu/drm/xe/xe_mmio.c                       |  1 +
 drivers/gpu/drm/xe/xe_oa.c                         |  1 +
 drivers/gpu/drm/xe/xe_pm.c                         |  2 +-
 drivers/gpu/drm/xe/xe_pt.c                         |  2 +
 drivers/gpu/drm/xe/xe_pxp.c                        |  2 +
 drivers/gpu/drm/xe/xe_sriov.c                      |  2 +-
 drivers/gpu/drm/xe/xe_sync.c                       |  1 +
 drivers/gpu/drm/xe/xe_tile.c                       |  2 +-
 drivers/gpu/drm/xe/xe_tuning.c                     |  2 +
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  1 +
 drivers/gpu/drm/xe/xe_wa.c                         |  2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                      |  2 +-
 drivers/greybus/svc_watchdog.c                     |  1 +
 drivers/i2c/busses/i2c-kempld.c                    |  3 +-
 drivers/macintosh/windfarm_core.c                  |  1 +
 drivers/net/ethernet/atheros/atl1e/atl1e_param.c   |  9 ++--
 drivers/net/ethernet/atheros/atlx/atl1.c           |  3 +-
 drivers/net/ethernet/atheros/atlx/atl2.c           | 11 ++--
 drivers/net/ethernet/intel/e1000/e1000_param.c     | 15 +++---
 drivers/net/ethernet/intel/e1000e/param.c          | 16 +++---
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c  |  7 +--
 drivers/net/netdevsim/tc.c                         |  1 +
 drivers/platform/cznic/turris-omnia-mcu-watchdog.c |  3 +-
 drivers/pnp/pnpbios/core.c                         |  2 +-
 drivers/rtc/rtc-ds1374.c                           |  3 +-
 drivers/thunderbolt/tb.c                           |  3 +-
 drivers/thunderbolt/tunnel.c                       |  5 +-
 drivers/tty/serial/8250/8250_platform.c            |  3 +-
 drivers/usb/atm/speedtch.c                         | 15 +++---
 drivers/usb/atm/usbatm.c                           | 17 ++++---
 drivers/video/fbdev/uvesafb.c                      |  1 +
 fs/coredump.c                                      |  2 +-
 fs/nfs/cache_lib.c                                 |  2 +-
 fs/nfsd/nfs4layouts.c                              |  2 +-
 fs/nfsd/nfs4recover.c                              |  1 +
 fs/ocfs2/stackglue.c                               |  1 +
 include/linux/compat.h                             |  1 +
 include/linux/kmod.h                               | 12 +----
 include/linux/module.h                             |  1 -
 include/linux/module_symbol.h                      |  7 ++-
 include/linux/syscalls.h                           |  1 +
 kernel/cgroup/cgroup-v1.c                          |  2 +-
 kernel/module/kallsyms.c                           | 59 ++++++++++++----------
 kernel/module/kmod.c                               |  3 +-
 kernel/module/main.c                               |  1 +
 kernel/module/tracking.c                           |  2 +-
 kernel/power/process.c                             |  2 +-
 kernel/reboot.c                                    |  2 +-
 kernel/time/jiffies.c                              |  1 +
 kernel/umh.c                                       |  2 +-
 lib/kobject_uevent.c                               |  2 +-
 net/bridge/br_stp_if.c                             |  2 +-
 net/core/skb_fault_injection.c                     |  1 +
 rust/kernel/module_param.rs                        |  9 +++-
 scripts/faddr2line                                 |  2 +-
 scripts/mod/modpost.h                              |  2 +-
 security/keys/request_key.c                        |  2 +-
 security/tomoyo/common.h                           |  2 +-
 tools/perf/util/symbol.h                           |  4 +-
 85 files changed, 182 insertions(+), 130 deletions(-)
