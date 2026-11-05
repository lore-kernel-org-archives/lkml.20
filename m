Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887384;
	b=WhBVdDkn1YQmzMN4uyc+73PSQUjMlLLAJex7P6j2srBqdNTYsUATHB6cwwcmpYD1klz4
	 JNi8ASiIM7mS1yUA6CQ9fbygCzmesKCJkROwT0xS3qeBMhbB8GvrImmH6FvTEsaB4P635
	 Wvn3xbG2goaEhTGj46ktaVcAyLsHvD5viENLmZYpNjBhMe4l5cvUUOPbuknG3lBbunCsE
	 lFDkfUWmNij/Ksme1SCRcPoEkRrpUXAm1ziyjMQNiwJYoghFmB0pWhyexFTRhVLzScJMY
	 dhGqVI9B4B0f8a4WlO8JuXfulvqHbFOMYj339AH0My5Lhu7lyi8Vu7kNyc0GeDNtg7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
	b=NN+TNgHDiWu5piBjqgME0V/T0G/ffHAQGL52scA8MuVuhCojOE/XtbDkzHXjc35c33xX
	 2tSpF92wqz3OVDcFL32wpSXweUGiAM1Ro5t1NrO72yft2GvMW3f1uJwW0IM3YZcTY8yi9
	 yHo2IAsSL7NmfHRT9Oom5jbHB+ybfQM6HyiyVffc+tJEHHHYVbtMLt2cP8Y3CpHIcy9W3
	 Z2PbWfpuRDp8QPR/lreHO6x4+Prcfaca2PfUQAUo0lgezHvyLgJ5GV74ISAU2ZZAUi67K
	 WR1YSe8oYeApN2rguc24OyTL89XLgkXAUsR5vrV5lHZASt5QVbH01YasdoP7XOBRPDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F45606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F45606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so999002f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793887377; x=1794492177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
        b=wcPW2VeSRvODbdYagFsU2XIg0aTXdnhx/kXOwWNbpngwDM/gCfcZrWORghX1FKTjDc
         Mv5N2+vmUnjqQm9dS9NB6DBVam/f0NDbeQqt4+86O0cpG537XPDtso4cmVRWMyArr8PI
         jXiPqpbCMNpRwt04pZ64rNnRkpc1jgKy9F7LZJn034x7mHjW9lWeHDZ8wuGAGcsp9tA6
         fdYaq4RLqyMu+odlklcLb3/vkf+rq5ENmZYu7oz4AZdq4mhjZAN+ODbuapfT9A5hM+9n
         IBsHWEC4PC7xOlWAsj92te775B+ABgmDcVqt7oltV+jbn2ZKpApmiWB2SPL7l15TkecI
         7lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887377; x=1794492177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rw+Vw2Z3L2B8lNDfsIFSmx/pfSm9WeDfRFG4S2Q0cI=;
        b=pPJbJc8ivPHjFUxKAe3refB9vwX6MGTegxGNZklzOz59Pwz51sy8Gm3XYhmFDUeGx9
         VlcDFoMFgjwhV8gPf6QVfGDPiWjzs/2sBqmvel8FNDDdR6FRkh8kEbz1Ur4d7B9Rt4jP
         qXY2z+fT7m7M2CEndUqKYlJFsczcoVofUcj++eoHtAjyVgtSSLI9JgbSZTUPVZ2B1Vme
         zYJ/0magq+wmzAZUJfj9M9nV88teQuwpk5W9LOCY1MUus5Ls9A4JfmBknguizqsLwbMF
         guXn6L3Z6Ve8+d23Ngdux24bT1IK0y3K/T6SyzdoYs6J54THxNnJlOcrDppMgCSndwsX
         awRg==
X-Forwarded-Encrypted: i=1; AKwUvBzYOx45vXg93JZeOGkl0HAW5RUnGhhhuahdXlgnHcF4ivAuH6o5SgmKcDAHMaXeE6br/kIVISjsr2rVJiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZAciIrFiZi5wGf46e5F35rJS/XYMEuVRU/G19cMZZZmjjdv20
	tU0iCSG6rJ1DzpVNjLmT7qH43CGlOoMs8oz/tJco/tAd0Lge5CayFeA/99cOUlEir5A=
