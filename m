Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169476;
	b=VUQcExvUb569rC4nvdzTAty4DOIhXdC7bNkKpwk1Mjdm0gAUpJY9lV3BGtlXySoXl/me
	 5koxxuJVRY3TJGYpIAY7w+FwxyG54Z5rBuNH/27GCQJ6zJbuAIzCS57mJJYa9bhHKXEZw
	 XKMXEeUYIaFqMYRSoD5WEqcOvXtceFccoLT7nESpJDdo0lPOodjcFjVcMZGOoIaP586YY
	 +T0v4gJU9hseYh4sPdadrwmB/QmJUeNuCVh6Y151JR8tqPRGWxdWwHmwizb2rs9yiaTa4
	 +LnaLaIObMUj17S6bUhInpLyOYI9Oupxow/amVL6mUm9hR/A5h+08UUNbFWrN02r6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169476;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7ggyIcwYOM80LKMycSmwhM+8vTZbUAlXjcnBi2PVQ/c=;
	b=JMIBZtUnkNR2LTdGx6iFZapq0NywQt9unpPluY2A7x0UffI/MLxroUmDXP1QKVndwmwx
	 k4/Y4sL2a5iosH9sQ2YjwOrRHk2hx4R5ydYQN2CtEMcAKNi03+Pu2ALiMLMavVl72dcPe
	 lPo146vknn7qacUh+P2rvW8hEt6EqJqwQ+4DpTNDLp3GijnVvbSV2/Rr88ECk3jyTh2n+
	 syZnvpu6fpszTzvJjPHbQ377bXeFy+fuAt4l1M1ffPI0DqFMuF70XOlzHMfw+WQ0bgGbU
	 i554uLXn/epMExeUw3lmBW60v8fF2779BANM+peCeyapJq1SyDmbp2uj1w2Ei/oVw4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6iU+ZOK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ABD607CECC;
	Sun,  8 Nov 2026 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6iU+ZOK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25451F008BC;
	Sun,  8 Nov 2026 20:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169475;
	bh=7ggyIcwYOM80LKMycSmwhM+8vTZbUAlXjcnBi2PVQ/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g6iU+ZOK1wknp7xZDrf6hGTPCHcs2M4SnZr443rrFu+1LzdL2SQt7EbGXe7DwIbnk
	 o8qomeBS6PNHZLWewHFY/3FCGfVTjFbg5zYHi5kaH2rjokMlwFrHPTrIqCh+kMYSXh
	 scXqbKM9JwVLlAO3PcPMEsNA2CvBoAz1zTOjPQJBIYrPIJcfDZ8PKwrO7ySJxM9HcP
	 VMpsEqTJ9of5EIWUAh/n2DbysGeROOZua2/MWL8lvk73Q+hFcntNJzJb9c0hp7u1vH
	 GLQMIFfpU/HlCHvgl+AI7zunhJhyMTe6Pp0x4c5m14XD6r5XVgcIIeCFT6X2MKcEV0
	 P62PjPg9n65OQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: Drop undocumented 'qcom,ipq6018-wcss-pil'
Date: Sun,  8 Nov 2026 14:21:07 -0600
Message-ID: <179416929556.628393.15466602761506698116.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103225845.984564-1-robh@kernel.org>
References: <20261103225845.984564-1-robh@kernel.org>
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


On Tue, 03 Nov 2026 16:58:44 -0600, Rob Herring (Arm) wrote:
> The 'qcom,ipq6018-wcss-pil' is not documented nor used by any driver in
> the kernel, so remove it.

Applied, thanks!

[1/1] arm64: dts: qcom: ipq6018: Drop undocumented 'qcom,ipq6018-wcss-pil'
      commit: 67b58fac77db8d2653e53266f62964cba96397fb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
