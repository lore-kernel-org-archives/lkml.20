Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E97643CE49;
	Mon, 14 Sep 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382322; cv=none; b=n/LmHrRT2ICAkaI2Sg8g6X+KNNnFf8l8bBmSG+P//5xS+zSf+zN4bItHArRbWgG8BbKqs4gAwPvGNkUOcSa4y/P0f5U7MeHvjqV5AFlCk44iOg0ZKdj5W8XLw9dD9PtVc3kw8tCEHM7gp509tVtfdm3dqAUTf0jbwag/8TXwz3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382322; c=relaxed/simple;
	bh=bKfaslvYjskhlKulN60lYhjibU84tLDstCJTDPVl+JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRvPcmauBIFJLGgHxXfQ9XBEdskZ849KR+an2jRynDVnTz+pcRiyaMr/udE/F9Kj2mZE3+x6OPjyy/Os7vnPD00Z04ziLby3MiZHFhf1a4rZ4wQhqh4GY5k/Xp88jEy3Jri6rFzvwHdwmAyK3W0FUOtQiNJDW/ijWUlPctJn71Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NslTLXcu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NslTLXcu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250BB1F000FF;
	Mon, 14 Sep 2026 10:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789382321;
	bh=TlsuXTLUgDOIrFz6wgywD26/5uJSv8hub4LANbqyj1c=;
	h=Date:From:To:Cc:Subject;
	b=NslTLXcu/5fDchRnPSa5dDo8uk9XHVXmSv+hWjvCDfwRCpgoq4JIg+8KHAm1urQNG
	 aHjWYPiv33jPCjytkt6sSktn78+SUr/ILyZmoCyNxdffujvBgIDVJDSAEIjBwLJVyJ
	 mbvYAFCqCBXzZBsELud0gD4K2MMdYi/SS0X1vLW+FYRDqOMwoJLCHHaJlZ3kWvVR+W
	 YhmxTTchgHMVD/zFbr+V8lHeIQJH85phOnEvBhwRSJcnwE4kFFZ9jIJGercT5U15Tr
	 aEqnzRjNQbLOV6ranOODNRSm966vE1nDtofLxdgL0i8D0SmhJT2Tzt+AXDDfLJeJXC
	 7g9P/Drh9PhqQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 98FD01AC52F1; Mon, 14 Sep 2026 11:38:38 +0100 (BST)
Date: Mon, 14 Sep 2026 11:38:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the
 origin tree
Message-ID: <aqfOrukDE6kT0cW9@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+NiAZ6CxlsRVwIeF"
Content-Disposition: inline


--+NiAZ6CxlsRVwIeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  init/main.c

between commit:

  7812d6dab0698 ("bootconfig: Fix integer overflow in initrd size check")

=66rom the origin tree and commits:

  5271eb8b27ac5 ("bootconfig: fix integer overflow in initrd size check")
  aeba8e66e7c7b ("bootconfig: move BOOTCONFIG_FOOTER_SIZE to include/linux/=
bootconfig.h")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined init/main.c
index 31f2bf54976ab,54bab27e0d8c7..0000000000000
--- a/init/main.c
+++ b/init/main.c
@@@ -278,7 -278,7 +278,7 @@@ static void * __init get_boot_config_fr
  	int i;
 =20
  	if (!initrd_end || initrd_end < initrd_start ||
- 	    initrd_end - initrd_start < BOOTCONFIG_MAGIC_LEN + 8)
+ 	    initrd_end - initrd_start < BOOTCONFIG_FOOTER_SIZE)
  		return NULL;
 =20
  	data =3D (char *)initrd_end - BOOTCONFIG_MAGIC_LEN;
@@@ -548,12 -548,12 +548,12 @@@ static int __init unknown_bootoption(ch
  		/* Environment option */
  		unsigned int i;
  		for (i =3D 0; envp_init[i]; i++) {
+ 			if (!strncmp(param, envp_init[i], len+1))
+ 				break;
  			if (i =3D=3D MAX_INIT_ENVS) {
  				panic_later =3D "env";
  				panic_param =3D param;
  			}
- 			if (!strncmp(param, envp_init[i], len+1))
- 				break;
  		}
  		envp_init[i] =3D param;
  	} else {
@@@ -581,7 -581,7 +581,7 @@@ static int __init init_setup(char *str
  	 * the shell think it should execute a script with such name.
  	 * So we ignore all arguments entered _before_ init=3D... [MJ]
  	 */
- 	for (i =3D 1; i < MAX_INIT_ARGS; i++)
+ 	for (i =3D 1; i <=3D MAX_INIT_ARGS; i++)
  		argv_init[i] =3D NULL;
  	return 1;
  }
@@@ -594,7 -594,7 +594,7 @@@ static int __init rdinit_setup(char *st
  	ramdisk_execute_command =3D str;
  	ramdisk_execute_command_set =3D true;
  	/* See "auto" comment in init_setup */
- 	for (i =3D 1; i < MAX_INIT_ARGS; i++)
+ 	for (i =3D 1; i <=3D MAX_INIT_ARGS; i++)
  		argv_init[i] =3D NULL;
  	return 1;
  }
@@@ -1349,6 -1349,57 +1349,57 @@@ static inline void do_trace_initcall_le
  }
  #endif /* !TRACEPOINTS_ENABLED */
 =20
