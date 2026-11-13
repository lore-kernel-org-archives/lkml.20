Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580950;
	b=a6kjJLe/uP8JkVJgnN4l2wuJCJKDSJU8hpYJVeruSnel7kfom08+bcrs0JTQhz1hG4c3
	 9b9xyyJxTY+ALLC7xbZQHLe8ywJ5hTkO/ekSNq+ZplTz/ICGK4IOsLutcLrDJ3cl8irHQ
	 6Gm191s6YLuuqBjNk+M6k02DcA9JtnQ4ZoOimua79vmZNQCzGf/Tf93P2335DN3dX68tC
	 z5BlL9Rq2C1ySXEuQga1hG/P+fOG9UhuPKCb6j8G/uFSUSN5Y/O1Bvo3qyqDNiP/SwgQQ
	 8xq7QFiElE1nDpSlyAJs9TdJDu2vXmVm/uZjM3Oppd1Y54+3FGU6zxzBoz5HVVTYyTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580950;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Bx5JSIj4taaYF57uIG81WZuKix9lw9kbm56fQE4YOhg=;
	b=U48DYVtACcOf5xtCitn2mM5wIDR+W7vmKX69+NHaye4bysqEFfzE3py4ewTL8vp+cDxH
	 7AjxbwxCBDFq40nwRI+uiuPBLeuAYuoHOrjfkdiED+JugcrdMkvwx6g0tR/QgxV+4+AnV
	 kSkqOaiLjwXRxW+/qUm00cDDgHxcnKdpz88O84Tk48TSYHU+N+kCINAc1wrKLT8AfRgnV
	 jyW7JH+EhjwlWmnQhAh0CuZ8o1wt+aftPcRpYejV3ov5a8ICIpqfdlt7w9OjHThMb07bx
	 DoT6sKfB+bm+RfX6FZ3uhllzvVjZdlCxxUJ9XLH0tTkYyp441fULbKF6mKG8DE5EsIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iwPpLg8k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790EB606A32D;
	Fri, 13 Nov 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iwPpLg8k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA601F000C7;
	Fri, 13 Nov 2026 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580950;
	bh=Bx5JSIj4taaYF57uIG81WZuKix9lw9kbm56fQE4YOhg=;
	h=Date:From:To:Cc:Subject;
	b=iwPpLg8keaB1k9ef6yh4iyY8CXXuNq6f+yxhPAmsLbkoRlhDZdLFKuxyT6FWsyEXj
	 SYsYJ9sg5O3gB8CoSddumpkoweapMSClhriJyNWZt/8gGCRyVKW3AIjvahVzVjQ20R
	 Vp3+8seStKnpqG2Q1oPX2CQOCLFyZi9CBBs2ay33UmGyi+VhEQy1GcvWKk5UMxzf/o
	 bXdK88Kuu/y05g046wXbp4kGhT8qFfrTSPJaaqUHxtAO5j//w3FBsi+9ek7eTrk6hJ
	 i/7HwQH6WhKzPA9e8cU0H6EfRek3LIy7HmmG8f8ELM5Yb658FrxhU0TtM2IvMvzV56
	 jte1vF+dlRNLQ==
Date: Fri, 13 Nov 2026 14:42:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <masneyb@kernel.org>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the clk tree with the origin tree
Message-ID: <avch0WAFqmKQHd_1@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="R3xg1ru6BtpYPMXW"
Content-Disposition: inline


