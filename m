Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D1851E458;
	Fri, 18 Sep 2026 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757032; cv=none; b=Tv4DTSbX+0Fwo7MJbDx0BMlaz/HcMNe4UIEuy7aZIPUZHj2D1nnnMJT+Z9IBZu9W9f+dRfHRC/oVi7r2hm2+kAOReV/+4zflVCK1PX5QbZtKTsJOFvqwqrPia5CGcD6Osqhx2Wd9/3cuoo06SvzXCE+pNFdujjFetwSsNIXEm9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757032; c=relaxed/simple;
	bh=B2tWiJEwI+fhfoW/YlZQqOb0mZbOZ5BjAOPE48Bdna0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKhOSDE8Dc2Sqa9Ff80P4SibzaYD6P/xhoNtkNtw44mdAaQL8IDb/QuqvRhJNzr6iMYeDeFFbr8+i9WA/46bDvS/s4O2hT+hVDRhS32RjBHFKTBb0HgrCKyOy1LuvqV7C12dAOS1nwRJbqmLsrpwNgH6JL50Byc1pwuxuWBaf+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHusVHAn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHusVHAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFC71F000FF;
	Fri, 18 Sep 2026 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789757025;
	bh=oVvhZgH185vXWHMF4dY7CFrAOe2TUu4g/2/OXvW5ueM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iHusVHAnEvbBJ/dcOKnqLymSTSqjISrwxzsETIoFwmR170jNYckovMD5RJ2BtiCAa
	 qGOfM5eyiL1y5y8lZPaU6gQQJcShp3bJ8qJY6BO4MkXVhklK4Ajb9kEHeNONBs0iiu
	 Qq5uNu9MRVoTCkNUHbF51q9c0yqOYu9wN7WS0y2ya8YY+ZuqUFKPygDu07Qx3t+qPy
	 QCF3k0pBN50nXT7gjV38j/AqYnJjKwHCajuPluqE7ZC1uFqGKl0QSeSebcNNXYxmVM
	 2ALbq0ujV9LaHSLD7yBLG7rkWttkx3Oo6D9KY1Op2/aZJyx7R06qQTwMrdB1qXoIRr
	 xzK7S6t6G/u4Q==
Date: Fri, 18 Sep 2026 13:43:43 -0500
From: Rob Herring <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Simeon Marijon <simeon.marijon@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: add binding for STM32MPX TAMP
 backup registers
Message-ID: <20260918184343.GA1358633-robh@kernel.org>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
 <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>

On Thu, Sep 10, 2026 at 04:11:22PM +0200, Patrice Chotard wrote:
> From: Simeon Marijon <simeon.marijon@foss.st.com>

If you respin, drop 'binding for ' in the subject.

> 
> Adds the binding documentation for TAMP backup registers.
> The backup registers is a part of the TAMP device of STM32 MPU.
> 
> Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
