Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882335;
	b=n2AputpcIVBb3MEy7sGt0sd2OyWto6/eCBTkTsxQjQ8Vz5UibLEla7TZZcbZua4fNDJ2
	 DtDz1GQl5EyLUUTD3IKCs0DUfu3xE/U1EddXu4i/7ldlZ2+z6ONbwJM2gD6BhaM7SxcGY
	 K3+FFD1zynYPGLRtKRSjmFgdWztVdgKaZ8GZ1nrMqAVyns/z0yNeFtavMjt/WNr7evYn3
	 jZ+rVY/Jr6mDNz7PEm2MeTyuldBWde+DZ0ZM/ec/fd0dNA52xtVmSsWU6koOT0I7G0oqT
	 sSMumw1shqd2PUu/iFYFCi+sMRwGFnqhnaUnSeo2UJuD121llj4EDNErArVCDCMYqXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882335;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZF7xyzNFcBy7d9AzY6qYBs8OxNayWF4+/CILH1XylB0=;
	b=pOkdW0Gp8YOEI178ZMUcpCmGH43SDvnWuDDDI6NSMpj1jRp4EIkXdXK+H3At5eams3Wr
	 FTY9anEAXzW9fGV4f7zM29SsPgKHKg4FFeg0UbvjU5IMFqWm02ta1vtUZ3meaQqRWb492
	 h4A6iR3k5B9qOAchC8tkzdfv6TblOMR2r23kcRmmKYGTClP4RGow8zyzdSWiy7Coydttr
	 dMOEaeyBhy3Ai7p7MeU25nR8KU101KhLGXCO7IBVm1z6QVY8Cxq2rGvoL+0heNKE8w7CR
	 Yj9f7X2XxCDB/uXPTDWXOrC21PkRCzAO9F8CxxUN/PJlZUQFnE+xtwMsJDl677JGagQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KyGiXJaX;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC6A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC6A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KyGiXJaX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794882334; x=1826418334;
  h=date:from:to:cc:subject:message-id;
  bh=mfA5dOTw6xVDqnwlJdRPmJ56b9+7/mi5MpxtUssiTso=;
  b=KyGiXJaXJh+YcIWVEAfUBEO8A6oG8cbUyZVoOyqfxlfJMCkNfMRtURq6
   CYnl7pNJP68ydv3tTVhU+DHUVOEUkCJTZzblGvfuEfDO3V0KV0TsFOb65
   U0kk7C4/ziz/QkwgZYMUDHrTxxRgLqAmAXDGNdqnG/RkW1Ld46XmFKRq9
   uf1Q/Pelq7yIaepOKjAvmd9OYVvjORSE2EpiUWttoKDsqFLyBXXwWb0Nt
   o7boNJIC4x2ewD0ToSC53sq/fplHoLvsK4uf4P7ijYonmtwxwgD4gb8lJ
   PBP3tGz08LOcmy5zBirl1iHDZgXxBnVVsOe+eW80t1ae5c4OBa4ZZWQfp
   Q==;
X-CSE-ConnectionGUID: 6r9TGiX4SROyuBkxHlB8yA==
X-CSE-MsgGUID: AFMrDuupQk6EsY1CG0pUeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3489144"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3489144"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 18:25:34 -0800
X-CSE-ConnectionGUID: MyRAP4nIQrCM7V+mjQc4mg==
X-CSE-MsgGUID: jAzNh/hdSpCl9FWjbUyq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9951668"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2026 18:25:31 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT8sy-000000002w6-3Y6D;
	Tue, 17 Nov 2026 02:25:28 +0000
Date: Tue, 17 Nov 2026 03:24:45 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>
Subject: drivers/ufs/host/ufs-mediatek.c:1351:32-33: WARNING: Use
 ARRAY_SIZE
Message-ID: <202611170300.dsQhfOB9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   141b164bbe186423e295b139e40e8e2d11cf1341
commit: 1fd05367d5b1a5edd3d14c966a5f510e5b8a0c5e scsi: ufs: host: mediatek: Adjust sync length for FASTAUTO mode
date:   1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261117/202611170300.dsQhfOB9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1fd05367d5b1 ("scsi: ufs: host: mediatek: Adjust sync length for FASTAUTO mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170300.dsQhfOB9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/ufs/host/ufs-mediatek.c:1351:32-33: WARNING: Use ARRAY_SIZE

vim +1351 drivers/ufs/host/ufs-mediatek.c

  1334	
  1335	static void ufs_mtk_adjust_sync_length(struct ufs_hba *hba)
  1336	{
  1337		int i;
  1338		u32 value;
  1339		u32 cnt, att, min;
  1340		struct attr_min {
  1341			u32 attr;
  1342			u32 min_value;
  1343		} pa_min_sync_length[] = {
  1344			{PA_TXHSG1SYNCLENGTH, 0x48},
  1345			{PA_TXHSG2SYNCLENGTH, 0x48},
  1346			{PA_TXHSG3SYNCLENGTH, 0x48},
  1347			{PA_TXHSG4SYNCLENGTH, 0x48},
  1348			{PA_TXHSG5SYNCLENGTH, 0x48}
  1349		};
  1350	
> 1351		cnt = sizeof(pa_min_sync_length) / sizeof(struct attr_min);
  1352		for (i = 0; i < cnt; i++) {
  1353			att = pa_min_sync_length[i].attr;
  1354			min = pa_min_sync_length[i].min_value;
  1355			ufshcd_dme_get(hba, UIC_ARG_MIB(att), &value);
  1356			if (value < min)
  1357				ufshcd_dme_set(hba, UIC_ARG_MIB(att), min);
  1358	
  1359			ufshcd_dme_peer_get(hba, UIC_ARG_MIB(att), &value);
  1360			if (value < min)
  1361				ufshcd_dme_peer_set(hba, UIC_ARG_MIB(att), min);
  1362		}
  1363	}
  1364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
