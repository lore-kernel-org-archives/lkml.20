Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960213;
	b=OJuoO7sUrTkefRB89iOhEX0yN6a3q5UYtM5oSMkYZfNcfCq03cXhxkxIljeqNfCZGG4H
	 jYkw51FBHjdNC9EcD9JeFwWAPcRs65dohFWmDfM5pZKHgpVin7TX15PnXR6ngoXfXaK8G
	 /x9J/7kj8N8pjwKpsSBMlGWki569rv42OvKldJ3S6BG1lXOWr/rzPv2yp02X5GwPXjdAQ
	 AACcAAkAvvqR3PV37aloEd7T8Ygf6oSkM+GPs5FrGeCnP/JhFInTqLtNAS2ZKSIHkKO5p
	 Tj2nFcP8be3P3TdWy75ZX2edAa/J4M6C98XQNOSc0I4LtinNxBcH4B8i/uMikRVo3IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960213;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+gNGIgHBR6OOPjcVSPkPXocOwl0ylfDvKL0KY+9viFI=;
	b=5r9vJJ6TYoPUJPd1j3+lhakcRv1qTFVFzzt7e1390OYnJ0YIcOuY1L5BHaADOa6g8WoH
	 ac3ljvPnMXMm80OWkmA9ypzLRcMD1uwdwnY1scwZ1rJ8KGPWAR3JNiNYyjOQJM4L8ofVv
	 AC/0QRLM0dOEynTU1rUfv9Pwj34YJvUKSKKXdDmG8bSdVjOdlKZghEYxumlxBbbheb3oj
	 HuIMtkmVem927Mnwepyqqakz6lzj3qeT869kew5jbFIZv2tR47aTv/gU4otVEcfo9Kgzo
	 mZtfVINFXR1O3Cz13kqLJGKoBX7ZjOaXe14AxrwfYTdTldu7vwwpnPWS9+h73a3+/EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyvwIgI7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE011606A326;
	Fri,  6 Nov 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyvwIgI7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC901F0089F;
	Fri,  6 Nov 2026 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960212;
	bh=+gNGIgHBR6OOPjcVSPkPXocOwl0ylfDvKL0KY+9viFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dyvwIgI7IyG1KTYZDsrSyVNWW3Pr2hT2V1jRVkQCjbrimZfLLebrdFzC10Q3ZPTkd
	 s5BFXalR4rKLepqjo9NmRqDpc0HXw1obDSBcJNu3o6+avfK4O/mbxpt1v499fFcNM5
	 ZgGwdQ4Tf1MO4Zo7lsakD1luQQa2aL/UnwOcuUdrAzMpiKiqiE+0/8HVgcam1JKATT
	 UPzrOrLXkRBDHym/rSrySXDy2fQkGL/WOAdbvnMdQzFtuDx32ssF7a7b+tcdWGqhKx
	 Xwqx/442je/8tbZ8YxqEtdO9VKzHS3rZXETNl46Ro4H8eN8Oci+lgi1QmZQsxUMnkG
	 HmVrqhHRD7FxQ==
Date: Fri, 6 Nov 2026 11:16:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Simeon Marijon <simeon.marijon@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
Message-ID: <20261106-truthful-humorous-centipede-bc21ab@quoll>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>
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
In-Reply-To: <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>

On Wed, Nov 04, 2026 at 04:20:08PM +0100, Patrice Chotard wrote:
> +      nvmem-layout {
> +        compatible = "fixed-layout";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        /* Data cells */
> +        wakeup_sec: tamp-bkp@0 {
> +            reg = <0x0 0x4>;
> +        };
> +        boot_mode: tamp-bkp@50 {
> +            /*see boot mode selection feature*/
> +            reg = <0x50 0x4>;

Mixed up indentation. Please also run scripts/dtc/dt-check-style and fix
obvious issues.

Best regards,
Krzysztof

