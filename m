Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580727;
	b=Lw/X2Im+j6KGzAyVSzxugCbY+lPBZsVts2TiB4eMhz8xA7xS/5Iu8pnZ7S+0daggiScE
	 uHCBs/bHlUHbgc6NdtHHqTx9p6CvpyK+cGb2wRmCc19xwpACAvTudQkEusRV5HCSRRaqg
	 pQl2PnIOP8Uh6TgcVW41gGfqEEvyvQCNndGeAxc6D+YR6tuqkMhwmt0MFzAQwWAho+N9H
	 aGe5KXYqJEK8bLVQw7qQN9AsIrZLqQdqgdRhd1YBnxNeQlFPVrYdEN5/l3S7ZYWkreXOS
	 MudVJ2Uz2kcEkxvvtC/lBC7vAfrnBaH4QghzKM7ChiXDSTn2OocBFOh//EUKEJGO/zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580727;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=bd+MnsWaafBvoeddMR/ju46S5+pnRf2ye93uIRHVHlY=;
	b=Uj4SNmqQntk1Uun711DSJnzzZorT+xglZyhVuoDGFHLDFDLFKmD4RVOLXoJjP1MjQFzP
	 e6vsq0BMaPDhgyFUbcab5BFubduxjrps/jl4S/AXLzTI9EOcXcP9+PWZG/JJqx7PtEstj
	 vSS31deESOPhczeSEQoY0I6fMekoAFJXwiALkb1Xsnv1QxapoALl/GiEs5s9Xns4DJQK1
	 K/TGWyn2HVdJvmjp4ni8xXrE7OeEN6CvnxgJouNf8YBt3/9VtJ/ya1mNz3p1OgYvetsFE
	 sCMFps8IILSrw2ztSh3XcTuWdBnq+v/mvrVTMr4AekMN4TNA5Ws3+XUhVmzJZyMQoaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEkqMQuD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8BF606A33B;
	Fri, 13 Nov 2026 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEkqMQuD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19F41F000C8;
	Fri, 13 Nov 2026 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580726;
	bh=bd+MnsWaafBvoeddMR/ju46S5+pnRf2ye93uIRHVHlY=;
	h=Date:From:To:Cc:Subject;
	b=XEkqMQuDx/xMpuxcUjduqBFYq9E2NwIaBQPSfxeUzgnOR77sR5X/I4S5Gx8xFbuke
	 goFTCCJES7k6bLT/IBDmuZRk5OVTempa3KpxoOWC0Ywx8/brSWtdwvm+FGevJr49XO
	 fuVLy/HPf0rAPuxm0vjGcJ1ljM+E3w7mpNIw+RLjWzbZAV1Y5+iLbIRCdzWxT7PXPW
	 Ion4xuJmINJhhneVXGUxD2PlDQ743sw7iMcCQZhB3tS+XEvLewQb3PYvfsfDAlSJ4N
	 1OY+z0qyU28mcuIuuqPYHrhP4XBwJW6sT38grnB24bcd2eIBsvXG83tuHANjJ25Ta6
	 giAPc7gEMLeyg==
Date: Fri, 13 Nov 2026 14:38:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <masneyb@kernel.org>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the clk tree with the origin tree
Message-ID: <avcg8idxqPxoVmxw@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="AVWuBmSGffOcuXjz"
Content-Disposition: inline


--AVWuBmSGffOcuXjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/socfpga/clk-agilex.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  0b95e3ec699a8 ("clk: socfpga: agilex: register the SP timer clocks early")

=66rom the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

This just throws away Kees' change.

diff --combined drivers/clk/socfpga/clk-agilex.c
index 3d4d9f35b927e,445d814e2f3ac..0000000000000
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@@ -5,6 -5,7 +5,7 @@@
  #include <linux/slab.h>
  #include <linux/clk-provider.h>
  #include <linux/of.h>
