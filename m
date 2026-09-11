Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A715BBA45;
	Fri, 11 Sep 2026 03:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096923; cv=none; b=AWOoCEEwikLKB7X7P2v3+DEsPoIvYWiQROWjkAIYhuS+N62poSu0MB4FMxpHNtD//ABR/ju3p+1Q+7+laqk9vYcaG4MrsnzxKfBnwPsrrwVsgbMeX6DdFXckOraUlVzi547/E//QJ2UXCZMY6DJ1wbtwgkC7g4Ele5umRRUnhe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096923; c=relaxed/simple;
	bh=T/sBXIRJNajk7gifbdeOkx4PeRLs54sBBC4C1AeutCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LumSXnKxIffpxmDkukicwBHzA0NtlH4IQ/vTYR6ApiAtMRWR3MN8h99IeEOGVMRqHBesZNS5mWtD47oYzyXBCaD9k3FjzD8O1TyyuxgRw2D77PxFwyTeHC3xRzmgVyAn34f8xADzAAMthgBf0cVHU1Y9PUfy7jYeLmOBlr1YYF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXM2mbj5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXM2mbj5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CA21F000FF;
	Fri, 11 Sep 2026 03:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789096922;
	bh=OmZ7rn1NQLaZkc+T6xgTcyFkExlKs9AHT6GqSQ6Wm8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eXM2mbj53uqH5aG499fRdsJrr65orvI996jEZrnrwmaxEPgItWUNE712Izi/H2nZI
	 GZ6lJ8WsH79MqVYxh6LRrZzCHJqgzh68J57iNkGgGMMv7LqjJRnk52RGUs/gECLPwb
	 7ChT33sw4oX/bgmgncBoEBDlZEf/w95QxiDCsFTT06z8GmOkTtrOb833OWBAivlL++
	 3Bq1zYmtzj+M1NzvoHNkm0M3eFURMIO9QpVGrtTarVTlRy7s14ZCrpkO/AxgVQ9JyS
	 dhlTvU811PwF4v2S5lLl+TzUg5diBEt8RIrN34syT+YVQH/FK9AF3B1DLXsjQqFJT6
	 wjvOcXSdy4coA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] X2 Elite Lenovo Yoga Slim 7x Gen11 support
Date: Thu, 10 Sep 2026 22:21:57 -0500
Message-ID: <178909685114.953196.18331148587059742738.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
References: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Jul 2026 19:59:43 +0200, Konrad Dybcio wrote:
> This series brings the bits necessary to support the Lenovo Yoga Slim 7x
> Gen11 laptop, based on the Qualcomm Snapdragon X2 Elite (Glymur) SoC.
> 
> The DT allows for a decent UX. Among the features working are:
>  - Audio playback and capture
>  - GPU, Display
>  - Keyboard, touchpad, touchscreen, lid switch
>  - Privacy LED
>  - Charging, Type-C
>  - Wi-Fi, Bluetooth
>  - Modem should work on the SKUs that have it, but it remains untested
>    due to lack of access to such a device (it's just a PCIe device)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
      commit: 966975fd7b0d3e3bb85bae584f8053f13aabc288
[2/3] arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim 7x Gen11
      commit: a741ecde89496506e0c8decca4e622b5d2ac3dc6
[3/3] firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x Gen11
      commit: 068ce7396a2253a88e162393adf625d450b34080

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