X-Gm-Gg: AYBFou08x9pMudoS/bwQqDGfxiaKxefzhuX6X4Ovrhd8JsnSV2J4qRQlo6CnB2BRUbE
	Wp1zbhlp1bdt2OQu8XPNBVxMllekrJ/ABX0Y8lSiZI4zRK5wcwMx6QCbz86UD762g11mcKZIRta
	ob8MIqYedVfmh8ntRCSSO3iFE3HAdOhxHNEG4xK0ZPtaIcbUuSEuiRZavjY0KRve5H8KG+iGpoC
	C5DBVLCZPch6h0vGy+fkZ1i5/PHh36TQRzV6UDKvDXL631utM7o6ZC0FJZPwhbRMMMZ+kwmLQa6
	PhESo2WhQrs9mIwz03U+0g6CAvO6jaQVrq3JYZAEjgWzH3bHxJuJO0V64ppDPAyplLweEmnwpUo
	UYWVijGWuRfOvebRpjs7Cf8UfPp+D8UB82mqf/MnlFF8JjEqdvNow32V8JKMoSy3dxZJUZmC1hw
	CB+ZV5is1L1LDVRhSJAcIzlIRP3L+wFz0HcRS/mhBT1IalIyxQ5tub39v0b3fSAoDoShicbAwL+
	3fb9vhyHcdbkwu1YJbNPOQ2HJ+uFlbSA/u8ZYt8kPtR+F8h/hp0Vaoj7Zssw4HUQoTPM+VGOX5F
	DrLvXKjbPuNjENYjVRIUfOAW/EW8L3VeNfYFxJQ=
X-Received: by 2002:a05:6000:310f:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-48e6e2c3586mr39104058f8f.1.1793887376849;
        Thu, 05 Nov 2026 06:02:56 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm10937240f8f.19.2026.11.05.06.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:02:56 -0800 (PST)
Date: Thu, 5 Nov 2026 15:02:52 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auyKhc02JmfXNiMe@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]

>
>evidence-get:
>  request:
>    challenge: binary
>
>Binary, blob, raw? Lots of words for the same idea here..

binary is inline field, blob is va/memfd/dmabuf using field. I want to
keep these to "types" of TLV separate.


>
>    objects[]:
>      blob-class: evidence-blob-class
>      format: string
>      representation: evidence-representation
>      data: output-blob
>  reply:
>    object-lengths[]: uint
>    mr-generation?: uint
>
>=======
>
>mr-get:
>  request:
>    id: uint
>  reply:
>    name: string
>    supported-hash-algorithms[]: uint
>
>No definition what these numbers are. They should be TCG2 defined hash
>algorithm constants I guess. Why not have an enum here for them?

it's enum hash_algo - I will make it more explicit including existing
c enums into yaml.


>
>    caps: mr-caps
>    register-index?: uint
>
>So we get a string and a small integer for every MR? Like PCR10 and 10
>for TPM?

Yes. The name is the platform's and the index is the hardware's number,
where it has one. TDX has mrtd without an index and rtmr0-rtmr3 with
0-3. A TPM would have pcr10 and 10.


[..]


>
>=======
>
>mr-extend:
>  request:
>    id: uint
>    values[]:
>      hash-algo: uint
>      data: binary
>  reply:
>    generation: uint
>
>Is this extend 'you give me an exactly sized data that is a hash' or
>'you give me data and I hash it' ?
>
>TPM/etc do both, there are good reasons to have both, and the latter
>is more flexible in supporting crypto agility..

The former. I have a patch in a queue that adds the latter: mr-extend
takes either a digest per bank or the data, as an input blob, which the
kernel hashes with the algorithm of each bank, and the reply returns
the digests the banks were extended by.