--R3xg1ru6BtpYPMXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/socfpga/clk-s10.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  51805c5218c7e ("clk: socfpga: stratix10: register the SP timer clocks ear=
ly")

=66rom the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/clk/socfpga/clk-s10.c
index aad66f8d069d2,1976789b5166a..0000000000000
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@@ -382,33 -397,112 +397,111 @@@ static int s10_clk_register_pll(const s
  	return 0;
  }
 =20
- static int s10_clkmgr_init(struct platform_device *pdev)
+ static struct stratix10_clock_data *s10_clk_data;
+=20
+ static struct stratix10_clock_data *s10_clk_data_alloc(void __iomem *base)
  {
- 	struct device_node *np =3D pdev->dev.of_node;
- 	struct device *dev =3D &pdev->dev;
  	struct stratix10_clock_data *clk_data;
- 	void __iomem *base;
- 	int i, num_clks;
+ 	int i;
 =20
- 	base =3D devm_platform_ioremap_resource(pdev, 0);
- 	if (IS_ERR(base)) {
- 		pr_err("%s: failed to map clock registers\n", __func__);
- 		return PTR_ERR(base);
- 	}
-=20
- 	num_clks =3D STRATIX10_NUM_CLKS;
- 	clk_data =3D devm_kzalloc_flex(dev, *clk_data, clk_data.hws, num_clks);
 -	clk_data =3D kzalloc(struct_size(clk_data, clk_data.hws, STRATIX10_NUM_C=
LKS),
 -			   GFP_KERNEL);
++	clk_data =3D kzalloc_flex(*clk_data, clk_data.hws, STRATIX10_NUM_CLKS);
  	if (!clk_data)
- 		return -ENOMEM;
+ 		return NULL;
 =20
  	clk_data->base =3D base;
- 	clk_data->clk_data.num =3D num_clks;
+ 	clk_data->clk_data.num =3D STRATIX10_NUM_CLKS;
 =20
- 	for (i =3D 0; i < num_clks; i++)
- 		clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
+ 	for (i =3D 0; i < STRATIX10_NUM_CLKS; i++)
+ 		clk_data->clk_data.hws[i] =3D ERR_PTR(-EPROBE_DEFER);
 =20
+ 	return clk_data;
+ }
+=20
+ static void s10_clk_register_early(struct stratix10_clock_data *clk_data)
+ {
  	s10_clk_register_pll(s10_pll_clks, ARRAY_SIZE(s10_pll_clks), clk_data);
 =20
+ 	s10_clk_register_c_perip(s10_early_perip_c_clks,
+ 				 ARRAY_SIZE(s10_early_perip_c_clks), clk_data);
+=20
+ 	s10_clk_register_cnt_perip(s10_early_perip_cnt_clks,
+ 				   ARRAY_SIZE(s10_early_perip_cnt_clks),
+ 				   clk_data);
+=20
+ 	s10_clk_register_gate(s10_early_gate_clks,
+ 			      ARRAY_SIZE(s10_early_gate_clks), clk_data);
+ }
+=20
+ /*
+  * The registered clocks keep using the mapping and clk_data, so neither =
is
+  * released once the early clocks have been registered.
+  */
+ static int s10_clkmgr_setup(struct device_node *np)
+ {
+ 	struct stratix10_clock_data *clk_data;
+ 	void __iomem *base;
+=20
+ 	base =3D of_iomap(np, 0);
+ 	if (!base) {
+ 		pr_err("%s: failed to map clock registers\n", __func__);
+ 		return -ENOMEM;
+ 	}
+=20
+ 	clk_data =3D s10_clk_data_alloc(base);
+ 	if (!clk_data) {
+ 		iounmap(base);
+ 		return -ENOMEM;
+ 	}
+=20
+ 	s10_clk_register_early(clk_data);
+ 	s10_clk_data =3D clk_data;
+=20
+ 	return 0;
+ }
+=20
+ static int s10_clkmgr_add_provider(struct device_node *np)
+ {
+ 	static bool added;
+ 	int ret;
+=20
+ 	if (added)
+ 		return 0;
+=20
+ 	ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
+ 				     &s10_clk_data->clk_data);
+ 	if (ret)
+ 		return ret;
+=20
+ 	added =3D true;
+=20
+ 	return 0;
+ }
+=20
+ static void __init s10_clkmgr_early_init(struct device_node *np)
+ {
+ 	if (s10_clkmgr_setup(np))
+ 		return;
+=20
+ 	if (s10_clkmgr_add_provider(np))
+ 		pr_err("%s: failed to add clock provider\n", __func__);
+ }
+=20
+ CLK_OF_DECLARE_DRIVER(stratix10_clkmgr, "intel,stratix10-clkmgr",
+ 		      s10_clkmgr_early_init);
+=20
+ static int s10_clkmgr_init(struct platform_device *pdev)
+ {
+ 	struct stratix10_clock_data *clk_data;
+ 	int i, ret;
+=20
+ 	if (!s10_clk_data) {
+ 		ret =3D s10_clkmgr_setup(pdev->dev.of_node);
+ 		if (ret)
+ 			return ret;
+ 	}
+=20
+ 	clk_data =3D s10_clk_data;
+=20
  	s10_clk_register_c_perip(s10_main_perip_c_clks,
  				 ARRAY_SIZE(s10_main_perip_c_clks), clk_data);
 =20

--R3xg1ru6BtpYPMXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3IdEACgkQJNaLcl1U
h9D5Sgf/br1IrC5Ga/GctaBdJ+Shz230XXIgTF8GfCl9sStLxMr64FC3qNS3Q1CZ
ZtJwKjUT9NeCm+tBXbYP6CcMBTehLNzlJcBxblGGM6SE6uYv5HfaYgJNXlxOmtlo
fJWf5ZyxpOEy4L3bEQKuHKdcXAHDqeH7OdHSL7XNJ2PdqiKVC1QMZGv9b3ezL0Xe
JFsd109wkXEBPKbA4ZnCqtw2Dn/YUXCqskjW5h7AGQj4gaptsrWdmKcupg0WE+CT
lRYhytx2N8/WBBwgSH9NO0OC/tunbT01CU8aYuRnltCuvQ3eCIp4a9QiZY8OVYGN
3nM3i+IO4qy2cnZn0ghbUqMdlfWTQA==
=NidW
-----END PGP SIGNATURE-----

--R3xg1ru6BtpYPMXW--
