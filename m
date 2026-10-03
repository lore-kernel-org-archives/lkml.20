Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26B282F17;
	Sat,  3 Oct 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020203; cv=none; b=BP/fLp+tUF4r81CMQZ0mkn59yX8TvzVrzCN6L9ZrhojgH4dB3GfBZlMQ/Sjh1IYlPR1MuBr/jRPgsAw8PtZ6bQBfzxod+rnOfviFdIv84eRvczhbDgXmJVFC6Sdv+aQmoZYTu7uNElcmmVr40z7KYS9VpxgoOOBbrm+XtvFrDNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020203; c=relaxed/simple;
	bh=7IfOtcD+adxmhpdpUffgrpCskY6lGsUpGcSrhH3sTbY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p/xOxodrHUY6iv4xo8HO7J8Qu48SDkCcofEtB42Rf7DDTI2pq768zrYEAK8J/FKEJYw+YrOiWdSoe+WfdhO84Sv5IkEAcEhdQqqRGg7sNQzosoP6bMNTKRw6jNXPrbcYZOgml8X+rYk4iMAUED01PyzaSGLskrw0PtSH3R2ibKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7YHiPxx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7YHiPxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441191F008A1;
	Sat,  3 Oct 2026 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791020199;
	bh=eJkRI3KjrF6F4d8KvcZNrKGIF0SYoOwizF1vsvhHtI8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h7YHiPxx9B8gN/kh2ES+BjDaeWQX31eeB98SXe/nygubROM04Ic48iWgVvXcs2ebA
	 8D9ZlVk5g7awkCg2qA4Ifys4xHmvNKrWoCHkS9ni+yT/UToQZoyiyTSVUKK60BD3Sz
	 BSlhTlN0aOaYhvtPzbSmoC93KtaXsuOJWplSEvPw2OwWyhrEPmJmv7LHBe3vgiUtMw
	 Pb66CjETebrbBWG1JDtwZINGE0c/uTvr1xRtUu7SFAOFjUWqrmD+I1drxOueLKFHZb
	 zmnxE3+QM4pORd8yg8zJ7uUXE1uIQWU2+40EMzyMQhP9ewwvzR8K2mlV/iuXSyUj+X
	 hQaX6AZw+QVJw==
From: Vinod Koul <vkoul@kernel.org>
To: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 neil.armstrong@linaro.org, mani@kernel.org, 
 Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260917080622.824253-1-nitin.rawat@oss.qualcomm.com>
References: <20260917080622.824253-1-nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH V3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 QMP UFS PHY compatible for Maili
Message-Id: <179102019592.199361.5288180593592732551.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 11:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 17 Sep 2026 13:36:22 +0530, Nitin Rawat wrote:
> Document the QMP UFS PHY compatible for Qualcomm Maili to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the Maili with that on
> the Hawi.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible for Maili
      commit: 48afd2d3c85aebe3303b42db30bba2963127be63

Best regards,
-- 
~Vinod


