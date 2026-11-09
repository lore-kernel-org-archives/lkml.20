Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265567;
	b=clLI/8xna0QYCaUXNlFgeEzB9fUZZwWp/C1aVRITbLW9g/kMUnFjudeqwZfiYWqsof9I
	 Yk3JBvDqrWU1HJHgTvpmuVw4sTX6OvmQfCMGGYBrra8iMqekrB5uKdB9HcMyU9BeTGhpp
	 1kn/ANVo8oeiFrrVIVpW/enB7AM5jNSeNSUJutB2LONLpr0zvmbrgB8mbeu/Oo6JSkiZn
	 IsEvghmMZmckVKPNDEUv1BOZHihAPS4MIoNSzWxsD6rHf2SySUWo2vlOfYosPc101oKeZ
	 HgDMjO9jBgjSwDcPhkM8FgxYqwzTPiZQ+/G5H2ugU4958jC2x94gUwGaTmIEZat3Tog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265567;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=U1SHI1w/RnQ/LW4m+0Hh+qVKQdWDnUn2TmXmHO+DxG0=;
	b=m7RrXt2/dOnqpD3j2ATXW4Ulq561tigr2812LNncWYrdc0fWYXsHizwugz/Oh938S5eL
	 yYsT/WSEJkxp/Bxg991IKpQq2kSwoYndqE3Lo82oK5U+eX2yfuW3x8bTERbC9tkgUlTHw
	 B4Baiw9tS4r0Cd1XTCrBWt+lUEITwLsH/80o7ckXmy8vJbqSVy5339T9PrixFwwlssqBO
	 QCC3iUqI9PjF4EGIznxRo+Z8HgPKus/4eZg4Ihk7LNcnBoyfS4ym8g8LlBJBv61XOkIcZ
	 KokdOtbCkZ16227orOwDBkEL4xOR1yVq3fLbresWoZUrJg63TpPtcTZaDrvC4scb8Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=RpIWK9rt;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08856606A325;
	Mon,  9 Nov 2026 23:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08856606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=RpIWK9rt
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AE0133D;
	Tue, 10 Nov 2026 00:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794265416;
	bh=5tzFgyfxwWQfocd3QLAWDXzBSro0If9o1QGzqiZw60s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpIWK9rtwJGOC0ctrtUrhBeLe3+/F/uhCIiE/9ea5dwmr51jHsadpm3WCtISeY2I0
	 GHRsGtUsWSkTlaLKEVluCdcq4XOc2t1E22Ua8NQSzAYjRp9kjM9574GprQasw9AV9H
	 U3A+L5SO+r2vAPhM95uVHiLrWghHPtWoRxq/1qqY=
Date: Tue, 10 Nov 2026 01:05:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Message-ID: <20261109230556.GA77654@killaraus.ideasonboard.com>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
 <20261014215606.GB283442@killaraus.ideasonboard.com>
 <AMBPR04MB3355230D320B45E39F65B74126FA9C2@AMBPR04MB335523.eurprd04.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AMBPR04MB3355230D320B45E39F65B74126FA9C2@AMBPR04MB335523.eurprd04.prod.outlook.com>

On Thu, Oct 15, 2026 at 03:31:53AM +0000, G.N. Zhou (OSS) wrote:
> On Thursday, October 15, 2026 5:56 AM, Laurent Pinchart wrote:
> > On Fri, Oct 09, 2026 at 06:58:41PM +0800, guoniu.zhou@oss.nxp.com wrote:
> > > From: Alice Yuan <alice.yuan@nxp.com>
> > >
> > > Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
> > >
> > > The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> > > parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> > > component ordering. Supporting YUYV allows sensors and bridge devices
> > > that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> > > CSIS driver without requiring format conversion.
> >
> > What sensor(s) do you have in mind ? CSI-2 does not support other component
> > orderings, the YUV4222_8B data type specifies the ordering on the bus as [U1,
> > Y1, V1, Y2], and V4L2 maps that to MEDIA_BUS_FMT_UYVY8_1X16.
> 
> The sensor is the OV5640. Its driver already advertises MEDIA_BUS_FMT_YUYV8_1X16
> for CSI-2 mode in mainline (ov5640.c, ov5640_csi2_formats[]). According to datasheet,
> ov5640 ISP reorders YUV components via register 0x4300 before transmitting over the
> CSI-2 link using the YUV422_8B data type. The CSIS itself is a pass-through — it does not
> interpret or reorder pixel data, it just forwards whatever the sensor sends. Without
> YUYV8_1X16 in the CSIS format table, media link validation fails when using the OV5640
> in YUYV mode.

That makes sense. Overall we may have been better off by not exposing
MEDIA_BUS_FMT_YUYV8_1X16 in the ov5640 driver and relying on the DMA
engine on the host side to handle different YUV formats, but as the
driver exposes it, it makes sense to support it here too. I don't like
that all CSI-2 receiver drivers would need to be patched to support
this, but the number of YUV components ordering isn't as large as for
CFA patterns, so we can live with it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > index 5f9691d76434..14a00b9fcedf 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -382,6 +382,11 @@ static const struct csis_pix_format
> > mipi_csis_formats[] = {
> > >             .output = MEDIA_BUS_FMT_UYVY8_1X16,
> > >             .data_type = MIPI_CSI2_DT_YUV422_8B,
> > >             .width = 16,
> > > +   }, {
> > > +           .code = MEDIA_BUS_FMT_YUYV8_1X16,
> > > +           .output = MEDIA_BUS_FMT_YUYV8_1X16,
> > > +           .data_type = MIPI_CSI2_DT_YUV422_8B,
> > > +           .width = 16,
> > >     },
> > >     /* RGB formats. */
> > >     {
> > >
> > > ---
> > > base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
> > > change-id: 20261009-csis_sam-c5c10ed12322

-- 
Regards,

Laurent Pinchart
