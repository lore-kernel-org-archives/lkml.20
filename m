Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495915;
	b=aR5vTaN17J3b3WtwtkJxcpvWaDv80xDhAqYq+2zmF+QMN4emjArIKVJ7BYCHCXfOpYOZ
	 ZBHz+DI+OpHuQiz3b0To2daXUkgVcmyIy8sX0h0VHj0O9kj/jnxuRsnNFRSI9h3MgiAaD
	 xZMlG+4nbxAna7yxljZSESWscLxKPPtCkv+hHXR2u5XGMGqNgo4UrhwX4dzqNwj/ee0Di
	 ASjrd3e5OXHODXp752ftfjJhQi+A1YruUosK4HaIugysic/wb2Q1QsXistUtnLMqmVZI6
	 rSzQGAGVtAuPMdeAbyjzJUH39UO6It/L9rphcuPEmBVWJDx0zQk48/uqonItGCUqD3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=S7kwDV6MelTeL1pkSgLuYwh13YG2X8zQTd6fWfAoYbk=;
	b=4DcRa2qjZjSiJRqkx3hfIhVJyHNn1EsKPk9/0eWS+HvVDoPl0mtvPIf82QE+L2MOjePk
	 ZTbDkmRzn4LGEo8mcHS7/vS2xwzWIRW9ImD2yK7yqeLZme3Nkw0ah/nuyY2/nPOpHWH5v
	 6673SZFdnY4M8IIUVTy0Rb4ewiCJ3UPv5W7SP26Df+JPXk2iVrmWimmnKulM2FGsEhgSO
	 gbSeG06IOBVbaIv7amFblKv7OdIFAPm5AOuLbOdgCMZoIgTG4d1x/md/OZ9jXj5XKgUXt
	 6O0PeYZJvj4gN/o94u4F6NK++NYHluaRC7VK/4UXTQ0bgv7a3BwS0FT0TcrdK86kR8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O828mUDh;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D95606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O828mUDh
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso453194f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792495914; x=1793100714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7kwDV6MelTeL1pkSgLuYwh13YG2X8zQTd6fWfAoYbk=;
        b=O828mUDhEAgpmltNJDuaX9/H3ziuDjwZFgXzLyiLINN2bHY1apklnQay4+Na0cKKA9
         8w781IzbOgs86t6mEr0SxZTucnmGz76Pi4Q60U5RV5W0POWZL2xWYR3S+oOooLS1a9/Z
         eKp5upvvjs+CP1I3kUPhvh6XgHOIYv/MBhRh9pd1MqKpMvPXHr/KhltgaWL2qIJjtcEh
         pEj3HNsuVg9Y5O3E74okI9Zuiv9x88Nh0QLFXWL58IZ/GEZD+0joaj5OwvE0JkSQRt2m
         umwcrwUH8qw9HksNLBc1xqNeitGTx+Wrt8b/m/ElixxiJg+jzl2GAhj8enHL66QKtqct
         kTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495914; x=1793100714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S7kwDV6MelTeL1pkSgLuYwh13YG2X8zQTd6fWfAoYbk=;
        b=HvLY8Iatca8aqLAO9XW3gARrDhtU1SdmBBIulPB6Z4ueQtRLrgXsTSDC8I00tWrbOQ
         nSgdrp4LAeB005AWe+uirFXro5UAJUEX7aP3FlHL3CNyQZu1kVjxb+UzyFaB5wTrGZlp
         eg0WpJzuA1jiDm+ZRPy0H9pUFiRAQGeSBppPHNGFOoOo75G7UVPUprb6sPoJblUPsiO+
         fpsuSmt1jIe8oNMV1wGRH407m2QXpTygEjB0+qy8J2II6pmv/2cXomCuQIhsjQxKQV/5
         wB46Y6EQ1WUUI6fc0eIHwTbkmBQqyeO//S0FiGk431EzLCB+y/7jBzMYjbA4KtFX8BUW
         W+Eg==
X-Forwarded-Encrypted: i=1; AKwUvByZPNXq4rLYQNHsrBQYmGQK3YuwmkSVTQCZEroPLyZ5zAOMioiiWsbjWbLT7NpC0SRRWXZf/0/MyNHcP18=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWhu/izt1Qxz7m/HuF60k8qKeEwwt5evggm6ISXs27Hjl0/TKh
	hEHsWIXp/OxcKz/+tYALcebvy8FEFrUOZ0ohGE5g1vIZl6qLgSI0C3tR/OkbTl0YaRU=
