Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212452;
	b=s//YkoAin8blgfOYRCPha+iOlo+zKraapUHaRhyijHvo8Y3SVLRhdM75LR4OvIE4tW+G
	 lDJhrWKXgmHjkvnbzdKH48h7kkZ5/bNxFL1j5FjJUIbv7mi/1HaryE3IG+nhtLz5Tw540
	 nJqb0OhTrj4H2OD7PwIL8gSN/QGMnFv5QS/4auQkil0y7w+7eYxDyKnFzIQovLqPgfIOH
	 IPe1CL3CA3H0uMe7yqdNezsHIAVKXOhjZjs5fcmIM5NFaHpqG1sByndvKgJvHS7geEiFb
	 5QUvlx7c3grT3QcCHdbZ/tB26T2T2tP/kMZC2/pHsKhZevIeqCETu55CbQQ1/QvOcgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RUNLXElxYcf5X5beoAPSp59pareCo5mXiU9bMCYY1Rc=;
	b=RxW+DF0uRsvef5207a1QxNBRcTUIecRnpWaNpuS5zB3lPZuDTloRenVvGCOTmTX9qskX
	 F2S95Em/mI3gEvGDVut5LKiF+wC6JhAcdm2pOmPV/ussDanx0sxrwSnqyowxvDvnkZqBi
	 FR8mAQcRLuA2A4mE+CAti7lLB97Nu4RlOGici/tUahTNYez9bD5DafZ0lNuG5s0DQlO1/
	 lEL/ngx9H+JTn7KfRLhjbw3Dk//1fHYiko/LpH14R8IAR/iBJ+KsIKNIe/0xrV6rWk8bR
	 QLHaVhALW3RlSkrJ8vbq2LvAsgO+4dzcaTV2jIHbTiuO5nj/AMeVlBzK07bJRA6tWXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8961606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8961606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso244396f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794212444; x=1794817244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUNLXElxYcf5X5beoAPSp59pareCo5mXiU9bMCYY1Rc=;
        b=fphhOpPCsnhJ/BDow4ZWrptUdk8KAQCzANCRr17LbYsIQdrfL+Fp3IszTldBJyOJ8t
         /611HSuFrRADsTxtUmqaxobaoo6qL5VraRlKSBq/2pSdcGQtQ20IsGXklVLZ4YL+QpHT
         WL3TIp2XAtWDsl7ZYt3VrurD79AF+bbMTibyXxwcWRtJp1x20M3KgYCLbS/SMcf46yxR
         MkDKVgAglfVzVuFL3bCCEpIwZbM3IGkopIuS3G+fDyjzz7laVZu026sNvORjDyJp35JU
         OiAiiVc+UOp8HcV53Po00lqoXOr/pow9KYl8cRlUwUD2MMmZinTZTI/XuxbXbGmvk//G
         r7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212444; x=1794817244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUNLXElxYcf5X5beoAPSp59pareCo5mXiU9bMCYY1Rc=;
        b=VOMuxXsS3nhVKvmM4niOsLixo+dIl6ZlyAbmsQnKIfGcsN17wf9XKf2R2WjDHBEtya
         zDotgPOUgehSPgWvyeBdl8hP+CiKVfPPVa4CXf09QT9sE6ouqBnRXfT1AZXn+cemc2WP
         NI1Bx3NUD2BPuAAfXHBvWSm/48y1Z48DZJSZS/wPt2DIeJM8lt5ZtHFimts92+xUTvhI
         KJeVAxM6g/zquIdH3RxlDU5FT2ByJn/b7iTlRo8T/vptus/PqvTYGfpL3PEbd1sLB+TO
         f8IShuJL6vaEBlCUcMGoRn/HhiBiCwYmpqLt8t0ZwBzMJIwjGFhUSYIpIVVBZtAiuzgF
         D0rw==
X-Forwarded-Encrypted: i=1; AL+hErExuGFI4vtYxfKhwMVSbPW4A0ql0dv6zq2VbdXCgwwImGdOsH2QOHIxdyVu1IHqmeTW9H5Dcvtr7P8R0dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xh20X/uiEhbo02lnxZjE5wUWlINbxoQfNG6JBIhCJQyx8ZYxO
	Q0GXiiSswlVSfNp5F1X0OymDxRCDOEcUfoCjjBsVFZbsHGoJfNOdtwfFEehW8f3xKIA=
