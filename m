Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556051;
	b=AZw2pecWeOlpMAPtr/GNz55yYCCj11KK/az8OVXRO5MeyFPs5ZyLMz7fhKfcCYo4so+g
	 0w3KyGnlJmq29R7EZWPZt81PKLHVOEjdG9bMW1NMUGBcXxXtQxk0hg9MDN/4xcz3Q8G6H
	 B7bDMfku5Jt7QQm7e02ZWwcM8BNRgMKc3SAdaeax6cNfzxinKX0oWUs6vVNEsbfc5ZwgG
	 Aq6DIcD139D0RTUj3vj0v/Pl95vimaSP1v4UBMpB4ZvPYYB033qwYr7zNfiW7TPZ/51zT
	 xElLWoPnQ4sYBcUqxbCu7IzHC+bl6PPOfSG697Q7y/FtjsA55uesyUAevtbW38FTmww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556051;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MzujFBLfuqLT6XalnT14Lld/uGTe5+6LzUDj3lAzcVA=;
	b=SfrbhXwfZK1UrRbGJFxdBaBhUzqkZCK/oJhLaeoVMJZdj7vP/Yy5zjnfwj2ogr9xa/hm
	 5B12Oajo2X8oGowZwa2pAnzPz8sJ4CkKUAG+Vv8gNNkz9obJCRFOQ3ApYamUlWPsHLHod
	 Gmxrcl2uuKDu8NbF5+XKnD4OCJ1Kg+5e9PkABZEkBYZLWtsh6LLrfNTd2S+Pfh7oYMyBN
	 6pfw0QPnOasVgkuhbsefz7Mwct+jAx29K+a7Hm4oDlM/F+JHeVJ/h3DnIVFbORck5RL04
	 xIlUzKPEXntmb2BMu9utug/tbm0x3ev7gLHvBDIsO30MJArZt4shmgHoD+N9qxXnwGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WH5YodZJ;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03407606A31C;
	Fri, 13 Nov 2026 07:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03407606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WH5YodZJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794556051; x=1826092051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MIM773eGxSV0/Hn3gA/X/du3XX+OtguWLuHqdo7tNWU=;
  b=WH5YodZJz6twJltPPWbDYZiEb17bVNnAvzO6U7P/lkRGh8Es1jhCGw3o
   QNMnZyP5puxj1QEkqwHRHMgS4FErjwCkmBNQKlovpRGelfu2HxuM3mdnJ
   SDDfeYbNGvawok48kVlKqSHmBtwBZMMeLG3PfGq5E6pu3PSRR+Uw1Ey6M
   ae7gE3lehspXS/lwSMuSaWlenkV4iB1DhymjyPMSPtULLUACYw5SOVUPK
   aQVJEnqrBaV6mAayUdx3jmdItQjJteaXFXvFFIfgUn7H+4c+MzZ+DoHp3
   WgfcbrtriLszN/opcufhacZ9O1si4a5GlnJ328CTJU8H1o6A/7yLjhy4O
   w==;
X-CSE-ConnectionGUID: L7DODTtGREGklPMQ+FzpUw==
X-CSE-MsgGUID: XGoY+cZDRMS52yD28ffDuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3432499"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3432499"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 23:47:30 -0800
X-CSE-ConnectionGUID: iTbkGvcmT4KEO/M2NJhzMQ==
X-CSE-MsgGUID: HqSaPAcvTlOsqfmGiT9R1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="10581124"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.163])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 23:47:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 22EA1121B96;
	Fri, 13 Nov 2026 09:47:30 +0200 (EET)
Date: Fri, 13 Nov 2026 09:47:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Zixin Wang <w1355457260@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: media-entity: make media_entity_cleanup() a
 no-op macro without MC
Message-ID: <avbAkhu1V5wiVTkY@kekkonen.localdomain>
References: <20261113021845.1697485-1-w1355457260@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113021845.1697485-1-w1355457260@gmail.com>

Hi Zixin,

Thanks for the patch.

On Fri, Nov 13, 2026 at 10:18:45AM +0800, Zixin Wang wrote:
> Without CONFIG_MEDIA_CONTROLLER, struct v4l2_subdev has no entity member.
> Calls such as media_entity_cleanup(&sd->entity) therefore fail to
> compile even though the function does nothing:
> 
>   drivers/media/i2c/cx25840/cx25840-core.c:3964:41: error:
>   'struct v4l2_subdev' has no member named 'entity'
> 
> Turn media_entity_cleanup() into a macro that discards its argument when
> CONFIG_MEDIA_CONTROLLER is disabled.  This fixes the cx25840 build and
> any other caller passing a member that only exists with the media
> controller API enabled.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Fixes: 634be628b5cc ("media: i2c: cx25840-core: Add missing media_entity_cleanup()")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222245
> Signed-off-by: Zixin Wang <w1355457260@gmail.com>
> ---
> 
> Notes:
>     Hi Sakari, thanks for the review and the suggestion.
>     
>     v2:
>     - Make media_entity_cleanup() a no-op macro without
>       CONFIG_MEDIA_CONTROLLER instead of guarding each caller (suggested by
>       Sakari).
>     
>     AI assistance: the change and this changelog were drafted with the Qoder
>     coding assistant; the sender reviewed it and ran the builds with
>     CONFIG_MEDIA_CONTROLLER=n and =y.
> 
>  include/media/media-entity.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index fa393e840669..400e08598dd6 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -729,9 +729,13 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>   * zeroed but that has not been initialized with media_entity_pads_init() is
>   * valid and is a no-op.
>   */
> +#ifdef CONFIG_MEDIA_CONTROLLER
>  static inline void media_entity_cleanup(struct media_entity *entity)
>  {
>  }
> +#else
> +#define media_entity_cleanup(...)	do { } while (0)

I'd still call the argument "entity". Without MC, you can e.g. pass the
macro multiple arguments otherwise. I can make the change while applying.

> +#endif
>  
>  /**
>   * media_get_pad_index() - retrieves a pad index from an entity

-- 
Regards,

Sakari Ailus
