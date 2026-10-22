Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682172;
	b=PjfNNNEnZuJMpQ/GZg0O7x2tJuIVe6JfL1a8uF1dFMKtqJmFyIARSfzitXeQslHgeQi+
	 klp69PwIu4cABXlDJlpiVBh4LET/5smncY1w1b8E3PVEHIj+PJZfdCJAzQEBedaDKJOkk
	 CiQANDDovKr+Ma4F+C6J2DKje+24pNYRmnDEDV83zq0vNSJJcsrJ/bjbZJ9v8W2VPTZUO
	 nQ7JNZeGPv6Cod2nJVvgbJfNGgsefWCIWVb/myp5ZKwu8xJ1ljOTtKyHUOndzNG25ETUn
	 hIICMh2bpHp8aRvWr0n/H8Cl4Bi3iDjA5Eb6t6Yl6yyS8ije9jjRfI8g79C9Yl1b0cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682172;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pYWpbYgGwt9N5yTmTwh36JAVgl/KWWKdODyVXc8tpS0=;
	b=WyJuRVAAkIwflDCKdcaqSzFcWhN1SN/S5vZtWM+rnC/Oo7veSHso4VlGkbSWnRgt/GSZ
	 nZJEWNnvc503mDPQIKA+5cjb4D7y59T603UuLDis0uv39cYi4oQEppITNAEkDVQVkVpWS
	 7vLSJd6zhIuGYbO8ByAFlzVN1i5TkUQtog8zmN2PEbK12LAl4SaXLYAKLmEcprVQcIDwb
	 LfoPfpaAECPD+Z+JDkdojkqeoWKQu2eDFq4xJ/griOPFvKwU34Xm+IPkYBEIU0anZaoWy
	 IQzo1iFtMUpFJlFu0IDk8SxZtPxO2Im6js1FLLW0WpB7px1a5B8DzmYEIdcHMA9L1/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wh3bmJfM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E9606ACE3
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wh3bmJfM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9985F1F01825;
	Thu, 22 Oct 2026 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792682172;
	bh=pYWpbYgGwt9N5yTmTwh36JAVgl/KWWKdODyVXc8tpS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wh3bmJfMiXRkGh0rDkEgacTHwwriqEh1Zdv59qRbyh1Ip82/jt4NmwocooAAg9yJu
	 ZVG5xGhBitNCxzsa03RdgQnZsIcB4Eeynb8zfy1xjgc+FN8Tya8iYTGz5QDVTxhM52
	 lx0fZB16UdHWN+VXvISnAjA9s9THtncArOOUpHyg7StvB97e74P9oJ/ttUfiUg2nKH
	 tEXfmFwaszcVIGW2VoEuRDHlK8qt3n4grnM/F7eMmqPo7uegt3wynMEPrzGn4mThGj
	 5A8awiVHjRl4LGuG8w6r3fdWTyh7xFs5TRlRxisqOBEqDU+smc5Rav76PYXM7A3ZV3
	 yaff0WjzfStTA==
Date: Thu, 22 Oct 2026 09:16:10 -0600
From: Keith Busch <kbusch@kernel.org>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Justin Tee <justintee8345@gmail.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kwilczynski@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] nvmet: fix read data, status and length checks in
 fc, zns and pci-epf
Message-ID: <atoouj9RiG1Ik5I5@kbusch-mbp>
References: <20261022132934.3592924-1-parri.andrea@gmail.com>
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
In-Reply-To: <20261022132934.3592924-1-parri.andrea@gmail.com>

On Thu, Oct 22, 2026 at 03:29:29PM +0200, Andrea Parri wrote:
> A connected host can currently receive stale target memory through two
> nvmet transports, and ZNS answers a Zone Management Receive whose NUMD
> byte count wraps.
> 
> The FC transport sends a read buffer even when the command completes with
> an error.  Some errors occur before the command handler initializes that
> buffer, so the host receives data left in the allocation.
> 
> The PCI endpoint transport allocates each read segment at the length of
> the host's SGL data descriptor and sends every segment in full, even when
> the descriptors describe more than the command transfers.  The excess
> reaches the host uninitialized, on any successful read.
> 
> Patch 1 makes the FC transport send read data only for successful
> commands, matching the TCP and RDMA transports.  Patch 2 rejects NUMD
> values whose byte count wraps the u32 length calculation instead of
> accepting the wrapped request.
> 
> Patch 3 fixes a related PCI endpoint bug that patch 4 depends on.  The
> transport reports every error it detects itself as a successful
> completion, because nvmet_pci_epf_complete_iod() reloads the status from
> a CQE that only the nvmet core fills in, so even a write whose data
> could not be fetched is reported as written.  Patch 4 then makes the
> transport reject SGLs whose data descriptors do not add up to the
> command's data length.
> 
> Patches 1 and 2 were tested on top of nvme-7.4 over the loop, tcp, rdma
> (rdma_rxe) and fc (fcloop) transports, with a zoned null_blk namespace
> for patch 2.  Without them, a failed Identify over fc returns data and a
> wrapping NUMD is accepted; with them, neither occurs on any of the four
> transports.

Looks good to me. Applied to nvme-7.4.
