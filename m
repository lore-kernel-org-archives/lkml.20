Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EDC3C3F4E;
	Wed, 16 Sep 2026 22:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597934; cv=none; b=XFld8LUswPbw+02Tu685WKaj4efarlMxA1DKx3JjzRGQAHlusbNwDEYRmSjcLwQvjsgS89C6zoU6onNKSk8hVtuo849T+F6upil4UV+1+Zcd3Pc1bI6a0aduCtBwjzcP7FtDmIxJXpCXJ86aQ6w1+tFW+NzgO+jok2xxv0q69gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597934; c=relaxed/simple;
	bh=A2rj1iUUhe0+aCpRC+4wABUqqChxpsKXoRWKvygqIUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iA4hZw1fjkeB6HVgh4lDIuaBrElyLtWldLHL4sc+i+F09uUkxNuh2dAhTgCLap+OKnxYKpiaSFBRuxSZiSDS1GmFnfL6iKOTGucTWzyUNo4w4pYrBkjr7Ya6a+qCSDnsFB6UCGMl5eudaQewxp7goiXVs7Sls/RMwvYejDgJQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEW4bklb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEW4bklb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C7F1F000FF;
	Wed, 16 Sep 2026 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789597925;
	bh=7O3m89aBa8b30JsKemOhKBYOSlk1XKFI/jSTfvzarBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZEW4bklbmV+I4gGU3lgQsQbUXvtfUiVeLu9PXYclIUQzbLaHoi3aCatXitaOt0xbV
	 kuXyB0gdVAiXcs2xKxuYbtiN3us2L8Rc031JQ3DHQdc4K1GdT6a75I72GrblQJBs0m
	 h+TucA8j6r8aUJVOIqgboq7vf4BvUZyQbg8lx6eM2lgM5KDUId9JSr5zgruYQSQI6B
	 z1rCQa95Ju8VcLwFUzNm7sGqf/If7FLz0i2XmanRtQyOq7ROs5rm4x2ccCMrPAqyEN
	 oI2SRrthidyLoRYNQodIhDrpPzL4KA4rfHXLZZIVsDrrfNenvd6HVPuXW9I10xt2Yy
	 Bru7A0EfiubWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicko van Someren <nicko@nicko.org>,
	Chris Pouliot <chris@pouliot.me>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: Introduce Asus Zenbook A14 (UX3407NA)
Date: Wed, 16 Sep 2026 17:31:53 -0500
Message-ID: <178959783410.1336377.853415939571836906.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 20:54:21 -0500, Bjorn Andersson wrote:
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform.
> 
> This (v2) remains dependent on the eDP support here:
> https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com/
> 
> As reported by both Chris and Nicko, the A14 only has 2 speakers so this
> has now been resolved. But, on linux-next I need to introduce a
> pm_runtime_forbid() in the soundwire controller (swr0) to avoid SWR bus
> clashes when trying to play audio.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14 (UX3407NA)
      commit: 21c65236981f1e71d40afd3d05bddd0863af7177
[2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
      commit: 7e38885d78f7b008c085a0cde7173242d02d2b01
[3/3] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA)
      commit: d3bacfccd82c974a541398a5ce310de7546b525f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
