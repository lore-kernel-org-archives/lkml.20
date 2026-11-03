Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720281;
	b=XCUif06wqLo9MytgJiU5/WdVfT1/giiBXkl2gUzDlHjoSPvJUs9JD4Y1Wb+MzVPL0//B
	 hMzy7XZI4Wrs9AtFV1/pHtfgGBdHWMBHJ0IEhaLppb+lN9p9bTcRV4LqhZUXObkY13V3y
	 TbXOpDctRQem3PMOEo8dVGO6Bz7jICdzbaNvD+veoVr5h3+QAJG51Bn2wUmzjfaukF7gO
	 OyMhLOX9BX91kToZVUHBnoOSRrLSu06Xk91pg7nUoVAU4P0jUFQhfKK5CffsKM3HqXyc6
	 TAq2gZXEHNuxoGVBVKMWFZBUERLMfl3YUo5nn5p/RFnLVYTVLgKQ3LILhitkyo2xnKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720281;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=G9VfqJ+XWxAllnzsArSXxWjkRCkNU1/oIdgGJDZxQ9k=;
	b=S4aJOFF6+HXjdYSJKN4xMJ0OCwXHp1mhEvJ/2I/kolIOfuhIbJ2w8QLZL9FogBIjFvr/
	 prUT/KLsuGh190RXM81nH1qjehYmShQIU3ih9QtDyzKaxD7RiLPT6NAl8g9GjFZrfUR4t
	 P6vzlrkvj0T0bafR+4kiE7AUy1Z1TsnkLz2Z07qcCUjiE7LYNS43wHAzYDoVGjfe3fVDe
	 e60gg7nPQ2thAqvkJzCk6HDTNLxnpY72WbthSkm/J+n9WhqWjkk37AzE1O50aB72Uet57
	 zYP6974OjL4K1T+5syMWrOllR5+KFndoRqE54mLVQFJ9RghTOOxwCixC/dyWKcovR9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QmtNw7xh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32633606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QmtNw7xh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700F61F00A16;
	Tue,  3 Nov 2026 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793720280;
	bh=G9VfqJ+XWxAllnzsArSXxWjkRCkNU1/oIdgGJDZxQ9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QmtNw7xhhFhysqUAkJpDFKbVFSlf8bi818bztC2CU7CpAU/i/geKicJEnbVqte2Y4
	 g8lejir/gP+wrhVUP7qnSVw2RbSVwnK6MQaZGA8sHep7Il4bDCSQdoolk+XGfat+5I
	 2QGp1Y2mflcbb4CzlLIuUhHMsWflfMYWXMM47O9Y02EghmjdohHuUIFBiCOLjNqSOQ
	 MlJ8Bc/iPR5WKuuip0t2mVuMGjgjwzwRnleVErSnlttocCVlMnvNCHzw45dIp2deGz
	 P9/StyaLgPhXjMrFgD1BZwBudz6Bzmg69ToyNSDpn1yucX7MZ00Ax6zx5JpmloCgpa
	 J5RUPLaakSigg==
Date: Tue, 3 Nov 2026 08:37:59 -0700
From: Keith Busch <kbusch@kernel.org>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: hare@suse.de, hch@lst.de, kch@nvidia.com, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, sagi@grimberg.me
Subject: Re: [PATCH v2] nvmet: use appropriate types for authentication
 payload lengths
Message-ID: <aun_15SXOxpzPZXT@kbusch-mbp>
References: <20261031075932.4345-1-sreekuttan2156239@gmail.com>
 <20261031081751.4583-1-sreekuttan2156239@gmail.com>
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
In-Reply-To: <20261031081751.4583-1-sreekuttan2156239@gmail.com>

On Sat, Oct 31, 2026 at 08:17:51AM +0000, Sreeraj S Kurup wrote:
> The authentication payload length is obtained as a u32 value from the
> NVMe command, but nvmet_auth_challenge() and nvmet_auth_success1()
> accept it as a signed int.
> 
> Use u32 for the payload length parameters in both functions to keep
> their types consistent with the value returned by
> nvmet_auth_receive_data_len() and avoid an unnecessary conversion
> from unsigned to signed.
> 
> Also, use size_t for data_size in nvmet_auth_challenge(), since the
> calculation includes sizeof(), which returns size_t. This avoids
> implicitly narrowing the calculated payload size to int.
> 
> These changes make the payload length handling consistent with the
> underlying types and avoid potential signedness and narrowing issues.

Thanks, applied to nvme-7.4.
