Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9916E560AAE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093283; cv=none; b=gzN9BEJuKa0sNo530GCg5AWzmgXHE+rzcIsZ5WpySvbE1uqdZZ4BJqnQTSHB6yP0TjqEXBFpY5t/n6KVFqsjS2y+cp1s1yvnakD2HZEaWxtSqwU7+Q2Sjb9n+cE7UoLimLqn2iGaMak3TninJ5m544wwIdUnoTQ9wmyV77xS+8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093283; c=relaxed/simple;
	bh=GOaR3oRNiNzhSpbEcZWvDkegir/uIorFZ2eUkpF7mf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6vzZ5iQe+GxO4rW/kaSIC+n0Qbo9FQuAnMuiK4r4Na6gESLUYIWvU8RvvfCKep4LQybpN0rqrp1hYGpLGi6Hr8uBS4z9dfJ7soyUQ0OuH62rt7r6uyjza0iEbgLkcYBSNYMUb9CqZSIFpIjO+XxuMHqAKXvLGnlAtgap4QuXSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrZwnIRs; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrZwnIRs"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so53481a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790093280; x=1790698080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HBbhvK2kEOBfPteB03TY1EsiSBGN3wG4ENtFO8lw2k4=;
        b=DrZwnIRsQ7NbvOs6gJ8be7d71msi9LrrXvn7cEfhcKrnmvRa2PcoxkUmACXZVYjy4R
         yxFcVTi9OAAhVF2+jXmO9UP6RWEXHK04xygvY2hSllV9vT9u+iV/TS7l4VGVF29xJAVW
         qp5YQay5V5F+TBX/P61+ibxiNNbMP8VsEdf8ViWdi6oPAduOvnxFKMfGkTAADWsvKw6b
         QtcsaXTeJ/i+ig9CluAxB7VIPQqeba5hQr8b0erWD/q/cmtOuUtgC/Ry2mhzvZfO6dwL
         FOUy7vhHcDQJ8nOoTK2DvtbJKCiTZMRu6vf8mJvBLAeDPbjtulp/221dgZgJ3GV9bnU/
         vkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093280; x=1790698080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBbhvK2kEOBfPteB03TY1EsiSBGN3wG4ENtFO8lw2k4=;
        b=erg4edKRrzb2opVAZueQirYsBm8BAlBp9z3Gm26J8ibIA3NSN8M4PXB6YPW4MGDOSC
         k+5q3WBfZwg7Rmy/yTxJ4ZJgkT22DtkGWMGlLQmMBxwT7HCnj5VfGAfQIiymCNYXN+sh
         X3pY2QEafdksbk+rFi1ZWrX4cW4J1K9sxZTHzAZzzgLpfqBvCGn5iiT3wttpcX/guHGE
         Uzg7H3PhbRyv3/sVwfuCvYtd+nfmhXxdcmiHYQJ8WMIvkzzsu/Vr61cI7ZJcXAciJc52
         TSXH5xZr+zQDS302CPVtwTxoNeHDffJNF3sX7BkrQfxY4y04ZiXEwBoI2h9kIg4avIIZ
         HbIw==
X-Forwarded-Encrypted: i=1; AKwUvBwgkZuK6j+I5H5iHaPZJuk9+FQwGO+1HGVefKkBjShOMxXq+itSlRFtcjSEl7ven/1Djxi3UGXtHWsM2/k=@vger.kernel.org
X-Gm-Message-State: AFuF++lGlD95Hpq9MOA+YMHTeZ7UV2bCMxOcm69dayXPPsjz9ndIwhVW
	o0mwlhoZWPYFHHRHHyae9vRSeCIFH4MPOmFd4xMA3ddvLwEb9yJC6++Xd4C0gwcK
X-Gm-Gg: AYBFou173uuq+e6regJxg5kiLux0zq2fGAJnoJzM30/lJUpXWC2mueJJzxx5UNdjeT7
	KkTDVVUWoXerE3m6/ym2FZcs/Qx5kNAtkRbckaNOcTxZesNt1eeqE4jsNudbc14pGuLRBCvMC1v
	rCkypUjEVo6oZJMmk8+t0WI+FBVJmsOZL3zlEuvz5dP6Md0EGvPrBe+vot4lvR28chpDE5W5oIH
	yvOIg7qBA8GBI4KSMwQVBT7tnyuK+ioNV04FHV5ipiILDy2HS37BXCnrhWLX/I6Q94fxB4u5p4V
	5Q2qFUpUQCNk+nGqylsRW9F3Xf8YOAumaCAp+Z+YnZe7JX3vvoIUoVRLdwCxMXraYuK//Glmv7X
	qC5qL1esWE5ZdEYR2GflQTegvE+qTeS0mui0UE5f0Su6FkasjuUcUzJIzE0jOn2+RMu8G6aIbFu
	nNh6E7143ZW9n0hl9uEAoQBWSdDPUTkOHI9gGH4BF9IB74rB5S5S5JeL4ecR10PWMC7hegcLqPm
	1cOZC7IfQcS/3sJN1X2KA9BZqFwa29RVL6kFVKCA0h0YkYiTM7Y3HRws5K2Sy8NvuTUHSiAJGWL
	DPVpHiw=
X-Received: by 2002:a17:90b:4ac2:b0:39e:6c68:fd8b with SMTP id 98e67ed59e1d1-3a0736ae0e5mr1221986a91.32.1790093280523;
        Tue, 22 Sep 2026 09:08:00 -0700 (PDT)
Received: from HYB-2NH2WFe09VB.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07de20eb1sm63989a91.12.2026.09.22.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:07:59 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:07:45 +0100
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v10 04/17] iio: add IIO_FREQUENCY channel type
Message-ID: <bukynp5qvtqf5jgqnxzxesvt5vimm3i3lvqrwmffc7fecjnabx@rqyeho7v5cnn>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
 <20260729-ad9910-iio-driver-v10-4-aa1f6167729e@analog.com>
 <xevuqaudwm4hpnhbful263yx6r45liuch6yc7xjk2i7wly3oxo@xe2htu27rkl7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xevuqaudwm4hpnhbful263yx6r45liuch6yc7xjk2i7wly3oxo@xe2htu27rkl7>

On 22/09/26 16:56, Rodrigo Alencar wrote:
> esOn 29/07/26 09:25, Rodrigo Alencar via B4 Relay wrote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add IIO_FREQUENCY channel type to support Direct Digital Synthesizer (DDS)
> > devices that handles frequency values written directly to its buffered
> > interface.
> 
> ...
> 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---
> >  drivers/iio/industrialio-core.c | 1 +
> >  include/uapi/linux/iio/types.h  | 1 +
> >  tools/iio/iio_event_monitor.c   | 2 ++
> >  3 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> > index bdf3d4c06331..a45277bc5d99 100644
> > --- a/drivers/iio/industrialio-core.c
> > +++ b/drivers/iio/industrialio-core.c
> > @@ -99,6 +99,7 @@ static const char * const iio_chan_type_name_spec[] = {
> >  	[IIO_ATTENTION] = "attention",
> >  	[IIO_ALTCURRENT] = "altcurrent",
> >  	[IIO_COVERAGE] = "coverage",
> > +	[IIO_FREQUENCY] = "frequency",
> 
> Hi Jonathan,
> 
> Thanks for not giving up on this one! Taking a look at the testing branch,
> I think this line was dropped during the rebase (addressing a conflict)

btw, now that we are at this again, it crossed my mind...
Is it fine to have a channel named the same way an attribute may be named?
wonder if userspace tools could get confused.
 
-- 
Kind regards,

Rodrigo Alencar
