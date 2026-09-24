Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2BE4854FC;
	Thu, 24 Sep 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256694; cv=none; b=N9gcZT7P+AMwa7pcjg0cUi/OJObfuhlNfZPC/ujK0nbC8zyRwMN2xnHn6IUFwimmr4/otTTA6ihSjtG7orPQMpZsnNJs30rDPXqahb4jemsXz3/7qbQeJAa7odFphP3nnvyry9KOZ/OgFXWTzTHrRvo3KE3esopP7tS31Sdp2Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256694; c=relaxed/simple;
	bh=gnMMiZBSc7wfcwEfo2F0VmWac1sFyjyRoZIfOJ00XLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxgaXkOE9YbTiMxr9Zg07CwTmiVocJ17fVX529UwLkitilzV9IxSR0e2Qxj+o5ChvwuoTXR4e82dAwS8yVo6zxHnTtgnbfNkxli29pBW1El2jefbOzu8XSjFBpy11KY30oC9JhZJqb6+Np6HB6NFsKINXcsRTET+ARvOAY/x6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmOnbAlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmOnbAlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E0F1F000FF;
	Thu, 24 Sep 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256686;
	bh=84GJ27xZ9EFPCJO9/iXHUOdTfLvPAzEChNM+Xzci/yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CmOnbAlzJV98MOMyFxKvKKTULR2mMjLPn8nXUrDVQmHNqPFNRwVcyyAiWynrBytHe
	 CzzJstpNDMIxMl5ix6VouWogFGjug9u7XthDvFn6Yv0HDQCXeHblRtN6Vxxlzj+TIq
	 gcqdT/MtTL8QQQtYwZEbr89RhpMu3H4nYP3go0xnYwzvvevuZAPf+vvQxHz8Bg+x4O
	 9rX5sXPLX92IsEQSlPQ9Safz1TLIogFl7fOQob5ewjLNIO4sqEo4IhJr0tLOQcPK5L
	 JJlPWT8mXGok5ZpSVGV48l2h+hPMYuS8PYIwDP/PeaJZ9vsSVYn/+p90U3uVsgs4Z5
	 rPbrOfFibodfg==
Date: Thu, 24 Sep 2026 08:31:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mux: reg-mux: Allow zero-cell controls
Message-ID: <179025668316.3743540.16923503737751069843.robh@kernel.org>
References: <20260921232617.3130745-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232617.3130745-1-robh@kernel.org>


On Mon, 21 Sep 2026 18:26:16 -0500, Rob Herring (Arm) wrote:
> Some reg-mux users reference a controller without an argument cell
> when there is only one mux control exposed by the provider.
> 
> Permit #mux-control-cells to be either 0 or 1 so the converted schema
> matches both existing provider styles.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mux/reg-mux.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

