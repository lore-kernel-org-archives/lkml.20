Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879958;
	b=4fCGxZIcTUhuQprxBBMO68MhMAPYxfMjXbtEN2nkXbAKx3JRlINUJ+Qt6xdWQH/897Vb
	 dyX65POWdQ0R5xQ4yjYkl7t/MeR2zDsP4EQdBtWsf6HusxF6G1Z5NcIYnexGGBx6Gycw2
	 BgvyeU1Te2YRFBLRj5LjkpfinncspXAngK3bMSM8mz4rr4ERwR3tIeQ/UGNsgsWcmpRZS
	 5t6NQruld7NVrPkIqOwNdY3dJxAmqZP9I4/lbOB3WIH++V6Dl1KPj6JMKJh40gHcgD7aZ
	 sl7sRfKn/AvYMreh5Cnrv+oWiOyhzl5FvNQ0D8uLfkrp+ylfOtTlNw8ImZzs2QP7H3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879958;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jgmj84OGuWW+rS3vTnBmafWYIlnVidPPAMd6/tP2go8=;
	b=TsqGxg7lBG7S8odfFKq2QXW8Rh9WUDxSBAOV/LDMXHkF0+RjCZw+VjIRqnbzzx5AZezp
	 CVNCZsv6W3Y8IlVZQH+PtM46PcGHMMdfVrUQK8xCJ50zceTl9/URrdlY0kGFC5W+UQksO
	 91X+K65njq1tK9rbrRVBoEUaTRDwU7K7AXYAyO9mnqDu1roGfm4zf79Xzw04YrupkuqMA
	 arGitUWM4Bt6k7VJIQ8k/HChHdPeBSkNdWr/Q8nK1NVhi7JUn5FT7SNoT9k+iMSBUUor9
	 a1etXN1IfecTmLusdWPsRZRsq+HcVmjFoTPt0dvghnkUs/HEJFix8X2xqoayoKLlFMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEKv0zUi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC68606A31C;
	Tue, 17 Nov 2026 01:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEKv0zUi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D431F000C4;
	Tue, 17 Nov 2026 01:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879957;
	bh=Jgmj84OGuWW+rS3vTnBmafWYIlnVidPPAMd6/tP2go8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cEKv0zUiEz62OgStT73XUpIgvqZyK2C8xXYM8lC1p2MFTTanLqUcoKK3QAil//SOX
	 AVGzWzKptAI8V13napmpoNY4Ja/3J9IAVNdooYuV1zyng6t/dg36LPWFTUTQJP7Zk1
	 kGQIvXKtJu3mKJMF3u1n6fkPEGEuXnWzYyzfWPtLGCO+MclJcTNUTMOna/2A05u9ba
	 qFr02jkWm3Y4Qql6uzKYfT+nVZ0HzujIKNwH/GZBvThI6SE3FvHycypQjLgxxZPr6v
	 3hOyeQ39tNMqld8VlHGJttVOp9NsC+JjpUpEVHTdlhVBz7gFSQ4LAoI3VaBYRG5zXY
	 ZTE3xKqtot6Bw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Date: Mon, 16 Nov 2026 19:45:51 -0600
Message-ID: <179487994758.441666.3385681371701994530.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
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


On Sun, 15 Nov 2026 21:48:58 -0600, Bjorn Andersson wrote:
> Introduce the ASUS Ascent QN10 compact desktop computer.

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add ASUS Ascent QN10
      commit: cf0982c35b320bec37afa5aa799563026b325a1b
[2/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
      commit: dde0308a2f8867806a444df1fdd7e685b1c56d5b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
