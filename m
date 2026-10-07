Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CAB3B71A3;
	Wed,  7 Oct 2026 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379691; cv=none; b=oyxpFQ9GQUuvGIGFe8TdCCTjMk2kJny1NQ9IMdjKaeozPx1xgGtFt1xDGWQ5WwibJobPkD0C6lLcVKuQVKBSnNZkHi1OiGSoZzBm4X1bCfrGesj2BWc7M6hC1ipnJfuBS1wYzvnHaAD4ECM7kZvgPa8TvSKXEEA2jLF5eEws1Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379691; c=relaxed/simple;
	bh=dqn5gPzm8g3TaLWmhg9RnX4KGvjSk/UXhRAz6ZdXq8g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tcg7psIDInTCIlKLKs5ZgtKHJM7XIs6yr0AdxjkFATEDNb0QOXU8Gb8KmkoFq1ifhbawiAIM6v21TD6NqK4rw5/Qz/pRg5POtCvZ8Kg1/LyKctHPn3IUtyWiv2qB662YvNf2CKHL+bqiRBtmVvswu2M/kyMWIPEMfXxEwHZXuSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyDErgIg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyDErgIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379673; x=1822915673;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dqn5gPzm8g3TaLWmhg9RnX4KGvjSk/UXhRAz6ZdXq8g=;
  b=AyDErgIgeY9pHuLGZELSgKYyp3p8ZnWUhjzEIrqtCPLlCGg7m8I0Y/TO
   ozW7+tjFxWf2RQ+HjwVNLCLELoTFytABszWvIoQ4Dn32JoAgI/8lDeadA
   T4LfWnExEylzu9i5DeFnvnDdkq3uxowjnpzsJNtPEsCwZNKOAuiWdXGnG
   k80aFR1BiV5WIQc5FpI0tiTrwPyWATHE1TV2eKYyW7xs+i8OvF6387cK8
   AJuK9izViQ8rDgOGjGesZ3GHFU46aJxNnws4dcQaITY353/n62ACFK3oT
   RM7NR3gWm+k0DQylaavelWOl3j2XNxTzkFYzmtsW2CxVRsA9tx4N6lCf/
   A==;
X-CSE-ConnectionGUID: qOsij63BSk2O7DZw3R8+GA==
X-CSE-MsgGUID: VAjS4eNrSM+tNgkbnzLsDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="242384"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="242384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:27:35 -0700
X-CSE-ConnectionGUID: CYZaA+69Sc2O4zeJhLkESg==
X-CSE-MsgGUID: 5v008PxGQZO+GKTYkdVvnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="64272"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 06:27:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/7] ASoC: core: Create new components in sane state
Date: Wed,  7 Oct 2026 15:33:46 +0200
Message-Id: <20261007133353.455185-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a gap between snd_soc_component_alloc() and
snd_soc_register_component().  A driver that obtains a component object
through snd_soc_component_alloc() receives an object in uninitialized
state.  soc_component_initialize() is the function responsible for
bringing it into a sane one but it is not accessible by the framework
users.  Example of the uninitialized members are the lists e.g.:
comp->dai_list.

The framework shall prevent manipulation of uninitialized components.
Introduce snd_soc_component_new() which acts as a constructor: allocates
and initializes the component object before returning it to the caller.

Given the quite recent discussion related to all things
component-register [1], decided to stick to the "register" wording and
renamed soc_component_add() to snd_soc_component_register().  With that,
register/unregister pattern is kept.  At the same time, the update
brings a clear division between:

	1) snd_soc_component_register(component..)
	2) snd_soc_register_component(dev..)

A driver uses 1) when operating on pre-constructed component object
explicitly and 2) when they want the ASoC framework to do everything for
them.

Parameter "name" is added to the ctor parameter list as it is one of the
fields that is always initialized, see the 'if (!component->name)'
within soc_component_initialize().  Private data on the other hand is
not so opted out of including it.  And thus snd_soc_component_set_priv()
remains intact.

[1]: https://lore.kernel.org/all/87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com/


Cezary Rojewski (7):
  ASoC: core: Add component constructor
  ASoC: core: Rename and export soc_component_add()
  ASoC: dmaengine: Switch to snd_snd_component_new()
  ASoC: topology-test: Switch to snd_snd_component_new()
  ASoC: Intel: catpt: Switch to snd_snd_component_new()
  ASoC: Intel: avs: Switch to snd_snd_component_new()
  ASoC: core: Remove unused component-register members

 include/sound/soc-component.h         |  7 ++-
 include/sound/soc.h                   |  8 +--
 sound/soc/intel/avs/pcm.c             | 11 ++--
 sound/soc/intel/avs/probes.c          | 12 ++---
 sound/soc/intel/catpt/pcm.c           | 12 ++---
 sound/soc/soc-component.c             | 19 -------
 sound/soc/soc-core.c                  | 77 ++++++++++++---------------
 sound/soc/soc-generic-dmaengine-pcm.c | 18 +++----
 sound/soc/soc-topology-test.c         | 66 +++++++++++------------
 9 files changed, 96 insertions(+), 134 deletions(-)

-- 
2.34.1

