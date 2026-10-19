Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430517;
	b=kZDlRFB7wZTCmFEZg34w+nIzX7ZA2zMeblZzq/v1HiEub71hiV3gwaJq4vd+zFf7Eo9y
	 AIGUTkgCVBiF9y8QUViIRhylvqlK5Bg2myLtdBZ8bxpwVUM3pOSuWgTBUeSiKr6zaMBwk
	 TO4aHgSahESH/oA5huVSD9C0TCuOfIA3iW9LCfjYG6MCUTayjubESnOI5rssiyavoVkcq
	 w4nyXp83tlYZZQAIX37z18ZeHByRCLK86uVpddAje4QUA9sYH93thkuz91tu2csZjDBVn
	 H4H6GnPGyp+alfySNItt1OWhzcfVh7Ws9U+xNEnsswxAcJ/TNkLE4KQAylEZKHh/4Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430517;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=YnhbgzDHfjJjCqcyrS1FrJJWLDf/YJrC3wRl6eXptCU=;
	b=jcMJX5xbgUeg6YRduYkayUgyebsc6nUhAl4uyhqvi5xkTpxSoUIVP4dHhhZ5YETaavvv
	 inRTjGb8ivNms25MaiDk57+DY1YFgBnvJLxbGY0QbZUYuzrboX0JHUau7EYRahkoVg0Jy
	 FmDGwCsRhj0GiS6+s//x/iEzljSAnTJ/iSvclbh5Xspps7skWUhJN2yHx68C4MnmThnyT
	 LQefmpOZ9e6FWkorYNln7FjGSnRVRmw28JpV2/SN3nwfYtlQqxzGS4epy5PljKorSkTgi
	 EWdBlMzZfFfGooAxFQeE5CTU/zGg/HbvVtJFyr+wfX7kY5Cv6phe/ZaTDaJ5b1nsUkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MjxzoD/F";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8137606A31E;
	Mon, 19 Oct 2026 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MjxzoD/F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C87F1F000C4;
	Mon, 19 Oct 2026 17:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792430516;
	bh=YnhbgzDHfjJjCqcyrS1FrJJWLDf/YJrC3wRl6eXptCU=;
	h=Date:From:To:Cc:Subject;
	b=MjxzoD/FjYKVxixwKPTrkMfDIDXCxiIXXtBioandOp2+2UkU2Jxhjj8nlFrqkdiEo
	 WgytEmrqVES9dfH7a/XdEvkPd3DImw+x1RWoz12BgYil12/EFVY3UFwpFFr4xlBI4o
	 6gzkuRYS47u21SUMlGthtEvDs6Afq8oUNh0upHYLoN1PoEoYJZ6veVBsmj1qbc0sXa
	 fVu5oOxScd0w3zmEL5yUvHbwwb3wslDQimacVlyA6+s6snh+hMnaFpeK4luvtpfui3
	 LUWW20b3O+n0U1/SVHIiX3hrxIXojmqHG7upqL/biuQk2EddACD3NRcB3oF5SqjvnE
	 AHWOmYsCKeXSw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1ABC51AC57D0; Mon, 19 Oct 2026 18:21:54 +0100 (BST)
Date: Mon, 19 Oct 2026 18:21:54 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: linux-next: manual merge of the landlock tree with the origin tree
Message-ID: <atZRsj4ON6zuh9XN@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xN4T/1KF3IKm6A57"
Content-Disposition: inline


--xN4T/1KF3IKm6A57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the landlock tree got a conflict in:

  security/landlock/domain.h

between commit:

  3d8cc52db2f86 ("landlock: Drop __counted_by from landlock_domain.handled_=
masks")

=66rom the origin tree and commit:

  395c985dac578 ("landlock: Wrap per-layer access masks in struct layer_con=
fig")

=66rom the landlock tree.  I kept the __counted_by in the hope that the
refactoring helped the compiler figure out what's going on.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined security/landlock/domain.h
index 428c1d9890dbf,60e8eb2d6ac27..0000000000000
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@@ -130,10 -130,15 +130,15 @@@ struct landlock_hierarchy=20
  		 */
  		log_new_exec : 1;
  	/**
- 	 * @quiet_masks: Bitmasks of access that should be quieted (i.e. not
+ 	 * @quiet_access: Bitmasks of access that should be quieted (i.e. not
  	 * logged) if the related object is marked as quiet.
  	 */
- 	struct access_masks quiet_masks;
+ 	struct access_masks quiet_access;
+ 	/**
+ 	 * @quiet_permission: Per-member quiet bitmasks for permission types in
+ 	 * this layer.
+ 	 */
+ 	struct permission_masks quiet_permission;
  #endif /* CONFIG_SECURITY_LANDLOCK_LOG */
  };
 =20
@@@ -217,7 -222,7 +222,7 @@@ struct landlock_domain=20
  		 * @work_free: Enables to free a domain within a lockless
  		 * section.  This is only used by landlock_put_domain_deferred()
  		 * when @usage reaches zero.  The fields @usage, @num_layers and
- 		 * @handled_masks are then unused.
+ 		 * @layers are then unused.
  		 */
  		struct work_struct work_free;
  		struct {
@@@ -233,23 -238,16 +238,16 @@@
  			 */
  			u32 num_layers;
  			/**
- 			 * @handled_masks: Contains the subset of filesystem and
- 			 * network actions that are restricted by a domain.  A
- 			 * domain saves all layers of merged rulesets in a stack
- 			 * (FAM), starting from the first layer to the last one.
- 			 * These layers are used when merging rulesets, for user
- 			 * space backward compatibility (i.e. future-proof), and
- 			 * to properly handle merged rulesets without
- 			 * overlapping access rights.  These layers are set once
- 			 * and never changed for the lifetime of the domain.
- 			 *
- 			 * Not annotated with __counted_by(num_layers): clang
- 			 * miscomputes the counter address for a FAM nested in
- 			 * an anonymous struct within a union, which trips
- 			 * FORTIFY:
- 			 * https://github.com/llvm/llvm-project/pull/228309
+ 			 * @layers: Per-layer access configuration.  A domain
+ 			 * saves all layers of merged rulesets in a stack (FAM),
+ 			 * starting from the first layer to the last one.  These
+ 			 * layers are used when merging rulesets, for user space
+ 			 * backward compatibility (i.e. future-proof), and to
+ 			 * properly handle merged rulesets without overlapping
+ 			 * access rights.  These layers are set once and never
+ 			 * changed for the lifetime of the domain.
  			 */
- 			struct access_masks handled_masks[];
+ 			struct layer_config layers[] __counted_by(num_layers);
  		};
  	};
  };
