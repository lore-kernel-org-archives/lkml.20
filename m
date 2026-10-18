Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3E4483B7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309967; cv=none; b=WCuvEaZoxXezoljBECuaf5BZR9ZOL10gjPzEeQP4IR4tKm+P9xpbmPa5LlKpv3yHqFNDQTfalNycLCd+KSBFgZGJN2pkr1/9kLrMy1C9FAGWXRBFaxg1kaAcw+Caqc/YTk1Zu77D+GKJgYgn/ki61Zfxz5t8RcequKlYtAoHr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309967; c=relaxed/simple;
	bh=XjpPwgcSPOxwmeGG5r5SDYuBj0QiCsHkXRXqLxb34v0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CHmCA7hULI7iwthXMYtSTGyF9hlKLDvGdBbuLIFJnjV4ynHUJYA8c35cts4bgQzcfuD8+NeVJVLC416fyICp/YnP1x1OR2ZF1X5WOGGMME2tiMClQLaT33gbpIdbTwIA9yyjUrgVTjKH8OhDPBNCeqNNuPXBpA729xA/XHTIj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lwqc64Ao; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lwqc64Ao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309962; x=1823845962;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XjpPwgcSPOxwmeGG5r5SDYuBj0QiCsHkXRXqLxb34v0=;
  b=Lwqc64AozcfRNzUGALmRk9Xj3I7aIsm+DjUqEatGYGsqYkY/0+7kEPd8
   EgNkCVqUTcypzmFHnzhJjQBPPoHt6k9r2rAlC/YXQE1Ib8oeTodcehPnc
   LVdTv/lFiL4lDViaXnp1+lxxGSpWteHas8ZW7FuvWdi58sHR/hmbmzxLe
   RC5JybY5Ykl6ajFRjsPmLKO0nF/VQNOrT5lYxgttFj3IJZ9KZF6sjpz/a
   QbK/pbD4YoCV5Hxk7I+/t4HfHJikPXvD0CFcSShZydzKXHkgNY9PPS4H8
   tNNGmWCr8+vLypxbiMDfHdMh3KUOJEY1Fige398kwU1W2yudiDy0DMAzT
   w==;
X-CSE-ConnectionGUID: Jdm6ddmFRaaCVaxbtAwdyg==
X-CSE-MsgGUID: aYzD7PHETyGmwmWDr3BatQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916687"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916687"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:39 -0700
X-CSE-ConnectionGUID: vU9W+ijHTIWwocQI+VuiGw==
X-CSE-MsgGUID: uBxu2vhsQR2M+0EKOLF25g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340823"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xo-1yLM;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:49:20 +0200
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: drivers/gpu/drm/xe/xe_pci.c:758:undefined reference to
 `xe_configfs_primary_gt_allowed'
Message-ID: <202610180018.84KdfsUc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: 7abd69278bb53ab6b43f9650daba550cc7624858 drm/xe/configfs: Add attri=
bute to disable GT types
date:   1 year ago
config: xtensa-randconfig-r2305-20261014 (https://download.01.org/0day-ci/a=
rchive/20261018/202610180018.84KdfsUc-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261018/202610180018.84KdfsUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180018.84KdfsUc-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,0195637b] overlaps section =
.data VMA [00000000,0032bb3b]
   xtensa-linux-ld: section .init.data VMA [0032bb40,0033526b] overlaps sec=
tion .text VMA [00003000,0195637b]
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init':
   xe_guc.c:(.text+0x1854): undefined reference to `xe_configfs_get_psmi_en=
abled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_p=
ost_hwconfig':
   xe_guc.c:(.text+0x1afa): undefined reference to `xe_configfs_get_psmi_en=
abled'
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x1e7): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: make_task_d=
ead
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_e=
ngine_setup_default_lrc_state':
   drivers/gpu/drm/xe/xe_hw_engine.c:830:(.text+0x10cc): undefined referenc=
e to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_e=
ngines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:814:(.text+0x1606): undefined referenc=
e to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_invalid=
ate_state_cache_wa':
   drivers/gpu/drm/xe/xe_lrc.c:1116:(.text+0x6c4): undefined reference to `=
xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configf=
s_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x704): undefined reference to `=
xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1145:(.text+0x784): undefin=
ed reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configf=
s_mid_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x7c4): undefined reference to `=
xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_write_=
ring':
   drivers/gpu/drm/xe/xe_lrc.c:1392:(.text+0x529c): undefined reference to =
`xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x558c): undefined reference to `x=
e_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined=
 reference to `xe_configfs_init'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined=
 reference to `xe_configfs_exit'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_probe=
