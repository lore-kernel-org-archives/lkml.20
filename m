Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422337;
	b=B1Nla3TZDmgjdOmUphWbBswULwvn9P7w/B0cQHdO7SSvErqX29QnRv4MRjPBxLPBbs3y
	 L/D4ZK5W0neTkawDYHx+tSH+nty8el9JVE9ivSGOKHpk/8/XvEcwz/IFH37wRW5CU7Y+K
	 CwuESicO1pX9W8+w77rP/PHMwOZagLkinxe+JgamV3c5WZ0kHfsPE8PHAtDShBe7Ivp+c
	 7LYNSqUH+Ou2tMT/PiY5lJ19XdZD/qhBGdifkKrNVjhYirkT9SI2Z/LtIQC/bwmFC5+lp
	 Zj4z7nfut9WoZGvy7G8Nuw017y6hgzq8QibpSh3Wf0A1ID97yJUzGR9Lx6kN6myvatw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422337;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=zHQ4u9vCVjmtcp76rQAxRfbRCi+loO0rEPPmE3dqhDo=;
	b=yoVHJOGEySoW+1yMsqR5APb9FXjSk/503Ai9m5TpKojpm2++8NssbPxP7K8POPHOC2GG
	 334jLaQtP6ZNlxoiQlkBjGsju80aYYHzwypgc/TjGU4vE90tRJKcVveyc4inrXtl3/Nav
	 FuoPP601G8/RX+m5UEErl0jliXpuM3mz6GANPvW98C4z9ZmowjNsd4ioX0nzy2Tx6gBEa
	 O0Ck71GONl/N8cxW67/VuZ9Baz2SOJ+pq/6nuZPdetOStJQewSdPteIjwOsdGSVWFKvcO
	 Jq7s322qgFtdko2qLacLVpb3XIpEz/ztw3bPtofJTF3UbPhnhLThXsFzlQuRZEw3zMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ti4nkkuW;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC56D6080AA9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC56D6080AA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ti4nkkuW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422336; x=1823958336;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=qu/70rYg+vG2HLxPI4Uiia6m/VyuInts7xnBWyiDo/c=;
  b=Ti4nkkuWLdNzeCg+7dD9QgHcGeRjuSFHAuLKZuJ3xFGqwacqq+txQZzD
   QfpqBM25RopcIFiJpoBTsckaM04nLEEWh5KMXnonsYBm4Cs59CB63u4jY
   8X7kVVvi0AijQZbVwVihUNO8KIPvIGG6W2ltFYCu0/PMhV3nL2zxUOf/V
   zCBtt/drm8GC9VBDFKYlcU77GbelTBdiUSdX3hNwK1UvOM+kw1+IDRHPx
   7VGcoMahx4H31hgCnMijlNb1IPYSqpFRY03GCtis+hPydCRbag3NAFaZf
   B7nZzvEG1ebgWyKgBMXPcWmdmhFtOaL/Pg3Rtk7K7iYOtDfwLlBKcvDAg
   A==;
X-CSE-ConnectionGUID: YieQFHuCTeKprbizEDH3zA==
X-CSE-MsgGUID: Yal9w+hvSL+hZlX5DWx0FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="991258"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="991258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:05:36 -0700
X-CSE-ConnectionGUID: MqMhmSnGQr2zmmj5aYuJqw==
X-CSE-MsgGUID: BVwTOvCORJ+b7kKdZMSUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2634438"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:05:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>, intel-gfx
 <intel-gfx@lists.freedesktop.org>
Cc: rodrigovivi <rodrigo.vivi@intel.com>, joonaslahtinen
 <joonas.lahtinen@linux.intel.com>, tursulin <tursulin@ursulin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/sdvo: Remove disabled HDMI buffer dump code
In-Reply-To: <1a12556af17.597a885f7429.8559089497420287597@zohomail.in>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <1a12556af17.597a885f7429.8559089497420287597@zohomail.in>
Date: Mon, 19 Oct 2026 18:05:31 +0300
Message-ID: <7e2193324bc2d42d420d3afe227699c9dd09bff5@intel.com>
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

On Sat, 10 Oct 2026, Ashwin Gundarapu <linuxuser509@zohomail.in> wrote:
> From cbebdc3b5dce2d4c0ce8c9b69c62b539fc77dce5 Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Sat, 10 Oct 2026 15:42:48 +0530
> Subject: [PATCH] drm/i915/sdvo: Remove disabled HDMI buffer dump code
>
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>

Please read submitting-patches.rst.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_sdvo.c | 30 +----------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 3075ef04df56..d9c6a620377e 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -974,35 +974,7 @@ static bool intel_sdvo_get_hbuf_size(struct intel_sdvo *intel_sdvo,
>  	return true;
>  }
>  
> -#if 0
> -static void intel_sdvo_dump_hdmi_buf(struct intel_sdvo *intel_sdvo)
> -{
> -	int i, j;
> -	u8 set_buf_index[2];
> -	u8 av_split;
> -	u8 buf_size;
> -	u8 buf[48];
> -	u8 *pos;
> -
> -	intel_sdvo_get_value(encoder, SDVO_CMD_GET_HBUF_AV_SPLIT, &av_split, 1);
> -
> -	for (i = 0; i <= av_split; i++) {
> -		set_buf_index[0] = i; set_buf_index[1] = 0;
> -		intel_sdvo_write_cmd(encoder, SDVO_CMD_SET_HBUF_INDEX,
> -				     set_buf_index, 2);
> -		intel_sdvo_write_cmd(encoder, SDVO_CMD_GET_HBUF_INFO, NULL, 0);
> -		intel_sdvo_read_response(encoder, &buf_size, 1);
> -
> -		pos = buf;
> -		for (j = 0; j <= buf_size; j += 8) {
> -			intel_sdvo_write_cmd(encoder, SDVO_CMD_GET_HBUF_DATA,
> -					     NULL, 0);
> -			intel_sdvo_read_response(encoder, pos, 8);
> -			pos += 8;
> -		}
> -	}
> -}
> -#endif
> +
>  
>  static bool intel_sdvo_write_infoframe(struct intel_sdvo *intel_sdvo,
>  				       unsigned int if_index, u8 tx_rate,

-- 
Jani Nikula, Intel
