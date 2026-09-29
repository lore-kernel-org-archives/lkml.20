Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623C43711C;
	Tue, 29 Sep 2026 03:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651775; cv=none; b=qt5CShLWv6Fh6al7bkgGH1rEo518FmuddkryI1MK9Ef1XkkcNONMDLzSI8A2rmxLLdUbNtjzrSeEF4sTWxC5vfmWbHHJSsPDqQXcrcZr96kknFsRH8oAEZKAWi0HHxplHvT7Judsqi9HI+8EIJOspC1AmnoSHOP5kyg96K7uKwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651775; c=relaxed/simple;
	bh=23mUWzDVQE7egXI98/YfRF7/9F1YsftySKXpI0xQn0Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7pD+IjajgkDyNjfaJ2hwdMiP5iskN1inozlPMzvaV2QrL1lGQ8cLfeH5ieFvOaTwqDcOatDDlRjhsz9lD5/0yjPz0RKWY1VOoJrsq/vrB9VCU9vck5S1yNZ13HGKGJrA6HjH3y6Fs65TQ4fE44CPKnm2Q+EeujGmhMuNPLmxr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGakkwkY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGakkwkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01641F0089D;
	Tue, 29 Sep 2026 03:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651765;
	bh=pXJmyPiYLotzICDmn1BIwnMv1RNNpsM58kcM1U9PdLc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NGakkwkYZ3W9WxDHFaD3b7lQquUO5BAT/a6Al2K0kUKuBsqcKD312I8B4z5LVH6ac
	 mlMTxuvHt3zK6llxYs2DKx3T47kA915Z1ClE+f9hfiCpKwnizqgIlfMTcF6DIlml8E
	 cOoYOUvQ4eeYRUqDrdkmL1m3JUj934NmHmjlRGFO5m9RjgjtE6vd8gxrvOhUXs7+Rd
	 +1BKPUaFapXggGKuAGogdEJyZEVx4+p7irqDfF+odtsFFVHS79dYwt49vyL1j8WhCf
	 5OHimku60pHwjiYAuF7ZO5yAcR/R0XrUlhQlEEhKPoJyJfyM8bA7L6mVZCeOvGZ2+O
	 jHRmR1Brv0Skg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Replace spaces indentation with tabs
Date: Mon, 28 Sep 2026 22:14:59 -0500
Message-ID: <179065170959.2673486.12951376553843102608.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829193839.107040-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829193839.107040-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 29 Aug 2026 21:38:40 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] arm64: dts: qcom: Replace spaces indentation with tabs
      commit: 4b78717a5bf295076eb1717ad1c53614d141d151

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