@@@ -259,7 -257,7 +257,7 @@@ landlock_get_fs_access_mask(const struc
  			    const u16 layer_level)
  {
  	/* Handles all initially denied by default access rights. */
- 	return domain->handled_masks[layer_level].fs |
+ 	return domain->layers[layer_level].handled.fs |
  	       _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
  }
 =20
@@@ -267,14 -265,14 +265,14 @@@ static inline access_mask_
  landlock_get_net_access_mask(const struct landlock_domain *const domain,
  			     const u16 layer_level)
  {
- 	return domain->handled_masks[layer_level].net;
+ 	return domain->layers[layer_level].handled.net;
  }
 =20
  static inline access_mask_t
  landlock_get_scope_mask(const struct landlock_domain *const domain,
  			const u16 layer_level)
  {
- 	return domain->handled_masks[layer_level].scope;
+ 	return domain->layers[layer_level].handled.scope;
  }
 =20
  /**
@@@ -293,7 -291,7 +291,7 @@@ landlock_union_access_masks(const struc
 =20
  	for (layer_level =3D 0; layer_level < domain->num_layers; layer_level++)=
 {
  		union access_masks_all layer =3D {
- 			.masks =3D domain->handled_masks[layer_level],
+ 			.masks =3D domain->layers[layer_level].handled,
  		};
 =20
  		matches.all |=3D layer.all;
@@@ -329,4 -327,63 +327,63 @@@ static inline void landlock_get_domain(
  		refcount_inc(&domain->usage);
  }
 =20
+ /**
+  * landlock_permission_is_denied - Check if a permission request is denied
+  *
+  * @domain: The enforced domain.
+  * @permission_bit: The LANDLOCK_PERMISSION_* flag to check.  Must have
+  *                  exactly one bit set.
+  * @request_value: Compact bitmask to look for (e.g. the result of
+  *                 landlock_ns_type_to_bit()).  Must have exactly one bit=
 set.
+  *
+  * Iterate from the youngest layer to the oldest.  For each layer that ha=
ndles
+  * @permission_bit, check whether @request_value is present in the layer's
+  * allowed bitmask.  Return on the first (youngest) denying layer.
+  *
+  * Return: The youngest denying layer + 1, or 0 if allowed.
+  */
+ static inline size_t
+ landlock_permission_is_denied(const struct landlock_domain *const domain,
+ 			      const access_mask_t permission_bit,
+ 			      const u64 request_value)
+ {
+ 	ssize_t layer;
+=20
+ 	BUILD_BUG_ON(sizeof(permission_bit) > sizeof(u32));
+=20
+ 	if (WARN_ON_ONCE(hweight32(permission_bit) !=3D 1) ||
+ 	    WARN_ON_ONCE(hweight64(request_value) !=3D 1))
+ 		return domain->num_layers;
+=20
+ 	for (layer =3D domain->num_layers - 1; layer >=3D 0; layer--) {
+ 		u64 allowed;
+=20
+ 		if (!(domain->layers[layer].handled.permissions &
+ 		      permission_bit))
+ 			continue;
+=20
+ 		/*
+ 		 * Current callers pass only permission types with an explicit
+ 		 * case below.  The default catches a new caller missing its
+ 		 * member mask.
+ 		 */
+ 		switch (permission_bit) {
+ 		case LANDLOCK_PERMISSION_NAMESPACE_USE:
+ 			allowed =3D domain->layers[layer].allowed.ns_types;
+ 			break;
+ 		case LANDLOCK_PERMISSION_CAPABILITY_USE:
+ 			allowed =3D domain->layers[layer].allowed.caps;
+ 			break;
+ 		default:
+ 			WARN_ONCE(1, "Unknown permission %u\n",
+ 				  (unsigned int)permission_bit);
+ 			return layer + 1;
+ 		}
+=20
+ 		if (!(allowed & request_value))
+ 			return layer + 1;
+ 	}
+ 	return 0;
+ }
+=20
  #endif /* _SECURITY_LANDLOCK_DOMAIN_H */

--xN4T/1KF3IKm6A57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZRsQAKCRAv73Ows9A4
iaSgAQCzRo/Zf/C54dI4vIYHAxVjMnX87RAoKTrdNvAMm+UY8wD+P/MsFRmLF/aD
ApZACfNsMehLWZnX4tu1YePDNkZUogw=
=ZPD4
-----END PGP SIGNATURE-----

--xN4T/1KF3IKm6A57--
