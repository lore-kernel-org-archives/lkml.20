Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B47B426435
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280494; cv=none; b=WbaPZA0ZPR//r4n8A27f+IUqskGKARUF3I9Gz5BqySUeNwlq2lmWBu3EPUGj8VEHmPJICUbYTXyfDTQppioJiK4KbdRHpukwr5oguDZbzhevFikqqcDQCqQrAv/Ktj89FIyExbMKx7mL5Y0oUEix5uYq0k+WO/1xLtxyUSpot1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280494; c=relaxed/simple;
	bh=kymMXypuN25vuh+Sll/QdVGF/CLgwh5k+bAmQcjp6Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3dYxOKg6MLHaWFz/WuSlEMAPtpqUaaQbKXXN8R+rJVoxK7zPu38oh0TsLGuBAoh7eg0kF3+noVI7f0FK/9SUonHq+4KFNuGZmyP72ec1PrtxYvz6/t6IPrAAjVGQoCEl9DkQONbtvqMEUeziiYyslQDxxLzqK//sea0lhHwYlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ZDqGv1OH; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ZDqGv1OH"
Received: from francesco-nb (2-224-12-103.ip168.fastwebnet.it [2.224.12.103])
	by mail11.truemail.it (Postfix) with ESMTPA id 8815B1F8BD;
	Tue,  1 Sep 2026 18:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788280488;
	bh=0InJ64rNB6YDk+9wa2+v0gxDu+S3dtbM2aXEVtkU8+4=; h=From:To:Subject;
	b=ZDqGv1OH4D15tUgJfWMVqQ8tSLn7X7bsnf8GBLiEuOtoc0joSoblMNMgBdsnvwWdD
	 4QfP3sNvLh4OtZIeoDuO30jefSWM/korZFHuZfpgsoV7JQGG0Z05D6lx/6llOb31fr
	 YGKp/sCQYt2ikrXAbHyeWfpF3tcP7HtLEF3UaGlh2cNJdaUsre3+Am1gooir6qFQwj
	 /zBVxs63pS/G/wnq2NsMWatz5D/KIpo054RLmDJcOFkcpmL0StDtOuqilWjckb50c3
	 ACte//wfpNrulp1wm+Z2sb3Rtb5dLtWiOsh6co5NWGMsKuF46eZGuLQ3mSA30EuMpr
	 Ig/ajQZmXYfHg==
Date: Tue, 1 Sep 2026 18:34:43 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
Message-ID: <20260901163443.GA122104@francesco-nb>
References: <20260615132640.161584-1-francesco@dolcini.it>
 <178275222394.2162147.13459463877313723046.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178275222394.2162147.13459463877313723046.b4-ty@b4>

Hello Nishanth,

On Mon, Jun 29, 2026 at 11:57:21AM -0500, Nishanth Menon wrote:
> Hi Francesco Dolcini,
> 
> On Mon, 15 Jun 2026 15:26:38 +0200, Francesco Dolcini wrote:
> > Add git tree for TI K3 architecture.
> 
> I have applied the following to branch ti-k3-maintainer-next on [1].
> Thank you!
> 
> [1/1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
>       commit: 4fb6763ec70d49f592cc6e684bfc5f17a7db7133

What happened to this? I do not see in 7.3-rc1, just in next.

Thanks,
Francesco

