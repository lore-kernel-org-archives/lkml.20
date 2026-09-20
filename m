Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9218459AF8;
	Sun, 20 Sep 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921099; cv=none; b=PAHNmXKtGHNL2SYpAddcBlKKpx6ly0X5kaZaBXg+/63dA6rQxQe0485U5e/9MwSlGGCdpp4nZIEqYfCkqmoahT6q8V6wg1XfJ0uaZVW5JE+S3wN6+ZjnyTtqFPq5XXdo14uQHIXyB3PrplS1NfdmkE0/dEx+Bntn5OT46uI8VGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921099; c=relaxed/simple;
	bh=5R07kCAS+E7jA6wYFGS+fjxH64ZH55Z+5zWXnjV4BEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUQbXmAaWO8EdYqg+q4AuQZP//hT+NaLtocxo5v/25zOg5Vux/AnvzJI8qWfEMejXNnNZSoN4tR0meVlG8px5d+HCT9xj233WqlSFepQtS9jejnXv4DjxjT9ccbU80LK0+42TR0oUrBFa+YOEX7mVWBeYFWW1QxtXk5zMst9KIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbev7MOR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbev7MOR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A084F1F000FF;
	Sun, 20 Sep 2026 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789921097;
	bh=G8AWuZvmRLd765DhkuLqUDPxPGqCs3v+xV81aeXF2oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pbev7MOR3ybziap5dywW2I4Yy4Uz4cObSU/l05cjgMFXWT5OxvJ5EDdj+iahPO1ow
	 VfmQBrUjPvgvoh4BNq6DVLijsLwk8Q9NxQER0cHe3VdGP2TntlkobIMayB/4qKDp4w
	 LGWQObEHwIzUE+AtaJkl9VMXe+wxJhpLkuikLSzGfn0fFMC9oJRmVryRzvcsOW2jQA
	 GE2Syj9iSMpdflk8WBcIF0dbbWQQ7pPwk5tix/rXg0K7gAKChyD/L0HkmIkrflBw2Y
	 xaHUITcndxoD/nZfTJu2tnw+R2lXKx3Qh5eb3aAl51J5QU8WmookUssIwcMN1ptCG6
	 UeAyllobhW2lQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleg Keri <okerixx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the camera privacy switch
Date: Sun, 20 Sep 2026 11:18:07 -0500
Message-ID: <178992108596.214160.17938844286754928916.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914094201.14009-1-okerixx@gmail.com>
References: <20260914094201.14009-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 11:42:01 +0200, Oleg Keri wrote:
> The laptop has a camera privacy switch on the side of the top case - a
> slider, not a mechanical cover over the lens, and it does nothing to the
> camera itself. TLMM gpio99 follows its position: high with the switch
> open, low with it engaged. Describe it as a gpio-keys switch so userspace
> can act on it.
> 
> SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
> camera privacy state, and it is what the Lenovo WMI camera driver and
> Dell's privacy driver report for the same kind of electronic switch on
> x86 machines, so use it here as well despite the name.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the camera privacy switch
      commit: fc80b73afd911f6199bd066b843caf7d7ca20cd5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
