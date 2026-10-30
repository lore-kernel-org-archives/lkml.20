Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323839;
	b=4N3tODxP8mCV2vTD+LHPspDuWJtlrmfgK2AakiTvR6ZeyTE7UN5R9isF6xSLbnFufbzN
	 3lWf++MI7cR3WpZX7F8pl6eZ6GXhGEGloFokxwLaBNhWVDzrjaPGBAV07rKNfEsNzae1v
	 7rPKskLZxh9sjnZyd7mLtL+bRy5/N3j16t8A3mRm2U9+SASZQ3Y+CRx2XC0yneFa618eM
	 mqd4pMEGskwaiHvSDRARPXhgAlaH7xW60g+BihIR0qABpEJUoVEX/tdSgjiUu9qZaxaO3
	 kQJN5N7X9f+fQIktI/3gTO57QXHIZ0PqFHDNxzq/mDpDCRQyg0Ac283E3kqs1/e0HRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323839;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dBCEqqxI4kXRq7hq6laYX28N16KjQNrZtbSgz18BAGg=;
	b=Y3bhgNPuT5uvnUnAZvvaeQJdxTMFvzZQ9O9lr0ktcgrHnSUnYUOzwyXUZ8SaBVI1GIrS
	 sg/sVWlsGtkoEV/sG/oBm0lM6s9naxl5dsBobiEu+MOwc/4yXv+ry3bGAxm4Rvu/uu+pk
	 8fH2j6mwN/gj/PSea2/pwMU5LNnTv1H3ZzY/G8V+k53LRKGeAp4uImFJi8aL6bELqDn/K
	 TTl3rsZw7nc450NtTIlD51D2nOAgzB1PWusMDrU0O73i7Vs8zCe7g9jUeZCTI3H70xcC/
	 v6msrSppWfgk+fyNMR6dIR9vUFE69gDxOisbQ3Sj1XIFI3KhQP5kDL+fmxa1KzDU+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O94iJB+Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14FD606A320;
	Fri, 30 Oct 2026 01:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O94iJB+Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5516A1F000C1;
	Fri, 30 Oct 2026 01:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323838;
	bh=dBCEqqxI4kXRq7hq6laYX28N16KjQNrZtbSgz18BAGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O94iJB+YoKbhhtxm9KCBIxBL+thJDfsp+gbl7oJb6RrkzErsTfa31R7Xbfx4WwzFM
	 a0wa0CEW6BHBxYWazHGiuK0jvIx3ilWC4D5Biq/pSa7+SeSsGvfadFJvD4FLY+djin
	 2lJ7BpHjz2J/bojxlGjTt4CnfsqRBUHm5KZkWPQiUL2Te5UOO6H/lSFZc+n3crcyix
	 TP+sLcBA82bMdmZ+qOt0/Xxn3WXKhvLB7MOjZkO1d6CGviOCCobjqwlamYyvMObfCe
	 VSP+xp/aZACgO6LxdtWMxooLP/L53FgC5kAjgyTvJFQxMyXBB0pK3uDdXaetjBl3SK
	 xdgpDMlybyakA==
Date: Thu, 29 Oct 2026 18:30:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: dts: thead: th1520-lichee-pi-4a: Cleanup with
 dt-check-style
Message-ID: <auPzPf6s4KDZlBYC@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <20261002-fix-dts-th1520-v1-4-9a8810091d47@axis.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-fix-dts-th1520-v1-4-9a8810091d47@axis.com>

On Fri, Oct 02, 2026 at 03:43:36PM +0200, Kanak Shilledar wrote:
> Fix warnings thrown by krzk's recent updates to the dt-check-style
> tool when run with strict mode. Fix the following warnings:
> 
> 	thead/th1520-lichee-pi-4a.dts:161: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
> 	thead/th1520-lichee-pi-4a.dts:163: [required-blank-lines] "status" must be preceded by a blank line
> 	thead/th1520-lichee-pi-4a.dts:217: [child-name-order] child node 'rx-pins' out of name order
> 
> After this patch, there are no more warnings thrown. Fix these
> warnings to make the file more readable and maintainable along with
> that to make it more compliant with the devicetree specifications.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 90 ++++++++++++-----------
>  1 file changed, 47 insertions(+), 43 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>
