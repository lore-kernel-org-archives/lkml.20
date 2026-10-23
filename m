Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760497;
	b=SoeHns3s4zL0i9/OzqSIZi1RkAvRrUbvUKalYX4lREBWZCzoJqJgGX0i97thzKSING8f
	 fdBeKTeeM2Sjr5hvzi5nJe+22r49ZQxISKzyMueCPhjjptRbxR1pbgFulnXvuPGqemmR/
	 vay29j2XJodfPNSpudIDCkOXCzq6hRLetU+YDSRJpEmmnSBut3uAib64O07ax8udbqDt5
	 lKA1OMKDlLXSCmu7LCvi56za7ydvrQghP/tHTvZcF/qD5Zxft6/GzzWpLV7q/MzYHxJ+1
	 APN6TJYTzkyPzXB18GLz4QRq0UtMfhgFrdptnhSvPjGA0v7FlGvbUmUnS+PKRWwhqBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1f6kYcZtrUYkUfjtStdqQg00V0eNduZavh/6mKW3Q/4=;
	b=PO1Uegme6iIFAE3l/EmXjgwY4ziMKBrhouNMZWEJNdsbxijLKSP3t1XThh2Ym+k19T1I
	 F5MflRigzaC2ASLcRI3Q3w66mR2CjPGCnafPDCEJzBWPCEHqbN9tasvF4uD3XaxmqrC4o
	 UR5CCKeyjJmWxf3FfWKQl22qL8Qa//DJEG4CjvuCLYE5T8TTFnjEoeAmdhjY/RhU8b17X
	 mXHesePIJWZTD95DdPp4UT7nX+6hSJkpmknGblQpERv7pGS4avRcm2ygKBPEDJCku0zn7
	 njg4PZXzA5J1X+i/CjN1zceusdgKstfT5/nzr7gd2b0531Q8nnsGddQLgtyxnLqYmDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=dA+0fYF5;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983E606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A983E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=dA+0fYF5
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so505750f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792760495; x=1793365295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1f6kYcZtrUYkUfjtStdqQg00V0eNduZavh/6mKW3Q/4=;
        b=dA+0fYF5NJO5vxhD6WsfE3GuOrunJPEPXuH20p/OWeGyCAQgyez/yng8gcWtHHKDRW
         aNNEpTkgJ/DjomFukcZkpeb6Q7E/kWVRL9G1dBUB0P9OUUvF+ziO60N0H3rvhfPEkMkS
         8IPds4ztnx4D+xQpBrTJ0QwMrWzos9Yj4MBRMbVDPujBjU79BQGF9Oxb7qG76rknzGE4
         a5iwk9PZe8SqreUHjx76aszDfzAo9TOoODm74vaYhGYt/lMjoiSK1vLwpZFU3R4Zw7F0
         7HoIGhXLOxKs0+6hz0CBwmLnam0DcpMdiubzbHtmfRhLHWC4gJvsvSCGUFlitbgTI2Kv
         /hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760495; x=1793365295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1f6kYcZtrUYkUfjtStdqQg00V0eNduZavh/6mKW3Q/4=;
        b=goIOQm2nxqfKLjdqbGkXo7IGdKYed10kbqCrz4DPioe4jImrgE0aCX5SUxh5eDQYK8
         Ex2N5FHC9y3kkmeR4f6ySm/55KS1IZROQNrsjpwycgYVw2ri4sZXu//4k1m0MKey2D2E
         5Z+wC6OnR5M4A7lELACx9SKfv3r59Yz/MQEqEJiPVirt4oPMgc/pwJAzxWPJdcplQFv8
         MHJso50Ugz5c3h5P/e0EBhMG201Rg+Pp61qhvyzdBe4i2QNE20KbMnCMrI1US0YbeQuB
         bwbnszEDhZHwsMSNI7BRgFUfnsBYH5Jzd4Ka6vCIFBA17D1Pspoqhf25M9ymTsKSJ34l
         929A==
X-Forwarded-Encrypted: i=1; AKwUvBwG9Jh7Fwj0xuqFpE4qRtET874KmD0TPJSaANEvAJG7P45NIIS14wMo5bMH1VdnFp1WakMEo39wmh/goxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJviztKrhfOjgFhpNfZxLn/O+JnaXCWTQi6KR8NnCKMDcq4kAai
	yV8MZRMb6LQBTFtm3EhbxYlj+wkwsIZUM4lndh+aVuxmiwB21ESBVDln60o9dC2HiBs=
