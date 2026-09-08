Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9F5519B0;
	Tue,  8 Sep 2026 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875763; cv=none; b=cv/SYnzUILsOlE2fhIxM5KpKDDh0kQGWbKMmRgMNIOV81+IsBXIFsMwDZISkXAjI0uCKUSzl5voxoYC2h00x0iT0U1Q5Z+cgA5U1Rg8FxMHzP+mrBrHOBp2IuyMgJF4D0jY9NnvTurgCld0EsZfaVG0KG4lTs5cEehOPm8CWgYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875763; c=relaxed/simple;
	bh=88e9YfY+0y3U6SIanGgVlijTGXyzLToExbZ5tDfuRVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ME3Fn2DoXSOTPrVmELAULCD02lTWiVrG48iBMr+N5am89z7iUhfq0yHd1rMk9R3v3siMlx2ru0jlwhFn39rZH1UF7GijmdiBrAr2vu7VkY6zzKKF3TJfqwxGV0hDTTlurb09d5qKaS6+iVBqeGbSP78MmH2l/bIRqdXIOcm8q2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMqAm+Lr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMqAm+Lr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56731F00A3A;
	Tue,  8 Sep 2026 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788875753;
	bh=W8TrgXFRTNvRGmvNZDanmOO/Qsf6gyHZpCTDSzKDZd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kMqAm+Lr8jo/+fVzRQ9CuW3EB2eDCJzaHni93ehJEPQY3fvp/SCKxX6WvfSrIDRdz
	 QswFlLv98awow1tq9TEv9QAga/4+780sSpm0xMzvzs4SoGZOAmnjNuSRpoFMSfKoe4
	 UQI0Mn+lRw0Gbxq20pPWusgzBzP5vjdI2VtcxSTPxR99qWP6Zyt0PbHnquTl4uTC2A
	 Mbb9eE06+htqmm9PsVyULn6+epWwM11MRTvYkBPtb3GzRe6qh6AxA4hhVOGMBlsF20
	 SHiGjNL+CHLLUH4nvC1psnbwPwpi8bIjQI1w2CJeKxMLjGJaBlJt080ysn5GMImIhM
	 lluKucIZwJ6zA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com, david.lin@intel.com
In-Reply-To: <20260901031019.233254-1-yung-chuan.liao@linux.intel.com>
References: <20260901031019.233254-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: cadence_master: wait and cancel cdns->work
 before clock stop
Message-Id: <178887575023.2098575.549322904430050773.b4-ty@kernel.org>
Date: Tue, 08 Sep 2026 19:25:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 01 Sep 2026 11:10:19 +0800, Bard Liao wrote:
> A peripheral event could happen during the clock stop process. We need
> to wait for the event be handled before stopping the bus clock.
> Otherwise, we will get the IO transfer timed out issue.
> 
> 

Applied, thanks!

[1/1] soundwire: cadence_master: wait and cancel cdns->work before clock stop
      commit: aba7b41faeecb7692458095ce6fafc341fe0b80e

Best regards,
-- 
~Vinod


