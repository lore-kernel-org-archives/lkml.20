Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234303F483C;
	Mon, 28 Sep 2026 05:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574797; cv=none; b=NCB7j+/fO+DYsATsFnKu63sVoqIFVtEoUEJUR1OORRErX/rWzi5WT8ibUSVqTNuBjqwgvbOu67cF97KaHQjGt1t7xV0QcrXdks6U8iqW+NEsiOYhqHh634z6mnZ7y0jERav2SP108zDiUEIACKc4tXh9G7TZAmZlbwpt3jZhSRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574797; c=relaxed/simple;
	bh=TB/CuRVLGFL7fIwTTqF1Pn+lzeCUZ9YFvvo2XvKpIrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nN7lQPsCLlNGyZpAIxS6kDLcjX9oxXSVArakdmSmLOMjJLotkiUh19F4s523soQxHOeuexvQRyq7wXYNybU5qqqbm+SHyY/CYTMUvnuvUOcK+azK2sROgFsUYXhmPW5E/NoN9uvGXT/Ioc+VtY0AngmXweb74CWyPKY1nHV3fpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ja1s0uXd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ja1s0uXd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724F41F000FF;
	Mon, 28 Sep 2026 05:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790574795;
	bh=S+BxhtsNbnQSAiEvgGrjeTqPe1XL/syqtGBcHGly+Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ja1s0uXdI5sEypbSGkAORL2pyqCLWAzHBUDAvYyrCABY8vU45x3ytEQiXHSm1SCAg
	 KbZ299/0/uX64qQNhTnKJriFKBx7e6blzShy6QT+MCNWLCnVQlEiktjFLiKs7ZX2/v
	 tVcXNuxMSKvzGR+Sb5rute0G1OYKXxp0RDFB5YjIfu2Iohstq1BQs+cnQ6IMDyIwzg
	 J4b79weTgPsdYVO8uwq+Yc4q17dWOq8mBncom77YVjgettl7x6/aEGzko0yI7AlWDF
	 v0syH/4iKM2y9lO2PNHh2ZC0M7QHChUWfgCBItr9HCcAmtfZlgJ7RHkSM/W+W1RydH
	 fAwMz/lqnvlYA==
Date: Mon, 28 Sep 2026 07:53:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org, 
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v7 2/3] dt-bindings: arm: altera: add Draeger M48
 dual-cpu board
Message-ID: <20260928-quantum-cuscus-of-jest-1d2f7b@quoll>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
 <20260921090735.3174292-3-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921090735.3174292-3-petko.manolov@konsulko.com>

On Mon, Sep 21, 2026 at 12:07:32PM +0300, Petko Manolov wrote:
> M48 is a heterogeneous board made by Draeger that is based on two
> independent cpus, that are monitoring each other.  One of them is
> imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
> independently off qspi.
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

