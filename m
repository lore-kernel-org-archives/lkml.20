Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB026FD9B;
	Fri,  9 Oct 2026 10:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540862; cv=none; b=uxkVLk9iLkkEE7hBETzdT6Ev95t8JLy2wwqT0Bz7SaXx4FkpmbiLU1eOGQ6buyQVi2ICquGJ24PPP5laQ+8fehvvLYcsrRKlFqxZ4e8yEOjs7Y2ZWl5G8hxw9ZSV+jfvswRKFMn0IlRseFrTTAx8N4CbCXgJqeIsTwQ9lihBTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540862; c=relaxed/simple;
	bh=LrtbA7uiZZ/cvUuWvJqXV+go/wD/kbcePOEx/TtNsvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPmG67azlEkmMl2zrx68sCZkvV91mT6tf8sCR2rU73WYYniIJkpbmLRglITWrVDCo4qU2Aqni0EuHaZ8UvTjLmcUm6eC30EIAfWDNAhIL4/Dsar4F0oTbha9j7uVhcrk2/xOoeMA3xy5UZ9mUgGQuKz0oORhCC3vTLo6iB0UH+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2Gpx1Uf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2Gpx1Uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791540860; x=1823076860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LrtbA7uiZZ/cvUuWvJqXV+go/wD/kbcePOEx/TtNsvc=;
  b=C2Gpx1UfmbyuPsa+3BDwP5cuEw9Q1jL79dlapsaktk/YYQpZe917f0pA
   cvFSKOOw1gcNU5VKDX84syIujr8JVTNP2PR9j9zwbnfvows9l5YMQSJ6J
   2CabrDt8FvUzP9XoWFqt70ar2X8GyG8DpPlphTcY8s26u2b4duuWR5A10
   8lKIPRuNeYRnT6T06d+dnMcDuhWywZUUSYeuKwzBKdggXckS7ZiVCj3pJ
   GQFsPJ1VTwps2zGtFGOLJA/qfvhdBiy40/8/UfyMgxrb5ael488qutQEb
   YUXjUk48QUX4SlFw/mKC1EpfZMXxtAOy2ui+ouqoV+J0vgOehZ7s+rXnY
   w==;
X-CSE-ConnectionGUID: KWpUdzDNSqOEj5Csiq/E8w==
X-CSE-MsgGUID: IC5MYHiFRk2bwA1tWHqqVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="221987"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="221987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:14:08 -0700
X-CSE-ConnectionGUID: TN7QvCBlTwSwQNtlrEVeYg==
X-CSE-MsgGUID: 6FlXj/T9SiGJLr2fAcVF0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="268022"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2026 03:14:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF7c3-000000005bg-34dr;
	Fri, 09 Oct 2026 10:14:03 +0000
Date: Fri, 9 Oct 2026 18:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] ALSA: hda: Add lock around codec->registered flag
 manipulations
Message-ID: <202610091811.68A3cQMi-lkp@intel.com>
References: <20261008192553.300025-4-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008192553.300025-4-tiwai@suse.de>

Hi Takashi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on next-20261008]
[cannot apply to tiwai-sound/for-linus broonie-sound/for-next linus/master v7.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-hda-intel-Cancel-delayed-work-at-shutdown-too/20261008-212541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20261008192553.300025-4-tiwai%40suse.de
patch subject: [PATCH 03/11] ALSA: hda: Add lock around codec->registered flag manipulations
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261009/202610091811.68A3cQMi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091811.68A3cQMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091811.68A3cQMi-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/hda/common/codec.c: In function 'snd_hda_codec_cleanup_for_unbind':
>> sound/hda/common/codec.c:764:32: error: 'bus' undeclared (first use in this function)
     764 |                 spin_lock_irq(&bus->reg_lock);
         |                                ^~~
   sound/hda/common/codec.c:764:32: note: each undeclared identifier is reported only once for each function it appears in
   sound/hda/common/codec.c: In function 'snd_hda_codec_register':
   sound/hda/common/codec.c:820:32: error: 'bus' undeclared (first use in this function)
     820 |                 spin_lock_irq(&bus->reg_lock);
         |                                ^~~


vim +/bus +764 sound/hda/common/codec.c

   753	
   754	/**
   755	 * snd_hda_codec_cleanup_for_unbind - Prepare codec for removal
   756	 * @codec: codec device to cleanup
   757	 */
   758	void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
   759	{
   760		if (codec->core.registered) {
   761			/* pm_runtime_put() is called in snd_hdac_device_exit() */
   762			pm_runtime_get_noresume(hda_codec_dev(codec));
   763			pm_runtime_disable(hda_codec_dev(codec));
 > 764			spin_lock_irq(&bus->reg_lock);
   765			codec->core.registered = false;
   766			spin_unlock_irq(&bus->reg_lock);
   767		}
   768	
   769		snd_hda_codec_disconnect_pcms(codec);
   770		cancel_delayed_work_sync(&codec->jackpoll_work);
   771		if (!codec->in_freeing)
   772			snd_hda_ctls_clear(codec);
   773		codec_release_pcms(codec);
   774		snd_hda_detach_beep_device(codec);
   775		snd_hda_jack_tbl_clear(codec);
   776		codec->proc_widget_hook = NULL;
   777		codec->spec = NULL;
   778	
   779		/* free only driver_pins so that init_pins + user_pins are restored */
   780		snd_array_free(&codec->driver_pins);
   781		snd_array_free(&codec->cvt_setups);
   782		snd_array_free(&codec->spdif_out);
   783		snd_array_free(&codec->verbs);
   784		codec->follower_dig_outs = NULL;
   785		codec->spdif_status_reset = 0;
   786		snd_array_free(&codec->mixers);
   787		snd_array_free(&codec->nids);
   788		remove_conn_list(codec);
   789		snd_hdac_regmap_exit(&codec->core);
   790		codec->configured = 0;
   791		snd_refcount_init(&codec->pcm_ref); /* reset refcount */
   792	}
   793	EXPORT_SYMBOL_GPL(snd_hda_codec_cleanup_for_unbind);
   794	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
