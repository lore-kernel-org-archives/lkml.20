Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2583A3E91;
	Fri,  2 Oct 2026 06:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921235; cv=none; b=hnZi3leirrjIlsUkmuIV1y0jI0YpQJ0XHGmOjDpjuS08G4bPhIgdacvWtYxevLqBOdsPDRa8tSQS2CviuUlrGNsqS9U069rpJ3/GgvNlmILINyhbfrBTHisyUuoIyv0QYdmWf39yIVqXKt0JDlpoGwNHPMT6njzllww77wcYKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921235; c=relaxed/simple;
	bh=Io8HVkvPCPe/aPEmXguiwBuqOsPM34NmrouVSYAkwgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDq2DkMcAOc0HID/qppivA5JuR9OQuu8g+7bfUsl3ewO+HCjyyF05dRxvkGO0FYzKo9XExyy4jvlbIkmQ7BofJQMFSxL8IHsjVLSOKor+gF0o1QUgWQImC5YMBMRSNDGX+9pRsIimuLE6EjWvyu+af0dTLB+Q3ELp5Lhzwuawbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZGHrQeR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZGHrQeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27D71F000FF;
	Fri,  2 Oct 2026 06:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790921233;
	bh=fymusI8JeATYerpS+gwjC9MLXrieyBiDEI8iZFTkhjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZGHrQeRMdUFM2+DEMpaoMCjcA2R+bx1MK5KMrCBOXCqs99aDeY/ZdqKIjy/foz5N
	 mfGFr0z7lWCT60KuncJ7HeIbVIuhDJQDSg+X3ylSinIQcD5XU2FT9a4iEp2QQaEcqK
	 odRnk18vddFj8OPsbV6KeQdyLQmSUDdtq16qPbqaeRowi9K1pIaPz4J0sdQXlAanCd
	 JYfPpxY9QiVSSVUHZAMiiUtZMotBAfMw3q3mxYf+oeNi5SIRedwpB32D0avQzXq5e3
	 fwq1ax0FxrHT550BrFyd9E/tySiMHcrs4NS+HyfNhtMt0lzsAQZRNQ7Oc2+mR99Hvx
	 RedRP3JL2yl3Q==
Date: Fri, 2 Oct 2026 08:07:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for pm4125-codec
Message-ID: <20261002-imperial-denim-crow-406dbf@quoll>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Sep 30, 2026 at 01:46:03PM +0100, Srinivas Kandagatla wrote:
> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
> Audio codec has TX and RX soundwire slave devices to connect to on-chip
> soundwire master.
> 
> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
> properties in mfd qcom,spmi-pmic schema to complete the audio codec
> support.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

