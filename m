Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AEF48989B;
	Mon, 31 Aug 2026 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198850; cv=none; b=NkRgXt0Fh3at+knMnUlDUdA9YX5Yfor5WKa7i4WCONWB70nw5nfdGYv8LqJg4UP1ErmEEAJsZv+kMChfvhgytvLM3IjXfZNRFzdvMMjB2s4jvNAo3n04E78NwIDcStP5TCdTFPl2ij6UudRogZfYyNPLziRtBxIjFZrHe1qi2G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198850; c=relaxed/simple;
	bh=jIkYRyPkpRImXCXFcfUFTMScrz0LiaTMNpayT6QxRFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxXhwPo8pMeN/4CGyAjf1Q0oLvxGhdLFcCGh8yzlF9uO1/Axno+uYj/+E5RcIGXfb/bR1Q/GFKXihy9TfuXZCqPYCYlX2fOZeUTZ9gPJcwJHQuS7EeD30m21BEO8rjjFpVmrXmgQff5hdtd+WNP4QZsCFUHDj4NkY4Mjzkc4GU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kn3uFruW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kn3uFruW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634EF1F00A3E;
	Mon, 31 Aug 2026 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198849;
	bh=C0wR2CeHaYepxDy1YJiRtN6s19xvFFxPA27keILXfmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kn3uFruWK7RL2hbgxaV0+n6/ohSNiSdP4sGT5r/vLRDM1VG5eCq2RhzRWbySHws/b
	 r5XBcxSKJWf+dzuTdeWcteTDts7/JshVS0tY23wIlCJCEBXzDCAdGtai6fsQT+XJZ9
	 2saidryraRg5pB4zcMkX4wF94x83eX9N+3zS7Zu4edxPv8LQgNnetnmnuAwSq027ih
	 EAjBk/8zgCugtHN0j+SN6xz1xis0920iyqxx40d/XSkJi7B/GzwvuJBM++t2vmfI5C
	 Isg+AQ9Hwhey0d39kYS4xKlZ6o2IgaFAoXFcmlA2b73ZminNGHmmDoE84RfjUlg3yz
	 ZK6JrrhkguNOg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sc8280xp-x13s: HBR3 and USB-C DP audio
Date: Mon, 31 Aug 2026 12:53:36 -0500
Message-ID: <178819882976.1411250.13651068634513911390.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 09:52:47 +0200, Jens Glathe wrote:
> The X13s already enables both USB-C DisplayPort controllers, but the
> board DTS never described the link rates or the audio paths.
> 
> Patch 1 lists RBR through HBR3 on the DP0/DP1 outbound endpoints.
> Without link-frequencies the msm/dp driver still defaults to HBR2,
> which is not enough for some docks and monitors.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on external DPs
      commit: e187ae3975932d9a9c66762fa3e2664c485331b0
[2/2] arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio playback support
      commit: 8a62b9c730521a48a24b4403e48e5af74e484aca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
