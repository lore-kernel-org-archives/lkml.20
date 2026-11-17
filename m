Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920496;
	b=VmdC3cnCF6JbBMGLycaTJlvZpi2qHCElKVct85Lkimv5KFFAXjJFbBnSnppcWvcgwHEc
	 jklFQIwp/W3Ddlww+lTuvnKUgVxDZyu/WI2nw2Iq/vdmhpGpfmxlwZRFe9BKzQl1Jt7ad
	 RmeZiBV+sjup94VWBMarUsNpSfsbruiVK+KnNHx3xtOEykgJqUsEmQJUCnJhwaX9bpRfP
	 gtK1hZu+yh4AM8Zc4eeHVeyJC3dxwQNPvWdVQabUY0iXXBwjgFmMFdOFELkSTzmHkMfVG
	 +eM4zJ33vbZtVtN0NkuOj/ii4TiAZjSDhx1kQe2q3Bv8RwU5ouQJkNDl6M5Vg+8ckXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920496;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=+eR9Gpe6KlxQLeknLXAzXGqSX8WKsEweVXsfgaLVexg=;
	b=Xt/yecmjRDwsH4rccxRO7IvICHPUJxMtDy195mkV7fwYKNzNYoFatbUwljyaoh7L65a2
	 uGPsss3NzDcw26KmmutryTl/n255AczyfzGxa13eNurgDeUKYjNxVr8Cm1eImDVaIL/BN
	 ptURkkFrPbwm/oSAoPRw+okYewECCCtrcRcRNaeUY32Z9tl/kBUDw96pNch3n2qT3IDfv
	 7zmK9dNoPT3a8PC0tLRiRld3RhaUmmmOJio2xTrGFCFucradW5TFePMPY7apHr/8tEI1R
	 PPa8WeImRAcVNSbwpaSKu52lsFiBuUt6UTvgLLzcFj0DAFKdhvhfehAE1uGOm3G0vVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2y0S0gW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78AE606A335;
	Tue, 17 Nov 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2y0S0gW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CC61F000C8;
	Tue, 17 Nov 2026 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920496;
	bh=+eR9Gpe6KlxQLeknLXAzXGqSX8WKsEweVXsfgaLVexg=;
	h=Date:From:To:Cc:Subject;
	b=G2y0S0gWw43WcNiqDW/WnbF+6tfUC3FqtY21Iv3WVSfgeH0KPkro2uhIuWZYOmL6X
	 exsOuFh0PKRiDspyh38n7dhTyoJPx1FWkTR1mJizI4f/aZoIyPj4xGWRYKFMkBE1xp
	 BVGYA+dYLn1BNp1L51ora06shidQM4qMumeBQYTGt3iMb5p8h1e9t74GkXFMv3CnmN
	 vk6mDXaQf+P1+Dq6PwLDrMW/hrxCYNGIky0jJJaSp1csk/0sqAaonrGHRuu2s1z+cf
	 //XdzJCElhwFx9kJg4q7WSHSot8I3ErjjdgKKTzNBPHU1+iTovO9fWXNX4x5/NFX/+
	 p1x3BWTqEfvCA==
Date: Tue, 17 Nov 2026 13:01:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the origin tree
Message-ID: <avxQLGt-FR3f7pEW@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="7dva2iJBWEU9JtZv"
Content-Disposition: inline


--7dva2iJBWEU9JtZv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  kernel/trace/trace_uprobe.c

between commit:

  72d3a5cb0cd73 ("tracing/probes: Enable newly appended probe when target e=
vent is enabled")

=66rom the origin tree and commit:

  44e16d22295bd ("tracing/uprobes: handle errors from resolving the real in=
ode")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/trace/trace_uprobe.c
index fb7991543db7d,34cd4392decfd..0000000000000
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@@ -447,29 -444,8 +448,34 @@@ static bool trace_uprobe_has_same_uprob
  	return false;
  }
 =20
 +typedef bool (*filter_func_t)(struct uprobe_consumer *self, struct mm_str=
uct *mm);
 +
 +#ifdef CONFIG_PERF_EVENTS
 +static bool uprobe_perf_filter(struct uprobe_consumer *uc, struct mm_stru=
ct *mm);
 +#else
 +#define uprobe_perf_filter NULL
 +#endif
 +
 +static int trace_uprobe_enable(struct trace_uprobe *tu, filter_func_t fil=
ter)
 +{
- 	struct inode *inode =3D d_real_inode(tu->path.dentry);
++	struct inode *inode;
 +	struct uprobe *uprobe;
 +
++	inode =3D d_real_data_inode(tu->path.dentry);
++	if (IS_ERR(inode))
++		return PTR_ERR(inode);
++
 +	tu->consumer.filter =3D filter;
 +	uprobe =3D uprobe_register(inode, tu->offset, tu->ref_ctr_offset, &tu->c=
onsumer);
 +	if (IS_ERR(uprobe))
 +		return PTR_ERR(uprobe);
 +
 +	tu->uprobe =3D uprobe;
 +	return 0;
 +}
 +
- static int append_trace_uprobe(struct trace_uprobe *tu, struct trace_upro=
be *to)
+ static int append_trace_uprobe(struct trace_uprobe *tu, struct trace_upro=
be *to,
+ 			       struct inode *inode)
  {
  	int ret;
 =20

--7dva2iJBWEU9JtZv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8UCsACgkQJNaLcl1U
h9BVCgf/dLQdDiwBID6uDLPVwmz7DY2T7pSrRtUwwvzNhpq2vV1XAaktpayyoa0g
Ba44snhkI52gS2c1bdUsr74YuWdXd2H3R4HrrmNRUBcDjvFwpT0rN8iumJNWV0n4
YSB0UvrQnxEfkGbmqctlv1ee8u6hBjhSt9Ev+kC2iWtpU+yxilzMIuXW8ud9m78E
IBeqlx5H9ab0RvzptAzP0cuWMTvjKDajjxk/fGnl1Kg8DNifX5pPKDX+Ii+8Uu9Z
moqiqjGtfDOdO71ankq8bLmU4ed5qhYg9y6QrJiknbPGz2e3wncOsLPuoaBGRDW/
bJzShtT+l2nKsAVkPmQPLSYhNvJ3Tg==
=Pr35
-----END PGP SIGNATURE-----

--7dva2iJBWEU9JtZv--