+ #include <linux/of_address.h>
  #include <linux/platform_device.h>
 =20
  #include <dt-bindings/clock/agilex-clock.h>
@@@ -232,24 -233,49 +233,49 @@@ static const struct stratix10_pll_cloc
  	  0, 0x9c},
  };
 =20
+ /*
+  * The SP timers are probed from time_init() and cannot defer, so their
+  * l4_sp_clk and its parents are registered from of_clk_init(). Everything
+  * else is registered when the platform driver probes.
+  */
+ static const struct n5x_perip_c_clock n5x_early_perip_c_clks[] =3D {
+ 	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x54, 8=
},
+ 	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xA=
8, 8},
+ };
+=20
+ static const struct stratix10_perip_c_clock agilex_early_perip_c_clks[] =
=3D {
+ 	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x5C},
+ 	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xB=
0},
+ };
+=20
+ static const struct stratix10_perip_cnt_clock agilex_early_perip_cnt_clks=
[] =3D {
+ 	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(no=
c_free_mux),
+ 	  0, 0x40, 0, 0, 0},
+ };
+=20
+ static const struct stratix10_gate_clock agilex_early_gate_clks[] =3D {
+ 	/*
+ 	 * The l4_sp_clk feeds a 100 MHz clock to various peripherals, one of th=
em
+ 	 * being the SP timers, thus cannot get gated.
+ 	 */
+ 	{ AGILEX_L4_SP_CLK, "l4_sp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), CLK=
_IS_CRITICAL, 0x24,
+ 	  3, 0x44, 16, 2, 0x30, 1, 0},
+ };
+=20
  static const struct n5x_perip_c_clock n5x_main_perip_c_clks[] =3D {
  	{ AGILEX_MAIN_PLL_C0_CLK, "main_pll_c0", "main_pll", NULL, 1, 0, 0x54, 0=
},
- 	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x54, 8=
},
  	{ AGILEX_MAIN_PLL_C2_CLK, "main_pll_c2", "main_pll", NULL, 1, 0, 0x54, 1=
6},
  	{ AGILEX_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0, 0x54, 2=
4},
  	{ AGILEX_PERIPH_PLL_C0_CLK, "peri_pll_c0", "periph_pll", NULL, 1, 0, 0xA=
8, 0},
- 	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xA=
8, 8},
  	{ AGILEX_PERIPH_PLL_C2_CLK, "peri_pll_c2", "periph_pll", NULL, 1, 0, 0xA=
8, 16},
  	{ AGILEX_PERIPH_PLL_C3_CLK, "peri_pll_c3", "periph_pll", NULL, 1, 0, 0xA=
8, 24},
  };
 =20
  static const struct stratix10_perip_c_clock agilex_main_perip_c_clks[] =
=3D {
  	{ AGILEX_MAIN_PLL_C0_CLK, "main_pll_c0", "main_pll", NULL, 1, 0, 0x58},
- 	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x5C},
  	{ AGILEX_MAIN_PLL_C2_CLK, "main_pll_c2", "main_pll", NULL, 1, 0, 0x64},
  	{ AGILEX_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0, 0x68},
  	{ AGILEX_PERIPH_PLL_C0_CLK, "peri_pll_c0", "periph_pll", NULL, 1, 0, 0xA=
C},
- 	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xB=
0},
  	{ AGILEX_PERIPH_PLL_C2_CLK, "peri_pll_c2", "periph_pll", NULL, 1, 0, 0xB=
8},
  	{ AGILEX_PERIPH_PLL_C3_CLK, "peri_pll_c3", "periph_pll", NULL, 1, 0, 0xB=
C},
  };
