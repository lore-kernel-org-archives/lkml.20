Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E729B79B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437998; cv=none; b=B0ZCjUvhJM4idZ6YHoXRmYGYLCFltILnBsSHQNffdRtoGJeHt2Z2g5h2uKvzGD1WqjRjb+c0bJI3eDAcNNYpnvogouxkUxSMgw7DQYuLELNr7zwZ4N1blZWtUS0vcv4YWFZ7gLfzaS0QxAQcvqCN8DL129u3WDu/ISJ62fu4JyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437998; c=relaxed/simple;
	bh=on37lN6/Zxr7e6mdEUe8cusBmu0w1dvKDy26WT3+faU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsGrvfhixwenXXEqn+rm02qJ7NQ/h/btBrnB1OCPxthSwxoCdpHyZ9uQ5oCi71lAOi4eo4Z69/YATlAH4NlFEeU4bSX7McHWttAPjixbAe+nK+fVcBXWnyW5F1X8GlhA3NUbrOHxPr/MBpOYxD3vq8R1w/rH6PBAuL/ycUDSoC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTySFzLR; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTySFzLR"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c6so2702693b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437996; x=1790042796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kohFnMfsk3hAo5zNTDQBaGiUupErrRdc/HstF4br6OM=;
        b=iTySFzLRJi490Q+5FiXGkw35qjhXCPWlKbOMWNc2rTmBE0BjoqVoQwUslOIZKwWYqG
         JAzP6epNvN1mVZUectsHX+KbS+mnJ/wY5n+4sBACb5hcf9Nu8QTmYpR0PtMrukqy8/ZA
         yK1lNgSMhkHuoBvbZCEzqsN4Bm3WczHp57FE10a3LPrLwjt4iRC23+xRmQbefmHYkmFh
         woL0OdSKEvNmEfww8VbtczQYzxjnBXta1K16RSPbq1nQyoxva+O2rPXurBMujXgIcgdy
         JNNYe4pK2lUsdRCdSGU770uOVcewnKwKpeKhM8Rw/XY0zPEICDhXtIs32m99W8zIOtpI
         gc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437996; x=1790042796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kohFnMfsk3hAo5zNTDQBaGiUupErrRdc/HstF4br6OM=;
        b=rDlWWwHq2Y/Qtk96fCwlxFZl9GOiA+s1/Eafum6zoqP3PV8trKmFtw17cSPmPrHpPf
         eXpz2OfeBG1LwBipxXKWt+aDWbbubmyGMAaWwquVyUIGMWCvd0nld25ZnRtZDifzXsx+
         ds1AjVW01EHfuBKxFuzCCbYq6bXhI4BQwBZxWDKA8QCBFv0iktBHo8UqpT3GC/vJZxGY
         G2W6dQiDAAYjK16CI/R23D/4+yf0OK7T6SJlMf3aIDtnKqGsknHzK4/FcQ3kAJfV2xgU
         MZ5o3eC02WNj9SU7Zwn6Kvvb08vGEAeAU+1wgJ1EylmPt0vY5jidr/CkPuHf/q/RiSFd
         /b+w==
X-Forwarded-Encrypted: i=1; AKwUvBwWOF8VF9ZulQasc0lDWKoRsmrw3C6i+je7meQUd4U+MPb/Wf0/24NsQCMY5mnzVNIfx+N7TUtE+EDRl4g=@vger.kernel.org
X-Gm-Message-State: AFuF++nnYbbpxp3Tgik7ofynYKKZBibozEtwQH+cDh31ucF75lhDm1HD
	WmPWi27U3Rb4J/gx8q/3iVr5laFYEl7F+B+js94ayLYOghDfC2ZGYYKXeKDDwA==
X-Gm-Gg: AYBFou2AXPCzZe88JQOWYrXoTtCfvsw7Do80DIT7q4PLQIaL864q4ZN8Drjp8hP3ZT7
	bKDH95p0HsGEuzDWH1Ei+ULXN4NHSoPWrguG0HlDSsh0muSTc5YuRz873FVU/fUv7e3Py785K1G
	hepwt/AISQqPN2QKLGF3f9rhs0IXeVFGTnVPtm+AMFlOMw0OkMPAJucjmA6Iqu00kI2LAWy1Hxl
	21folCLBj2bZ8aSmoizfQLNrfjdDxEv3pvAtoks8xjm9e1ckdTiZ+L7mdrNjfCBi2Uha/M0/VUU
	Vxr/m6GN2Rois6QydbNZK7BHK0AMR+EYH6yBc7c/C/pJLC3L4vCJMU9TF62l8RyDTCvC5iT3cHk
	oImu4Ulyh0jkCefX58bjYIXfdsvOsbB+aqtXk31BCxv+paGNGs/szXwzpmPonyLxqu+OjcimwD8
	xpi6yORd0MeyE2D++EnifOVmW+PBBZlem8qDkrjzUJds3h6vf0wQqw93zdnXmKqEQFkFvApHs3q
	/3x6kKv7iJtgtrzrdcf7kW+m4Bj+aIVdGB0zUBQU+/Afq2OoIh4fzY=
