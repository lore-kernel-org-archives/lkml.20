Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794687657;
	b=qG2Lz6SAhwQzY4J7PgWD3kWfEmzQCDf1nx4DaKR5BIF0uem6zP3ReTreqKAbtOKUfTy6
	 mP620OO1SlqyNHxI/kdflNWBrME7A5wgnuV0OrZ4iijZqDuBfaH3U6jk9o6iYiK/5fQeM
	 cvH2bMd/xDGpshXI/lcVOG4UBwb7SKV18XJBVnKBfqLGyuwALBQ7WblUbp3u6T/dCHb+i
	 fiCs+1YhqaCmm+0bPbLMf/2Ul49oUy8clB+XtWr5uUiMVwDOp6tfSjEUgXp+Y/sYvix20
	 zb9CctbUUrDrBxaSI9klGiymk05+JHMUZJrNVqto7T52Djbnp9yfwDynIAEZb+30YCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687657;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=cu5MMhcstIh4ULvSF/ynBw0eMrBlRsk19DqNkd+lUXI=;
	b=U2Dn7Seb1t29PkXTjP+YdPNE05gV4pkWFkYgsI+o5NFJYHV2PViSNqv/Qi4JecOK1eM8
	 h8FF3oU+Hu4VDc8QQ/hA6C4MEuQ3vQtwx5rHuX1dhnTek/OrK83BBwn7AugknUdz3jGkS
	 0oxmHMhkewO2FFkzRgPGOgibzLxGwA/B3TEPdMUh1DQAf2nGZ0zGcz8ndUdUQw8ZXptRG
	 v6IzsZYNfrXZRpM/Sx80kH1X+x2pJ6Pf1DnGl1HUclPSTNf+61Jo54K2V2wH1vmb8/8G/
	 lk0+VY44FalE6bcEJF5sXIxbp1je/H6zleXeH/9K/jbEBLm3Z7S/onxDqVDqpfHsKrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=RZTZ8kfj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4xgHSfbB;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E521606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E521606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=RZTZ8kfj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4xgHSfbB
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 39BD0EC0193
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:20:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 14 Nov 2026 15:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794687656;
	 x=1794774056; bh=cu5MMhcstIh4ULvSF/ynBw0eMrBlRsk19DqNkd+lUXI=; b=
	RZTZ8kfjEQRFV+v1XXj6fXJvQkRvHxr/tpgiX90zgIEKXLj6OitN8FSeLyuvJ3VD
	1jPBh3vWjSuREEOw9bR5MZ6O7HOtPTPwKaxpvMQ/zQa5/7f3f2rHsuYt5vNluG56
	kKcmlZb/5ptnwtRC2Z0RFkrcxp25KUAcOCZpxjyddnusmxoPdPa60EIKgmuX+X5b
	XW7aFjQZ6PeyoSV0eMB+zy8l4h20BCGeVIXY9ULIvym9X06mYtaVGKIU0fXVrRVS
	k0vNcb+Bj+7h/3KOAhzU7hBYjgiVDjR/Ec5OpyTQp57XddULq03ex5rmPtLIWFFT
	pRvF4NNCMHVWSByzBD9WTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794687656; x=
	1794774056; bh=cu5MMhcstIh4ULvSF/ynBw0eMrBlRsk19DqNkd+lUXI=; b=4
	xgHSfbB9K6/i8jeZUay/ut2xVbYdG5evfMKFeED59ZBVGUC5/0gXN7yiIHaMc2ie
	TV2hFtuTKOmoz7RNcI6L0vzWjFxQdXwh/PeuMMBNQ6IaX1ec7Qse4of/Tv4t9B2/
	tYS/YhWRotD43V/6icUTRUJbkrgTYDFGqUfsjVsb72ILGJ+ci1GerlGqP50pZcj6
	IvZlKJ3z4pSuslXkEuF9D5kA+L+REWPDHWjIXa2nKiD++lAzfO87Q5u/3gkeaa1P
	zpIuimKs1ZkjDjGaTFH7i1GKI9c0xZIDMtyBLhuqHRs+kz4KSKa1RMstU/f2ituh
	XaOQG9XKAeIVtG8MUWArw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794687656; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:uP7SJTVY1wuWAQrmxeF2hVn0THYb8QjowCwQaBrDp3nvkXm
	nHXmCUBhD+czmkL9pUNeIgD/3vlncnckeZRzKQ/lyHg+wk5I/nqQIzofHPIaUR3a
	06aTQw3arHzG1Ecl+w92HzWovVH73R0ua776izjpZavlNAjf4vd4V3g3d8/WS3nv
	EqqpMugyE5TvuMZfm9YvB2ucgo/7LdYC9JGPIyJ01msukqqtUxtwWAAJ/VSg2E+L
	uW6L1Ra8xCYhn1/zojGEp+OspMi63pLhVQdvfarOzN2OMnbfYZE5e0JmIIV+RzNu
	WqVvZ9tdD/P1zJwaRH89UzxFgrHrTUquAvuPcIg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:4h7AxvcjFZKQ0KRtswlxBLGl2BUvYUu+r66kCVlJImw=:ThbgPUx/cIrFYgrpHHPhgmqD/on+eCLGTpxh5bdMVhk=;
