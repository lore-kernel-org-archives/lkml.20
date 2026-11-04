Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800339;
	b=Jn9SnMXHYDOUoa5qOyykd8NQzYBJeAL8Nq9khImDUkFheLvPK2vYCZ4YKqRqloGeI/1w
	 MwvF+ARGQRuuN9OKiWOyu/eIEK2fDB0VL3y58d9AbLGpJiJM5t9lakcmXwwdvIwQqqc9k
	 MupjUBPqvZ0NJj4O5Xnw5myUKeeuxZ1+R8oV9jOc6JCBcEyWybAYZxqJA7YNcUBlPou3p
	 mHp3l4tx3m85y7O+cwyUBlscKLUds5Z1Rwf5gPVu3n9HG/m1j+1pziMPti6BnAazvau32
	 Mlddf81KhGf0iQhiPrnh76kWVPZ3D2JAabNua54C56XM039b+H3IME1lHbcCfmkLx5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800339;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L08zm0MxRAbICXM5Pq7hBf1HfDXnV4iQwIZ+irkmHUE=;
	b=nbQzXQy0umGSbkL6JNfM83v2YTPmJS2f5COa2ouNTrEdhkwNEa0wYq1zdz4pf8VJLaJV
	 nXlyRQWxgVi/l09sajbsjXbzv2sqygF26vKsAEI5H2KCDCWnjcoW3CDekoaN9LOFfvCan
	 t6U5xcKUpYZPzzzvnuOC/os7ftaUcOAHtaurICgA6xhjESWmRuqatQTtCBuMfKgUn8fGO
	 xq4kcg+AUvoAaBEsggwuDv8eCqbIpZAp/8tNk3G48svocdDpHtLhTHA/BBDzQc3DAoWfW
	 +3wscpgflkg8vg7SCIufBDcfKppix/rXDuNOaMgqjSVeNdRI+iuhEpF1VauUaz2Exjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jUFz8/W0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A6F606A32D;
	Wed,  4 Nov 2026 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUFz8/W0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F201F000C1;
	Wed,  4 Nov 2026 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800339;
	bh=L08zm0MxRAbICXM5Pq7hBf1HfDXnV4iQwIZ+irkmHUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jUFz8/W0i+pfEy47Olrl+lxd9xVV0xhr4/Vl5C5XXqcJYSAXJ7iPIBzdbdq+vjcrK
	 pAQiEqoSLtZN0ZTSMpN+IK4lxFKFILM+3DDboHL/C242v4qXrTU3OcRwTWoXn8JAZL
	 BQ0BIVWUmqFYxYyxtLuqGgWnBVh7qaoJZ9HnGekCBPg8E8kaSmSkeX97N+9oyRly0s
	 hRbvpw1nDZWU1KokJUOJ8HN+M7uHJ7wHQqj3QPoW/BD9HG4eAWh8NJ3w+WCnWRWGpp
	 +WNMe0dDffwNL8CvG/ZEyZy0BWFfsu//Rg8yaRsCWCz1QknmlqonQyck31SiSHvuTG
	 1BAMJatMz1ORQ==
Date: Wed, 4 Nov 2026 14:52:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
Message-ID: <20261104-real-nebulous-ostrich-017e92@quoll>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
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
In-Reply-To: <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>

On Mon, Nov 02, 2026 at 02:20:57PM +0530, Nihal Kumar Gupta wrote:
> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
> where entry 3 carried CSIPHY id 4.

You also remove port 2 without explanation.


> 
> Describe the hardware connection directly by allowing ports 0, 1 and 4,
> and using port@4 for CSIPHY4.

All this is confusing, why do you introduce gaps? What is the reason?
Your datasheet naming does not matter.

Best regards,
Krzysztof

