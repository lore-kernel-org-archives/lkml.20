Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096476;
	b=cBo0ByhDRwTPiR8gTlkDbXtwOIpKBfO6T6BSjGyVIiuHtte/iTUF3l/MCeSRQH2zFhVU
	 r7ZPjLYhLnkTt/03BYI/yMXS8YXLtWKRNvYxXzR3V5WJaJkPBXB+5yG5OyslAJhjqvmvV
	 WoHi7vPnI7Ruix5H+OJCdxc/U7X5PNDP2lQ7wRUsUB6/Pks8Eltn2HippApVPbWT07IJ0
	 q2EOhYs0n2yixCHaE0emR60X/MO15E0OAcIyl1DE3WYzcOoBqpftdoDV59D0HTtK57Vl4
	 eft2oq5/Jjrx3mp2sBvEmOT6SRz4pgskdZa+KofyQaWW8FLKlgPnB5NxEwb7j5iiTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
	b=hrdBEx8amXeNN0XhaDVEBD4YDJUVT/cyuP2I0pIF+0AblG2tWNvvSH60Y/Wwmxm7HC3E
	 /Bx97aShRC9IgVmI3kJQbWQvA0JlMWBQTTHtk4WVpM88tjBkdw5MxBdNfNtGBT0i03qfQ
	 CuUrmbWl4TuJiLqhmefI2trhHM5bPO8MHva+xPEYiVqKcPAtHZb2g2VGgex8oq7P+Uft5
	 90C64jy1TmZIFZPmpZgM2OP716MdpbwcJBYLGgdvn8L/g6ObdAxAWGc/XDqm/RcKDRahA
	 PAo+3xrBwyRRsWeQleB687HeqEdND3jpcuXT86S68QxON0g4G7QaPNQznFTl7YqeD+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=U+w+DA7T;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAB606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FAB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=U+w+DA7T
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso2796826e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793096469; x=1793701269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
        b=U+w+DA7TBbOTsHJ6Enxe39JVFHvrncv5jY+jSoyIQ2z35qjZXvHp3LNnblKOrPL29A
         y7RE8O/DkYqgtM6po8VciEwy++8yrr0fF30EYhF2VKGclIBsioakCbCgAaR3HRFnnwZB
         fNYBW+FeTixill9nrDRoI+IpNCTqA55IxLFeHUBlMQlaa8qrSxKDiIACxU0UkJDj8UMh
         lR0on/o9rFsPmneK/FCtabwWiYP65MsxMx5JUTisdHYPgy2j9M05xRVHhql1vdZyRtw4
         WoBKFMRyWdL7bNEs8rMdYK3MSTXgnm/TWIMlL9+E1AX8il/kxYBgNEFH0Q32f/iPJK2Q
         TN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096469; x=1793701269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UcwPjZxaDPQUX38SRpQk0U6z694ngHdtvb+qpNBNolI=;
        b=kSPeQCCb1no1/CnXz5YO5+WD4LphVGhSoWuw3w2196TQUnDFmhbtqQjM01iE2ObNF3
         tpyosuGjN10vg1qnHmQNhdqw695osom2i8QYcpIqNCvVGt+hGrCiL/PBxTSPJ27N6eGc
         EIvUDUzh+JTebHvx5i85G8u3s/b5VAQKASy5/ha/46bPcyUn1Kzk5asxq5evmzmANkPa
         SNZ6Q93ZbcWmz5SUhvL/zClWFW8AmAmb+3OeLuCnOW7CYy27GmlhX07EFs0ajNE6IHQ4
         TS5ScRsHebRx+/s03tT8nnZTrSZetE1BPe8bOXrvXPBwbyi7mIoj12o4x7qIGa4FsoRp
         24Dw==
X-Forwarded-Encrypted: i=1; AKwUvBx0Mc6PwQxtvOe/Z9BhQf5gf1tyGh49IP1eUzMVNUS8GBx+AYZz3jCJ1JC2uu6l1bbYzf6z4QeiK5QC8s8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL0r3jsaXqfYD6++T/cs0M+wkZTsQeSI2lF83b9qE8OKcsCee/
	UZmZ4VvMZWxRssXKC0NbKw3NUmQ8LrBB187y6uFbXzG1cgYrZ00mY0jqYOgkBi5qdvs=