X-ME-Sender: <xms:qML4aowBoBS7MY6X7qBbnrsISLxWAtcSdB79-vr5aGluTfe_VuBzoQ>
    <xme:qML4alPKkGL2HOKMrWonjzD72DpbSI2DmWnGvzIQtiqEEvOPHKzIiMFU29Gs2DevK
    h2Vg_xSTIzUk80adhxJvLPnMnUzyQmrgmdy9Nx1_-zwlEGthsq9dtg>
X-ME-Received: <xmr:qML4al7_KeJxvoy7AnR_j6kvUA6aoBSE7X7-8qjGvSWXShxmWmyP4sTdYjKPispyMeRqV68uCXwD1EB01QjADXIAvFiVaxk>
X-ME-Proxy-Cause: dmFkZTEL1yd51iK283ZoiAXK6zxPm7riDymf1PB0+BZaxt3F5IjKOuQlcnz/WhRv37Oow9
    aEUSFT1S/Sb/R0xnZqTMcycAl0GZZYlqzpFCaIBRbayUaPAI/bOvk2+quKvLNBqyy57+SE
    TIrqH6F38UE6k7wZf9l6Um/Nx+rG1InmCVVKiMwBSIM2uM+z1V9mSprZds2KE6HNP40Wef
    UzKO7D3QE8rwteYELi6XsCvbaurhDthER3h2EnL9c4RlpTOFy0EewtWDnb3A8PadWdK3Da
    g0vOfJoCOogAfzZzVSnNjBJ6CSxeFqBP63Ykd91LHbbQ2z3sepbpMhPz5SOXAFHNz8D7s3
    PwE1PHtTCurLfGRlRmerdWW5eysEZbuLdFhm+6H+wTLQww5J0lKzDx2ZChES8W6ItcbAP6
    mmVXjZ4KkjJ33UZdSL2+kft4XQtNzwoaiKT0HoCot+5dLxMuNFBz5Hgu9nz0FrC2EbzEpx
    hRSmr0EmWii11b6v3IYTM+RPE1i90iy4pHbeziALeOi3P/SqvdYDcT1ciowUrcCKTBTGI9
    z8x3xHIu44WeBz1va71i9xjll37XrNJoxvYtnKl51lM/Cmm8Yh6qmTShyppDbsXp2o/5wX
    9U7UjaCXTbOs0LQiVupGLyB5DDwsIwbmxKj62c7DW7M5eGKld+9DhQLSNw3A
X-ME-Proxy: <xmx:qML4amlwae3VqWMTFt3DaVkXTWeVs8pI7uq4lktMsMc5h5O_kmm3LA>
    <xmx:qML4amSNcshXaKRaRmeCT0h1OtDyr9rkLa7et64lm3T6ffjJPkiPvA>
    <xmx:qML4alF76zdKP51iC4jwMMaM5D8gBIgT8CFxK8e89_ePy9yWFKNEqg>
    <xmx:qML4arEWMLO7MBLYsPa27VFiGIBdHCIRSUCKtzYNPrKpfPExXkm37w>
    <xmx:qML4anG66jkLmkhVjx1jSW8Qp8mvDbpXeufDIi3sHJCqfdi4sC2BdFT8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 15:20:55 -0500 (EST)
Date: Sat, 14 Nov 2026 21:20:54 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] media: uapi: videodev2: Add 20-bit Bayer formats
Message-ID: <20261114202054.GF938627@ragnatech.se>
References: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
 <20260910-v4l2-add-raw-pix-v1-1-80a8e855b41b@ragnatech.se>
 <avWWbro0mM0kW3vu@zed>
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
In-Reply-To: <avWWbro0mM0kW3vu@zed>

Hi Jacopo,

Thanks for your review.

