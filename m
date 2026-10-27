Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096092;
	b=vBrf81C0BJHjV3uoxQtfrvIDypJjd1cWkLYFH7gSm8PmeYsxMpCyo4gzPMNmq5NqsBdV
	 rBTx6TZKJKWw01JaIu3nKIRXwmQcrxY9Av+mrTKRenlIWoMM5Hn3LR44GIi6m5g8loWES
	 P79otLsORI9+SXsHfZ6fUTQdu9FakQ8594t7ULad3YzUlTrWrfJX6nXM++c7ZRQSTo4rv
	 P+gCeuosRaZnYWx6jcIsvGMTgl3sV/FTTA/iuqzRhUu/EYQ/eUN06z6NitLVPW/R2Hlfq
	 2hKJkL7Hs2rEm2CEBnAECNROcFbblTpeZUgNxljXEoMnRrsVfOemiArRxddyd7SHhdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096092;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Content-Type;
	bh=lvFw8tqqTR67faK5n0WofJMmY3FbQXpRy70vxZJUGus=;
	b=OSIXHt6aHCz5MU1HS7QTdW7HF5wYA1sq/2ZhPXtqtHMl44F+2EwklkwypS1zOmNKEZM5
	 KDRx75J4BenKO1RVxyiBbL3ljCMyFrDGrHLA1aF4bsTLdpt2QzuTv+6gEsxF+fMP1IN0+
	 bNFtMnHXknMElV9ciyOAh+bG2v4wDN5Q+XiIXv9lyYECCvbGEMOap09O9ImeXqlHHoNhW
	 dzLxjcUm2MTPlGjkuiWSUkbaGcDAKQ3cm5pLJFYoYS1PoJl9ErFyVskcv2qdIMaY5pRO8
	 yRwCIRB7J85a8rrW00iPLmQP/m1Myi0Y1it354PLZEoFXuYdzDQ689HenXC03vGosWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=geanix.com;
	spf=pass smtp.mailfrom=geanix.com;
	dkim=pass header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=protonmail header.b=oxYiTqlz;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186A606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1186A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=protonmail header.b=oxYiTqlz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793096086; x=1793355286;
	bh=lvFw8tqqTR67faK5n0WofJMmY3FbQXpRy70vxZJUGus=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oxYiTqlzoEvZVMmxDj/GN0kVQFKQ8O/3lROlIwuI/iKDoyX9fTao8UOaZom6p/Y+Q
	 yNCI8Z4szsOPk3XpsazXxeqcWf7Vj+eL1SMk5tzFCVA8n1F2X1XlQMpgEPAZfimS5B
	 +5Llyp9iz0dwJAjBEwaaHXDObFHAbMHyHjND+vqW/hFto4biWc5MjFK4b3NO8KdE4o
	 C/aMrZ8z2IVNxzoewo7dcmS1QCRDj1RdNTYnEnZZYGuoQqSrjAp4r4HG9KSvz1t1XN
	 Fc1aJROZ1ERUyqW6j26qUr6IJfx2FI9KJ6iROvIp0OLnPFHG8IHLANbDIua9oPdDmz
	 3xKt9opWotiyw==
X-Pm-Submission-Id: 4jDRF01kHdz1DDLJ
From: Esben Haabendal <esben@geanix.com>
To: "Liu Ying" <victor.liu@nxp.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>,  "Neil Armstrong"
 <neil.armstrong@linaro.org>,  "Robert Foss" <rfoss@kernel.org>,  "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman"
 <jonas@kwiboo.se>,  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  Guido
 =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Robert
 Chiras" <robert.chiras@nxp.com>,  "Sam Ravnborg" <sam@ravnborg.org>,
  <dri-devel@lists.freedesktop.org>,  <linux-kernel@vger.kernel.org>,
  "Oliver F. Brown" <oliver.brown@oss.nxp.com>
Subject: Re: [PATCH RESEND v4 4/4] drm/bridge: nwl-dsi: Correct MIPI DSI
 horizontal sync timing
In-Reply-To: <atH4i_KcmccKb8Ge@raspi>
References: <20261014-nwl-dsi-fixes-v4-0-b9138ea5e12c@geanix.com>
	<20261014-nwl-dsi-fixes-v4-4-b9138ea5e12c@geanix.com>
	<JYYZZ_8h4tOKBjhbfQG_VuFESQDdQRt7TE7Ef0eJ9F0gQgyRrEJ5LIi6scY_48ggvsikFa5QZB3uEHaRUDdosQ==@protonmail.internalid>
	<atH4i_KcmccKb8Ge@raspi>
Date: Tue, 27 Oct 2026 11:14:43 +0100
Message-ID: <87v76nbgbw.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Liu Ying" <victor.liu@nxp.com> writes:

> On Wed, Oct 14, 2026 at 09:44:45AM +0200, Esben Haabendal wrote:
>> The NWL MIPI Host controller registers specifies the horizontal front
>> porch, sync pulse, and back porch in DSI packet payload size in bytes (ie.
>> not in pixel clocks).
>>
>> The calculation for this is (mostly) described in section 13.6.3.5.1.2 of
>> the i.MX 8M Dual/8M QuadLite/8M Quad Applications Processors Reference
>> Manual (rev. 3.1). The formula shown there does not take packet header size
>> into account though.
>>
>> The formula implemented here converts the hfp, hsa, and hbp to DSI packet
>> bytes and then subtracts the number of packet header bytes.
>>
>> It is worth noting that these values only needs to match approximately,
>> according to the reference manual.
>>
>> Based on commit in NXP vendor tree
>> commit f2a61699749d ("LF-7981-4: drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing")
>>
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> Cc: Robert Chiras <robert.chiras@nxp.com>
>> Cc: Oliver F. Brown <oliver.brown@oss.nxp.com>
>
> Worth a Fixes tag?

