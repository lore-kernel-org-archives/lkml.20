Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026356;
	b=EisBtuJDiWKJBdhEPzHN8rLZQpOdgXYkdnIWcW0SysX4HO3ipiRtJ+YC4YcCz8/EAE7G
	 5r5m8hxDgaMlm5fvcKoytJqye7lOI2rpTzvxelLlTkxNfiZ3lQnfaftjHY1N/w6jNuPSy
	 t9+69P6ny3qy0n2qDcFOyDEn7onyVZHbLP2C+x/9YQ7UqiScgJ8wibTKbpP6ZJCaCMA7V
	 IjY9XEKvVCA3fW2iax5Q9NpctFPAkKrGs+cJBpopnrcYFWcrnb/JWVKdRMytmfhCGnUKA
	 /UwP9667M9HLV1GDbor2gT8m3jUGbqG+mw7mZ69b9GDydi87DjyemiXDrclh7OPMpIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VdhjTRpZkzPz14e+11oPuZMjIuI1bMnZdjQ9c48oYKg=;
	b=RX8LZWSqCU1c5qoYB5VJNJ3Cyk2LRNFMYuUGqZsPQItXv68RIz4porgxX6mEuavbE9ET
	 Gq8PGy/bYNHzVYsInGiGmJIr1W4gt+rZSR2tmyVAgSZC9lYtmhusFygWYWAFcBoa8Q9Ie
	 cFySeuGp1b6IOfDZsGLTmshmB/orG6HS7Ufs1jlZD9N3GVUInRX90vlY6z0GgK/bz0RcE
	 wrhinPJR/5/0dIg1itHNMFFL3M0/juSBOWq1VZL1H8+rNQxxXxNExEXhgCfCzrbfZx6L9
	 UPAdDYx7vClv6nNxjtT0GW6XghappzJSUi76GgTZHiKwtpC3TUmBRVJne2XZdrsusiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=mXmlo9KF;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F7606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3F7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=mXmlo9KF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so19397875e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793026354; x=1793631154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VdhjTRpZkzPz14e+11oPuZMjIuI1bMnZdjQ9c48oYKg=;
        b=mXmlo9KFfO7C9F1JFA8jDMW1R6BdkfNbBAtAR+uIFFX3PSFcODnFdrXZa1KfFJtQfe
         1wYn7NZZoJaxDL/t967U1Hs0rKedL8HWe0MeuV+kdfVc3BgbfLpnErhoLHo2A3dwbhUD
         zuGqlNbTM0JhttmPQXgO33kNqvh+2vXB3bJYAqHbdjWU8UdCdUlN7nPYBUAnXyEWLQdu
         BSAnyLX/VZB+uFlqnUMpVx8Kl0DqyQ1tQ7+6tZcZoJp5PfXjNV+HXKz1BjRGvXtiACbB
         bVxAk59302VeDMsvIwuK58TpeDB3KNVK9NVhLsRFkUhIN1VwsdfhXArbGQKmp878hYXv
         FhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026354; x=1793631154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdhjTRpZkzPz14e+11oPuZMjIuI1bMnZdjQ9c48oYKg=;
        b=RUGQJ9qU4s4nGQ+ypsn3X/DqhycreMNF4tsPIpy02lMWNGYfmIc0hW8wBU9QGnfDqQ
         yVG1YZB61bkVlmxXHw4KDgFh4DE1sntp8DQtnfEqyBz38cZb85Rl0rjD0qUFsu4qvo0a
         EjvhDZdhgxSpAZ2TjG5hAyLpr4tFLM/TTs9GLvJLpDtvbl6Nm68Le8e7ffAjqiNOkAth
         3DPWWd9ldGTvauVv8QRvoNn4C6reOpAixpiLqTVQAmmn4HTdfnGYbaoi8tknvUor6l4+
         SlgRbF3OGBtBse7HcvrZAmMBHE04SgaxALKcyTxjzOIfeClnevxZARHfGlQXMvd5ZO9+
         hUKQ==
