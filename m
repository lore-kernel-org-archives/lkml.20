Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571634;
	b=KSVf29xdLC+x5PVwg2Gd0mn6CxJox36lh7XvSxtUe29avFbczu/3RW8mKK4o+SZ4n86c
	 5uSBtuZuIijcJpHOEWDvFpekmnxa6yr+TI78IQftyp+tmyUb7umCkYOT8z0eGytozv/OQ
	 aaNk1vUzQ3BFBXe55hLtlT/F7Mom4AvxtGjA+XJDfH15sz2dm+4rtTbgMuBJl2KHEohOb
	 /V6drwlH/fr5tTOQTvn4lMSwOxeP7uznbQkEPGhaHuLmJ0yy3eOdWEsAbOQaLK3y0MtFK
	 iVTZ2rlgVknd64KbWx11/icLUGtGD/RHx7+ZVKngzy79+p9wwtjgeLpKXedMtQ8f/Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
	b=Drc6ZfcaWwmGNik5LnUVPPAbFh6Rqi/sjW2iYOOcM+e+gJleJPQsy9mhZEXP2bVvmY5H
	 ggTxL568FhnsoVVI5KMizMRZfScsc+iMyxt+8zmtYeEIR03VlR+/fLfZbjklrrJMN20rz
	 2p3ZezMGdVHTBZdWmusPrxyyCk9jHnigrUFEEzkCzqAZRGjIb88xGjtWzrg8X0zcA0cKi
	 OMZiScFCc/Mg9WH+kwesf25ul8etnPfj1s3mmKVu0r6vLj5Yo93eJcqYLE1UWNzPAwwaH
	 r1SzbCdFv/Ac8xEdVyPprezPdCWb9hhX5VEFIQdWa2EtDz0N1yMSmGO7CxGgJ6hgFwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r1hMRlHN;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D89606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D89606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r1hMRlHN
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so3968881fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792571626; x=1793176426; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
        b=r1hMRlHNKxIdoWis5K35C0U6pBm/7vNAgzUYPNgxOyTuaDmbox0SdKa3Ggu77kAXo9
         rx0sLojY9MY9eLFQIVMHli3lNQZF2pRQk1oj9UIPHdLe+glHwLaXZMBcNRKoKzrAGHCm
         RLbhUnQIZKY/yfqBWeMKXDCbkqoQKxbCGe9L2+zfRkPFrs/VO6vJRcJF9R6Lh6G4gaTz
         TGLocTMhr3rye1aGRVzJwZyy8sUY+ZPXNgASDnkSNH6lSPL7LJ5xacv81opcvCqAzqkh
         PYvYMLTGXfSCpamswAeCascR7b80RgejQnTkoh6SIcsrWyzSurXxqIr7FEhSXISWAsPj
         bDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571626; x=1793176426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
        b=HKTAgGaqQJfsvCJY64VGmVow2pGR12wdgKVilPTyA7I6wSN/GHs0rmYgoUOIKrU57y
         0Hf6aTCpzEO0euaS8fno98lyCZtltn95SLwROL9U9LK23c9PT19qZKLElXAHuAKfRezW
         gl6KU2PNx+J+qL7UD2XOBRyDE/ZsYKv6kJsdyRqUe1Bj9I/S8ZCPBUPr8IaMbxqR776+
         eLLxYtBxRFZwM19MS4zOmp8JH+SCz9+AaePLZyBUCqRq5Nr1r2jFMrd/YdEtx3Lshoef
         Pko/tQQoxucOsBi0GVOLhWuskF+RZWiqKA/nABhXw+A9CW2Rd2Dpnf9EcKJTUbE35XqB
         fCoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkVe7tFyB/Gby7vAfNA61V9NwImHFEYX0BF3jGUtjanWK1qz0iTtseK4sOTcgHlzLxGVVbHDox4YG4nMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0L7AfVw2C9kmKbLuHR9Ara/GNGKaw+iwsH4JUdFhLrq6S7ncL
	XNJGDg8EIMXYGyUC5JTtXuiXuVya56gZLaP/f+YVgSyy5J7vtm76XzRleiKahaITgIQ=
