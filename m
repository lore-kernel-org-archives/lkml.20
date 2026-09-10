Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382E5361DBA;
	Thu, 10 Sep 2026 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030464; cv=none; b=NLwIR8g/iLgJLbzgvxFpzz085mWDb6AWKJCYcNI7wf9hARwXvOPL6jIqy3aNJL2Q3ByFa797OxOmFJoP7dZxz7r2zk3areuoefsoa9mS5GwEgkJBmCjrTOuOMVirD0qb7ek7wXV0S1Zlo0J9E/zbQ6HR2ebSlMYQT84WUvsRtX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030464; c=relaxed/simple;
	bh=T1zE9jKxqVSZOqcK4zzNLwzT6X5KFv17JBhIfcUSEtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMJczkuPPlon6942BZbASKPJLjpO/EPcdPExD+K/EvM0Y3A2a+g6xlan8OuynQLzFkuwvWw9sd0lCKJibnz9C/YpkeKkZQBkqrq78IA3KWRLc/VSlhk2vlOVbepSYPHqbWaoQFIGWovbtbI5e+fmqX0d2ldoL1PEBhwUaxZNG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGJF8Guo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGJF8Guo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDB31F000FF;
	Thu, 10 Sep 2026 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030462;
	bh=FDuT6HmdfEeayC/Z47LJ8lrZk0CXOr6lxReujiPmd4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGJF8GuoU3Z8VsUn4/wJgwsMm3tu48HNiWN2flz89KYmFTjArgX+xr/3WDYbN+Unx
	 NUve6hI8HHlKOMPanewpNSo8NFn5QPEd5nEGlJz3Xmnh6soT4GkL8Tm/DHqZi16YQf
	 jmqKB+juzBf9nScoqODyiCDM/D7cwYyEorPJl6gFBT5+l/7dFQJuMQ3dW53e+pK6Tg
	 KIhThgS4Tn1HSh4hkC76h15GqTifHTTCfy3KwbtZjezwRvQpy9e7a8wUrm81oWbz4x
	 iDC+uIRWHbpABA0oIaklSpTz0f/rvEn0KeuG8cjxdSgGpgU55vCAMBfMXcWkIj/0Sy
	 GYMgRXVlAG6/Q==
Date: Thu, 10 Sep 2026 10:54:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org
Subject: Re: [PATCH v3 1/3] Add Draeger AG as a vendor
Message-ID: <20260910-indefinable-zebra-of-focus-bb0ab7@quoll>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-2-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909111513.2259643-2-petko.manolov@konsulko.com>

On Wed, Sep 09, 2026 at 02:15:09PM +0300, Petko Manolov wrote:
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

I don't see improvements, so previous review is still valid.

Best regards,
Krzysztof

