Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97BA36A377
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854976; cv=none; b=E8aX6lb03LVbIg29fDYZiQPd1AWDXfTr78+zYo7Y9X4u0uBzgkRE7z1e39XPStBKPqosRqhLG3YNz73OUcOQbM46QZLW/L1cJLz8sUPvqMsrGxGdrFQHho05/NzLajAqqrWWnnckWOjgY0AxoIxRzZ17oxx9cYdNaHJ26QThlP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854976; c=relaxed/simple;
	bh=dCXGjHL6qra3RuEu1OJ7unnwmJln4/e1nreiGag3KtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDzS+/HopeqBCMrjjZ3G001q9uhMZBqHdywrvitrdGO4AKSFqKe6sDyKUV1pvqt6x6XcFHJizHKYmJXC2HkRUZv6ggEcILfY1Yi1qiHb7Z9BpXqDUbxaAc0pAVEfOAG2bhJSAawM7PzuZiOxnijkw2XlHRg/mp5s0mJTvw6Nwjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uz7eOMlS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uz7eOMlS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58F71F0089A;
	Thu,  1 Oct 2026 11:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854975;
	bh=dCXGjHL6qra3RuEu1OJ7unnwmJln4/e1nreiGag3KtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uz7eOMlS/6nFW2tZIkjrHHd0nrXrFRwKg1aN6hn9a6ZZejO2isJhxltqEKysl9YeL
	 /AjyVjvlXMJgU9tcwltx+Wey9WYlMcRk8iuXWvCjQ7HqRvltHlkpxHUWYnX9h27NYm
	 rJ5S2WSPEA7LfB5yb4udrx7NljH/+NxzrjHPD3cJmS84a6AynqIOIYyhK7bJM2wzwY
	 nDkj179YcoVcUyZSKQFQoUkNJGe4jlVLIIqH93hIL2SjpGYNF6pA8A7ilnsyUQRSV8
	 dPkAR3IGQijvSYySdOoEN/DSmul0hLVUlMMjRJqIpseaFau9JaHamPqHBEAxkdhGk0
	 v6WYJ4uH4FvXw==
Date: Thu, 1 Oct 2026 12:42:50 +0100
From: Will Deacon <will@kernel.org>
To: Beata Michalska <beata.michalska@arm.com>, Vladimir.Murzin@arm.com
Cc: suzuki.poulose@arm.com, James.Morse@arm.com, xuewen.yan94@gmail.com,
	seanwang1@lenovo.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter
 handling
Message-ID: <ar5HOl4JL0G2yZfE@willie-the-truck>
References: <20261001090050.3849551-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001090050.3849551-1-beata.michalska@arm.com>

On Thu, Oct 01, 2026 at 11:00:30AM +0200, Beata Michalska wrote:
> This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
> counter workaround into a generic broken AMU constant-counter capability,
> then wires Cortex-A725 erratum 3821522 into the same handling.

Thanks, Beata. These look good to me now and I'd like to include them
in the next batch of arm64 fixes, but I'll give Vladimir a chance to
have another look first...

Will