X-Forwarded-Encrypted: i=1; AKwUvByye/cmahVpjNYo2JJy6yIQib4rHHiDAfrb9RtM0g7bgJtk44JyLgsr1uZodnRJC51VXYkp52yBSiEV6Q8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyPYpPUnN3ZkyISSWA4c2EcV0JYrzGpJojkQai0NgfXxEMJvRl
	2bmT5QWIVQ9KAKa916pOtr7sAY+bVA2u2dgghEXYjWXoweAbnZ78Jswdr8OUIxmZy5g=
X-Gm-Gg: AYBFou1GVenohF73nInNsrCI97vpk5bYDmT+37hfNDnTp1xI2cyZLfvMcU6yq+NvhoB
	ix/ajKMz1fL/nMHlB7547tpi3bBaiGlKDIr/0VU/c9UFODN7Rwbbs8U1bUGAGYcEFLmA0+itE8i
	EQd8Bz8kdBVT9EKBZ7VYcfxnd3d7SRTFty+zFpjti5UtQCsgqmfS0+pZu/v0ulv5/rL0zA4XxCd
	WHHIDPmdmRfOaqTuKM/zbjVIAtOIqH/cvAQhymaDkR6P3Mt7d/VaHVE8lAJFHefdICPgyjPybQc
	x9jbxE2m7KUj1r3l812ovEFm2+1tefslRssqk63v9pChBU2lPyqTgw5Qia/Q2BIpozopA7nfnb8
	spAj3HnMe6ETQuGOIo5eD2+Cip1MwGErUSlBgmqc0STxNIG07mAvYy3J2d01SnDMd6YLVOmXK3m
	alXec1N+NfJfbhiLChwmKpwP9os+3ij5NgEgd6aUm6O+7kQfxz/xCZjIl8kQ1HG2mVuCS967xPY
	lwdRVYI6FQNpvgpMfbqmG3fKJnSPX3Zzj5WXZ0fcTPWfPyUUfBebBNgKvO2U4r06Q==
X-Received: by 2002:a05:600c:3493:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4a35ac9d0e8mr130236665e9.11.1793026353844;
        Mon, 26 Oct 2026 07:52:33 -0700 (PDT)
