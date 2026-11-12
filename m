Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474251;
	b=jd7pXSX4HgI4dMxwqV217jLLA/MNda2PuZ4QhwjN66x6kbGHxeurPP6aeyxUPAM1aIZh
	 9cpxd+RCsuD7MmT+5bCOgGcX37QFOYL1dxfCyCTBLRJ+benNhom2lH5gS8fysap0KXCqa
	 I+1UNQ72V+d0ZpeSZLewshgl9p6gYmqs4rBudmf5i1c3VxzJ5f/KGhRja4FFsSajsKTyd
	 pKThviVns/qy0Ha5+wq18lRJQiVf3FTRzbrVGNv4M4zdT4f7t12jSN5y3Dqsh4aRgm8O8
	 HZnb+e8dXhL0JilSkhFlrRO89Xtazev9b1e8fNFUe+3Hbdj49oXBmVWEPVlKRvpyl4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474251;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=ljiqR7CXOmCffMfAyj2PLXWgzNEpnp3l1Lu8bty1Q/E=;
	b=TgE/TjLkBviY5gnZVKtPDYdMBdXhjKI5YfqFOlvv0xlJrSnvSYJqawjpH2K5wpkiA/qu
	 oQ9B9pA6ZZwm9KiGT0a3ykfU7dA6jX8xLM8g7NmTtDyRLCZwL0wPEfaW9dJ94G6EWSJQx
	 ONiOCm0VDRi6c6reCRzhwLup/lxXCcqP/wXZJT9jGdIaFQKQ+uj9+RlWBjmepAV2Tq/jQ
	 j6owNeX7to54Yre82W/3oyGz08PFz19BXy10QMeel6jM/u4rWISZgKhsn9sEzEKgyo/lf
	 mEunCNh0qW1n/2o8K84n9/inZQJuAPeBnlv6IiJZobJfHNbVM3/kmrU0g6RLCDB9DNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EozQfOTj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC260A2635;
	Thu, 12 Nov 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EozQfOTj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314101F00A06;
	Thu, 12 Nov 2026 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474250;
	bh=ljiqR7CXOmCffMfAyj2PLXWgzNEpnp3l1Lu8bty1Q/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EozQfOTjVmzweoSiPK+IK0UJ1RM4s5peQjOU/H5FgoZQXA9gGXd85GYX0x0EGprma
	 snIKdrlhldI58Qkekg4f4g/9Amk/nqtZBGZI5Omm6cj7uum2Bf2D3fLXeWaU1Gh97/
	 g+1LwLC53n19ndYRRCkVEPfyJ4JGKnRv7+9Z+R9ChX9SCKL6N/lzNvhKxRPyCWvG0K
	 2Kcf+HJY7tI4A4sPr9SnhPNIlYa+aeeyMGeAW/KUqRp3LP3pRqxzshZIkhgskWSOch
	 2YNnOFrkl6myPxtX0qYo1gyye2ci+e3UdgGpOJ0jDZj4ia5nEODp0z410ab3Ys0xVe
	 fLIotZijk4rMg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] Fix up QUSB2 PHY description for
 MSM8996/SM61[12]5
Message-Id: <179447424584.428303.562761985654321627.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:34:05 +0530
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 03 Sep 2026 16:25:27 +0200, Konrad Dybcio wrote:
> The MSM8996 QUSB2PHY was not being guaranteed a power source.
> The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
> wasn't. This series tackles that, freeing us of some dt checker
> errors about vdd-supply not found on MSM8996 boards.
> 
> Compile-tested only, but docs confirm my findings..
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
      commit: 881cf66d7d011477cd119774e0903d2e36a506ef
[2/5] phy: qcom-qusb2: Fix SM6115 init sequence
      commit: 2f8316ab844adb8f172984216c72506ccba92ea7
[3/5] phy: qcom-qusb2: Remove _SHIFT defines
      commit: 54d32f138fc44efb0a41fa388f238ea1f2fe5760

Best regards,
-- 
~Vinod


