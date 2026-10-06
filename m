Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4B72E54B6
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268903; cv=none; b=d0f2xRj5whgv2Lhnen9WFkd0zNz3Ef6Z/UBOSeJ3WMqgOeWQgou2aCd59DHkavIlzf+fA6dEY4OrQgbxv51/Bdg52/YLrINXSl/Nu+QNPjKGRCNoBN/hrj/HRgJZnbXuMNK60qStC2oV2IU6cUOH6kb/QVcI2uHIrnOAwo9fiz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268903; c=relaxed/simple;
	bh=pFL5lDvgARlByILquGZoqydnqRKwCh76odsGbItrWYY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KOjQhN+0FG4g6rxLYP6WxXukpCGysPIaiKIyV7cgRnImY7lMOobqeQI4ChiMbZyBRvwxc/1rkpQCcmL7yIjDpSJ0S8c13u69Z4Ufa9VQRSZUjio2EDSRA+5B/V7Pi3yWAcskNU/7vBnoGgYnhY3OmtD90vi/8C5o3OnrB2e7Ad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzkEPncc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzkEPncc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791268897; x=1822804897;
  h=date:from:to:cc:subject:message-id;
  bh=pFL5lDvgARlByILquGZoqydnqRKwCh76odsGbItrWYY=;
  b=FzkEPncceObNeYOgGZHghVnFM2t4OPHI2Rm+sIBsJHKfMxdTBe6FxnCt
   nTBh2NVcK3g9R05P8QibWE0/7cj3vtFHYNsJeAHKX+03o4eB49blBr+Py
   qacUgCQQTceBe9HuqnMKu3VMAGI/jfJ+gZI9XlTPGHrqN0CkTXqNuD+5v
   GKIAyUQjvS/av5sUYUNyforclA3tcw5BS1J5VLDferKAYwMNxi8F3tSuH
   0+GWFyMSuESNVx4ncWNBGt9PlsiZnmcyIe8eq3yX4adJLMbSEB86l3EJ0
   3My7CPYHB0ch88/wnkyOXcIIb1PX2yYBh9QDRoeLq1od+3z7GpYqgKf80
   w==;
X-CSE-ConnectionGUID: VeoVfDcEQAie2e62oQW91g==
X-CSE-MsgGUID: UH4HLELfR9u8xyFfBjalqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102110369"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102110369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 23:41:37 -0700
X-CSE-ConnectionGUID: 4e1eTGfmTFmmHbF6rS5cvQ==
X-CSE-MsgGUID: 4FNBjerYQPqBJshlMg79Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280313899"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 05 Oct 2026 23:41:35 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDyrk-000000000r3-3WjT;
	Tue, 06 Oct 2026 06:41:32 +0000
Date: Tue, 06 Oct 2026 08:40:45 +0200
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c:72:6-12:
 inconsistent IS_ERR and PTR_ERR on line 73.
