Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539A499F3B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551911; cv=none; b=lp+mw7oKw6blBaVY+CM8iDr6XKJDSIQVL9A214NSSLOlj5Xl4EhSLM/vi5teUJ8AVOLfi932sLt0r+JlkrtPjJ+VaXaJPM5BzS60L5+Gc2CXvTkDAchJX2kKo6LBD9fNx+tM0Ffp4jnMt8uAnoE0RcKRyT3NV1aEjuVLOpwbsg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551911; c=relaxed/simple;
	bh=MR2n2E+Ve4xO4iUtdmDW34456DHtOWZBko8Pj6o1iIU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpzkVO/DzG4yXF3hKX6EkkKdtQlMSwTLJGquoN2PHPF6PY3U1WI0dEaiyrvFGWOtGVzczTKjqXqgDWbFa4DE87e3TtuVUUf74rNRbeVY4diPbatcDJXETqbscPdIUdAI2goCE8OW7dOKEKli8amNeD3rUsq5vJa5qdjwCVoiDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZLSb1k0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZLSb1k0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so3462485e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789551899; x=1790156699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlvIWhHxBEziBE7U0OeSd/0yRYTGHP2RvC97KNNwMIM=;
        b=UZLSb1k05dP78zdfVGpisY9oAFhpWoCGbeS8KoAGEA8ewUFklmFuh2TSCQwO7D8UiX
         G6GDeKk1WwAd0xq/l8HCB4qAsyk53jDcjQO7tkLPCSAjCRI7azo7jI+eZBpton19mjBs
         k9dc+EVMxflSj2ItGCN36FvTK1sbHwUwybI7qBhwinzIsnPRhEMnt6U35OzrEiiKY+De
         Uz96mnCn32+iEIE6w4l9h6b+lahYa6qJToo4/7RUyKQxFpp2SqcUNBt0upvMeAzgzhil
         rcUPB7dzG76c7cdorV82MEn0IazAaNEw7NsAIzkw3CHUT+T3+yX1xRXfqCuBQFT97E9u
         25iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551899; x=1790156699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlvIWhHxBEziBE7U0OeSd/0yRYTGHP2RvC97KNNwMIM=;
        b=bMOlrIE2wAtla3Yh7pTzDDIm3ViAc+BcjDYAhSHh7GYkye1Yf8PbK1/USR3bHRB08A
         f8HSWJt2MnwPXH1bGCIDdB+3bz8gNEBDoHjuxq8HcqIxAn5ZsKWt2q538Pqn21COwvgp
         49n27IknjyxXobo5pi11t+7Vo2HpCprudRyaheC8wUub9GLmSmnC6eosT9kE81LwB4gA
         pIi0Gbtsv4U9FZYmJ6tyvrZABaqYCgW/lp0Exzf2AvwYaCI3RXAuK/bcoViPw+6L64OI
         27KzWtahuRmUujX4arUUpi/GW0oRvZQ2rw4iyOTwh6iEfXV1jycuuRAF1U5aRnXiTj21
         rATQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3OHS42wG275sD04NhGfkj6yRQTvPiEQx/K0C3r6yiQL/sVFjv2sXJm6Akya6kdP26dWxABAGM+gzcPNM=@vger.kernel.org
X-Gm-Message-State: AFuF++na6qxyB0kk0SfJjM+Nq1nLDZACgMszD9YEiuRE8qduxGcU1k3g
	ZSAJKEquuHg2hjvb/q/2vi4/QoK/PqnchqUtLEpNTsbF6hU5gJnuRHit
