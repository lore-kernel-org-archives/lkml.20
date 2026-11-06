Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981020;
	b=IObU8lsdQW+aDJd36TZZ+bDJYpTtbRhyHF2oidUrDDkcJgDTIhCgZHDB8nwCuyiq5M0P
	 C8o1DF2LuQlZn6cUMoQFPq38ViwIJM7lGMRfKjR9m6mzXSJvwRaFpA0KxT1oHc/on3SnP
	 eR5aXdXHgldh8csVIrtcFASTaaQLAm/DWiC1syN8kmomqReICuELIcDIuZpJ+aoFfiI9W
	 m7ZAGMDR7j4V/X2xO+EJylBfwvfB9Zp+2xMibj3B8FUBNvEFD26hyPeoI7H0LoONzIYdU
	 6qM6RZQferBb6NdHaPrn7ogmFvVug43gCYG7Be+9qf96XX1KP/NbZnBrdYLmZNYG80A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t7whNWzXgtf5Zep3rN0eJ8AdaQGIaezCYSMAtMtMDQ4=;
	b=AQIgJ0XtTjII4vveY2eU1wPETRpVt8Zw11cv1Q/FbzLu4M7eCri6tVBrenrWSXqeAPmG
	 zBpJtCB7Y9HgjNeCADXwVrALEGq7Pod/MIOHlXMLG4p/lFT/2h3j+V0bP0SQrjKOV0xCG
	 AkB6qk1dM7RnuAkBb8M4ERMxKCLi7ml+5wA6zOX8h/Bldl9IzaO3zTxz9JCD33RRNhLsQ
	 5dGuwSwSIPyi539O9M9RJv/Mko+FILiv99PqaJg5MtC94IJwMpXjd65YYSCEKUzA8NpFb
	 qwD/8J30ySiSgJOBNaIpTt33f3ZwETLb2MIrdPiV/IsQBcznc9a6Yt4PYmTQTAwLFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=PROVhtFB;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A03606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A03606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=PROVhtFB
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so897177f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793981017; x=1794585817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7whNWzXgtf5Zep3rN0eJ8AdaQGIaezCYSMAtMtMDQ4=;
        b=PROVhtFBjiJL+M4D+pdcjRm34WNVU0Biwx7qiIHzLO+Dmg7trp46+GEqUgPKdhEbt0
         3ap1c2ItjCrGDnAhNpOzx4pOWMg27MNi/WxI0zA0O/tfV9zarjUHSb2qO730sdRsXPhm
         YQ5YDp/qnYpkHndm9k6ya2ujKHgrC56BMrPDfy+UR+DiWa0259MM5BWmuhi03/giL/Vw
         LT2ScogfcWZF41AoGkFJmBjLE3tgyE10+V9+O88PZ7pDT3dWGLSb2rsr4Mn2D9hQQarn
         8xnSNFo1XDw577NcafopStS/ls+4DqhJ/kdX/0SOLPI20rV9aiCm8PCAcsTAYx6NLW/9
         dThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981017; x=1794585817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7whNWzXgtf5Zep3rN0eJ8AdaQGIaezCYSMAtMtMDQ4=;
        b=hIh4Ars7ROk+gcRqOAS7EqIrCfZwNRRiDj+c3zoyh2xv4jhuTBxJ2f8tAwllqDs3bZ
         ADqsNHsRPiu7PKJPc9Rw9gHgBN20WgJM99685Tq4WQ+jZ5WHbAAaoMaD5mLuuyFP2f6S
         rEctBuJVvfkeOtlmftKyaX3o2IVW+ScqGYHptJ/0JY+DHnQVKP8BRrLdK87OM8dICVM/
         IKyAuin9poKLbbuXtyDyET3jIlEs0i1YGpqHNUHNtDkDoZKq/BYcT4IhZvsNPJb7qqMe
         xWkrgDcsrI9UKcg2hSCz1hmp5UZ6j7HtvWJdBIX7VTJxs1D4Drfd+I9qQ8xa2lHvwPV5
         8yyA==
X-Forwarded-Encrypted: i=1; AL+hErElO+TZ9xvKJRdb98pBVCVCDeQoGASpHRtluZHa0SX4tOyyZTYYxTyiZbWcZEQJPJDeaOpXs2ZSNkKzUgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j8SFUjqbh7VqFzKZVJdngkQg3G4bZ9Au48EJVbCC54moULJbP
	flGPbJZOWP4KPk38yJxEdh2YzHmOvhsXulh9kE3f2431HPb6Fjf5ZT7MbgwAFiF2o44=