@@@ -257,8 -283,6 +283,6 @@@
  static const struct stratix10_perip_cnt_clock agilex_main_perip_cnt_clks[=
] =3D {
  	{ AGILEX_MPU_FREE_CLK, "mpu_free_clk", NULL, mpu_free_mux, ARRAY_SIZE(mp=
u_free_mux),
  	   0, 0x3C, 0, 0, 0},
- 	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(no=
c_free_mux),
- 	  0, 0x40, 0, 0, 0},
  	{ AGILEX_L3_MAIN_FREE_CLK, "l3_main_free_clk", "noc_free_clk", NULL,
  	  1, 0, 0, 1, 0, 0},
  	{ AGILEX_L4_SYS_FREE_CLK, "l4_sys_free_clk", NULL, noc_mux, ARRAY_SIZE(n=
oc_mux), 0,
@@@ -292,12 -316,6 +316,6 @@@ static const struct stratix10_gate_cloc
  	  1, 0x44, 0, 2, 0x30, 1, 0},
  	{ AGILEX_L4_MP_CLK, "l4_mp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, =
0x24,
  	  2, 0x44, 8, 2, 0x30, 1, 0},
- 	/*
- 	 * The l4_sp_clk feeds a 100 MHz clock to various peripherals, one of th=
em
- 	 * being the SP timers, thus cannot get gated.
- 	 */
- 	{ AGILEX_L4_SP_CLK, "l4_sp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), CLK=
_IS_CRITICAL, 0x24,
- 	  3, 0x44, 16, 2, 0x30, 1, 0},
  	{ AGILEX_CS_AT_CLK, "cs_at_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, =
0x24,
  	  4, 0x44, 24, 2, 0x30, 1, 0},
  	{ AGILEX_CS_TRACE_CLK, "cs_trace_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux=
), 0, 0x24,
@@@ -454,31 -472,165 +472,165 @@@ static int n5x_clk_register_pll(const s
  	return 0;
  }
 =20
