Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030372;
	b=1n3k+FjUUalEw6c0izZelLe35xN11YVqMvMRExu1iwPRLX3PXP6kOLRtgq0lR91FwCX4
	 hcUKVvAH/B/D8qH2iRaqzkXZya2YrfVttCpF1cQmYNc9bToaYYeql4y/eXhTEkZ2i9XWv
	 2qHGJ8NNtET5gSphAWsXrPxX611zNGzjI/FfUEfxW/0a2APCKDD0pjQL/YbPy0+5rAvJ4
	 xbql5VA5RngxuRYx5wNMBbAyGgjc2UnTUxEgEPRI+aT9tOQjyU9w4Ebh+ThOHJM6v51a7
	 ROYMio3dLlVhzZlkQGeirbPalXosupd8FhmIHw9K75OT1XLOK8BNQWWLkQo2GqDihxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030372;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eK15j6nYIXOPiZjB7jAdCpv6Ohy0hKTb3TgQ9YuqeA4=;
	b=0qXrkhneslKjzPGss+s/B9urnp1sDv3AgI/nP/0zn5feeSzSzUn3WgA7092sS8mkBRAD
	 R4pFlTCzynNW+uk4tZktEaPDaHAf1Pf1tDtWJ1eRDLTWOy9BF5s69IGKoVyN9Tk4ITXag
	 nGhJ/6i0Cv9t2n0r9L3j1uvwCRBBF4rw3x7+jAgEVngKQrtgL1rXkg/Iva5Y1zfhpI6mG
	 /Bb18ItpsJJvtB+QrGdNDEX2fSgqAdEqPyphyMkXSWnUm0iwP7tkvG/Fvr7BMeKOcgtJx
	 eJ5Tbu/LD3Ck4UbUJbOpy2FbY+1rzioLaenzxOvIF9JQH8VjZ1BLOSyczeInbaB460Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mOGIq1VT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951C1606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mOGIq1VT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68771F031E1;
	Mon, 26 Oct 2026 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793030372;
	bh=eK15j6nYIXOPiZjB7jAdCpv6Ohy0hKTb3TgQ9YuqeA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mOGIq1VTDMxKZ1VNoZmgx6FyhpJWHgRv8gl/GuFLQ6RfwogCNgdE6pSMSfPrA7z1o
	 0aA09lBxujUN9hy8sWTFU67xP35y0HbYu4Hqg6ET0+9D6cDmtZKODSEDZtjAx8ePzz
	 O7FA/ie+ebCTTgUCEX98/I4auUF99+dmvWpgB3E6KNFQtfr5o4uHvosXHRIUrUfxMc
	 qASQmDsbQH5Tuy12wed2xd+6Mhl6Rkx82kVj55Mr6D9p8KX9eW/Q5Z/VB2V4d7FSh8
	 5iC6x6TS2qJecw1EhAtStfAQ/u7NfULEVq2IXXP4QrOEevLj2tZHnEiVT34vGh2MJi
	 UlwEi6NwEzHRQ==
Date: Mon, 26 Oct 2026 09:59:30 -0600
From: Keith Busch <kbusch@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: hare@suse.de, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, axboe@kernel.dk,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet-auth: fix error handling on CHALLENGE failure
Message-ID: <at944v_Bp3g336kE@kbusch-mbp>
References: <20261026164526813_4KvPc2SI-CEJ2Mzh7HN3@zte.com.cn>
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
In-Reply-To: <20261026164526813_4KvPc2SI-CEJ2Mzh7HN3@zte.com.cn>

On Mon, Oct 26, 2026 at 04:45:26PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> In nvmet_execute_auth_receive(), when nvmet_auth_challenge() fails (for
> example when the initiator-supplied allocation length is shorter than the
> DH-HMAC-CHAP challenge response, or the challenge nonce allocation fails),
> the error path sets status = NVME_SC_INTERNAL and breaks out of the
> switch. The unconditional
> 
>     status = nvmet_copy_to_sgl(req, 0, d, al);
> 
> after the switch then overwrites the error status (nvmet_copy_to_sgl()
> returns 0 on success), so the AUTH_RECEIVE command incorrectly completes
> with SUCCESS and the initiator proceeds with a truncated/empty challenge.
> 
> Fix this by freeing the buffer and jumping to the common done: label on
> CHALLENGE failure, skipping the copy_to_sgl() entirely and preserving the
> NVME_SC_INTERNAL status.

Thanks, applied to nvme-7.4.