_tile_count':
>> drivers/gpu/drm/xe/xe_pci.c:758:(.text+0xb28): undefined reference to `x=
e_configfs_primary_gt_allowed'
>> xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:758:(.text+0xb78): undefine=
d reference to `xe_configfs_media_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   drivers/gpu/drm/xe/xe_pci.c:700:(.text+0xf54): undefined reference to `x=
e_configfs_primary_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:730:(.text+0x108a): undefin=
ed reference to `xe_configfs_media_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.c:905:(.text+0x1404): undefin=
ed reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:911:(.text+0x157a): undefined reference to `=
xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `psmi_debugfs=
_capture_addr_show':
   drivers/gpu/drm/xe/xe_psmi.c:260:(.text+0x884): undefined reference to `=
xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debu=
gfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x8b2): undefined reference to `x=
e_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:289:(.text+0x944): undefin=
ed reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init=
':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x968): undefined reference to `x=
e_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_=
not_sriov_vf':
   drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x1384): undefined reference to `=
xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c=
:372: more undefined references to `xe_configfs_get_psmi_enabled' follow
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function=
 `xe_survivability_mode_is_boot_enabled':
   drivers/gpu/drm/xe/xe_survivability_mode.c:285:(.text+0x55c): undefined =
reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function=
 `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x5d2): undefined =
