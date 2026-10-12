Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D58346A618
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795498; cv=none; b=H86GPlI7hC4Ov6sMNJOdV9fKUwA8yVUTOMNKo9TIEchkbObacUHI9C+dz4AjaQToH7kwrL0oT2JQjrSYcpXV4K+EOER+u4hwV4x/v1QskvmIE7NC/OIxoSEmAL8XsFyMvvNZUDNkAHwbOrGiRAM1zZ6ouTK+S24iXVvGs/fo3m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795498; c=relaxed/simple;
	bh=J7gggwbOx2h/0MqolHFVzkFAN+7xI/teV5ftuNApqF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5MQoJlMSnRVfV4j7FSk8K+9bHar8cs/if1kz0gsnPAt1PLEz0LAjQx6nlM1w6CDeKuY8tsAXYdAzWzNy6quMirCDsej2LcIRC4Gl5QDslLtol+XCx4b5DryFayboY+M/Qv6CCse7trP+fo3sUxSJvZ1ciJ9TRAJ2jSUcNTPPcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVOoBAm7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVOoBAm7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923901F0089F;
	Mon, 12 Oct 2026 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795496;
	bh=e1jhGbCn69m+FqoYLARBUZEA2QcQMRqtXf2Owfq47Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FVOoBAm7iag08CbogldvyabCM7fqP1HEA5yabYdeECPLA8wddYW5KuUccrDCtCyII
	 2im1ZV2faidPNVcxCXL+hE4kCrg6w+9DmiK5kMfCA/olSFTMEPSVHl7aGyWHwIJhuw
	 8NSCWd2IhFbVuZQ+NhbtHbrPwfiD8GxJ0vptZT59WvQaCUbEQbBJkwaGy+CkIfejrv
	 QgCHtROjD4uVXNaZLKHtqadkihI/7h3M72I0vFAhACMLncA//xO23tNKO6kunb0Eb2
	 7f4H1qlYBD81g8ewY9DWnpUG+2/CILSne23P23urY0h1SN5CRS5Nz8jg02vXgj7W84
	 kt+mYGrKiwPUA==
Date: Mon, 12 Oct 2026 14:28:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	=?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>, Paul Cercueil <paul@crapouillou.net>, 
	=?utf-8?B?5ryG6bmP5oyvIChRaSBQZW5nemhlbik=?= <aric.pzqi@ingenic.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: ingenic: fix unbalanced regulator disable in exit
Message-ID: <asyhGGmjvEIxdfsU@debian>
References: <20260906-ingenic-v1-1-2311f3df8ddc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260906-ingenic-v1-1-2311f3df8ddc@gmail.com>

On Sun, Sep 06, 2026 at 09:30:31PM +0800, Felix Gu wrote:
> exit() and power_off() both disable vcc_supply, so the regulator
> gets disabled twice for every power cycle, causing an unbalanced
> disable WARN.
> 
> Drop the regulator_disable() call from the exit callback and leave
> the regulator to the power_on/power_off pair.
> 
> Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic PHY framework.")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
