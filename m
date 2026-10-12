Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7A42AFB1;
	Mon, 12 Oct 2026 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786732; cv=none; b=o2FAuoiHtxOAoBaE1ki2OhqYKe8IvOkx5t35qLt8LBV6Khsip28Gn3dY8P3lXEKuCEGVWxcoA5IYXe/6KpIMqGR/i0x93Y4C7UmOUDxGIAZBozAboEKAv6FZCXWfwBUQjfaz3aSBEH+oH8l+zYvewKS1gvD8vm3QUTVgIwfMv/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786732; c=relaxed/simple;
	bh=ZCPlN1GBu3uwTPZKU6bYU40qsxaCzT9BSqSVYWaCFJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smbdiZeN1NRfPX+lcrY34u+XzBri7ooVl5jBruWe1dg/iDNAXA+9qYToFWEcA7tTv3kKieaw0uQkVuW+v8gY7/OD5wkLlmNZrakhqeauYaGOEacEFQw8GNxSR/Ewe12vepdVoTdKPqAjxPWpTeMdkuFev5k/7TjMElKgmecZQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/G3rrnk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/G3rrnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F5A1F0089B;
	Mon, 12 Oct 2026 06:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786730;
	bh=3VWxnyAueG7SeTWz3i+fPsxpGP2dM48HQl3mbCNVA6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V/G3rrnkSexi/qIWIYdElSRqHF/bsaK+0XfNAUD1ZKvzdxOauqhOGJePR1/3AMDBw
	 1jYe9N18MT5PSlqezo0xgUYcTjgSDmhbEulys+sP0VqCzz1+PK2pcpDy4CAICcvtXi
	 l+Rg8QsUot4lghiNaHRv7du0DTGSUfTMAf7/tML315yzalL82YT5ZQ3naQzLQ4o5i7
	 3sV3dS1pAPuq/shU8UVKlNhV1dnSV2clU5Q5ZD47l5r88zamfuaXhizh5v0EW4RNc8
	 VjhP2rdrQyO1LkPN4QyufIUGIaBSdVi2cDQ0DeNkZ3x3pKewjpiw0tsRn8NbM0kiU8
	 26TZWBAj7IJTA==
Date: Mon, 12 Oct 2026 08:32:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
Message-ID: <20261012-outgoing-essential-flounder-cffaff@quoll>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
 <20261009-ipq9650_llcc-v1-1-572e40b18522@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-ipq9650_llcc-v1-1-572e40b18522@oss.qualcomm.com>

On Fri, Oct 09, 2026 at 07:20:31PM +0530, Kathiravan Thirumoorthy wrote:
> Document the Last Level Cache Controller on IPQ9650. Similar to IPQ5424,
> IPQ9650 does not have a broadcast region, since there is only one
> instance of LLCC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

