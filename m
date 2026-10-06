Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD983D891F;
	Tue,  6 Oct 2026 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285402; cv=none; b=oHcvlHAzeESGpBi2JZBNtl1GFMtL5LOSLyQunxUt+2OsZ7Lho6R7ywd9gKuE6OxkpdTfyKuYPe0C+7j9+I+oOr+gE97gkCROisgnNsDUKlFD3NiY5EgIvnhf+6+c+h54tnXJGxs0u8VP/KregLbIVYqqfmu6xIU4pk9VaE3RvII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285402; c=relaxed/simple;
	bh=/qPSbwAeFln1FVBopTzE89NpRunWYbEW9Lsve3k8ym0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntwPAa6oWQf5epwgTjJXjYLy/rbHrtqdf5RUgppeEsDdVmalUKa6LUvCqJ8X+WBntyecwkP8QoNS9OvUfY2m0nxWRShAhl9YxAI8Ev6/t9JEwtOtOjIMYJyUdKIOjtXIKGDVbeEFHcywEYR33xhN3v3VTjFQVAnAQNrOurlkBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9ApEob7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9ApEob7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1641F000FF;
	Tue,  6 Oct 2026 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791285400;
	bh=N2FvnYR+xsvUNEFnLnPobSS00B0dyfnWLUInnyZ3L88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A9ApEob7/arGjVELZ06xeAMMpjPnsyFrkm7Lm1b+Z6iAAuacgIcHUB+1qe8ZVOHtd
	 7IJkk4vSXFEC7ulbByh5fhayoqyPQMG9bfGJX4pjWepdcM7PFstubbEiqGaTbXCRqp
	 lOpKERB7ftamek8Z/eTIvmRRNjs/xLgS73SEyk5j9yT/7Ho/wVOcGMPnSm5OEr4Xtg
	 A343AljlDBc0a+lGSc01ZOVuFguRYDfP+kccAWWNoLTnsuEAvkn5BL5bpZR5Nkk6nE
	 rrW0CX1aS/ByApdOLG0oErQgot11yQc/AMP9QLoxDT/9jdfRxO7GHwnHxCIaH2vr/g
	 Nn9buLu02qBhA==
Date: Tue, 6 Oct 2026 13:16:37 +0200
From: Vinod Koul <vkoul@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
Message-ID: <asTYlWdkrlci37FB@parshuram>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
 <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
 <asTVqsqOLb29LY08@parshuram>
 <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>

On 06-10-26, 13:07, Christian Marangi (Ansuel) wrote:
> Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>

> > Okay so we have a cross tree dependency. I would like my tree to be
> > buildable and not depend on next.
> >
> > I can
> > a) get a signed tag for this from clk tree with the required patch,
> > merge and then apply this series
> > b) postpone to rc1
> >
> > Either works for me
> >
> 
> Maybe "a" is better for other phy driver? The pcie move patch is blocking
> other airoha drivers currently.
> 
> What is the procedure? In theory just the dt patch is needed, nothing else.

Please send me Pull Request with a signed tag from clk tree. This is
typical workflow. Is it soc clock on common clk tree? Stephan or someone
can generate this and I can pull into phy/next and then apply this
series

-- 
~Vinod
