Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7923845A2B6;
	Sun, 20 Sep 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921100; cv=none; b=RpOZeTNuF5H/ks2nEQcA+2qtiAPHEoW1jpBr5C4k3LdyOMAgZgX8x+SLe4k9IfnBpxu2qhrgKKVt43iQJvCRTq25n92EKuUqaDvxPbD7AFinD97DF7fqZ8XVPhLX53UQNoheuUZ+EVGw8MlQvQxOkqUjBMOXvShCdqhsXjB6iWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921100; c=relaxed/simple;
	bh=yXHh3cnOSfQfGHKoWUfQW7aCbwrwx30KBMb+/dmnEL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELLjWgZPKCmwTrhKCzCvT+0ydqPiy181iaxFSrfMgENMsfRC5Ej3RIJ8jmddWmc13PhXGCPr8bJWa9E4sGUfV7K7INB6+ntPTBN2/tu11PqGPdOXH7sawb5AkAJqCG63VmzrymIG91ep43h7lK+gPloEHxFvH42ZfKmzSoGm+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKRtozKQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKRtozKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97131F00893;
	Sun, 20 Sep 2026 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789921099;
	bh=oWrs+Si1H3KWvlJdp1xU14ZaF8bdn2VV4K3QOlIal+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XKRtozKQebB6IErECcs3uio+5I6uooGZpkc43rFH9VYXgK+VQ3p519ytzAlGYG2WH
	 I7P7ZdYrZKWO9VLfYBaaKH6SebVhodH51PCPHsX+y89PYH6y0I48nZj/WM0SKDdyKQ
	 mIKfTm6682OuV9ICi97N0QsHLJy3UGf0oNzu4rHZchxqvsfor0vgeJnPJqv6EzuLxK
	 SbO9ZCrx6CQ7yTCNp7Tq+ilCTlCrLGyzIWrG2DHSuIwRFXjzJHBaeqfwumYRaD2Jr+
	 s8ElO7y/YDrSKDbMvroLqdV/Jj3/fg2t02xuKazLljjQ3rcVuYkcGYhZWOGcbPhrmU
	 KywlnB7gHCADw==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Yadu M G <yadu.mg@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 0/6] Add initial device trees for Nord platform
Date: Sun, 20 Sep 2026 11:18:08 -0500
Message-ID: <178992108602.214160.18132180044428418795.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 11:14:05 +0800, Shawn Guo wrote:
> This series adds initial device tree support for Qualcomm's Nord SoC
> and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
> for Robotics.
> 
> Nord includes two variants, GearVM and Embedded. The GearVM variant has
> platform resources (clocks, regulators, powerdomains, etc.) controlled
> by SCMI server running on a VM. And the Embedded variant has the resources
> directly controlled by the operating system.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: Add device tree for Nord SoC series
      commit: 5e97460df08d194acb20861d1c58d7f55f8bb9bf
[2/6] arm64: dts: qcom: Add device tree for Nord GearVM variant
      commit: 6d3394d0451ed046e16dab61302600727eba48ec
[3/6] arm64: dts: qcom: Add device tree for Nord Embedded variant
      commit: 0ffb5db49f82fe730b3375d0f1ebfc5bcca4f3ac
[4/6] dt-bindings: arm: qcom: Document Nord reference boards
      commit: 05f9fe5e499561cb2c91cdf97e2019796d5b0ff2
[5/6] arm64: dts: qcom: Add device tree for Nord Ride board
      commit: 9ea6f82ac0e7404a9a6e20ac49daefef364679e8
[6/6] arm64: dts: qcom: Add device tree for Nord RRD board
      commit: 32afff1e816e10185bb571aa9d89dc2eb061d548

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
