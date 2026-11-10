Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298183;
	b=POIW5mbzEGs9hTDJpij0FY5LFRdc+M78nW9H/1FfQ9x0NcXsB5aZbM1LbiqMadScIpc4
	 FV80+RYPaSvZJ7qGVmGtjZCe2m8rA1JVFl8R60qZN393f3qUzQU03lJTrdutRPJH6i3Na
	 TZu49kb5zbPgu9DBtPGCiULrK7f47vBSgLAABkYIYsKlPnhU80rzjATCFY5VStOSqECYt
	 1TTP1P0rbbZHi/Pp1yw4YCySFyNQrrELBnqex5ESjSV71nx9dAaIrDCyOvUXge/hmA8/N
	 X7DRNOHjQBzFatfaLnltS/4FoQUMoFL+R+TD+acG+nuQ4mz9mpfSeT5Aatx9WVFdFFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298183;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CogJqsez+MNCvBU+ZLa877ZQMGqVZctnGDmIr7fz2AA=;
	b=IkViXzXiFXookVSkkIb6AZEyBkfvd/pLZvEi9O6JQ/7JLgKAQPzjxVPJQ11/z2xXLq3v
	 1Cc5E+mHrS/+Uhs1lTXzK8pE6PpETw5bwzQvXG7V6y794Vnj2J5bGO65kJRUi9T3/nxZt
	 wMmPD5p7KTOOkxwHkbp6WLVhg4zArsbnE9T09zfzRFzI22ybRzGcIeQmh5vlkiVHtJXbw
	 nA0TSQLYp1pRfuSA5+ZWmnZoSgldXnf8HAfq+tasWO1/uQEGbzGR/zNqUMGY246rMQK7j
	 dDRXvgUIHF4eMZ2nng6G4YIsw7ekOz/HDbjW+UicESY5kt5w1pF1AUK89MgbHDe06RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FSQjdqgg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E6606A331;
	Tue, 10 Nov 2026 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FSQjdqgg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68AB1F008A3;
	Tue, 10 Nov 2026 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298183;
	bh=CogJqsez+MNCvBU+ZLa877ZQMGqVZctnGDmIr7fz2AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FSQjdqgg86Kk/8pEpAprGzSXuGH80UsVHxHR/2t5ZfToer9oCxRmNOS52UUh4su1g
	 sQ4S/PkOhA77FM/rKYNuO7sLi0QtVjYQYYF66n0fB6VgS4FZxNg+u82Vy7ecie43T0
	 xnBPIgZMK1QG31JUO3pcxEPFIsEj26JUfWo10SxPA7npYGfkgPg6xWlc/TWIBqFy8A
	 BlFNyeufTupg2SRin/h7boWrbvTfap5CUtZNO1qLShS42FVkDb2I/VNfgYDJsEi8HO
	 HbjQu9+eaHhHFMsSZ7wMPWzOJ6GatIspprpE6VGGNC312R9FF6/tA27OwSrbz/UbnM
	 Z1UhDTRDGnv3Q==
Date: Tue, 10 Nov 2026 09:09:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorena Tanase <tanaselorena3@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: wm8741: Convert to DT schema
Message-ID: <20261110-international-evasive-oxpecker-aaaedf@quoll>
References: <20261109165522.6663-1-tanaselorena3@gmail.com>
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
In-Reply-To: <20261109165522.6663-1-tanaselorena3@gmail.com>

On Mon, Nov 09, 2026 at 06:55:22PM +0200, Lorena Tanase wrote:
> Convert the WM8741 audio CODEC bindings to DT schema.
> 
> Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
> ---

Where is the changelog for v2?

Best regards,
Krzysztof

