Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500339;
	b=ZE8ilYHiWeR4RRZUGjJFTk6pXr7yFcPqhAKmhurQ9AknRlQdjdQmAn49aBIGVMQ5ZrkZ
	 1lrLMwot8/ArydGCNIkmW45IMOKxDM1fLyEvmnEpaycaZ3RVGHV9tKdpe1xVp9EIVrIVD
	 rqmLTmY849nxLRB8qpVcVJ8nxTCF2NNfc+FtHB9lZjx3gdjmIwu4ChG6POFKSjJji48CI
	 AKEWljZV1cUGDuC/Ccein+wiKTh6hT5v1whMV3ZSfAvUssts7znLk1lv82i492DgTZQf7
	 5LXBHKMma1FBhtemB26sg0gZQmutNowAESSLOpChQ/Kdcni+HBr2zmKhfxqIUP3DgMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5Jgziv0oXH76L4ws+TONisnnpeya3jfmnUGQwTi5aL4=;
	b=b6CZ9tBmllv0kI+KB++B8vyEeeMfWpVfmERYQYuvjq/zdzNoKLbcYTJBLlWVExCaDPAo
	 6rFjw3cyMy+c47ho492AMQfTXRwWurg2CB4NqkicBoGwuoQttSWGh8kv0JbVhWJysloOa
	 SaPEBYOJyKvlZFcfsbhn89tHWRLiZwt1OSfbW+0O4qU/B0eiOYFv6v3Ag0/ZCKm0ZoaE6
	 fpEQFW3LH2zV1D6/OmT7S5xtVeQnvolbhcODuo3zBm/yXLS8bbR6bztvHxU2umZKUjmw7
	 Zt6m2QYTYUuEwlcivtjVVs4lRDr1iaL8tKVl8EwW3jTYsLbMFWkUCLb2YWY7DlT88vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nCOvcJ6M;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B30606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B30606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nCOvcJ6M
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917d595138fso21133516d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792500337; x=1793105137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Jgziv0oXH76L4ws+TONisnnpeya3jfmnUGQwTi5aL4=;
        b=nCOvcJ6M/c2PVcoQQPo8VZ0I1iMWdiilnMF/fBURNmxmeUV5JvLD5Hv+wv/7hI0ykn
         S1w6Yxzmn4lEU1lB0tHsqbFWM26fDunb2K+bNVa7nf+ylraqzlc5jlvJ++WuQAmE7B6/
         jlBbBa6cOXDVQXIdxnTCESfPWtlY6q8Dx7YxrOjibfKs0c75x1kZpDCB4kg/DKTOvzk6
         SNzqQJTSqhi/F7AN+KOew745tePb9N6IncNMmDPRyL5Vjip9J8yOP2pQmij/GcXHhfcZ
         Q5+StmN4nMVJTjq5STTSmzvv6ssdgdp2GfBcrSM+CKos/8Os57rtB5qbOhZAIXJWwFl2
         kYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500337; x=1793105137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jgziv0oXH76L4ws+TONisnnpeya3jfmnUGQwTi5aL4=;
        b=QHioJfMD3VkAmpNVkq5c4IgZVKJY8wq4bPXz5qLnjx5EadBgLbrbaDsEtDYQ00+YUN
         hUJkC2NbQPSitmmU/gDbdqTslV1ZjR9xGOI575Ko07bB1djN404GWpTcrT3kdWh1N6rd
         2cykQrT9zT1cSWKJozeieMSAAS1HEokNVD/E+niNNReTbgOvbdFlWHfDGPynO2iiLWeG
         lRy8ugo67582lfk8aJQ7ZyZR8wWd1tdLQi3VqueMN0J2ctFguGz6DhdRASyRi8CzdH5g
         P/E55RbGN3lt1R1g30pUTix3UOnayg1TnY0HoKfDGu9eiPcCRhxGRfYJZy55f6mgyQib
         LExQ==
X-Gm-Message-State: AFq9FYKvUuHGdht4UH88fBRPADmvM9cmb9Lclj9ZQY1NOQPgW8jUOn9N
	olWDnmotKvrlssy5/IvBM9y9U7lZ65mWTnyN6+gluqXPfmYrFVaF1qJPDbe1Hi/ntW0=