X-Gm-Gg: AYBFou3oRKVpwCKqlV6hD6arrL0E2EyBdNaqWmwNOvadaEZFL06yj4mUA5BSgFOCBAu
	UJp3w+75xqUr6JenxzsWkLKpTviB4IF0xBS54d4HlsP5RQnetnbVjoVXLJWsql7GdPzWqBZPGhI
	aAUmA4XOS4c5dB1mm+Y+FsyrC512QICZbtJyYksByu0gL1q+gvPyCOK8E0uHEyX1QorUTzrqULu
	+0AUhCXrRSCOnACER4m/JZw4wShRId8hTrtj7AtgDS05paPZ3ZtzYUE0Xc+/arxiUMA5eBJbofL
	5JYMvpXVmDZSBHGWvI+tjP5nx565QK0644utKCsOH4xRAo91Vvs8upAxs2nqynjdB2zxxCAxyGS
	dCBkj+397MUW7LBBBImD/GJOhC3LvaygDKvM38oYF8U0GajfK7vtaTcixOenKhP7AJYAx36qLnE
	4F0E8ZGWe0nMcq6Qbb9v9VB7bEmR6KNTZonTALfFCKrNpULRpkEImjvHjuEGgFqBniAF4XSo2DS
	N/EjNQli3pWxU37UA24W9I/1lbrikJEYP8AVlrIeqDC8ixnRHlY+2od4M3kRxf71aGcN1b+au7/
	IDyzYdWNiRoU1cEnN4Co982poD/pAFcBhIsx
X-Received: by 2002:a05:6000:46d0:b0:490:b23b:802d with SMTP id ffacd0b85a97d-4927740356amr3723333f8f.37.1793981016857;
        Fri, 06 Nov 2026 08:03:36 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7701b51sm4353763f8f.37.2026.11.06.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:03:36 -0800 (PST)
Date: Fri, 6 Nov 2026 17:03:32 +0100
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
Message-ID: <au34wXtIqii-hfFI@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
 <aux01NUd85PabtZu@FV6GYCPJ69>
 <auyKE2sGqtfjk4v5@e129823.arm.com>
 <auy7IM0_S2tv7EZX@FV6GYCPJ69>
 <au2WdWFOYbPEv0Uj@e129823.arm.com>
 <au3i-0eDzJZaWukx@FV6GYCPJ69>
 <au3mAsQrh0GniXJo@e129823.arm.com>
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
In-Reply-To: <au3mAsQrh0GniXJo@e129823.arm.com>

