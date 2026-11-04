Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814887;
	b=kg1eBMJvgR+4PW9B9aAXsuPyPlQB31A2aIP/j/Xc0nHEi+sRpvFLxo3/mr9yt5JcQPkh
	 JXEF7PfjudnohRa0/5F/QVI4EuyVw0QQkt+9iP7WACp1cFgnLk90u1rpv8TK1R2waBYIK
	 3WSdONJecAdSZdWMrG0aCyQI1tygvM8og9j4lr6QN9rO/r9isPyTTZ0EDB0bqfzePcaJC
	 kHwuSM2gJjGO569mTBTsdwH47Z+39n5Jew9wIh0whmNqB6EaYHyyCc4Tl1c2/jkkYA8Al
	 fH8uvaqs910LIRQxUi58IuXydyqROl569HaplCmUF0+YRJ5mvu0Ru6kbmpDalao9o+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
	b=UPNRNefaT3mVHjd5jCbli8vpwPnRJb7sWW/wFIEZVD6P1BefQFLs5iL+aJ4x/hY0DnbP
	 AP7d5hqy4PhDACzv3CFcXpS5KCdAXA8TwFawW+1an/Bju0zUQzEpffE32g+hpm5NLtCqC
	 COoaCYmx1SB4vvicfUU7gwCBntYty6zGpWRNNv5AqK8WEcQmjB+AUIZ9qd/LdxOZjTtuQ
	 86eL5Pw3wcDPNZzWp0yCEiizhj8sf+cgOiwfXSUuFSExzx9LnBeE90mZrdPcM6uE8nuFz
	 SnZImLDckAQXSehkHtaWfKjdDVY5JVBibAam8dZqdEmhA8LffKs20zHfaTVZKwtjKDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=INpwrSmc;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138E606CFC4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6138E606CFC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=INpwrSmc
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f269e335eso111548585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793814886; x=1794419686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
        b=INpwrSmcSZ3/FfNbUp3Zcr+7zlKzli+O6Uz28XKAuaFHCd6G1aFXVW+Kr3yO5Ukz+j
         ffDXRlN6wtFTSSL1fI87DbOCN5vN+Dc416Nx6rDo4BG87l6cEysDdTsz9/v6agED2t+J
         az1Qc3jEPHGJciuqX8c8qHkclvi7nCxDnvEXRAWlfbwS4b/tczJBghfuvNFFt5Sen/Eu
         CngVW0iXdQ5aqtzO5S5pQGC/GojetaWvMaM/79HB0aZi9AGJnQGdsr25FTscWCuemx6V
         59aB6uINYARVi1TbzM33RDdQMxcq9J/VGqC7mlwisFA76vBco1Plqb7SMZBj/4wLB/55
         +vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814886; x=1794419686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8PVgr6ypDrmvyZQYT+mIAJLHr75TSjPc21F4dgd8gQ=;
        b=i6PT7mdSrS6ZaEorLoUiwf8HGR847RjmO5GTAIIfPA5qCqOpltd8hRbLyNVOdwzcaN
         IhkO1ygXz18vZYO1ubpvwAVcfZrSd4UZWTLdBjn+0/KlHr2y7JW2m9kcnyOPJMILOkvq
         pN0xSJ+wbBw6Gs+Z+IBfcG1Bm+sBfG1v3lh4l2X/AMNJVzRTyHB598gzrBmkiBl3Tywd
         qNvIKv7Uk8YbLtFV7UceVZ4TVtNO0BuGzq9ns2iS7KZDnweNnn/2GMYpKb6WDgs4zr0R
         uedgCftAsIzmjOXbBfXRX8kAKBz4umRJZyhGE2GSxo+sEENK1vqnM4uV56Efn5aEvU6N
         /irw==
X-Forwarded-Encrypted: i=1; AKwUvBxcA0CSB9iD52KX7Bm5itNjq38JENbPewM8hdhaF5DlWBCuw6ko1DdaO0gLM+qRJJ+SP3NlDd3QWXQ7/Ps=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9lres/ZIYKRLKe4kVXDJrXSVVP8KrOKlf45DSxippcK7sCSYF
	gPH7t8N1Di3Q/vKjown4ks9YGxb0bC8D+dJDHXbpVC8BkM/DMZs83hRnhpHQVBsjlnI=
