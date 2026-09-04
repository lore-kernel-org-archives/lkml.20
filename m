Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F49642B74B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553527; cv=none; b=mSwkDmg1FDwX3ycjWe40ZPk0CuecssMQS/+LemQGH8MNaMhZXHQVt/ajRcjbkbEXiijBPtaF6Nq43NU9zFdBvHRVR7mp3lB/xgdgDmQSrtC/f6zXG35h/EZf40Or3KpYXiKC/gJ8gYauZgL+bJQOn9YDDipt8abMfFpGcKkwcFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553527; c=relaxed/simple;
	bh=RkC7B1HjR0ml1UrF7WPIGhZi8gjG9mXWmeILFQwtK2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwQhMcVeyCTOomufcnD1KE2/4uu3H5q6Q87sV99DM+hSRg9PCKoib5a82RDc6YJTFUIhdOYvrXfqj7MIcCXlCktcaE04smf/iJGO0WgWxbRydlKKG0xvQZBHaTXtMUC0oBxPuiHmfC9bcGtxtJAVOYj+je+/SXF+5w10F4MeLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AdzKKqbg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AdzKKqbg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d9004f39d3so17090405ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788553513; x=1789158313; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6QGXZnzimnwApACmTHrGvREBiPCHGg32ZkJMN7Mvro=;
        b=AdzKKqbggCp3BNgi9PaPZMwv5Rw8w0GYbLLvzLEoe+pWtHJZSSqs7Jtm01N4h/JuLJ
         wYo/90wEeX9kdGC6s12QViYIuA7SUUtrHHJVSWpCd8DshU/e2GSngORiHNoisGR2n8ZI
         d9BYHKJHsQXfBgRHIt3yvepyyCAHQayv2jVltVvgsPmkqlwJ6/7pbbRQ6XeaJBC7q5R7
         wgFfJbYl2grZ+49dBa+jy4ChLzV0ZAaYs5zU/7ddMcMrJma+P13JDjuq7R3DIlLhS5fk
         fvBodQ60O4a3klrYnVs1fLsBhofAvDv++5mRXRlUrvAZeqO3en5N8g/appN07KIF5vc3
         1Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788553513; x=1789158313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N6QGXZnzimnwApACmTHrGvREBiPCHGg32ZkJMN7Mvro=;
        b=TBT+r4z7EjmkbTfmpPzV8eFgXJb9t0/x/pHLkrAoYoijoyNdGxA7Z0UcEHhyoYFkd0
         4kYFuTHdt05wXJ5FQQ09KIiWe4b2tyr9KkjJ7FxKomQ0LeTJphSn5WlUIzpAj1t7V8vG
         lDi++GSqQi33RLvZPmhiGjf6H0lNpSfI6+CpNdXTM84yIsf8PoG2dmA74OG06VcvleIV
         vOiCy3t1UvsdcpPEUJQR5N2Jv4lGIiXK+mpSNOVg3z5OTptXhOoOI4a9NjIJD+VwKC9m
         Ji6OZM16T109Usof00TszdE8b61dmB4NHAExKp7py/6WD63NdAbq0myy9igGX3berWq+
         tZlg==
X-Forwarded-Encrypted: i=1; AKwUvBy7XQx6P2Zteajr6FuJE4LJRa8CNGxgQzL3vZ8TcSVlSR+D1x4LN9zRmwLq08+49MuzUcS/8GV5Ehtlnwo=@vger.kernel.org
X-Gm-Message-State: AFuF++miflIhta6ZIoETjcn31c42jO1FpWaEPT7N396sFG13o8BkQFfN
	Gjs0ZxWaLMcxprzdj7PqiEJKkKThEJ7cRqBnT43VgnU8k5jDcp45S2dq9l92PjklS+M=
X-Gm-Gg: AYBFou3RsvpxKcL10KLaXrzXYI8WEWkBxM2eSsGue+SZ9RxSMXaH3vWBwDEaY4T2BFx
	9I8dMzw6+Gq346O70WKfwUesLa4CasV3IbruwYjFWN2nyj+BXarFenYTb2xyn4mYJy0tDUIq72v
	RsEvMILxLtlveE1Dcf8ZMgAl8nQv7bcC4N92BoMUgbvxtmnywyd+mId9PfYsNvXs4NPqTcz/ljl
	IkgNhSRX9F5faYhAMwtaFbMW3y7UB1p5oE9O0EexvMR+IKq7ru3P6xATKiMPqEM1OgmfXTuqC0v
	9+46C1BY7iH62jT6fBt1tXLifOWqWwfz/b8CLcoQGyo2Z3RsSA5OFVP4OSGMTGVI4YKNCnEfsmG
	6isgZJmrUuXrOdNttkhHEaxsX0Xa0lKemgcWntxP8O2T1tXA3r9r1Bwfo9Tm1Nkh8ObaC9+Rmws
	PTyXzv0+AeJcO4RC4VMdCyi4Y/0uiRaj0GrqJ6DePZ5GdUa2HsW31GDwKFrGITI8w5
X-Received: by 2002:a17:90b:224c:b0:398:9bd4:d15 with SMTP id 98e67ed59e1d1-39b26245d08mr11013302a91.20.1788553512350;
        Fri, 04 Sep 2026 13:25:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f95f:75de:b3f0:3bf5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26127fddsm5795159a91.12.2026.09.04.13.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:25:11 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:25:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/5] Enhance RPMsg buffer management
