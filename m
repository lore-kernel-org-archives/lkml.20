Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AE13E49C0;
	Wed,  7 Oct 2026 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405398; cv=none; b=L4VlUHR2qZtur0Gr4ENuffK3WnW0vQnThtWXxqw/UWolv8U0+Lsfhk2XA3z8+oZ7G8zeCs3rp3qD3qAbV2CT/pbqs+ytY5Xu2AkCbf47TsZqq0Umt6NJGqNJ75SBrK+DOR5OVCFEIpwdX9ui5h+xFCeRaCaCnlZrtWu9FaJM318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405398; c=relaxed/simple;
	bh=Ql2SmPjCHJQ3We+96hpxaOvHpKzT2fvXs1ijEJH7rUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLFsohsQTx1Nharu0D1IJX+dOnbMvoVzcgKlh7DG6wx4HmuPGO2QNcW+8Vp0DC4YhTlHq2myrgNIAPsRYHZm0WWid0Sv0tc+gBsk2C1p2GvQwBYzjhRSUQsXacsh9MN00F4iOIII7c2yjKaGKVfOr4b02o0EQP8bUfpbNIQw7mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdEKBfs3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdEKBfs3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686311F00893;
	Wed,  7 Oct 2026 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405397;
	bh=6zatE6TqOYsPuTVpHz70SvOCnHDOn9eN/c/6GKFfGz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RdEKBfs3BXHEnVgeLpSDzAQT2xsTet3UXNsR4CdznhvJQxPk6S5eW9sMwl9/YGzck
	 r8WcMkKh/O4v8/jYlk1Hi3SZe11BAAeNwuJsyh3vOSoyJyUb4pumQARtiUsFu7ttTZ
	 2jDS7nXzJW/fxYRsuuOhLMEJYCjWWzr7KdvhuAN7wS6mZRp7HJSxsxYDgQm7jwd2hq
	 uRLA+Qso7pXrk2oEQOf/6cFU49x0A24YnTuq8IrZ+iSD+xhQI8HjsjJDAD+tqmOtwi
	 3Nu3e5RXJ99TWZ5QR4vdhdSwu6SiRBLMKE4/plMQcoEBZRcBTTQqzBeq8EVeq8CRG0
	 JcKYq22j2lZww==
Date: Wed, 7 Oct 2026 15:36:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Saikiran <bjsaikiran@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 1/4] regulator: dt-bindings: Add
 'regulator-off-on-delay-us' property
Message-ID: <179140539624.210392.17535217000084281342.robh@kernel.org>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-1-258ba9612da8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-regulator-off-on-delay-v4-1-258ba9612da8@oss.qualcomm.com>


On Thu, 01 Oct 2026 18:16:28 +0530, Jishnu Prakash wrote:
> Add a new property 'regulator-off-on-delay-us' to specify a minimum delay
> between disabling and re-enabling a regulator. This is useful in cases
> where a regulator discharges slowly and needs significant time to reach a
> safe reset level, and re-enabling it too early may lead to a brownout
> event.
> 
> Suggested-by: Saikiran <bjsaikiran@gmail.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/regulator/regulator.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