X-Gm-Gg: AYBFou3VkJVlhkLSYxeU6I+P8y8Xh4Fbz+wwpE577YE6HBED5gbXvi8jzZYpv7Nm9nF
	FWVvMIR3tM66bm63TPgU3QImTkK8dfAsTgo9azuu7ch09wqet18Tog0Co9Hk7tLU11PURZwjjqG
	KE1f57lQc1OTuPiTxepp/PLZYH3JpiWg84q2QIlSinCvzUVEwhOdl5irSwuOSY85u6y+aU0IDoZ
	1oxalWTfUKJSVzmfiYVMXwCZT3GpEdezqVft8+NKc/JcWmJ6So+JTeDCapRtUbc/fMJ7AhtNfNr
	BgRGT21ogC4IHq3Bpc1o63z4GkjjYGwQO86q7gNK8r7VFwv8tedYq+M6kZd9Nv5PEcSjyF0feDZ
	KdVNRl3PFjX65WRHPZJ2qEB7bTFwO66oUw9lpxabxUV/IN3TM/V0jEhOjBuK30C1LnZpVbv+YKD
	bAPqk0Edsjm5fJXT21zNslz01MlBKC8gJ1fKP+2uztgxxjsuMfHPlV8IzCn85d0rJRZH0gcg0hk
	j1E3sBRYFpy5b1Lf6yyrWKRd4dqigEBmv0cS+kMrGsgd1Ve5D+0VOKnOHM65lTU1fjNCldFMDQZ
	vfZcLJXOOqG5sdrXcG2oBeBAa6ViDhvPrvWqQbNwtZnSxQRDn7Hnu161isyA/Avtn3SFakl1yVr
	cmn0Ryw7avQ==
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2702179085a.40.1793814886203;
        Wed, 04 Nov 2026 09:54:46 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479a7easm257041185a.12.2026.11.04.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:54:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOfC1-0000000H1Y6-00br;
	Wed, 04 Nov 2026 13:54:37 -0400
Date: Wed, 4 Nov 2026 13:54:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <20261104175436.GZ3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
 <auSxxPM5z8BzgNm3@FV6GYCPJ69>
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
In-Reply-To: <auSxxPM5z8BzgNm3@FV6GYCPJ69>

On Fri, Oct 30, 2026 at 04:05:13PM +0100, Jiri Pirko wrote:
> Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
> 
> [..]
> 
> >> +
> >> +/* attrs of group cap */
> >> +#define _CTLV_ATTESTATION_ATTR_CAP(_attr) \
> >> +	_CTLV_ATTESTATION_ATTR(CTLV_ATTESTATION_GROUP_CAP, _CTLV_ATTESTATION_ATTR_CAP_##_attr)
> >> +
> >> +enum _ctlv_attestation_attr_cap {
> >> +	_CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = 1,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MIN_CHALLENGE_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_CHALLENGE_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_TOTAL_OUTPUT_LENGTH,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MR_FLAGS,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_OBJECT,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_BLOB_CLASS,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_FORMAT,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_REPRESENTATION,
> >> +	_CTLV_ATTESTATION_ATTR_CAP_MAX_LENGTH,
> >> +};
> >> +
> >> +#define CTLV_ATTESTATION_ATTR_CAP_EVIDENCE _CTLV_ATTESTATION_ATTR_CAP(EVIDENCE)
> >
> >I feel like there are too many layers here for a code generator..
> >
> >enum ctvl_attestation_attributes {
> >   CTLV_ATTESTATION_ATTR_CAP_EVIDENCE = CTLV_ATTR(CTLV_FAMILY_ATTESTATION, 2, 1),
> >}
> >
> >Do the intermediate constants add anything?
> 
> True. I originally had it like you suggest, I changed to enums to avoid
> the explicit numbers. But you are right, does not add anything.
> Changed back.

I was also thinking that having the explicit numbers makes it more
robust if someone does backport. We should try to have everything
explicitly numbered in these generated files to prevent subtle errors
like that.

Jason