X-Gm-Gg: AYBFou0Hha2h3vaZ06IjlnGekmt1TcGt2iAL0rlsLGkVboheCsl++0jBjjiuJxzKBHG
	FeA698e5+btM0a8eu5JWP6vIFwXSQtaUCcuDin3L5MCmL3jOWoPSHaPf/pLgwkFS8ynZT6514T9
	ZQs8UMsPsLmDP66XMxwcfpjr2e/oxg2xAHG10AtkBYtud/1DizbRIiX93k3WaQILUk1ntv2bDdg
	JQhsaFYL/KuZw1mgmNl0eHgltj502iCn8X4On8m+2VoBcG26mrt9h8jYGJ1rRjOOOsli3uTXkTx
	5et5mB6I5f3miJ1dpnjmsnmjLFUT1FTlaFB1Zh2ojOb+vHVlcW/FxYnW/lYsANE9YlEgTRo5xUL
	vsCMB4/+71/yQXU2H94xUxHO719qIz5RMMXl+Yc93Ao8LuY1XN2E/uuUOi3A+H2n4foe7eM4BYe
	n6F0C8NsGNPlpGgpmQTSd5JqL07ufMjIRa5VhydtUwZ0GZBZEIxt7tbscIi6SyUZVtKQi7Q/bn+
	w3WtleRmYbe4pzuF3eisAin7pwXa5a1dlysb3do3CfQUWMYk2q8kh2HRFEeSeE+xx7n/uHnySs8
	5/aXl2Fnn5vVSWYQu3zOKLbJGyFWsqyUSIs=
X-Received: by 2002:adf:e193:0:b0:491:e28b:1e1e with SMTP id ffacd0b85a97d-4958335a7efmr5753338f8f.28.1794212443701;
        Mon, 09 Nov 2026 00:20:43 -0800 (PST)
