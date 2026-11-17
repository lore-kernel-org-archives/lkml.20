Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936190;
	b=GcPu95TIlw3gJti4fyFZzAWMFbuFGVhxjtji3oNSe2EuqirDeM1WIg1MsIxOHaLtRohX
	 v+JceXQw50coSuaQlmChxiGo+Rc6D3OCZWVIAZvSSx9UTpuITXXgsBEDytgdYRcsXMtcs
	 nNRDU2Ivz3Hy7fKRhSkNeNgBnY1PQEZ6tTNhVRPrCEUmBzcpgEvnwF+c6TSZ5KTF0u1Jw
	 j5uprqUibCNjWPPAiuV/QKlE4FSZ9UvL6P+RaSPlviaNb9LNNJRQeHH7DHzPlrtFd2++W
	 EsvmJKPpC1lFcPuQvwVtHQthAZGITxhRka0RZ49klWqSgiIqZUR0YEpsEmMuWAgHvmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936190;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1xPsU54hJeiHMuz5s3ANZmZSG1cvsb4sESiD5rFdM9c=;
	b=QsXrpuXDx/pqnteD3Ug75FpQMvu5vDa4LfpZui5YzGvtT4iBdQl3XXeR3ogXgRWnziUH
	 rDZMG/gyHkeQk0Cx6PG7wnMDDRTtMRHX1cA+ETrEoGFJVMwWGQzO5CV10TRAUZulznAau
	 gZFqn9qjmhZAUQD+OfDINvWePajnQm3RMQpBltwg1yfN8x89Swv68P993kCWo4JyNGfkO
	 s/ufogOUFpuxOqMuSKajvc4suRScgq/AkFshKTa5rZ4v/uLwbL7zJNIlQyBLbdMT36s/+
	 SNC/4lHSw+TnmeAbupu0Td0fRb1+L0SQKMZQ9rqPWiZbnZ5V1y1B0MFsqhcKXe57fkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=okOepPWP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AEB606A31C;
	Tue, 17 Nov 2026 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=okOepPWP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C021F000C4;
	Tue, 17 Nov 2026 17:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936190;
	bh=1xPsU54hJeiHMuz5s3ANZmZSG1cvsb4sESiD5rFdM9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=okOepPWPDAEa/fLMSHEtq8RIGPhEkyThXI5rTj9Co98KzmksqzLsE7nq/3Pk+O0g/
	 wyuC5nza1JoZusAMofsrgGy59SJ7C5QpjXmw6me2ekp7uMjQqs68pQ6I4JE9B1d5rI
	 VA+j7ZKVyA6u1zNp6bEcLV7vOMV41NhtP/uBcMLCL84t+dc0YvD738YsfFAkW8/dBI
	 eysiTjqiFdvRtThdK5ehi8MBfzGWcFg/c7YVrGRWgTvkOThoW6SOl3nI8Ow/gh6J0V
	 SNq7UYtqnQMbde3JenA0aAwyY7s0bBqMIJLF2D7SQVN9j5WpnAiZ4F0DgrnPyjeE/o
	 Iwc1PXn25u0Rg==
Date: Tue, 17 Nov 2026 11:23:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, niravkumar.l.rabara@altera.com,
	rounakdas2025@gmail.com, krzk+dt@kernel.org
Subject: Re: [PATCHv4 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
Message-ID: <179493618746.2836620.17399291348633315970.robh@kernel.org>
References: <20261116202854.3087673-1-dinguyen@kernel.org>
 <20261116202854.3087673-2-dinguyen@kernel.org>
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
In-Reply-To: <20261116202854.3087673-2-dinguyen@kernel.org>


On Mon, 16 Nov 2026 14:28:52 -0600, Dinh Nguyen wrote:
> The Agilex5 EDAC module supports ECC on a few additional peripherals. Along
> with support for ocram, ethernet and USB, the Agilex5 EDAC adds support for
> SDM QSPI, CRAM SEU and IO96B.
> 
> The Agilex5 EDAC also exposes up to 7 named interrupts on the manager
> node. global_sbe and global_dbe are aggregate single/double-bit error
> interrupts that fan-out through the manager's IRQ domain to the child
> peripheral ECCs. The remaining named interrupts are routed directly from
> dedicated controllers (IO96B memory controllers and Secure Device Manager)
> to the GIC.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v4: constrained interrupts and interrupt-names to 7
> v3: Add minItems for interrupts
>     Add constraint for interrupt-names
>     Add interrupt-name as false for non
>     "altr,socfpga-agilex5-ecc-manager" platforms
> v2: add if/then to enforce maxItem of 2 interrupts for older platforms,
>     and 7 for Agilex5
>     add if/then to enforce interrupt-names as required property for
>     Agilex5
>     enum altr,socfpga-s10-ecc-manager and altr,socfpga-agilex5-ecc-manager
> ---
>  .../edac/altr,socfpga-ecc-manager.yaml        | 90 ++++++++++++++-----
>  1 file changed, 66 insertions(+), 24 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

