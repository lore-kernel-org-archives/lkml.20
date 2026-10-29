Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.165.53.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299832;
	b=B+KNBs64zfnpovtjRpSHDGJ5vdc8hG77UMUbE4yfzIrGSSZ/MpIhFCaNFygx8w2y8RVj
	 G5giKV30GmWT1z+lgYWGi3vObTda4VQuHV3n7RyssaSlW3kKdzOiNJqy2xuQnqrnc9OXP
	 gnEPXHMysAshMiM/t9/wrsxKy6oeQGKsWGNtzwKwpCqhGu7HZCarIMdlRWpS+/5D04MqV
	 5hi9BIlIE3c0WVhQdDz7SQigdIok/PH4GuhHXpuOvaT5XKTWnFc33MIWac2PBtSqTR38q
	 7BORb42ojpB/S2/IFUZ0ILDETgH4waDaaqB3tu1dOjtIxOvP4Sc4lGrvYTVBptE7GTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299832;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=5IMCEQSW4EddZ7FIT1wbfB/0SX217DwqV013zAOLwEo=;
	b=Bk2H9psJwPat9w0eypinD+lpB3gyvwunPXmP9TL/rUDAEwVXUVEK7dCR04RA2ZxXYC86
	 WnmGd6gpXgpjW/Ndxbbxb+mJCcOUeOSe9VwL53RYWciX2NnGxcfE1iYzWfD+obDA0z3SR
	 6t7+MtCFTmTk2lRcGgVzoC2ssmwfosCwMaMffeL+IRpHH2vMtXiKi9frW0pePRLTbjXKl
	 9Z1CoOczSa24/JWAdM76M1+zJhWpBijXNCc/9Bz5l+Dk5cngJ2v42H+vNn5JzLvCG9qfL
	 On+mtQnse/BczqAoc/kRaaqyEvkYUMkXUMSQfWsI0n/z+ThM2PvIKSYBOLixv7uznuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Im5XjzsV;
	arc=none smtp.remote-ip=188.165.53.149
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net [188.165.53.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96C7606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Im5XjzsV
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.231.104])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4jFtb35nSkzBMTb
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:50:23 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-vvbcf (unknown [10.108.54.148])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5DB45C2910;
	Thu, 29 Oct 2026 18:50:20 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
	by ghost-submission-7ccd8bbbb6-vvbcf with ESMTPSA
	id 8HFFAWyV42qTfBwASyHcuw
	(envelope-from <sergii.dmytruk@3mdeb.com>); Thu, 29 Oct 2026 18:50:20 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-95G0015624ec90-fccb-4a19-869f-137c4fe8d7b2,
                    80E54DDF43994B3DD4677030DFD12DA1D43C0C90) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.182.218
