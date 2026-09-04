Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A800738E8AB;
	Fri,  4 Sep 2026 23:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564596; cv=none; b=J7QH0Xk8l6o7kEOXdFsbWqw0+CH54cfbpdpNiZY0wQ0T4UJaY77Puf/AryF2Uv13AZQtwjyAfW6xBj0nHVjgwNjMYaRf7IBTxms/kmLkC4fkJ16c+XIdS2Tz1+CV6WmTWclG6sdtgeAGUmE51G92qNikp9ZMy5V7DlGDdLy73Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564596; c=relaxed/simple;
	bh=uttsdH5uLcA7uWuUunN4SLb9GbkXM3HKtAB6lhBeymo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4dRUT1/deiX+Xzh379Rn23+ajIfTyDofwMsiUGp0SuJlLdUAkRX85mcVMWFqdg/0Mx3JV/FY2ttfvTXC0mMWL9WyJl2tzN9bs/A6d1lcr4nTeQJNcsFJkMtb5uUA1JraTrNN76QJ8Rzqy8KroXcu+O59VB8XguTkBVpdDl42kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQnK1Xio; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQnK1Xio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F2A1F00A3D;
	Fri,  4 Sep 2026 23:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788564595;
	bh=5hOu31v5YjSnoOgyrVKCGbTfs38zCNIsirXNjotQCJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GQnK1Xiot5LVAs7ly9U2189+kGZ31R+vqjdo+sD9qIsrW/+hILU3RYIZ2yingIYd/
	 w91mBe0LJp70c/CCspuzVYDsWcW2HpRSTz9azEW49dg3hIS7X+V6S7MF4aIHXG8pWZ
	 d9PLN88pyM1tJsvJoszv5e/LdD2sgZcS11Fd9HonSoy2C949qdhCtokhIShsxUJ3H0
	 Au2+5nU+w+PKTifKDMAFJgnNs23TF89tFNSEeO7ldN4h9qN4G7aZK9xjDYeqcObAiS
	 6TuTXtT1ZtasCL8kd4I5nARP/NE0XpKASBiAiatBYkrXjm2hbdwfX4+mnANn0IchBS
	 zUtgaPjNvNqTw==
Date: Fri, 4 Sep 2026 18:29:48 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: property: Drop superfluous !!
Message-ID: <20260904232948.GB3514178-robh@kernel.org>
References: <d32521ecddc0df9de1c5f21edb7935f7f543590f.1788426412.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d32521ecddc0df9de1c5f21edb7935f7f543590f.1788426412.git.geert+renesas@glider.be>

On Thu, Sep 03, 2026 at 11:07:58AM +0200, Geert Uytterhoeven wrote:
> When assigning a pointer or integral value to a boolean, there is no
> need to insert a double logical inversion, as the assignment already
> takes care of the conversion.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> No change in generated code.
> 
>  drivers/of/property.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks!
