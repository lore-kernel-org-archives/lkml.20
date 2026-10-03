Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97639CD0E;
	Sat,  3 Oct 2026 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015699; cv=none; b=OeaRGKJ8bmLCMp0my90wyYtIvwyMVrW4oMq/21m/5coDi2AWBQhstrtc9rlXlXLnf4lk3FqnamGL8vQKqQYdU0ZwFdKFmZ7J44hu1cYSuJuSy8pMHm6DcDxUlIq4DR2MWMUhUJoZPlvV5XDp98v19ALieWQbLSYdDaUjoHKv3us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015699; c=relaxed/simple;
	bh=yWpbMrgFhtrQfBZV6kZ1Dp8dPh1HtsoYRdJ0sfHtMMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FnJesiYWQ1/z/2mpiKIB6QhbRre4ldtZAsKDrxiFF3BJCBYF+St3ZnV6pZI3SUve5118pVyHrUbukMxzahX5FHKleGDht2yB3Yh5vDyi8u/FaZIsb4G+Yo+pkGYNOEH3uhYlk16iOE8w7u/hf2XhVFeh7JJCb6V39LTH5F3KhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g54tZTUn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g54tZTUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A3F1F0089E;
	Sat,  3 Oct 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791015698;
	bh=I0GcJJYw5YQM5ifyVQrxHoLaNBni/R3fUm4KYTb0mCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g54tZTUnQMxlZa7PQulwTXjcoI6l5BipTJBwYVJfETCTtdovvCE7RSzzVIOMZ9bYL
	 UWA/Hdc5phO5biLe2eLlUJjuNZ7WjeMNrd5/2nC5vOVGgTkuwD88iK0dxB3LXMwfHr
	 mkAw8sFEYLzgiHdPBqVumSQQI62K5alAPfnFPZvXkmxMq9bjHsAm0j79jgsekpvApI
	 Or6BJI3W6yOw2t9vfzZGevEz6dulcJKrtut2mLWOQ/cnmd+4EPKvn97cYOEJz07kZn
	 RJXsoMCf3lRnLsJZ63euXmkL7glh4xa6+47EZu0WNLjVnvsbjOtky1BMG8rM9qlF4/
	 w551fMcZr7Hfw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20260928105640.3014318-1-yung-chuan.liao@linux.intel.com>
References: <20260928105640.3014318-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] soundwire: dmi-quirks: Disable ghost devices
Message-Id: <179101569542.158974.2683924191249854784.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 10:21:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 28 Sep 2026 18:56:38 +0800, Bard Liao wrote:
> Disable ghost devices on Lenovo Yoga 7 Pro and Lenovo Yoga Slim 7.
> The first patch is a RESEND patch and the other one is a new patch.
> 
> Bard Liao (2):
>   soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro
>   soundwire: dmi-quirks: Disable ghost rt711 on Lenovo Yoga Slim 7
> 
> [...]

Applied, thanks!

[1/2] soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro
      commit: 21f4552fbaafa75628ed7bf7693303920da0545c
[2/2] soundwire: dmi-quirks: Disable ghost rt711 on Lenovo Yoga Slim 7
      commit: e0cb731652a1bebf962086f17d1b7c9d060cb7d6

Best regards,
-- 
~Vinod