Received: from localhost ([165.85.84.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b203b5sm8882576f8f.51.2026.11.09.00.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:20:43 -0800 (PST)
Date: Mon, 9 Nov 2026 09:20:39 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, aneesh.kumar@kernel.org
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <avGCQbvGBIDWD6GD@FV6GYCPJ69>
References: <aux01NUd85PabtZu@FV6GYCPJ69>
 <auyKE2sGqtfjk4v5@e129823.arm.com>
 <auy7IM0_S2tv7EZX@FV6GYCPJ69>
 <au2WdWFOYbPEv0Uj@e129823.arm.com>
 <au3i-0eDzJZaWukx@FV6GYCPJ69>
 <au3mAsQrh0GniXJo@e129823.arm.com>
 <au34wXtIqii-hfFI@FV6GYCPJ69>
 <au3-LyBiCZtUMpEx@e129823.arm.com>
 <au9eskF5P17h3cql@FV6GYCPJ69>
 <au9sUBtdnDk9yA1U@e129823.arm.com>
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
In-Reply-To: <au9sUBtdnDk9yA1U@e129823.arm.com>

Sat, Nov 07, 2026 at 07:22:08PM +0100, yeoreum.yun@arm.com wrote:
>On Sat, Nov 07, 2026 at 06:25:54PM +0100, Jiri Pirko wrote:
>> Fri, Nov 06, 2026 at 05:19:59PM +0100, yeoreum.yun@arm.com wrote:
>> >On Fri, Nov 06, 2026 at 05:03:32PM +0100, Jiri Pirko wrote:
>> >> Fri, Nov 06, 2026 at 03:36:50PM +0100, yeoreum.yun@arm.com wrote:
>> >> >> Fri, Nov 06, 2026 at 09:57:25AM +0100, yeoreum.yun@arm.com wrote:
>> >> >> >On Fri, Nov 06, 2026 at 09:27:42AM +0100, Jiri Pirko wrote:
>> >> >> >> Thu, Nov 05, 2026 at 02:52:19PM +0100, yeoreum.yun@arm.com wrote:
>> >> >> >> >On Thu, Nov 05, 2026 at 01:32:49PM +0100, Jiri Pirko wrote:
>> >> >> >> >> Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>> >> >> >> >> >On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> >> >> >> >> >> [..snip..]
>> >> >> >> >> >> 
>> >> >> >> >> >> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> >> >> >> >> >> > +					       const struct ctlv_cursor *request,
>> >> >> >> >> >> > +					       struct attestation_evidence_request *decoded,
>> >> >> >> >> >> > +					       struct attestation_evidence_object_request **objects)
>> >> >> >> >> >> > +{
>> >> >> >> >> >> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> >> >> >> >> >> > +	u32 challenge_length;
>> >> >> >> >> >> > +
>> >> >> >> >> >> > +	decoded->challenge =
>> >> >> >> >> >> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> >> >> >> >> >> > +	decoded->challenge_length = challenge_length;
>> >> >> >> >> >> > +	if (challenge_length < caps->min_challenge_length ||
>> >> >> >> >> >> > +	    challenge_length > caps->max_challenge_length)
>> >> >> >> >> >> 
>> >> >> >> >> >> Hmm, I'm not sure whether this check is required for
>> >> >> >> >> >> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> >> >> >> >> >> 
>> >> >> >> >> >> for example, if the provider provides two evidence:
>> >> >> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>> >> >> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> >> >> >> >> >> 
>> >> >> >> >> >> might challenge is reuiqred for generating the token
>> >> >> >> >> >> and this would be marked at min/max_challenge_size in evidence_cap.
>> >> >> >> >> >> 
>> >> >> >> >> >> However, in case of eventlog, it wouldn't require challenge.
>> >> >> >> >> >> for example, TPM event log or CCEL event log.
>> >> >> >> >> >
>> >> >> >> >> >Right
>> >> >> >> >> >
>> >> >> >> >> >> Do we need some field on attestation_evidence_supported_object whether
>> >> >> >> >> >> it requires challenge or not and applies this sanity check per the object?
>> >> >> >> >> >> 
>> >> >> >> >> >> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> >> >> >> >> >> always.
>> >> >> >> >> >
>> >> >> >> >> >I wonder if we should have two interfaces here for signed and unsigned
>> >> >> >> >> >evidence? It would be clearer for userspace then when it needs to
>> >> >> >> >> >provide a challenge or not.
>> >> >> >> >> 
>> >> >> >> >> Isn't the challenge field provided/not-provided enough?
>> >> >> >> >> 
>> >> >> >> >> Currently on the introspection side, device-get op would provide
>> >> >> >> >> challenge-lengths array:
>> >> >> >> >> 
>> >> >> >> >>         evidence?:
>> >> >> >> >>           challenge-lengths[8]:
>> >> >> >> >>             length?: uint(..4096)
>> >> >> >> >>             min-length?: uint(..4096)
>> >> >> >> >>             max-length?: uint(..4096)
>> >> >> >> >>  	  objects[16]:
>> >> >> >> >>             blob-class: evidence-blob-class
>> >> >> >> >>             max-length: uint
>> >> >> >> >>             blob-instance?: uint(..u32-max)
>> >> >> >> >> 
>> >> >> >> >> I think it would make sense to have challenge-lengths array per object:
>> >> >> >> >> 
>> >> >> >> >>  	  objects[16]:
>> >> >> >> >>             blob-class: evidence-blob-class
>> >> >> >> >>             max-length: uint
>> >> >> >> >>             blob-instance?: uint(..u32-max)
>> >> >> >> >>             challenge-lengths[8]:
>> >> >> >> >>               length?: uint(..4096)
>> >> >> >> >>               min-length?: uint(..4096)
>> >> >> >> >>               max-length?: uint(..4096)
>> >> >> >> >> 
>> >> >> >> >> Then the unsigned object would just simply have challenge-lengths empty?
>> >> >> >> >
>> >> >> >> >This looks good to me. :)
>> >> >> >> 
>> >> >> >> The challenge is one of several open points that all depend on what an
>> >> >> >> evidence object is: Rick's TDREPORT, legacy versus DICE Quotes,
>> >> >> >> "primary", "raw" and the format strings. Here is my proposal to settle
>> >> >> >> these together:
>> >> >> >> 
>> >> >> >> The model:
>> >> >> >> 
>> >> >> >> 1. device-get lists each object with an id, a class (signed, event-log,
>> >> >> >>    cert-chain or auxiliary), the formats it may come in, its max-length
>> >> >> >>    and, for signed objects only, challenge-lengths.
>> >> >> >> 2. evidence-get names objects by id, as MR ops name MRs, each with its
>> >> >> >>    output blob. It carries a challenge exactly when it names a signed
>> >> >> >>    object, and the challenge has to fit each of them.
>> >> >> >> 3. The reply gives each object's format, length and, where the TCB
>> >> >> >>    vouches for it, the TCB's digest. The output is always {label, data}.
>> >> >> >> 4. A signed object is made by the call, over the challenge, and never
>> >> >> >>    reused. The rest are read as they stand.
>> >> >> >> 
>> >> >> >> This settles following issues discussed during this patchset review:
>> >> >> >> 
>> >> >> >> 1. One op, not two. Per-object challenge-lengths tell userspace when to
>> >> >> >>    pass a challenge, and one call returns the signed object with the log
>> >> >> >>    and certificates needed to check it.
>> >> >> >> 2. TDX's TDREPORT goes: it is MAC'd for the platform, not signed.
>> >> >> >>    /dev/tdx_guest keeps TDX_CMD_GET_REPORT0.
>> >> >> >> 3. TDX's Quote object lists the legacy and the DICE format. The provider
>> >> >> >>    labels what the host returned and fails on a Quote it cannot label.
>> >> >> >> 4. "primary" becomes "signed", manifest joins auxiliary, spdm-vca,
>> >> >> >>    spdm-measurements and tdisp-report become formats, and signature
>> >> >> >>    goes, as a signed object carries its own.
>> >> >> >> 5. "raw" goes with the representation attr. The TCB digest is a reply
>> >> >> >>    field, so a blob always holds the object's own bytes.
>> >> >> >> 
>> >> >> >> Formats become an enum each provider family defines, instead of free
>> >> >> >> strings. I'm still unsure if format should be entirely provider-specific
>> >> >> >> and defined as "extension", or it should be somehow mixture of common
>> >> >> >> and provider-specific. Looks there is not really much common
>> >> >> >> anyway, so I lean towards provider-specific only. So far I have:
>> >> >> >
>> >> >> >Overall, This is plausible for me with some small question.
>> >> >> >
>> >> >> >> 
>> >> >> >> ======  ============  ==========  =========  ===========================
>> >> >> >> Family  Format        Class       Challenge  Bytes
>> >> >> >> ======  ============  ==========  =========  ===========================
>> >> >> >[...]
>> >> >> >> tpm     ek-cert       cert-chain  none       EK certificate from NV
>> >> >> >
>> >> >> >Just a thought, but how are we planning to retrieve
>> >> >> >the NV index for EK certificate?
>> >> >> >
>> >> >> >As far as I know, TPM NV storage doesn't support labeling.
>> >> >> >
>> >> >> >Should I assume that the NV index would be specified as part of the
>> >> >> >challenge to retrieve the certificate from TPM NV storage?
>> >> >> 
>> >> >> evidence-get allows to accept mr-selection as part of the request
>> >> >> alongside the challenge.
>> >> >
>> >> >Sorry. Could you explain a little bit detail for this?.
>> >> >AFAIU, this is to get the EK certificate from TPM non-volatile storage.
>> >> >But, I don't know why *EK* certificate get would be relevant for
>> >> >*mr selection*.  AFAIK, the TPM_Quote will be used AK not a EK.
>> >> 
>> >> You are right, my mistake. I misunderstood the question.
>> >> 
>> >> mr-selection selects PCRs for Quote, or an extend-NV measurement
>> >> register for NV Certify.
>> >> 
>> >> An NV-resident EK certificate is retrieved using NV_Read. I think
>> >> blob-instance is a good fit. For TPM certificate objects, it could
>> >> identify the certificate's NV index.
>> >
>> >Ah. I missed the TCG_EK_Credential_Profile specification which defines
>> >the NV index value for EK certificate:
>> >
>> >2.2.1.4 Low Range
>> >  The Low Range is at NV Indices 0x01c00002 - 0x01c0000c.
>> >    0x01c00002 RSA 2048 EK Certificate
>> >    0x01c00003 RSA 2048 EK Nonce
>> >    0x01c00004 RSA 2048 EK Template
>> >    0x01c0000a ECC NIST P256 EK Certificate
>> >    0x01c0000b ECC NIST P256 EK Nonce
>> >    0x01c0000c ECC NIST P256 EK Template
>> >
>> >But, do we need some argument to get which EK certificate to get?
>> >(RSA or ECC NIST P256)?
>> 
>> Why blob-instance 0-10 is not good enough here?
>
>No, it's enough with just breaking down format like:
>======  ============  ==========  =========  ===========================
>Family  Format        Class       Challenge  Bytes
>======  ============  ==========  =========  ===========================
>tpm     ek-cert-rsa   cert-chain  none       EK certificate from NV
>tpm     ek-cert-ecc   cert-chain  none       EK certificate from NV

Okay, that looks fine to me.


>
>> 
>> 
>> >
>> >Otherwise, Is this interface going to print all EK certificate
>> >regardless of alg?
>> >
>> >> >Also, AFAIK, mr_selection is meaningful when the evidence_accept is
>> >> >supported.
>> >> 
>> >> These are independent. mr-selection chooses the measurements included
>> >> in evidence. EVIDENCE_ACCEPT authorizes a subsequent native transition.
>> >> The TPM provider can quote selected PCRs without supporting acceptance.
>> >
>> >Acked.
>> >
>> >-- 
>> >Sincerely,
>> >Yeoreum Yun
>
>-- 
>Sincerely,
>Yeoreum Yun
