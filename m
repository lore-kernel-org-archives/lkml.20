Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199398;
	b=bqN5ZCSJWJacxbAg4gdUDHkDCUB4vYNpoTw9fa7xBrdUg3vaSRpO3qtpLR9cMVnNfFtu
	 ovlZ5nmKlXSqOcdEDl3CahxyY8pEeNLOm3mqZA9n3OqMWgwDe8ttbyVQvzgydqrgsuAiH
	 Baov9R87cVmFrozDVGZ6ZI3kyJOZtfjJyLeQ7nFbCWCeng5aZRuGg1WB/EfmL5xSF7vBN
	 XpLBDqhnSifm287J4ILa8hMh/gyTbqblk1rshQcfu36mx3RpdH3nTLo4P5XaEc6Eti80s
	 BnCylAMYTIxEny//y9a5SOW6yPZNYq8tfJVo6dvndts30aF+leQoB8vcyYSlsXzbCYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199398;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=rT4EsW428W7L/HXUKj32bjct/IMAM7+t4B6+nqzxxIE=;
	b=CLU/9HN5Z5k0YPggbC9li+IHkTfTMG2AaluAmUIgkm8xaB41cvoIhqRJeA8pJ7+PQYQ6
	 PIKE1CvoXEzXGX6DZk3GVhXrZGsyQCnvKWQcbMd2njF44tYQ0eApTx5vfejIe4L4+ri7w
	 Z0tDJQEze1pxxruTPS7el8qka3uTJm1p+/TkWSQL9i6gTYxVjRequdhxBlLxr5sBFINIK
	 7MBwCyTFy/2jYDHhLCSG9bWYuqg/jEzJxKJ9eq+Nv0ij1DdYvmzUcc8kLVMbzWrzokdL5
	 /qO28e8g0fQAHvExBoJXyNb6d49g/I74eZ0NfF4Or59PS+7u8pqo24XFK6EOOmw9W7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA991606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA991606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9F96F68D1E; Wed, 28 Oct 2026 15:56:30 +0100 (CET)
Date: Wed, 28 Oct 2026 15:56:29 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] nvme-pci: shut down the controller if disabling the
 HMB fails on suspend
Message-ID: <20261028145629.GA15112@lst.de>
References: <20261022045828.1392332-2-oss.patchbox@gmail.com>
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
In-Reply-To: <20261022045828.1392332-2-oss.patchbox@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Oct 22, 2026 at 12:58:18AM -0400, Yuho Choi wrote:
> This was found by code inspection as part of ongoing, not yet
> published research. It has not been reproduced on hardware.
> Compile-tested only (x86_64 defconfig with BLK_DEV_NVME=y, W=1).

Yeah, the only way this really should happen is a communication
failure.  But your handling looks correct, so:

Reviewed-by: Christoph Hellwig <hch@lst.de>

