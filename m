Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426263;
	b=gWdoiynXAmwEFIs+BENtygLyK/Hix+6uqYB7VUtHRtOpQVovL0qDfu0a5GEid7oJHzPS
	 i/uhZHqlg3DvPdyTV7tJqjMLgVvWYzsKQexA2bihRU+p476lyNlOs8eqed7vcUD0yaiJX
	 vh85FmPLPshLrk8tkUCPq0YA9Idg3T4LV+P/d2HPix7uwOH0XtVDCJWOrOIR4IBDS8FE8
	 tSpn7ZVXvQFJ/1NWgE8W+yz9h6akGgXjty92SmaWEdmFKRLiv97O3aM3Ylc6bLavf3QR3
	 p3C4a6cl54vdqssTk/c7Eyy4cpgq9LTE5nprDTWW8pvH7xQB4UT1hA6btB1msz+J9CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426263;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=JXKMpeb3N1wFbPxiObmKorjUKb5caSt+/0HKW+nbCDA=;
	b=o7jyDxlUjPXyDkDGiXdnQS1ZIfGm7dEXaMPEi4K3X60cYkF4h6CMSxga7IhNj7ZtQ1bk
	 4xhMB+jEAkKyOX7tOKYsvSYj4BG73SorVT2b+epiDUFZRSK7q6OFMaq4K5+y7Mcc9su2Z
	 gWnJBzkCztki6sc3lveDU2Jbr5UiayAY79kIteaWJ1b0sRv7DzhebkSsHwaU3kpyhoUX5
	 GJca1g7uyGBPN9UonGWIc5gzxpirJvJqnuSc62xN7kYhQENz7fzcaYlHUqi3NmsIuC1Kp
	 skl5fK5vN0G8zm6mv8ZHIOPQeoeGg29W3aWpeyU2YkCzma9cmVzLzOaC5QQdE3ubLQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdDjHDTv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B7606C933;
	Mon, 19 Oct 2026 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdDjHDTv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EB91F000C4;
	Mon, 19 Oct 2026 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426262;
	bh=JXKMpeb3N1wFbPxiObmKorjUKb5caSt+/0HKW+nbCDA=;
	h=Date:From:To:Cc:Subject;
	b=IdDjHDTvINdNvvH6dto+d4iScISIYGBbDCoqHh/s/zq5yICkm5JsgdLrZiBnZtxUn
	 ps3J1S5QqCSlnC+aEmaaWJDfqV9FdJpIIGOb1H4Bu99zR7pTosLLxVGFv0MJJChKNY
	 gt5Au73tCykPO+2POS9PZEhIpksThQZ+O0ITYmTsEjElDCZJoBZnAw+F1ioI0+qKY0
	 matllppSjqbNz5EpXfteuTxvHkMGrePy60CE4W+wgiyl3BUj2BYgGHeq8oPhtuEub6
	 FBRbk/66sVfp3XOR3riruzKrl+jFB4St49FtKYBYhe5lSmdXMyaEs3NrLWxGUMpiL/
	 THMWyP5aiXphA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id DF7BF1AC57D0; Mon, 19 Oct 2026 17:10:59 +0100 (BST)
Date: Mon, 19 Oct 2026 17:10:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Richard Leitner <richard.leitner@linux.dev>
Subject: linux-next: manual merge of the spi tree with the origin tree
Message-ID: <atZBEx63Bi2iNAEt@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="eiodujqucHBSt2AJ"
Content-Disposition: inline


--eiodujqucHBSt2AJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi tree got a conflict in:

  drivers/spi/spi-imx.c

between commit:

  59eb22641f0c5 ("spi: imx: fix slab corruption from undersized DMA bounce =
buffers")

=66rom the origin tree and commit:

  853de617c4a62 ("spi: use dmaengine_get_dma_device() instead of chan->devi=
ce->dev")

=66rom the spi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/spi/spi-imx.c
index 3851c50dbe314,868f963e61371..0000000000000
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@@ -1921,9 -1919,8 +1921,9 @@@ static int spi_imx_dma_package_transfer
  		return ret;
 =20
  	/* Trim the DMA RX buffer and copy the actual data to rx_buf */
- 	dma_sync_single_for_cpu(controller->dma_rx->device->dev, dma_data->dma_r=
x_addr,
+ 	dma_sync_single_for_cpu(dmaengine_get_dma_device(controller->dma_rx), dm=
a_data->dma_rx_addr,
 -				dma_data->dma_len, DMA_FROM_DEVICE);
 +				DMA_CACHE_ALIGNED_LEN(dma_data->dma_len),
 +				DMA_FROM_DEVICE);
  	spi_imx_dma_rx_data_handle(spi_imx, dma_data, transfer->rx_buf + spi_imx=
->rx_offset,
  				   word_delay);
  	spi_imx->rx_offset +=3D dma_data->data_len;

--eiodujqucHBSt2AJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZBEwAKCRAv73Ows9A4
iR96AP9ETX2qjNW5BNj8OhOo6E5GpiUw2J31vplbel3NjJYriAD/Ul9/t8oqjx8Y
rSxpsdK4qLsPZ8Ne7n5B6zJ5oOAAVQI=
=SXEi
-----END PGP SIGNATURE-----

--eiodujqucHBSt2AJ--
