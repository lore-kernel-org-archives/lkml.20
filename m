Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152940;
	b=JAvznYpsnWeOMCqjlhO99CFbCBkKu28VnslCR2NkCBSmaVqYTbXQCrP3Zre1PHxA5rqS
	 1ARU0s66G3SYonD8rp75ZrfHNs/f359CT1etMKbOThcegaTLFivg9nRwWQEKahgZBz9su
	 F9Xk2nHkjcLzouauGZe38fCFUZ43MMUYgflSJczPSJ5wQj7xDaE/X0PSRDUvm11znSyF1
	 vaMEVxxcfxRu+T3mYJh1iE8PDGe5R6fhMHx3VDM+I6uFGuqsC00K32n3tqj5F+qaTCfwu
	 3n+LRgTKI9vUhP3SG4pn61hRMNwaQc4LpQeuwDnb+1al0j7i1ipABjFemj8bfa1jSWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152940;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JUZpTPwtsTYUFSEsrpQwXWgZoO/NXGbcSwH3xZK0OKA=;
	b=5Cn8HXzSq0oCnnOuc4vonM77pR/0gyLlJRASok9gjqjQ/3+aSMMk0PdaY145IL9A+DAN
	 yfk5oHFefObmo3T2gVJKFk2RvtEg1ddbOdTFo2Ifm67UNxytb06DBwwNpmFadV/80cxH5
	 f6x+I4wWK5sew46wgwtRsclt7+jhmJnfQpA1qEOF5kvT0Lwit1LLDrsQdbTTEe+zZfx9G
	 slfvhNg62agfT1rlo6lDdo59OD8n9401x9WQjQcZgBAxouckadfcqMhaJvDijs0rvjTIw
	 emRYrNyZ0+mxDqDbP01osAPFL1LJBO5DFxoVqkM9mRryIpwuRjRNrKZByuxpRGbLPUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egToMPt2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30000606A31C;
	Sun,  8 Nov 2026 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egToMPt2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE2F1F0089F;
	Sun,  8 Nov 2026 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794152939;
	bh=JUZpTPwtsTYUFSEsrpQwXWgZoO/NXGbcSwH3xZK0OKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=egToMPt24Uz5/naUoZfRKcpUuLOurSV+z1+3iG3h7F0m8X1hscyvJ8Wck1bzEsSnY
	 Lfwbsc5MyUfvkc00ETTFQu1ha9oMbHNoVUuP1kyfQSAAumAXuq80iZdshwoXlFz4LO
	 6ulCDFy0TF+S1AU6ROpf5ao+hHVO3AHeTVkZ4cCDQ3tAZOfWhd9ychk61vB8wWPLPj
	 r9dFbHDuHDbV/cheftc3t1fEH2NXewYJcHmvy5K0OyIrvTn8etDVSwLy8/keTlGgHh
	 egZU9/3kYqkfSVyX19qPFmK48adpW7JYWceccnSU9MeA2WtpFfPEvrWHscamBDqJMz
	 Albq9q7qlkeyw==
Message-ID: <2648d9de-9bb6-4c36-995d-b671ce5477cc@kernel.org>
Date: Sun, 8 Nov 2026 16:48:55 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: apple: tunable: Allow passing NULL to
 tunable_apply
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-2-c2783b2a53a8@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261108-t8122-phy-v1-2-c2783b2a53a8@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/8/26 16:43, Sasha Finkelstein wrote:
> Make it easier to have optional tunables by tolerating NULL entries and
> doing nothing when one is passed
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Acked-by: Sven Peter <sven@kernel.org>

Feel free to take this with the rest of the series through the PHY tree 
once everything's ready.



Sven