Received: from localhost ([208.127.45.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm528356935e9.1.2026.10.26.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:52:33 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:52:30 +0100
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
Message-ID: <at9nsxtGOl3N5PJR@FV6GYCPJ69>
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
>> +
>> +struct ctlv_introspection_dump_position {
>> +	u64 record;
>> +	u32 member;
>
>Maybe a comment describing how record and member are encoded for each
>of the users?
>
>> [ ... 13 lines skipped ... ]
>> +/* The immutable root-first chain always has generation zero. */
>
>This comment seems out of place, it should be closer to the 0's it
>refers to a function below
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
>I'm finding it quite hard to go from this statement to the YAML. I get this:
>
>CTLV_NEST_START(ctlv_family_entry, CTLV_ATTR_FAMILY_ENTRY, CTLV_SCHEMA_NEST)
>
>I asked AI and it said it was this:
>
>attr-sets:
>  - name: family-entry
>    attrs:
>      - family.id
>      - family.name
>
>Which is some cyclical reference to this one:
>
>attr-groups:
>  # One record per family of the chain a device answers, as reported by
>  # families-dump.
>  - name: family
>    attrs:
>      - name: id
>        type: uint
>      - name: name
>        type: string
>        max-length: 63
>      - name: entry
>        attrs: family-entry
>        max-occurrences: unlimited
>
>But having poked it some more I see that AI was wrong, and it is the
>reverse..

Yep. Already spotted. Will fix.

>
>But.. Where is the actual op? I finally see it is here:
>
>ops:
>  - name: families-dump
>    type: query
>    fd-access: read
>    reply:
>      attrs: family.entry
>
>So.. The op points to family.entry which points back to family.id and
>family.name through the attr-sets? I queried AI for a while and came
>to this:
>
>  The confusing part is that the family group contains both the leaf
>  attributes and the container that holds them. Their grouping
>  establishes names and attribute IDs; it doesn't imply
>  nesting. Nesting comes from attrs: family-entry.

True, will fix.


>
>I don't have a constructive idea yet. I've been trying to understand
>the yaml in this series for a while now, and I think it is just
>unreadable in this organization. The information is spread about all
>over the place and it is very hard to construct an idea of what is
>actually in a particular system call. Maybe the missing html
>generation would be helpful..
>
>Poking at AI some more I understand it is like this because this is
>how the ABI numbers are generated, things need to be in these lists so
>they can be automatically numbered.
>
>Going the other way isn't much better..
>
>ops:
>  - name: device-get
>    type: action
>    fd-access: read
>    reply:
>      attrs: device-reply
>
>Okay, so then I see:
>
>  - name: device-reply
>    attrs:
>      - device.caps
>      - device.info
>
>Uh, why do we have this extra layer? but OK..
>
>attr-groups:
>  - name: device
>    attrs:
>      - name: caps
>        attrs: device-caps
>
>Er.. 
>
>  - name: device-caps
>    optional-attrs:
>      - cap.evidence
>      - cap.mr
>
>Getting closer!!
>
>  - name: cap
>    attrs:
>      - name: evidence
>        attrs: evidence-cap
>
>Oh, apparently not..
>
>  - name: evidence-cap
>    attrs:
>      - cap.min-challenge-length
>      - cap.max-challenge-length
>      - cap.max-total-output-length
>      - cap.object
>
>This time for sure!
>
>  - name: cap
>    attrs:
>      - name: min-challenge-length
>        type: uint
>
>It is too much, this going back and forth to the sets is very
>obfuscating. Everything is called attr. There is no editor aid to jump
>between the sections, by the time you figure out what type a single
>value is you've lost the trail for the rest of it.
>
>This isn't even that complicated, if I ask AI to explain it in a C ish
>language:
>
>struct device_get_reply {
>	struct {
>		optional struct {
>			uint min_challenge_length;
>			uint max_challenge_length;
>			uint max_total_output_length;
>			struct {
>				enum blob_class;
>				string format;
>				enum representation;
>				uint max_length;
>			} objects[];
>		} evidence;
>
>		optional struct {
>			flags mr_flags; /* read, extend */
>		} mr;
>	} caps;
>
>	struct {
>		/* device-info: filled by the derived family */
>	} info;
>};
>
>I think the yaml names are not helping, calling everything attrs
>everywhere is really confusing. At least the transition into a nest
>and an attr-set should be more clearly marked in the yaml..
>
>The yaml would be significantly better if it was layed out according
>to the actual semantic flow instead of artificially being twisted into
>this need to put everything into a linear list. AI invented this:
>
>device-get:
>  request: {}
>  reply:
>    caps:
>      evidence?:
>        min-challenge-length: uint
>        max-challenge-length: uint
>        max-total-output-length: uint
>        objects[]:
>          blob-class: evidence-blob-class
>          format: string
>          representation: evidence-representation
>          max-length: uint
>      mr?:
>        mr-flags: mr-device-caps
>    info:
>      $extend: device-info
>
>So.. how about could we drop the sets, use a direct description of the
>layout and do something else for the ID numbering? Maybe the numbering
>can be solved directly by only listing the names in:

I didn't want to have a lot of duplications. Netlink show us that the
same attr, or attr group (or nest) is often used in multiple ops. It is
not good to repeat them each time (multiple obvious reasons), so I came
with the sets and groups. But I will think about how to make this
possible to be formatted in more readable way.


>
>numbering:
>  - device-get.reply
>  - device-get.reply.caps
>  - device-get.caps.evidence
>  -[..]
>
>?
>
>-- 
>Jason
