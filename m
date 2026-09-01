Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2F847126A;
	Tue,  1 Sep 2026 08:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251495; cv=none; b=h+dO9PbS2SgN36BQ45ed2wuzxhployJPNK8AuwSH4yG0Bl9yz/z1m1qcko+JW9yiWUaqgu3C4K7ZAQCwbVk1wuDDf0n8v5pCVMQ9OuMfAvGlUtmWG/lenayxpj+AIuXuEeZUzmpziDz1YL7+faAS3HktRH38ge5M3wdE0nUIi60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251495; c=relaxed/simple;
	bh=2vybFnBF9etMpjwHp86XVYy4gLcfdUZAYh4zTg9h+dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tr7aBq4mHEzt3pwDVP2Yz1RYvqCnBVo7i5oY8V1gTtg/CRmpiXfCplOKdvfjwo5DrWptw2Tu/edwnOGNpVUGX7jVdAGc94D40MV+ucecghgbjReU5tL4w70bH7eTBQrjzdg3Rvb0dYyjLMwEPSgEUGAtE2AiIP8XXzmpQQasgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ibb8qR8X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ibb8qR8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D3D1F000E9;
	Tue,  1 Sep 2026 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788251494;
	bh=OouQI8gqwF6dffnUaUj20UYZg/qR1KGsPOs5dKdHYL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ibb8qR8XxScLkujIBZf2zXiszEUtghQsZDh7wWnWAelNi/+Ntc4yP+tkeRUsb9DXw
	 CZ5fQnjzBWupg5RWs5uVVqmtv83EqtxZULiIiULbkj7BrY2Kxq8uEgzPwncM+1Gt+1
	 dnvYX48RtQ34DtLYUtGHyeiyu4NjM8d7R/2n84j9NtjvcgK1GcpDRO3yQPOKVk3qM/
	 F81/qyKIzNpDqxaE+KOJV32mDiED74bFVoM1xbcs67Elva93lXT7KNJ8DnZnMR2tjX
	 CXPZGMjqM2HyDCPb4VUWKlJfp61vr7b9ct1yLRQpkV5HF5ppPjK/dRISyn6tr2KoYY
	 Y/1UHLmkhca0A==
Date: Tue, 1 Sep 2026 10:31:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Dhruvin Rajpura <drajpura@qti.qualcomm.com>, 
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded
 board
Message-ID: <20260901-proud-innocent-macaque-7c52ce@quoll>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-6-shengchao.guo@oss.qualcomm.com>

On Mon, Aug 31, 2026 at 11:21:02AM +0800, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add qcom,sa8797p-ride-embedded to the list of compatibles for boards

"Document foo bar, embedded variant ..."
No need to repeat the exact diff contents in the commit msg.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

