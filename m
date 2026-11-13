Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580744;
	b=UqhRy+A8DHDBmehWuDXmaNTl7ZBGpPAG2MtrxGpzjP6mBwWAEHCO4Fx/md9NMPfJCJDQ
	 9YDs1BWJ8iy+QdhBZcH+jqpptWG9omua8J+FSbxa4mF3xqJJ1Cb+jAks1L4uH0XP8iHXu
	 nC7pb3coRhf6WzJBDg3B0ljLQDDe7Utot1mHRRqXqI/73LAwLGz/wx+xSlTLnllUF8pSi
	 BIdam8i3yS5ej0qKedp9gjUuB2bHgiNpuY59aQJWmrQ0NE+68qHHw4SaE01ZApYzwiYfa
	 /gIeFWWqtheju/5g27v3eyDLwzaDPXfL4ggTc+uIrAXnf77TQN9V/+7jJPZW//R6eow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580744;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=e55LSHi9F4lDyZfsnabl+ks8bCCeyRdIj1HZ58KJH9k=;
	b=T68+d4FxVx3wIlZNWgN2GnI5c/BYZEKH4sjrj718asS5gKSQiOWUfONgC53ALfl63Abu
	 E40nn2bgJS34oEkFa/l39zmucLMTNVtDw+UxcgrL0fC0bzHdT8gzvjyaj5vdmPdHR/TlO
	 eFMPT82WccdKCaOz8eKIdXx4V43maA8Xy75aQIf2jYfP/5a8920qRvApXLgQOWcD+nGSG
	 8ZysoCurt4OmXa/d2+O0WP4njqujvvwg/z5FICAa0F1IhPi2FIQK09InXGMfDnUiq4Um1
	 E5ONm1t4KirBGW4UmqxEnkTkT5BeRPMVsDwRGFjGQbN0n0iTu9LJPVVYJ7UOoSTA3gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fG85MdoD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065F606A32E;
	Fri, 13 Nov 2026 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fG85MdoD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088331F000C4;
	Fri, 13 Nov 2026 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580743;
	bh=e55LSHi9F4lDyZfsnabl+ks8bCCeyRdIj1HZ58KJH9k=;
	h=Date:From:To:Cc:Subject;
	b=fG85MdoDcqoU/wCWfpRALCcKQt2hQ8V569XwJfcZFjuoCUm2hGguCRD4VBBPslY5n
	 BSbtoEysd19EkVQ7TP6LMIbUZWYawB0kUHpK3Af+FmT5O0ENcfb4aq9o5PBsVL7eT/
	 yazEYArFKO9R7NkJ7PsuvEU7eA6Un7Q/zfchbZuinYl2yXCvHZpQORp/7WKgmo4Jdw
	 AsSZEQwiY+hU0MQNUxN6rkyJIi24N4VKZcQLGbC2QksRZuAUczH4d3nUZa/KJP23Fd
	 K5WVQ0JkGuTJ5VBJE1amNR0PFiYkAazIT9HwWhB1bwfG4aLmjmKPO4w/2TsQetK06v
	 hx3gmByhYQ1SA==
Date: Fri, 13 Nov 2026 14:38:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <masneyb@kernel.org>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the clk tree with the origin tree
Message-ID: <avchA_vEhWRUv46A@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="0+gZhmE9s64dsjkL"
Content-Disposition: inline


--0+gZhmE9s64dsjkL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/socfpga/clk-agilex5.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  a13f8c1e4afca ("clk: socfpga: agilex5: register the SP timer clocks early=
")

=66rom the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/clk/socfpga/clk-agilex5.c
index 572fbb4192845,50dba11ab45ec..0000000000000
--- a/drivers/clk/socfpga/clk-agilex5.c
+++ b/drivers/clk/socfpga/clk-agilex5.c
@@@ -486,30 -501,29 +501,28 @@@ static int agilex5_clk_register_pll(con
  	return 0;
  }
 =20
- static int agilex5_clkmgr_init(struct platform_device *pdev)
+ static struct stratix10_clock_data *agilex5_clk_data;
+=20
+ static struct stratix10_clock_data *agilex5_clk_data_alloc(void __iomem *=
base)
  {
- 	struct device_node *np =3D pdev->dev.of_node;
- 	struct device *dev =3D &pdev->dev;
  	struct stratix10_clock_data *clk_data;
- 	void __iomem *base;
- 	int i, num_clks;
+ 	int i;
 =20
- 	base =3D devm_platform_ioremap_resource(pdev, 0);
- 	if (IS_ERR(base))
- 		return PTR_ERR(base);
-=20
- 	num_clks =3D AGILEX5_NUM_CLKS;
-=20
- 	clk_data =3D devm_kzalloc_flex(dev, *clk_data, clk_data.hws, num_clks);
 -	clk_data =3D kzalloc(struct_size(clk_data, clk_data.hws, AGILEX5_NUM_CLK=
S),
 -			   GFP_KERNEL);
++	clk_data =3D kzalloc_flex(*clk_data, clk_data.hws, num_clks);
  	if (!clk_data)
- 		return -ENOMEM;
+ 		return NULL;
 =20
  	clk_data->base =3D base;
- 	clk_data->clk_data.num =3D num_clks;
+ 	clk_data->clk_data.num =3D AGILEX5_NUM_CLKS;
 =20
- 	for (i =3D 0; i < num_clks; i++)
- 		clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
+ 	for (i =3D 0; i < AGILEX5_NUM_CLKS; i++)
+ 		clk_data->clk_data.hws[i] =3D ERR_PTR(-EPROBE_DEFER);
 =20
+ 	return clk_data;
+ }
+=20
+ static void agilex5_clk_register_early(struct stratix10_clock_data *clk_d=
ata)
+ {
  	agilex5_clk_register_pll(agilex5_pll_clks, ARRAY_SIZE(agilex5_pll_clks),
  				 clk_data);
 =20

--0+gZhmE9s64dsjkL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3IQIACgkQJNaLcl1U
h9CN/gf+PjeFOCposrHAhVJBR4woLnStTG9cjD+UeDibKwn/xbjvBCFlxCY6j7xq
+YnJVd6/Vm4Jgo0mqsKePFjHQ7zEjgToATiSgSXk7oq2Al4rB+LovwvVPWiNtPnD
jKoUIw/Fbisz3uLxhLn7/b+oFbS816UpkrQeUcmldNA7pwwSA8m728hWXUh+M78d
lyea9M2eI2J8u8LlDYSou1NBCg3fy4kL2IrryF2HFegEp0r0IrHGkly7Z7ISXMjq
vVDKFhvrLG5qffxSHtnBlZh1dm36g/K7kbHnxMSgy5wjyisURSPdiPdAFNjR+AP8
VL4xk/ZT4tQtXMbeUkSU7Y6FS8f0OA==
=mFNT
-----END PGP SIGNATURE-----

--0+gZhmE9s64dsjkL--