X-Gm-Gg: AYBFou1yS4qfWFODnsG6Kvn++EsPme7GSopY0Fd5phIor8nyt34okO9yGHcgHpBNkZg
	8k3HBezp711yob3f1npH4IRlJQ798gJcZ+4Mqs5W+uQGnDs7AiPIkIucZUXuDeVfam7ARCD5GDw
	RorbSjP7ktkapl8pgO7qhF8YHjS/Ww0KGgTe6m7q2d8Ge3K910/ndfreJfcoau29DxhBwj8+61K
	39cqXnNdvqORwd8UUEzMpirawHEE00akPEyJbwi8wkkim2ZVT3qOYw4gqssdBJXEuvTz52zZ77M
	lohyX+I4lmmzbuGmQRPWJ+lbKs346i+mp43RuLupV0UxfnGvJVtdJQH2I4xXmi46xMhJL55Iq9E
	XE2P+0r0ueao/C9UrBxZQJkKDWsbnSIvag0+W8vi65xpjRtWG/JP9w2SLOWMoBAjcGtR1m8KEtV
	nxBvR5HBGJRo+auAutHCy9wH0IRLQB6j/Xlet02q1J/7tS3+OVEkiONnU+12+zDiyGwtl2HdYqo
	oQClRjX/O/tILMHuks+FoMlvL86TvV0e0dz9bUeNqOJ/uGKSwKawKKboa6egBfrNmA=
X-Received: by 2002:a2e:be10:0:b0:3a6:692d:b7ed with SMTP id 38308e7fff4ca-3ac441af820mr4315381fa.20.1792571625331;
        Wed, 21 Oct 2026 01:33:45 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac43772cb3sm4553341fa.16.2026.10.21.01.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:33:44 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:33:42 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dionna Glaze <drdeeglaze@gmail.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, roberto.sassu@huawei.com, 
	zohar@linux.ibm.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <ath4vwt7KGyDXKVJ@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com>
 <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
 <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
 <20261019225658.GS13920@nvidia.com>
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
In-Reply-To: <20261019225658.GS13920@nvidia.com>

Tue, Oct 20, 2026 at 12:56:58AM +0200, jgg@nvidia.com wrote:
>On Mon, Oct 19, 2026 at 09:10:31AM -0700, Dionna Glaze wrote:
>> On Mon, Oct 19, 2026 at 5:08 AM Jiri Pirko <jiri@resnulli.us> wrote:
>> >
>> > Yeah, I was thinking about this and went back and forth. In the end, the
>> > only reason for leaving it unbounded is to allow multiple independent
>> > users of the same register. For example, IMA and systemd could share a
>> > TDX RTMR. The systemd side would read the journal through the
>> > attestation device and the IMA side through securityfs, but both are
>> > views of the same journal. If one side truncated it, the other could no
>> > longer replay the RTMR. Isn't this the valid usecase? Do you see how to
>> > resolve this?
>> >
>> 
>> Bright minds have spent a significant amount of time working on this.
>> 
>> +Roberto Sassu, +Mimi Zohar
>> IMA logs and systemd logs are both system level concerns that are
>> relevant to the OS construction, not individual users,
>> so I would just say to reroute IMA to use ctlv using a kernel config
>> setting, then make systemd the new system manager of the holistic log.
>> The securityfs log contents can simply say, "log managed by ctlv" in
>> this setting, in the form of the template identifier.
>> For policy violations, only the 0... extend needs to go to ctlv.
>> IMA can still keep its violation log as a ring buffer when it's not a
>> 1-to-1 violation to extension
>> https://www.youtube.com/watch?v=gyYUYbdiN_4
>
>I think for now we should not include a new dynamic log here, the uAPI
>around this Jiri drafted can remain a future step. I don't want to
>open complicated discussions about new functionality at this
>stage. The whole CTLV idea in general is a big enough thing to bite
>off for this series.

Okay, dropping the log from this set.

[..]
