Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D953E49D3;
	Sun, 13 Sep 2026 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297011; cv=none; b=nRTs2xJCHeaLJhFYhWVWpMCPnlMEIXHGElo3gWQF5jHsOzVp7Uv9bqwjmun7apl0GKJoxbR0M+6gfhy3u0d9YiGYr2IlY++mtNqmS6hzSsrVyfX6rfbIzUibvcRgE7FNbiYVRyb9fkM5Yw13qJaAZbfUTCcalg4+b+lVyoiK1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297011; c=relaxed/simple;
	bh=F12+0CZuedqe0Jnh/kHvzTcfH8a0HiwGoiXA/0iATmg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ngNYbsQioy7w39NkIgeLaI3YGqEe8oyvvZxSNz8bQI3dELguPX0+fwPgGBENtPhXrHPRJ0CY3Ka3JajA27PXDBx/YczUOIUfXfFqdCdjhoV5WpQ1JuwKQ1zgboUQgWFpHF4yxuMII1mUNpAFSw8u4WUMFY++Cm1NRtkga5ha1tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbwG19Dr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbwG19Dr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AA81F000FF;
	Sun, 13 Sep 2026 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297010;
	bh=VXU0FpJrrfRxjV/9XuJ2ILsuuq4iDXIkX/VBK1uBhLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CbwG19Dr90iyMGAdA2iqv+xEBM5hdQaSqY1VBIEMQPUHoihasv8p6VcXDuOhHrI+r
	 Snc3eyxofnfD1/cPR7gqDRJlIDNI/arGd7yq0VR/zm+do0ylZ0LkcjR/btIzome9Vg
	 13vADLnO1b1tj3Vz0Q9rkEgA4CYFgli+wSZn+9XXEE7mIwkequTsMOdISaQ3UwaeB8
	 Uj53cty5/gx7TT/yUvZ+u+mhg55UG83glAzJUkRMXkz4eOL56L0DpetjNn4Aqd9QYt
	 s0cG1Q5yJ73Nf3517+24w1F1ddbQM9YcGVLlLS2xiMTDDD0V+cqKRAO5fM51ExInig
	 it0vWP8u0oHWA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260909220810.52310-1-rosenp@gmail.com>
References: <20260909220810.52310-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] phy: apple: atc: remove stale kernel-doc for removed
 struct members
Message-Id: <178929700630.215437.14303908364654670254.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 09 Sep 2026 15:08:10 -0700, Rosen Penev wrote:
> The @sw and @mux members were never present in struct apple_atcphy,
> causing kernel-doc warnings.
> 
> 

Applied, thanks!

[1/1] phy: apple: atc: remove stale kernel-doc for removed struct members
      commit: 44e2000fe44bce2397b5be89cdafc28ee1bb0e66

Best regards,
-- 
~Vinod


