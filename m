Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444541;
	b=AAJpQ/5R6B5nfBta64P27wLbWOBrJ2Ip/CUTllDnFuFnUH5UyWtxygPUCJaHREVCU57h
	 +h3lB/7lQ1YOwwwkQrESXKTN3tv7f3awdB825SlMpMmyzQEcINapnh64pElQpgbpkBpjH
	 xyeZTO4CtWRw0LP/SOLuPcNFzzZ2TORC1o1bAf0pKf7aEOUPN4Pb7RvrgZuIq2XcpHZlQ
	 SfQj5bY20cAEAL218f8nbDlRpiKhLE1BiVWZ6Q/oppLAiahsJDSstCWwnzGGDZ4JF+ois
	 40ZTXbKMudT4FjQq0i0j9+uBCUfQRODu5LF/Jf1LH4ZQXRHeRDzFvP3cIH+IcbXVepw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Infomaniak-Routing;
	bh=8IMF7hTqdNkXpd4HECOEYsdpLHrhvh1mKYSlApFzxVE=;
	b=RahygziBkmg4q7Hu7CjWI1b6lqWTlo1mKbv8MCYWlWTshxcY0LTTwQgLsVypWIkqVDiT
	 Ed5lsaZjjeyyjVHM18OFPtsPBNvqnEwnkQQ/Gf6K8LezpJzF81rJwNmjBzwUh6/8H7x2U
	 ulxSmGDySTQFrz+/2LOKF91CknaqKOj2s1TpgsZk7kHub6udirpMbwq19Bzsq8ylDp+gJ
	 m8Yj+DihPzsLJAmILmMBPbHrD0DJWe00wvAg6S+Be+QlGYMp2xrGdMfaCYcVOh48rlXT6
	 6Sfi01RgCgu5MJ+XyL4efV7cSeAvX3MUjS9IQ4a0QtP3K43Hg/rhYdt9VAjM7Ja5PbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=mYNKIAey;
	arc=none smtp.remote-ip=45.157.188.9
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C81606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C81606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=mYNKIAey
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j7pH82wy8zYtC;
	Mon, 19 Oct 2026 23:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792444532;
	bh=8IMF7hTqdNkXpd4HECOEYsdpLHrhvh1mKYSlApFzxVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYNKIAeyE7hggaNuBB+8TBVu+IXrasxUGp1CAJHLSqf9kc+DdU2x+jmHpZtifFAk4
	 uCx2G9ChYrNrT5Xh7Ljf7kiLAq6yboNu0k12HyPwcxuaLnm592j2J2KToLtev3lQ23
	 XedfOcCLZaS4cPtvotd0SiFSWSWtJVO419RNlHKk=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j7pH75qpyzDNP;
	Mon, 19 Oct 2026 23:15:31 +0200 (CEST)
Date: Mon, 19 Oct 2026 23:15:29 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: Re: linux-next: manual merge of the landlock tree with the origin
 tree
Message-ID: <20261019.wivie2AeLei1@digikod.net>
References: <atZRsj4ON6zuh9XN@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atZRsj4ON6zuh9XN@sirena.co.uk>
X-Infomaniak-Routing: alpha

On Mon, Oct 19, 2026 at 06:21:54PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the landlock tree got a conflict in:
> 
>   security/landlock/domain.h
> 
> between commit:
> 
>   3d8cc52db2f86 ("landlock: Drop __counted_by from landlock_domain.handled_masks")

This commit was merged with v7.3-rc7

> 
> from the origin tree and commit:
> 
>   395c985dac578 ("landlock: Wrap per-layer access masks in struct layer_config")

This commit should no longer be in linux-next, it was a previous
mic/next branch.  The new mic/next branch now properly handles the
merge.

> 
> from the landlock tree.  I kept the __counted_by in the hope that the
> refactoring helped the compiler figure out what's going on.

The "Drop __counted_by" is correct and my new mic/next branch (from
Friday) is based on v7.3-rc7, so I guess the next-20261001/landlock
merge should just be removed.

> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --combined security/landlock/domain.h
> index 428c1d9890dbf,60e8eb2d6ac27..0000000000000
> --- a/security/landlock/domain.h
> +++ b/security/landlock/domain.h
> @@@ -130,10 -130,15 +130,15 @@@ struct landlock_hierarchy 
>   		 */
>   		log_new_exec : 1;
>   	/**
> - 	 * @quiet_masks: Bitmasks of access that should be quieted (i.e. not
> + 	 * @quiet_access: Bitmasks of access that should be quieted (i.e. not
>   	 * logged) if the related object is marked as quiet.
>   	 */
> - 	struct access_masks quiet_masks;
> + 	struct access_masks quiet_access;
> + 	/**
> + 	 * @quiet_permission: Per-member quiet bitmasks for permission types in
> + 	 * this layer.
> + 	 */
> + 	struct permission_masks quiet_permission;
>   #endif /* CONFIG_SECURITY_LANDLOCK_LOG */
>   };
>   
> @@@ -217,7 -222,7 +222,7 @@@ struct landlock_domain 
>   		 * @work_free: Enables to free a domain within a lockless
>   		 * section.  This is only used by landlock_put_domain_deferred()
>   		 * when @usage reaches zero.  The fields @usage, @num_layers and
> - 		 * @handled_masks are then unused.
> + 		 * @layers are then unused.
>   		 */
>   		struct work_struct work_free;
>   		struct {
> @@@ -233,23 -238,16 +238,16 @@@
>   			 */
>   			u32 num_layers;
>   			/**
> - 			 * @handled_masks: Contains the subset of filesystem and
> - 			 * network actions that are restricted by a domain.  A
> - 			 * domain saves all layers of merged rulesets in a stack
> - 			 * (FAM), starting from the first layer to the last one.
> - 			 * These layers are used when merging rulesets, for user
> - 			 * space backward compatibility (i.e. future-proof), and
> - 			 * to properly handle merged rulesets without
> - 			 * overlapping access rights.  These layers are set once
> - 			 * and never changed for the lifetime of the domain.
> - 			 *
> - 			 * Not annotated with __counted_by(num_layers): clang
> - 			 * miscomputes the counter address for a FAM nested in
> - 			 * an anonymous struct within a union, which trips
> - 			 * FORTIFY:
> - 			 * https://github.com/llvm/llvm-project/pull/228309
> + 			 * @layers: Per-layer access configuration.  A domain
> + 			 * saves all layers of merged rulesets in a stack (FAM),
> + 			 * starting from the first layer to the last one.  These
> + 			 * layers are used when merging rulesets, for user space
> + 			 * backward compatibility (i.e. future-proof), and to
> + 			 * properly handle merged rulesets without overlapping
> + 			 * access rights.  These layers are set once and never
> + 			 * changed for the lifetime of the domain.
>   			 */
> - 			struct access_masks handled_masks[];
> + 			struct layer_config layers[] __counted_by(num_layers);
>   		};
>   	};
>   };
> @@@ -259,7 -257,7 +257,7 @@@ landlock_get_fs_access_mask(const struc
>   			    const u16 layer_level)
>   {
>   	/* Handles all initially denied by default access rights. */
> - 	return domain->handled_masks[layer_level].fs |
> + 	return domain->layers[layer_level].handled.fs |
>   	       _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
>   }
>   
> @@@ -267,14 -265,14 +265,14 @@@ static inline access_mask_
>   landlock_get_net_access_mask(const struct landlock_domain *const domain,
>   			     const u16 layer_level)
>   {
> - 	return domain->handled_masks[layer_level].net;
> + 	return domain->layers[layer_level].handled.net;
>   }
>   
>   static inline access_mask_t
>   landlock_get_scope_mask(const struct landlock_domain *const domain,
>   			const u16 layer_level)
>   {
> - 	return domain->handled_masks[layer_level].scope;
> + 	return domain->layers[layer_level].handled.scope;
>   }
>   
>   /**
> @@@ -293,7 -291,7 +291,7 @@@ landlock_union_access_masks(const struc
>   
>   	for (layer_level = 0; layer_level < domain->num_layers; layer_level++) {
>   		union access_masks_all layer = {
> - 			.masks = domain->handled_masks[layer_level],
> + 			.masks = domain->layers[layer_level].handled,
>   		};
>   
>   		matches.all |= layer.all;
> @@@ -329,4 -327,63 +327,63 @@@ static inline void landlock_get_domain(
>   		refcount_inc(&domain->usage);
>   }
>   
> + /**
> +  * landlock_permission_is_denied - Check if a permission request is denied
> +  *
> +  * @domain: The enforced domain.
> +  * @permission_bit: The LANDLOCK_PERMISSION_* flag to check.  Must have
> +  *                  exactly one bit set.
> +  * @request_value: Compact bitmask to look for (e.g. the result of
> +  *                 landlock_ns_type_to_bit()).  Must have exactly one bit set.
> +  *
> +  * Iterate from the youngest layer to the oldest.  For each layer that handles
> +  * @permission_bit, check whether @request_value is present in the layer's
> +  * allowed bitmask.  Return on the first (youngest) denying layer.
> +  *
> +  * Return: The youngest denying layer + 1, or 0 if allowed.
> +  */
> + static inline size_t
> + landlock_permission_is_denied(const struct landlock_domain *const domain,
> + 			      const access_mask_t permission_bit,
> + 			      const u64 request_value)
> + {
> + 	ssize_t layer;
> + 
> + 	BUILD_BUG_ON(sizeof(permission_bit) > sizeof(u32));
> + 
> + 	if (WARN_ON_ONCE(hweight32(permission_bit) != 1) ||
> + 	    WARN_ON_ONCE(hweight64(request_value) != 1))
> + 		return domain->num_layers;
> + 
> + 	for (layer = domain->num_layers - 1; layer >= 0; layer--) {
> + 		u64 allowed;
> + 
> + 		if (!(domain->layers[layer].handled.permissions &
> + 		      permission_bit))
> + 			continue;
> + 
> + 		/*
> + 		 * Current callers pass only permission types with an explicit
> + 		 * case below.  The default catches a new caller missing its
> + 		 * member mask.
> + 		 */
> + 		switch (permission_bit) {
> + 		case LANDLOCK_PERMISSION_NAMESPACE_USE:
> + 			allowed = domain->layers[layer].allowed.ns_types;
> + 			break;
> + 		case LANDLOCK_PERMISSION_CAPABILITY_USE:
> + 			allowed = domain->layers[layer].allowed.caps;
> + 			break;
> + 		default:
> + 			WARN_ONCE(1, "Unknown permission %u\n",
> + 				  (unsigned int)permission_bit);
> + 			return layer + 1;
> + 		}
> + 
> + 		if (!(allowed & request_value))
> + 			return layer + 1;
> + 	}
> + 	return 0;
> + }
> + 
>   #endif /* _SECURITY_LANDLOCK_DOMAIN_H */


