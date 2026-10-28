Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161188;
	b=wroRKalJPEi4mjZtNpgb3QXsFr3mnC704QlfDx3kZJnXZ1tk2j5gSkB1MD671W5j7Vg3
	 PUN6vFOYlrK9l8/4qeqj4CMAT1iOHbaYI4eeZAYPAzQHdR34IWP74cm4wTspkP9dgQmTG
	 Udt5u0zR4+7UQVh8IRV2HU2UGsha3A9kpFI9vV0JKzlSKcQaaujNziGANfkIFPste8Uyz
	 MZquZmgOUN6DutYg2sJlJOMRavjixUZ8HS/LHQ/tG0OdrayIbq7iovYfZiGR06EkvLJ2B
	 XUkzr4S3n4W1LpTwhxFr3HMUHp0x4IhD0x4DgcdV5gjOgvWKo3/2R/dQrzaWNN0ui2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161188;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yI3vwpPBInvH/LES7DYlApeXwb2M5T6kOWmanMnl+Nk=;
	b=NQtdByzqQIqI+HePdBcjVzsa1dAVFfYzPAWRRc5Q3avbCnNHmnySaNBwtW8K5xH0n41K
	 HNtFKlhRM2gb6OZXxdA8nXWr1hnX2n/bUCgACKTdEb9N0n8ux7xQAn1JlX+10mdfWHqOu
	 6SnbdIPLYIKbRXbWy80YDjRt5KEw8Q7EUcON8e3RO4YoVbL896vQtb6/6i9BBekO7Wikz
	 BKR/JZgIR9EKzXUhk92a9V+SIxJNwvHD8LPkH7HT8CQbDbskMacColVDq/IeUxrlb7Et6
	 dhuF13kSYClm6672v5sahlAkpEYhacoy6FjdIdXvqmx5t0QCxuhrcIxdTFNVOq7i4+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wD1SlH5U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C18606A31A;
	Wed, 28 Oct 2026 04:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wD1SlH5U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB9F1F01825;
	Wed, 28 Oct 2026 04:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793161187;
	bh=yI3vwpPBInvH/LES7DYlApeXwb2M5T6kOWmanMnl+Nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wD1SlH5U7o2kTNkuFAV4pyLPDIRBrmnEM7nb031itrNFKD+O4l8igrqS/Drsysoqi
	 6lPzDvGXu57NVrYikSmbUGy0CN/YfSJGxHYojYD2de3WqO8MK4nik7AAfGpOtgrOl1
	 wJ1kD7hpzDgWOVzRRhdC+2t35IiW0Jfn6MZK4CAQ=
Date: Wed, 28 Oct 2026 05:19:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel West <daniel.west.dev@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Add newlines to sysfs output
Message-ID: <2026102808-stunning-headgear-4355@gregkh>
References: <auEmTBqbAPvMLRcg@daniel-HP-Stream-Laptop-14>
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
In-Reply-To: <auEmTBqbAPvMLRcg@daniel-HP-Stream-Laptop-14>

On Tue, Oct 27, 2026 at 06:31:40PM -0400, Daniel West wrote:
> >From 6376e59cb4d0fa2d57ff7f4fb2ce6cdb8bb1d03a Mon Sep 17 00:00:00 2001
> From: Daniel West <daniel.west.dev@gmail.com>
> Date: Tue, 27 Oct 2026 15:53:19 -0400
> Subject: [PATCH] staging: greybus: Add newlines to sysfs output

This shouldn't be here in the body of the email, right?

> 
> Add terminating newlines to the sysfs_emit attributes in the Greybus audio manager per warnings from checkpatch.

Didn't checkpatch warn you about too long of lines here?

> 
> WARNING: return sysfs_emit(...) formats should include a terminating newline

Please read the archives for why this warning is ok to ignore here.

thanks,

greg k-h
