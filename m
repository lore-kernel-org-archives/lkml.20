Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169431;
	b=WIa8xjPixUiyO2VphPaW4+c9T1qQh6f855TM+FwJW6LLDIP+5LgKS8EN5tpfxqkLIVmo
	 uNUfigiFxsx9ZfoLu72UattjgfU4jQK+FFhZIHulM9o6RNllcikPi16BrZZ6FJB3iYwfb
	 mgWdEBAiS+r0Cpk9NRpjfakH4zto+OfiqojYrROQtKD9GulzhJLVp2GERvZpVeJfuMoBZ
	 r6EEEp/FJyi/k4/xe6Wf2vuCV7eLKeoBtGVZAC9KSeHLPYIE1ZVrGGKUOwFd4Ty8CWMBN
	 LANHEbIawXrF8al3kBitNALbiSwcPI8oD9Y5Q85iruDy/jmY4rohlC/II4lHTBeV+cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169431;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DoQ6nAPtJ8l/8dNBg0bwYAbqA1pn7f0aXlCBcs+0TMs=;
	b=yC/zjsP6hGvcjY50XunKyilMq4cVJVNPuJR4ZrGdY5bkZ6GW50P+gNGgmUaOuGCO0gyy
	 agDUcWsOYBREEA2TueFWW9C2MHxD/gf4zd0XP+PnaPJUKl43jTRaTLAWx7dbnmR1JsC1r
	 2FHt5XybFBs2NCtNqwziy8le/bYI1YzQMHHCsBtll6vXcQttkhJW4ZDjytWgG5oHAnf2H
	 HHMM/P8g0YVvJKwqDdyig7o+Ihc3mgV0YBtUX79ofB4rxgP8si9XdUwDuYXGCJehWC/gN
	 GKWZNRVL8sDcWhYfwxUaCKQYWwJp3YZ0C3LM9TRVtNYPJSwyOkGkkf8090ok5i6IpeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORSUEUOq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9560746BD;
	Sun,  8 Nov 2026 20:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORSUEUOq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6931F008A2;
	Sun,  8 Nov 2026 20:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169431;
	bh=DoQ6nAPtJ8l/8dNBg0bwYAbqA1pn7f0aXlCBcs+0TMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ORSUEUOqP1JmNawdSzUAW0BCzzDtaWCX5/s4ex5zC2/XU12+58gCEdlFonizypBXY
	 +AlX98CQeP+4zGgb4bUJWA0D3OgW5pvHVXz+vsttafDwTZNu5Q9eoLQVHbNcTJ82nq
	 IM62FtmS5m+JJixvxWchFJP3NZnWg0GFRcNrbS2UEgFOjbJE+f+D9UpAqk53JC4ecz
	 2Ul/9Kr++tVXQF6Bt9p3xlWzNu8WNVLMBlGYE7uij+RFY01szT4a/NlOXqurWaeZmC
	 r4We3vpKYTUQTBzsw4DhYzVyLf1DKenIcT8Tn8AYbYU5uK0Tw+oYm73AdaM6yTjFbd
	 VMeg3hgJXKe/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal channels
Date: Sun,  8 Nov 2026 14:20:32 -0600
Message-ID: <179416929503.628393.1735702945485310830.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
References: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 28 Oct 2026 15:17:18 +0100, Loic Poulain wrote:
> Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
> nodes for thermal monitoring on the Monaco Monza SoM:
> 
> - pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
> - pmm8650au_1: SDRAM thermistor (AMUX6)
> 
> All channels use 100K pull-up.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-monza-som: Add ADC thermal channels
      commit: 99b384802d2895172f0306c4e6d846b9fff23580

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
