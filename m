Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9155803BC;
	Wed, 23 Sep 2026 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202014; cv=none; b=aOwMVgONl6S2Rmrihmqo0EUYICd2As0fJiOl08vAbogpVCa0f0pUzwmm5yTCF6d/C1kdx6Ti3GyQLVWItJWkIc32k+R0Hh7Z5No8SVR78WX+kW2T9OGPgZLbwfoqQoe3C0q6zeIUU3BmbGXAiATefQPv+saAaSX4/HuZxkU9VUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202014; c=relaxed/simple;
	bh=F53nNU0wXec6AzBAjskJDj4i4Joo7Ei2YwmJgHzi8V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktb1x7lycbq0T/9clxPuM/QWqa0sqs1KPwPOuCXWX5uTXmJUyXTr0NzmlvEiqsLQ8WA++kPXSKet3tRmFxIsiqBftUQH8e3/cjx3kGn2I1e7ZUZDqwphAwPRXh04HIVSMOZBjLHIYFBWVScK33ESKsdh0ufi6er9XheXdwkvRnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPMYtCZe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPMYtCZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7941F0089B;
	Wed, 23 Sep 2026 22:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790202012;
	bh=Mw/ozZj9QROt/zFzIPCo8EadaGV2JiwL2xsv/dEH7fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dPMYtCZe2FuBnFfy9FTVhirSfPLay/Vm+wTso4biVKEa34OqEFnF/D7zq1ROwThK2
	 DXS8xoUYsdEIDjZqgh4+auM8J4+fMUFcDZk4NT/a9jcWaSn5/JEUfAnvcwLnyh8ZhF
	 06BnzkKel5k0IrloVsC5NBgSp4tUNyoXHqjsi87pd1Pb4ZOb0NTPmHOZnkOrMO9awh
	 VJ9aooY+wLNOGj8yw0ww1i9HHO7rOz0BfqdjnciedIHWHm9HW81C9iA1tWczYHoARU
	 sSsDXsWLABZ2tmPfW4Sug7m5G8nnlyMbzys0FHseHvEQh/E3fPvzO4EHkWhsvxXvhl
	 Zv3LKnhCFU42g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-evk: add DP0/DP1 audio playback support
Date: Wed, 23 Sep 2026 17:19:59 -0500
Message-ID: <179020199815.520949.2651629277241563110.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701063003.3082899-1-le.qi@oss.qualcomm.com>
References: <20260701063003.3082899-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Jul 2026 14:30:03 +0800, Le Qi wrote:
> The purwa-evk DTS currently lacks DAI links for DP0 and DP1, preventing
> the sound card from exposing these playback paths. Add the missing links
> to enable audio output on both DP interfaces.
> 
> This change follows the same approach as the fix for hamoa-evk.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: purwa-evk: add DP0/DP1 audio playback support
      commit: 84001114134866c61340614fb6e3bd14b7013bf9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
