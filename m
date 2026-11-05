Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886756;
	b=Uzj2vEYNDVbGPXmaqYD7wUz1kVy4w+cyM1pZN33LF3V7mR4X+FUyQz78mjz0W52Vrgh6
	 RVync6zkLMTq/U3WSO5TX0JbutWDmo2SGL+Yc4v4jY3LnFEcsBpQRBmAC8hZ0Ae/nZaML
	 5j3VMFsSv41CVHAc7mbmxZcIAwkP7qRvnCYvI2IB4RYOYE9CNt/AofPwUpgbBTHNU4c/d
	 tMmUAcoc4y1pjxJvirXATmxJgfFHe8G1jtXGbynvcp+CvigXnQkvb+I+/LII7PBM1CfeI
	 UjS2gvTrkw4teVgPRzFpkyAkhHoyJMLf/3fev+k3ktzvrkyVkNIx6KtxnvViOLf8aQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
	b=SJEf787D5is3T6E+434dK7jHQjopALV+DwYtR3HzCKaA8wIBbAI817yeNBJWsZDYWadd
	 mClDrcYJb+Mesge4XJdRCkh7t1xYsRtGyMlctjOJVHHOrMRrk0+SfOj8hx31xmZVzkYUc
	 dxYnTCEwS6H2XtKoHR5lng7YpZkAyPz9mhb3f+LBko5XZFecueZWKnAUTBsLUmVwv+smW
	 FuRUYX1zkn3y8VthFfbyHIHaLO41NO2TmfPGmMGCP86sBVFd3y+gixUQSbNafb6G/if0O
	 kILMbFZZPnlZTaOuux+pWqwa4HbBy8ttUmc7JXRYl13n4xuNVyrjl0YHJRtaE0HdPYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A014606D80A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A014606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13702075e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793886753; x=1794491553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
        b=c34gCj/8CF0gjZPD4S6DE7fp5Zl7gSX0P0hMJk9lFt1y+nBZYrLUQMyOe9yskOljO0
         mWq7a3nzqXz8tp3I6ubwhzBAOsJYhD2zSynoQZHrZRopkQjPUFsi2whqLUzl+ldansUM
         MIoZ/uxtCEAMb9QDpVquB9CLXS7hpypOQBKzqBwygEabCHs8+Q8vFHnySRybX3XMNR5x
         /bmNPcFbYLThOu3b+Gb9jeXLHMvKt3ZgoiXr0DY8zyFrDCAKVO/1n77AROFDNyHGSlRT
         4sQdtVSWMSH4Fk6Bh6Fa2qjPcR18tiYc8STHLzktuM/SW/ODCEM5gMYc36N9pRaZ8t/X
         7c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886753; x=1794491553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwmQA1a2QhYSOPcBSTBe/t1Xyv+zC9XEOaQnTg/X7XI=;
        b=gSVS8Ry9Lr5LWTXWksTo6KVTGoTrrQFonOaCkoj9Q7KjcsSwsCcLg34xsdGu7VbQub
         gZMumGL2oY42qKTchj/p8c+GyXOORkVclNnnRiv19eZVZ/MN9ognFgYVGlrKFxFy0dfD
         Az2dqMI99fA57JhvqeYnbGqLTgJrMWiNJXs4fPpqgR9+5/N9zwYs/rpmHy2V9xXVGQIj
         apKtzCuoRhvqyRE0x9o1h/YZpttgfMqWPWRPew/jumF90jifNV4HDT35L14oi2a74On/
         eZqh44seEyf8/Ufp4Gy1JeuPKYaeuUD19u0hFXIfKxthJyi/xA6oH1h5xjx3Jx23gPbb
         RHaA==
X-Forwarded-Encrypted: i=1; AKwUvBxzWAdZeWnpkfodvLZbVjDStV5kHhOjGaiw55+tHemXLsTzTPOFs7dVYfB7couVdr79gS/wkJd41tfC0G8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6/ZjBrhl7kBF4PuNHcX8YpdtxSROlYYwiOc4lL/Mqt7wRqd6Q
	/rbYB1GU1Xprn2RNvBoRiXxWs3lalN3YEpotqaGFsPk/mPxkZhG4mCsJwgZ+gYOtrc8=
X-Gm-Gg: AYBFou2qwd7dpK6iafDLKKFpjwi1nrbPulQni32WGD64x2uMOlkBck3B3Lxhldpz/6O
	RnUB9Rvsjz66J97Rr4UohwEZ++W4ossfqtsLZaMwu16elVoc6mRhm6PbXVWB8F9FcVS0q7D/Pbq
	xK5CveJysDtZV3qX3TVx6iDn+GC1PW5bvOiRvmKDhzJl4oEBnIoKGMlEB1eq6PE1ZdhWoLb/MSE
	g+YooCbbiDFKVaEJfb/S60E5dMsVRLImEPgpFsqNaPHJn8YbWl58RV9LF4HZ0W59zlHQyl+0lL8
	Lzy1Mybk+xQW+QfsqlOQfGWZzf3L81wxhBLeoVWFg975EUWSqJPbv/hGRRIZZO2kes2/CMisjx+
	R+Qm6JXysAbyVKob2sGiAOWUPQW1KIvzBiV4vo/ezCB/ryokXdpNJ4MSH/LA2ofnpFXy80my7rT
	z+rdz2Tf0hvml7pLm674CZ6ASzKBK1kb0mTT9okBxYchk9GbUcmRxJgckgJyfNGq01WJ4KpPouM
	yhQn47+M3nXWfFIOWzCKbbTN9d8YlkECHlDAVhTa2JVlmwA/aJo/z6b5l5zmKFIQH1W6RCdUidA
	yz2eB+dMmGsDSkDtVq2Frgod4albp928kaTNoQw=
X-Received: by 2002:a05:600c:83c5:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ac17191074mr383781755e9.5.1793886753121;
        Thu, 05 Nov 2026 05:52:33 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm127121635e9.0.2026.11.05.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:52:32 -0800 (PST)
Date: Thu, 5 Nov 2026 14:52:28 +0100
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
Message-ID: <auyG1AnzpjLdOtpR@FV6GYCPJ69>
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

>mr-get:
>  request:
>    id: uint
>  reply:
>    name: string
>    supported-hash-algorithms[]: uint
>
>No definition what these numbers are. They should be TCG2 defined hash
>algorithm constants I guess. Why not have an enum here for them?
>
>    caps: mr-caps
>    register-index?: uint
>
>So we get a string and a small integer for every MR? Like PCR10 and 10
>for TPM?
>
>=======
>
>mr-dump:
>  request: {}
>  reply:
>    items[]:
>      id: uint
>      name: string
>      supported-hash-algorithms[]: uint
>      caps: mr-caps
>      register-index?: uint
>
>
>This returns all of the MRs at once?
>
>=======
>
>mr-read:
>  request:
>    id: uint
>  reply:
>    generation: uint
>    values[]:
>      hash-algo: uint
>      data: binary
>
>Get, dump and read? I don't get it

This is another netlink-influenced terminology. "get" fetches one object
info, "dump" fetches all objects info. "read" reads a single MR.

I'll remove get and just have dump accepting id as a "filter".

