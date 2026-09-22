Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0938C40E;
	Tue, 22 Sep 2026 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088404; cv=none; b=bzz6TjRe8cg0G9muiBc3iWkWMwrv0T20HXsS3WMvhb1BdsbWm7unVV8hWVXGC22solU2l00SsBHIJ+RM4DDAjppJhO1iXpxaAU++4sl4woNrSG8NdP+eL7GUZ6qzLaUGDL60CuvKfoERO3XgaWTkiydUQne5NBiMOYYp/ndhR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088404; c=relaxed/simple;
	bh=TeMD9tmKHnutvDUoBsUuFyCg9NqLgIpIv+F2ZrtL3wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrcCNemGauBGF13aUpJF64bADi/QcaQ8kST4ktAP1URfR/tARodiks3Hx1BLkkCe75yDJbHMlZBq1vqFUKx7wWw2Ii/1r7C5NVMnOEy2uZHeDLpnDiJCYSj0FVcv1Fq2USjdb3AuU0BQl0KwBeslgd6uy+Y1TfFk1ZFf2pIoEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=famrD2QC; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="famrD2QC"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D364C1FF51;
	Tue, 22 Sep 2026 16:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790088392;
	bh=OR+9VrcmpwsXDYLq7teC1AZo8u5HWqbjnSTYJJq8cqM=; h=From:To:Subject;
	b=famrD2QCP+T9APJzB+FUkhLM+aPRp2vI1jQt+UEpitwkXLXLH4iHYZMNHNPQDblwi
	 q+EpmY/IxzwdAOyp8sioYMZqpH7LZFmHg5CneLX+OpSB7z/t7Wl4i28+9Cshvbq07e
	 8x3AvM7I3mYTg3U4V0r3IMPG0w8d/FHWen61Tqm8GJujONo2PURYbX9JSOSdKCxJxO
	 Mw5k6nuCtSJE/5JA0z3Yi15gFpH9Ub8yTuSGdjh4v+rPWfrYnAh+TrwuJ3qHd+Gxrb
	 +tn1ZZiDAUuSPYenqEqi5f3A8VkVpYiLcHfYhHLvQe08ZPF1pXPXS0oVULwjO3r7P0
	 r8jwB+nvkvwxA==
Date: Tue, 22 Sep 2026 16:46:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-verdin: fix
 main_gpio0/main_gpio1 line names size
Message-ID: <20260922144628.GA261268@francesco-nb>
References: <20260914190943.50843-1-francesco@dolcini.it>
 <179008726793.4044824.6786355019611253673.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179008726793.4044824.6786355019611253673.b4-ty@b4>

Hello Nishanth,

On Tue, Sep 22, 2026 at 09:29:48AM -0500, Nishanth Menon wrote:
> On Mon, 14 Sep 2026 21:09:42 +0200, Francesco Dolcini wrote:
> > gpio-line-names sized main_gpio0/main_gpio1 for 87/88 lines, the SoC's
> > ti,ngpio values before they were corrected to 92/52 in commit
> > 28c8f2189d80 ("arm64: dts: ti: k3-am62-main: Fix GPIO numbers in DT"),
> > four months before this file was written. Resize both arrays to match,
> > keeping every existing label at its original index.
> > 
> > 
> > [...]
> 
> I have applied the following to branch ti-k3-dts-next on [1].
> 
> I have assumed you'd not want this fix for ivy/zinnia which redefines
> the gpio-line-names. Let me know if that is not the case or if additional
> fixes are needed.

I missed them, I'll send 2 more patches to fix it.  Thanks for the
head-up, appreciated.

Francesco