X-Gm-Gg: AYBFou0mOe5vKNS0EsMce0D02aK5fMj1b+C2EHFJ109MRcLI00t4kRcNzNjEzJUQvFq
	WjhGPoVC9gnwBwRcRFBOyZSAMQC1aqgdrpfL9hxfEkpVS/+Pp1e5HGtVPY6dslkXzuwUh3E33Br
	wEnSZcwbA+tVtdzqTHcNd5ADvSswtJ4kaI6yrqG2fyWZrvpQlIBXSGaeqjLvm6TLClNVhH1s5wT
	ElDXN22Tv7EPehi9tnCBcUL8ZdJ/qTSjvsiNcudZYqxOa+4zMXrJ6BrQWFycMrxNxEn0vDXvCqJ
	WqdRpWRsgEtV2Y+zn7BHl/AaXWtL+KHZ3QRxaCpS5Bi7bljPgezLP2y1UP2nbdm6HsureDF4+ch
	zEFfM/Rf9CN3zNFGmQl0Q8CpyRL8tbEAN63+bI7TF6DiSzZbsp7nxU2euFbmCCoL74dXDMaPqDL
	nbCL4bw19+IFr4BHsOG0Jcq1m9JBwiLl5uEKi3K9shUxkey/uxnxJRKyml6CCYCbOktYkKArUtH
	bkEDWC9vb9X8UkoyQ5Jai0bZVJUvBeMJ3O2/R4O/VJmPtR0IBPC2twMG2zdRvYx7Ql8tZdSY773
	BkBjg6VEd71bGKPxCGxsbiBi+8X+L2NGqAmifTDzNL7YOzc2jWBIYSB5JaLhqaZYFr7g0AcozT/
	T0wFWFmI4aSnZg5pg3Dy2g9AIU4GI/UzYx86XW+ZlqtNQH9tuNVM+BOi0m+9/jb2JKCv5zjtnwa
	AOnsHc
X-Received: by 2002:a05:600d:1b:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49f1d516a12mr35131575e9.8.1789551898435;
        Wed, 16 Sep 2026 02:44:58 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b02211sm68509815e9.9.2026.09.16.02.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:44:58 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:44:57 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kanak Shilledar <Kanak.Shilledar@axis.com>
Cc: "jic23@kernel.org" <jic23@kernel.org>, "dlechner@baylibre.com"
 <dlechner@baylibre.com>, Henrik Grimler <Henrik.Grimler@axis.com>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>, "jean-baptiste.maneyrol@tdk.com"
 <jean-baptiste.maneyrol@tdk.com>, "robh@kernel.org" <robh@kernel.org>,
 "marcelo.schmitt1@gmail.com" <marcelo.schmitt1@gmail.com>,
 "andy@kernel.org" <andy@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "macromorgan@hotmail.com" <macromorgan@hotmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, Kernel <Kernel@axis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 7/8] iio: imu: inv_icm42607: Add accelerometer
 calibbias support
Message-ID: <20260916114457.000073ba@gmail.com>
In-Reply-To: <b58448efafcd27ceb2c924139ea97201b349b534.camel@axis.com>
References: <20260901-b4-inv_icm42370p-v3-0-77cc31642115@axis.com>
	<20260901-b4-inv_icm42370p-v3-7-77cc31642115@axis.com>
	<178874609182.3402141.6437933635539106261.b4-review@b4>
	<b58448efafcd27ceb2c924139ea97201b349b534.camel@axis.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 09:37:32 +0000
Kanak Shilledar <Kanak.Shilledar@axis.com> wrote:

> Hi Jonathan,
> 
> On Mon, 2026-09-07 at 02:54 +0100, Jonathan Cameron wrote:
> > > Expose IIO_CHAN_INFO_CALIBBIAS on the accelerometer channels. The
> > > registers are stored in MREG1, which can be accessed by the
> > > mreg_read
> > > and mreg_write routines. The calibration bias is written to
> > > OFFSET_USER4
> > > to OFFSET_USER8 registers in MREG1.
> > > 
> > > Note: The accelerometer functionality is tested with Invensense,
> > > ICM42370-P development board.
> > > 
> > > Datasheet:
> > > https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
> > > Datasheet: https://www.lcsc.com/product-detail/C5129967.html
> > > Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>  
> > 
> > Various things inline.
> > 
> > Thanks
> > 
> > Jonathan  
> 
> I will fix these issues.
> Thanks and Regards,
> Kanak Shilledar
> 

Hi Kanak,

No need to send a response to a review only saying you'll fix the
pointed out issues, it generates too much noise on the list. No
response means you agree with the review and will address it in
the next version :)

Thanks!

--
Kind regards,
Joshua Crofts