Message-ID: <apspJRn0LJ-Gvucv@p14s>
References: <20260828145853.2843486-1-tanmay.shah@amd.com>
 <4f8cc4b4-8c44-4d2d-befd-63911afe27a5@foss.st.com>
 <20f53e0f-4b9a-44fe-bb6a-ea0f988b64b9@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20f53e0f-4b9a-44fe-bb6a-ea0f988b64b9@amd.com>

On Thu, Sep 03, 2026 at 10:28:09AM -0500, Shah, Tanmay wrote:
> 
> 
> On 9/1/2026 8:03 AM, Arnaud POULIQUEN wrote:
> > 
> > 
> > On 8/28/26 16:58, Tanmay Shah wrote:
> >> Current design uses fixed (512 bytes) rpmsg buffer size in both rx and
> >> tx directions. This design is not suitable if the payload is larger than
> >> 512 bytes or the payload is very small and doesn't need that much
> >> memory. Instead introduce new virtio feature to retrieve rpmsg tx buf
> >> size and rx buf size from the virtio config space in the resource table.
> > 
> > This version seems good to me, with or without my suggestion in patch 4/5
> > 
> > Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > 
> > Thanks!
> > 
> > Arnaud
> > 
> 
> Thank You Arnaud.
> 
> If I end up spinning another revision with any more comments, then I
> will address suggestion in the patch 4/5 as well. If I get Mathieu's RB
> for this series, then we can merge this series as it is.
> 

I edited 4/5 to include Arnaud's suggestion and applied this set.

> Tanmay
> 
> >>
> >> Changes in v8:
> >>    - fix commit message of 3/5, "%s/enable/Enabled"
> >>    - introduce new function to get buffer size for the vdev device
> >>    - fix description of VIRTIO_RPMSG_F_BUFSZ define
> >>    - "%s/or differnt RX and TX sizes)/or different RX and TX queue
> >> sizes)/"
> >>
> >> Changes in v7:
> >>    - Fix 5/5 commit text, and move change log out of commit text
> >>
> >> Changes in v6:
> >>    - remove buffer alignment from config space
> >>    - rpmsg.rst: modify alignment related documentation
> >>
> >> Changes in v5:
> >>    - fix documentation about alignment of the buffer size
> >>    - change version field from u16 to u8
> >>    - remove buffer alignment check
> >>    - Separate buffer alignment vs MTU of a single buffer
> >>    - Use buffer alignment only to get next buffer address at alignment
> >>      boundary
> >>
> >> Changes in v4:
> >>    - Introduce new patch to modify rpmsg.rst documentation
> >>    - check version is always 1.
> >>    - check size field is same as size of struct virtio_rpmsg_config
> >>    - introduce alignment field
> >>    - check alignment field is power of 2
> >>    - check tx and rx buf size is aligned with alignment passed in the
> >>      structure
> >>    - check msg size is < MTU size
> >>
> >> Changes in v3:
> >>    - new patch [1/4] that renames variables with clear names.
> >>    - %s/rbufs/rx_bufs/
> >>    - %s/sbufs/tx_bufs/
> >>    - %s/last_sbuf/last_tx_buf/
> >>    - add num_rx_buf and num_tx_buf in the documentation
> >>    - change version field from u16 to u8
> >>    - introduce size field in the rpmsg_virtio_config structure
> >>    - check version field is set to any non-zero value.
> >>    - check size field is not 0.
> >>    - Remove field for private config, as not needed for now.
> >>    - add documentation of rpmsg_virtio_config structure
> >>    - Check for error when retrieving MTU size in the sample driver
> >>    - %s/mtu/MTU/
> >>
> >> Changes in v2:
> >>    - Change author
> >>    - fix commit message with better explanation
> >>    - %s/sbuf/tx_buf
> >>    - %s/rbuf/rx_buf
> >>    - %s/num_rbuf/num_rx_buf/
> >>    - %s/num_sbuf/num_tx_buf/
> >>    - %s/sbuf_size/tx_buf_size/
> >>    - %s/rbuf_size/rx_buf_size/
> >>    - fix typo
> >>    - do not use ALIGN on buf size, rely on allocator
> >>    - make err msg more explicit, %s/vdev config:/bad vdev config/
> >>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
> >>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
> >>    - use __virtio32 over __u32
> >>    - add version field to virtio rpmsg config structure
> >>    - Introduce new patch to print rpmsg mtu size in the sample rpmsg
> >> driver
> >>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
> >>
> >>
> >> Tanmay Shah (5):
> >>    rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
> >>    rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
> >>    rpmsg: virtio_rpmsg_bus: get buffer size from config space
> >>    docs: rpmsg: add virtio config space details
> >>    samples: rpmsg: add MTU size info
> >>
> >>   Documentation/staging/rpmsg.rst     |  17 +++
> >>   drivers/rpmsg/virtio_rpmsg_bus.c    | 156 +++++++++++++++++++---------
> >>   include/linux/rpmsg/virtio_rpmsg.h  |  41 ++++++++
> >>   samples/rpmsg/rpmsg_client_sample.c |  20 +++-
> >>   4 files changed, 186 insertions(+), 48 deletions(-)
> >>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> >>
> >>
> >> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> > 
> 
