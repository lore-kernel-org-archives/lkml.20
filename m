Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79636492D;
	Fri,  2 Oct 2026 23:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985443; cv=none; b=W86mjJbnbhqU2kWKR/6e9ht5X8a5V0WzyWE1skxapnA05ph0uXMtxPAOHhgTcm/yymT9cBnXdQiEjAwjjbQGT1JAmp6IWSQ4fHUp9dEPsBMBOHkuHvQAzwy8pH7AUJj692izRKunwDf/1H26DnkJzAuGDGfrTVp6OuJCu/BuPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985443; c=relaxed/simple;
	bh=MwHomMcaIGAJeLS0pirIgMQx72FkZGIMdR11bJ70Iy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkqNh3PY6wn5kKsfNZHRsXGIvlM7e7FBa3GZMwdeOnGyzgtCI5ea8BR5leHRS2d2r87HtMo8Rr5WNYrde54ma0BpVbVW2n1Zbt5B0KPJEyo0t0AFZ9Yvx4l32b8JRXujrd5l/9I2Ye44+CLpsRTqv15uDHKxjeZlyLc+t3asu/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjqucX5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjqucX5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537451F00893;
	Fri,  2 Oct 2026 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790985441;
	bh=27VM1RagX5aVBxyuC3IIh2m01meKNDgoljCXBPuEApc=;
	h=Date:From:To:Cc:Subject;
	b=JjqucX5z7/8T2/zg81YGhMdhhuG52Bfsn6odqwcvvWL6p+L5AfthZCiXO/VFCaThF
	 t27cvXi/3PMWaITzMTam6wXZJTAjaftD2sOsrUJ3soWgykDS55xUDbaVijWwWBvpKd
	 SKBeOgxKEiZjKnVgA/PAS04TjJIR2W88unX7D1oFI/IF8e/Pm5x/f3LdMYWDukMkSt
	 vQID4UMJ/LCY3VqBU9d8PYraQX4W6jLaMJ7xKE5vWTpZ5WHjZEWPhc/4YbeLYpS1Fa
	 E6HnriEg7pAlmCpB4Mn4pyUBpB5JC3sEiGuf3AhPhBPXdsjMU0zoB+vLSIvhJY/Mo7
	 dHx/Yhk2tN3YA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 19B611AC57CE; Sat, 03 Oct 2026 00:57:13 +0100 (BST)
Date: Sat, 3 Oct 2026 01:57:13 +0200
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the landlock tree with the jc_docs tree
Message-ID: <asBE2fWPEmruN_dj@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wyNCOcc/CS7CRyXw"
Content-Disposition: inline


--wyNCOcc/CS7CRyXw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the landlock tree got a conflict in:

  security/landlock/syscalls.c

