Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA034250E;
	Mon, 28 Sep 2026 06:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577600; cv=none; b=UMm/Gtf4+08I8xmv2pHPCB6r41bKVEecw9UQZCmA5RJjdigJ6g/UkJkOQYS2Yt6MdCGCDjzLwYGN7ke7BwESjemERWc04pVeWj6liFWerqXnjWefJ74E5J6JTGn/shyh2qgEFkNBfnOuFnuLCCtyERwg8B3FuKkh6ocXtPK1Umk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577600; c=relaxed/simple;
	bh=5wlerZZRCPQEUA/lGGyM5BhxJgX/ic+RqpB2WQr4VEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BR/SbPa/kGRpdaDFHVMvBdHXAgi3cbSRUX6QdvQi0oMzobsoOR95yXGnq/fVPIpZ7Y0DqvEubhIfwZoR/eg5xuBJurIEjjoGevXrl3erBej+ftj1nI81bN542M9rgE4ouxPQLKXCVdDzT5tTkb1/4u7Gs4aOSspahwr8DrhF+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clnF6zvR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clnF6zvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BED1F00893;
	Mon, 28 Sep 2026 06:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790577599;
	bh=U0mn23WjbTRwsAczkybO4HwkRwAWx7Uy+DftYw8/7dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=clnF6zvRAisp864MMNeRvfmE1sfLYqXe6N59Hb8WhMmB7S7KyU4fejmbRS72MNyaH
	 q/+6MlAkqPW0AOFlFREbDUJg3cAWFccfJG9/4c6JrVqxpKe5P8lNIY3H4Mk++dDoJR
	 URy7dtbFFLJdnWpGAb+39LiY0s4AIoE7vn7ygNNZNGuw2E2DBkMQREkRhLLy9v74AP
	 EIJJdToXjrRaHUF5OMLGvcG1z7dOjpGGaFDA/maHnxPHZl8LgC9BFQcylCyL9XSL/5
	 QIYxGt4rzSuESoyRKQkaOz90JCK+vw0zENDac1d0qxy4PavnyMu9uuTqDtepec2fVJ
	 ZK/D9sIRlaKqg==
Date: Mon, 28 Sep 2026 08:39:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Message-ID: <20260928-spiffy-calm-mongoose-828a04@quoll>
References: <20260922100501.8888-1-liujianfeng1994@gmail.com>
 <20260922100501.8888-2-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922100501.8888-2-liujianfeng1994@gmail.com>

On Tue, Sep 22, 2026 at 06:04:35PM +0800, Jianfeng Liu wrote:
> Document the X1E78100-based Acer Swift SFA14-11.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 5c0414d4af9b9..85e62b2c7093f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1203,6 +1203,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - acer,sfa14-11

acer,swift-sfa14-11

?

Best regards,
Krzysztof