Yes. I think it should be the initial commit, so

Fixes: commit 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")

I am not sure if we should mark it for stable backport. If people have
specified "wrong" timing parameters in order to have the resulting
timing with the old code produce correct timing, they will have to
change the parameters. Is that suitable for stable?

>> ---
>>  drivers/gpu/drm/bridge/nwl-dsi.c | 60 ++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 57 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
>> index f3f4334136c0..eb604733eea0 100644
>> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
>> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
>> @@ -22,6 +22,7 @@
>>  #include <linux/reset.h>
>>  #include <linux/sys_soc.h>
>>  #include <linux/time64.h>
>> +#include <linux/math64.h>
>
> Sort the header files alphabetically.
>
>>
>>  #include <drm/drm_atomic_state_helper.h>
>>  #include <drm/drm_bridge.h>
>> @@ -264,6 +265,9 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
>>  	bool burst_mode;
>>  	int hfront_porch, hback_porch, vfront_porch, vback_porch;
>>  	int hsync_len, vsync_len;
>> +	int hfp, hbp, hsa;
>> +	u64 hs_clk_rate, pclk_rate;
>> +	int h_blank, pkt_hdr_len, pkt_len;
>>
>>  	hfront_porch = dsi->mode.hsync_start - dsi->mode.hdisplay;
>>  	hsync_len = dsi->mode.hsync_end - dsi->mode.hsync_start;
>> @@ -317,9 +321,59 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
>>  			      dsi->mode.hdisplay);
>>  	}
>>
>> -	nwl_dsi_write(dsi, NWL_DSI_HFP, hfront_porch);
>> -	nwl_dsi_write(dsi, NWL_DSI_HBP, hback_porch);
>> -	nwl_dsi_write(dsi, NWL_DSI_HSA, hsync_len);
>> +	hs_clk_rate = dsi->phy_cfg.mipi_dphy.hs_clk_rate;
>> +	pclk_rate = (u64)dsi->mode.clock * 1000;
>> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hs_clk_rate: %llu Hz\n", hs_clk_rate);
>> +
>> +	/*
>> +	 * Calculate the bytes needed, according to the RM formula:
>> +	 * Time of DPI event = time to transmit x number of bytes on the DSI interface
>> +	 * dpi_event_size * dpi_pclk_period = dsi_bytes * 8 * hs_bit_period / num_lanes
>> +	 * ===>
>> +	 * dsi_bytes = dpi_event_size * dpi_pclk_period * num_lanes / (8 * hs_bit_period)
>> +	 * ===> (substituting period = 1 / rate)
>> +	 * dsi_bytes = dpi_event_size * num_lanes * hs_clk_rate / (8 * dpi_pclk_rate)
>> +	 */
>> +	hfp = DIV64_U64_ROUND_UP((u64)hfront_porch * dsi->lanes * hs_clk_rate, 8 * pclk_rate);
>> +	hbp = DIV64_U64_ROUND_UP((u64)hback_porch * dsi->lanes * hs_clk_rate, 8 * pclk_rate);
>> +	hsa = DIV64_U64_ROUND_UP((u64)hsync_len * dsi->lanes * hs_clk_rate, 8 * pclk_rate);
>> +
>> +	/* Make sure horizontal blankins are even numbers */
>
> s/blankins/blankings/

Fixing.

>
>> +	hfp = roundup(hfp, 2);
>> +	hbp = roundup(hbp, 2);
>> +	hsa = roundup(hsa, 2);
>> +
>> +	/*
>> +	 * We need to subtract the packet header length: 32
>> +	 * In order to make sure we don't get negative values,
>> +	 * subtract a proportional value to the total length of the
>> +	 * horizontal blanking duration.
>> +	 */
>> +	h_blank = hfp + hbp + hsa;
>> +
>> +	if (h_blank) {
>> +		pkt_len = min(hfp, roundup(((hfp * 100 / h_blank) * 32) / 100, 2));
>> +		pkt_hdr_len = pkt_len;
>> +		hfp -= pkt_len;
>> +
>> +		pkt_len = min(hbp, roundup(((hbp * 100 / h_blank) * 32) / 100, 2));
>> +		pkt_hdr_len += pkt_len;
>> +		hbp -= pkt_len;
>> +
>> +		pkt_len = min(hsa, 32 - pkt_hdr_len);
>> +		pkt_hdr_len += pkt_len;
>> +		hsa -= pkt_len;
>> +		if (pkt_hdr_len != 32)
>> +			dev_warn(dsi->dev,
>> +				 "Unable to subtract packet header length fully: %d left\n",
>> +				 32 - pkt_hdr_len);
>> +	}
>> +
>> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Register values: hfp=%d hbp=%d hsa=%d\n", hfp, hbp, hsa);
>> +
>> +	nwl_dsi_write(dsi, NWL_DSI_HFP, hfp);
>> +	nwl_dsi_write(dsi, NWL_DSI_HBP, hbp);
>> +	nwl_dsi_write(dsi, NWL_DSI_HSA, hsa);
>>
>>  	nwl_dsi_write(dsi, NWL_DSI_ENABLE_MULT_PKTS, 0x0);
>>  	nwl_dsi_write(dsi, NWL_DSI_BLLP_MODE, 0x1);
>>
>> --
>> 2.56.0
>>
>
> Not sure if the fix is 100% correct, but it is a correct direction to
> change the blanking packet payload size from in pixel clocks to in bytes,
> so better than no fix:
> Acked-by: Liu Ying <victor.liu@nxp.com>
>
> --
> Regards,
> Liu Ying