between commit:

  2ef355c4e6864 ("docs: landlock: fix ENOMSG condition in create_ruleset ke=
rnel-doc")

=66rom the jc_docs tree and commit:

  dfec62ac8b246 ("landlock: Enforce namespace use restrictions")

=66rom the landlock tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined security/landlock/syscalls.c
index 400a2f928de31,fb5af318b69bb..0000000000000
--- a/security/landlock/syscalls.c
+++ b/security/landlock/syscalls.c
@@@ -20,6 -20,7 +20,7 @@@
  #include <linux/fs.h>
  #include <linux/limits.h>
  #include <linux/mount.h>
+ #include <linux/ns/ns_common_types.h>
  #include <linux/path.h>
  #include <linux/sched.h>
  #include <linux/sched/signal.h>
@@@ -30,11 -31,13 +31,13 @@@
  #include <linux/uaccess.h>
  #include <uapi/linux/landlock.h>
 =20
+ #include "cap.h"
  #include "cred.h"
  #include "domain.h"
  #include "fs.h"
  #include "limits.h"
  #include "net.h"
+ #include "ns.h"
  #include "ruleset.h"
  #include "setup.h"
  #include "tsync.h"
@@@ -98,7 -101,10 +101,10 @@@ static void build_check_abi(void
  	struct landlock_ruleset_attr ruleset_attr;
  	struct landlock_path_beneath_attr path_beneath_attr;
  	struct landlock_net_port_attr net_port_attr;
+ 	struct landlock_namespace_attr namespace_attr;
+ 	struct landlock_capability_attr capability_attr;
  	size_t ruleset_size, path_beneath_size, net_port_size;
+ 	size_t namespace_size, capability_size;
 =20
  	/*
  	 * For each user space ABI structures, first checks that there is no
@@@ -111,8 -117,9 +117,9 @@@
  	ruleset_size +=3D sizeof(ruleset_attr.quiet_access_fs);
  	ruleset_size +=3D sizeof(ruleset_attr.quiet_access_net);
  	ruleset_size +=3D sizeof(ruleset_attr.quiet_scoped);
+ 	ruleset_size +=3D sizeof(ruleset_attr.handled_permissions);
  	BUILD_BUG_ON(sizeof(ruleset_attr) !=3D ruleset_size);
- 	BUILD_BUG_ON(sizeof(ruleset_attr) !=3D 48);
+ 	BUILD_BUG_ON(sizeof(ruleset_attr) !=3D 56);
 =20
  	path_beneath_size =3D sizeof(path_beneath_attr.allowed_access);
  	path_beneath_size +=3D sizeof(path_beneath_attr.parent_fd);
@@@ -123,6 -130,18 +130,18 @@@
  	net_port_size +=3D sizeof(net_port_attr.port);
  	BUILD_BUG_ON(sizeof(net_port_attr) !=3D net_port_size);
  	BUILD_BUG_ON(sizeof(net_port_attr) !=3D 16);
+=20
+ 	namespace_size =3D sizeof(namespace_attr.permissions);
+ 	namespace_size +=3D sizeof(namespace_attr.allowed_namespace_types);
+ 	namespace_size +=3D sizeof(namespace_attr.quiet_namespace_types);
+ 	BUILD_BUG_ON(sizeof(namespace_attr) !=3D namespace_size);
+ 	BUILD_BUG_ON(sizeof(namespace_attr) !=3D 24);
+=20
+ 	capability_size =3D sizeof(capability_attr.permissions);
+ 	capability_size +=3D sizeof(capability_attr.allowed_capabilities);
+ 	capability_size +=3D sizeof(capability_attr.quiet_capabilities);
+ 	BUILD_BUG_ON(sizeof(capability_attr) !=3D capability_size);
+ 	BUILD_BUG_ON(sizeof(capability_attr) !=3D 24);
  }
 =20
  /* Ruleset handling */
@@@ -172,7 -191,7 +191,7 @@@ static const struct file_operations rul
   * If the change involves a fix that requires userspace awareness, also u=
pdate
   * the errata documentation in Documentation/userspace-api/landlock.rst .
   */
- const int landlock_abi_version =3D 11;
+ const int landlock_abi_version =3D 12;
 =20
  /**
   * sys_landlock_create_ruleset - Create a new ruleset
@@@ -197,14 -216,13 +216,13 @@@
   * returned errors are:
   *
   * - %EOPNOTSUPP: Landlock is supported by the kernel but disabled at boo=
t time;
-  * - %EINVAL: unknown @flags, or unknown access, or unknown scope, or too=
 small
-  *   @size;
+  * - %EINVAL: unknown @flags, access, scope, or permission, or too small =
@size;
   * - %EINVAL: quiet_access_fs, quiet_access_net, or quiet_scoped is not a
   *   subset of the corresponding handled_access_fs, handled_access_net, or
   *   scoped;
   * - %E2BIG: @attr or @size inconsistencies;
   * - %EFAULT: @attr or @size inconsistencies;
-  * - %ENOMSG: empty handled_access_fs, handled_access_net, and scoped fie=
lds.
+  * - %ENOMSG: all handled access, scope, and permission fields are empty.
   *
   * .. kernel-doc:: include/uapi/linux/landlock.h
   *     :identifiers: landlock_create_ruleset_flags
@@@ -273,16 -291,22 +291,22 @@@ SYSCALL_DEFINE3(landlock_create_ruleset
  	    ruleset_attr.scoped)
  		return -EINVAL;
 =20
+ 	/* Checks permission content (and 32-bits cast). */
+ 	if ((ruleset_attr.handled_permissions | LANDLOCK_MASK_PERMISSION) !=3D
+ 	    LANDLOCK_MASK_PERMISSION)
+ 		return -EINVAL;
+=20
  	/* Checks arguments and transforms to kernel struct. */
  	ruleset =3D landlock_create_ruleset(ruleset_attr.handled_access_fs,
  					  ruleset_attr.handled_access_net,
- 					  ruleset_attr.scoped);
+ 					  ruleset_attr.scoped,
+ 					  ruleset_attr.handled_permissions);
  	if (IS_ERR(ruleset))
  		return PTR_ERR(ruleset);
 =20
- 	ruleset->quiet_masks.fs =3D ruleset_attr.quiet_access_fs;
- 	ruleset->quiet_masks.net =3D ruleset_attr.quiet_access_net;
- 	ruleset->quiet_masks.scope =3D ruleset_attr.quiet_scoped;
+ 	ruleset->quiet_access.fs =3D ruleset_attr.quiet_access_fs;
+ 	ruleset->quiet_access.net =3D ruleset_attr.quiet_access_net;
+ 	ruleset->quiet_access.scope =3D ruleset_attr.quiet_scoped;
 =20
  	/*
  	 * Emits before anon_inode_getfd() installs the file descriptor, while
@@@ -377,12 -401,12 +401,12 @@@ static int add_rule_path_beneath(struc
  		return -ENOMSG;
 =20
  	/* Checks that allowed_access matches the @ruleset constraints. */
- 	mask =3D ruleset->handled_masks.fs;
+ 	mask =3D ruleset->layer.handled.fs;
  	if ((path_beneath_attr.allowed_access | mask) !=3D mask)
  		return -EINVAL;
 =20
  	/* Checks for useless quiet flag. */
- 	if (flags & LANDLOCK_ADD_RULE_QUIET && !ruleset->quiet_masks.fs)
+ 	if (flags & LANDLOCK_ADD_RULE_QUIET && !ruleset->quiet_access.fs)
  		return -EINVAL;
 =20
  	/* Gets and checks the new rule. */
@@@ -418,12 -442,12 +442,12 @@@ static int add_rule_net_port(struct lan
  		return -ENOMSG;
 =20
  	/* Checks that allowed_access matches the @ruleset constraints. */
- 	mask =3D ruleset->handled_masks.net;
+ 	mask =3D ruleset->layer.handled.net;
  	if ((net_port_attr.allowed_access | mask) !=3D mask)
  		return -EINVAL;
 =20
  	/* Checks for useless quiet flag. */
- 	if (flags & LANDLOCK_ADD_RULE_QUIET && !ruleset->quiet_masks.net)
+ 	if (flags & LANDLOCK_ADD_RULE_QUIET && !ruleset->quiet_access.net)
  		return -EINVAL;
 =20
  	/* Denies inserting a rule with port greater than 65535. */
@@@ -435,13 -459,164 +459,164 @@@
  					net_port_attr.allowed_access, flags);
  }
 =20
