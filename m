Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108295;
	b=DNtuClZZl+OldR51FYpFka0FeifVC6FGDPgx1ih5dj3evo0rLvtgQH+GnaowwJyZ4f05
	 /lv4EVRWdIYsL7hF/azW3wxwPfmSABr6hr9lMWgrVyHfO6pEHSciXq6DmCkGbxSZEDFg4
	 N8ry7tcGCFmXDv+0jQ/58CUHjaE9Cxrs8f8hARFJftmg+E9qV/3VM3M9uix42/DR4gFSa
	 r8rMaIeslpbaSu3ShJaE04LbBf90o6dFAzQyxiHXyBMvsWSpJATqHvBAzMeLunYfgIp88
	 XllghDNBW7DBlvV9E8I6bkeiQ5INECCYflfIOYV6jZBV8KqTSivCex1uErV8aQjYMaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
	b=iZMufRxIdP1N+tcXKmUZ1csTcK9r28t+Yw4Fnw4pl1Rk/9Vck9+nDSHXuEDJJ67tEcpp
	 8EkdMLbx1wFPa1OcENQkaZoGM3oCTB+swcs/kWleCSH+Pj3V88SKQ+9IJIKm/ys5D6/fj
	 7I8eIV+89BIJimsJpYNzOiom7eDLIVv67XFsOr1PYHhbKlbekbr3rFit7HgfIi8biAZOm
	 nFP6VAEPE13X7UK6RQY6KV0CLcXiy/RCaZm3CGiDBbG3Efxy0yp8Khm/khxUpKeeduZpa
	 8O4Ydu84KEbzKwm+Y30cSC3VK3oKtS5d/9gaqhyjVquk4QlHQJDCVpwAl3tpW51glBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22391606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22391606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c43373ae89aso632695466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793108292; x=1793713092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
        b=HOzpV+E0YifEMJUFpo0mhCWAcg58n+ExvoMQREREEgzF4MnpcqEWwp8hHHC1tSxLfN
         z3X8Ruqy1Co8/BXgOHUAisorIRYaNYOP0BIFmJ9FkxKXER/FT29XCq/joiXcw1RrrZnD
         WPIfgfExZU1GuArzgbJx1i6zm4Wklz80ifrn5BCu9c0/0BvapHXhOUM6INm7cVcMfxyY
         gGBwyiQLFZBkXK6EM/miMfhP+hz9jUVjz4UUJsk87acHKsWT8HyWojfL3Sd0WEWzl7tG
         hGF/p8MDxJHcPmLDSVizAgqQGx5/u6SHLZ1cR91s832oZbGbyJaZXRE+Ajp9Dtuyv20b
         eIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108292; x=1793713092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwMd1KchjZwzPRTvPjggUQTB5i2EuHCeAYUv5XXUio8=;
        b=Cu6M16zcT35TN5B8bqtfVy0azVpCA4xAgzmP0Wd3h0iyjt7ad949+quSxRD7Z54RPv
         DNoxQmoe2Dk2W8rLZWYezyVW54cOx+CPxfuQGi0BOOFzSpeqEV0Y6Nuvm6XU35RZBG7w
         TTOm8IAa4iIAqilVLE4b6YAUISt8pkQcuHY+MClbe/bGWkK7IfyHQigmWqpH+zxsG2Oc
         /auemHJG1hf35W9w3jBVr3VnX/dKfVCkz1t/5VsOUQ+LqV4ltbHBf/Q4g4lULssvBpZQ
         1XA0Z0B7FOFQfW3739w6YYhJq+sKWevT25ZXfjtKu/ILxI+DwE6qfNg/RSE8OxdwLJi8
         pLlA==
X-Forwarded-Encrypted: i=1; AKwUvBwXYIrjw8JPTHH6kdVQRHz9asI5tFiwUv5a+0aRRDQGg8utRI1uHeL7+sWVDiqBvXKRauRn2/4d2pUspUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCIIzJyKFRCWSY7PLeLPr6vuuU21azhcCOwXDSTz4fxNRWm/dy
	wIdIVuS1ATaURBcarvwTSrpchyRW0OyyPo2USW3maXMeT3GQCELRdIxYhA6brAdZs9s=
X-Gm-Gg: AYBFou3khbyadLfITLsKKOZh3cdiHeeXzY1Yndg9kvk3A1kQWUXO9xEVqFYlZ9FhFbN
	V1zs6DgnSOQOhyYe5AwDqScO6PpZJ5OGociAp9DaIbreQzSjQuz1+Dbp6e6UavbAxvqPmrYjUSu
	ZAi9puAKBh6FVWsdWH2VTTb2cmofeux3kxveNRqOy+7tqrLCzam87Xgst1s9AhoPxEqRnsJYdJQ
	upNf+5+OONBapgc/FOzHGxMcu1pNof/gBHWVEgR+Qc6YqGZ0xo2JMOer4GW99tg3GKS/tuu6DIY
	Bl7lHiMUMR022/RT5gwyMALsDGmGC3DuFX2K7rRjUQdxL0ZZqe/N5hjWLZCNAZIAJiPD4AhHhPZ
	EG9Zm4YUk6mfKC8hOqj25nvBy8pL1JnTLTUvPensrmj8roY35MSxglqOzZfuu5zMm+Ru0eOhmM/
	q/7Jcfxw3qNz9KbCdqG9u/bpwBLZKsp92Pu0mPFX6Ir7hOXDdOktexk7Wu6sBFidPkDSsw4idxU
	MMmwa2+w27e23xdY1WqCp4EfNZhowwD040L+tUoWt9LaCH3rau/vgGvmL9Bz7jpSqGItjjy6wko
	es2zqPDkKfVgr2GO55uFPOjHPg252YpY2xTvcQ==
X-Received: by 2002:a17:906:c14f:b0:c2e:8eb7:53e8 with SMTP id a640c23a62f3a-c46bde6b23cmr1029897066b.30.1793108292179;
        Tue, 27 Oct 2026 06:38:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd524271sm468626366b.35.2026.10.27.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:38:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:38:07 +0100
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
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <auCo3jRQ7p6JjIPF@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <179302367452.58760.16195458599265885835.b4-review@b4>
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
In-Reply-To: <179302367452.58760.16195458599265885835.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 125 lines skipped ... ]
>> +struct ctlv_priv_container {
>> +	struct ctlv_priv_container *parent;
>> +	struct ctlv_priv_container *child;
>> +	u8 priv[] __aligned(CTLV_PRIV_ALIGN);
>> +};
>
>This scheme with priv is very clever, but..
>
>The usage in the tdx driver ends up having both the 
>ctlv_priv_parent() and ctlv_priv_child() calls, but there isn't any
>type safety and it just seems worse off than using the normal
>container_of approach.
>
>I think it is a nice thing to have for someday if we get to a place
>that needs more than two things, but for attestation subsystem I think
>it would be clearer to have the normal container_of relationship and
>some reliable way to get the 'struct attestation'

Yeah, will do.


>
>At the very least the parent/priv functions should take in the family
>ID they are trying to seek too, for an assertin, and many cases are
>probably better off with just a simple:
>   ctlv_priv_get(ctx, family);
>That is slower but always gives the right thing..
>
>-- 
>Jason
