Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780564;
	b=AsqTpGfdjn3Ycm3DmvvQ8lofc1D5COBTtQazWrKrve9JvRAKfIhQMA4dy8PW09L5nxzO
	 PgkpXsTmgSLY1bRC6hhFkEzIXAI5S+q1z8nvQJRQDr6iPNmRoHSRxoYYsUdItOlJWc8WZ
	 fyQ2JcPPwlzSq9HDw6e8Cd0T6TBX4DaQfHmn2A+jqfdbaHGI7TSN4l8la4WYwVDJxJZQI
	 +1w2CbKtUYx68nk14BSanxb+mHh0t9xmNY+jhyY9lV59WY8xV8XqGHK8WRNFh/OGHlpvb
	 XluUtg5NsJ7Ed59nEQkbgGJkDjXCOaNFIF5W2FtOujz0h2ZJtxnB8SIFqDq5uOlbgBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
	b=tb0WAoJCm1+lRpuC/0fGIoPCLQtZIGxSYJnn/bPLitZQijO32s0ltROymHHH0CEwrg9i
	 1Y2KkOV3Hwr+TDNRePmPZLLyju/Dg3cdAyRB1tQ+4ZE6ppCft5U68WDdRT6TiHhrIf7HI
	 rzPkOsXUIWR/Q5wvh7zjAf5NVfmEOPhHgaobp/Pyskinc8+tM0XYh5ik9sbtj7KK258EU
	 Q21U9qwxR+OLxb7oE5fL5a+5qkzTZVWafmZFbmwDhzImteWPLv4El2fTE/fNmtHb3UmLY
	 aS6nE8YKXVSQ/uSLNWdPi+a+FrYIxcACOLZ0JhCQBLy5c05PhCGbsSMogPNCDdMaESg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF1606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41BF1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso2333825e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793780552; x=1794385352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
        b=stGCcKR2XDWs2JXEfhtZr7iLAW8lUux9SMxROW6OOCRA1mWbx8OrRo4JMyxUU+27jW
         8c13+kyddkij1BwcIWUx304IGIDbLM01Ibc2QYWx3RFhyX7gUV0iwPgp0xCFVDf1vyxS
         PETlqgBra90W+V/xUeB/QKZV9smQJ+N83Bar1G3ihYu5ExGkVz/eUj3qiP1q/iXdAaWO
         iP95iXIz3iUqNRhfpusCP2d0spZdrly4qJazkBVuuot+aWl5mVhhuL+oA45dVpKNrgNX
         ae4LyDG/ScCBOiSm9zbGcSHLDVtAEZ/lplpYpBpok5SQLo4JKTsqx5vxTu/N2nZBy+Hq
         IERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780552; x=1794385352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zx8jHzDvw8va/CX+J+ppLsFj9mBNb+GyOOHFkDmbSlI=;
        b=GxCjtcPJn5R6L96vfhjnyOGlw0x1Yb6wZuuED78yjf5q0qAdpimXypdRsjZvMXFjex
         nxa6PAojzfms0JpdgGvUnqrEKCihuqCWsf+GAzUuZGWziXS/QeErSoTTgkRIZ+LX6PPP
         NLgK0GZ+QPT2F7I1NZW5C9fRE2WZG6fbAeXfXjjnpYaUDT8Ks9/RlQFdOySXt8at1uJW
         q7xzK5EdOtJid7ch2pnL6FgD0l1phpeMSA4cRkUdxvfwa84JxU60gRAkr5NJkpgohqO7
         qQFJQHfl0lkpRJ67A0CrjDUtwczH3/9rn6PYDDMcpqSs2t9872q4vhqqagibueJw+PNM
         0sHw==
X-Forwarded-Encrypted: i=1; AKwUvBxdAQCDQP7Qpj9sY61f33BqI27eidaowxQRyX5y5scEtkapMLzw1Mrp+ERcFnXOjg9l7Sxt5YUu8kAHzq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CvIrU3Y20VfttgS6/gb66IKINdJqczzpW4l/ppPZzeghdQEWP
	PXOAZ8sjjbcsHXoz4misS72pLuzT4D6Lh0PKpkP3QeExQKJrhE/OH1d4HdgzkoI+itA=
X-Gm-Gg: AYBFou1JqC6xU5lrx2v2QLxMntSV0cdRE5IMf8pHuitsz6Yz6M8BfTwHqWUiDElt88t
	Eg2art2IOMewb0ACSz678pqogFqwTNuSTU+EWJw3sHGYALuXU/38msY3yOxIOPSFSqsWeR04Zmx
	UO0Q3EGdo6D4VWVopKaIozw04/1668scytAoR5GHxnFRXCisdSkQCFSNAwA0OfrL/9DjP8aYZSP
	83ieeKAxcJShEdHOK0gw4c+ZsSvZpoFOMq6P5KnZ3Wegi3mRbT+t0P7nveupUcRI4lsGleynJ6e
	MJyncrakRptlJpVL9LdLTlRu9bfSNjWLyzKKoJ9kSrBPXrFw9IUHfR4f/qclFfzs61ajENwt/HZ
	5S8ICEDwNmaUiSQ3QrLECXXEXYrvHvFwOyv5L0f9yw2DHk/3sRQtBJSNjvQZBCKpTUMptnAkypu
	vOmMYbE7y5U/VC5+PjTm0cGwaAWw/5oomyV23rmrVnFWxTzLZU9keYiJufXxVRD1JiERa8/woM6
	WVKp60ZozHS9+etn9onmy1BGlGEskbo7xIaE6LuD8Z16N0dYW+vc1/rjYXvKQ9Ol1g7JbnAEiiy
	WhAlN+sBMTyl5uUgzP47XlCE+6omW4pLa725
