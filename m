Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191958;
	b=F/LyhBl9i8xLpdtXMNJcBb41BMg5xJzrwl7wteoOwk/mp64TGkwQj/E0ZALmwYH3aqOA
	 plyPnjLy8D9aQ91Y4YUv+hUFi/FqQ5P3z89GB4HtyQbHP2lRBmYJwjuuWxCLMnB/vTPbw
	 e4eJnYmN66QkvCmMrIxQW7o+tvIQTOXyR2xk37A2xbLulmjknf9FTMlZaWtsDOnAjNvXI
	 SSWRIefYo6aXya4UcHQYOofNmjEq859qIPTfEQFkRCwXHJsbPH0UpUCRJV/mlFQ7RHkYN
	 wQUYmfZ31CCTAtd9LiyeEtv66/4CphmAotleAtcHjol4fWNP53mY207D1BXzD/ruAlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191958;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xKPX+HyNrE2o41R0rPagiIf/0OMnYW+RxTq37JWlHDY=;
	b=S1apWQypoU9QiCXVvFAQQa38zjtg6SWHE/MP58LljNgHGEY24SN+ubCS6/IgQRawNV3P
	 kxOXbAMseE0S250ID+p3HHyEtkCoRbGP9c1BSsqoD2kNdh1SAWY1mNb3mB+Zr5vvq3ejf
	 4Al5VGT3ZlLSOFGVaaWUYZ4Pxf6La2HAaADisr6eF7zOeqNYOukaXIQYDds0Ogn2Dyb8e
	 LrSuzWm4eXzifo0xf72+Ze6khzNoGAWrqyBkyIfMxmb2VwsgsX34PSyBSK2LeBGisoOiy
	 7niJUPHpDw2qhLuSrDhy6kNeB702RH0TgcKCEvS4BqzuS8+XCFNDoFcsKhkp8FbBjxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys7bH84T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A9606A323;
	Wed, 28 Oct 2026 12:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys7bH84T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921991F01829;
	Wed, 28 Oct 2026 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191957;
	bh=xKPX+HyNrE2o41R0rPagiIf/0OMnYW+RxTq37JWlHDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ys7bH84TfY2+Th8LW8ogM+4ITkYkvYGmgZGhj8+rhHps7rD1VoH9WJWcuCISkHzwT
	 k7n+my4sk052mCljCEszfqRqPGuMAjCbB6Y8F7uZdqi0qRcool2WA1I4hYYQaX2USq
	 o/8dT2yLJdgvpa6OVC/uZ57D1NqCtflonohxZsGJ9XV6dBUrhcG7ihy8HNinM8OQlF
	 2ZnxrtD5cwVLECw5W9MSvzVV3x+UBigp6WjdTWn+4QAHnnrjVg9phKQKpxlwGeFjYx
	 1TMkIGvuMhqI7LTLfZYzhvR6cO0juTKG00kJZJiYhHwXefvwYs+1qKpT/3y3BZV4W3
	 1DvY8F9LNlc6A==
Date: Wed, 28 Oct 2026 13:52:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amir Hanip <killdeath104@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Message-ID: <20261028-impossible-thundering-scorpion-cfcafd@quoll>
References: <20261027205146.16384-1-killdeath104@gmail.com>
 <20261027205146.16384-2-killdeath104@gmail.com>
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
In-Reply-To: <20261027205146.16384-2-killdeath104@gmail.com>

On Wed, Oct 28, 2026 at 03:51:45AM +0700, Amir Hanip wrote:
> Add compatible for Xiaomi Poco M3 codename citrus, which is
> based on Snapdragon 662 (SM6115) SoC.
> 
> Signed-off-by: Amir Hanip <killdeath104@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

