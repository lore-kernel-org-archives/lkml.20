Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD14483804;
	Mon, 14 Sep 2026 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397523; cv=none; b=CUdHA+ksgc22o+4TyiLnLLH3x4B24knMXXC/pyPkpAnmZVHjVmh5nZvpvUALVmQPpuTLNZr/e73rQluqV/GcdqbX1vhZOmetPrlq+49xE6p7RnVPU5djt9hHW+hZarNFPnek3ZTWrG46q/adfRvX4eKSp0CYKICDxNC8Ij2Qg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397523; c=relaxed/simple;
	bh=deJL8CaA/aa/1J0Lh9emvShdffy6/lpY2urOD9H78IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQt5EwCCf8lO6Zhmf81Y7MDvNYn3akFejjtr68o25FyN/q1T91z07cMYANj5EmS1CW55LgbHrlR9cY9du2tA39a4jeu5YhWZV+L8VKltUGxaO00NdLKIChQoZ8CwTClh3ZpbYCdvrl5yrLWmWpjICsmfae9Pt03EdpCHJxm3lag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLRnfYg+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLRnfYg+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806C71F000FF;
	Mon, 14 Sep 2026 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789397520;
	bh=MGn0WF9VaZ2rAjh6B6vmM6kux/GxiWOZxbDZKzpjocQ=;
	h=Date:From:To:Cc:Subject;
	b=bLRnfYg+VNOkbSG4hUNbjr2BitExmDXeWyK4J3ZwNOUkVOH5rEIi6JNAaOwnzuv4k
	 hrufMoGQFLmpf3vELioKeXIUN7oWoqcskXLlfGUhl4SEgPnieJhQQBtFTUO+uk7Z++
	 NkiMYFP8XH9ojDMsPC6tKDfGbzVxj/Tkq5DsgKOWfFGpusAQhyhQqjoaiXvRepcUHk
	 9pqXuFCnnczQFvN7g4lCq82+KT9b1v9kh0QJUjsZOJ+/0Dqe6YUqLDuyT9/NAJF6lP
	 TbSBNPl66opcor+KIPeFJjFMe+fVlLoU+N6SP/VIRC7qBSE3q7k07s0oqHqK84w3Uj
	 6DkgiDYcIUFVQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6BEF41AC52F1; Mon, 14 Sep 2026 15:51:58 +0100 (BST)
Date: Mon, 14 Sep 2026 15:51:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the phy-next tree
Message-ID: <aqgKDgDpqlnQPgDz@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfolRsssPp10KuHp"
Content-Disposition: inline