Date: Thu, 29 Oct 2026 20:50:20 +0200
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, jgg@ziepe.ca, david.quigley@intel.com,
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com,
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 15/20] attestation: Prepare provider and instance core
Message-ID: <auOVbGYJjIQTN53z@MjU3Nj>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-16-jiri@resnulli.us>
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
In-Reply-To: <20261015145053.3664509-16-jiri@resnulli.us>
x-ovh-tracer-id: 10767825236716430673
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGhvBlCQfC5JAsSy8X1SQpTlts5ZSHXHH9hWYWnSRvNozacZu18Dq4RTg2Ug2g+sj7V5T4UaNjVJ2Je1KROa4AlE7/8mKFLnVB/hCcY9i2JgZWRcIq5GgXZtNsmH8qDXYW0dTdZ/JfJoLvjRzst4brZZx4PM+ctgHfbS/yPxodZcrtm9v6VQQWir2fGu9HHaOVu5xT4KdJ87I3xFQzQXJD/pg1pIQybsD+AoxOSNwlqb8FxVVSOfEPCWV0UL/pAEwMsfWguvcsXKPfOKrWKXyaFMDi01E1RDNEUkHc0DAyLevWdqpazMn7oP7FyMfMBnvPpTCKUstfhJRlGJVlyHLRzt+BJl83+lMWlVipluUbJ0UrwiY17EhAMUgdhZfPtTyDCATHx+4lz+0wrrAoFau1HLM7tAP3qZ1Y42Sdap8vDTTijpwqYRzpY4j7jpOYzEB/eYX6HKE6SCqYXtVWMC98be3P10DqFJYz2Qo3pYlGxmci1c/VRYDmUZ2PFTTUlYHJLJcdA6NQ6GeNhCiGg5RhSgmmz9ayjvAlJjEQqyAlGont5sXb5TwhOHSmS2C0j4SygfmF9bYNe2MP9mvAC6hHNrjOYm/9JehabUHhGoaF6u66uYRkvk4ba9dOjKOeD4qLeVQU2l7xJ0/Glca66F1RZmB/vYb+37BLNPaZ/kNCuFg
DKIM-Signature: a=rsa-sha256; bh=5IMCEQSW4EddZ7FIT1wbfB/0SX217DwqV013zAOLwEo=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1793299823; v=1;
 b=Im5XjzsVNNrV1DhjQgGOj5hk3cOh2OquWrmePLmX1H/PEb6Bezqn8vEK9s5jIx0aSh3rIq4S
 dDLP+xwj7Dp9TD2RcDSbtNpS+fwPzj44hLfhyg/Ji3Jo/0xkAeuKpASGnZd8vLQiDtZNi57r8Dz
 +JyXXi4oKQ3XKBUZ5AfIX4pvUe9tXyti6k+wknTD2S1wwbLMl0JwJMCoB9EK/MAGxGaLPbPktyg
 swkNZLe5V2GoTUBQVkH0yS9zfMFxZ1rdXdTJ2sM+MfP0NSwsllPmayUrkAmOlpQJ10OP+aGkUNT
 turz/t7g0Dn/0eD/xrwmKZdsmbsrg8k/rz/m1uOKUsLGQ==

On Thu, Oct 15, 2026 at 04:50:48PM +0200, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
> 
> Add provider validation, instance registration and lifecycle management for
> the attestation family.
> 
> The provider descriptor is one immutable evidence and MR contract; journal
> storage follows in the next patch. The core object can be compile-checked
> here. CONFIG_ATTESTATION remains unwired until the CTLV handlers land.
> 
> Assisted-by: Cursor: GPT-5.6 Sol
> Assisted-by: Cursor: Claude Opus 5.5
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
>  Documentation/driver-api/attestation.rst |  36 +++
>  Documentation/driver-api/index.rst       |   1 +
>  MAINTAINERS                              |   2 +
>  drivers/attestation/Kconfig              |  12 +
>  drivers/attestation/Makefile             |   4 +
>  drivers/attestation/core/core.c          | 280 +++++++++++++++++++++++
>  drivers/attestation/core/internal.h      |  35 +++
>  include/linux/attestation.h              | 138 +++++++++++
>  8 files changed, 508 insertions(+)
>  create mode 100644 Documentation/driver-api/attestation.rst
>  create mode 100644 drivers/attestation/Kconfig
>  create mode 100644 drivers/attestation/Makefile
>  create mode 100644 drivers/attestation/core/core.c
>  create mode 100644 drivers/attestation/core/internal.h
>  create mode 100644 include/linux/attestation.h

[...]

