Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169407;
	b=2AkOnN2ZmS+/GX0DRUdugQK6jSMxEFq8j0VkY2kgQHE7cZA8hx8qGS3E3VogiEKu/QtX
	 OuWZziDO9YSl52lBxBMNoSeJK5b3GssfoKc/86r9vqZIBI2KCKfVcta0Wv7q/O/zia91V
	 BAzmlfVT+ARhfUWmR+xoPVvqGGTd/F0opp4cFgfyMzhIUEKUC8K+JzDNBIFIpPQ8azfIb
	 RkeTKK0oZNQLGj9GhaGWKYp1ZnvUf801TtnrxW5V1YiJr1my7+eL5Da8usoROjLFDyduk
	 HrRIpb574Hs2B5R61TrQ7+wfCgNb03K0DYpt3Pn6Y3E/wpcj+8kFtV1Cs7Holj/5eHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169407;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9U8itW8G8MyY18hmtwcYxgLlUaxupiYuU5C8Kd+PdNc=;
	b=xUNaQ4MlT56GYYFRyce0xaRZuDqdcdGaiZUHDwgPjaWI+nvlPbcY9sH6jrn7jyaK81xC
	 WN51eV4e4VKvDpkfGcoD0PeNBiPmwjIM7yCZCKkPx+ekzn7wB1x/QswZ9+jDl/Ozet8+o
	 h5ylgaM8OPZTUC6e8MVuFwOfZenwTbJrqBbCOjpTI1PwIKVt7dck0KhQWyQOm4DEo8++A
	 3Bwn0KOOSB2w8s2kLXzHk6romBWAFjzZ06H4vVZ3cRtfhkFih6zBtvndontUO9sBA9Q/9
	 EkB8qjg+Q/7DW59AOZis3D21xwlgab0TAu18l1xWLukYknhmBrNe5KfwyJdt6y5Hjvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQ9B8ZYO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEEB608363B;
	Sun,  8 Nov 2026 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQ9B8ZYO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4171F1F008A5;
	Sun,  8 Nov 2026 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169406;
	bh=9U8itW8G8MyY18hmtwcYxgLlUaxupiYuU5C8Kd+PdNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JQ9B8ZYOIyw2l381vi4WyN4cUaLJNdsdj2C47w0GIibi8hMOKwZScck9H98GKXr7B
	 Ze1WtmB1SkdOK0sNvaiqm5H9NWORan3uYQw2ne+Vxw8MllNn/SpfLi/bbVhZ3Ylnuf
	 huFVai4tafKAAqvC2K1iNUVg5TE50N6jQX3UF3XJQUG9mDh5/yLDzV8aaqotddv6w+
	 z+fO4LQ33qkcdMspqJlREoD6ni51568vrSARXz4x3ASKv3hRQPHmGJIEkwEaDqcg6z
	 W/b4wyH3p8h4B8AxjdwlsKATQBKLDEd6KnGTI71xpSCu3aSH9UX6WYwU3WAOKX2c/u
	 gecEccssiuizA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Miscellaneous updates to the Qualcomm LLCC driver
Date: Sun,  8 Nov 2026 14:20:12 -0600
Message-ID: <179416929450.628393.17660771300866759141.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
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


On Tue, 20 Oct 2026 22:24:49 +0530, Kathiravan Thirumoorthy wrote:
> - Use lowercase hex values in Glymur and IPQ5424 configurations.
> - Fix whitespace and brace placement in the slice configuration arrays.
> 
> No functional changes. Compile-tested for ARM64 only.

Applied, thanks!

[1/2] soc: qcom: llcc-qcom: Use lowercase hex consistently
      commit: 94cd86f18eacca86dacdaa7babd7ca461ef46600
[2/2] soc: qcom: llcc-qcom: Fix whitespace in slice config arrays
      commit: c346eb84a1ce7bc2fd17afb8062d4e5d8c0bdef2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
