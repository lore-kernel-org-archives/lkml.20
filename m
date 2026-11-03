Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702624;
	b=pD0SEzJVobz30qQvlq5hdfs0vbi73XvyoZu2sX+riQydG1pSv5PTWTNKuotb8w0YGR8S
	 HlBicy7ywMqU7LFREodNFKklS7ovGWMoNymqLP6oWmS4VFUvXUjX7wiHn84ag81trPXDo
	 MEpzNgQTz90spznu1ERkjWJDXQkORBBOU7ZIWFhMj2fINtl4qNdGlaf8fGV7BYEzNyFK1
	 IwSA6mOGAgjHG8fWA1AO4NMayIla9itSD0MxoswC7FfeTl7brtztovhcTJ4QGPsH1Swz5
	 cm9AaDy5VVj5sX6yvkuADLtAaj1UkCEqLK52e9Hppks6CIWtzygm8+oU+GXq/Rn2aRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KYGsm00/gcmN5SQP6MqBGrok4btxYpgwkWC17qctOHI=;
	b=HyEV7R8F1Sm7QscvrXbkBUunj2/4jcWADv+SmxuO+N4oNbBzb8JcN4N0c0MmCHkNTIwW
	 x7r52cM47fW+swb9r4pX7URgfR1l08fNwwOjNQgizPPSFc1o6YbqDFREyBi1FqU7w//Xw
	 XTsa6xeb7u2xpDRa2M9WFT+XQY61uw66w4MCUMGd+F4JYksn2Aws2IjckWepxmDq/BZTA
	 lU7xEvzfLwUXtIsfNS91cmB0DmptRKx3LOyZwnlxPh3bk7h6Or1JeIb4JG93DMpazJY90
	 Daeo3yJlVZbsx0xTAHXuy8ryAASxk83m4PZ48tL9rqPyUeKN0ATD/FaMAuoMAjxgR6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b="JtAzCoU/";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2E606F7ED
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD2E606F7ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=JtAzCoU/
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18cdcfc05ffso4835995c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1793702623; x=1794307423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYGsm00/gcmN5SQP6MqBGrok4btxYpgwkWC17qctOHI=;
        b=JtAzCoU/LpVgMTFS4bwIHvEzHO5i4MWpLZ/ijSkfPDqJga2P6dz6QzWFKkJm1wpFdm
         8KiYX1L+NHCr4wi8kONoHoU9rRDY8BzrFs6vwcpza2QX0xJho5hM2j2QD2WlE2HAFz2W
         SnxMJezORORXMYDvbXau5HLf4ec/El7/rncug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702623; x=1794307423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYGsm00/gcmN5SQP6MqBGrok4btxYpgwkWC17qctOHI=;
        b=dLXZ4Kc03DW+Jcf+ePI8OmBHTEsd7ozemhKJ5X2HQ8xYOxNimr5pPrzWpvNyJohI8J
         L0D9AIznFr3GNVXyjA/zialSKJFOUhVwYDPdlQ/w19hEY1uFjt9uHsWHNDrGzWdqt4N4
         2bZzr7lTaMxqft3VbNQlXjYflQAKM8v29cUil50uLUt7xElfwrw9tZucwnOwdLeAqijp
         K/Otq1q75An4ZzPptLE8OU4MbutT+hcd+zCvNMjlfvgSrJJADVfa1l3QHVp6qWnqSreH
         T+jLWXr+mM50pfycdt9XVZe/hKSi4N5BXRZ3H6WMtPHX/oNOo/hvi+bM6rYmzhcYQm7r
         sK8g==
X-Forwarded-Encrypted: i=1; AKwUvBy20gz7+HdsQLG6JwF7HVo/sH2ahSvj0aUE/+WlH3To0Djw66zDBNpdKFk4K33GCmDChmVXRvPpLEHE7bQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z87+oHAPNAF6Cm6VV3721Ru+57s+astKQZL2oqTo4dWHs7s8m1T
	72qRcDNrBPp/ckmiNUUbrMFsumPj7Ao3J4d18vJYlPlhty3Mv4KMCPBHLqeMgmqyND4=