reference to `xe_configfs_get_survivability_mode'


vim +758 drivers/gpu/drm/xe/xe_pci.c

6675c9e209155fb Matt Roper            2025-10-13  749 =20
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05  750  /*
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05  751   * Initialize d=
evice info content that does require knowledge about
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05  752   * graphics / m=
edia IP version.
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05  753   * Make sure th=
at GT / tile structures allocated by the driver match the data
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05  754   * present in d=
evice info.
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05  755   */
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05  756  static int xe_i=
nfo_init(struct xe_device *xe,
f25e698d43fb279 Gustavo Sousa         2025-02-21  757  			const struct xe_d=
evice_desc *desc)
4f5ee007f62a182 Micha=C5=82 Winiarski      2023-12-05 @758  {
6ed6ba32dba14ef Matt Roper            2023-05-24  759  	u32 graphics_gmdid_=
revid =3D 0, media_gmdid_revid =3D 0;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  760  	const struct xe_ip =
*graphics_ip;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  761  	const struct xe_ip =
*media_ip;
f25e698d43fb279 Gustavo Sousa         2025-02-21  762  	const struct xe_gra=
phics_desc *graphics_desc;
f25e698d43fb279 Gustavo Sousa         2025-02-21  763  	const struct xe_med=
ia_desc *media_desc;
a5edc7cdb387511 Matt Roper            2023-06-01  764  	struct xe_tile *til=
e;
dd08ebf6c3525a7 Matthew Brost         2023-03-30  765  	struct xe_gt *gt;
ff1d2b5e3d28a62 Matt Roper            2025-10-13  766  	int ret;
dd08ebf6c3525a7 Matthew Brost         2023-03-30  767  	u8 id;
dd08ebf6c3525a7 Matthew Brost         2023-03-30  768 =20
5822bba943ad2ec Matt Roper            2023-04-06  769  	/*
5822bba943ad2ec Matt Roper            2023-04-06  770  	 * If this platform=
 supports GMD_ID, we'll detect the proper IP
f25e698d43fb279 Gustavo Sousa         2025-02-21  771  	 * descriptor to us=
e from hardware registers.
f25e698d43fb279 Gustavo Sousa         2025-02-21  772  	 * desc->pre_gmdid_=
graphics_ip will only ever be set at this point for
f25e698d43fb279 Gustavo Sousa         2025-02-21  773  	 * platforms before=
 GMD_ID. In that case the IP descriptions and
f25e698d43fb279 Gustavo Sousa         2025-02-21  774  	 * versions are sim=
ply derived from that.
5822bba943ad2ec Matt Roper            2023-04-06  775  	 */
f25e698d43fb279 Gustavo Sousa         2025-02-21  776  	if (desc->pre_gmdid=
_graphics_ip) {
22adf7c51ed1907 Gustavo Sousa         2025-02-21  777  		graphics_ip =3D de=
sc->pre_gmdid_graphics_ip;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  778  		media_ip =3D desc-=
>pre_gmdid_media_ip;
6ed6ba32dba14ef Matt Roper            2023-05-24  779  		xe->info.step =3D =
xe_step_pre_gmdid_get(xe);
6ed6ba32dba14ef Matt Roper            2023-05-24  780  	} else {
f25e698d43fb279 Gustavo Sousa         2025-02-21  781  		xe_assert(xe, !des=
c->pre_gmdid_media_ip);
ff1d2b5e3d28a62 Matt Roper            2025-10-13  782  		ret =3D handle_gmd=
id(xe, &graphics_ip, &media_ip,
6ed6ba32dba14ef Matt Roper            2023-05-24  783  				   &graphics_gmd=
id_revid, &media_gmdid_revid);
ff1d2b5e3d28a62 Matt Roper            2025-10-13  784  		if (ret)
ff1d2b5e3d28a62 Matt Roper            2025-10-13  785  			return ret;
ff1d2b5e3d28a62 Matt Roper            2025-10-13  786 =20
6ed6ba32dba14ef Matt Roper            2023-05-24  787  		xe->info.step =3D =
xe_step_gmdid_get(xe,
6ed6ba32dba14ef Matt Roper            2023-05-24  788  						  graphics_gmd=
id_revid,
6ed6ba32dba14ef Matt Roper            2023-05-24  789  						  media_gmdid_=
revid);
6ed6ba32dba14ef Matt Roper            2023-05-24  790  	}
5822bba943ad2ec Matt Roper            2023-04-06  791 =20
5822bba943ad2ec Matt Roper            2023-04-06  792  	/*
5822bba943ad2ec Matt Roper            2023-04-06  793  	 * If we couldn't d=
etect the graphics IP, that's considered a fatal
5822bba943ad2ec Matt Roper            2023-04-06  794  	 * error and we sho=
uld abort driver load.  Failing to detect media
5822bba943ad2ec Matt Roper            2023-04-06  795  	 * IP is non-fatal;=
 we'll just proceed without enabling media support.
5822bba943ad2ec Matt Roper            2023-04-06  796  	 */
22adf7c51ed1907 Gustavo Sousa         2025-02-21  797  	if (!graphics_ip)
5822bba943ad2ec Matt Roper            2023-04-06  798  		return -ENODEV;
5822bba943ad2ec Matt Roper            2023-04-06  799 =20
22adf7c51ed1907 Gustavo Sousa         2025-02-21  800  	xe->info.graphics_v=
erx100 =3D graphics_ip->verx100;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  801  	xe->info.graphics_n=
ame =3D graphics_ip->name;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  802  	graphics_desc =3D g=
raphics_ip->desc;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  803 =20
22adf7c51ed1907 Gustavo Sousa         2025-02-21  804  	if (media_ip) {
22adf7c51ed1907 Gustavo Sousa         2025-02-21  805  		xe->info.media_ver=
x100 =3D media_ip->verx100;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  806  		xe->info.media_nam=
e =3D media_ip->name;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  807  		media_desc =3D med=
ia_ip->desc;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  808  	} else {
22adf7c51ed1907 Gustavo Sousa         2025-02-21  809  		xe->info.media_nam=
e =3D "none";
22adf7c51ed1907 Gustavo Sousa         2025-02-21  810  		media_desc =3D NUL=
L;
22adf7c51ed1907 Gustavo Sousa         2025-02-21  811  	}
22adf7c51ed1907 Gustavo Sousa         2025-02-21  812 =20
5822bba943ad2ec Matt Roper            2023-04-06  813  	xe->info.has_asid =
=3D graphics_desc->has_asid;
c462f81b695a7cf Nirmoy Das            2024-04-30  814  	xe->info.has_atomic=
_enable_pte_bit =3D graphics_desc->has_atomic_enable_pte_bit;
06e69a424930154 Nirmoy Das            2024-04-30  815  	if (xe->info.platfo=
rm !=3D XE_PVC)
06e69a424930154 Nirmoy Das            2024-04-30  816  		xe->info.has_devic=
e_atomics_on_smem =3D 1;
0c841e47d8d94bd Lucas De Marchi       2024-09-04  817 =20
c697ddcf27bd5c7 Matthew Brost         2025-08-26  818  	xe->info.has_range_=
tlb_inval =3D graphics_desc->has_range_tlb_inval;
5a92da34ddb4ec7 Lucas De Marchi       2023-12-05  819  	xe->info.has_usm =
=3D graphics_desc->has_usm;
82b98cadb01f63c Umesh Nerlige Ramappa 2025-05-09  820  	xe->info.has_64bit_=
timestamp =3D graphics_desc->has_64bit_timestamp;
dd08ebf6c3525a7 Matthew Brost         2023-03-30  821 =20
97a18f834942337 Gustavo Sousa         2025-08-18  822  	xe_info_probe_tile_=
count(xe);
97a18f834942337 Gustavo Sousa         2025-08-18  823 =20
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  824  	for_each_remot=
e_tile(tile, xe, id) {
7e4ce4518b906a9 Micha=C5=82 Winiarski      2023-12-05  825  		int err;
a5edc7cdb387511 Matt Roper            2023-06-01  826 =20
7e4ce4518b906a9 Micha=C5=82 Winiarski      2023-12-05  827  		err =3D xe_ti=
le_init_early(tile, xe, id);
7e4ce4518b906a9 Micha=C5=82 Winiarski      2023-12-05  828  		if (err)
7e4ce4518b906a9 Micha=C5=82 Winiarski      2023-12-05  829  			return err;
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  830  	}
f6929e80cdf540d Matt Roper            2023-06-01  831 =20
6675c9e209155fb Matt Roper            2025-10-13  832  	/* Allocate any GT =
and VRAM structures necessary for the platform. */
4f122766f9043c3 Micha=C5=82 Winiarski      2023-12-05  833  	for_each_tile(=
tile, xe, id) {
f92cfd72d9a650f Piotr Pi=C3=B3rkowski      2025-07-14  834  		int err;
f92cfd72d9a650f Piotr Pi=C3=B3rkowski      2025-07-14  835 =20
f92cfd72d9a650f Piotr Pi=C3=B3rkowski      2025-07-14  836  		err =3D xe_ti=
le_alloc_vram(tile);
f92cfd72d9a650f Piotr Pi=C3=B3rkowski      2025-07-14  837  		if (err)
f92cfd72d9a650f Piotr Pi=C3=B3rkowski      2025-07-14  838  			return err;
f92cfd72d9a650f Piotr Pi=C3=B3rkowski      2025-07-14  839 =20
6675c9e209155fb Matt Roper            2025-10-13  840  		tile->primary_gt =
=3D alloc_primary_gt(tile, graphics_desc, media_desc);
6675c9e209155fb Matt Roper            2025-10-13  841  		if (IS_ERR(tile->p=
rimary_gt))
6675c9e209155fb Matt Roper            2025-10-13  842  			return PTR_ERR(ti=
le->primary_gt);
7bfbad97d38f1de Matt Roper            2023-06-01  843 =20
7abd69278bb53ab Matt Roper            2025-10-13  844  		/*
7abd69278bb53ab Matt Roper            2025-10-13  845  		 * It's not curren=
tly possible to probe a device with the
7abd69278bb53ab Matt Roper            2025-10-13  846  		 * primary GT disa=
bled.  With some work, this may be future in
7abd69278bb53ab Matt Roper            2025-10-13  847  		 * the possible fo=
r igpu platforms (although probably not for
7abd69278bb53ab Matt Roper            2025-10-13  848  		 * dgpu's since ac=
cess to the primary GT's BCS engines is
7abd69278bb53ab Matt Roper            2025-10-13  849  		 * required for VR=
AM management).
7abd69278bb53ab Matt Roper            2025-10-13  850  		 */
7abd69278bb53ab Matt Roper            2025-10-13  851  		if (!tile->primary=
_gt) {
7abd69278bb53ab Matt Roper            2025-10-13  852  			drm_err(&xe->drm,=
 "Cannot probe device with without a primary GT\n");
7abd69278bb53ab Matt Roper            2025-10-13  853  			return -ENODEV;
7abd69278bb53ab Matt Roper            2025-10-13  854  		}
7abd69278bb53ab Matt Roper            2025-10-13  855 =20
6675c9e209155fb Matt Roper            2025-10-13  856  		tile->media_gt =3D =
alloc_media_gt(tile, media_desc);
7bfbad97d38f1de Matt Roper            2023-06-01  857  		if (IS_ERR(tile->m=
edia_gt))
7bfbad97d38f1de Matt Roper            2023-06-01  858  			return PTR_ERR(ti=
le->media_gt);
dd08ebf6c3525a7 Matthew Brost         2023-03-30  859  	}
5822bba943ad2ec Matt Roper            2023-04-06  860 =20
1046be1db620d00 Gustavo Sousa         2025-08-18  861  	/*
1046be1db620d00 Gustavo Sousa         2025-08-18  862  	 * Now that we have=
 tiles and GTs defined, let's loop over valid GTs
1046be1db620d00 Gustavo Sousa         2025-08-18  863  	 * in order to defi=
ne gt_count.
1046be1db620d00 Gustavo Sousa         2025-08-18  864  	 */
1046be1db620d00 Gustavo Sousa         2025-08-18  865  	for_each_gt(gt, xe,=
 id)
1046be1db620d00 Gustavo Sousa         2025-08-18  866  		xe->info.gt_count+=
+;
1046be1db620d00 Gustavo Sousa         2025-08-18  867 =20
5822bba943ad2ec Matt Roper            2023-04-06  868  	return 0;
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  869  }
d19ad0e80ebe3da Lucas De Marchi       2023-04-01  870 =20

:::::: The code at line 758 was first introduced by commit
:::::: 4f5ee007f62a1825cec8140b14b28ef532f570f8 drm/xe: Split xe_info_init

:::::: TO: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
