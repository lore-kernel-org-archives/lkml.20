Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925472;
	b=ChDgB1gMW0T9WF7vhVYki1V344yacRmt0tABUeLbmgiqfVFlhBcSc47gR+H0yY/icUGt
	 WE78/dBjoZ98M4NNdRTUL8tbTueKHv0xOcRo1cRpaYV+mxRMhhepkYWUBUiKLNnYbhVUr
	 kjFR8ekVxbQ5i8oJZK6nVmXBVSQlYADIUyPf3iL6T/+snNkH6JAd17zHrQYeGm7yepkqF
	 R2xhbmF37jN50bW4Am36Or2LS40nqCVL8Ln9sV/l6vkBHUEuq4JDKoxSHtr32CFcIxCBV
	 n6y28h1aEPjps6UEAaWcK9MtS2rw8AtNhFMY3y7AyH/yWDH1DNwb2zsILPS8RdVIxfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925472;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6/Rjrio0SNVLIgUpxmz1gfXom3XJkBzM0wq13SOApcg=;
	b=brYlVVNI+7bb9jiLDGeLQ8vmBez/ncnFrmGRGycVAa2Ox808WyZJV8liyC7yfHXv6RQR
	 KVGauITW3aoQXqQgwHZQeB+P5mcYQ4afsY3mI3SlnCP8hHN3DifLb+b2yhRcKKP0FBbUD
	 EjZa/EXf4L4K5Tdhhe0hkJ4nqXkqTWcE3KGqsR5+K+u1JfYBdC8mFW0Y/a5ljMJKO66Tk
	 jlBbAsm2aCoGplPAd9w2VAESq/r9uLSuOidYhEnT21B6VwCrn3V8NSp4g02EBsmoABQV3
	 CRhDgsbp/gSccG8oPMimQSa7JO3hlyqKlUY1r1UMT0y9vuJ8DKHhoq5lHc88jYAMosg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P4x3LtmW;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD57606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P4x3LtmW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794925472; x=1826461472;
  h=date:from:to:cc:subject:message-id;
  bh=ieUDP34TF/7yLhYRnxNyhetqoCq8q9VUDTGMMiGkVgw=;
  b=P4x3LtmWTNe9uvpfDXPYpscjToEFl+c7UUELy+nGS+YX1QBDMj63n0fA
   6S/BHkMQBjKAWNhB7VdR9F6Y0nVgbyMZYKMIohBCkBi6j2ku5fOeOlZBD
   AEJjTsSEDkb85HcGRGd2Wny8xwTyIm/53ES4ltxPBZjl4vW8foT+hOpzu
   kwxs169F+DRzg++Fk/wZBKnml3CVn/S5/HXr5vnbiQV9hwr/8yoO5Sfyi
   We584AXWwOJrF14zfRN2glkBbZA6Mi13+KWnhtBoYtRxwSV/1Jv5azXWw
   p4VeOO3gTKTq4aVXBMv6dS6bv0/KunltTc9/VhlerLyARpB/J40n4llgl
   Q==;
X-CSE-ConnectionGUID: zQUm/xXfTRev5rvGO74o5Q==
X-CSE-MsgGUID: 0jY1+1R/TZWV/A+4N15jdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3710466"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3710466"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:24:31 -0800
X-CSE-ConnectionGUID: iuwGNJElRZWFxiObLAkENA==
X-CSE-MsgGUID: E5m7342ySCKUnSEDrT5sKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10238008"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2026 06:24:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTK6l-00000001Bmh-1Wy1;
	Tue, 17 Nov 2026 14:24:27 +0000
Date: Tue, 17 Nov 2026 22:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS WITH WARNING
 be3c65835ade4d487ccbeb08c827662db09ee7e2
