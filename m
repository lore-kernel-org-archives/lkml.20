Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169369;
	b=kLZUrcf/dmYk79rtLzeiE2LDA9hz5fxMDjZSI7LrzChDSvhgcioKODboglqyxlXK9S3B
	 /hTu6jvmFRUI9ALlBCjhohP/YPR7+zH56GaL2lghO1ixGQpZypIkF0hOGTxRmBzz27cFn
	 NCIvOteht0kSkgsPK7IOJW6GG9yj4gtFTirPOiEubcPkpiedzlr1Ofub+tbeAYjQ/JT3y
	 lT3exFc4CVUyLDZHXlT83IPLQSYt+s4bjwhV1c9P8x0gD7BjwI85A461+Dw1LWxW5cur2
	 DLOioR4pfwn/weJgv54WH5KO6XPNm5ZDIRbWSXUux/wC4JmD5IaznJwWciMbP5m8G+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169369;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=100YKRuRKsiW1NaEv+XOz4kg/+neIFnM/cCJIWfyymA=;
	b=Tdji0IhmxxvMCFPkH++cwO4F/yQCcB7yKuoyFghGNsRnUKSg/O+4VhLzpvtjXFm+/0FE
	 EFsPBGmGm6Mu6UcJYMBWsTn1PDA160urYjjgpnNh0EuVTsPLwIgud3je0q89qKS4LzSFq
	 rjfgVw3ENerW+cFNyyUFPzUVGUoN5jFTUg3iGfVqDk4x3p3DWmAGYv4DnkpF1mVXRukVt
	 KajbWl3DP+s2ohORejGMxgxjHN3iN578LgTZ9yUAICJXpSb5Zj7f1wZDq8MBsH3YGkHJ+
	 7UgEJHcsuTrPUhnXc0a89yDiTaCh+PY+sG2zUKmAh/+Ysg0DlkMtcpCg/TLN5Zf9VKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bbsi5Dcf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E06082BD9;
	Sun,  8 Nov 2026 20:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bbsi5Dcf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776021F008A2;
	Sun,  8 Nov 2026 20:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169369;
	bh=100YKRuRKsiW1NaEv+XOz4kg/+neIFnM/cCJIWfyymA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bbsi5DcfbLPN4rWOem9xOAc+Ao0N/PzM99OdQgszZl/X6PdGjx4jkux1bpDjsZKsK
	 Ela7ifTNISM79PUUewsZx0Y8h6KhsF+lSqeqLSlF/5esHwU2WVnN9ZnV+8C6HZKicd
	 D95lkNhurZqqz3jXm6r0rZ9F8FbrkGCL3SzAijrtmlRPiNYJKniRq3xBrzAV5nRceo
	 IW8Fn4HcByfJa1MPwsfcIy6ECF+MAxv6j20351VByfZB/SprwBwF4fjQUllOkK636c
	 INRAvfJJ0Ww6NkOsl7OHBz4FduLQg0tO1s4olHJZpnYT8rA2eElPOr6B1JJTVIMbyA
	 e1L3qLeZZXrDA==
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/8] Flatten USB Controller Nodes on IPQ SoCs
Date: Sun,  8 Nov 2026 14:19:47 -0600
Message-ID: <179416929299.628393.16311614850618605688.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
References: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
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


On Thu, 01 Oct 2026 11:53:43 +0400, George Moussalem wrote:
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach.
> 
> In addition, set the right UTMI clock rate and override any clock
> rate inherited from the bootloader.
> 
> I've split these patches from a larger patch set to add USB3 support on
> IPQ5018 and IPQ5332 SoCs where these patches are required to ensure new
> functionality is added to the new flattened driver and binding model.
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: ipq5018: Flatten usb controller node
      commit: 3df51eeb0f7269979f41ec29bfa5d7bf732ac549
[2/8] arm64: dts: qcom: ipq5332: Flatten usb controller node
      commit: 6f4b3755dc13c710ddc9379443b8367178c5fd1b
[3/8] arm64: dts: qcom: ipq5424: Flatten usb controller nodes
      (no commit info)
[4/8] arm64: dts: qcom: ipq6018: move DR mode to board DTS
      commit: a94fc01b1c39772198b238bca35d5024fd928bf3
[5/8] arm64: dts: qcom: ipq6018: Flatten usb controller nodes
      commit: 6579a36743c1e7af96bce61f9c8b23d375214dfa
[6/8] arm64: dts: qcom: ipq8074: move DR mode to board DTS
      commit: 5a0787dd1acd2783cb81a846208aedbcade2d9c0
[7/8] arm64: dts: qcom: ipq8074: Flatten usb controller nodes
      commit: 512f352f2c70434d918654a42103d672936211cc
[8/8] arm64: dts: qcom: ipq9574: Flatten usb controller node
      commit: 6ce86653cb091106545e6eb52087466193173afa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