X-Received: by 2002:a05:6a00:148a:b0:86b:472a:e84e with SMTP id d2e1a72fcca58-86f857f02c9mr9526393b3a.20.1789437995785;
        Mon, 14 Sep 2026 19:06:35 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86cc50c786bsm3671272b3a.41.2026.09.14.19.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 19:06:35 -0700 (PDT)
Message-ID: <0e3ac531-aae3-402d-9d24-87d75295f382@gmail.com>
Date: Tue, 15 Sep 2026 10:06:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] drm/verisilicon: introduce per-variant hardware
 ops table
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-4-a0987203069@gmail.com>
 <eacd63daeef147657329edbad4cff7b85f2dba8c.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <eacd63daeef147657329edbad4cff7b85f2dba8c.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Icenowy Zheng 於 2026/9/14 下午 11:00 寫道:
> 在 2026-09-08二的 17:28 +0800，Joey Lu写道：
>> The DC8200 and DCUltraLite share a broadly similar register layout
>> but
>> differ in how the bridge, CRTC, primary plane and IRQ paths are
>> driven.
>> Introduce a vs_dc_funcs vtable so each variant can supply its own
>> implementation without scattering conditionals across multiple files.
>>
>> Add a generation field to struct vs_chip_identity to distinguish
>> variants.
>> Extract the DC8200-specific hardware ops into vs_dc8200.c and add
>> unified
>> IRQ bit definitions so implementations can translate hardware-
>> specific
>> bits to a common set.  Update the shared code to dispatch through
>> dc->funcs.
>>
>> No behaviour change for existing DC8200 platforms.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>> ---
>>   drivers/gpu/drm/verisilicon/Makefile          |   2 +-
>>   drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
>>   drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
>>   drivers/gpu/drm/verisilicon/vs_dc.c           |   6 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.h           |  32 +++++
>>   drivers/gpu/drm/verisilicon/vs_dc8200.c       | 121
>> ++++++++++++++++++
>>   drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
>>   drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c         |   4 +
>>   drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
>>   .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
>>   11 files changed, 220 insertions(+), 54 deletions(-)
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>> b/drivers/gpu/drm/verisilicon/Makefile
>> index 426f4bcaa834d..9d4cd16452fa1 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o
>> vs_hwdb.o \
>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_drm.o vs_hwdb.o \
>>   	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>   
>>   obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>> index dc7c85b07fe32..3fbc8d57f8a1e 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>> @@ -162,15 +162,8 @@ static void vs_bridge_enable_common(struct
>> vs_crtc *crtc,
>>   			VSDC_DISP_PANEL_CONFIG_DE_EN |
>>   			VSDC_DISP_PANEL_CONFIG_DAT_EN |
>>   			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
>> -			VSDC_DISP_PANEL_CONFIG_RUNNING);
>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>> -			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>> -			VSDC_DISP_PANEL_START_RUNNING(output));
>> -
>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>> id),
>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>> +
>> +	dc->funcs->panel_enable_ex(dc, output);
>>   }
>>   
>>   static void vs_bridge_atomic_enable_dpi(struct drm_bridge *bridge,
>> @@ -228,14 +221,7 @@ static void vs_bridge_atomic_disable(struct
>> drm_bridge *bridge,
>>   	struct vs_dc *dc = crtc->dc;
>>   	unsigned int output = crtc->id;
>>   
>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>> -			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
>> -			  VSDC_DISP_PANEL_START_RUNNING(output));
>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
>> -			  VSDC_DISP_PANEL_CONFIG_RUNNING);
>> -
>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>> id),
>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>> +	dc->funcs->panel_disable_ex(dc, output);
>>   }
>>   
>>   static const struct drm_bridge_funcs vs_dpi_bridge_funcs = {
>> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c
>> b/drivers/gpu/drm/verisilicon/vs_crtc.c
>> index c24c1588cbe69..2d4bf6af1f56e 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_crtc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
>> @@ -16,10 +16,33 @@
>>   #include "vs_crtc_regs.h"
>>   #include "vs_crtc.h"
>>   #include "vs_dc.h"
>> -#include "vs_dc_top_regs.h"
>>   #include "vs_drm.h"
>>   #include "vs_plane.h"
>>   
>> +static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
>> +				  struct drm_atomic_commit *state)
>> +{
>> +	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>> +	struct vs_dc *dc = vcrtc->dc;
>> +	unsigned int output = vcrtc->id;
>> +
>> +	if (dc->funcs->crtc_begin)
>> +		dc->funcs->crtc_begin(dc, output);
>> +}
>> +
>> +static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
>> +				  struct drm_atomic_commit *state)
>> +{
>> +	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>> +	struct vs_dc *dc = vcrtc->dc;
>> +	unsigned int output = vcrtc->id;
>> +
>> +	if (dc->funcs->crtc_flush)
>> +		dc->funcs->crtc_flush(dc, output);
>> +
>> +	drm_crtc_vblank_atomic_flush(crtc, state);
>> +}
>> +
>>   static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
>>   				   struct drm_atomic_commit *state)
>>   {
>> @@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct drm_crtc
>> *crtc,
>>   	drm_crtc_vblank_off(crtc);
>>   
>>   	clk_disable_unprepare(dc->pix_clk[output]);
>> +
>> +	if (dc->funcs->crtc_disable_ex)
>> +		dc->funcs->crtc_disable_ex(dc, output);
>>   }
>>   
>>   static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
>> @@ -42,6 +68,9 @@ static void vs_crtc_atomic_enable(struct drm_crtc
>> *crtc,
>>   	drm_WARN_ON(&dc->drm_dev->base,
>>   		    clk_prepare_enable(dc->pix_clk[output]));
>>   
>> +	if (dc->funcs->crtc_enable_ex)
>> +		dc->funcs->crtc_enable_ex(dc, output);
>> +
>>   	drm_crtc_vblank_on(crtc);
>>   }
>>   
>> @@ -119,7 +148,8 @@ static bool vs_crtc_mode_fixup(struct drm_crtc
>> *crtc,
>>   }
>>   
>>   static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
>> -	.atomic_flush	= drm_crtc_vblank_atomic_flush,
>> +	.atomic_begin	= vs_crtc_atomic_begin,
>> +	.atomic_flush	= vs_crtc_atomic_flush,
>>   	.atomic_enable	= vs_crtc_atomic_enable,
>>   	.atomic_disable	= vs_crtc_atomic_disable,
>>   	.mode_set_nofb	= vs_crtc_mode_set_nofb,
>> @@ -132,7 +162,7 @@ static int vs_crtc_enable_vblank(struct drm_crtc
>> *crtc)
>>   	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> VSDC_TOP_IRQ_VSYNC(vcrtc->id));
>> +	dc->funcs->enable_vblank(dc, vcrtc->id);
>>   
>>   	return 0;
>>   }
>> @@ -142,7 +172,7 @@ static void vs_crtc_disable_vblank(struct
>> drm_crtc *crtc)
>>   	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> VSDC_TOP_IRQ_VSYNC(vcrtc->id));
>> +	dc->funcs->disable_vblank(dc, vcrtc->id);
>>   }
>>   
>>   static const struct drm_crtc_funcs vs_crtc_funcs = {
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index dad9967bc10b8..9729b693d360e 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>> @@ -8,9 +8,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_graph.h>
>>   
>> -#include "vs_crtc.h"
>>   #include "vs_dc.h"
>> -#include "vs_dc_top_regs.h"
>>   #include "vs_drm.h"
>>   #include "vs_hwdb.h"
>>   
>> @@ -33,7 +31,7 @@ static irqreturn_t vs_dc_irq_handler(int irq, void
>> *private)
>>   	struct vs_dc *dc = private;
>>   	u32 irqs;
>>   
>> -	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
>> +	irqs = dc->funcs->irq_ack(dc);
>>   
>>   	vs_drm_handle_irq(dc, irqs);
>>   
>> @@ -136,6 +134,8 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
>>> identity.model,
>>   		 dc->identity.revision, dc->identity.customer_id);
>>   
>> +	dc->funcs = &vs_dc8200_funcs;
>> +
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
>>   		ret = -EINVAL;
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>> index ed1016f18758e..825f5dd6bf174 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/reset.h>
>>   
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_plane.h>
>>   
>>   #include "vs_hwdb.h"
>>   
>> @@ -22,6 +23,34 @@
>>   
>>   struct vs_drm_dev;
>>   struct vs_crtc;
>> +struct vs_dc;
>> +
>> +struct vs_dc_funcs {
>> +	/* Bridge: atomic_enable, atomic_disable */
>> +	void (*panel_enable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*panel_disable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +
>> +	/* CRTC: atomic_begin, atomic_flush */
>> +	void (*crtc_begin)(struct vs_dc *dc, unsigned int output);
>> +	void (*crtc_flush)(struct vs_dc *dc, unsigned int output);
>> +
>> +	/* CRTC: atomic_enable, atomic_disable */
>> +	void (*crtc_enable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*crtc_disable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +
>> +	/* CRTC: enable_vblank, disable_vblank */
>> +	void (*enable_vblank)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*disable_vblank)(struct vs_dc *dc, unsigned int
>> output);
>> +
>> +	/* Primary plane: atomic_enable, atomic_disable,
>> atomic_update */
>> +	void (*primary_plane_enable_ex)(struct vs_dc *dc, unsigned
>> int output);
>> +	void (*primary_plane_disable_ex)(struct vs_dc *dc, unsigned
>> int output);
>> +	void (*primary_plane_update_ex)(struct vs_dc *dc, unsigned
>> int output,
>> +					struct drm_plane_state
>> *state);
>> +
>> +	/* IRQ acknowledge */
>> +	u32 (*irq_ack)(struct vs_dc *dc);
>> +};
>>   
>>   struct vs_dc {
>>   	struct regmap *regs;
>> @@ -33,6 +62,9 @@ struct vs_dc {
>>   
>>   	struct vs_drm_dev *drm_dev;
>>   	struct vs_chip_identity identity;
>> +	const struct vs_dc_funcs *funcs;
>>   };
>>   
>> +extern const struct vs_dc_funcs vs_dc8200_funcs;
>> +
>>   #endif /* _VS_DC_H_ */
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> new file mode 100644
>> index 0000000000000..77752d0cb28b0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
>> @@ -0,0 +1,121 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
>> + */
>> +
>> +#include <linux/regmap.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "vs_bridge_regs.h"
>> +#include "vs_dc.h"
>> +#include "vs_dc_top_regs.h"
>> +#include "vs_drm.h"
>> +#include "vs_plane.h"
>> +#include "vs_primary_plane_regs.h"
>> +
>> +static void vs_dc8200_panel_enable_ex(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
>> +			VSDC_DISP_PANEL_CONFIG_RUNNING);
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>> +			VSDC_DISP_PANEL_START_RUNNING(output));
>> +
>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
>> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>> +}
>> +
>> +static void vs_dc8200_panel_disable_ex(struct vs_dc *dc, unsigned
>> int output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
>> +			  VSDC_DISP_PANEL_CONFIG_RUNNING);
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
>> +			  VSDC_DISP_PANEL_START_RUNNING(output));
>> +
>> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
>> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>> +}
>> +
>> +static void vs_dc8200_enable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> +			VSDC_TOP_IRQ_VSYNC(output));
>> +}
>> +
>> +static void vs_dc8200_disable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> +			  VSDC_TOP_IRQ_VSYNC(output));
>> +}
>> +
>> +static void vs_dc8200_plane_commit(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			VSDC_FB_CONFIG_EX_COMMIT);
>> +}
>> +
>> +static void vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc,
>> unsigned int output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			VSDC_FB_CONFIG_EX_FB_EN);
>> +	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
>> +			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
>> +
>> +	vs_dc8200_plane_commit(dc, output);
>> +}
>> +
>> +static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc,
>> unsigned int output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> +			VSDC_FB_CONFIG_EX_FB_EN);
> I think I messed up the DC8200 codepath here -- the FB_EN bit should be
> cleared instead of set.
>
> Would you mind I fix this when applying, or would you send a new
> revision fixing this?
>
> In the latter case, should I send a fix to the current code before?
>
> Thanks,
> Icenowy
Please go ahead and fix it when applying -- I'm happy with that.
Thanks!
>> +
>> +	vs_dc8200_plane_commit(dc, output);
>> +}
>> +
>> +static void vs_dc8200_primary_plane_update_ex(struct vs_dc *dc,
>> unsigned int output,
>> +				       struct drm_plane_state
>> *state)
>> +{
>> +	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
>> +		     VSDC_MAKE_PLANE_POS(state->crtc_x, state-
>>> crtc_y));
>> +	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
>> +		     VSDC_MAKE_PLANE_POS(state->crtc_x + state-
>>> crtc_w,
>> +					 state->crtc_y + state-
>>> crtc_h));
>> +	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>> +		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>> +
>> +	vs_dc8200_plane_commit(dc, output);
>> +}
>> +
>> +static u32 vs_dc8200_irq_ack(struct vs_dc *dc)
>> +{
>> +	u32 hw_irqs, unified = 0, known = 0;
>> +	unsigned int i;
>> +
>> +	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &hw_irqs);
>> +
>> +	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
>> +		known |= VSDC_TOP_IRQ_VSYNC(i);
>> +		if (hw_irqs & VSDC_TOP_IRQ_VSYNC(i))
>> +			unified |= VSDC_IRQ_VSYNC(i);
>> +	}
>> +
>> +	drm_WARN_ONCE(&dc->drm_dev->base, hw_irqs & ~known,
>> +		      "Unknown hardware IRQ bits: %#x\n", hw_irqs &
>> ~known);
>> +
>> +	return unified;
>> +}
>> +
>> +const struct vs_dc_funcs vs_dc8200_funcs = {
>> +	.panel_enable_ex		= vs_dc8200_panel_enable_ex,
>> +	.panel_disable_ex		=
>> vs_dc8200_panel_disable_ex,
>> +	.enable_vblank			= vs_dc8200_enable_vblank,
>> +	.disable_vblank			=
>> vs_dc8200_disable_vblank,
>> +	.primary_plane_enable_ex	=
>> vs_dc8200_primary_plane_enable_ex,
>> +	.primary_plane_disable_ex	=
>> vs_dc8200_primary_plane_disable_ex,
>> +	.primary_plane_update_ex	=
>> vs_dc8200_primary_plane_update_ex,
>> +	.irq_ack			= vs_dc8200_irq_ack,
>> +};
>> diff --git a/drivers/gpu/drm/verisilicon/vs_drm.c
>> b/drivers/gpu/drm/verisilicon/vs_drm.c
>> index fd259d53f49f1..24e9d0b008f31 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_drm.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_drm.c
>> @@ -25,7 +25,6 @@
>>   #include "vs_bridge.h"
>>   #include "vs_crtc.h"
>>   #include "vs_dc.h"
>> -#include "vs_dc_top_regs.h"
>>   #include "vs_drm.h"
>>   
>>   #define DRIVER_NAME	"verisilicon"
>> @@ -168,8 +167,8 @@ void vs_drm_handle_irq(struct vs_dc *dc, u32
>> irqs)
>>   	unsigned int i;
>>   
>>   	for (i = 0; i < dc->identity.display_count; i++) {
>> -		if (irqs & VSDC_TOP_IRQ_VSYNC(i)) {
>> -			irqs &= ~VSDC_TOP_IRQ_VSYNC(i);
>> +		if (irqs & VSDC_IRQ_VSYNC(i)) {
>> +			irqs &= ~VSDC_IRQ_VSYNC(i);
>>   			if (dc->drm_dev->crtcs[i])
>>   				drm_crtc_handle_vblank(&dc->drm_dev-
>>> crtcs[i]->base);
>>   		}
>> diff --git a/drivers/gpu/drm/verisilicon/vs_drm.h
>> b/drivers/gpu/drm/verisilicon/vs_drm.h
>> index 606338206a427..6a89c20879df7 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_drm.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_drm.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _VS_DRM_H_
>>   #define _VS_DRM_H_
>>   
>> +#include <linux/bits.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/types.h>
>>   
>> @@ -13,6 +14,13 @@
>>   
>>   struct vs_dc;
>>   
>> +/*
>> + * DC variants use different interrupt registers with diverging bit
>> + * assignments; each irq_ack() implementation must translate its
>> + * hardware-specific bits into these definitions.
>> + */
>> +#define VSDC_IRQ_VSYNC(n)	BIT(n)
>> +
>>   struct vs_drm_dev {
>>   	struct drm_device base;
>>   
>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> index 2a0f7c59afa3a..91524d16f7785 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
>> @@ -94,6 +94,7 @@ static struct vs_chip_identity vs_chip_identities[]
>> = {
>>   		.revision = 0x5720,
>>   		.customer_id = ~0U,
>>   
>> +		.generation = VSDC_GEN_DC8200,
>>   		.display_count = 2,
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_no_yuv444,
>> @@ -103,6 +104,7 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.revision = 0x5721,
>>   		.customer_id = 0x30B,
>>   
>> +		.generation = VSDC_GEN_DC8200,
>>   		.display_count = 2,
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_no_yuv444,
>> @@ -112,6 +114,7 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.revision = 0x5720,
>>   		.customer_id = 0x310,
>>   
>> +		.generation = VSDC_GEN_DC8200,
>>   		.display_count = 2,
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_with_yuv444,
>> @@ -121,6 +124,7 @@ static struct vs_chip_identity
>> vs_chip_identities[] = {
>>   		.revision = 0x5720,
>>   		.customer_id = 0x311,
>>   
>> +		.generation = VSDC_GEN_DC8200,
>>   		.display_count = 2,
>>   		.max_cursor_size = 64,
>>   		.formats = &vs_formats_no_yuv444,
>> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> b/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> index 2065ecb730437..a15c8b5656044 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
>> @@ -9,6 +9,11 @@
>>   #include <linux/regmap.h>
>>   #include <linux/types.h>
>>   
>> +enum vs_dc_generation {
>> +	VSDC_GEN_DC8000,
>> +	VSDC_GEN_DC8200,
>> +};
>> +
>>   struct vs_formats {
>>   	const u32 *array;
>>   	unsigned int num;
>> @@ -19,6 +24,7 @@ struct vs_chip_identity {
>>   	u32 revision;
>>   	u32 customer_id;
>>   
>> +	enum vs_dc_generation generation;
>>   	u32 display_count;
>>   	/*
>>   	 * The hardware only supports square cursor planes, so this
>> field
>> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>> b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>> index 2750016a7f2c3..85ba2068172db 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>> @@ -54,12 +54,6 @@ static int vs_primary_plane_atomic_check(struct
>> drm_plane *plane,
>>   	return 0;
>>   }
>>   
>> -static void vs_primary_plane_commit(struct vs_dc *dc, unsigned int
>> output)
>> -{
>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			VSDC_FB_CONFIG_EX_COMMIT);
>> -}
>> -
>>   static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
>>   					   struct drm_atomic_commit
>> *atomic_state)
>>   {
>> @@ -70,13 +64,8 @@ static void vs_primary_plane_atomic_enable(struct
>> drm_plane *plane,
>>   	unsigned int output = vcrtc->id;
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			VSDC_FB_CONFIG_EX_FB_EN);
>> -	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
>> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
>> -
>> -	vs_primary_plane_commit(dc, output);
>> +	if (dc->funcs->primary_plane_enable_ex)
>> +		dc->funcs->primary_plane_enable_ex(dc, output);
>>   }
>>   
>>   static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
>> @@ -89,10 +78,8 @@ static void vs_primary_plane_atomic_disable(struct
>> drm_plane *plane,
>>   	unsigned int output = vcrtc->id;
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>> -			VSDC_FB_CONFIG_EX_FB_EN);
>> -
>> -	vs_primary_plane_commit(dc, output);
>> +	if (dc->funcs->primary_plane_disable_ex)
>> +		dc->funcs->primary_plane_disable_ex(dc, output);
>>   }
>>   
>>   static void vs_primary_plane_atomic_update(struct drm_plane *plane,
>> @@ -138,18 +125,11 @@ static void
>> vs_primary_plane_atomic_update(struct drm_plane *plane,
>>   	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
>>   		     fb->pitches[0]);
>>   
>> -	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x, state-
>>> crtc_y));
>> -	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x + state-
>>> crtc_w,
>> -					 state->crtc_y + state-
>>> crtc_h));
>>   	regmap_write(dc->regs, VSDC_FB_SIZE(output),
>>   		     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state-
>>> crtc_h));
>>   
>> -	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>> -		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>> -
>> -	vs_primary_plane_commit(dc, output);
>> +	if (dc->funcs->primary_plane_update_ex)
>> +		dc->funcs->primary_plane_update_ex(dc, output,
>> state);
>>   }
>>   
>>   static const struct drm_plane_helper_funcs
>> vs_primary_plane_helper_funcs = {
