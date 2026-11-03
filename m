Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732897;
	b=pbYoxp2JTFEYgxFzRZlG7vTkUCmwGJDoVwUu+bS0hOTmsBZtqKXZYqvXQ9bqjlREtAcH
	 oPujxdVMqfZsHdRKf6UtsobKE5wSA2eKuYqA6OOxoXHebvhnPJZnQEWyolL1n/5oHUHJ4
	 j0DCP6bQRV2gvd7IeydZQRvWhgDeL5Io4eY4TMKijyEjIw63gKGZU/ujo9rsPpIw76Nx1
	 D5NSqpv1R3i+aVMgME6y93Uz2jO3TPGIB9yAzDZSD2EXxq/Miwoi/szdePx2WT/Ph27N9
	 eYAIUqjIN8gU/r+ZTeSHM1g3ZqmR+HmHPxLf8HXIbnht4s2ypkzy54w/s07uQv1VQ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732897;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=z7grRwM8WCPf1zlbK4nUUkkFYLNOkxsXBBTP+mvK+4c=;
	b=KKOZZmyLp09/8zoSbcIJBTJZal8kwco1W5qzUIFQZpUEvVpNXYFhGYp3YZMUszyPpePJ
	 Xreo779IHgV7D9YXFKGporXkyVu3GgQn+H7e/SnNozELytTQ17kN9uM4WsQit8M6r6ZZZ
	 sA2KXtXhtkXeMF0kgqVmWDEvAITAuQhmBcEm5wX8EHr66iXNFHaPcLpooDKJ8Jbf6SUea
	 zf9aKL9pmFSNTIZwM2iQiPCou7tbzYPbr4LpR45iD/GTdvAlMOpXsE3a3RuA71Gu1hMHO
	 1L9ktDyuYmpDjIjIQyNoZbhmx1W86Xiel1qgciM+nxBK4TRnmx+KC/Z4fGV1SGhxrSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3TKZXNe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF8606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3TKZXNe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEADF1F000C1;
	Tue,  3 Nov 2026 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793732897;
	bh=z7grRwM8WCPf1zlbK4nUUkkFYLNOkxsXBBTP+mvK+4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O3TKZXNecHe8eRQZymbl357ja5s5/vT3IHeQm6MhGvHFK5QPNE1fbbRac2ZmF5/+G
	 crXqtNDZShkO1BeegusGfu+7n1ivVwRJYd7HpXE0W/+QqHZNcxwf9iZQcsrSJQVpkS
	 OoXYciWFNtuFTZVcIY644I0MWCIy39JCY2sS9N3BJ54GFvYGRk5zaRrCwgcDCtcaWw
	 sfvC6rdBPl5o3owyWUMcfQQ7U7q87cNkiceT+UBGml531OeRCHvImchlNj+j2fgMA9
	 HYZ5KlXD5ffyOa430iXwFGPZQo9YwfR9QSjY6JcO1LN5KbpkF1dKrOOMvMQ++CDod5
	 uvFTiT2lPsENA==
Date: Tue, 3 Nov 2026 12:08:15 -0700
From: Keith Busch <kbusch@kernel.org>
To: Liao Xuan <liaoxuan@open-hieco.net>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	default avatarZheng Tan <tanzheng@kylinos.cn>
Subject: Re: [PATCH 1/3] nvme: Add adaptive PCIe link rate switching function
Message-ID: <auoxH197kQfUJGaE@kbusch-mbp>
References: <cover.1790134954.git.liaoxuan@open-hieco.net>
 <85a11a4085d04a2823c04059702630cf34abf6d4.1790134954.git.liaoxuan@open-hieco.net>
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
In-Reply-To: <85a11a4085d04a2823c04059702630cf34abf6d4.1790134954.git.liaoxuan@open-hieco.net>

On Tue, Nov 03, 2026 at 02:25:43PM +0800, Liao Xuan wrote:
> Add support for dynamically adjusting the PCIe link rate of NVMe
> devices based on I/O activity. The link is downgraded to a
> configurable minimum rate during periods of low activity to save
> power, and upgraded to the maximum supported rate as soon as the
> workload exceeds a computed threshold, so that peak performance is
> maintained under load.

Pretty sure PCIe ASPM L1 states would save more power than downgrading
the link rate, as well as have better entry/exit latency than a software
driven monitor and link retrain.
