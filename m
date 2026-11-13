Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=143.54.11.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534709;
	b=zEpd0rlN4Y2LJbVr+Ru0iKDfXIfOhFRl6uIRGnvc3zDkQPuswpKolxxve5yHUkAbiIHx
	 MJUllLdPNjV2ykMqCN4iSHzkakTPQiYPLF7fqh/4NGb5iRKLWsTwtxPHRaBgG58jfN5ih
	 DHkC2qHqL3ZvXRjKAZdGbrCTv20uv4Gp7YD4EsIWbkc4yxIntT2kaeuglAd4/ksuAMadX
	 wseoY66vvUlsluu4y8+WLe7RpLU7o2BLZUT2bRXMnEPMcYY3ZtzZKO36njm97aSoU/P5Y
	 n9x++5R78krljny8JKRWbowA3zst2I8KxfbhlZSfphvNFZxtMBqXpVC5am1jzmutn1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534709;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VCakxFlvNf3r4xnqgVMZN0r27Eu0M3U7AunJ84kfgbE=;
	b=oPRQsG3QUc5+YVSfR97pJXi0SoMuYkXNGW9S0Xq99ZrMFMVSfaTMuLISJcAIPj3ULKFk
	 brR7Plba8T0VueGME7kDSZbr2YsIDbksYrIxgEMDruYABQOIsxC20BpQeXal6KJp56AO+
	 nRHYa78As4HlVoF1BcCSspQF71RFb8j+xRWN2yVmjND5e7pyfKjcq7kb5+H++3TMB9p1B
	 wW8DjhzWutMev3gZbTl7koWtBgu2CtW3X2/rKGuuPF2Nr3xfxciIcth3CadPfmyPIRpUV
	 aEM45Oj8Hp9b+wMMOyk3fNk5Db1q0rf/Q3nK1LAcvn/V2+zFzKil7OZfkizrDDmVJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inf.ufrgs.br;
	spf=pass smtp.mailfrom=inf.ufrgs.br;
	dkim=pass header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.a=rsa-sha256 header.s=dkim2026 header.b=sf+EaGfX;
	arc=none smtp.remote-ip=143.54.11.23
Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E615606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E615606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.a=rsa-sha256 header.s=dkim2026 header.b=sf+EaGfX
Received: from DESKTOP-PJTTJ93.localdomain (unknown [189.6.233.4])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 89D76120351;
	Thu, 12 Nov 2026 22:51:44 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1794534706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VCakxFlvNf3r4xnqgVMZN0r27Eu0M3U7AunJ84kfgbE=;
	b=sf+EaGfX37dcNR3I0sGYwVUnbdihTv66gpXJwcfpYPbpMz4h/1vcxSieHEcXzP5egnDEnF
	rijjeU5zytFrIp3ZRNXWq0VQpbKj9+pyOvC1+7ELIFyE6iNJp9uYNQOQ7SsTok+MvW3QV8
	gfJbfYOpfplkXjsz8HKDoyuYH6Rv0bUpgxkZQUBMB0bZw17jDRVyfmBM2mXSl7/lAgB/v2
	VxkUAOsGsNwTISN+7co4ThSohguiV0Y2Tbj+ZGupgFY2e0rZV89BurTqqRn/NM8u3IYK46
	yDnB4KYWwq4zLuWGZQREn/Us0bBEJRM+g/gwCw5uQsoJ9TcpDOxcSuWmDSr2sw==
Date: Thu, 12 Nov 2026 22:51:41 -0300
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Sidharth Saha <ssaha2000@gmail.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, 
	Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Melissa Wen <melissa.srw@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/vkms: support more formats and fix RGB565
 regression
Message-ID: <avZsvJCsjIck1MRd@DESKTOP-PJTTJ93.localdomain>
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
 <f3707b72-07f2-41ae-aefa-c46ef84de3e3@gmail.com>
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
In-Reply-To: <f3707b72-07f2-41ae-aefa-c46ef84de3e3@gmail.com>

On Thu, Nov 12, 2026 at 05:18:56PM -0700, Sidharth Saha wrote:
>Hi Matheus,
>
>Following up on my earlier report: I've now written KUnit tests for
>the conversions in this series - argb_u16_to_RGB565(),
>argb_u16_to_BGR565(), the RGB565/BGR565 read paths, and both the read
>and write paths for RGB332 and BGR233 - against hand-computed values:
>zero, max, single channels, the midpoint, values either side of each
>rounding step, distinct per-channel values, and a read/write round
>trip.
>
>All pass with the series applied. Without it, the RGB565 writeback
>midpoint and rounding-step cases fail (truncated instead of rounded),
>and the RGB565/BGR565 read tests give identical results with and
>without the series, so the helper conversion in 3/5 doesn't change
>behavior.
>
>For the series:
>
>Tested-by: Sidharth Saha ssaha2000@gmail.com
>
>I'm happy to send the tests as a follow-up series once this lands, or
>you're welcome to fold them into a v2.
>
>Thanks,
>Sidharth
>
>On 9/27/2026 5:52 PM, Matheus Alves de Almeida wrote:
>> Hi,
>> 
>> This series adds support for RGB332, BGR233 and BGR565 writeback. This
>> is done with new helpers added to make conversion easier. It also fixes
>> a regression in the RGB565 write conversion.
>

Thanks for testing!

I would be happy to add your patches in case I need to send a v2.

Thanks,
Matheus
