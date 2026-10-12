Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262773BBA0D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832711; cv=none; b=Q3Gy24MZk7anZCu572aqpzrsKiRtQW8ySzfYYmzqAToz9kD47rym16sobKl4Ut5SaS7B87MRbAYNtTQkGecn0aGSz27pB5j/EW8noAC6iIh9ofCdjJyunpsFHYxi9kj9ZM+OvUdcJFiZ5L4VK5l+L19ewz/J+Vd9t084Y0rLP34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832711; c=relaxed/simple;
	bh=Ebwk2riWsfF638J7GhBlgV9zJN6hrXYr099hHSURgsY=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=OutFgIUf0/6yUKSPmCsW/+FqzoGZ/P5La1S1WE+h7Z4NkvLnpiMfLWtszZ7o9yV8xvJGp+1WSox9WAbRUelL86Njj3Rypqzu3P7mIxfD7+2lJ8JXOXIflm6LPbcLqEk2BjnSdhIA28LkejTwlsFX1efKsOQnkeyqMEcVlLaTYvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=sZtJZbuc; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="sZtJZbuc"
Received: from webmail.inf.ufrgs.br (webmail.inf.ufrgs.br [143.54.11.45])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id E75B0121120;
	Mon, 12 Oct 2026 16:18:25 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1791832706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLwzKw255x2Ho+brc0LP/HOoYhbCyaMdf4o1Ck8r4WQ=;
	b=sZtJZbucWJAIyNzvIH/IDUrL5x1li1A9zubNutfoU2e9GR0Xdv7YTZWpQTeG3U6Sa/xL6y
	EtoYEYxvj8acqI75Yo4rPSZjsa0kfpweu/N63YGiZaG18YnRHd4fkC9STgZTlBYnZNC1Xw
	2mKkrhAqhMwHfUtyT5ZopNTMPNp9UkzNfDlrIwy25KX60wP/CRJ8M8Lwz3KhIJZrb2QKjw
	jTwYz+JMZePZ0rBFEJOMbHYkpTIifP5c0BWAKGxWxOey/6mBlDK1SSgw38PJh6B9CCcr2O
	1DvuDAXTrJy3lmINple2ikR0m+WFmQjBL1cZgKNeIh/z42Q+INjisvRtzs3h1g==
Received: from bd06e904.virtua.com.br ([189.6.233.4])
 by webmail.inf.ufrgs.br
 with HTTP (HTTP/1.1 POST); Mon, 12 Oct 2026 16:18:25 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 12 Oct 2026 16:18:25 -0300
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Louis Chauvet <louis.chauvet@bootlin.com>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, Melissa Wen
 <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/vkms: support more formats and fix RGB565
 regression
In-Reply-To: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
Message-ID: <1bec074941eca133b8d555ff57b1e14e@inf.ufrgs.br>
X-Sender: matheus.aalmeida@inf.ufrgs.br
User-Agent: Roundcube Webmail/0.9.5

Em 2026-09-27 21:52, Matheus Alves de Almeida escreveu:
> Hi,
> 
> This series adds support for RGB332, BGR233 and BGR565 writeback. This
> is done with new helpers added to make conversion easier. It also fixes
> a regression in the RGB565 write conversion.
> 
> The argb_u16_to_RGB565() code currently truncates the resulting
> channels. This behavior was originally fixed by commit
> ab87f558dcfb ("drm/vkms: Fix RGB565 pixel conversion"),
> but the fix was lost during a refactor in commit
> cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions").
> The rounding behavior has been restored using the new
> argb_u16_to_channels() helper.
> 
> Matheus Alves de Almeida (5):
>   drm/vkms: make argb_u16_to_RGB565 round resulting values
>   drm/vkms: support BGR565 writeback
>   drm/vkms: add a helper for channel to argb_u16 conversion
>   drm/vkms: add support for RGB332
>   drm/vkms: add support for BGR233
> 
>  drivers/gpu/drm/vkms/vkms_formats.c   | 136 ++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_plane.c     |   2 +
>  drivers/gpu/drm/vkms/vkms_writeback.c |   5 +-
>  3 files changed, 112 insertions(+), 31 deletions(-)

Hi,

Gentle ping on this. Has anyone been able to take a look at it yet?

Thanks,
Matheus
