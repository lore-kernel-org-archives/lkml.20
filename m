Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9939367B65;
	Thu, 24 Sep 2026 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255397; cv=none; b=gehD0nhQDxP9yNwje66ip4pnw801UA6pdHALs8WEeWaUXivj10SdvS7o148fgdak/F4pgG27c/Vfch7ybgbYmhfNC7GfMXpgNdkxYpQw4XPRVm0LSVKIVyehk2BmAY/a13Ngjn94z7rA99We2PcpN8id/9bzhuXHZbHpVHUzr7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255397; c=relaxed/simple;
	bh=O3D2ikoBBKlsWEKkHchWZmihkk82zH06c0/mW39IZ1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YD+T+iNrm2wmvbDVX1SCjcIgwBB2UNIh0JpZYH6f5EuDaIDCZmfgdkZ2Kono4gzBKnZFOcua1RO/Su7fR8O+uudGR4G5bml8Eri8SRnI1QNt3k1U6BTI8raWLsrMY34a93zLPtIr3PBh5pa6C+U6cTHq1boFD2CLaqn5LTA1b9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrNQeQsd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrNQeQsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14C41F000FF;
	Thu, 24 Sep 2026 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255395;
	bh=mwFlxKa/rm3uWzVKg8J9eMUEjOqVTIuvcYQ/dkF2Wtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PrNQeQsd+wvgc6UXKR0zPzG79JwO9/C2wy8VHV6+BtxA+zGt8tylDIp3opMqLz7to
	 X9IbDHzEqPDUck+oIlad6SfMRK3y3Rv54IrfVhnnMkst8XUGCvDnhfhPBqMyTOoUhP
	 f/0mYJlyCWqJwTHI6rkWbUFYIwia4haI1Dl0MYrEDK7M+heUfVw7qrGYDUUkAYSIHK
	 7XfWYfIuB8X0Yjgr3Q14ukoNXKpKM9SdMyyhA/HXxZrSNozKEemOrKuAtpJqrDWVXe
	 +7yN/4PoKJ75JARg3dbp1NRM/zJDtraqA1gixs/HRQY3fZ0wSZL4miin4ntuSacX5g
	 Mr7xiU8TCmB5A==
Date: Thu, 24 Sep 2026 15:09:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrii Salivon <andrijsalivon@plajta.eu>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
Message-ID: <20260924-polite-mink-of-acceptance-da5ad4@quoll>
References: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
 <20260920-imx50-yoshi-v1-1-b8a46b3a972f@plajta.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920-imx50-yoshi-v1-1-b8a46b3a972f@plajta.eu>

On Sun, Sep 20, 2026 at 09:21:37PM +0200, Andrii Salivon wrote:
> Add the amazon,yoshi compatible string for the Amazon Kindle 4
> non-touch e-reader to the i.MX50 board list.
> 
> Signed-off-by: Andrii Salivon <andrijsalivon@plajta.eu>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

