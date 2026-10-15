Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6108B53C3AD;
	Thu, 15 Oct 2026 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077360; cv=none; b=TK5l6JZuzWu6Y7QElv/FdKwKJGTYvJAB3/hgGZA2Vfsl2GGuO8KpyJj04IZsLzmsjZZMZUFPSe4ByjFPwJaoYV/QkmdaX+Y+VXSFb4E1VniOedoyKCq2D8qbpAUu2iqGqFkogwxxm0eF36YcWFZUM2nL3hitGd8CNUwEqARyJmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077360; c=relaxed/simple;
	bh=YaFXb9WrWUM6jpC/C36tcWGukIgbzgS4MZDG5mC7HXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GCmpcZocFSHsCCfiA5BY/FR11HgyHSZGNh9RQHwFGRzMfdWOSV2sOBHej7bKDSqWPvHdVKNitsRf4u3x9czfAuR0+EPc29r1OG0Fmh5q66uBnwYwiihDXQuDfISfe16NxPZ7346ZXTQbxrCx+y+rLPwaOEWQI/+HA6LxTgzJSR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS5dvHAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS5dvHAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637081F000C4;
	Thu, 15 Oct 2026 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792077359;
	bh=DmM0pT0QFpRuYUC1TYORapqWQiN3iK4gHA1id/5dZ4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gS5dvHAvNQDgx+zBUiUX3AQfqSc5MSjoyXtmCTBcchTRTYhP75XQD1sNKt/yu0Ze/
	 YxRD9lhZHZ2I+DhiWjYxrO/0ULk+vUbTAla5xFc4z7O02at5UBedCKKhn/mhUgVEKy
	 tvhorsGHsnbCtw84Lk/uzhOGPh1GH88ioqGaOESrG6+tMEQCxHxPwlQC4KzUCdCtz6
	 8Rqk1uHW3SLBmzARoiO6gz4aOPQserqFWaGKVBnYYItQJ1rx+Aq6VvBAsdnFbPfZuB
	 DpqKu5NtBsNkmgULx8Y7Atk9c2Ryy9UTzKeGeIoBRD23nRpfEjMttIjHWJHtzLTb5q
	 UNTPlzj8jrGNQ==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 1/4] dt-bindings: mfd: qcom,spmi-pmic: add
 compatibles for pm4125-codec
Message-Id: <179207735616.2048081.9070663764163723294.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:15:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 30 Sep 2026 13:46:03 +0100, Srinivas Kandagatla wrote:
> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
> Audio codec has TX and RX soundwire slave devices to connect to on-chip
> soundwire master.
> 
> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
> properties in mfd qcom,spmi-pmic schema to complete the audio codec
> support.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec
      commit: 4c06f3659671be3c95e18519bf40e32ecde21382

--
Lee Jones [李琼斯]