--wfolRsssPp10KuHp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the phy-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
  761 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
  761 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                         {                                           }
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:763:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
  763 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:763:18: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
  763 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                         {                                               }
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:776:20: error: incompatible pointer to integer conversion initializing 'u32' (aka 'unsigned int') with an expression of type 'const u32[9]' (aka 'const unsigned int[9]') [-Wint-conversion]
  776 |         .driving_params = (const u32[]) {
      |                           ^~~~~~~~~~~~~~~
  777 |                 [0] = 0,
      |                 ~~~~~~~~
  778 |                 [1] = 0,
      |                 ~~~~~~~~
  779 |                 [2] = 0,
      |                 ~~~~~~~~
  780 |                 [3] = MT8195_DRIVING_PARAM_3_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  781 |                 [4] = MT8195_DRIVING_PARAM_4_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  782 |                 [5] = MT8195_DRIVING_PARAM_5_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  783 |                 [6] = MT8195_DRIVING_PARAM_6_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  784 |                 [7] = MT8195_DRIVING_PARAM_7_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  785 |                 [8] = MT8195_DRIVING_PARAM_8_DEFAULT
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  786 |         },
      |         ~
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:776:20: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
  776 |         .driving_params = (const u32[]) {
      |                           ^~~~~~~~~~~~~~~
      |                           {
  777 |                 [0] = 0,
      |                 ~~~~~~~~
  778 |                 [1] = 0,
      |                 ~~~~~~~~
  779 |                 [2] = 0,
      |                 ~~~~~~~~
  780 |                 [3] = MT8195_DRIVING_PARAM_3_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  781 |                 [4] = MT8195_DRIVING_PARAM_4_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  782 |                 [5] = MT8195_DRIVING_PARAM_5_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  783 |                 [6] = MT8195_DRIVING_PARAM_6_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  784 |                 [7] = MT8195_DRIVING_PARAM_7_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  785 |                 [8] = MT8195_DRIVING_PARAM_8_DEFAULT
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  786 |         },
      |         ~
      |          }
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: initializer element is not a compile-time constant
  761 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:791:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
  791 |         .off_ana_lane = (const u16[]) { 0x0, 0x100, 0x200, 0x300 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:791:18: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
  791 |         .off_ana_lane = (const u16[]) { 0x0, 0x100, 0x200, 0x300 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                         {                                         }
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:793:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
  793 |         .off_dig_lane = (const u16[]) { 0x1000, 0x1100, 0x1200, 0x1300 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:793:18: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
  793 |         .off_dig_lane = (const u16[]) { 0x1000, 0x1100, 0x1200, 0x1300 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                         {                                               }
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:806:20: error: incompatible pointer to integer conversion initializing 'u32' (aka 'unsigned int') with an expression of type 'const u32[9]' (aka 'const unsigned int[9]') [-Wint-conversion]
  806 |         .driving_params = (const u32[]) {
      |                           ^~~~~~~~~~~~~~~
  807 |                 [0] = 0,
      |                 ~~~~~~~~
  808 |                 [1] = 0,
      |                 ~~~~~~~~
  809 |                 [2] = 0,
      |                 ~~~~~~~~
  810 |                 [3] = MT8196_DRIVING_PARAM_3_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  811 |                 [4] = MT8196_DRIVING_PARAM_4_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  812 |                 [5] = MT8196_DRIVING_PARAM_5_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  813 |                 [6] = MT8196_DRIVING_PARAM_6_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  814 |                 [7] = MT8196_DRIVING_PARAM_7_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  815 |                 [8] = MT8196_DRIVING_PARAM_8_DEFAULT
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  816 |         },
      |         ~
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:806:20: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
  806 |         .driving_params = (const u32[]) {
      |                           ^~~~~~~~~~~~~~~
      |                           {
  807 |                 [0] = 0,
      |                 ~~~~~~~~
  808 |                 [1] = 0,
      |                 ~~~~~~~~
  809 |                 [2] = 0,
      |                 ~~~~~~~~
  810 |                 [3] = MT8196_DRIVING_PARAM_3_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  811 |                 [4] = MT8196_DRIVING_PARAM_4_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  812 |                 [5] = MT8196_DRIVING_PARAM_5_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  813 |                 [6] = MT8196_DRIVING_PARAM_6_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  814 |                 [7] = MT8196_DRIVING_PARAM_7_DEFAULT,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  815 |                 [8] = MT8196_DRIVING_PARAM_8_DEFAULT
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  816 |         },
      |         ~
      |          }
/tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:791:18: error: initializer element is not a compile-time constant
  791 |         .off_ana_lane = (const u16[]) { 0x0, 0x100, 0x200, 0x300 },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

   6fe4d5beac728 (phy: phy-mtk-dp: Add support for MT8196 eDP PHY)

I have used the tree from next-20260911 instead.

--wfolRsssPp10KuHp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoCg0ACgkQJNaLcl1U
h9CTMgf9Ho3QOZZKTFFFHfUgPVXUcdbZcrJDefUS9VkCPBebhPuJ8y09hBw3NIHn
hL2yR1F8Wo55UY7FF1a1jRq/nx9mNWbvhRvZRCYr25DEe4r/pylBugivoJR7hFzS
k/2xjW440sPa+Uh7pT0KfygsPG0s72tVElBFfxOAcwa5rhspSJnB/4hrSELWJhmQ
xUud1gV8n2mjrXVM5WZFXkCLynF+T4jvSbZrplYd6R/J3/QGPIy/kUGu7gkV0HgX
GKYtZjIb8flfy9Qx2YUc9hIc3ugVjKBLxIDgAyYIm82YgWTxWSGBTJSBk2Jxsa5t
f0TeaDXSAlmgrgdnchCFAR6riFwLWg==
=skVQ
-----END PGP SIGNATURE-----

--wfolRsssPp10KuHp--
