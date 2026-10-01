Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3614479882;
	Thu,  1 Oct 2026 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883248; cv=none; b=G1+CVLF7LQfW2XA8gDuQnhzMQxr2OKLY753zaxM86r0iBmbtvyxw0Pb7d/v+A/IZgMUdi+Zz5RUi6kEpc1D+kDnhF42h5VLIVYS2OCuVY10ph6/7nHFBZniNuKZuZnd9Oc8kO2PEmNgWjrg0smWWo1zafQ8uDpiHXch3njvropY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883248; c=relaxed/simple;
	bh=UF8WRepyCBKLbDw4qgevs+6UXitMtEzJDpj5WTJkqWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnneaXv0Y9gaauA2iAPJx2vSow4dtTg9FHpBi1+R8uoV2YGxH1a/KRnQYgcxRZljN9k7qon97Hxy6ldUzQPLGyw36iN8P295A5ok6dk4wfLL8UA3Fh399TxDeFizVIjGn2xLSeUjJlHGMac2oCOFrtlqWUWSahZNoNVNcpgSkao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXMgunGh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXMgunGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91761F000FF;
	Thu,  1 Oct 2026 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790883247;
	bh=XS99Gu5jVlETiHxHAwkhjbPk/afdzbNu3ftUMxADtWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YXMgunGheOvK5G7JMEFUEg0V3pFyJIW/7csXMwIB0cqtuVfRVEmQa3kK7m6Yqyu4v
	 TS/WR7Cf2uksj7hXtOS8ywSYgdVRnswJX6xqYNeffTZ1t2GkaQ2dF1wJ00QbmuqdNk
	 s+JZjS4Xk4fY98PcNiqlbs8NEPdadt1xYcYkAalGqgguV4GNJLN3+ZNp0TfeW/lD+j
	 uOzbktdj5zzYIDbjFn4STujDpdvt7TXlmaQJPRK9QM1bcu2ywrKCI071e7BK1jXqYq
	 kO1cTI3yOiy507a504xrAjuKWvJGMSFhUeAe46O4ylh3R7s+l78LvMilQWEAu1vUno
	 w1A+ZQvG13n4g==
Date: Thu, 1 Oct 2026 12:34:04 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <ar61rDeXPKDOd8T5@x1gen8.tail89d63.ts.net>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
 <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>

On Thu, Oct 01, 2026 at 03:44:10PM +0800, Han Gao wrote:
> Document the Milk-V Meles board compatible with the TH1520 fallback.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> index 301912dcd290e60f816d380152591106de9415b4..e8170915f4d6d63fbc10a0e6863ea7d5000e3643 100644
> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -17,9 +17,11 @@ properties:
>      const: '/'
>    compatible:
>      oneOf:
> -      - description: BeagleV Ahead single board computer
> +      - description: TH1520 single board computers
>          items:
> -          - const: beagle,beaglev-ahead
> +          - enum:
> +              - beagle,beaglev-ahead
> +              - milkv,meles
>            - const: thead,th1520

Thanks for making the change.

Reviewed-by: Drew Fustini <fustini@kernel.org>
