Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176249;
	b=W4sPx+pEI9oijpQPTLUIwxx9UXHdU9F3Xa0IkgtBDyRKyiZfvQYeeayXLhdFZzz4XDlu
	 gRm/9awlTtQA6Yw+ghmtrfYeqlx9bEeFGzcVVDN2KhnF9U5/Lm9w7p0lRmbbzB2Ubyi2S
	 6kLC9TyXYpi6x9iwFMXsaOmCofc23rZgWeDRdJcu6IIAWAfSrCV1+YML5UfO8lwma1wU3
	 bPP/5fDumi2kRllVdYEE68+MHzrt12pRnDJa2e42C+eWBKp0zp8mEuViq7alNdPNOHy4Z
	 abAcXgcvBj6v/205MN6v5bYDclTV4wkXFYPHdFZ8Zz1ZA9zQby30Q9Fnft/4ZGwIc2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176249;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=F2U3kdoVG434NqHThnyunhDlyK5ZpnJvS54IwGJgLWI=;
	b=O0BbW7mhDBSw3JlE67kfzAnpO4cYrlRxzOafjv3a3aStXy+K0f88EqvNmAAwc6s7nPkE
	 qCjUjThO5KFIVyCHVtWyLXAngmq8aSOmsiBg4db78H3Oog33GZOJMGpH1Q7DdsLPk8LuJ
	 IGlGNzz+9Cm1L4QCTF8LPHnz6zBCb88ROx1H46Do5T6nJ6qFiQthyf3gMHloCHkphaVXD
	 rRa8hRR5I2IjF4DqD8I27m0zWwOsRP8C50Z4mo6meTmYAIM6a5Zuc95XSJ5V67GlmI6pZ
	 IcF5QrdmSEAORi9U4qQwj+IgzRUjLihSgaXyuHkolcefsIKu6PkmV2iAUgtwSCPxaDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="y0T3/6nz";
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B3606A31A;
	Wed, 28 Oct 2026 08:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9B3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=y0T3/6nz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793176245; x=1793435445;
	bh=F2U3kdoVG434NqHThnyunhDlyK5ZpnJvS54IwGJgLWI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=y0T3/6nzMB2YJf9eHv+Wk3JP9Ny/jchhjsbieyF9M+oXqTifXgODJZ0gdNuE4tTXN
	 hJFFRU8ZztWZnPhQk8Ee+xu/1V7dFzL0ICACGa3sMnRd0z/s4rbh4mhKL2nOrkd7Qq
	 WPF1IsYh7kV4VNr8bM7l3yn3Wll3Fk8Wy+xVfC4rXV+lJ0BKqn7d/MurLN0E9oiUQe
	 xmySwg+A3hxv9jwlDZ636/5QYCRLm/WjkTvvCQJJ5zFBRTu9di9lUXUmcuNZP7HUqb
	 AykfrzFnLP/rS89laKEcilICd8+7O7SzjLYPQ5ErqBf/5ePXtoIKDPFuEzQ8MdVA1o
	 l1cAQvpM+7VoA==
Date: Wed, 28 Oct 2026 08:30:43 +0000
To: Daniel Scally <dan.scally@ideasonboard.com>
From: Simon Kruse <simon0x+git@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Fernando Rimoli <fernandorimoli11@gmail.com>, Marco Ziliani <rylos78@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5693: Use sub-device active state
Message-ID: <20261028083033.64922-1-simon0x+git@proton.me>
In-Reply-To: <ff527b5c-b1cb-42a5-9b8d-f039b7a7f7f6@ideasonboard.com>
References: <20261027074933.21921-1-simon0x+git@proton.me> <ff527b5c-b1cb-42a5-9b8d-f039b7a7f7f6@ideasonboard.com>
Feedback-ID: 50827409:user:proton
X-Pm-Message-ID: c821cadf69dba65970120eb9b6572e1cf167922b
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
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks for the review.

On 27/10/2026 15:49, Dan Scally wrote:
> This patch does quite a lot in one go, it would be better if it could be =
broken down into a number
> of smaller logical changes. You're removing here the lock from the driver=
 and instead using the
> default one from v4l2_ctrl_handler. That might be a fine idea, but I don'=
t think it's necessary to
> switch the driver to use the subdev active state right? Could it be broke=
n out?

Agreed, it is not needed. v2 keeps the driver mutex and uses it as the
state lock, so ov5693_sensor_resume() stays as it is.

> Why did this function call move to here from ov5693_sensor_init()?

With the 1 s autosuspend delay, pm_runtime_resume_and_get() in
s_stream() skips the resume callback if the sensor is still powered from
the previous stream, so a set_fmt or set_selection made in that window
never reaches the sensor. Marco Ziliani has since posted that fix on
its own, with measurements on several Surface models [1], so v2 drops
it from my patch and is based on his series.

> There's a FIXME in this function that now no longer applies and can be re=
moved.

Will do.

> Descending order of line length please.

Will fix.

[1] https://lore.kernel.org/linux-media/20261027-ov5693-fixes-v1-0-3c8ab1ae=
104d@gmail.com/

Regards,
Simon

