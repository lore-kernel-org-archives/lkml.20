Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56A3ABD90
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462136; cv=none; b=NE6s5y/A9AmVoXx7JvqOentWOA7zbQEi9pZwSzjZ/HEGTIP/ToZGPfr8QSkYtglpGiy2X1YMGZTZGfBpYTFI0CIEmwtqSAh2pku8h1EIWtmWa5D5mI2oC37r5h001a9vVo9Hf29qBWcXom8JA9lvNllJ+5i54YuHqo4pa+teD3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462136; c=relaxed/simple;
	bh=ZiRnt2IaFBeVcvVKsAU4sSe+VkPw7ElsvEB7qU0lObw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cQCJrIMJgsxKqX9aKUFKWjxtyTRzgicx7IGrJjJz+jA+ya18n+gvGdVtycOm6Zy7VXTibe2NBuXftP2V7eccbNDs2lcQgbzi6eOzqceesR3QL1IShbQpZcKwRRincJLBZjNpFjZq7XV5EL2sVfbL6zXZ201Vp4qIlNp6WWYqvqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYC82+xv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYC82+xv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789462133; x=1820998133;
  h=date:from:to:cc:subject:message-id;
  bh=ZiRnt2IaFBeVcvVKsAU4sSe+VkPw7ElsvEB7qU0lObw=;
  b=VYC82+xv6DiN1xUeWvDejWL0JDzIiGIPYQpeXygnisMilrRFTwOm4OJK
   mCBWKvxDwABqhOhgQ1v/ycWmceS8U+gwtZ/gX7GcxTdmFhsvRUC7kSKI5
   BDVgw4fCcPj2Sn9vegHVi3H+kQDpMn4tGhxkBwzIjKGDGqLupP/8M25AK
   4L8KpoYcMWmpsdOIqEgwXlcJpvCB5rk7Hiwa2ecispeL3b1pXBRePzs3j
   8s8pYAJIy5n4ZNJjPUhoPY2AhKSAL59x0VdCmJCVCx6jeUcv3jplk9qms
   q9myI5gQ2NPvY7dt7dCX3jFq5wl60wS0xRbB8gsJpvsxsD6Wh/Xtg/yRq
   Q==;
X-CSE-ConnectionGUID: lPky+L0HQBSIj0mD+Tco5w==
X-CSE-MsgGUID: V1iM+OYuSUCYHMRPYVTTrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100416190"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100416190"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:48:52 -0700
X-CSE-ConnectionGUID: GwdnEqlOT3yKrHnfnH2bTg==
X-CSE-MsgGUID: ByOl42PvTdaMayGZqxjSxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272882092"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2026 01:48:50 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6OqO-000000000a3-0CtP;
	Tue, 15 Sep 2026 08:48:48 +0000
Date: Tue, 15 Sep 2026 10:47:50 +0200
From: kernel test robot <lkp@intel.com>
To: Lohita Mudimela <lohita.mudimela@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Martin Leung <martin.leung@amd.com>, James Lin <pinglei.lin@amd.com>
Subject: 
 drivers/gpu/drm/amd/display/modules/power/power_abm.c:752:2-7: WARNING: NULL
 check before some freeing functions is not needed.