+ extern struct initcall_modname __start_initcall_modnames[];
+ extern struct initcall_modname __stop_initcall_modnames[];
+=20
+ /* module_denylist is a comma-separated list of module names */
+ static char *module_denylist;
+ bool __init_or_module module_is_denylisted(const char *module_name)
+ {
+ 	const char *p;
+ 	size_t len;
+=20
+ 	if (!module_denylist)
+ 		return false;
+=20
+ 	for (p =3D module_denylist; *p; p +=3D len) {
+ 		len =3D strcspn(p, ",");
+ 		if (strlen(module_name) =3D=3D len && parameqn(module_name, p, len))
+ 			return true;
+ 		if (p[len] =3D=3D ',')
+ 			len++;
+ 	}
+ 	return false;
+ }
+ core_param(module_denylist, module_denylist, charp, 0400);
+ core_param(module_blacklist, module_denylist, charp, 0400);
+=20
+ static const char *__init get_builtin_modname(initcall_t fn)
+ {
+ 	struct initcall_modname *p;
+=20
+ 	for (p =3D __start_initcall_modnames; p < __stop_initcall_modnames; p++)=
 {
+ 		if (p->initcall_fn =3D=3D fn)
+ 			return p->modname;
+ 	}
+ 	return NULL;
+ }
+=20
+ static void __init do_one_initcall_builtin(initcall_t fn)
+ {
+ 	const char *modname;
+=20
+ 	if (module_denylist) {
+ 		modname =3D get_builtin_modname(fn);
+ 		if (modname && module_is_denylisted(modname)) {
+ 			pr_info("Skipping initcall for denylisted built-in module %s\n",
+ 				modname);
+ 			return;
+ 		}
+ 	}
+ 	do_one_initcall(fn);
+ }
+=20
  int __init_or_module do_one_initcall(initcall_t fn)
  {
  	int count =3D preempt_count();
@@@ -1421,7 -1472,7 +1472,7 @@@ static void __init do_initcall_level(in
 =20
  	do_trace_initcall_level(initcall_level_names[level]);
  	for (fn =3D initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
- 		do_one_initcall(initcall_from_entry(fn));
+ 		do_one_initcall_builtin(initcall_from_entry(fn));
  }
 =20
  static void __init do_initcalls(void)
@@@ -1466,7 -1517,7 +1517,7 @@@ static void __init do_pre_smp_initcalls
 =20
  	do_trace_initcall_level("early");
  	for (fn =3D __initcall_start; fn < __initcall0_start; fn++)
- 		do_one_initcall(initcall_from_entry(fn));
+ 		do_one_initcall_builtin(initcall_from_entry(fn));
  }
 =20
  static int run_init_process(const char *init_filename)
@@@ -1653,7 -1704,7 +1704,7 @@@ static noinline void __init kernel_init
  	 */
  	set_mems_allowed(node_states[N_MEMORY]);
 =20
 -	cad_pid =3D get_pid(task_pid(current));
 +	rcu_assign_pointer(cad_pid, get_pid(task_pid(current)));
 =20
  	smp_prepare_cpus(setup_max_cpus);
 =20

--+NiAZ6CxlsRVwIeF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqnzq0ACgkQJNaLcl1U
h9AkoAf/U+QSJlsPzBaVJcrle4NJR5aZMkD4MJsMswJ5U5pJTB6b5KiuPIsdk1Lc
dDvCVq1c3yzAccS/tU9B1LEukbZr2it1qDxW0PzQ7SSo/6MoehIdAopQC5K9x2Kq
e+9lYg/TkHQ5rfg8tWAoW69cqw2p5shvYSYK1YOsFl2nDtZoshkBzOZLafUYyRxi
MHpirVDVSqgKXQ9yGcHskrjP1Feq/5516K9pwiYE0urEbR0/SMy83wsenwxnohGU
URcdnMDVehdnyxNs60N5gGF9hUQhpayEoZA9yXAFgUxKxcQyoiu33RMROZOzZQLZ
05MZZw8TOeUtcTg5X0dGHgdV5ukchg==
=o8Pe
-----END PGP SIGNATURE-----

--+NiAZ6CxlsRVwIeF--