On 2026-11-12 11:37:58 +0100, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Thu, Sep 10, 2026 at 07:22:31PM +0200, Niklas Söderlund wrote:
> > Add 20-bit Bayer formats and documentation.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
> >  .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 102 +++++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
> >  include/uapi/linux/videodev2.h                     |   4 +
> >  4 files changed, 111 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > index 8b4e413177f5..b93e66d6a27e 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > @@ -33,3 +33,4 @@ orders. See also `the Wikipedia article on Bayer filter
> >      pixfmt-srggb14
> >      pixfmt-srggb14p
> >      pixfmt-srggb16
> > +    pixfmt-srggb20
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
> > new file mode 100644
> > index 000000000000..cf911e93aa8d
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
> > @@ -0,0 +1,102 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +.. c:namespace:: V4L
> > +
> > +.. _V4L2-PIX-FMT-SRGGB20:
> > +.. _v4l2-pix-fmt-sbggr20:
> > +.. _v4l2-pix-fmt-sgbrg20:
> > +.. _v4l2-pix-fmt-sgrbg20:
> > +
> > +***************************************************************************************************************************
> > +V4L2_PIX_FMT_SBGGR20 ('BG20'), V4L2_PIX_FMT_SGBRG20 ('GB20'), V4L2_PIX_FMT_SGRBG20 ('GR20'), V4L2_PIX_FMT_SRGGB20 ('RG20'),
> > +***************************************************************************************************************************
> > +
> > +
> > +====================
> > +20-bit Bayer formats
> > +====================
> > +
> > +
> > +Description
> > +===========
> > +
> > +These four pixel formats are raw sRGB / Bayer formats with 20 bits per
> > +sample. Each sample is stored in a 32-bit word. Each n-pixel row contains
> > +n/2 green samples and n/2 blue or red samples, with alternating red and blue
> > +rows. Bytes are stored in memory in little endian order. They are
> > +conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is
> > +an example of one sample.
> > +
> > +.. cssclass: longtable
> > +
> > +.. flat-table:: 20-bit Bayer Formats
> > +    :header-rows:  2
> > +    :stub-columns: 0
> > +
> > +    * -
> > +      - :cspan:`31` Sample organization
> > +    * - Bit
> 
> One more question, the other RAW formats show a byte-organized table,
> where the R G and B components are shown as line-interleaved
> components (hope this is clear, have a look at the tables at
> Documentation/output/userspace-api/media/v4l/pixfmt-srggb16.html
> and compare it with
> Documentation/output/userspace-api/media/v4l/pixfmt-srggb20.html)

I see what you mean.

> 
> Was this intentional ?

It was done intentionally, but I see now that what you point out is 
likely a better way. I was likely influenced by having done the media 
bus documentation patches just before doing this. Will changed to the 
common style.

> 
> > +      - 31
> > +      - 30
> > +      - 29
> > +      - 28
> > +      - 27
> > +      - 26
> > +      - 25
> > +      - 24
> > +      - 23
> > +      - 22
> > +      - 21
> > +      - 20
> > +      - 19
> > +      - 18
> > +      - 17
> > +      - 16
> > +      - 15
> > +      - 14
> > +      - 13
> > +      - 12
> > +      - 11
> > +      - 10
> > +      - 9
> > +      - 8
> > +      - 7
> > +      - 6
> > +      - 5
> > +      - 4
> > +      - 3
> > +      - 2
> > +      - 1
> > +      - 0
> > +    * -
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - *
> > +      - P\ :sub:`19`
> > +      - P\ :sub:`18`
> > +      - P\ :sub:`17`
> > +      - P\ :sub:`16`
> > +      - P\ :sub:`15`
> > +      - P\ :sub:`14`
> > +      - P\ :sub:`13`
> > +      - P\ :sub:`12`
> > +      - P\ :sub:`11`
> > +      - P\ :sub:`10`
> > +      - P\ :sub:`9`
> > +      - P\ :sub:`8`
> > +      - P\ :sub:`7`
> > +      - P\ :sub:`6`
> > +      - P\ :sub:`5`
> > +      - P\ :sub:`4`
> > +      - P\ :sub:`3`
> > +      - P\ :sub:`2`
> > +      - P\ :sub:`1`
> > +      - P\ :sub:`0`
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 17ba1ae70735..14cb94591ea8 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1434,6 +1434,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
> >  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
> >  	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> > +	case V4L2_PIX_FMT_SBGGR20:	descr = "20-bit Bayer BGBG/GRGR"; break;
> > +	case V4L2_PIX_FMT_SGBRG20:	descr = "20-bit Bayer GBGB/RGRG"; break;
> > +	case V4L2_PIX_FMT_SGRBG20:	descr = "20-bit Bayer GRGR/BGBG"; break;
> > +	case V4L2_PIX_FMT_SRGGB20:	descr = "20-bit Bayer RGRG/GBGB"; break;
> >  	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
> >  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
> >  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 5373dba640fa..85a32dee4e21 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -744,6 +744,10 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
> >  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
> >  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
> > +#define V4L2_PIX_FMT_SBGGR20 v4l2_fourcc('B', 'G', '2', '0') /* 20  BGBG.. GRGR.. */
> > +#define V4L2_PIX_FMT_SGBRG20 v4l2_fourcc('G', 'B', '2', '0') /* 20  GBGB.. RGRG.. */
> > +#define V4L2_PIX_FMT_SGRBG20 v4l2_fourcc('G', 'R', '2', '0') /* 20  GRGR.. BGBG.. */
> > +#define V4L2_PIX_FMT_SRGGB20 v4l2_fourcc('R', 'G', '2', '0') /* 20  RGRG.. GBGB.. */
> >
> >  /* HSV formats */
> >  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
> >
> > --
> > 2.55.0
> >
> >

-- 
Kind Regards,
Niklas Söderlund
