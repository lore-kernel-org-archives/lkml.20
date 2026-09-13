Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C393E7631
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297021; cv=none; b=p2XG4wCWeJzd5cfK7fBUleqjTFktcQIMIqmcdYV5OrkhuGCUU+xMFq0yA3UN/yfXc+tfBUn5CbQukaVmKrwzeFSf8LAms0CpiEZonaPYnhIyk5S/AEYiLdOjintP8lAEm1uaiFyTVd1RmjtFVhaEQdQoLI0ZrkKzWQnmrPgt5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297021; c=relaxed/simple;
	bh=mZH+5kJGkO2orc5i0VeCr/sCtx7TYlJ3OYjPbKqy79o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d20Tm6cbhZ16vXjwIZ8qo1CTu6f638M8cty0pM+YkTKNEsjDR9FwGTAXJVoLOMV+CYfdhDF68Oe7tBw9aEM/FUc/Aaw8wccxuU9O9Kto2swQ+Ko0AdsRn16fjhM3ZH+ibY17gLTe1gMqFrRrquVsB6zS0KHI25sDCmSG3T7pBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5vF2cSo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5vF2cSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3173C1F00893;
	Sun, 13 Sep 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297020;
	bh=/lRoaxyoZNbpPmXqlQ6H57DJFENbEhm3qSy/BCzRx9E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I5vF2cSohEPGpglvryllkfDK8Ky/zDGE+mCcliH7hzByFmEZArhPIeyc8qJsVk1A4
	 ljlerQHLaxKVR8oH60n3sf2UZ9U/rbNanysXhAdnQ4WJGzFD1n2KN46VSA1hJ87yTK
	 9krbZOJFPrLVEY/GCTHvKMZveaMm1I+5nxOCNSkQCSN00Lo5rXnnJFGiY0HnKWlGts
	 +BJjaHBUNJhLiut+0auDkrDhwprtwIRDW7O2xmrUqMMCuCvOePmWYPTrblMgu81DVU
	 DxpMJhxKlVOksizuXuQucJyER0OFjUQPp2He/AxqnPraOBY+r8sTG2dmKQwUxwd490
	 aN4nx1ccrks1g==
From: Vinod Koul <vkoul@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260624143911.58472-1-pengpeng@iscas.ac.cn>
References: <20260624143911.58472-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] phy: starfive: jh7110-dphy: fail init when the PLL
 does not lock
Message-Id: <178929701777.215437.15362163764964323086.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 24 Jun 2026 22:39:11 +0800, Pengpeng Hou wrote:
> stf_dphy_hw_reset() polls the DPHY PLL unlock bit when bringing the PHY
> out of reset, but only logs a timeout. stf_dphy_init() then continues
> and returns success even though the PHY lock condition was not observed.
> 
> Return the poll error from the reset helper and propagate it from the PHY
> init path. Also make the timeout message describe the failed lock
> condition.
> 
> [...]

Applied, thanks!

[1/1] phy: starfive: jh7110-dphy: fail init when the PLL does not lock
      commit: 903566bc890b4b5f5e1e2e27fb5679d0cb7344c7

Best regards,
-- 
~Vinod