Fri, Nov 06, 2026 at 03:36:50PM +0100, yeoreum.yun@arm.com wrote:
>> Fri, Nov 06, 2026 at 09:57:25AM +0100, yeoreum.yun@arm.com wrote:
>> >On Fri, Nov 06, 2026 at 09:27:42AM +0100, Jiri Pirko wrote:
>> >> Thu, Nov 05, 2026 at 02:52:19PM +0100, yeoreum.yun@arm.com wrote:
>> >> >On Thu, Nov 05, 2026 at 01:32:49PM +0100, Jiri Pirko wrote:
>> >> >> Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>> >> >> >On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> >> >> >> [..snip..]
>> >> >> >> 
>> >> >> >> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> >> >> >> > +					       const struct ctlv_cursor *request,
>> >> >> >> > +					       struct attestation_evidence_request *decoded,
>> >> >> >> > +					       struct attestation_evidence_object_request **objects)
>> >> >> >> > +{
>> >> >> >> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> >> >> >> > +	u32 challenge_length;
>> >> >> >> > +
>> >> >> >> > +	decoded->challenge =
>> >> >> >> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> >> >> >> > +	decoded->challenge_length = challenge_length;
>> >> >> >> > +	if (challenge_length < caps->min_challenge_length ||
>> >> >> >> > +	    challenge_length > caps->max_challenge_length)
>> >> >> >> 
>> >> >> >> Hmm, I'm not sure whether this check is required for
>> >> >> >> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> >> >> >> 
>> >> >> >> for example, if the provider provides two evidence:
>> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> >> >> >> 
>> >> >> >> might challenge is reuiqred for generating the token
>> >> >> >> and this would be marked at min/max_challenge_size in evidence_cap.
>> >> >> >> 
>> >> >> >> However, in case of eventlog, it wouldn't require challenge.
>> >> >> >> for example, TPM event log or CCEL event log.
>> >> >> >
>> >> >> >Right
>> >> >> >
>> >> >> >> Do we need some field on attestation_evidence_supported_object whether
>> >> >> >> it requires challenge or not and applies this sanity check per the object?
>> >> >> >> 
>> >> >> >> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> >> >> >> always.
>> >> >> >
>> >> >> >I wonder if we should have two interfaces here for signed and unsigned
>> >> >> >evidence? It would be clearer for userspace then when it needs to
>> >> >> >provide a challenge or not.
>> >> >> 
>> >> >> Isn't the challenge field provided/not-provided enough?
>> >> >> 
>> >> >> Currently on the introspection side, device-get op would provide
>> >> >> challenge-lengths array:
>> >> >> 
>> >> >>         evidence?:
>> >> >>           challenge-lengths[8]:
>> >> >>             length?: uint(..4096)
>> >> >>             min-length?: uint(..4096)
>> >> >>             max-length?: uint(..4096)
>> >> >>  	  objects[16]:
>> >> >>             blob-class: evidence-blob-class
>> >> >>             max-length: uint
>> >> >>             blob-instance?: uint(..u32-max)
>> >> >> 
>> >> >> I think it would make sense to have challenge-lengths array per object:
>> >> >> 
>> >> >>  	  objects[16]:
>> >> >>             blob-class: evidence-blob-class
>> >> >>             max-length: uint
>> >> >>             blob-instance?: uint(..u32-max)
>> >> >>             challenge-lengths[8]:
>> >> >>               length?: uint(..4096)
>> >> >>               min-length?: uint(..4096)
>> >> >>               max-length?: uint(..4096)
>> >> >> 
>> >> >> Then the unsigned object would just simply have challenge-lengths empty?
>> >> >
>> >> >This looks good to me. :)
>> >> 
>> >> The challenge is one of several open points that all depend on what an
>> >> evidence object is: Rick's TDREPORT, legacy versus DICE Quotes,
>> >> "primary", "raw" and the format strings. Here is my proposal to settle
>> >> these together:
>> >> 
>> >> The model:
>> >> 
>> >> 1. device-get lists each object with an id, a class (signed, event-log,
>> >>    cert-chain or auxiliary), the formats it may come in, its max-length
>> >>    and, for signed objects only, challenge-lengths.
>> >> 2. evidence-get names objects by id, as MR ops name MRs, each with its
>> >>    output blob. It carries a challenge exactly when it names a signed
>> >>    object, and the challenge has to fit each of them.
>> >> 3. The reply gives each object's format, length and, where the TCB
>> >>    vouches for it, the TCB's digest. The output is always {label, data}.
>> >> 4. A signed object is made by the call, over the challenge, and never
>> >>    reused. The rest are read as they stand.
>> >> 
>> >> This settles following issues discussed during this patchset review:
>> >> 
>> >> 1. One op, not two. Per-object challenge-lengths tell userspace when to
>> >>    pass a challenge, and one call returns the signed object with the log
>> >>    and certificates needed to check it.
>> >> 2. TDX's TDREPORT goes: it is MAC'd for the platform, not signed.
>> >>    /dev/tdx_guest keeps TDX_CMD_GET_REPORT0.
>> >> 3. TDX's Quote object lists the legacy and the DICE format. The provider
>> >>    labels what the host returned and fails on a Quote it cannot label.
>> >> 4. "primary" becomes "signed", manifest joins auxiliary, spdm-vca,
>> >>    spdm-measurements and tdisp-report become formats, and signature
>> >>    goes, as a signed object carries its own.
>> >> 5. "raw" goes with the representation attr. The TCB digest is a reply
>> >>    field, so a blob always holds the object's own bytes.
>> >> 
>> >> Formats become an enum each provider family defines, instead of free
>> >> strings. I'm still unsure if format should be entirely provider-specific
>> >> and defined as "extension", or it should be somehow mixture of common
>> >> and provider-specific. Looks there is not really much common
>> >> anyway, so I lean towards provider-specific only. So far I have:
>> >
>> >Overall, This is plausible for me with some small question.
>> >
>> >> 
>> >> ======  ============  ==========  =========  ===========================
>> >> Family  Format        Class       Challenge  Bytes
>> >> ======  ============  ==========  =========  ===========================
>> >[...]
>> >> tpm     ek-cert       cert-chain  none       EK certificate from NV
>> >
>> >Just a thought, but how are we planning to retrieve
>> >the NV index for EK certificate?
>> >
>> >As far as I know, TPM NV storage doesn't support labeling.
>> >
>> >Should I assume that the NV index would be specified as part of the
>> >challenge to retrieve the certificate from TPM NV storage?
>> 
>> evidence-get allows to accept mr-selection as part of the request
>> alongside the challenge.
>
>Sorry. Could you explain a little bit detail for this?.
>AFAIU, this is to get the EK certificate from TPM non-volatile storage.
>But, I don't know why *EK* certificate get would be relevant for
>*mr selection*.  AFAIK, the TPM_Quote will be used AK not a EK.

You are right, my mistake. I misunderstood the question.

mr-selection selects PCRs for Quote, or an extend-NV measurement
register for NV Certify.

An NV-resident EK certificate is retrieved using NV_Read. I think
blob-instance is a good fit. For TPM certificate objects, it could
identify the certificate's NV index.



>
>Also, AFAIK, mr_selection is meaningful when the evidence_accept is
>supported.

These are independent. mr-selection chooses the measurements included
in evidence. EVIDENCE_ACCEPT authorizes a subsequent native transition.
The TPM provider can quote selected PCRs without supporting acceptance.


>
>What is the relation-ship between mr-selecation and getting the TPM's
>EK certificate getting from NV storage?
>
>-- 
>Sincerely,
>Yeoreum Yun
