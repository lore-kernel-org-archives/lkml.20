Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014080;
	b=mnorehMSu8gVFeJSb0R2tZCP6oeHVzDm71QT9bWt2Lu9TmqosWNYXuN3TKiKxpSMKSaZ
	 N5DxO67wZs+X2eesr4fOSX92vmOeQJXliUBLs05KNKKW0Z+AyZhwU8JR/bt5drMVvLk7c
	 pp87qVhpUky5Puyi2w+2aGGgE15MM3dskiJ6rwGgG1dd5oA62KD00SIVhZFp3lv4sKeg6
	 fi32HzkGeMRDytDYwpWE7tFFG+eEciM2qJI/A7ddfyhQqRc4bZLsGTuW/SwHYr2ayseTC
	 HmUevY5FnxDz5L/LT9Nu1FE1IPGshg2icPFc9K9JRXB2KO6qGVMpyRYVBN9eB80GIZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014080;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=XjcH+8ozQ0OtvBExYzwz/N97y/cZUV7XDXCgJnpVkeQ=;
	b=NpcmvooUTiD4SfK2T0UhtH9zQNYXY4V0aw5ho5Kfpro+/RU7yOz/vFM1BN4zY60Te7Me
	 a6ugGulYr74q81me+uMeiWbtEORlBUfuAo/2XejqciVTI72mkibdBVvk2YaLe9Ewte6iG
	 AYKSzZZMPKbbzbEDNz+Cz8j/2N/4oOGarCxm9Xt9JmbVfkVAp98+acrl8dJCD4/lPvFaL
	 tN5EuoN+2Rv0ncg5LCyq2+HnZhkWDjTsRlKHUvVZ7/Uj62UL/DkHfeM0JeTukD+FzH1Qf
	 IUiWpCOzvcA6S/kEC21NtNJyAP1X7p6I/1LBPBr+hZgpAkTT4reEBggW1knM5e880dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mclNBKeT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD478606A32F;
	Mon, 26 Oct 2026 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mclNBKeT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393E81F031E4;
	Mon, 26 Oct 2026 11:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793014079;
	bh=XjcH+8ozQ0OtvBExYzwz/N97y/cZUV7XDXCgJnpVkeQ=;
	h=Date:From:To:Cc:Subject;
	b=mclNBKeTfeA0EzhI37JcUjbelbvU1JdlcqM1EuXThSMc1KXWS7QJWskoEg+j7Hkax
	 C4KS2tKW0y9AbMfdTRcEstmYRACMllo9y9aTsnmenklv5a/0Gq1V9JNiLiQfnFqMXp
	 lYWmn0Gqdr+vHZS6nrtHQO4hWMe3xEcY9Uc4/5huYQCiMo5G/aTfJUjCTndlx8ORSx
	 iE4G8pBVWVFdv+hSLQLTbJLDHfgWqpVW7E3AdUqNCqGXqZiHkiCJMbRjZwWASeg+e/
	 ck+2FYW4zUOKgpebNdkQRB4fQsclKbxJmcv45khNdtdIOl125caG6MpggcIEm+ukk9
	 Rg2IMbgn9yKkQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6755F1AC5994; Mon, 26 Oct 2026 11:27:56 +0000 (GMT)
Date: Mon, 26 Oct 2026 11:27:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the origin tree
Message-ID: <at85PHp8XY92t-R8@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="+mvPS1a0JNMBLnEY"
Content-Disposition: inline


--+mvPS1a0JNMBLnEY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/trace_btf.h

between commit:

  3f942403bbad3 ("Merge tag 'probes-v7.4' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/trace/linux-trace")

=66rom the origin tree and commit:

  13d8f2241106d ("Merge remote-tracking branch 'ftrace/ftrace/for-next' int=
o trace/merge/for-next")

=66rom the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined kernel/trace/trace_btf.h
index b3d408e6a7f6c,54731bb4eab40..0000000000000
--- a/kernel/trace/trace_btf.h
+++ b/kernel/trace/trace_btf.h
@@@ -19,7 -19,6 +19,7 @@@ const struct btf_member *btf_find_struc
  						const char *member_name,
  						u32 *anon_offset,
  						const struct btf_type **container_type);
 +
  #ifdef CONFIG_DEBUG_INFO_BTF
  void btf_trim_retval(unsigned long func, unsigned long *retval, bool *pri=
nt_retval,
  		     int *fmt, bool hex);

--+mvPS1a0JNMBLnEY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat85PAAKCRAv73Ows9A4
iTOoAP4tcTLuoa1WoSYxPK+bKixSrX+iQ1BOs0iW2ZMpyUbnvwD7B2dFAY2+4oXP
C8HxkU1QKvlXSqsibL0KV3IgOQi/Ywo=
=tIoo
-----END PGP SIGNATURE-----

--+mvPS1a0JNMBLnEY--
