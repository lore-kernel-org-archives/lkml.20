Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482172;
	b=EbYwCFpod5C1OahDbcfclNSIIgheOvCvj999EtcMin3gbHhIPsfS09LtRNeN2Ao4Qf40
	 GDrQqxe3wqDTLP1rJCQjaPFeYH4hWHZjSJEr+MO71g/03zba90vVAo4SA3G0tVyyABIaE
	 +RlJB0OpKM5enWw7z7HolSUPT+oHnsCeizFS8IwixgdObg4JH/kNZr7nU2SsjDpjAwKbX
	 //o7KetjAb+nwlKwT+bfe0ui6ldcab6icDQC7Aw5t0ZVkGfjsrNe0jzF7ZOsd+H9kscEE
	 Xb0VQ4kn4vqvSZBLTjGYfTOdUhdbh6inRe0nCaCyEg7d/1+QW8F7puoBzEN8ZzRXMiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482172;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5FKMaDgjZubNZfihW+uC98N02cMI6OVWwk6n2JdodUo=;
	b=cRIyCzvWlhWTfytdfuF65w+6qsybbKvO7iKPIeWc5ujsbw7BlnnDRIT2ftuqVKCXulU7
	 iDHfjjhjpn6qDpE2rnI7GhAxmSWKaKGTWz0c4FXQM17bgRshE6xBcezd/Dn4TbuXl/aJt
	 nxL64rQHvsAx46SqB+9Tx9b6uHapSNCLKzQ+s3EMZgn7UaNsOuqMHJYptMPbRt1vQ92er
	 D83BDNv31RYfYs26OPm+nhw96OroeesL/TgIGBFyevPLPHPRjvJST1PoSpkp3SOyRFT9L
	 UFMI4aAYjLmA5vxE+WitDdYpno1rumx23DMIglXR/oV8I85P66Jup8HgG2xGwY0dyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hgzu7s89;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973E4606A32A;
	Thu, 12 Nov 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hgzu7s89
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF301F00A05;
	Thu, 12 Nov 2026 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482172;
	bh=5FKMaDgjZubNZfihW+uC98N02cMI6OVWwk6n2JdodUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hgzu7s89Um1a5/tuEvCD33c3B/0PuUgRdEURt6GckyTpLeK+7ttQLA/GIKTX0idxm
	 AKFOCHSyFiwiE3CKT9X2axioN+EBVjO/CUXDXew5ixRKiHgGqGVi4xflW80UPHKcL4
	 /dhSFE0Nnh6kcLXO4kdpzhSWgSlUMwKc0b239B4BPEo8DDhkiuEnkJBNXuusX5186n
	 /wumGugDFrn/T8EJDEYxqn6ufgBNWC2CrRe9oc9DdIwYtstBeVCl8Km/GUbaC1J+LI
	 Mc+ekS7kUrtOszfQhIF8XENMQUDiJ3GqU/VIu7LoASyavoggc7j+Wra0P0BNNufxZB
	 EZR9aqtnpqx+Q==
Date: Thu, 12 Nov 2026 12:16:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Message-ID: <20261112-alluring-meerkat-of-elegance-dbec9c@quoll>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
 <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>
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
In-Reply-To: <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>

On Sun, Nov 08, 2026 at 05:54:04AM +0000, Stanislav Aleksandrov wrote:
> Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)

This goes with the SoC/board bindings often. Why keeping it separate?

Best regards,
Krzysztof

