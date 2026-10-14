Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393104C227C;
	Wed, 14 Oct 2026 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978236; cv=none; b=pM0Gjurg7nOanJOJdhe22mBxYkoRRzZoPlDa2rrxet/NWTI/gEDK01x2lnCWF1IBXpaWAXtruFrF11HVIqwZljlnPAJ+x1aVQZxYfAOcjCtCooQp4kb4Nkxo/QRlGS5wFuzagnlrNETKy8So52pxvrUzSrQDTqx4We0I/gh4uok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978236; c=relaxed/simple;
	bh=233tjI9zlY0Ag6h1dDTQs6+kUI0dmcglfoqcxtuIhMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qta4nfcPznFtF2nV186ZS0RxbWnTHjfHFULTpEPQW/bkXyL7Oaq5JXXaxrsjPYqsIvjNzcpT8raxd+l3oYszWDGrxxSpOn1TJTYgWg2qGgXIZE7gbMNry04AHcPDNUaW6HIi3ehpjLIS7Uvb4jYwpsbwfQufhWom9PVp15DA7cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIHQfiFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIHQfiFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571DB1F000FF;
	Wed, 14 Oct 2026 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791978234;
	bh=itoEIUzc+0gwQE1IVkzj+EpxNx5ikxz/5opU+c1Eqd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CIHQfiFS6qYBspuylV7hnQ/Bq12saMGU+GQrG0/F0i8PTAzskbD7hytTlJWHk5/XA
	 FVd3SitReLOCivkFGMnmCNOI4QosuXbnwvm1RfRUGQmwymiUyUTTYI5BuqkjFY5atg
	 vzeWrR1H+/0LnSuNlVcKkymHP4KxEOwaNQ7Kij8JHBXNt80wwVnpbBCunFbaoIXuDz
	 uebSJu5q9B5lOmSBkpx6Sn2CYbm1QW/0mdjD5TABjUeN1dorFDWkd6na4o/zZZU8u3
	 u2a9vlWQ0j2tfsJbL61Uamq727I23RjZ0jq0CJ859VQTMrFwv1E+Y+aGRmAIolz6xv
	 hUj+unDk5zBDQ==
Date: Wed, 14 Oct 2026 13:43:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Message-ID: <20261014-romantic-pretty-petrel-36c7ec@quoll>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014074516.240247-4-inochiama@gmail.com>

On Wed, Oct 14, 2026 at 03:45:15PM +0800, Inochi Amaoto wrote:
> Add eFUSE controller node for SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
>  arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
>  drivers/nvmem/sophgo-efuse.c                         |  1 +

Review code before sending.

Best regards,
Krzysztof

