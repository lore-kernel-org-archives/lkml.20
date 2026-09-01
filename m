Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9658A459AE7;
	Tue,  1 Sep 2026 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251185; cv=none; b=QIsH/Gn5tMps/iXG+HcaJiYVqI0R8h1kOq8/XutRD21dGY1e81wMKJC6w17MXeKXe3QQ4wicOtubjpNOOCUsyRMwK9yB+bflp6P2zkV84qSXDHj5fihrevRTEHOwfqZSA7H/goalxV4GtfqUINARfhRcrVouE6Glp7Lgbu3z5DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251185; c=relaxed/simple;
	bh=ErQzI61kjmTHeMEvd6TaBpb36FLAH4mcmIgEKFjk+IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfBSBYiK6KS2wKFvGrBZZwAV6sWfSMUq2WJ8nW+/Z5frdmWa5aEDyC/M5bxYrf/hEbUwweBkOoL7rKMIprLLUWPkd98eDx/Tm4nS4q5y7z0G/U3Kdl8S46cbZwL5iij+F4BF+Jc11iT9oCKt50kI3/aPbsBYolJU8d5tXkwDap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeaL3qIz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeaL3qIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748931F000E9;
	Tue,  1 Sep 2026 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788251184;
	bh=6mQfiTxxJWpAemKvSiySuuk5H23Mi2/JeBW15ajeNlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KeaL3qIz0zj12a+h4Xp90/wOtQMmiathiqueL5Qrh0omUCIjBrXgKury8nmi7T1aD
	 EUfmMCnEI/8gkABtj+LrUGhCPrcliG0yIQ3tZouBvgvEliqf0c+iNd4GKADykYGZ8V
	 +h4EEGKLWrrZqgauS3BZW4Y3eFmvYBTj8GyNP9zH8qFIfFbS7TxlYOK9z5qf8flVuj
	 ++Si8sV9IBZbXdqUOHlNSB52dbCmYvBF3VYEo8nNKHYLLHsXBQ8flfstSBtOxZAEfA
	 uT75w41k6/HTu2xBqlX6/GKplMoy4cecfEbP2V7JM73/rTLcg/No6UEx7AYHNRVrLe
	 Y8qnSiZbjb3xQ==
Date: Tue, 1 Sep 2026 10:26:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Nabige Aala <nabige.aala@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
Message-ID: <20260901-hospitable-platypus-of-kindness-25b62f@quoll>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-1-9feada71dc79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-1-9feada71dc79@oss.qualcomm.com>

On Sun, Aug 30, 2026 at 02:56:14PM -0700, Jason Pettit wrote:
> The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
> (Glymur) laptop.

"Document compatible for the HP OmniBook Ultra Laptop 14-kg0xxx, a ...."

> 
> Add a compatible for this machine "hp,omnibook-ultra-kg0xxx".

and this is redundant. No need to repeat the diff inside the commit msg.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