Message-ID: <202610060853.t5Q4BX8P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c3418fffa9d037b2038a6db48be63f9e2291806
commit: 5b03d4907db93627ef48396f39c3455ce644c946 drm: rcar-du: encoder: convert to of_drm_find_and_get_bridge()
date:   6 months ago
config: sparc64-randconfig-r2106-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060853.t5Q4BX8P-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5b03d4907db9 ("drm: rcar-du: encoder: convert to of_drm_find_and_get_bridge()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610060853.t5Q4BX8P-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c:72:6-12: inconsistent IS_ERR and PTR_ERR on line 73.

vim +72 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c

f5f16725edbc1a drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03   47  
6978f123776594 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2013-06-15   48  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
ef67a902e946ad drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2013-06-17   49  			 enum rcar_du_output output,
5aebc852af25d8 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-01-17   50  			 struct device_node *enc_node)
4bf8e1962f91ee drivers/gpu/drm/rcar-du/rcar_du_lvds.c            Laurent Pinchart 2013-06-19   51  {
4bf8e1962f91ee drivers/gpu/drm/rcar-du/rcar_du_lvds.c            Laurent Pinchart 2013-06-19   52  	struct rcar_du_encoder *renc;
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25   53  	struct drm_connector *connector;
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   54  	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25   55  	int ret;
4bf8e1962f91ee drivers/gpu/drm/rcar-du/rcar_du_lvds.c            Laurent Pinchart 2013-06-19   56  
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   57  	/*
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   58  	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   59  	 * DT node has a single port, assume that it describes a panel and
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   60  	 * create a panel bridge.
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   61  	 */
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   62  	if ((output == RCAR_DU_OUTPUT_DPAD0 ||
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   63  	     output == RCAR_DU_OUTPUT_DPAD1) &&
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   64  	    rcar_du_encoder_count_ports(enc_node) == 1) {
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   65  		struct drm_panel *panel = of_drm_find_panel(enc_node);
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   66  
9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03   67  		if (IS_ERR(panel))
9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03   68  			return PTR_ERR(panel);
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   69  
89958b7cd9555a drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-09-04   70  		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   71  							 DRM_MODE_CONNECTOR_DPI);
9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03  @72  		if (IS_ERR(bridge))
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09  @73  			return PTR_ERR(no_free_ptr(bridge));
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   74  
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   75  		/*
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   76  		 * The reference taken by devm_drm_panel_bridge_add_typed() is
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   77  		 * released automatically. Take a second one for the __free()
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   78  		 * when this function will return.
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   79  		 */
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   80  		drm_bridge_get(bridge);
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   81  	} else {
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   82  		bridge = of_drm_find_and_get_bridge(enc_node);
9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03   83  		if (!bridge)
9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03   84  			return -EPROBE_DEFER;
53ced169373aab drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-04   85  
53ced169373aab drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-04   86  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
53ced169373aab drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-04   87  		    output == RCAR_DU_OUTPUT_LVDS1)
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   88  			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] =
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   89  				drm_bridge_get(bridge);
957fe62d7d15f4 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Tomi Valkeinen   2022-08-24   90  
957fe62d7d15f4 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Tomi Valkeinen   2022-08-24   91  		if (output == RCAR_DU_OUTPUT_DSI0 ||
957fe62d7d15f4 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Tomi Valkeinen   2022-08-24   92  		    output == RCAR_DU_OUTPUT_DSI1)
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   93  			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] =
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09   94  				drm_bridge_get(bridge);
73eb5476df7207 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-02   95  	}
ef67a902e946ad drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2013-06-17   96  
8e8fddab0d0acd drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-05   97  	/*
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22   98  	 * Create and initialize the encoder. On Gen3, skip the LVDS1 output if
9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03   99  	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  100  	 * mode, or any LVDS output if it isn't connected. The latter may happen
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  101  	 * on D3 or E3 as the LVDS encoders are needed to provide the pixel
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  102  	 * clock to the DU, even when the LVDS outputs are not used.
8e8fddab0d0acd drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-05  103  	 */
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  104  	if (rcdu->info->gen >= 3) {
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  105  		if (output == RCAR_DU_OUTPUT_LVDS1 &&
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  106  		    rcar_lvds_dual_link(bridge))
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  107  			return -ENOLINK;
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  108  
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  109  		if ((output == RCAR_DU_OUTPUT_LVDS0 ||
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  110  		     output == RCAR_DU_OUTPUT_LVDS1) &&
187502afe87a0f drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  111  		    !rcar_lvds_is_connected(bridge))
9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03  112  			return -ENOLINK;
8e8fddab0d0acd drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-05  113  	}
8e8fddab0d0acd drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2019-03-05  114  
206c54710882d8 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  115  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
206c54710882d8 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  116  		enc_node, rcar_du_output_name(output));
9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03  117  
7a1adbd2399023 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Kieran Bingham   2021-01-13  118  	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
7a1adbd2399023 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Kieran Bingham   2021-01-13  119  				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
7a1adbd2399023 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Kieran Bingham   2021-01-13  120  				  NULL);
40f43730f43699 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Dan Carpenter    2023-02-27  121  	if (IS_ERR(renc))
40f43730f43699 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Dan Carpenter    2023-02-27  122  		return PTR_ERR(renc);
f5f16725edbc1a drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03  123  
7a1adbd2399023 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Kieran Bingham   2021-01-13  124  	renc->output = output;
4bf8e1962f91ee drivers/gpu/drm/rcar-du/rcar_du_lvds.c            Laurent Pinchart 2013-06-19  125  
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  126  	/* Attach the bridge to the encoder. */
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  127  	ret = drm_bridge_attach(&renc->base, bridge, NULL,
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  128  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  129  	if (ret) {
206c54710882d8 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  130  		dev_err(rcdu->dev,
206c54710882d8 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  131  			"failed to attach bridge %pOF for output %s (%d)\n",
206c54710882d8 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  132  			bridge->of_node, rcar_du_output_name(output), ret);
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  133  		return ret;
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  134  	}
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  135  
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  136  	/* Create the connector for the chain of bridges. */
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  137  	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  138  	if (IS_ERR(connector)) {
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  139  		dev_err(rcdu->dev,
206c54710882d8 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  140  			"failed to created connector for output %s (%ld)\n",
206c54710882d8 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2021-08-22  141  			rcar_du_output_name(output), PTR_ERR(connector));
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  142  		return PTR_ERR(connector);
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  143  	}
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  144  
c24110a8fd09ac drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-05-25  145  	return drm_connector_attach_encoder(connector, &renc->base);
4bf8e1962f91ee drivers/gpu/drm/rcar-du/rcar_du_lvds.c            Laurent Pinchart 2013-06-19  146  }
5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09  147  

:::::: The code at line 72 was first introduced by commit
:::::: 9a248605980a7547100d06ab9053f49f3ce43418 drm: rcar-du: Skip encoder allocation for LVDS1 in dual-link mode

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
