Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88246D097;
	Fri,  2 Oct 2026 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932202; cv=none; b=FSCicVC7OhkxZH9VIv2YQowTedD8oDShQiap0J2XuoOk1YBDm3rfNA3aUgkwmeOgjrXsG4Ri6xlioYBEAG3oa9O8h6aGa56ljt+xE5n2JJC5D1odEq9UbjTPX9e745VABSSEdrhZQzvVmR9NlbE18PoPK9mqOb5B7qFwXlag0Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932202; c=relaxed/simple;
	bh=jJgXgJxgUBUaXZRa5/z14EjZQG0Gip7pnxdX45Q+JuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5kH2sanWw4+ZEDZER1NyT/+4IT4/IMjHCEtEUFQH1Wfn9s7MnZmbkSeJWZt2AfeRKT+UB4SauWcaNeTfLyimQYQlOYfZBqC0fkTbBf+Fvu4uviIWofqzjlE/OH106nNCm8tB7XgIN17d+tzvIUJiNCVgn/GDvkZGTHfci7KNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7wUsDvm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7wUsDvm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A01F000FF;
	Fri,  2 Oct 2026 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932196;
	bh=YGEaSpoZvoET9V5FtqUSRMfYIQ5YULrJRJ1KA1LZnMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A7wUsDvmdnfgxr06TD6qIRYIuRgaSpLhhefkEn1inuRF1NMdYTMwoPzmqkAfyIpIm
	 RnEiH+WVhAY+npYSJzRpLp/37Ivq3yf89PL7Kgalr0bqOHClh55mKpCBCxQ/d11X+y
	 q1g395NRQ/gsFNQbxAw3cKfCtaEZS0Es2g82SNX/3HgkFy6shvW0WpuU4OTpANO42V
	 /CF/AtPtBMjBTC9Rl5HfgGX+3DO7MZ2vQYAFueUYRTI7dgPp7AZdfFKHUsagxohO1T
	 P35snTUifOcSg9G5ZjRcXr0sHFGWbyPEiZH/4EyB9ygBvy/U1JkDbJ25hlo/yN4OMf
	 J9yP10juxnrzA==
Date: Fri, 2 Oct 2026 11:09:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: add ALIENTEK
 QuarkPi-CA2
Message-ID: <20261002-armored-robin-of-influence-9a74e1@quoll>
References: <179086264917.29834.5543033479795788817@163.com>
 <179086266302.29834.11881496781543805639@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179086266302.29834.11881496781543805639@163.com>

On Thu, Oct 01, 2026 at 09:51:03PM +0800, BG9OXA wrote:
> Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.
> 
> Signed-off-by: BG9OXA <bg9oxa@163.com>

NAK

nothing improved, you just ignored feedback...

Best regards,
Krzysztof