X-Gm-Gg: AYBFou0wVt7BGDPC6gqTrH7BK1jrxiRP1x9pdnGSpNftafa0gklxhiY/sLe8j2RtH3Y
	Rf7o4XEMWSiqLmL/9FJAEaF+dRbG88KWO4u1Q371UIT/Hp3MVW1H9INXv/U7qdsek1guSzPotF0
	ov+/YJZq88A9FGNbiTrKqRDmOECeehN50NH4nccxCHXKVFwTaR4fOcTFJWNs5w2iOQRsN6Y6e1Q
	dr6lh7OOXvkwjMysMONGTHrbozGyBUzgREOAua7+F4tBAhbnvdyfhVKfLL/14mGC64izVXUkLd6
	0SI1yNfVodY5wIghATU67VcebUjjksDs+5quwT0O9yvg8H3HNha6U7NB7eWDo4DtA0QP/MOfVXj
	MCrXmhWHabYY7aC9QiUXnZkm99FQcYZ7S0BIUvjMl659T8c9YGxU/ygwzqLR3J4boMmqsdFZftN
	2UtnNI+F74eyk37EWmYad/4A/Qnd6Fsi/XJc5bpSbNZ00IZihabxoTFzY6UYsNcV8XEK4VxzQPH
	lb1JAvOrkaqXqJi4YFNS8dggykyY/9q+oZ1rR/cLOz/3KpXC0ZxUES0Wg==
X-Received: by 2002:a05:6214:3f89:b0:914:cdbf:b76 with SMTP id 6a1803df08f44-91bdf0a622cmr179577856d6.13.1792500337142;
        Tue, 20 Oct 2026 05:45:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0408c531sm25905716d6.19.2026.10.20.05.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:45:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJ9Dk-0000000CS5W-05Ws;
	Tue, 20 Oct 2026 09:45:36 -0300
Date: Tue, 20 Oct 2026 09:45:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <20261020124536.GM14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
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
In-Reply-To: <atcUoSdggT9eU8YE@e129823.arm.com>

On Tue, Oct 20, 2026 at 08:13:37AM +0100, Yeoreum Yun wrote:

> > Also this is weirdly structured, it should just be one driver under
> > drivers/attestation/ that does the measurement register part of firme,
> 
> JFYI, FIRME's platform attestation token doesn't have the measurement
> register. ploatform attestation token will include the firmware
> information (e.g. firmware hash) and verifier checks the firmware
> information. the meaurement with RIM/REM will be part of Realm token.
> FIRME's PAT is for host attestation and doesn't include Realm token.
> 
> Therefore, in the new UAPI, attestation only have the evidance
> interface and MR interface wouldn't be used by making mr_cap as NULL.

I'm aware, and this may change.

> > it shouldn't have two components and some weird firme_get_instance()
> > thing to link them together. That isn't how to build HW drivers in
> > Linux..
> > 
> > Since ARM has bundled different concepts together into one SMCC FID
> > range, it probably make sense for the smccc_devices to somehow spawn
> > multiple smccc_devices for the various internal software aspects
> > rather than have one driver spawn aux devices to split it ..
> 
> If FIRME were intended solely for attestation, I think your suggestion
> would make sense.

The FID are largely orthogonal, AFAICT there is no shared
infrastructure between the various functional blocks.

SO it needs to be split into proper narrow drives in the eventual
kernel implementation. token goes to attestation, link ide goes to
tsm, and so on.

> However, considering that FIRME may be extended to support other services,
> such as IKE key management, I think having FIRME-related code scattered
> across different subsystems would actually make things more complicated.

Nope, it is the right thing to do from a kernel perspective. We always
de-agregate these kinds of multi-function devices into proper
per-subsystem driver.s
 
> I initially considered introducing a dedicated FIRME bus as well,
> but I felt that would be overengineering.

Nope, just use the smccc bus and split up the 'multi-function FID'
there. It doesn't need to be over complicated.

Jason
