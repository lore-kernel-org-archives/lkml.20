Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C1E53E305
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079940; cv=none; b=DekCE40B2AIQARCtKFWVHstx2b9KdPoe6VALRMsUF6iJLmtKFhLjENPNYTFm/BA0ty27V4XlN1K8dwBrtdKFgIFtDio/PiXOokrrScaTGW114c+d7bUnRQ80HIES0RUzDCkCIQABQuCf8ypXVMdfi8vW//3ttkAsL35/Q7lilsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079940; c=relaxed/simple;
	bh=3zrdiBVO8QEvU40IAOdAn6GJVKexilG9cm9Byy0q79Q=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pK//BZlGufnKUXV7J28RguNEwVOrpjw05YYxn2LfZi1YIo63ZTW+mDiojaBVporA7AvVGTRHNoQRgH/tCQAARBDKxAho+pd7cpoeIhRlDtem4VMv1Yxws0d3B90X0r9mB2LTLTBsEh8h1izLgeQXUpGRP7k+ajjdwYaOpGxk1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBfyEp1w; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBfyEp1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792079927; x=1823615927;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3zrdiBVO8QEvU40IAOdAn6GJVKexilG9cm9Byy0q79Q=;
  b=eBfyEp1wKIvVyqlrwqYSDgReTdgRy+8qyVJp+GnVlvErVyHORqWayUi4
   /GkDaRPv1AF8pTxkMC4o72oLLmt/gQIhHfcqoeUM7/6PGHOyEvMdna4Wq
   nUCZkrvnaDiqxRufg7fQrUArgbynw+MbZWbdVXQFcE8bwrB4Dsk4jOpk3
   EnC7OYuiOtW92uG3/shSbXM5OlgkGIlKjC1pl8KWv6aFEZPEY8aeDmCTZ
   Xk+dKO7Y/wvfmSuEikv552SErCjLnNbED27Yr24KFK/70UAlQpI2yMgXC
   TQiUcL4AXV8wgt2rkbiL8z77esthZ7T488rCDD6OTmndJwT81V1yoEccz
   w==;
X-CSE-ConnectionGUID: CJLVimVRSnW+BeKEnOikUg==
X-CSE-MsgGUID: g4/FUDVVSMOMKcYYdZ7Awg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="736848"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="736848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 08:58:47 -0700
X-CSE-ConnectionGUID: HmwuunfwSquz8MQW8QoiCQ==
X-CSE-MsgGUID: mWCltxHwRfG+GucZC0kzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2083877"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Oct 2026 08:58:45 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHNqs-00000000Bk3-3za2;
	Thu, 15 Oct 2026 15:58:42 +0000
Date: Thu, 15 Oct 2026 17:58:34 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: drivers/gpu/drm/xe/xe_pci.c:814:undefined reference to
 `xe_configfs_check_device'
Message-ID: <202610151759.yHT7IcE8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: 13dda74a164b570d93d412e812dc80549506410f drm/xe/configfs: Dump cust=
om settings when binding
date:   1 year, 2 months ago
config: xtensa-randconfig-r2305-20261014 (https://download.01.org/0day-ci/a=
rchive/20261015/202610151759.yHT7IcE8-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261015/202610151759.yHT7IcE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 13dda74a164b ("drm/xe/configfs: Dump custom settings when binding")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151759.yHT7IcE8-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,0193c6fb] overlaps section =
.data VMA [00000000,0032a2ff]
   xtensa-linux-ld: section .init.data VMA [0032a300,0033362b] overlaps sec=
tion .text VMA [00003000,0193c6fb]
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x1e7): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: make_task_d=
ead
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init':
   drivers/gpu/drm/xe/xe_guc.c:840:(.text+0x1b98): undefined reference to `=
xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_p=
ost_hwconfig':
   drivers/gpu/drm/xe/xe_guc.c:91:(.text+0x1e43): undefined reference to `x=
e_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_e=
ngine_setup_default_lrc_state':
   drivers/gpu/drm/xe/xe_hw_engine.c:828:(.text+0x10cc): undefined referenc=
e to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_e=
ngines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x1606): undefined referenc=
e to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined=
 reference to `xe_configfs_init'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined=
 reference to `xe_configfs_exit'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
>> drivers/gpu/drm/xe/xe_pci.c:814:(.text+0x1084): undefined reference to `=
xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:820:(.text+0x11f6): undefined reference to `=
xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `psmi_debugfs=
_capture_addr_show':
   drivers/gpu/drm/xe/xe_psmi.c:272:(.text+0x944): undefined reference to `=
xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debu=
gfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x972): undefined reference to `x=
e_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:301:(.text+0xa04): undefin=
ed reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init=
':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0xa28): undefined reference to `x=
e_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_=
not_sriov_vf':
   drivers/gpu/drm/xe/xe_rtp.c:370:(.text+0x1404): undefined reference to `=
xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c=
:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o:drivers/gpu/=
drm/xe/xe_survivability_mode.c:145:(.text+0x44): undefined reference to `xe=
_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function=
 `xe_survivability_mode_fini':
   drivers/gpu/drm/xe/xe_survivability_mode.c:150:(.text+0x5a): undefined r=
eference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function=
 `xe_survivability_mode_is_enabled':
   drivers/gpu/drm/xe/xe_survivability_mode.c:217:(.text+0x3d4): undefined =
reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:217:(.text+0=
x3ec): undefined reference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function=
 `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:227:(.text+0x453): undefined =
reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:232:(.text+0=
x496): undefined reference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:258:(.text+0=
x5a8): undefined reference to `xe_configfs_clear_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function=
 `xe_survivability_mode_enable':
   drivers/gpu/drm/xe/xe_survivability_mode.c:150:(.text+0x73f): undefined =
reference to `xe_configfs_clear_survivability_mode'


vim +814 drivers/gpu/drm/xe/xe_pci.c

d19ad0e80ebe3da Lucas De Marchi       2023-04-01  793 =20
91b2c42c214f570 Francois Dugast       2024-09-27  794  /*
91b2c42c214f570 Francois Dugast       2024-09-27  795   * Probe the PCI dev=
ice, initialize various parts of the driver.
91b2c42c214f570 Francois Dugast       2024-09-27  796   *
91b2c42c214f570 Francois Dugast       2024-09-27  797   * Fault injection i=
s used to test the error paths of some initialization
91b2c42c214f570 Francois Dugast       2024-09-27  798   * functions called =
either directly from xe_pci_probe() or indirectly for
91b2c42c214f570 Francois Dugast       2024-09-27  799   * example through x=
e_device_probe(). Those functions use the kernel fault
91b2c42c214f570 Francois Dugast       2024-09-27  800   * injection capabil=
ities infrastructure, see
91b2c42c214f570 Francois Dugast       2024-09-27  801   * Documentation/fau=
lt-injection/fault-injection.rst for details. The macro
91b2c42c214f570 Francois Dugast       2024-09-27  802   * ALLOW_ERROR_INJEC=
TION() is used to conditionally skip function execution
91b2c42c214f570 Francois Dugast       2024-09-27  803   * at runtime and us=
e a provided return value. The first requirement for
91b2c42c214f570 Francois Dugast       2024-09-27  804   * error injectable =
functions is proper handling of the error code by the
91b2c42c214f570 Francois Dugast       2024-09-27  805   * caller for recove=
ry, which is always the case here. The second
91b2c42c214f570 Francois Dugast       2024-09-27  806   * requirement is th=
at no state is changed before the first error return.
75fd04f276de31c Nitin Gote            2025-01-06  807   * It is not strictl=
y fulfilled for all initialization functions using the
91b2c42c214f570 Francois Dugast       2024-09-27  808   * ALLOW_ERROR_INJEC=
TION() macro but this is acceptable because for those
91b2c42c214f570 Francois Dugast       2024-09-27  809   * error cases at pr=
obe time, the error code is simply propagated up by the
91b2c42c214f570 Francois Dugast       2024-09-27  810   * caller. Therefore=
 there is no consequence on those specific callers when
91b2c42c214f570 Francois Dugast       2024-09-27  811   * function error in=
jection skips the whole function.
91b2c42c214f570 Francois Dugast       2024-09-27  812   */
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  813  static int xe_pci_pr=
obe(struct pci_dev *pdev, const struct pci_device_id *ent)
d19ad0e80ebe3da Lucas De Marchi       2023-04-01 @814  {
e460410023d95b0 Lucas De Marchi       2023-04-01  815  	const struct xe_dev=
ice_desc *desc =3D (const void *)ent->driver_data;
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  816  	const struct xe_sub=
platform_desc *subplatform_desc;
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  817  	struct xe_device *x=
e;
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  818  	int err;
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  819 =20
13dda74a164b570 Lucas De Marchi       2025-08-21  820  	xe_configfs_check_d=
evice(pdev);
13dda74a164b570 Lucas De Marchi       2025-08-21  821 =20
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  822  	if (desc->require_f=
orce_probe && !id_forced(pdev->device)) {
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  823  		dev_info(&pdev->de=
v,
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  824  			 "Your graphics d=
evice %04x is not officially supported\n"
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  825  			 "by xe driver in=
 this kernel version. To force Xe probe,\n"
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  826  			 "use xe.force_pr=
obe=3D'%04x' and i915.force_probe=3D'!%04x'\n"
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  827  			 "module paramete=
rs or CONFIG_DRM_XE_FORCE_PROBE=3D'%04x' and\n"
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  828  			 "CONFIG_DRM_I915=
_FORCE_PROBE=3D'!%04x' configuration options.\n",
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  829  			 pdev->device, pd=
ev->device, pdev->device,
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  830  			 pdev->device, pd=
ev->device);
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  831  		return -ENODEV;
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  832  	}
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  833 =20
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  834  	if (id_blocked(pdev=
->device)) {
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  835  		dev_info(&pdev->de=
v, "Probe blocked for device [%04x:%04x].\n",
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  836  			 pdev->vendor, pd=
ev->device);
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  837  		return -ENODEV;
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  838  	}
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  839 =20
44e694958b95395 Maarten Lankhorst     2023-08-17  840  	if (xe_display_driv=
er_probe_defer(pdev))
44e694958b95395 Maarten Lankhorst     2023-08-17  841  		return -EPROBE_DEF=
ER;
44e694958b95395 Maarten Lankhorst     2023-08-17  842 =20
f321ef042e69859 Micha=C5=82 Winiarski      2023-11-29  843  	err =3D pcim_e=
nable_device(pdev);
f321ef042e69859 Micha=C5=82 Winiarski      2023-11-29  844  	if (err)
f321ef042e69859 Micha=C5=82 Winiarski      2023-11-29  845  		return err;
f321ef042e69859 Micha=C5=82 Winiarski      2023-11-29  846 =20
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  847  	xe =3D xe_device_cr=
eate(pdev, ent);
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  848  	if (IS_ERR(xe))
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  849  		return PTR_ERR(xe);
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  850 =20
83e5af599755411 Jani Nikula           2024-08-29  851  	pci_set_drvdata(pde=
v, &xe->drm);
f321ef042e69859 Micha=C5=82 Winiarski      2023-11-29  852 =20
c8a740775dfff44 Anshuman Gupta        2023-05-24  853  	xe_pm_assert_unboun=
ded_bridge(xe);
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  854  	subplatform_desc =
=3D find_subplatform(xe, desc);
dd08ebf6c3525a7 Matthew Brost         2023-03-30  855 =20
c0ab10ee2ee6a2c Matt Roper            2023-06-14  856  	pci_set_master(pdev=
);
c0ab10ee2ee6a2c Matt Roper            2023-06-14  857 =20
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  858  	err =3D xe_inf=
o_init_early(xe, desc, subplatform_desc);
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  859  	if (err)
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  860  		return err;
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05  861 =20
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  862  	err =3D xe_dev=
ice_probe_early(xe);
256daa32c9e0dcf Riana Tauro           2025-01-28  863  	/*
86b5e0dbba07438 Lucas De Marchi       2025-03-14  864  	 * In Boot Survivab=
ility mode, no drm card is exposed and driver
86b5e0dbba07438 Lucas De Marchi       2025-03-14  865  	 * is loaded with b=
are minimum to allow for firmware to be
bc417e54e24bc9c Riana Tauro           2025-04-07  866  	 * flashed through =
mei. Return success, if survivability mode
bc417e54e24bc9c Riana Tauro           2025-04-07  867  	 * is enabled due t=
o pcode failure or configfs being set
256daa32c9e0dcf Riana Tauro           2025-01-28  868  	 */
86b5e0dbba07438 Lucas De Marchi       2025-03-14  869  	if (xe_survivabilit=
y_mode_is_enabled(xe))
256daa32c9e0dcf Riana Tauro           2025-01-28  870  		return 0;
256daa32c9e0dcf Riana Tauro           2025-01-28  871 =20
bc417e54e24bc9c Riana Tauro           2025-04-07  872  	if (err)
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  873  		return err;
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  874 =20
f25e698d43fb279 Gustavo Sousa         2025-02-21  875  	err =3D xe_info_ini=
t(xe, desc);
c0ab10ee2ee6a2c Matt Roper            2023-06-14  876  	if (err)
f321ef042e69859 Micha=C5=82 Winiarski      2023-11-29  877  		return err;
c0ab10ee2ee6a2c Matt Roper            2023-06-14  878 =20
dc51c682ddb0104 Matthew Auld          2024-05-22  879  	err =3D xe_display_=
probe(xe);
dc51c682ddb0104 Matthew Auld          2024-05-22  880  	if (err)
dc51c682ddb0104 Matthew Auld          2024-05-22  881  		return err;
44e694958b95395 Maarten Lankhorst     2023-08-17  882 =20
e02cea83d32d3a6 Alexander Usyskin     2024-07-08  883  	drm_dbg(&xe->drm, "=
%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_=
m_s:%d tc:%d gscfi:%d cscfi:%d",
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  884  		desc->platform_nam=
e,
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  885  		subplatform_desc ?=
 subplatform_desc->name : "",
dd08ebf6c3525a7 Matthew Brost         2023-03-30  886  		xe->info.devid, xe=
->info.revid,
9a08b2b935cedec Matt Roper            2023-04-06  887  		xe->info.is_dgfx,
9a08b2b935cedec Matt Roper            2023-04-06  888  		xe->info.graphics_=
name,
9a08b2b935cedec Matt Roper            2023-04-06  889  		xe->info.graphics_=
verx100 / 100,
9a08b2b935cedec Matt Roper            2023-04-06  890  		xe->info.graphics_=
verx100 % 100,
9a08b2b935cedec Matt Roper            2023-04-06  891  		xe->info.media_nam=
e,
9a08b2b935cedec Matt Roper            2023-04-06  892  		xe->info.media_ver=
x100 / 100,
9a08b2b935cedec Matt Roper            2023-04-06  893  		xe->info.media_ver=
x100 % 100,
1eda95cba9df35f Lucas De Marchi       2024-08-13  894  		str_yes_no(xe->inf=
o.probe_display),
437d7a84ada7a4c Vitaly Lubart         2023-08-30  895  		xe->info.dma_mask_=
size, xe->info.tile_count,
e02cea83d32d3a6 Alexander Usyskin     2024-07-08  896  		xe->info.has_heci_=
gscfi, xe->info.has_heci_cscfi);
dd08ebf6c3525a7 Matthew Brost         2023-03-30  897 =20
168448111279e63 Jani Nikula           2024-08-20  898  	drm_dbg(&xe->drm, "=
Stepping =3D (G:%s, M:%s, B:%s)\n",
dd08ebf6c3525a7 Matthew Brost         2023-03-30  899  		xe_step_name(xe->i=
nfo.step.graphics),
dd08ebf6c3525a7 Matthew Brost         2023-03-30  900  		xe_step_name(xe->i=
nfo.step.media),
dd08ebf6c3525a7 Matthew Brost         2023-03-30  901  		xe_step_name(xe->i=
nfo.step.basedie));
dd08ebf6c3525a7 Matthew Brost         2023-03-30  902 =20
2475ac27df59767 Michal Wajdeczko      2023-11-15  903  	drm_dbg(&xe->drm, "=
SR-IOV support: %s (mode: %s)\n",
2475ac27df59767 Michal Wajdeczko      2023-11-15  904  		str_yes_no(xe_devi=
ce_has_sriov(xe)),
2475ac27df59767 Michal Wajdeczko      2023-11-15  905  		xe_sriov_mode_to_s=
tring(xe_device_sriov_mode(xe)));
2475ac27df59767 Michal Wajdeczko      2023-11-15  906 =20
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  907  	err =3D xe_pm_init_=
early(xe);
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  908  	if (err)
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  909  		return err;
fa78e188d8d1df8 Badal Nilawar         2024-01-04  910 =20
dd08ebf6c3525a7 Matthew Brost         2023-03-30  911  	err =3D xe_device_p=
robe(xe);
d01bdc00254c2d1 Lucas De Marchi       2025-02-21  912  	if (err)
f321ef042e69859 Micha=C5=82 Winiarski      2023-11-29  913  		return err;
dd08ebf6c3525a7 Matthew Brost         2023-03-30  914 =20
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  915  	err =3D xe_pm_init(=
xe);
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  916  	if (err)
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  917  		goto err_driver_cl=
eanup;
dd08ebf6c3525a7 Matthew Brost         2023-03-30  918 =20
ff765b7771d874e Matthew Auld          2023-12-04  919  	drm_dbg(&xe->drm, "=
d3cold: capable=3D%s\n",
ff765b7771d874e Matthew Auld          2023-12-04  920  		str_yes_no(xe->d3c=
old.capable));
ff765b7771d874e Matthew Auld          2023-12-04  921 =20
dd08ebf6c3525a7 Matthew Brost         2023-03-30  922  	return 0;
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  923 =20
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  924  err_driver_cleanup:
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  925  	xe_pci_remove(pdev);
c086bfc6ff4db73 Himal Prasad Ghimiray 2024-04-12  926  	return err;
dd08ebf6c3525a7 Matthew Brost         2023-03-30  927  }
dd08ebf6c3525a7 Matthew Brost         2023-03-30  928 =20

:::::: The code at line 814 was first introduced by commit
:::::: d19ad0e80ebe3da48dc8122d6beca9d3d35df454 drm/xe: Extract function to=
 initialize xe->info

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
