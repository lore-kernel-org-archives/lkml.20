Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D84B405E;
	Wed, 16 Sep 2026 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574998; cv=none; b=DR2J4yYOCRMdrBI1jE2imCLD58ny0lkjqXxK3XGwwsSCIJqdPRsuDBrddHQwFxpkjikchg/eDd4Vd/cD1iNEjtzuHrLH7xnawHu61jCtD3e9Xo71bxuHtP+VlClzXfIZPzwJbN7YnW0y8/cH2VQr4YpkblDWunS05M0hKn5Rs3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574998; c=relaxed/simple;
	bh=IVOk/NyLCOnmdtXDSh97VsiQQ4+7BEqgMAgqRzOr8D4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LLGw4mqiUg3e0FTA+PANFds0vb+MdxRCIW8G0Xlozf0XyZOTP8N4Eni/AgyiOlYUr19jvTx+uLvu9YmrTHXskNmng7Z0QzaJuKY+0OYgrYXuo5KLIm+9G9c3p4nnN7cghBl15ehW+vEyfiAQWb2GoX83WPeP5c5KwJFQ0oqbJXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5v9uhgv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5v9uhgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5101F00899;
	Wed, 16 Sep 2026 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789574986;
	bh=24kDvTvumsTOqnnfHmJx3FdAyn43pZdYMl7EiRDbWow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a5v9uhgvaR80Br1I4LS5nbw9EHgr6bvcQs5zbzFPFoi8nRoWlCT91o96A5P2V/T9v
	 5MuV/gHt+I2DttCshSUAoTLU4vY/o3YwaYawW+QABYJpegkmBKAVRu8ix/VgOVG1wF
	 A/0ERZeo+p26HlxsEdIjZqEXeOcWDo1yrVFLMHyKeiBGOullxRGvT1FhC31nu6xrr6
	 6LB9Akj+TyumNOKkLf4IFZ4HZoAvhB9Bz8BxvlDfEJmu0Q7szaiGqoGs6P+/71HHuU
	 XPYyNysyTI5ktOFARzEw2Eti9QuBQKpFkRp5qF3C2qoMfh/m5YCZqH85kd5ksHgXdi
	 udDVuh9t6RjOw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260904131243.755201-1-ckeepax@opensource.cirrus.com>
References: <20260904131243.755201-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2] mfd: cs42l43: Move cancel_work_sync() into
 remove
Message-Id: <178957498501.1766829.10062828436736023046.b4-ty@b4>
Date: Wed, 16 Sep 2026 17:09:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 04 Sep 2026 14:12:43 +0100, Charles Keepax wrote:
> The cs42l43 driver kicks off a work item waiting for the device
> to appear on the SoundWire bus, once the device appears the
> MFD children are added and the clean up is then done through
> devres. As the work is synchronised in from the devres clean
> up this could lead to new devres items being added after the
> clean up has started, if the driver is removed before the work
> has fully completed. The work should be synchronised before any
> devres clean up is started.
> 
> [...]

Applied, thanks!

[1/1] mfd: cs42l43: Move cancel_work_sync() into remove
      commit: f0749e65fdb0026abe1294adc5648f58642754f8

--
Lee Jones [李琼斯]