X-Gm-Gg: AYBFou36sP4BQ0ETNJFXh90RqnWExkbKsejNJn6cP01aQf2JgW8pE/05ed2b6zj69ty
	0dpaV9+0ax9B43cGK2RLSeB1n35WQnAu/n5N01G824a7dtI01F1TjTeCYl/HSLGD6U3Tf6WQDEt
	x7awkM4zNq2JRC53UBOwAnpw3kibue24bLvD1MQKjCHyrupDSQFjRsBm4Hp0G0pOglf6MmoIIhS
	ZpCt5M+arRi02/VJwRyoy6Q4oJyEOicDqyx/bW9XbHbQalHkmICqyTXsbg8I+K9iLvCfdQvgmEz
	HQmYjayrfyo585AcTBqSsLz0ZqI4OC+CeNQATmLYb1b5BF4PvvUtj2NQ9sPCR7uzmKWMCejcxro
	JENidBBXoLC9oU5wv73LExotwFuPtrB2ll9+oattTaywakWmZwGrFZQ95GD5l76Vdkss/V3gixk
	gKEyjd2m/muA2gb7UascQZ93m5TGBVCcoZOfXzgCimwdsMdB+oCvUihRIFJ8J7420uk8vvaINbM
	vWlhpIisWNbxfkYIYM7jmPLKpNrW11H0R+5+zyMR2Avhm64q3jioWPUfMux0rNStlopVab9XUUg
	5C4Cw4FqBmVrquTy3Lf4BdN2r1QG+A==
X-Received: by 2002:a05:701b:4248:20b0:1a1:c1e3:1ec with SMTP id a92af1059eb24-1ac5ecb684emr19651737c88.46.1793702623204;
        Tue, 03 Nov 2026 02:43:43 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm55034455c88.6.2026.11.03.02.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:43:42 -0800 (PST)
Date: Tue, 3 Nov 2026 19:43:20 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] accel/rocket: Report per-core engine usage through
 fdinfo
Message-ID: <aum6YsBrHFp29gQA@rock-5b-plus>
References: <20261101152723.1430312-1-sidong.yang@furiosa.ai>
 <CAKbEznv0ApgORxJO8BQY+XeDC94dqHz3GmdojwV7E7bdOCwo4Q@mail.gmail.com>
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
In-Reply-To: <CAKbEznv0ApgORxJO8BQY+XeDC94dqHz3GmdojwV7E7bdOCwo4Q@mail.gmail.com>

On Tue, Nov 03, 2026 at 07:14:14PM +0900, Gyeyoung Baek wrote:
> Hi Sidong,
> 
> > +
> >  static int
> >  rocket_open(struct drm_device *dev, struct drm_file *file)
> >  {
> > @@ -86,10 +107,19 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
> >         }
> >
> >         rocket_priv->rdev = rdev;
> > +
> > +       rocket_priv->engine_usage = kzalloc_flex(*rocket_priv->engine_usage,
> > +                                                elapsed_ns, rdev->max_cores);
> > +       if (!rocket_priv->engine_usage) {
> > +               ret = -ENOMEM;
> > +               goto err_free;
> > +       }
> > +       kref_init(&rocket_priv->engine_usage->kref);
> 
> How about moving these lines into a rocket_engine_usage_create() helper, to pair
> with rocket_engine_usage_destroy()?

Sure, I'll make it for v3.

Thanks,
Sidong
> 
> Otherwise LGTM. Tested on RK3588 (ROCK 5B) with KASAN: the OOB from v1 no
> longer reproduces, and drm-engine-npu* times are accounted as expected
> while running benchmark_model with teflon.
> 
> Reviewed-by: Gyeyoung Baek <gye976@gmail.com>
> Tested-by: Gyeyoung Baek <gye976@gmail.com>
> 
> -- 
> Thanks,
> Gyeyoung
