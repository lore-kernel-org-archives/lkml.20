Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077629;
	b=y2Id8X1iMeFGS/75YMUXBVOA4qF8UVAljuITlSgXGVEsYIeE9ewNsDOHUwp+FkclAOJw
	 Kz//USRErONxjwfeGkbUZ0pPHHKiBLqXRgxWirLLv103RQQX/WYioUpjdCkYlOF/mEfKd
	 JlJxJL4tEnpRJg+zOnb2AmNv/mtuFbLlsS8U1J5DMGfYEFb23sGWo1yOt9Tj44SOKujJC
	 n4f0+vOz+u/Q4dp9w4e5qlBSTUsvXw7pp8sQTozYforedF1SU/lFXcYexqQv4+jXuCysT
	 JAXIJ3Nl3ZTKFzsFzaOtI+MqafzzLLoyaqKB3xirRYNuVPhE+5/tqfvuawUH7SjcUoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077629;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=AlqGqXJbAh48oYfEbPctxXp0wIH6UKJyhzta4aeg3dQ=;
	b=hTR/yQ1/IoRaTbDcJEVCdW0k5jhyBtMSRmmMqEYasHjix25FNWZD7fKs1qcAUwPIW2W9
	 SAaDKK2wqsj1CfpFKiiwQWmoSX0fHhRD2pDw4XOgsyOAUj8RMMhf89YH0FCvu9n445p/1
	 0epLNZ1SIOVvVCtapyGJhDg4qBD3quInNcefmYrt/Ona4ITZAePvdA43TquD//exMMsxw
	 FxJ2M88jnaupzucovzOjj4C2pVP75POWexa11lNBE5Is6VC1pMDwyXlu8Dz+A/8vY9PPh
	 tTeYcJLEngHSFkBOfGfas6XBP6r+oqdVE2iF7ACBAO184rh0bh3bX+4QshB7ZshrGAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=P+OBqBIQ;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7700B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=P+OBqBIQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1793077124;
	bh=AlqGqXJbAh48oYfEbPctxXp0wIH6UKJyhzta4aeg3dQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P+OBqBIQfg4DJXzClyMo55+52i1Hy+a3hvGVqK8sK4+aYKsyT7oWenU7nXkiq026B
	 lRj4VLNWdFG8oAsetFgToj6CUmXuDWPSH0vnSSriF9nzfW2WZIlPRIn21bAPzcPktL
	 7Az9c0VXsSLpNFRLzmh++TXgFXhD8G7xOrs+KQzY=
Received: by gentwo.org (Postfix, from userid 1007)
	id D84264029C; Mon, 26 Oct 2026 21:58:44 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id D3679401B0;
	Mon, 26 Oct 2026 21:58:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 21:58:44 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Juri Lelli <juri.lelli@redhat.com>, 
    Vincent Guittot <vincent.guittot@linaro.org>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, 
    Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
    Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
    K Prateek Nayak <kprateek.nayak@amd.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    "Christoph Lameter (Ampere)" <cl@gentwo.org>
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/rt,dl: Remove unreachable migration-disabled
 push checks
In-Reply-To: <20261014-sched-rt-dead-md-push-v2-1-9f57f1a530dc@gentwo.org>
Message-ID: <b67be0cc-ba93-def4-73ea-3ad4d39e7af3@gentwo.org>
References: <20261014-sched-rt-dead-md-push-v2-1-9f57f1a530dc@gentwo.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Christian and Kayra,

Thanks for checking this.

Christian, thanks for the Tested-by and for looking into the
history of the fallback. Kayra, thanks for the review.

I will keep v2 unchanged for now and wait for any follow-up on the
original fallback rationale before respinning, if required.

Regards,
Shubhang Kaushik
