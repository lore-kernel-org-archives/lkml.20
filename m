Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169506;
	b=tj+2j+fqHCWSYFS7PfWQ2XM/4YbHZHhYLYJDZTOIWZq4vkj4Cqp0CPAQP8nVPFjx2TAx
	 oshHKIGJRyjHIptHEXKOtzKFG7g9vRLTRGmyeNWoeep6/zaj7noof9jXq4m5gZLI3pwKX
	 5d/cvLWNYyWf6uc4zgv/8wbcv20QWlBzBtiWJyrzkXNPGekx3YK0WOBb8a/kDg57kp58h
	 JHKr1KDo8AcPJ9/WLbutJ1G91WDGYMnq8GqFEoinEk66p5CtzYaNVqGEzLf5PCo5cxLuf
	 A6tOJA3VrnJPxpNNh0CrxO1R7FzUQPR36ZSST1xRYmUjowgz2TP4eJU6qzQGzPuUr3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169506;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iQ9ARUoUTIbvEIUpxfeikfyS2HAGENasCHzlEuGZ6QQ=;
	b=MoKlfvKtrZroi/gqrEi6tvSFDQ6S5yX9vMDwGlvFR+n1njVcTuAEU40qQ0wDzPOg2bdV
	 jYmspXBXHaf68RcdsBik4/1iDDQldSOZa3er9fncFdBzyrjEzqNPszDg8wiClJC5nq36p
	 J5k1DJq8FAUHY/zRDXLboTf0dOZpEJIhcVKeCy0ZsT1USfB5HasoZ0I/aOlFNvQA8MW5n
	 4TKpix8gNQnJPCWPhdQy/+SX9HzuT5AcjOZj/KqltXpoQ9j7kYRwWCgtGKwB4pInWdAPf
	 I7eqE07v33dq3aqMU3JfZokH5EZzm5hzEoXzNFfOHs5OHaT4HgBsWnzBKxg3YD5xryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yke1aVcE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81521606D821;
	Sun,  8 Nov 2026 20:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yke1aVcE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB781F008A3;
	Sun,  8 Nov 2026 20:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169506;
	bh=iQ9ARUoUTIbvEIUpxfeikfyS2HAGENasCHzlEuGZ6QQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yke1aVcENI1SW2kEifMV6BRaW/NqItTpFOvClv7Fj/zr36MwSkKHr+mtUVr+pijPA
	 QNG9zORcIlPFtJfpT8k3yEcnoggXQUmcPMRbn69umFdoGpfOOd/n9Y05oOLzuA2h9z
	 brCrPKI1VjdRgIh/xu4CCgOZSqWQC2MQxYrwxRnFyJuirTLhqlqGO6L1CA+hqr/xl8
	 /8BtWTFyd2FhxqMjnNXGVKFZZPdaB8n3QkXeGpZtnJ3Dkxm1BpyzvrAKTk1D9NPkG6
	 v0yEl82gtiQsmGDqFIGmX7v+FYcPRBIAFBlRTUfhf3lDCRHm/lTBvCISDIQEvpIpNf
	 oC03VULomUo+w==
From: Bjorn Andersson <andersson@kernel.org>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] media: qcom: Add support for the iris codec on shikra
Date: Sun,  8 Nov 2026 14:21:28 -0600
Message-ID: <179416929307.628393.5080812119939735078.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
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


On Thu, 01 Oct 2026 19:11:55 +0530, Vikash Garodia wrote:
> The shikra platform uses AR50_LITE IP core as video en/decoder codec
> block (the same as agatti platform). Extend iris driver to support this
> platform. This has been tested on the Qualcomm shikra boards, shikra-cqm-evk,
> shikra-cqs-evk and shikra-iqs-evk boards with HFI Gen2 firmware.
> 
> v4l2-compliance results:
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: shikra: Add Iris video codec node
      commit: aebb53e7149abcd724a8788366716645c0f5c849
[2/2] arm64: dts: qcom: shikra-evk: Enable Iris core
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
