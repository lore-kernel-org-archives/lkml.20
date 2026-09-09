Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07118859B;
	Wed,  9 Sep 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946494; cv=none; b=VvYnwRq1DuAxTViqwFJ9zsYlzO9AwuIF+Xz7XrO3XqOAHjKRIyQwcNy1Www5G4gAKRBmLnxUh37R6Ny0hgrsZ6l+0QXtZUEANUQwXSyejal7oF9+bTmyENFJqqViEvpOzJoARccV0+uJkBbQbKO/sy6NgkPtG/EDuxNqs9hUY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946494; c=relaxed/simple;
	bh=68xtu+kTcRyUdNTuNRXCUb0dDLyBionddiuSv4eFqDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODGpiJxTmXMH8zBU7cayHJ1Q7d6F0xmDgUnHKIYlivMGyiOkydkDgP+/7bHUJO5Yf2fDZP+WsDBcl4hsYYd8/zfTMP4+2ILDCwaP9t8xL+qaPHL6KSJi0Fj6WDKNWoqu9H9Y6F4hAiBEbtC8+pj+MPtt4QiBmRRlTTNjhtWuR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDYVlr3m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDYVlr3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B531F00A3A;
	Wed,  9 Sep 2026 09:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946483;
	bh=CUawfQC7/LAyZY4Kl0/s6vNzD4v3nyDgqcXc32WNi3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HDYVlr3mUzQGleKqudyysbR/48OBE8zzBOeawhJ82l7JW5dNT1jCUZxJJZxpNai7l
	 OumP9ELkK1UyL55vxMA7MzfY8cA8fWHWI6Y6vUJK3YOKhLpb0GJbheqGRJCKXp2fP1
	 ykbmoeKUe8HbJFjGFtW2v+0BmjLvmLXf8T34+20238ziGxmVeOPN7z84m8JZgVKuf0
	 y75HOm2Kb3frdYLS/ABauAwFishuuHHKNqsuEZUQUF6VRuANWofSL0ou47gdZ1QRlD
	 8jwlNlrG8hn6q4pJkMzzRcze+q/DSkxaM5VdSQeBjd0CqpZu2otRYzMguPbABKUKy4
	 dv0ZsV8vU2BNg==
Date: Wed, 9 Sep 2026 11:34:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Free Mobile
Message-ID: <20260909-hilarious-ant-of-success-580f24@quoll>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
 <20260908-for-upstream-nbxv3-dts-v3-1-1d88b2c11680@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-1-1d88b2c11680@free.fr>

On Tue, Sep 08, 2026 at 04:12:43AM +0200, Vincent Jardin wrote:
> Free Mobile is a French mobile network operator. Add its vendor
> prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