X-Gm-Gg: AYBFou1PHGBZYow+AUxDvXuyqDizsyKShDp2WM2qQsA6c7mlJjJAbfKaFB22pzLhlTB
	5uwhgOaejJ5e0TyrMGZvklVlKX+6OoFOX4M0EmPtybvBVaV+wo1MvnTNtUKb/DeE+sPLnxjd0Zj
	sTApyDYVZLFoEM+cc6ZEaHhwMXKngCGIR7sDfFMy++vpn2U1oei80Pxgixb+c+WoHVxJqBHjW0S
	SBCCrw1x0J3DuZqsGnCNvJPUkW3/R9h1YJG9c3gSQT2CVPKnWuB8l/87BF1M9aRUfUPvoCVnHlh
	PfMKd0OX//Rr5UK9nXhxV2Xc5VRs4M46EMa394/Wbl2u6jE+RAQVfmiLoWK0ZOCPDIE3HUcmYHh
	znTxQ3bOQdoEKm6LPWtoQmtVfdw0iqsSbvavF4s6FqMQ0lXv/4vjf8qfyodma7xonZ48sH5kQ+A
	AF4Ux4mIve5+jcbnDcaw+5Q+ebWMLSFaFy40tGR0EMjTsJ51a0ZkIa7DIByxBO24ntFqawWsyak
	TH2Xzv6UWvnEYpIhwWtYJET2Q9CFnAVfgoab1FACUBo2ztpeRCJQJ9a09cGnZxLMks=
X-Received: by 2002:a05:600c:19ca:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a211c8fa81mr35809955e9.8.1792760494721;
        Fri, 23 Oct 2026 06:01:34 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cdb75cfsm3940865e9.9.2026.10.23.06.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:01:34 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:01:30 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 13/20] Documentation: ctlv: Describe how to write a
 family
Message-ID: <attaLkZFIGSKLmgZ@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-14-jiri@resnulli.us>
 <179245258505.58760.3972297562218204862.b4-review@b4>
 <atjEgLYpgbZNzfkZ@FV6GYCPJ69>
 <20261021144951.GR3008132@nvidia.com>
 <atjiW8bnqDZ8zb5t@FV6GYCPJ69>
 <20261021164857.GT3008132@nvidia.com>
 <atnGniIHxIV-vzVC@FV6GYCPJ69>
 <20261022192118.GC3746973@nvidia.com>
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
In-Reply-To: <20261022192118.GC3746973@nvidia.com>

Thu, Oct 22, 2026 at 09:21:18PM +0200, jgg@nvidia.com wrote:
>On Thu, Oct 22, 2026 at 10:22:55AM +0200, Jiri Pirko wrote:
>
>> >But it does work well here, and matches what rdma and fwctl did as
>> >well. So maybe iommufd is weird.
>> 
>> Well, one CTLV chardev is always backed by one device. I think this 1:1
>> mapping is clear in the device model. Iommufd indeed looks weird in this
>> matter.
>
>iommufd doesn't do 1:1 with a device..
>
>It is more like netlink where it talks to all the devices in the
>system concurrently.
>
>> >> Depends on the user/subsystem. Either families_dump op could be used of
>> >> udev uvevents that also carry family inheritance chain:
>> >>     CTLV_FAMILY=ctlv-attestation-tdx
>> >>     CTLV_COMPATIBLE_0=ctlv
>> >>     CTLV_COMPATIBLE_1=ctlv-attestation
>> >>     CTLV_COMPATIBLE_2=ctlv-attestation-tdx
>> >>     CTLV_COMPATIBLE_N=3
>> >
>> >I wouldn't try to link it to udev either, by the time some userspace
>> >uses the cdev the udev information is gone, and may be unreachable
>> >from inside a container or similar..
>> 
>> This just gives possibility for udev to work properly. Depends on
>> the user/usecase if it's going to be used or not. Not sure what you mean
>> by "udev information is gone". Udev might use these uevent info to do
>> aliases, similar to dev/disk/by-*
>
>I don't know if you can encode N compatible strings into a file name.

Yeah, the udev rule would have to have some logic on top of them, sure.


>
>And in a container or something you can't get the uevent, so no client
>software could rely on this information.

Okay.


>
>Jason
