Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253404195D2;
	Fri,  2 Oct 2026 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929871; cv=none; b=tTHuV9JdAq8DorcV+A4O6LMrmD9XtXTG5glRRT/4ocGsm+dD22BAoBqcBMPMCxCoo0pdurKN0SReCepGgBgEwnf6q2RplkRGDmA4LVlrbMcxB9WA2pB16dky610rMzKe3oyN5FO+/DX7UEJ75nKn4tIJvpR/PZK2P9IOE18zFp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929871; c=relaxed/simple;
	bh=oPXvR8xPdX8j08mB2qvD+aD1g1Iv9+vWwOEAyv8jkHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsLSOTnBoUBIZKgQL2tnDazgXUGvEJgPtqC49VmE1yWWWmMWIqo7jNDX/VooTAefQGgCcOXeZGlv9ui1F4pBI10Vr6D431sjMVCaYD26tcMkxxqrcDaa3UWjwX/ix4mZstxVTJ1LZ9u2i3iuw9bxaSxskrVcUagISoQrVLiNywU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Okgq6uE5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Okgq6uE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70C91F000FF;
	Fri,  2 Oct 2026 08:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790929869;
	bh=p3q96wTn7TDs3a0SXr3o1TlnAT04vXHjnczJ22qERmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Okgq6uE5D0oksDOjs0AMQsnGROrXiOmovlvL+kTc1dlhSBetpPryS9zExgGevMuNq
	 Sgb07DWXFDwu4IDYfZhlHl1eQEr9hOyr19byZndzY5fnlD9HrnKjrtE6alao8toOu6
	 yvyCuDcJtK5zXXLe8ewx7kEeWYQGs7XDLQnMAW358H5d6uyfNlHZ8pigHFonRUi4up
	 OhtDIKb0VHNihcOrvE3NoovreII5S3guSqEwvUEfkjtVj6CMsfgLahdz4RE5ZSSnzE
	 pKkwoHW3p4Hc2QHvDL1A4ARXp9pN1Lj51KMREb4tcrkF0rgsoV0xR2I5YfigdVDg5+
	 28P1nSSEs578Q==
Date: Fri, 2 Oct 2026 10:31:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, kapenekakis@gmail.com, marcus@nazgul.ch, 
	marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com, johan@kernel.org, 
	konradybcio@kernel.org, kirill@korins.ky
Subject: Re: [PATCH v8 1/3] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
Message-ID: <20261002-cheerful-white-curassow-7457b3@quoll>
References: <20260930212421.4810-1-mstoretv@cern.ch>
 <20260930212421.4810-2-mstoretv@cern.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930212421.4810-2-mstoretv@cern.ch>

On Wed, Sep 30, 2026 at 11:24:02PM +0200, Maxim Storetvedt wrote:
> Add the Samsung Galaxy Book4 Edge compatibility bindings
> 
> Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Repeating the same and expecting different results is well, we know
what, so I will instead just drop your patchset from DT.

Best regards,
Krzysztof

