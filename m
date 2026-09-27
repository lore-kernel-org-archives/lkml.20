Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8503BF684;
	Sun, 27 Sep 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518759; cv=none; b=a3yUi+XsyYl5hAxqW+TVUzNGZKHZFP0MsAHS3ZrR0UqCCFsUR4PSuTut2FKXGNcrRRkx6XYzHLV1ML+n8nb87tJVX1bkt2mdfFQAH7cawTEDgoxVBIuY/uncMxmqkS1nkbIUP/Lz+UfQbEtZuC4iWJ1c7XTBNB8taYrgo/9WDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518759; c=relaxed/simple;
	bh=XuV1pUSSKMp45rUiY7+W9cj7hDLqz3FCd/AFGxCjcKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3AsI6ZrtAkt+KgwdZcbMIpNRrvbm3/jHbG30NW8/gCFX7BV+jouqIT0C5rvYyzDNSBbzM1tSi91BPGvSCnExCGI/1jxpGQICWomM7cdqCFCJVZD22dfn9hzI0sRPyTOIblW2wRs3IcqTtcqCVfdPRJn/MhCVn4XmUsA65Cb3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tmX4gfNu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tmX4gfNu"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CA75FBE;
	Sun, 27 Sep 2026 16:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790518644;
	bh=XuV1pUSSKMp45rUiY7+W9cj7hDLqz3FCd/AFGxCjcKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmX4gfNuT1kMtkv1BJjzUol4CGIpJX8+OyjH+SP2ichnX7Ziz3RLC7YjAbSCkKoi/
	 w7U536Qw7zDaZwUjagSV0ECUl4S5c56QTZMxVKTwZ17IZ4ky7TsMUK1lBbpbMTsQy2
	 sVn+m52iSpsMceuB5mLlunK1n/GBAoa2tqgB7SK4=
Date: Sun, 27 Sep 2026 17:19:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com,
	mripard@kernel.org, jai.luthra@linux.dev,
	jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 4/8] media: cadence: csi2rx: Add RAW10 RGBIr formats
Message-ID: <20260927141912.GA4406@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-5-r-donadkar@ti.com>
 <20260926145242.GD764757@killaraus.ideasonboard.com>
 <7e6eff37-832c-4a40-a4f5-4e3699bf3a5b@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e6eff37-832c-4a40-a4f5-4e3699bf3a5b@ti.com>

On Sun, Sep 27, 2026 at 10:50:30AM +0530, Rishikesh Donadkar wrote:
> On 26/09/26 20:22, Laurent Pinchart wrote:
> > On Fri, Sep 25, 2026 at 06:59:57PM +0530, Rishikesh Donadkar wrote:
> >> From: Jai Luthra <j-luthra@ti.com>
> >>
> >> Add 10-bit RGBIr formats to the table to allow capturing them.
> >>
> >> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> >> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> >> ---
> >>   drivers/media/platform/cadence/cdns-csi2rx.c | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> >> index de7cce76397a..8ed730452d3c 100644
> >> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> >> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> >> @@ -173,6 +173,14 @@ static const struct csi2rx_fmt formats[] = {
> >>   	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
> >>   	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
> >>   	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
> >> +	{ .code	= MEDIA_BUS_FMT_SRGGI10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SGRIG10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SBGGI10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SGBIG10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SGIRG10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SIGGR10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SGIBG10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SIGGB10_1X10, .bpp = 10, .max_pixels = 2 },
> > 
> > Raw formats will allow supporting all possible CFA patterns without
> > having to extend each driver every time a new pattern is added.
> 
> Yes, makes sense !
> 
> I noticed that patches for RAW format support are present here
> 
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata
> 
> Is there a plan to merge these into media tree in the near future?
> If they are still under review and need more time to get merged, I’ll 
> plan to cherry-pick them and rebase my work on top of them.

Jai is working on the userspace implementation in libcamera to test out
the API. Once that completes, we'll update the API is issues are found,
and then merge it.

> >>   };
> >>   
> >>   static void csi2rx_configure_error_irq_mask(void __iomem *base,

-- 
Regards,

Laurent Pinchart
