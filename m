Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E24E3CAE8F;
	Thu, 10 Sep 2026 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041704; cv=none; b=efBgMZdrFIYMzlNQ9GNs4vaoJHkEvOlvo4RVPNPB0p2NNlI25HqDxJDqoeM6xZqNTGVO4AC8feT1cgsLB/Uk1owumIxj2XJeBmgVF1/1QSGzIBl6q99YTtx/NAcnQWO2PjVK9Gk0z/Z/vKrh1ixFhFwY/mMOiJeT5prdJtE3qgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041704; c=relaxed/simple;
	bh=WtwnUnbV740t6T31ZIktG+6xHoc6LYT48ZJ25hLmCqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHCUnVLRwIihWHg42Aoq/dx8QEhpcGD+VUIRkiu2ppzYooegjVATNJfkmosiP6/cT4wjhavt9dvOL8OmlCqdqO/8pyo7IpD4Bd9jE/u8GRNzxqfIS8+ESxGBPc7rsHRjeUjScZw20X2eS18Cd4+fsiTXg8U5P/Rh/REfS6kJv6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGzYFwjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGzYFwjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C591F000FF;
	Thu, 10 Sep 2026 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789041702;
	bh=mbMPjc61ROWaAektEClaax4ipO7uAl89nDvqKysINdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FGzYFwjgwpEp7eP6+S8Dm/0owf3KGEz5qDj3jjEVs+kSRw6zzPJ6E3CfV0sCN/5pL
	 MDOZPi/ieRAYNGLGgDPc7XeA0OVhSWdI0UYVHCFXB0CLm5amegpZPSuzxiS1LB8qoQ
	 u43vFw+JIyyuKYhVPgxga1QiKJ6HSo9D68J1VsqnAurQcRASrOUCx1E2J2P6g2bfvA
	 gOUYy8Eic0eR/OW1K4NR7nwkBs4/juP/hX4iqp4OXeJ1Mg60ZGsv2eB8n/2MWAtDfg
	 649XT3AlOkWS+pbNLtlGrbSVuSPU2HaCTv71qB1dzloKzG2gU0XwRmilSyq98U/4X5
	 FJRzNmzk19FTw==
Date: Thu, 10 Sep 2026 12:01:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: sort nodes on OrangePi RV2
Message-ID: <20260910120139-GKA20735@kernel.org>
References: <20260802100101.327815-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260802100101.327815-1-amadeus@jmu.edu.cn>


On 18:01 Sun 02 Aug     , Chukun Pan wrote:
> Sort the nodes for DT. Also reorder the properties of the sdhci0 node.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Anyway for this patch..

Acked-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