X-Gm-Gg: AYBFou2/vpi4bp/budRIgaCdTvdgpr1czXlz9REUOjFdN5XdL5AumamH+iN0+TJP+6L
	wmDgErsaUATTSjB9qfRG0uUfmegNFLdn2u2MhdPLFAq/g1g8SL/iH4RgxzuFXkY+YIQF51l48Az
	/Qwkl+b1E8/IlvboRNCLQveK3/3pCYuTvZam55ECopERNVmqb5qPS8/0suwdDPmCCmL8u2g4kPt
	zrs5Xxt7pzB+TB5PE08a6XG2hUCo6r46Gtg5ZwW0pTaWov8AOHPMvQHLFaECWeINuaJzqTkODXq
	lNyjEInMt3DnR9BtpVTKfbbHXiM9tbjtv5DfM4ZQFote8MDyKIOIwWagNwv3CP2t1t9tPuGHNO3
	1Ya1zEeJ8+M2nuaQhg2f7GWlFI238eruoUtoor0KPNO4VW2ioM/WYaIPFcokcIO+zviG4gcen9s
	ZClx5GubYFOqmXl02/yCeQVywFsRsZsInB1rtEFAMI4/shqp8ENgeHkKNfLo0FJEwTvQE8YEGcl
	WDo6jhQVdiQ9ym3eHcgcDj+am/xViucP6ayXrxuWCZaVEB3WE2crUEOpdxftxos
X-Received: by 2002:a05:6512:2211:b0:5be:4d37:3bc0 with SMTP id 2adb3069b0e04-5bfb71fe90cmr3245577e87.62.1793096468475;
        Tue, 27 Oct 2026 03:21:08 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6aca4sm2051901e87.15.2026.10.27.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:21:07 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:21:02 +0100
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
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auB61re2C6eN3BmW@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
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
In-Reply-To: <179302367452.58760.11808905856343064399.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 53 lines skipped ... ]
>> +/* A cursor packs the record and member where fragmentation resumes. */
>> +#define CTLV_INTROSPECTION_MEMBER_SHIFT 48
>> +#define CTLV_INTROSPECTION_RECORD_MASK GENMASK_ULL(CTLV_INTROSPECTION_MEMBER_SHIFT - 1, 0)
>
>Use genmask for everything:
>
> #define CTLV_INTROSPECTION_MEMBER_MASK GENMASK_U64(63, 48)
> #define CTLV_INTROSPECTION_RECORD_MASK GENMASK_U64(47, 0)
>
>	pos->record = FIELD_GET(CTLV_INTROSPECTION_RECORD_MASK, cursor);
>	pos->member = FIELD_GET(CTLV_INTROSPECTION_MEMBER_MASK, cursor);
>
>	return FIELD_PREP(CTLV_INTROSPECTION_RECORD_MASK, pos->record) |
>	       FIELD_PREP(CTLV_INTROSPECTION_MEMBER_MASK, pos->member);
>

Okay.


>> +
>> +struct ctlv_introspection_dump_position {
>> +	u64 record;
>> +	u32 member;
>
>Maybe a comment describing how record and member are encoded for each
>of the users?

Okay.


>
>> [ ... 13 lines skipped ... ]
>> +/* The immutable root-first chain always has generation zero. */
>
>This comment seems out of place, it should be closer to the 0's it
>refers to a function below

Okay.


>
>> +static bool ctlv_introspection_family_record(struct ctlv_cursor *reply, struct ctlv_cursor *entry,
>> +					     const struct ctlv_family *family,
>> +					     struct ctlv_introspection_dump_position *pos)
>> +{
>> +	const struct ctlv_family_schema *schema = family->schema;
>> +
>> +	if (!ctlv_family_entry_start(reply, entry))
>> +		return false;
>

[..]
