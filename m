Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478575;
	b=0YMZS1lxgEYv/JSvpe+PMcd2Bz62OLZWvz5nBjB1tMxaocMv64ona3aIkQjuDN9YhygN
	 pviBJR0SL0X7uDwurx/OPTpYHzSYPDOX3IC90FgyjrQ7bkZmKItYFhbI1vTb2de2QW9o3
	 Y3COkQBPGvDSM9dYGLvQOTgrxqZ035y9XroonEf3VQlaJQtkmT31KCmZ+S7aPCogLdShG
	 Th9pETWck/S00alDQFvPi7RpSVe695Ykz2n1eTwrMUsxx49EmIpblyUfY6Yp8z55CyR5N
	 ioeabY/wmmpdbuts5yHqXXHAWXySPBJs4RsXHyN4dDvmKa7A7JOkwhyf6RwfLJ7R3yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478575;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=x4o0NtrgqLYVQMgSvh/mpBobAZNZ1/NNpD2zfIRITw0=;
	b=L0Cbdy8X8Ye4RcXkX1iE0VvoEerIES3UoYwU/sUwnvoLk++jeQ9Ol685a30JxLwFnH6Q
	 8NXh4dCmLJIKwXnoVfIaEh/pFQXVWfKRhl1D4J0JoFK2Um1fSEt08VXkJni50PHNr10WO
	 Br0e9QhnXb/9B9vmlQFZCaKSLRRK3ljBGCpUINDhSwAYizW4wXX6Of0m5SG4VawJ/ZuN4
	 qkoLlVQLufVQpxKtBSWdkaevgeAUP9jGhZlPU4Sc1kAEdZOOYg0gbN4nn6vGjQNYwX5nI
	 4x2Tst05wDKdTBoYcn4KT7ZkUWwtuvs5KRbqg6Ledr1WTc/C+SLF2ha41BFlWxKMopg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PdzYjoJC;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB11606A88E;
	Thu, 12 Nov 2026 10:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB11606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PdzYjoJC
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0E66802;
	Thu, 12 Nov 2026 11:13:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794478428;
	bh=lMaCzCHOGXHusmEfhvJYAWMHewDMJN2QyXn0C1RDXGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdzYjoJCaDIRLaQXow+rXIQNVWlxIZBZuisEIuiByeeNNREOaDkTybrR2MDQ4A5+e
	 L3JIPuRMKP7XRrmIaBV5YK5/Jg7tg5N1gc1RZP+6tQ3/9sDF9+kECTAKPodpMemy0u
	 w3PgZFpZiJvCV1odyVZ4hLDn8ear9Y86t4ZxAozg=
Date: Thu, 12 Nov 2026 11:16:09 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: uapi: videodev2: Add 20-, 24- and 28-bit
 bayer pixel formats
Message-ID: <avWRlfslqUKfANte@zed>
References: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
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
In-Reply-To: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>

Hi Niklas,

On Thu, Sep 10, 2026 at 07:22:30PM +0200, Niklas Söderlund wrote:
> Hello,
>
> This series adds the pixel formats and documentation for the 20-, 24-
> and 28-bit Bayer formats. This is done in preparation of work on the
> Renesas R-Car video capture pipeline which will support these pixel
> formats in multiple drivers. For this reason it is posted as a separate
> series before the driver work.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Niklas Söderlund (3):
>       media: uapi: videodev2: Add 20-bit Bayer formats
>       media: uapi: videodev2: Add 24-bit Bayer formats
>       media: uapi: videodev2: Add 28-bit Bayer formats
>
>  .../userspace-api/media/v4l/pixfmt-bayer.rst       |   3 +
>  .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 102 +++++++++++++++++++++
>  .../userspace-api/media/v4l/pixfmt-srggb24.rst     | 102 +++++++++++++++++++++
>  .../userspace-api/media/v4l/pixfmt-srggb28.rst     | 102 +++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  12 +++
>  include/uapi/linux/videodev2.h                     |  12 +++

Have you forgot to add the new formats to the table in
v4l2_format_info() in drivers/media/v4l2-core/v4l2-common.c ?



>  6 files changed, 333 insertions(+)
> ---
> base-commit: f9536a8065d9eed0d9114878c56ffc4e5a18bdfc
> change-id: 20260908-v4l2-add-raw-pix-50ca1182ccd2
>
> Best regards,
> --
> Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
>