- static int agilex_clkmgr_init(struct platform_device *pdev)
+ static struct stratix10_clock_data *agilex_clk_data;
+=20
+ static struct stratix10_clock_data *agilex_clk_data_alloc(void __iomem *b=
ase)
+ {
+ 	struct stratix10_clock_data *clk_data;
+ 	int i;
+=20
+ 	clk_data =3D kzalloc(struct_size(clk_data, clk_data.hws, AGILEX_NUM_CLKS=
),
+ 			   GFP_KERNEL);
+ 	if (!clk_data)
+ 		return NULL;
+=20
+ 	clk_data->base =3D base;
+ 	clk_data->clk_data.num =3D AGILEX_NUM_CLKS;
+=20
+ 	for (i =3D 0; i < AGILEX_NUM_CLKS; i++)
+ 		clk_data->clk_data.hws[i] =3D ERR_PTR(-EPROBE_DEFER);
+=20
+ 	return clk_data;
+ }
+=20
+ static void agilex_clk_register_early(struct stratix10_clock_data *clk_da=
ta)
+ {
+ 	agilex_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), cl=
k_data);
+=20
+ 	agilex_clk_register_c_perip(agilex_early_perip_c_clks,
+ 				    ARRAY_SIZE(agilex_early_perip_c_clks), clk_data);
+=20
+ 	agilex_clk_register_cnt_perip(agilex_early_perip_cnt_clks,
+ 				      ARRAY_SIZE(agilex_early_perip_cnt_clks),
+ 				      clk_data);
+=20
+ 	agilex_clk_register_gate(agilex_early_gate_clks,
+ 				 ARRAY_SIZE(agilex_early_gate_clks), clk_data);
+ }
+=20
+ static void n5x_clk_register_early(struct stratix10_clock_data *clk_data)
+ {
+ 	n5x_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_d=
ata);
+=20
+ 	n5x_clk_register_c_perip(n5x_early_perip_c_clks,
+ 				 ARRAY_SIZE(n5x_early_perip_c_clks), clk_data);
+=20
+ 	agilex_clk_register_cnt_perip(agilex_early_perip_cnt_clks,
+ 				      ARRAY_SIZE(agilex_early_perip_cnt_clks),
+ 				      clk_data);
+=20
+ 	agilex_clk_register_gate(agilex_early_gate_clks,
+ 				 ARRAY_SIZE(agilex_early_gate_clks), clk_data);
+ }
+=20
+ /*
+  * The registered clocks keep using the mapping and clk_data, so neither =
is
+  * released once the early clocks have been registered.
+  */
+ static int
+ agilex_clkmgr_setup(struct device_node *np,
+ 		    void (*register_early)(struct stratix10_clock_data *))
  {
- 	struct device_node *np =3D pdev->dev.of_node;
- 	struct device *dev =3D &pdev->dev;
  	struct stratix10_clock_data *clk_data;
  	void __iomem *base;
- 	int i, num_clks;
 =20
- 	base =3D devm_platform_ioremap_resource(pdev, 0);
- 	if (IS_ERR(base))
- 		return PTR_ERR(base);
-=20
- 	num_clks =3D AGILEX_NUM_CLKS;
-=20
- 	clk_data =3D devm_kzalloc_flex(dev, *clk_data, clk_data.hws, num_clks);
- 	if (!clk_data)
+ 	base =3D of_iomap(np, 0);
+ 	if (!base) {
+ 		pr_err("%s: failed to map clock registers\n", __func__);
  		return -ENOMEM;
+ 	}
 =20
- 	clk_data->clk_data.num =3D num_clks;
- 	clk_data->base =3D base;
+ 	clk_data =3D agilex_clk_data_alloc(base);
+ 	if (!clk_data) {
+ 		iounmap(base);
+ 		return -ENOMEM;
+ 	}
 =20
- 	for (i =3D 0; i < num_clks; i++)
- 		clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
+ 	register_early(clk_data);
+ 	agilex_clk_data =3D clk_data;
 =20
- 	agilex_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), cl=
k_data);
+ 	return 0;
+ }
+=20
+ static int agilex_clkmgr_add_provider(struct device_node *np)
+ {
+ 	static bool added;
+ 	int ret;
+=20
+ 	if (added)
+ 		return 0;
+=20
+ 	ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
+ 				     &agilex_clk_data->clk_data);
+ 	if (ret)
+ 		return ret;
+=20
+ 	added =3D true;
+=20
+ 	return 0;
+ }
+=20
+ static void __init
+ agilex_clkmgr_of_init(struct device_node *np,
+ 		      void (*register_early)(struct stratix10_clock_data *))
+ {
+ 	if (agilex_clkmgr_setup(np, register_early))
+ 		return;
+=20
+ 	if (agilex_clkmgr_add_provider(np))
+ 		pr_err("%s: failed to add clock provider\n", __func__);
+ }
+=20
+ static void __init agilex_clkmgr_early_init(struct device_node *np)
+ {
+ 	agilex_clkmgr_of_init(np, agilex_clk_register_early);
+ }
+=20
+ CLK_OF_DECLARE_DRIVER(agilex_clkmgr, "intel,agilex-clkmgr",
+ 		      agilex_clkmgr_early_init);
+=20
+ static void __init n5x_clkmgr_early_init(struct device_node *np)
+ {
+ 	agilex_clkmgr_of_init(np, n5x_clk_register_early);
+ }
+=20
+ CLK_OF_DECLARE_DRIVER(n5x_clkmgr, "intel,easic-n5x-clkmgr",
+ 		      n5x_clkmgr_early_init);
+=20
+ static struct stratix10_clock_data *
+ agilex_clkmgr_get_clk_data(struct platform_device *pdev,
+ 			   void (*register_early)(struct stratix10_clock_data *))
+ {
+ 	int ret;
+=20
+ 	if (!agilex_clk_data) {
+ 		ret =3D agilex_clkmgr_setup(pdev->dev.of_node, register_early);
+ 		if (ret)
+ 			return ERR_PTR(ret);
+ 	}
+=20
+ 	return agilex_clk_data;
+ }
+=20
+ static int agilex_clkmgr_finish(struct platform_device *pdev,
+ 				struct stratix10_clock_data *clk_data)
+ {
+ 	int i;
+=20
+ 	for (i =3D 0; i < AGILEX_NUM_CLKS; i++)
+ 		if (clk_data->clk_data.hws[i] =3D=3D ERR_PTR(-EPROBE_DEFER))
+ 			clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
+=20
+ 	return agilex_clkmgr_add_provider(pdev->dev.of_node);
+ }
+=20
+ static int agilex_clkmgr_init(struct platform_device *pdev)
+ {
+ 	struct stratix10_clock_data *clk_data;
+=20
+ 	clk_data =3D agilex_clkmgr_get_clk_data(pdev, agilex_clk_register_early);
+ 	if (IS_ERR(clk_data))
+ 		return PTR_ERR(clk_data);
 =20
  	agilex_clk_register_c_perip(agilex_main_perip_c_clks,
  				 ARRAY_SIZE(agilex_main_perip_c_clks), clk_data);
@@@ -489,35 -641,17 +641,17 @@@
 =20
  	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
  			      clk_data);
