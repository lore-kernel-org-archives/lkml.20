Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C1386C3E;
	Sat, 26 Sep 2026 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436845; cv=none; b=X4jA90CVXYu762FHIOZiob4a+yBIeW2yT7cCA4qDfWIgm2TBm4mAdOZCKB1eDYY5FHpdmXqjMyYQ21dRUS0bfOtrpXdRa/+qUR5Fc80nuEdKIZT2CmptGHkexCLcQPhtOXj79VDuVX4pOFLazkZ7O7ZVjzXvCAes1wNE+TNkFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436845; c=relaxed/simple;
	bh=tMszyT1L7RMv4Wx38A/QEIGl7WhzsJZpNOcUsj3WhJM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OAgTZYcKmI7Vt/3x8ZgovB+/lAU69MkSOJudgbiGPNFjxFcxB2bbtMnpTQTIU7MRVCGKDcn3mQleM+XDmwDxHkXom37KmtCa+NYQQ7ceJHZhwR3ubZvZTdCaoZSBIY/qQZjw+jGdFiXskFcY2qGZvR2kD1kHT8IvfKZLiTj2028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Mkrv0+sA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Mkrv0+sA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B9528408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790436843; bh=dlb+Mdg1cAGVjkptCdnmHxV3LPAXC7XTWh5E6a5QBDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mkrv0+sA5VQ8kp4RXXvXJ5X6+5deW7Dkj+WP36FTs1EyZmc8qh70hESsZ5PZvItQC
	 dQLjdEVTwyEA/80xdbXa/WAIkqwRmVbduOl+SSdOkDZKFrnJXpgXykS/zksSr6I+RG
	 7ipxJUg8yUb5RSJ9H0uCzn7zh7FNXXVGohGgOt513cSGfJFFRthtClOKnST8kxFIzn
	 dUOSxni3yZtI9xfQJ7mu7E0puOhul9ep177Zrb9xuUR5nzijto+thUiMj4zVFkh+Yb
	 F5rqf4m7Styj3eA7JFNCewY4IqgmRd/PoE3zgarDovDICNVtrnWiDZfRhz8vriga5B
	 u5GsJG4rdnVVQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B9528408B3;
	Sat, 26 Sep 2026 15:34:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lucas Adryell Ramalho
 <lucasadramalho@gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate
 maintainer-devicetree.rst
In-Reply-To: <20260916134637.216062-1-lucasadramalho@gmail.com>
References: <20260916134637.216062-1-lucasadramalho@gmail.com>
Date: Sat, 26 Sep 2026 09:34:02 -0600
Message-ID: <87a4p43u39.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lucas Adryell Ramalho <lucasadramalho@gmail.com> writes:

> Translate maintainer-devicetree.rst to brazilian portuguese.
>
> Assisted-by: LLM
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../translations/pt_BR/process/index.rst      |  1 +
>  .../pt_BR/process/maintainer-devicetree.rst   | 76 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-devicetree.rst
>
Applied, thanks.

jon