Message-ID: <20261117222326.flOHrebs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: be3c65835ade4d487ccbeb08c827662db09ee7e2  Merge branch into tip/master: 'x86/sev'

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202611170109.GCr66gOg-lkp@intel.com

    WARNING: modpost: vmlinux: section mismatch in reference: amdgpu_dm_backlight_set_level+0x1cc (section: .text) -> nowatchdog_setup (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: conv_time_measure+0x20 (section: .text) -> register_tracer (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_flags+0x14 (section: .data) -> acpi_gpe_set_masked_gpes (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: devtmpfs_init_fs_context+0x14 (section: .text) -> mhi_pci_driver_exit (section: .exit.text)
    WARNING: modpost: vmlinux: section mismatch in reference: dpm_noirq_suspend_devices+0x394 (section: .text) -> mhi_ep_exit (section: .exit.text)
    WARNING: modpost: vmlinux: section mismatch in reference: hsi_add_client_from_dt+0x430 (section: .text) -> pnp_setup_reserve_mem (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: hsi_exit+0x0 (section: .exit.text) -> pnp_setup_reserve_mem (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: hsi_register_client_driver+0x0 (section: .text) -> pnp_setup_reserve_mem (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: iblock_configure_device+0x2c (section: .text) -> acpi_pci_root_init (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: kill_pending_fw_fallback_reqs+0x14 (section: .text) -> mv_usb2_phy_driver_init (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: max77976_probe+0x68 (section: .text) -> rv_init_interface (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: micron_nand_init+0x55c (section: .text) -> acpi_button_init (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: netmem_ref_test_page+0xa28 (section: .text) -> init_nls_cp1251 (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: nvfw_bin_hdr+0x34 (section: .text) -> fat_cache_init (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: nvmet_pr_register.isra.0+0x54 (section: .text) -> ipmi_smi_info_same (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: nvmet_pr_replace.isra.0+0xa4 (section: .text) -> cleanup_ipmi_ssif (section: .exit.text)
    WARNING: modpost: vmlinux: section mismatch in reference: nvmet_pr_replace.isra.0+0xa8 (section: .text) -> ipmi_smi_info_same (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: onenand_bbt_wait+0x358 (section: .text) -> acpi_load_tables (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: onenand_chip_probe+0x2e8 (section: .text) -> acpi_install_physical_table (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: onenand_recover_lsb+0xac (section: .text) -> acpi_install_physical_table (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: onenand_resume+0x18 (section: .text) -> acpi_install_physical_table (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: onenand_try_interrupt_wait+0x54 (section: .text) -> acpi_install_physical_table (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: onenand_wait+0x2b8 (section: .text) -> acpi_load_tables (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: onenand_write_oob_nolock+0x80 (section: .text) -> acpi_load_tables (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: onenand_write_ops_nolock+0x58 (section: .text) -> acpi_find_root_pointer (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: regamma_config_regions_and_segments+0x3c (section: .text) -> memblock_allow_resize (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: target_stat_lu_attr_lun+0xc (section: .data) -> acpi_get_madt_revision (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: target_stat_lu_attr_num_cmds+0xc (section: .data) -> acpi_processor_init (section: .init.text)

Warning ids grouped by kconfigs:

recent_errors
`-- loongarch-randconfig-2200-20261115
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:amdgpu_dm_backlight_set_level-(section:.text)-nowatchdog_setup-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:conv_time_measure-(section:.text)-register_tracer-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:dev_attr_flags-(section:.data)-acpi_gpe_set_masked_gpes-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:devtmpfs_init_fs_context-(section:.text)-mhi_pci_driver_exit-(section:.exit.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:dpm_noirq_suspend_devices-(section:.text)-mhi_ep_exit-(section:.exit.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:hsi_add_client_from_dt-(section:.text)-pnp_setup_reserve_mem-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:hsi_exit-(section:.exit.text)-pnp_setup_reserve_mem-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:hsi_register_client_driver-(section:.text)-pnp_setup_reserve_mem-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:iblock_configure_device-(section:.text)-acpi_pci_root_init-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:kill_pending_fw_fallback_reqs-(section:.text)-mv_usb2_phy_driver_init-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:max77976_probe-(section:.text)-rv_init_interface-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:micron_nand_init-(section:.text)-acpi_button_init-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:netmem_ref_test_page-(section:.text)-init_nls_cp1251-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:nvfw_bin_hdr-(section:.text)-fat_cache_init-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:nvmet_pr_register-(section:.text)-ipmi_smi_info_same-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:nvmet_pr_replace-(section:.text)-cleanup_ipmi_ssif-(section:.exit.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:nvmet_pr_replace-(section:.text)-ipmi_smi_info_same-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:onenand_bbt_wait-(section:.text)-acpi_load_tables-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:onenand_chip_probe-(section:.text)-acpi_install_physical_table-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:onenand_recover_lsb-(section:.text)-acpi_install_physical_table-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:onenand_resume-(section:.text)-acpi_install_physical_table-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:onenand_try_interrupt_wait-(section:.text)-acpi_install_physical_table-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:onenand_wait-(section:.text)-acpi_load_tables-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:onenand_write_oob_nolock-(section:.text)-acpi_load_tables-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:onenand_write_ops_nolock-(section:.text)-acpi_find_root_pointer-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:regamma_config_regions_and_segments-(section:.text)-memblock_allow_resize-(section:.init.text)
    |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:target_stat_lu_attr_lun-(section:.data)-acpi_get_madt_revision-(section:.init.text)
    `-- WARNING:modpost:vmlinux:section-mismatch-in-reference:target_stat_lu_attr_num_cmds-(section:.data)-acpi_processor_init-(section:.init.text)

elapsed time: 1407m

configs tested: 469
configs skipped: 3

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261116    gcc-10.5.0
alpha                 randconfig-2000-20261117    gcc-15.3.0
alpha                 randconfig-2001-20261116    gcc-10.5.0
alpha                 randconfig-2001-20261117    gcc-15.3.0
alpha                 randconfig-2200-20261116    gcc-15.3.0 smatch
alpha                 randconfig-2200-20261117    gcc-8.5.0  smatch
alpha                randconfig-r2102-20261116    gcc-9.5.0  cocci
alpha                randconfig-r2103-20261116    gcc-15.3.0 cocci
alpha                randconfig-r2105-20261116    clang-22   cocci
alpha                randconfig-r2107-20261116    clang-24   cocci
alpha                randconfig-r2110-20261116    gcc-16.2.0 cocci
alpha                randconfig-r2301-20261116    gcc-16.2.0 sparse
alpha                randconfig-r2306-20261116    gcc-12.5.0 sparse
alpha                randconfig-r2307-20261116    gcc-16.2.0 sparse
alpha                randconfig-r2307-20261116    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261117    gcc-13.5.0
arc                   randconfig-1001-20261117    gcc-13.5.0
arc                   randconfig-2000-20261116    gcc-13.5.0
arc                   randconfig-2000-20261117    gcc-12.5.0
arc                   randconfig-2001-20261116    gcc-13.5.0
arc                   randconfig-2001-20261117    gcc-12.5.0
arc                   randconfig-2002-20261116    gcc-13.5.0
arc                   randconfig-2002-20261117    gcc-12.5.0
arc                   randconfig-2003-20261116    gcc-13.5.0
arc                   randconfig-2003-20261117    gcc-12.5.0
arc                   randconfig-2004-20261116    gcc-13.5.0
arc                   randconfig-2004-20261117    gcc-12.5.0
arc                   randconfig-2005-20261116    gcc-13.5.0
arc                   randconfig-2005-20261117    gcc-12.5.0
arc                   randconfig-2200-20261116    gcc-15.3.0 smatch
arc                   randconfig-2200-20261117    gcc-8.5.0  smatch
arc                  randconfig-r2307-20261116    gcc-14.4.0 sparse
arc                  randconfig-r2310-20261116    clang-20   sparse
arc                            tb10x_defconfig    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                         neponset_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261117    gcc-13.5.0
arm                   randconfig-1001-20261117    gcc-13.5.0
arm                   randconfig-1002-20261117    gcc-13.5.0
arm                   randconfig-1003-20261117    gcc-13.5.0
arm                   randconfig-2000-20261116    gcc-15.3.0
arm                   randconfig-2001-20261116    gcc-15.3.0
arm                   randconfig-2002-20261116    gcc-15.3.0
arm                   randconfig-2200-20261116    gcc-13.5.0 smatch
arm                  randconfig-r2101-20261116    gcc-14.4.0 cocci
arm                  randconfig-r2110-20261116    clang-24   cocci
arm                  randconfig-r2110-20261116    gcc-14     cocci
arm                  randconfig-r2303-20261116    gcc-16.2.0 sparse
arm                  randconfig-r2310-20261116    gcc-8.5.0  sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261117    gcc-16.2.0
arm64                 randconfig-1001-20261117    gcc-16.2.0
arm64                 randconfig-1002-20261117    gcc-16.2.0
arm64                 randconfig-1003-20261117    gcc-16.2.0
arm64                 randconfig-2000-20261116    gcc-15.3.0
arm64                 randconfig-2001-20261116    gcc-15.3.0
arm64                 randconfig-2002-20261116    gcc-15.3.0
arm64                 randconfig-2200-20261116    gcc-8.5.0  smatch
arm64                 randconfig-2200-20261117    clang-17   smatch
arm64                randconfig-r2100-20261116    clang-22   cocci
arm64                randconfig-r2107-20261116    gcc-16.2.0 cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261117    gcc-16.2.0
csky                  randconfig-1001-20261117    gcc-16.2.0
csky                  randconfig-2000-20261116    gcc-16.2.0
csky                  randconfig-2001-20261116    gcc-16.2.0
csky                  randconfig-2200-20261116    gcc-16.2.0 smatch
csky                  randconfig-2200-20261117    gcc-14.4.0 smatch
csky                 randconfig-r2104-20261116    gcc-14.4.0 cocci
csky                 randconfig-r2105-20261116    gcc-9.5.0  cocci
csky                 randconfig-r2300-20261116    gcc-16.2.0 sparse
csky                 randconfig-r2308-20261116    gcc-14.4.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261117    clang-17
hexagon               randconfig-1001-20261117    clang-17
hexagon               randconfig-2000-20261116    gcc-16.2.0
hexagon               randconfig-2001-20261116    gcc-16.2.0
hexagon               randconfig-2200-20261116    clang-17   smatch
hexagon               randconfig-2200-20261117    clang-17   smatch
hexagon              randconfig-r2104-20261116    clang-22   cocci
hexagon              randconfig-r2108-20261116    gcc-14     cocci
hexagon              randconfig-r2111-20261116    clang-24   cocci
hexagon              randconfig-r2303-20261116    gcc-11.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261117    clang-22
i386        buildonly-randconfig-1001-20261117    clang-22
i386        buildonly-randconfig-1002-20261117    clang-22
i386        buildonly-randconfig-1003-20261117    clang-22
i386        buildonly-randconfig-1004-20261117    clang-22
i386        buildonly-randconfig-1005-20261117    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261117    gcc-14
i386                  randconfig-1001-20261117    gcc-14
i386                  randconfig-1002-20261117    gcc-14
i386                  randconfig-1003-20261117    gcc-14
i386                  randconfig-1004-20261117    gcc-14
i386                  randconfig-1005-20261117    gcc-14
i386                  randconfig-1006-20261117    gcc-14
i386                  randconfig-1007-20261117    clang-22
i386                  randconfig-1008-20261117    clang-22
i386                  randconfig-1009-20261117    clang-22
i386                  randconfig-1010-20261117    clang-22
i386                  randconfig-1011-20261117    clang-22
i386                  randconfig-1012-20261117    clang-22
i386                  randconfig-1013-20261117    clang-22
i386                  randconfig-2000-20261116    gcc-14
i386                  randconfig-2001-20261116    gcc-14
i386                  randconfig-2002-20261116    gcc-14
i386                  randconfig-2003-20261116    gcc-14
i386                  randconfig-2004-20261116    gcc-14
i386                  randconfig-2005-20261116    gcc-14
i386                  randconfig-2100-20261116    gcc-14     cocci
i386                  randconfig-2101-20261116    gcc-14     cocci
i386                  randconfig-2102-20261116    gcc-14     cocci
i386                  randconfig-2103-20261116    gcc-14     cocci
i386                  randconfig-2104-20261116    gcc-14     cocci
i386                  randconfig-2105-20261116    gcc-14     cocci
i386                  randconfig-2200-20261116    gcc-14     smatch
i386                  randconfig-2300-20261116    gcc-14     sparse
i386                  randconfig-2301-20261116    gcc-14     sparse
i386                  randconfig-2302-20261116    gcc-14     sparse
i386                 randconfig-r2102-20261116    clang-22   cocci
i386                 randconfig-r2103-20261116    gcc-14.4.0 cocci
i386                 randconfig-r2106-20261116    clang-24   cocci
i386                 randconfig-r2107-20261116    gcc-14     cocci
i386                 randconfig-r2304-20261116    gcc-14.4.0 sparse
i386                 randconfig-r2308-20261116    clang-17   sparse
i386                 randconfig-r2311-20261116    clang-20   sparse
i386                 randconfig-r2311-20261116    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261117    clang-17
loongarch             randconfig-1001-20261117    clang-17
loongarch             randconfig-2000-20261116    gcc-11.5.0
loongarch             randconfig-2001-20261116    gcc-11.5.0
loongarch             randconfig-2200-20261117    gcc-13.5.0 smatch
loongarch            randconfig-r2101-20261116    clang-22   cocci
loongarch            randconfig-r2107-20261116    clang-24   cocci
loongarch            randconfig-r2300-20261116    gcc-16.2.0 sparse
loongarch            randconfig-r2302-20261116    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                             q40_defconfig    clang-24
m68k                  randconfig-2000-20261116    gcc-10.5.0
m68k                  randconfig-2000-20261117    gcc-15.3.0
m68k                  randconfig-2001-20261116    gcc-10.5.0
m68k                  randconfig-2001-20261117    gcc-15.3.0
m68k                  randconfig-2200-20261116    gcc-14.4.0 smatch
m68k                  randconfig-2200-20261117    gcc-11.5.0 smatch
m68k                 randconfig-r2107-20261116    clang-24   cocci
m68k                 randconfig-r2108-20261116    clang-24   cocci
m68k                 randconfig-r2300-20261116    gcc-11.5.0 sparse
m68k                 randconfig-r2302-20261116    gcc-16.2.0 sparse
m68k                 randconfig-r2311-20261116    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261116    gcc-10.5.0
microblaze            randconfig-2000-20261117    gcc-15.3.0
microblaze            randconfig-2001-20261116    gcc-10.5.0
microblaze            randconfig-2001-20261117    gcc-15.3.0
microblaze            randconfig-2200-20261116    gcc-11.5.0 smatch
microblaze            randconfig-2200-20261117    gcc-14.4.0 smatch
microblaze           randconfig-r2302-20261116    gcc-11.5.0 sparse
microblaze           randconfig-r2309-20261116    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261116    gcc-13.5.0
mips                  randconfig-2001-20261116    gcc-13.5.0
mips                  randconfig-2002-20261116    gcc-13.5.0
mips                  randconfig-2200-20261116    gcc-8.5.0  smatch
mips                 randconfig-r2106-20261116    gcc-16.2.0 cocci
mips                 randconfig-r2301-20261116    gcc-11.5.0 sparse
mips                 randconfig-r2311-20261116    clang-17   sparse
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261117    clang-17
nios2                 randconfig-1001-20261117    clang-17
nios2                 randconfig-2000-20261116    gcc-11.5.0
nios2                 randconfig-2001-20261116    gcc-11.5.0
nios2                 randconfig-2200-20261116    gcc-11.5.0 smatch
nios2                randconfig-r2104-20261116    gcc-9.5.0  cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261116    gcc-13.5.0
openrisc              randconfig-2001-20261116    gcc-13.5.0
openrisc              randconfig-2002-20261116    gcc-13.5.0
openrisc              randconfig-2200-20261116    gcc-15.3.0 smatch
openrisc              randconfig-2200-20261117    gcc-16.2.0 smatch
openrisc             randconfig-r2108-20261116    clang-24   cocci
openrisc             randconfig-r2303-20261116    gcc-16.2.0 sparse
openrisc             randconfig-r2308-20261116    gcc-16.2.0 sparse
openrisc             randconfig-r2309-20261116    gcc-14.4.0 sparse
openrisc             randconfig-r2310-20261116    clang-17   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261117    gcc-9.5.0
parisc                randconfig-1001-20261117    gcc-9.5.0
parisc                randconfig-2000-20261116    gcc-11.5.0
parisc                randconfig-2001-20261116    gcc-11.5.0
parisc                randconfig-2200-20261116    gcc-8.5.0  smatch
parisc                randconfig-2200-20261117    gcc-8.5.0  smatch
parisc               randconfig-r2103-20261116    gcc-9.5.0  cocci
parisc               randconfig-r2105-20261116    gcc-14.4.0 cocci
parisc               randconfig-r2109-20261116    clang-24   cocci
parisc               randconfig-r2301-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2304-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2305-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2306-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2307-20261116    gcc-12.5.0 sparse
parisc               randconfig-r2309-20261116    gcc-12.5.0 sparse
parisc               randconfig-r2310-20261116    gcc-12.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                  mpc8313_rdb_defconfig    gcc-16.2.0
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261117    gcc-9.5.0
powerpc               randconfig-1001-20261117    gcc-9.5.0
powerpc               randconfig-2000-20261116    clang-17
powerpc               randconfig-2000-20261116    clang-24
powerpc               randconfig-2001-20261116    clang-17
powerpc               randconfig-2001-20261116    clang-24
powerpc               randconfig-2002-20261116    clang-17
powerpc               randconfig-2002-20261116    gcc-8.5.0
powerpc               randconfig-2200-20261116    clang-22   smatch
powerpc               randconfig-2200-20261117    gcc-8.5.0  smatch
powerpc              randconfig-r2100-20261116    gcc-14.4.0 cocci
powerpc                      skiroot_defconfig    clang-24
powerpc64             randconfig-1000-20261117    gcc-9.5.0
powerpc64             randconfig-1001-20261117    gcc-9.5.0
powerpc64             randconfig-2000-20261116    clang-17
powerpc64             randconfig-2000-20261116    gcc-10.5.0
powerpc64             randconfig-2001-20261116    clang-17
powerpc64             randconfig-2002-20261116    clang-17
powerpc64             randconfig-2002-20261116    gcc-14.4.0
powerpc64             randconfig-2200-20261116    clang-19   smatch
powerpc64            randconfig-r2104-20261116    gcc-15.3.0 cocci
powerpc64            randconfig-r2106-20261116    gcc-14     cocci
powerpc64            randconfig-r2111-20261116    gcc-14     cocci
powerpc64            randconfig-r2305-20261116    gcc-11.5.0 sparse
powerpc64            randconfig-r2308-20261116    gcc-8.5.0  sparse
powerpc64            randconfig-r2310-20261116    gcc-16.2.0 sparse
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261117    clang-24
riscv                 randconfig-1001-20261117    clang-24
riscv                 randconfig-2000-20261116    clang-20
riscv                 randconfig-2001-20261116    clang-20
riscv                 randconfig-2002-20261116    clang-20
riscv                 randconfig-2003-20261116    clang-20
riscv                 randconfig-2004-20261116    clang-20
riscv                 randconfig-2005-20261116    clang-20
riscv                 randconfig-2200-20261116    clang-24   smatch
riscv                 randconfig-2200-20261117    clang-24   smatch
riscv                randconfig-r2110-20261116    clang-24   cocci
riscv                randconfig-r2303-20261116    gcc-14.4.0 sparse
riscv                randconfig-r2304-20261116    gcc-16.2.0 sparse
riscv                randconfig-r2306-20261116    gcc-14.4.0 sparse
riscv                randconfig-r2308-20261116    gcc-12.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261117    clang-24
s390                  randconfig-1001-20261117    clang-24
s390                  randconfig-2000-20261116    clang-17
s390                  randconfig-2001-20261116    clang-17
s390                  randconfig-2002-20261116    clang-17
s390                  randconfig-2003-20261116    clang-17
s390                  randconfig-2004-20261116    clang-17
s390                  randconfig-2005-20261116    clang-17
s390                  randconfig-2200-20261116    gcc-10.5.0 smatch
s390                  randconfig-2200-20261117    gcc-11.5.0 smatch
s390                 randconfig-r2100-20261116    gcc-9.5.0  cocci
s390                 randconfig-r2101-20261116    gcc-9.5.0  cocci
s390                 randconfig-r2109-20261116    clang-24   cocci
s390                 randconfig-r2111-20261116    clang-24   cocci
s390                 randconfig-r2302-20261116    gcc-14.4.0 sparse
s390                 randconfig-r2304-20261116    gcc-11.5.0 sparse
s390                 randconfig-r2305-20261116    gcc-14.4.0 sparse
s390                 randconfig-r2311-20261116    gcc-14.4.0 sparse
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261117    clang-24
sh                    randconfig-1001-20261117    clang-24
sh                    randconfig-2000-20261116    gcc-15.3.0
sh                    randconfig-2000-20261117    gcc-14.4.0
sh                    randconfig-2001-20261116    gcc-15.3.0
sh                    randconfig-2001-20261117    gcc-14.4.0
sh                    randconfig-2002-20261116    gcc-15.3.0
sh                    randconfig-2002-20261117    gcc-14.4.0
sh                    randconfig-2003-20261116    gcc-15.3.0
sh                    randconfig-2003-20261117    gcc-14.4.0
sh                    randconfig-2004-20261116    gcc-15.3.0
sh                    randconfig-2004-20261117    gcc-14.4.0
sh                    randconfig-2005-20261116    gcc-15.3.0
sh                    randconfig-2005-20261117    gcc-14.4.0
sh                    randconfig-2200-20261116    gcc-15.3.0 smatch
sh                    randconfig-2200-20261117    gcc-16.2.0 smatch
sh                   randconfig-r2101-20261116    gcc-15.3.0 cocci
sh                   randconfig-r2309-20261116    clang-20   sparse
sh                   randconfig-r2311-20261116    gcc-12.5.0 sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                            se7750_defconfig    clang-24
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261117    gcc-15.3.0
sparc                 randconfig-1001-20261117    gcc-15.3.0
sparc                 randconfig-2000-20261116    gcc-14
sparc                 randconfig-2001-20261116    gcc-14
sparc                 randconfig-2200-20261116    gcc-15.3.0 smatch
sparc                randconfig-r2100-20261116    gcc-15.3.0 cocci
sparc                randconfig-r2106-20261116    clang-24   cocci
sparc                randconfig-r2109-20261116    gcc-16.2.0 cocci
sparc                randconfig-r2111-20261116    gcc-16.2.0 cocci
sparc                randconfig-r2300-20261116    gcc-14.4.0 sparse
sparc                randconfig-r2305-20261116    gcc-16.2.0 sparse
sparc                randconfig-r2309-20261116    gcc-16.2.0 sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261117    gcc-15.3.0
sparc64               randconfig-1001-20261117    gcc-15.3.0
sparc64               randconfig-2000-20261116    gcc-14
sparc64               randconfig-2001-20261116    gcc-14
sparc64               randconfig-2200-20261116    gcc-8.5.0  smatch
sparc64               randconfig-2200-20261117    gcc-8.5.0  smatch
sparc64              randconfig-r2102-20261116    gcc-15.3.0 cocci
sparc64              randconfig-r2103-20261116    clang-22   cocci
sparc64              randconfig-r2106-20261116    clang-24   cocci
sparc64              randconfig-r2306-20261116    clang-20   sparse
sparc64              randconfig-r2306-20261116    gcc-8.5.0  sparse
sparc64              randconfig-r2307-20261116    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261117    gcc-15.3.0
um                    randconfig-1001-20261117    gcc-15.3.0
um                    randconfig-2000-20261116    gcc-14
um                    randconfig-2001-20261116    gcc-14
um                    randconfig-2200-20261116    gcc-14     smatch
um                    randconfig-2200-20261117    clang-21   smatch
um                   randconfig-r2102-20261116    gcc-14.4.0 cocci
um                   randconfig-r2105-20261116    gcc-15.3.0 cocci
um                   randconfig-r2110-20261116    clang-24   cocci
um                   randconfig-r2111-20261116    clang-24   cocci
um                   randconfig-r2307-20261116    clang-17   sparse
um                   randconfig-r2309-20261116    clang-17   sparse
um                   randconfig-r2310-20261116    gcc-14.4.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261117    gcc-13
x86_64      buildonly-randconfig-1001-20261117    gcc-13
x86_64      buildonly-randconfig-1002-20261117    gcc-13
x86_64      buildonly-randconfig-1003-20261117    gcc-13
x86_64      buildonly-randconfig-1004-20261117    gcc-13
x86_64      buildonly-randconfig-1005-20261117    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261117    clang-22
x86_64                randconfig-1001-20261117    clang-22
x86_64                randconfig-1002-20261117    clang-22
x86_64                randconfig-1003-20261117    clang-22
x86_64                randconfig-1004-20261117    clang-22
x86_64                randconfig-1005-20261117    clang-22
x86_64                randconfig-1006-20261117    gcc-14
x86_64                randconfig-1007-20261117    gcc-14
x86_64                randconfig-1008-20261117    gcc-14
x86_64                randconfig-1009-20261117    gcc-14
x86_64                randconfig-1010-20261117    gcc-14
x86_64                randconfig-1011-20261117    gcc-14
x86_64                randconfig-1012-20261117    gcc-14
x86_64                randconfig-1013-20261117    gcc-14
x86_64                randconfig-1014-20261117    gcc-14
x86_64                randconfig-1015-20261117    gcc-14
x86_64                randconfig-1016-20261117    gcc-14
x86_64                randconfig-1017-20261117    gcc-14
x86_64                randconfig-2000-20261116    gcc-14
x86_64                randconfig-2001-20261116    gcc-14
x86_64                randconfig-2002-20261116    gcc-14
x86_64                randconfig-2003-20261116    gcc-14
x86_64                randconfig-2004-20261116    gcc-14
x86_64                randconfig-2005-20261116    gcc-14
x86_64                randconfig-2100-20261116    gcc-14     cocci
x86_64                randconfig-2101-20261116    gcc-14     cocci
x86_64                randconfig-2102-20261116    gcc-14     cocci
x86_64                randconfig-2103-20261116    gcc-14     cocci
x86_64                randconfig-2104-20261116    gcc-14     cocci
x86_64                randconfig-2105-20261116    gcc-14     cocci
x86_64                randconfig-2200-20261116    clang-22   smatch
x86_64                randconfig-2200-20261117    gcc-14     smatch
x86_64                randconfig-2300-20261116    gcc-14     sparse
x86_64                randconfig-2301-20261116    gcc-14     sparse
x86_64                randconfig-2302-20261116    gcc-14     sparse
x86_64               randconfig-r2108-20261116    clang-24   cocci
x86_64               randconfig-r2109-20261116    gcc-14     cocci
x86_64               randconfig-r2301-20261116    gcc-14.4.0 sparse
x86_64               randconfig-r2308-20261116    clang-20   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261117    gcc-15.3.0
xtensa                randconfig-1001-20261117    gcc-15.3.0
xtensa                randconfig-2000-20261116    gcc-16.2.0
xtensa                randconfig-2001-20261116    gcc-16.2.0
xtensa                randconfig-2200-20261116    gcc-9.5.0  smatch
xtensa                randconfig-2200-20261117    gcc-8.5.0  smatch
xtensa               randconfig-r2108-20261116    gcc-16.2.0 cocci
xtensa               randconfig-r2109-20261116    clang-24   cocci
xtensa               randconfig-r2306-20261116    clang-17   sparse
xtensa                          virt_defconfig    gcc-16.2.0
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
