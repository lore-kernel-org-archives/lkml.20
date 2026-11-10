Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299186;
	b=Dl+2GhPfgKPSPmtwerFKU6v4WmI0Cwec/yYFu7JpCKynx2mrYkME300SRUCC/Xf1CIuB
	 TGvkXgYGrp4mtAel+S22fqPGxomPkaGyTx4x67DK3XNKHjNpabahk5OOMl6yU5EkwqEFM
	 wTczp43bB8mvXvGZ5RM5yv9h0Jy5C2DM9ug+cUlMx8YemovmG0ht87YFaRxdrqxi3T9gl
	 bbangbuLZwZUv3x7PgEVYMN3F8Q2hgFRTk/ZYYbTPOkL9cKDgZELXjbaYnT363l6eax2V
	 U9pgjpSErH7Zzgw8Pvj5Rov1+u+HGyFDDK/sEdHtPsKDBGv9arcrDkx349ASrlWvgMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299186;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=jM2KqtLZR5KZmZwUFYUmasLVvZOZGtObPE9IUiUfJtI=;
	b=bRUrigy7fjWpJN0J0baTUWwdmdCAvXy8Jqa5MVB2ty22aA/D+HyefV1rgCWsiYIQWwWR
	 VMl/Q1Ml6ax3yrlP3eC1PDkANCVO64X5C10FyERMJs8agsYA6p3aRNsE30KWoGzVwklMr
	 RAd0kD3PlreO7o33MdUgZhReqyTW0QNQtZFG04uTe1oe/7QmWMb5jOMX/Dl6G3CxPzPwa
	 /m6OHYAVCHne6VoF/AppBiEbgL2uA65gSXy2tqkQ6okcYJu11n3ORgEw8BMmbItuEJRuk
	 1wyhTrUExW/yDuNB4vdFZAWJzFdbdEAvOKr5BhfIaF+9zXdwYzarhjvV57vZqv9bb2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HhMBjprX;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159E60A2603;
	Tue, 10 Nov 2026 08:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3159E60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HhMBjprX
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A167233D;
	Tue, 10 Nov 2026 09:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794299041;
	bh=1OMliKISCKOc37E0qcZlbyxk2XFCqhg/vUhAN14HK9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhMBjprXpI3uIHD5g6b++Nd0w1JZL5n5oTyrHRcIDInjC42gHHkAojv6T0csp6uKE
	 UVGd8B+f4lZ9JOuYUADjCGN9+aDLtFa2yIanGK5xOlfVlFYVtaE8ZwTDMBPsejoY3X
	 2M6xTMzvi2lQGnB2Ca+cXsTYTyQJP0WcR3npfb3w=
Date: Tue, 10 Nov 2026 09:26:20 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: David Carlier <devnexen@gmail.com>, jacopo.mondi@ideasonboard.com, 
	dan.scally@ideasonboard.com, nayden.kanchev@arm.com, mchehab@kernel.org, 
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mali-c55: Require an enabled link to start a
 video node
Message-ID: <avLU-wAht46lTUlC@zed>
References: <20261105231626.7152-1-devnexen@gmail.com>
 <CAD++jLksFHZRFCk9JWQz+Kec-Gjx0dEXchUfLuTewJvOx-dnUw@mail.gmail.com>
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
In-Reply-To: <CAD++jLksFHZRFCk9JWQz+Kec-Gjx0dEXchUfLuTewJvOx-dnUw@mail.gmail.com>

On Mon, Nov 09, 2026 at 10:26:01AM +0100, Linus Walleij wrote:
> On Fri, Nov 6, 2026 at 12:16 AM David Carlier <devnexen@gmail.com> wrote:
>
> > mali_c55_pipeline_ready() skips queues whose link is disabled, but such
> > a queue can still start streaming on its own, as the video node pads
> > lack MEDIA_PAD_FL_MUST_CONNECT. Stopping it later sees a ready pipeline
> > and disables the ISP under the connected queues still capturing.
> >
> > Mark the video node pads MUST_CONNECT so that starting a disconnected
> > node fails with -ENOLINK.
> >
> > Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
>
> It checks out:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> > Changes in v2:
> > - Add missing Signed-off-by.
> > - Cc stable, as d5f281f3dd29 is in the stable tree.
>
> No Cc: stable@vger.kernel.org actually added?
>
> But Jacopo can certainly add that when applying the patch.

I don't have any C55 with the DS pipe fitted to test with, so I'll
just
Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

and I can Cc stable indeed

>
> Yours,
> Linus Walleij

Thanks
   j
