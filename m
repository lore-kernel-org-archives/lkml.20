Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E91486E45;
	Tue,  1 Sep 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282955; cv=none; b=mI1onu9GzM4ee1kQpNwGwuJxm/rpDUy0y5hXPHLfnPqpJogMs9Lbum+b/gmMcJWrpfVkAtmYpcwPL2PMujzVOwOgsGa0H4norAC47ROiZqtV7U0Ikyg86EZfTHKlERS2GTmMV2FDKsZ0bTX4OIeTgC3nTi/wjNBxNSfDPiEFB6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282955; c=relaxed/simple;
	bh=iKqa6m8EAd36oCHcusnZu8NYxHrgiNqoQdy9edsQUX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cb/TbgAo4aPGJy/p8u+A2FhHULINjM2JSluNOV+ZTjGJwEIl+9L4ruJMxEheXB8YkswYwBuI5YLoM2c9XKFCTKi6mmFbr4jjCqezlCm5cFgTWjVJPe89ynNlmiAMjOEW48qFFPiYPrZE9tlwJiYLOe3hNSIMvYWM13kwybnNOsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hB+LWuNR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hB+LWuNR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04E61F00A3A;
	Tue,  1 Sep 2026 17:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282954;
	bh=Rj2Keuh/fmB4F4W44j8BWl+YKmiRKiQ0krPwqWExCGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hB+LWuNRWoaMM3uZq/pgwtfmicnLoc3BmD1kQS2NEiSao5E8RWjMOUfd+0IUfPWOt
	 HYWY2wT/2GHcxCvnf0HD+DfIbHhJIv36h1XqDXW/3Os7hGO2STPKiCi22XxG1wVmY8
	 TRSsVktIStOtYIMhMSrkNGghGzP54DeIhEXB62Lwuv82cdKFrW1csLziGcWu21vinO
	 46zkMcy716yzI3VebVvWOVTrQPY69NRVUvT7vK74cTDQQG4i2SmiruRSakIIShs6Ec
	 sbbxWGOQqmkS3ngvHw9Ro77tQu59FPwS+URahkzAW3aoNjoo5oOIzjXnEcz5PhC9VB
	 hX5kQLtoHZugg==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, Sataporn Saijai <excursively@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260818182020.143096-1-excursively@gmail.com>
References: <20260818182020.143096-1-excursively@gmail.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: add Lenovo Yoga Slim 7i 14IPH11
Message-Id: <178828295245.1399388.12497296239880430034.b4-ty@kernel.org>
Date: Tue, 01 Sep 2026 22:45:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 19 Aug 2026 01:20:20 +0700, Sataporn Saijai wrote:
> The Lenovo Yoga Slim 7i 14IPH11 (DMI product 83QM) declares an RT722 on
> link 3 that is not actually present and never attaches, leaving the
> machine with no audio. Since the address is already handled by the
> ghost_realtek table, only the DMI match is needed.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: add Lenovo Yoga Slim 7i 14IPH11
      commit: c3133906d5bda343bd5c1d8ad63074a14506ad72

Best regards,
-- 
~Vinod