+ static int add_rule_namespace(struct landlock_ruleset *const ruleset,
+ 			      const void __user *const rule_attr,
+ 			      const u32 flags)
+ {
+ 	struct landlock_namespace_attr ns_attr;
+ 	access_mask_t mask;
+ 	u64 allowed_types, quiet_types;
+ 	int ret;
+=20
+ 	/*
+ 	 * Namespace rules support no add-rule flags.  In particular,
+ 	 * LANDLOCK_ADD_RULE_QUIET is filesystem/network only.
+ 	 */
+ 	if (flags)
+ 		return -EINVAL;
+=20
+ 	/* Copies raw user space buffer. */
+ 	ret =3D copy_from_user(&ns_attr, rule_attr, sizeof(ns_attr));
+ 	if (ret)
+ 		return -EFAULT;
+=20
+ 	/* Informs about useless rule: empty permissions. */
+ 	if (!ns_attr.permissions)
+ 		return -ENOMSG;
+=20
+ 	/*
+ 	 * The permissions selector must match
+ 	 * LANDLOCK_PERMISSION_NAMESPACE_USE.  The valid set is a single bit
+ 	 * today, so this is an exact match now; the check broadens to a subset
+ 	 * test once another supported permission is added.
+ 	 */
+ 	if (ns_attr.permissions !=3D LANDLOCK_PERMISSION_NAMESPACE_USE)
+ 		return -EINVAL;
+=20
+ 	/*
+ 	 * Checks that permissions match the ruleset constraints.  This also
+ 	 * makes quieting require the category to be handled.
+ 	 */
+ 	mask =3D landlock_get_permission_mask(ruleset);
+ 	if (!(mask & LANDLOCK_PERMISSION_NAMESPACE_USE))
+ 		return -EINVAL;
+=20
+ 	/*
+ 	 * Informs about useless rule: neither allows nor quiets anything.  A
+ 	 * quiet-only rule (empty allowed set) is legal.
+ 	 */
+ 	if (!ns_attr.allowed_namespace_types && !ns_attr.quiet_namespace_types)
+ 		return -ENOMSG;
+=20
+ 	/*
+ 	 * Stores only the namespace types this kernel knows about.  Unknown
+ 	 * bits are silently accepted for forward compatibility: user space
+ 	 * compiled against newer headers can pass new CLONE_NEW* flags without
+ 	 * getting EINVAL on older kernels.  Unknown bits have no effect because
+ 	 * no hook checks them.  The quiet bitmask suppresses logging of denials
+ 	 * attributed to this layer; see landlock_log_denial().
+ 	 */
+ 	allowed_types =3D ns_attr.allowed_namespace_types & CLONE_NS_ALL;
+ 	quiet_types =3D ns_attr.quiet_namespace_types & CLONE_NS_ALL;
+=20
+ 	mutex_lock(&ruleset->lock);
+ 	ruleset->layer.allowed.ns_types |=3D
+ 		landlock_ns_types_to_bits(allowed_types);
+ #ifdef CONFIG_SECURITY_LANDLOCK_LOG
+ 	ruleset->quiet_permission.ns_types |=3D
+ 		landlock_ns_types_to_bits(quiet_types);
+ #endif /* CONFIG_SECURITY_LANDLOCK_LOG */
+ #ifdef CONFIG_TRACEPOINTS
+ 	ruleset->version++;
+ #endif /* CONFIG_TRACEPOINTS */
+ 	trace_landlock_add_rule_namespace(ruleset, flags, ns_attr.permissions,
+ 					  allowed_types, quiet_types);
+ 	mutex_unlock(&ruleset->lock);
+ 	return 0;
+ }
+=20
+ static int add_rule_capability(struct landlock_ruleset *const ruleset,
+ 			       const void __user *const rule_attr,
+ 			       const u32 flags)
+ {
+ 	struct landlock_capability_attr cap_attr;
+ 	access_mask_t mask;
+ 	u64 allowed_caps, quiet_caps;
+ 	int ret;
+=20
+ 	/*
+ 	 * Capability rules support no add-rule flags.  In particular,
+ 	 * LANDLOCK_ADD_RULE_QUIET is filesystem/network only.
+ 	 */
+ 	if (flags)
+ 		return -EINVAL;
+=20
+ 	/* Copies raw user space buffer. */
+ 	ret =3D copy_from_user(&cap_attr, rule_attr, sizeof(cap_attr));
+ 	if (ret)
+ 		return -EFAULT;
+=20
+ 	/* Informs about useless rule: empty permissions. */
+ 	if (!cap_attr.permissions)
+ 		return -ENOMSG;
+=20
+ 	/*
+ 	 * The permissions selector must match
+ 	 * LANDLOCK_PERMISSION_CAPABILITY_USE.  The valid set is a single bit
+ 	 * today, so this is an exact match now; the check broadens to a subset
+ 	 * test once another supported permission is added.
+ 	 */
+ 	if (cap_attr.permissions !=3D LANDLOCK_PERMISSION_CAPABILITY_USE)
+ 		return -EINVAL;
+=20
+ 	/*
+ 	 * Checks that permissions match the ruleset constraints.  This also
+ 	 * makes quieting require the category to be handled.
+ 	 */
+ 	mask =3D landlock_get_permission_mask(ruleset);
+ 	if (!(mask & LANDLOCK_PERMISSION_CAPABILITY_USE))
+ 		return -EINVAL;
+=20
+ 	/*
+ 	 * Informs about useless rule: neither allows nor quiets anything.  A
+ 	 * quiet-only rule (empty allowed set) is legal.
+ 	 */
+ 	if (!cap_attr.allowed_capabilities && !cap_attr.quiet_capabilities)
+ 		return -ENOMSG;
+=20
+ 	/*
+ 	 * Stores only the capabilities this kernel knows about.  Unknown bits
+ 	 * are silently accepted for forward compatibility: user space compiled
+ 	 * against newer headers can pass new CAP_* bits without getting EINVAL
+ 	 * on older kernels.  Unknown bits have no effect because no hook checks
+ 	 * them.  The quiet bitmask suppresses logging of denials attributed to
+ 	 * this layer; see landlock_log_denial().
+ 	 */
+ 	allowed_caps =3D cap_attr.allowed_capabilities & CAP_VALID_MASK;
+ 	quiet_caps =3D cap_attr.quiet_capabilities & CAP_VALID_MASK;
+=20
+ 	mutex_lock(&ruleset->lock);
+ 	ruleset->layer.allowed.caps |=3D landlock_caps_to_bits(allowed_caps);
+ #ifdef CONFIG_SECURITY_LANDLOCK_LOG
+ 	ruleset->quiet_permission.caps |=3D landlock_caps_to_bits(quiet_caps);
+ #endif /* CONFIG_SECURITY_LANDLOCK_LOG */
+ #ifdef CONFIG_TRACEPOINTS
+ 	ruleset->version++;
+ #endif /* CONFIG_TRACEPOINTS */
+ 	trace_landlock_add_rule_capability(ruleset, flags, cap_attr.permissions,
+ 					   allowed_caps, quiet_caps);
+ 	mutex_unlock(&ruleset->lock);
+ 	return 0;
+ }
+=20
  /**
   * sys_landlock_add_rule - Add a new rule to a ruleset
   *
   * @ruleset_fd: File descriptor tied to the ruleset that should be extend=
ed
   *		with the new rule.
   * @rule_type: Identify the structure type pointed to by @rule_attr:
-  *             %LANDLOCK_RULE_PATH_BENEATH or %LANDLOCK_RULE_NET_PORT.
+  *             %LANDLOCK_RULE_PATH_BENEATH, %LANDLOCK_RULE_NET_PORT,
+  *             %LANDLOCK_RULE_NAMESPACE, or %LANDLOCK_RULE_CAPABILITY.
   * @rule_attr: Pointer to a rule (matching the @rule_type).
   * @flags: Must be 0 or %LANDLOCK_ADD_RULE_QUIET.
   *
@@@ -458,11 -633,21 +633,21 @@@
   *   &landlock_path_beneath_attr.allowed_access or
   *   &landlock_net_port_attr.allowed_access is not a subset of the ruleset
   *   handled accesses)
+  * - %EINVAL: A nonzero &landlock_namespace_attr.permissions is not
+  *   %LANDLOCK_PERMISSION_NAMESPACE_USE or is not handled by the ruleset;
+  * - %EINVAL: A nonzero &landlock_capability_attr.permissions is not
+  *   %LANDLOCK_PERMISSION_CAPABILITY_USE or is not handled by the ruleset;
   * - %EINVAL: &landlock_net_port_attr.port is greater than 65535;
   * - %EINVAL: LANDLOCK_ADD_RULE_QUIET is passed but the ruleset has no
   *   quiet access bits set for the corresponding rule type.
   * - %ENOMSG: Empty accesses (e.g. &landlock_path_beneath_attr.allowed_ac=
cess is
   *   0) and no flags;
+  * - %ENOMSG: &landlock_namespace_attr.permissions is 0, or both
+  *   &landlock_namespace_attr.allowed_namespace_types and
+  *   &landlock_namespace_attr.quiet_namespace_types are 0;
+  * - %ENOMSG: &landlock_capability_attr.permissions is 0, or both
+  *   &landlock_capability_attr.allowed_capabilities and
+  *   &landlock_capability_attr.quiet_capabilities are 0;
   * - %EBADF: @ruleset_fd is not a file descriptor for the current thread,=
 or a
   *   member of @rule_attr is not a file descriptor as expected;
   * - %EBADFD: @ruleset_fd is not a ruleset file descriptor, or a member of
@@@ -495,6 -680,10 +680,10 @@@ SYSCALL_DEFINE4(landlock_add_rule, cons
  		return add_rule_path_beneath(ruleset, rule_attr, flags);
  	case LANDLOCK_RULE_NET_PORT:
  		return add_rule_net_port(ruleset, rule_attr, flags);
+ 	case LANDLOCK_RULE_NAMESPACE:
+ 		return add_rule_namespace(ruleset, rule_attr, flags);
+ 	case LANDLOCK_RULE_CAPABILITY:
+ 		return add_rule_capability(ruleset, rule_attr, flags);
  	default:
  		return -EINVAL;
  	}

--wyNCOcc/CS7CRyXw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasBE1gAKCRAv73Ows9A4
iYUrAPwNeFPFXIl9kbQID3wwASyoM1Q6a/YcPsy7DJ0BMh0CPQEA22zF0ztbZpqE
+bpQyb40BZE9kNnt3cnkAPR4IaKB5wA=
=y19W
-----END PGP SIGNATURE-----

--wyNCOcc/CS7CRyXw--
