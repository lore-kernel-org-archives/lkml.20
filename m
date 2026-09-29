Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB92F3E4107;
	Tue, 29 Sep 2026 03:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651809; cv=none; b=Ea7K/HbkEWk+gL4vl/Xc+d2+5WpZS8WLUlacx2QMWEbx2tg6OA8RELzsCmhF5sFy0pq5FosUb8LidJXhl+Ui5vqkHTDXF3NoibPZx78sApOcC/hJEnYnXHoRy4ckn8VrzGglJIodFj9t4LXtVAO6hAaaZ4wFFKrrjuYoHB9pRss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651809; c=relaxed/simple;
	bh=dPaRNVeFrVdqbxnqW4DsJkjfx2dqfbMM+u9ze9IUXRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVrN7gpszeO2151RBs+AU3oI/DGn2yXX/GW/LoPhpz8yYnUdoZXojiToxUjlLkd6yex6vL/84jY/AOd0eV9Q403uJYKS/gd/vu3WTvVqdnHu/Ibwgc16204bf92tsJQGFwMxzkFv4XO5jtCzCqcK4j7o4IlXmSUTwVZeJONJ5ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBKUAUJG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBKUAUJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE0F1F000FF;
	Tue, 29 Sep 2026 03:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651803;
	bh=9UJfRKDrkHyBPWW0s0rB8/RfFadvwU5wvA/raQ8Y6Po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NBKUAUJGDerB6JscuIuChOhwso4Xoj6RnQTHD62TCpWTixAAyNor2fQD3ZK6IZCPC
	 a8wYC7PkyIRQjfuv0S2wpAIHvGpIP3UfJ0/dl+8cpKe0pNmxUk15AsBuSLVRhcfsYF
	 jGkWH5fOTxGNjSbMjlykW7RN/F8pcwTQAJSsCPz7mxdgGi9LT/un+6mH75IHp5GxkF
	 paSvgcDGvewkNpQM7ejgkfrwhD5N5xQLjXg4ErSl0Upz4ZI0uTFzNAmETnNeAxohiu
	 NcLvQ25gojjQf1xKmJEqHxWgPLMIdfwb0JXE1ZUW9Cr82wl+VizbXJumDIxIxAcQKT
	 KAOR7ylNqGd2g==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	yijie.yang@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] Initial support for Advantech SOM-DB5830 board
Date: Mon, 28 Sep 2026 22:15:27 -0500
Message-ID: <179065170995.2673486.7594805451558800807.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
References: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Aug 2026 17:44:45 +0800, Yuanjie Yang wrote:
> Board layout:
> +--------------------------------------------------+
> |               SoM (Advantech SOM-6820)           |
> |                                                  |
> |   +------------------------------------------+   |
> |   |     SiP (IQ X7181 EVK SiP)               |   |
> |   |                                          |   |
> |   |   +----------------------------------+   |   |
> |   |   |   SoC (X1E80100)                 |   |   |
> |   |   +----------------------------------+   |   |
> |   |                                          |   |
> |   +------------------------------------------+   |
> |                                                  |
> +------------------------+-------------------------+
>                          |
>                          |  Plugs into
>                          v
> +--------------------------------------------------+
> |         Carrier Board (Advantech SOM-DB5830)     |
> +--------------------------------------------------+
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Advantech SOM-DB5830
      commit: 7be419ca859f1625f589063814b365f59761c732
[2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
      commit: 37f28aec2091c949a0e2ba76ad6b5eda34301e0a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
