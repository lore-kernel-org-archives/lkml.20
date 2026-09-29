Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CF43EB0E9;
	Tue, 29 Sep 2026 03:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651763; cv=none; b=K8NOML3rjUIyb63gEL19UBbX2UiuvkHXCxKuuBRuiHmkh2/Y1CJWJ+552kEqhUeh5sFTA5J8miQueMxInpid6flNjsRaq4SGqzgRhLFEo71SANqX512SZZ3jeIrmgCdMA5NUZJOHmg6DdPK6GE4bY4D0O+NR/AVy2F4dXIVLr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651763; c=relaxed/simple;
	bh=O3Ym5GveT5yhqsvUNNXSLQ5xg6HrFBYGIE7rAlVgSAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ppr5lOIVxyUVbyFHcCQqtbRan1C4iOgNxconbeuaq5nbY+Hul4gvN6cO8Ay+hxWIdKKjzggGlBHTvu3U70mitbt44cZWupS8Pq1456vz1N79AUWW030AUlCGqsSYTlP6cVP7Jv12+wv2QKaL4NFdVAmCgbkZ5cUEtSOAEuk8Oao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv6wCM6K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qv6wCM6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD781F00899;
	Tue, 29 Sep 2026 03:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651758;
	bh=Db0KTAvITs673R6dWGvKRXzE0kaDkIw5GF8d1x7MB/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qv6wCM6KMkUiMu2H1dzDfYxK9EDWL8HpdrNwTd6aHgFdEvqpoFKm5J2BPUERl806U
	 UNJGKLp/iD1mLKbAO56Hz4+HnUi6En7KYmQj/z+Rpy6bl8rrtIF2PLfjfmSi4CLRY7
	 J2oeseT2kqXkJnEzuiWXf+g6ScB6p8BkVqgwAcUqval05AEuckbtHlCYc2XH+NS7Vd
	 CnwTIBgNLpcOgmjv3XjvBOHMwsymEI7gPI4I+NlZk51l3eHIUe1OzjT0xQcXrdXDSr
	 KDtuwHFjTT2QupStLQ3fmo89UyrjcqhzvA8o+Koo3AxZIfJRUfYJwpo7yH1DC+iF/z
	 SmHWpH0Wio6RA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Ociepka <greg@ferrisoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Remove RTC-through-EFIvars
Date: Mon, 28 Sep 2026 22:14:53 -0500
Message-ID: <179065171038.2673486.12218858875515546084.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
References: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Sep 2026 15:27:03 +0200, Konrad Dybcio wrote:
> This machine, unlike older Snapdragon laptops, doesn't feature an EFI
> variable to denote the system time. Remove the property that suggests
> it does.

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-asus-zenbook-a16: Remove RTC-through-EFIvars
      commit: 37e8a61bf7214306889777edd8bd3df53b52d287

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