- 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
- 	return 0;
+=20
+ 	return agilex_clkmgr_finish(pdev, clk_data);
  }
 =20
  static int n5x_clkmgr_init(struct platform_device *pdev)
  {
- 	struct device_node *np =3D pdev->dev.of_node;
- 	struct device *dev =3D &pdev->dev;
  	struct stratix10_clock_data *clk_data;
- 	void __iomem *base;
- 	int i, num_clks;
 =20
- 	base =3D devm_platform_ioremap_resource(pdev, 0);
- 	if (IS_ERR(base))
- 		return PTR_ERR(base);
-=20
- 	num_clks =3D AGILEX_NUM_CLKS;
-=20
- 	clk_data =3D devm_kzalloc_flex(dev, *clk_data, clk_data.hws, num_clks);
- 	if (!clk_data)
- 		return -ENOMEM;
-=20
- 	clk_data->base =3D base;
- 	clk_data->clk_data.num =3D num_clks;
-=20
- 	for (i =3D 0; i < num_clks; i++)
- 		clk_data->clk_data.hws[i] =3D ERR_PTR(-ENOENT);
-=20
- 	n5x_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_d=
ata);
+ 	clk_data =3D agilex_clkmgr_get_clk_data(pdev, n5x_clk_register_early);
+ 	if (IS_ERR(clk_data))
+ 		return PTR_ERR(clk_data);
 =20
  	n5x_clk_register_c_perip(n5x_main_perip_c_clks,
  				 ARRAY_SIZE(n5x_main_perip_c_clks), clk_data);
@@@ -528,8 -662,8 +662,8 @@@
 =20
  	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
  			      clk_data);
- 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
- 	return 0;
+=20
+ 	return agilex_clkmgr_finish(pdev, clk_data);
  }
 =20
  static int agilex_clkmgr_probe(struct platform_device *pdev)

--AVWuBmSGffOcuXjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3IPEACgkQJNaLcl1U
h9CxlAf/aKjwDdkZZMa5FuOXMfgrDLQY7YsEfKSCrAbaQjQ63ySf9H2zXvMBWSVc
pl3IcPw25yjNbiID56Afl0wSl3KvdhZrlAWqhujWpQsaPQxYQz75NS4vAnNjj4Fd
TXG3dM+d/uwZHjO645mucCwc4WJ5t8Hb5PRTT0HlMszRDo34z0RTVFUqm9tCIP20
/mga1JGPmJ8UzxXOcx0+q2YgVTLe90mL4lp4mow72VcyFRp9fRtbEAJE9aBFk4MC
YwVmz7emGnbVMzv7ipGYIeZJdsnvxLc1nKukXCTuQUD0T/nFXZSar30DZdaN6E1y
HrxsEVDuHtS0S5Wt6H+2x4QF9ySl6w==
=/Uyq
-----END PGP SIGNATURE-----

--AVWuBmSGffOcuXjz--
