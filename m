Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570141;
	b=rRD1Rx5cntDbwIt52YCWSLLU9F4BlVD40Tbeu4kNBCDV08XeAHtSAa7uB7smcoCI63Xp
	 fFkXW9VP6FHOq08pvk1xOOhjuHxlDQxIbBQpacqd8MSQaeR68gSdeZTc9lw0EImCaXOsK
	 ImRmhEqMpBlQOT67k3CgKI2lTqawNnvUt4t8bp3GqsDqKgUpQCfodE7EAv9oQ8CKBcA6T
	 amktDCPWdfeacegnKVtS2ZZPbbBHNAKJk6I9hKosU7hRvwPDiNLeWq4OowUCSWfgiLPjY
	 r6Cx0K7ywIKZp/CvKjtk5r+cG1F3QXoJ97+WUKIZmaMQGorI5gAft0FZwyvjDIFyJpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570141;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/PMq69XGcASZeuClgyMgcPaqNRM+qpkJ+IGfjzhGvBI=;
	b=rjHTk2VjJCsGjdB1csGHD9ZINpCx2zgiSxOIzAAQAhE5ksAxYVhtHNfkUx7V5UyX9jxO
	 OdGMbkgxjBjIaIWX6oPIkIWX/RvZabCZiAWo1iI7dkElGd/bWvEtDP9wEdBPQL866Bbn8
	 P9FOvIPzWVbZHT8pEDkmRUGzL3BoKlw7paz3FVreIiVNUVNsc9Swar4XhUWn+2hvsz+uM
	 fVfoT3Lxl7zTdjmiYZ4+JdThIWYLpu+PgcHLiwvt4Tou0dt+1tfdxe79PaBdAK1T3Vy7o
	 CFqJJRJTBZgk7yYP2qchy0JZv9xhWWr1EVdNctk22sznqlxchBVUS1dpAp0eWTlZP9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCSV9qZ2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0AC606A889;
	Fri, 13 Nov 2026 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCSV9qZ2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82BD1F000C5;
	Fri, 13 Nov 2026 11:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794570140;
	bh=/PMq69XGcASZeuClgyMgcPaqNRM+qpkJ+IGfjzhGvBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CCSV9qZ2kooiND37eh4hlPmir4pmYwiTa9K+o14soXWAUOkzvM3MlOehCAc8M0tXc
	 6QTcCxT0LcOlKTRpkfmYCO7Xr4oav7Z0toUlbrA2RZJktOlNecn4nM4KOdKWWx4Ht8
	 ab3Wxaq2kKTq6VhtOoPz3HzUUQ+JkS04UT9gSyF2CsQhYpsSsJLWT3vWZflX0jDbEs
	 RbM9NdNpjjib7/V1aIkWxQD6pbFOehfhqxCHGUBIe7kkEAWWK9lRBs63mtJ5DVQWgg
	 MVGo8DUB3RHylmWJNpD28Aa2TE+9xnCQIgiuYph/bqymvUoAjjwJTuA/RqjPYyxmX3
	 YVKsGCpLPo5dw==
Date: Fri, 13 Nov 2026 12:42:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add MSM8996 SAW3 registers
Message-ID: <20261113-sapphire-mayfly-of-fury-0deaae@quoll>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <20261112-dtbs-qcom-v1-1-1978370c7cad@kernel.org>
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
In-Reply-To: <20261112-dtbs-qcom-v1-1-1978370c7cad@kernel.org>

On Thu, Nov 12, 2026 at 02:26:39PM -0600, Rob Herring (Arm) wrote:
> Add a compatible for the MSM8996 SAW3 register bank referenced
> through qcom,saw-reg properties. The name is based on the label in .dts
> files.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

