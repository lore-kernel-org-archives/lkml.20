Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906550;
	b=oEtFAbECoKdv3m5uKyx2BBU3Cih65sjmYKoZGmbHOuvnSr3FdqQHPEWmpYB5UTodK5No
	 KCp/D0TCGJCtoW2L/bRtWtb/Da0U7QHAC6Ibnyaz1AFIgequbMAntpcUiQIfvxva2z78l
	 8jBr5MBvn6vzrlBW5GwVaiMt60VkLC0GXdxGXhSuQbTkn9a8tqn8UfBZMEh6LZrDeWZO7
	 Va3ZstnLVeXKfQ7IMXSvTDladtwG/S9Nx/1pZBnNPqPzUi0cKqWpxiqZArLMYieEaD43o
	 rMqUi+kVZKuLrJaCi5nUWfLLB88BgstAhvtlra7oh7F1CUNcVHdUNFKurbMM22xfEDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906550;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ap+IuNKaV27yTvPU9tyRnSjO/M66H8PyaAZ8nUSldLY=;
	b=djRfMczo9+vdzNKSLcGYyqj0b7RQcR9/rjccS3YhoVdf3mnfot2vx9EVnVXqzWUioCDP
	 dMydcuYQhdPAez5ezdeXH25yEZEZ5sceSiIVstzAiehrqPLCa9KhZOcEX7Suv/WYCUIxS
	 3QYtCfP+RK6qPMRpPhRvW79f5B0iQCeCqOEOiKJB+r8rEAMwvGrH8Yj7ZBxWN5AATVhLw
	 gU5qLuIOHAN+KD/uflth+tOjMEcciFmsz9LdcEMmjcfiO0DB9MA3H7iqY/JpkrgrSEs9H
	 X2iFnG1aSV4WkkI6P3QpicD7fmaCiDB+kZzvdS9b9yHPY1ASC7PnF4lXQ3EJkr7rgMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1v0baM6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B209606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1v0baM6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC561F000C1;
	Thu,  5 Nov 2026 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906549;
	bh=ap+IuNKaV27yTvPU9tyRnSjO/M66H8PyaAZ8nUSldLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=V1v0baM6V0JpIKN5PRm0nfTeyBsovrDFzOEsoo0uuDU7JIBfDKVvd5qX+iYI6tvnT
	 5ROziPiolrjnRMBEwQk8Hjr4oZEEePJ1QBartajR8U1YySsH3Tod0T3mPdaUoCfMCp
	 e/pGb2iah/QjNEyUBOCUFrdSmYM2PFER7xGXaE3D1JxAXc7Aol0bAqj+ret86PGYy1
	 WL+n4fkHPUVS070pMUSKteWcrOYPvcj4pFIZ3s5T0ddvgTZHD5IJnJoC/XorlCZhX4
	 odmecUHQU+PN6wCZqeTtfCQC16L37JAX7SB3z6oc5sa33hHdIRNke7HV7zK5UfzKwd
	 w5yE7lEsOglFQ==
Date: Thu, 5 Nov 2026 13:22:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?utf-8?B?5buW54WK?= <liaoxuan@open-hieco.net>
Cc: kbusch <kbusch@kernel.org>, axboe <axboe@kernel.dk>, hch <hch@lst.de>,
	sagi <sagi@grimberg.me>,
	linux-nvme <linux-nvme@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	default avatarZheng Tan <tanzheng@kylinos.cn>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW1BBVEM=?= =?utf-8?Q?H?= 1/3] nvme: Add
 adaptive PCIe link rate switching function
Message-ID: <20261105192228.GA1550766@bhelgaas>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5453bf57-fd19-458b-a723-bc7ab99c2479.liaoxuan@open-hieco.net>

On Thu, Nov 05, 2026 at 02:30:13PM +0800, 廖煊 wrote:
> Hi Bjorn,
> Thank you for the review and for the question.
> 
> The reason for restricting this feature to Hygon platforms is that the
> PCIe link retraining time varies across different CPU platforms.
> 
> In this patch, the I/O threshold for downgrading/upgrading the link rate
> is derived based on this retraining time. Currently, it is hardcoded as
> 100us in nvme_calc_speed_threshold(), which is the validated value for
> Hygon. Since we have only verified this timing parameter on Hygon platforms,
> we added the restriction to avoid potential performance regressions on
> other platforms where the retraining time might be different.

Seems suspect to hard-code platform parameters like this, but if you
must, at least add a comment to the effect that this depends on the
platform and the current value is for platform X.
