Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525A476CD2;
	Tue, 29 Sep 2026 03:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651798; cv=none; b=Yoi01s9QvzWclvkysWZ0+dgnvHjzWD2bT50o8ETHEaJGG8beDrOyxXzI1rKZFCaawuaxqbSGobHsL6UsBHddxQlQzVQGDbfj26msRXleiAyqZ4vfnWx+eqTq+MbOChZTnfSi76MEwJ4xV9PGB6DW0JTkriEF1PNUJuxxZl286lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651798; c=relaxed/simple;
	bh=OmG/LK986iAnKXSEmqSWcHKQosBNBSZElEeTZjb4HVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5Xn4+iopAqOmsVlgwv8JZRFArAVGg578I9sesbElVbE0Q/VZiDsdNzwVAj77zEU8y8iAt85QadOi9TKZKdtBc5qYUe9B8IHuvrTbm4e9AHkMhnQWZ6+bAE29LbK/s3l+gy4MIaYwCjiB/dYvrP3D6V8iLpUahYNS+4bvBiEH8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV+W9lGw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV+W9lGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E8F1F0089D;
	Tue, 29 Sep 2026 03:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651795;
	bh=6a4cHSbY5v21ngoJOuWxgIWxVKOLrKeyW1cQsp4CeIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CV+W9lGwbhyB1+wbnS85lup6E9MR13uVEd2wbUVL5kQLqL09JOoMoOuDKb4u9TlWY
	 TmyDT1JG7eUMIbTMB1wqoaZ9MJEjVMyUjSST+D6jjeaKq4KxLZ1xEinBQEyf+ksLKi
	 qKp9z4Und/jCzxt4AlSPkuKaN/mjK9EQrDU1Y16FdeBAbxS1PYAeRfWLrDoFfbKKXK
	 v/bLibfMLugso5MO1CG8AQXuGRdQ6zC2K7Up5uze86NDfjU1SM+FpPNKxKpTio0zL5
	 New/J5V1zSuPn/6+YYCeSifTIBZ2X5QAZr+MmQrW1+LQmC41Tk9GyJu0cHbZZxBUzS
	 /7zg58p+6p4GA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: Support Retroid Pocket QCS8550 Devices
Date: Mon, 28 Sep 2026 22:15:22 -0500
Message-ID: <179065170958.2673486.3807179788063261684.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 29 Aug 2026 14:35:30 -0500, Aaron Kling wrote:
> This specifically includes:
> * Nova
> * RP6
> 
> Retroid Pocket is effectively a sister company/brand to AYN. They are
> both under Moorechip and all hardware designs are handled by Moorechip.
> Thus the electrical designs are largely shared within a SoC generation.
> Hence these include the AYN QCS8550 common dtsi. As such, this series
> depends on the AYN QCS8550 series [0].
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: vendor-prefixes: Add Retroid Pocket
      commit: ea55bba4c68a49fcb527da6c71dd48879b705fd1
[2/4] dt-bindings: arm: qcom: Add Retroid Pocket QCS8550 Devices
      commit: 198d38cc6e6f40835b7191950e7c84f34bd08adf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
