Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982758;
	b=Y79Jh3XcV10vdLIbOlLNwFDSpqnE2oY5PqyF9koc4oZ6cXra6TRy0V/BDv/3H4Mp81Gq
	 2u+jEx92pYDPOwPPCAsGIG/LW/R/4J3e9OLaKsCIy/0R5AA+KQnmMHKuXQrhDpqg9c2k9
	 DiFbLiBAqxuA8RNogT2h5V/4nt8QCsak8mi0HWlHCRPALIHzbxw0jgq54QoTvcN9bWZNp
	 iiCFB/APdl6/iUH2o7VxxsmPsKnblQ8rgDunzvZDwScyvtJhBEbmxHxp4Pnyvl/058pc8
	 mVicP4XJW2/NsqKCH1cAQH++q3ICl8CbcudW0ceHrblCZzbXvikmpdERFx2raorA4Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982758;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/c1zn3KVaeuftBM5pLVbJS/I9Crh6BPkLRgI1SFz9DA=;
	b=NId2wHLaMSFJ47+G/XLKDg3PeuE14rJESZEsl5GZjYvyLM1XH3viA++9CCU17hxnvwVX
	 Hr7jdG8iqXdSTPFQL71Ua4nQsV2VlP+Svyw7kFCx1Mg9X9AVv9oRfuceSu3kno+knBw/F
	 jDpCUZP0jvkjk9d7N18EFjdiQs5FGuiFP55QZXe5/4224+4FSLaFxzfJwspLYs44cE7pn
	 b/cc99wZdYS4CEEUtW/xjmkboOU0S2izSaV0ozC9Vgv/nFYzMIRTHX4A6H/VDpHBj2UrR
	 4r08Ax43UUG0QVswRC3V9Bgg2yIMhZGyDYe+9W6juLseJethWbRVxG9kicm0tvDjUMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xyk+97AE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEF36082BC7
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xyk+97AE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADF31F00903;
	Fri,  6 Nov 2026 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793982757;
	bh=/c1zn3KVaeuftBM5pLVbJS/I9Crh6BPkLRgI1SFz9DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xyk+97AEiRwE50kVeWNdmLo7y/RwBMQZnw1PIDz0bYK16NncoArO1pRV/YMsxQ6pn
	 oDwmLUfb/81vfzC9lu+OikICRNHzmUaX0fYjq/QKdAOQtT1UJuOLXqo1qeSkbTDfxF
	 OQie71djoQzTm5WSTdJE019NZGcLtGHLuQ9o7+ec59EccABjVutZRqfh6lyOAQGJK2
	 AH8Ql/sh+TtO5mw4V2k07JqawjKNqkJrJs6+OoHRedVSNhNxfsjnS9d6lz1VTgN+FJ
	 m+iQ0Kp92WsehzYe9p3je0Ri/9TbZB1lE6LKCVRAwWckShfOjJaKGrPtsk918MR76n
	 +SfQ/F3o9sSuQ==
Date: Fri, 6 Nov 2026 09:32:35 -0700
From: Keith Busch <kbusch@kernel.org>
To: Chengyuan He <channinghey@gmail.com>
Cc: linux-nvme@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-kernel@vger.kernel.org, Chengyuan He <channing1ne@gmail.com>
Subject: Re: [PATCH] nvme-pci: add NO_NS_DESC_LIST quirk for SSSTC CL1 SSDs
Message-ID: <au4BIz7NMY0eMWky@kbusch-mbp>
References: <20261105134526.95382-1-channing1ne@gmail.com>
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
In-Reply-To: <20261105134526.95382-1-channing1ne@gmail.com>

On Thu, Nov 05, 2026 at 10:45:26PM +0900, Chengyuan He wrote:
> Signed-off-by: Chengyuan He <channing1ne@gmail.com>

Your sign off email doesn't match the patch's author. Which one should
be used?