X-Received: by 2002:a05:600c:3554:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4ac18c7461emr379283885e9.35.1793780552290;
        Wed, 04 Nov 2026 00:22:32 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm2366556f8f.21.2026.11.04.00.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:22:31 -0800 (PST)
Date: Wed, 4 Nov 2026 09:22:26 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 15/20] attestation: Prepare provider and instance core
Message-ID: <aurpges1eUwSJUBE@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-16-jiri@resnulli.us>
 <auOVbGYJjIQTN53z@MjU3Nj>
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
In-Reply-To: <auOVbGYJjIQTN53z@MjU3Nj>

Thu, Oct 29, 2026 at 07:50:20PM +0100, sergii.dmytruk@3mdeb.com wrote:
>On Thu, Oct 15, 2026 at 04:50:48PM +0200, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>

[..]

>> +/**
>> + * struct attestation_mr_props - Immutable MR properties.
>> + * @id: provider-unique MR ID
>> + * @name: MR name
>> + * @algorithms: ordered hash algorithms
>
>Why do these need to be sorted?  Is it just to make indexing easier?

They don't. Will lift this limitation.


>
>I see that the number of algorithms is also checked on extending.  Does
>it mean that a situation when not all PCR banks are extended at the same
>time is considered an invalid one?  That may be a problem at least for
>DRTM which may extend only one bank even if several are active.

Great catch, I missed this usecase. Will allow extension of subset
of banks.


>
>> + * @algorithms_count: number of algorithms
>> + * @has_register_index: whether @register_index is valid
>> + * @register_index: native register index
>> + * @readable: MR can be read
>> + * @extendable: MR can be extended
>
>At least with TPMs, whether a PCR can be extended depends on locality,
>so this isn't necessarily a static property.  Is this flag expected to
>always be accurate or it would be OK for a provider to declare an
>extendable MR but then deny doing it?

Okay to declare it and return some appropriate error, like -EPERM. Will
document it.


>
>> + */
>> +struct attestation_mr_props {
>> +	unsigned int id;
>> +	const char *name;
>> +	const enum hash_algo *algorithms;
>> +	size_t algorithms_count;
>> +	bool has_register_index;
>> +	unsigned int register_index;
>> +	bool readable;
>> +	bool extendable;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_supported_object - Evidence output description.
>> + * @format: evidence format name
>> + * @max_length: maximum output bytes
>> + * @binds_mrs: evidence validity depends on MR state
>> + */
>> +struct attestation_evidence_supported_object {
>> +	const char *format;
>> +	size_t max_length;
>> +	bool binds_mrs;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_caps - Immutable evidence capabilities.
>> + * @min_challenge_length: minimum challenge bytes
>> + * @max_challenge_length: maximum challenge bytes
>> + * @max_total_output_length: maximum bytes across all objects
>> + * @objects: supported evidence objects
>> + * @objects_count: number of objects
>> + */
>> +struct attestation_evidence_caps {
>> +	size_t min_challenge_length;
>> +	size_t max_challenge_length;
>> +	size_t max_total_output_length;
>> +	const struct attestation_evidence_supported_object *objects;
>> +	size_t objects_count;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_object_request - One resolved output object.
>> + * @supported_object: matching capability entry
>> + * @output: resolved output blob
>> + */
>> +struct attestation_evidence_object_request {
>> +	const struct attestation_evidence_supported_object *supported_object;
>> +	struct ctlv_blob *output;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_request - Validated evidence request.
>> + * @challenge: challenge bytes
>> + * @challenge_length: challenge length
>> + * @objects: requested output objects
>> + * @objects_count: number of objects
>> + */
>> +struct attestation_evidence_request {
>> +	const u8 *challenge;
>> +	size_t challenge_length;
>> +	const struct attestation_evidence_object_request *objects;
>> +	size_t objects_count;
>> +};
>> +
>> +/**
>> + * struct attestation_evidence_result - Provider evidence result.
>> + * @object_lengths: produced length for every requested object
>> + */
>> +struct attestation_evidence_result {
>> +	size_t *object_lengths;
>
>No number of objects?  That would make this structure more
>self-contained.  Copying `objects` from the request would allow passing
>it around to handle results, but there may not be too much value in
>doing it this way.

Not really needed. This struct is only related got evidence_get cb and
it is always used alongside with struct attestation_evidence_request
which has the count. It would be redundant to have it here too.


>
>> +};
>> +
>> +/**
>> + * struct attestation_provider - Immutable provider operations and properties.
>> + * @evidence_get: produce requested evidence
>> + * @mr_read: read one MR
>> + * @mr_extend: extend one MR
>> + * @evidence_caps: evidence capabilities, or NULL
>> + * @mrs: fixed MR properties
>> + * @mrs_count: number of fixed MRs
>> + */
>> +struct attestation_provider {
>> +	int (*evidence_get)(struct attestation *att,
>> +			    const struct attestation_evidence_request *request,
>> +			    struct attestation_evidence_result *result);
>> +	int (*mr_read)(struct attestation *att, unsigned int mr_id,
>> +		       struct attestation_digest_set *values);
>> +	int (*mr_extend)(struct attestation *att, unsigned int mr_id,
>> +			 const struct attestation_digest_set *values);
>> +	const struct attestation_evidence_caps *evidence_caps;
>> +	const struct attestation_mr_props *mrs;
>> +	size_t mrs_count;
>> +};
>> +
>> +#endif /* _LINUX_ATTESTATION_H */
>> -- 
>> 2.56.0