> diff --git a/include/linux/attestation.h b/include/linux/attestation.h
> new file mode 100644
> index 000000000000..0fd806ea77d8
> --- /dev/null
> +++ b/include/linux/attestation.h
> @@ -0,0 +1,138 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _LINUX_ATTESTATION_H
> +#define _LINUX_ATTESTATION_H
> +
> +#include <crypto/hash.h>
> +#include <linux/types.h>
> +
> +#include <uapi/linux/ctlv_attestation_gen.h>
> +#include <uapi/linux/hash_info.h>
> +
> +struct attestation;
> +struct ctlv_blob;
> +
> +/**
> + * struct attestation_digest - One MR digest.
> + * @algorithm: hash algorithm
> + * @data: digest bytes
> + */
> +struct attestation_digest {
> +	enum hash_algo algorithm;
> +	u8 data[HASH_MAX_DIGESTSIZE];
> +};
> +
> +/**
> + * struct attestation_digest_set - Digests ordered as the MR algorithms.
> + * @values_count: number of digests
> + * @values: digest array
> + */
> +struct attestation_digest_set {
> +	size_t values_count;
> +	struct attestation_digest *values;
> +};
> +
> +/**
> + * struct attestation_mr_props - Immutable MR properties.
> + * @id: provider-unique MR ID
> + * @name: MR name
> + * @algorithms: ordered hash algorithms

Why do these need to be sorted?  Is it just to make indexing easier?

I see that the number of algorithms is also checked on extending.  Does
it mean that a situation when not all PCR banks are extended at the same
time is considered an invalid one?  That may be a problem at least for
DRTM which may extend only one bank even if several are active.

> + * @algorithms_count: number of algorithms
> + * @has_register_index: whether @register_index is valid
> + * @register_index: native register index
> + * @readable: MR can be read
> + * @extendable: MR can be extended

At least with TPMs, whether a PCR can be extended depends on locality,
so this isn't necessarily a static property.  Is this flag expected to
always be accurate or it would be OK for a provider to declare an
extendable MR but then deny doing it?

> + */
> +struct attestation_mr_props {
> +	unsigned int id;
> +	const char *name;
> +	const enum hash_algo *algorithms;
> +	size_t algorithms_count;
> +	bool has_register_index;
> +	unsigned int register_index;
> +	bool readable;
> +	bool extendable;
> +};
> +
> +/**
> + * struct attestation_evidence_supported_object - Evidence output description.
> + * @format: evidence format name
> + * @max_length: maximum output bytes
> + * @binds_mrs: evidence validity depends on MR state
> + */
> +struct attestation_evidence_supported_object {
> +	const char *format;
> +	size_t max_length;
> +	bool binds_mrs;
> +};
> +
> +/**
> + * struct attestation_evidence_caps - Immutable evidence capabilities.
> + * @min_challenge_length: minimum challenge bytes
> + * @max_challenge_length: maximum challenge bytes
> + * @max_total_output_length: maximum bytes across all objects
> + * @objects: supported evidence objects
> + * @objects_count: number of objects
> + */
> +struct attestation_evidence_caps {
> +	size_t min_challenge_length;
> +	size_t max_challenge_length;
> +	size_t max_total_output_length;
> +	const struct attestation_evidence_supported_object *objects;
> +	size_t objects_count;
> +};
> +
> +/**
> + * struct attestation_evidence_object_request - One resolved output object.
> + * @supported_object: matching capability entry
> + * @output: resolved output blob
> + */
> +struct attestation_evidence_object_request {
> +	const struct attestation_evidence_supported_object *supported_object;
> +	struct ctlv_blob *output;
> +};
> +
> +/**
> + * struct attestation_evidence_request - Validated evidence request.
> + * @challenge: challenge bytes
> + * @challenge_length: challenge length
> + * @objects: requested output objects
> + * @objects_count: number of objects
> + */
> +struct attestation_evidence_request {
> +	const u8 *challenge;
> +	size_t challenge_length;
> +	const struct attestation_evidence_object_request *objects;
> +	size_t objects_count;
> +};
> +
> +/**
> + * struct attestation_evidence_result - Provider evidence result.
> + * @object_lengths: produced length for every requested object
> + */
> +struct attestation_evidence_result {
> +	size_t *object_lengths;

No number of objects?  That would make this structure more
self-contained.  Copying `objects` from the request would allow passing
it around to handle results, but there may not be too much value in
doing it this way.

> +};
> +
> +/**
> + * struct attestation_provider - Immutable provider operations and properties.
> + * @evidence_get: produce requested evidence
> + * @mr_read: read one MR
> + * @mr_extend: extend one MR
> + * @evidence_caps: evidence capabilities, or NULL
> + * @mrs: fixed MR properties
> + * @mrs_count: number of fixed MRs
> + */
> +struct attestation_provider {
> +	int (*evidence_get)(struct attestation *att,
> +			    const struct attestation_evidence_request *request,
> +			    struct attestation_evidence_result *result);
> +	int (*mr_read)(struct attestation *att, unsigned int mr_id,
> +		       struct attestation_digest_set *values);
> +	int (*mr_extend)(struct attestation *att, unsigned int mr_id,
> +			 const struct attestation_digest_set *values);
> +	const struct attestation_evidence_caps *evidence_caps;
> +	const struct attestation_mr_props *mrs;
> +	size_t mrs_count;
> +};
> +
> +#endif /* _LINUX_ATTESTATION_H */
> -- 
> 2.56.0
