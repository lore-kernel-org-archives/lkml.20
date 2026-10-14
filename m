Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514248EBE4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963898; cv=none; b=JQVvsnuhgJEsQctG9DoF1aYt2uo7BhsZrnNOXhFb4p+dVfnxz6vz6f65lfZTEz6r2kMNhlniLCYxTC0b/RBTh+068oVTM+I/Mf8lppetfOjQy0C6jQ7E/Ni5boesVsmMaH3nddBc5kq0Ng0yNw1HGhq74KFZ2JIVp9xe+PqylnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963898; c=relaxed/simple;
	bh=ItyqLzzNqKIz9/WZkUdqVNNjbdF6zEB7a4IomTdFgTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AE0fL6DIKhcFzPI4ypoVzq463eAcqellKLCwAfbQqVr06CCFnnfNLl7ZeD4Isi5eLltYYyLb5DZYs3W2O7/R/wsZIXKqjWTal29T1PA06xysoAESl+UHalnRyl1eQx3bET2k3CodjC3hcMs2lhpKoy+MvLuHYMUkR0GUwSNQI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmgoEC3d; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmgoEC3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791963890; x=1823499890;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ItyqLzzNqKIz9/WZkUdqVNNjbdF6zEB7a4IomTdFgTk=;
  b=BmgoEC3dYdchn2otmNQxNtyEZdqkD5/OmsI+JE02viQiKMQOI80jIOGk
   pdmRoqsA6L04Kk3x6iSyIO/0cazRLvGJG0wHwAPcRj7E6/5DrtdScfqfm
   AuD/Rwy1+RqGc4tvpGCs+nifk4bFICF7qvOYyiRMDs9idtoRJ1J2ik+ka
   HylN9505ms2JYt7zHuM8uCyKHvVV3G0/95ZgpAngXa+obHZwrtmMIn1yx
   AgMMskJRE4SPzlHumM7QgWmmdh29tjrRjqj3ePbiQzvF4ml757tpR1RIF
   7UDcT355PdtPVZnzTN+2mIqBWBka2GastFICBLSAbet70TOwIuuaxp8C/
   A==;
X-CSE-ConnectionGUID: ti0xNIAbThaYPhedCn3A4A==
X-CSE-MsgGUID: Tqx93CwxRSWbR8hAC9Xexg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="606398"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="606398"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 00:44:50 -0700
X-CSE-ConnectionGUID: IG2lFGmDRtqBtr8KtSvKJg==
X-CSE-MsgGUID: 8XCZXUJmT+SjpliY3wYy6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1464043"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2026 00:44:48 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGtfJ-00000000AxH-3v5k;
	Wed, 14 Oct 2026 07:44:45 +0000
Date: Wed, 14 Oct 2026 09:44:21 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"=C5=A0erif?= Rami" <ramiserifpersia@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>
Subject: sound/usb/usx2y/us144mkii.c:27:12: warning: 'index' defined
 but not used
Message-ID: <202610140933.w19JjDF4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi =C5=A0erif,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4056b3c9d3c92ea45955641dbafeb9b960e146ef
commit: 0ec417aa85467c6fad0563621b74868be0faf00d ALSA: usb-audio: Add infra=
structure for TASCAM US-144MKII
date:   1 year, 2 months ago
config: loongarch-randconfig-r2111-20261014 (https://download.01.org/0day-c=
i/archive/20261014/202610140933.w19JjDF4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261014/202610140933.w19JjDF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 0ec417aa8546 ("ALSA: usb-audio: Add infrastructure for TASCAM US-1=
44MKII")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140933.w19JjDF4-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/kfifo.h:40,
                    from sound/usb/usx2y/us144mkii.h:7,
                    from sound/usb/usx2y/us144mkii.c:7:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support=
 for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary w=
hen a recent assembler is used
         |    ^~~~~
>> sound/usb/usx2y/us144mkii.c:27:12: warning: 'index' defined but not used=
 [-Wunused-variable]
      27 | static int index[SNDRV_CARDS] =3D SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/index +27 sound/usb/usx2y/us144mkii.c

dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  12 =20
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  13  /**
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  14   * @brief Module parameters=
 for ALSA card instantiation.
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  15   *
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  16   * These parameters allow u=
sers to configure how the ALSA sound card
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  17   * for the TASCAM US-144MKI=
I is instantiated.
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  18   *
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  19   * @param index: Array of i=
ntegers specifying the ALSA card index for each
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  20   * device. Defaults to -1 (=
automatic).
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  21   * @param id: Array of stri=
ngs specifying the ALSA card ID for each device.
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  22   *            Defaults to "=
US144MKII".
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  23   * @param enable: Array of =
booleans to enable or disable each device.
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  24   *                Defaults =
to {1, 0, ..., 0} (first device enabled).
5c8c10796e274d1 =C5=A0erif Rami 2025-08-14  25   * @param dev_idx: Internal=
 counter for the number of TASCAM devices probed.
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  26   */
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14 @27  static int index[SNDRV_CARD=
S] =3D SNDRV_DEFAULT_IDX;
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  28  static char *id[SNDRV_CARDS=
] =3D SNDRV_DEFAULT_STR;
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  29  static bool enable[SNDRV_CA=
RDS] =3D { 1, [1 ...(SNDRV_CARDS - 1)] =3D 0 };
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  30  static int dev_idx;
dee1bcf28a3dd13 =C5=A0erif Rami 2025-08-14  31 =20

:::::: The code at line 27 was first introduced by commit
:::::: dee1bcf28a3dd13ddb2e9200407864f73e9c4d63 ALSA: usb-audio: Add initia=
l driver for TASCAM US-144MKII

:::::: TO: =C5=A0erif Rami <ramiserifpersia@gmail.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
