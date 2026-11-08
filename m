Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169494;
	b=Bd512JYYlsm/eORye2nzwBiUPsru+3upYnyrvCgPFbhc6b9pJGGO9G9RiFIHU0xQSczO
	 b1agDoZylyGXr7VXnUr4HNb8NKVst0P2ZyFS5+2yqm45RZcnVQmTVkMn6Idx34UgHjxJz
	 tX3aY0dMeqhllZBlcmaLS2rRzCa6jo5KrfbvutfxICTCTvb2ywnNXuZahKPVAM3W0PpUN
	 AbYkAFPyuhhhlB3g/+NCkB4ZTeWGmTdUwtxeARE9ALwSIh3ALPZZpelY3MXQtx/wT8It1
	 3l3oAPv71h0Sdc9TR3+/s67YSHir6x4bZhBMP+XQHabhjx2TlAhw5jCV5ougYiS7o4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169494;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5YXJOK8gbHZE6IIOUiZiRXRJr++pQ7BFim7SsT/bt/Y=;
	b=xEJN+B1vQJJO2Aj/TVdwbcWL9QsXMi7HuO1Hxh2b+AKRKFsBBmh6qhaMDVTQuSwJuC/r
	 893IojjpxsLKWYG0yDUVc3MWZicgfmC47PKz7YIRiuKfKPRC6vF4oOculI4w44WnPnj+4
	 8EFNkSWcs0/qnpgOLrmCVpopRY4urSK7ZokiHOVwirah4igqcMzsb1Tv0fgy6Sxv3KVWP
	 kRMHxYLqkKyIZeBUkGyhaTpnDA6e0kEFVimhTNTFUPnjTs/Qa077kqa8k8EnQ+RGqLDAV
	 5mOkLGzzmm3nPPwvMHJilcMO94jRubDh8X4kMKd5rmD5qqvS5Mdi4x/JDuoaGlMH6tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gdj1c88Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80011608032B;
	Sun,  8 Nov 2026 20:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gdj1c88Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5AE1F00902;
	Sun,  8 Nov 2026 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169494;
	bh=5YXJOK8gbHZE6IIOUiZiRXRJr++pQ7BFim7SsT/bt/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gdj1c88YGpXDc8rMllrhLi5NFINdgDBp09RXMAwx1ZACuI+lc61ktU22Co3Ypm7HP
	 bYTEpLAGVfBxR63c6MVYOt1BEpkCYET0L59UR215/YxpCBh8pPr+0YNL2R1zgeiXMm
	 MyC9F/W0SrFKsW16rv7SsS7g9LXMCZolY58M1WqOzbZJXhpGFr5LeM7FCXVJ4zAufv
	 I6rBICzJJP9lV0psytXeNeAubM6DYUswhziPgu+Un9wPh8Mbd9fVPE/yoOO4hynu2C
	 mIhubHo5y4ZhaDIAwXvAVpAQuVnX50k3XIoNeckvIMMXCxVeEmkeurNR+6NFu7BSK4
	 tko/lNt05C46Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] arm64: dts: arduino-imola: add support for sound
Date: Sun,  8 Nov 2026 14:21:21 -0600
Message-ID: <179416929290.628393.4394985534153581062.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
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


On Wed, 30 Sep 2026 13:46:02 +0100, Srinivas Kandagatla wrote:
> This patchset adds support for audio on Arduino-Imola platform which is
> based on Agatti SoC. Some of Alexey's patches are reworked and sent
> here as per previous review comments, mainly on the dt-bindings part.
> 
> Base SoC-level dtsi bits are picked up from
> https://git.codelinaro.org/alexey.klimov/linux_next_tracking/-/commits/rb1_audio_wip_v3?ref_type=HEADS
> 
> [...]

Applied, thanks!

[4/4] arm64: defconfig: Enable pm4125 audio codec driver
      commit: 15c0b87688233d9b53aae20a37133b93e67dc1ed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