X-Gm-Gg: AYBFou1u80f1x9dR2r/seZKwa+0Ji1bTEzGsObs5EdY7WWAj/RQXdYHL+vrzrKBVZmG
	M1RxJVo4fjOIovhMWfgc5B3bgF/M0qFY5rMvBaQzP6eI9YIWV1cb0XF8ZhZ8IXqMJFbCUgbObK8
	AsfKMMWCLXpv6xNd0xji8oVxyTI/cMNyYxykCIdHla3HmQyLM6AZR7By5R2mJnYtzz848JVlkf6
	HbvtbRZ2Yf0k22i+iVwxmcwjZWghHg4iS5sB3aIyv9ujVyVY2+mgrzoF/Az2trtJSd97lU5+Suh
	1PyFC1b8z5QmIjXpEt1jzoATBg9wpG94XqDkv1NRlkT+TzFWjlwyNkZ0/H8YgKjuAeNNZ/dFGw6
	W0v0pxpJftH96OAOee6VwxpHFv15bNp/CNfTKCVXGxFLk3F9Vet9elOkIeP7lIdfJK9asHVMQmb
	JXx5+JAzIUrCdRDEmsncfBXZAEvhbc+7EVGAZqtpiszggn6PrAMROOQm2LBPiMMAAcsX0S/1SZe
	fVwbkiZBve/FkMhJHn7SdmbOBuxP11ij2iULP8=
X-Received: by 2002:a05:6000:2601:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e07bb30a3mr24304766f8f.18.1792495912842;
        Tue, 20 Oct 2026 04:31:52 -0700 (PDT)
Received: from localhost (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fc6csm5348902f8f.14.2026.10.20.04.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:31:52 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:31:51 +0200
From: Jan Remes <ciakval@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.triska@mycroftmind.com,
	Jan Remes <jan.remes@mycroftmind.com>
Subject: Re: [PATCH v2 0/4] iio: light: tsl2591: fix lux calculation and
 precision, add I2C ID table, report saturation
Message-ID: <atdRJ3JqAyGWOnxf@mm-ntb-00805>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.triska@mycroftmind.com,
	Jan Remes <jan.remes@mycroftmind.com>
References: <20261014141650.259929-1-ciakval@gmail.com>
 <atEdM6wi_FAGFjrr@ashevche-desk.local>
 <20261017031411.05dee323@jic23-hlaptop>
 <atXSBHbOPYYltHUW@mm-ntb-00805>
 <atXZwm5DzCK8S0_K@ashevche-desk.local>
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
In-Reply-To: <atXZwm5DzCK8S0_K@ashevche-desk.local>

On Mon, 19 Oct 2026 11:50:10 +0300, Andy Shevchenko wrote:
>
> On Mon, Oct 19, 2026 at 10:17:08AM +0200, Jan Remes wrote:
> > On Sat, 17 Oct 2026 03:14:11 +0100, Jonathan Cameron wrote:
> > > On Thu, 15 Oct 2026 21:36:35 +0300
> > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > >
> > > > From my view (haven't checked the calculations, though) this looks good,
> > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > >
> > > I'm guessing not huge urgency on patch 1, so to keep things simple I've
> > > applied the lot to the testing branch of iio.git. That will get rebased
> > > on rc1 once available in a couple of weeks.
> > >
> > > If you want the fix to go in faster, shout and I'll do that at risk
> > > of slowing down the rest.
> > >
> > FWIW, I don't think it to be very urgent, as people probably don't use
> > it on x86-64 (seeing both as it had only DT probe support and that
> > impacted users are likely to have noticed the oops).
>
> What do you mean by the second part of the sentence? It's as easy to use on
> ACPI platforms as on DT, we have so nice trick called PRP0001, which allows to
> enumerate "OF-only" drivers on ACPI platforms via SSDT overlays (or other means
> of DSDT/SSDT provisioning).

[ Sorry for the delay and potential malformed e-mail, I was trying to
interface mutt with my $DAYJOB Outlook e-mail until I got the idea to
just export this one e-mail into mbox. ]

I did not know about the PRP0001 (thanks), so please disregard that
argument. Still, I believe x86 users to be few if any, since the oops is
quite easy to trigger and AFAIK most x86 distro kernels ship without
CONFIG_OF.

Best regards,
  Jan Remes
