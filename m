Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904333;
	b=xwo5qDTPiDN5gUzFMn2aGBxDn1WG9Ars4E4Lvi5ajSSJwvS6P7yzJ5MR2E8yHVp1mrDA
	 dVJPnUQDeiUwmiG9tVn+UHBMbUr1huI4i1rmc+ChOd4vGfOo8DjeFDASiWQTBaVJMmPQY
	 lMq0PhTohVqiVLJA8fNCNwuXYCadldbbfD1aIGj2kTlGS+g2uO1mkXuDS2voTFVkPoOPl
	 NW+gF+YRB1xNu/uwI7iQV6K6frfaeh1uEA3d8niIxJXpYUPSzZroGLF0DW69x5nzPn9Vf
	 AL/61ZTN2JQAgqralP1gcj6e2TIBgEOVOefsLp65ZvgdwfNXpgU7fApLxAhYOOqmkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904333;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=x66uC76W1OU86H6gKf2MJX5drvOwcsSMX7Gy6dbeK1w=;
	b=SLosoTo/bkuJZGJrTEjgTrh6ERFhFMJEhojWDSpf0oFvzL1X5fYebP38dStT92lBszoT
	 HJxiopP4+AqWFysa5gjIkRvcxMlUrYLci2sgkZUT3/W7jpUgDlcFG68ocwurkUM4UFT9T
	 WlCXNAssa9ksRNcxbP5CvnVcSlr/BXUp1Py76899IMYWEwNgHhK6xO5fePHBWL6if79JG
	 EeQItg2/NJaWEmZUYsH9+I85w7wLIKwd/4Sk0oROvLO72QjdcLCtaZAXEZgq/GAZ+invB
	 4cZYqKJVh40raZXfb71BfcZAs9DftqWAQM/F9DmjpLxW2GRMpDAeruDooo6CHhY/0aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVOl8S5N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B087D606A894;
	Tue, 17 Nov 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVOl8S5N
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A38B41F000C4;
	Tue, 17 Nov 2026 08:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904333;
	bh=x66uC76W1OU86H6gKf2MJX5drvOwcsSMX7Gy6dbeK1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PVOl8S5NmeDXA3tBtiCy07OQr5sYrfDgylLbnZpsHAvGeRarjSr15GSdj7sDzq1fU
	 nXYUQsfqnd5mv+nxmgVv9olAq4gocOuMhyVidx1TNWR2ZU7fQMY13JunCBs5Gqa8l0
	 BTzH1Knn+fVtWzQ9zVgIFRCBW/XMin/fPQ1gJeBWYXLBUJpLZhapsPMukdfJdUZbW2
	 Y9rqQB0HxKBiTcLfBqeo68hOJp938fmlaJMPmiGx/QUFGtAWrBIInvw8hZeZ1HPfQc
	 dZQNLkFd13dWViog1SjvBHqwGy91R+Gq3GEFN6suzeyXz3RoIvfyfqhhHzwX9r9uQb
	 suxHX1+U5pAfw==
Date: Tue, 17 Nov 2026 09:32:10 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] firmware: qcom: scm: simplify code by using
 classes
Message-ID: <fcocwofapa7sfuzobdrhyx7dfw7lwxozlikptnnrrk2huc3iom@nflswbjbknea>
References: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
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
In-Reply-To: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>

On Mon, Nov 02, 2026 at 11:18:51AM +0100, Bartosz Golaszewski wrote:
> There's a pattern of enabling the clocks and/or setting the bandwith
> limits before performing an SCM call and reverting the above after it's
> node. In all places it's done unconditionally and can be simplified by
> providing appropriate classes. There are also a few places where we can
> use __free() for tzmem pointers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi Bjorn! Gentle ping. This has been reviewed and has no sashiko comments,
could you now queue this for v7.5?

Thanks,
Bartosz