Message-ID: <202609151011.dVMrN0xv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   587858367581b9c55c3690f4e63382ad622719d4
commit: 254a47ce0c8a52ff78a60f92a13b56db69f69096 drm/amd/display: Separate ABM functions into dedicated power_abm.c file
date:   4 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260915/202609151011.dVMrN0xv-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 254a47ce0c8a ("drm/amd/display: Separate ABM functions into dedicated power_abm.c file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151011.dVMrN0xv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/modules/power/power_abm.c:752:2-7: WARNING: NULL check before some freeing functions is not needed.
--
>> drivers/gpu/drm/amd/display/modules/power/power_abm.c:738:29-30: WARNING opportunity for min()

vim +752 drivers/gpu/drm/amd/display/modules/power/power_abm.c

   605	
   606	/* hard coded to default backlight curve. */
   607	void initialize_backlight_caps(struct core_power *core_power, unsigned int inst)
   608	{
   609		unsigned int i;
   610		struct dm_acpi_atif_backlight_caps *ext_backlight_caps = NULL;
   611		bool custom_curve_present = false;
   612		unsigned int num_levels = 0;
   613		struct dc *dc = NULL;
   614		enum dm_acpi_display_type acpi_display_type =
   615			(inst == 0) ? AcpiDisplayType_LCD1 : AcpiDisplayType_LCD2;
   616	
   617		if (core_power == NULL)
   618			return;
   619		dc = core_power->dc;
   620	
   621		num_levels = core_power->bl_prop[inst].num_backlight_levels;
   622	
   623		/* Allocate memory for ATIF output
   624		 * (do not want to use 256 bytes on the stack)
   625		 */
   626		ext_backlight_caps = (struct dm_acpi_atif_backlight_caps *)
   627			(kzalloc(sizeof(struct dm_acpi_atif_backlight_caps),
   628					GFP_KERNEL));
   629	
   630		if (ext_backlight_caps == NULL)
   631			return;
   632	
   633		/* Retrieve ACPI extended brightness caps */
   634		if (dm_query_extended_brightness_caps
   635			(dc->ctx, acpi_display_type, ext_backlight_caps)) {
   636			custom_curve_present = validate_ext_backlight_caps(ext_backlight_caps);
   637		}
   638	
   639		if (core_power->bl_prop[inst].use_custom_backlight_caps &&
   640				fill_custom_backlight_caps(
   641						core_power->bl_prop[inst].custom_backlight_caps_config_no,
   642						ext_backlight_caps)) {
   643			custom_curve_present = validate_ext_backlight_caps(ext_backlight_caps);
   644		}
   645	
   646		if (custom_curve_present) {
   647			unsigned int index = 1;
   648			unsigned int num_of_data_points = ext_backlight_caps->num_data_points;
   649	
   650			core_power->bl_prop[inst].ac_backlight_percent =
   651				ext_backlight_caps->ac_level_percentage;
   652			core_power->bl_prop[inst].dc_backlight_percent =
   653				ext_backlight_caps->dc_level_percentage;
   654			core_power->bl_prop[inst].backlight_lut[0] =
   655				backlight_8_to_16(
   656					ext_backlight_caps->min_input_signal);
   657			core_power->bl_prop[inst].backlight_lut[num_levels - 1] =
   658				backlight_8_to_16(
   659					ext_backlight_caps->max_input_signal);
   660	
   661			/* Filling translation table from data points -
   662			 * between every two provided data points we
   663			 * lineary interpolate missing values
   664			 */
   665			for (i = 0; i < num_of_data_points; i++) {
   666				unsigned int luminance =
   667					ext_backlight_caps->data_points[i].luminance;
   668				unsigned int signal_level =
   669					backlight_8_to_16(
   670						ext_backlight_caps->data_points[i].signal_level);
   671	
   672				/* Since luminance is a percentage, scale it by num_levels*/
   673				luminance = (luminance * num_levels) / 101;
   674	
   675				/* Lineary interpolate missing values */
   676				if (index < luminance) {
   677					unsigned int base_value =
   678						core_power->bl_prop[inst].backlight_lut[index-1];
   679					unsigned int delta_signal =
   680						signal_level - base_value;
   681					unsigned int delta_luma =
   682						luminance - index + 1;
   683					unsigned int step  = delta_signal;
   684	
   685					for (; index < luminance; index++) {
   686						core_power->bl_prop[inst].backlight_lut[index] =
   687							base_value + (step / delta_luma);
   688						step += delta_signal;
   689					}
   690				}
   691	
   692				/* Now [index == luminance],
   693				 * so we can add data point to the translation table
   694				 */
   695				core_power->bl_prop[inst].backlight_lut[index++] = signal_level;
   696			}
   697	
   698			/* Complete the final segment of interpolation -
   699			 * between last datapoint and maximum value
   700			 */
   701			if (index < num_levels - 1) {
   702				unsigned int base_value =
   703					core_power->bl_prop[inst].backlight_lut[index-1];
   704				unsigned int delta_signal =
   705					core_power->bl_prop[inst].backlight_lut[num_levels - 1] -
   706									base_value;
   707				unsigned int delta_luma = num_levels - index;
   708				unsigned int step = delta_signal;
   709	
   710				for (; index < num_levels - 1; index++) {
   711					core_power->bl_prop[inst].backlight_lut[index] =
   712							base_value + (step / delta_luma);
   713					step += delta_signal;
   714				}
   715			}
   716		/* Build backlight translation table based on default curve */
   717		} else {
   718			/* Defines default backlight curve F(x) = A(x*x) + Bx + C.
   719			 *
   720			 * Backlight curve should always  satisfy:
   721			 * F(0) = min, F(100) = max,
   722			 * So polynom coefficients are:
   723			 * A is 0.0255 - B/100 - min/10000 - (255-max)/10000 =
   724			 * (max - min)/10000 - B/100
   725			 * B is adjustable factor to modify the curve.
   726			 * Bigger B results in less concave curve.
   727			 * B range is [0..(max-min)/100]
   728			 * C is backlight minimum
   729			 */
   730			unsigned int backlight_curve_coeff_a_factor =
   731					num_levels * num_levels;
   732			unsigned int backlight_curve_coeff_b = num_levels;
   733			unsigned int delta =
   734				core_power->bl_prop[inst].backlight_lut[num_levels - 1] -
   735					core_power->bl_prop[inst].backlight_lut[0];
   736			unsigned int coeffC = core_power->bl_prop[inst].backlight_lut[0];
   737			unsigned int coeffB =
 > 738					(backlight_curve_coeff_b < delta ?
   739						backlight_curve_coeff_b : delta);
   740			unsigned long long coeffA = delta - coeffB; /* coeffB is B*100 */
   741	
   742			for (i = 1; i < num_levels - 1; i++) {
   743				uint64_t lut_val = div_u64(coeffA * i * i, backlight_curve_coeff_a_factor) +
   744					div_u64((uint64_t)coeffB * i, backlight_curve_coeff_b) + coeffC;
   745	
   746				ASSERT(lut_val <= 0xFFFFFFFF);
   747				core_power->bl_prop[inst].backlight_lut[i] = (unsigned int)lut_val;
   748			}
   749		}
   750	
   751		if (ext_backlight_caps != NULL)
 > 752			kfree(ext_backlight_caps);
   753	
   754		/* Successfully initialized */
   755		core_power->bl_prop[inst].backlight_caps_valid = true;
   756	}
   757	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
