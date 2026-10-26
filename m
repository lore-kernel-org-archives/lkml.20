Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030324;
	b=0a0cEzRBsEsCdu+ZTzYXbTjAN3SQc5sfUbIzmSa9FpQqlfi0Wq1pcasF7ABFj5IPIeJU
	 8iOnB0F/ORghksZ2UfnOoNfDp8n4ba/G11kKiQLrLBssuS/RgfRf7Cf+8hFB5x/K0B+ri
	 AEy3O44Pk+TqCIxC/ENQOVKhJxxiuEYFoHcFbb6VseYby+eIzbZM8Qf6Qnvdow7JwGBYE
	 4/rbKp56pAtkYVa0iyPMqwoPRVbQEhd/rDsrePZ0jNRo2oG7Gqs+G2jjvVrSn8IQiKJSN
	 YPk0c4GQEeANodBTNKTwQwkDIHpJ/bMjMW+dI5JeAi2GschogVNuWb6YM+hEktakZzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030324;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eZAP7Nz9rXRWZhVSYPJ/pbBpkrnLzpAj+W5fvtEnIBg=;
	b=e5vCd4rWiTEmAtb1/O/fCX552QEXQmzAmxrgZTh4+LYP5pv3g/G86DINO5ceMW4FdUOW
	 bfPk5cZT+l5GVeelbsCJJmb5kkMaXwxhu6se3qg33G9//Ahx8dG3mjEe1OpfjW2hXo50g
	 7s9o50E2jmfAoTZxT8qm8shYOVC/ivgRPlEHt+oFV8WZyyi+jLqYS/yOKFR0z6noyxuXn
	 JrsVof8XtxmSnnb23ZLWgHd/vo7Y/Cb2zlisBoNOboW6K5zWxL7BQ129MUG2dtrXm5qv1
	 uK9WjoIpWqejUU1+8MFpe2UFuv9KXBs6S3nHFT6fhDYCz51hrdqZe/JgB13ORekeW8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZhlpQ4N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37884606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZhlpQ4N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AFA1F01825;
	Mon, 26 Oct 2026 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793030323;
	bh=eZAP7Nz9rXRWZhVSYPJ/pbBpkrnLzpAj+W5fvtEnIBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZhlpQ4N5DCp/PmhUmxzRbgq9jO+mfSoW1UQ1VvC5j5CmzacXCjiC1v2VmxZ2GWTN
	 LcyGxJ07ckVqTLeU/4sI3D9k4fp9qMrSxaUS9Of3Bq6nIsVEk+gJAXlkWcm6lvh3VQ
	 b4dCTbR1BycywQqPcBSJylYzfiKEShKlU6EzzqwgUZioQP7dXfaYNfOSEFVa7zfdKU
	 /PpGAWTKIU0eHorMa593v84AAqgqKIH25WOIQRmQZCreyWVRkFGSEISCLlzMDEEkNC
	 LamIDbM/x92K1NTCfdQX6tzpKEsrGt0t4LuBPIOKlcuwGCuEcGNn8Q1frbIfhzREnc
	 J1J5wvdT2BwHA==
Date: Mon, 26 Oct 2026 09:58:42 -0600
From: Keith Busch <kbusch@kernel.org>
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: use the enabled transport when disabling a port
Message-ID: <at94snlz2OrINQcC@kbusch-mbp>
References: <20261023191851.5316-1-testwrzwrz@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023191851.5316-1-testwrzwrz@gmail.com>

On Sat, Oct 24, 2026 at 03:18:51AM +0800, Rongzheng Wang wrote:
> nvmet_disable_port() looks up the transport from the current
> disc_addr.trtype, while nvmet_enable_port() records the transport in
> port->tr_ops.  If trtype is changed while a port is being enabled, the
> port can be removed through a different transport, passing the private
> data of the original transport to the wrong ->remove_port().
> 
> The same mismatch is reachable with loop and RDMA: loop add_port()
> leaves port->priv NULL, and RDMA remove_port() dereferences it.
> 
> Use port->tr_ops for removal and serialize trtype changes with
> nvmet_config_sem in nvmet_addr_trtype_store(), so the transport that
> added the port is also the one that removes it.

Thanks, applied to nvme-7.4.
