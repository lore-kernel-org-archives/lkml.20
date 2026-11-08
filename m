Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169512;
	b=pVtG7Q4A6HcPCG274gzABMFkwCheZLJwKB6c6DYxbdC6kZGPNeCCb8UCpisrYYEvGuUb
	 Dfy525zny6faaFUnFRWDuGk/gIG/S24qSogsX/Xxa2zxox/ezhzdq60Pi76mnBOHPRfUf
	 xS4Vj/M6pB5nMuqw0fOabpoxRbJrIZnDC6IWTjL9+1oqFOoIUuo+aYGO7lPQ1U8HPew5I
	 W5+lp1AxUp7xgsz4otNE+55IBWTvIZ044sx8Ty0IfQDRAt98/yJtTK14e/QijHIgX1sAX
	 MqvA5zb98qYUiMIH0xWGXcI7D1mJggcOnMFm1OV1Ht8GrrVGoXnsPS3bEN/Nx8DiNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169512;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SDQiLCTT3g5Y92kBH6Uqyn2b/zQe7VB3UqMvkpPlxg4=;
	b=inoQ60kdj3CTDjMjy6+ZUbb0M9vAOnj39WTU29kGqwVQWbStvyCtLah+tMOp5qNyiUmz
	 ea1QvwytUxzdcLdZPVVG6Qu2jsAMIsV112MmSW1Pjtri3zBifXNhUvvToyAI4Zrq2Kvoc
	 /jCVwExdH5WjrR2AorGRouk+mVtmMks5uMqojKwO6Km6eqnq2JBA7hp0uBblA24FFz8Jt
	 HcqHVHZvcGMFh7e8J16loXJl7G9oIlgl/IrTOKmDaD/bYHUktyCCzQhUlWuDYWFxNaKqI
	 hOanodGrwE6qwRwIxJlU7CC9YJiHvut+Gv4ZgeRNDgkfz/8xvKikz+KSVQ46ypEWjww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZVToQGw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB95606A9CD;
	Sun,  8 Nov 2026 20:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZVToQGw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A661F00904;
	Sun,  8 Nov 2026 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169512;
	bh=SDQiLCTT3g5Y92kBH6Uqyn2b/zQe7VB3UqMvkpPlxg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CZVToQGweSPI70AYFFbE6B3wNRl9ZZkLYvzk3h/Qu051uBRoLENbrYS5g3ayyowd6
	 ckuenlbfJIYIJ96dx2FIqflHo0l95lBcFtJS7dhPiocm+n193LFauCDo/RFxIgq0X1
	 QKRcuL1LCI4LPHWSX/TFpMn71u6Ke+kay2uSZfp/GC5qPakfeDzpzh4jlzjO4pFx2i
	 6LMNOWthBnkPu2RjwaoAQvtAX4tl4IpReY3fESNGRLJ8JMyG/m1gV2BJcgwP9tm3TI
	 2xmrbEiURslnndWWYhadNpLycSQ4PkN/ru9F8CV2KUCKwT825f9ZBxBBtXqRVFzKFc
	 GdfxAFBYuNhhw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Waqar Hameed <waqar.hameed@axis.com>
Cc: kernel@axis.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 00/38] arm: dts: qcom: Format with dtfmt
Date: Sun,  8 Nov 2026 14:21:33 -0600
Message-ID: <179416929311.628393.1697330164266094710.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
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


On Fri, 02 Oct 2026 00:36:30 +0200, Waqar Hameed wrote:
> I was looking through the notes for the last Devicetree microconference
> at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
> working on might be of interest here: dtfmt - a Devicetree Source
> formatter [2].
> 
> dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
> from the actual Device Tree Compiler's (dtc) lexer/parser, also
> (hand)written by me [3]. It is primarily designed for the Linux kernel
> and currently parses all 6872 devicetree files in the tree successfully
> (found with `find . -iregex ".+\.dts[io]?$"`).
> 
> [...]

Applied, thanks!

[01/38] arm: dts: qcom: pm8226: Add newline between subnodes
        commit: 5891ac4aac66f8867f2badb0f667e97fa93a8998
[02/38] arm: dts: qcom: pm8841: Remove superfluous empty lines
        commit: 47b258bacac524458c3b19eb09e9122604158229
[03/38] arm: dts: qcom: pm8921: Remove superfluous empty lines
        commit: 907ca1b0e46e1431d2e7c8803b338000b3d49552
[04/38] arm: dts: qcom: pm8941: Remove superfluous empty lines
        commit: 73fab0c1a361e131c873bcbe099e304eb63d6851
[05/38] arm: dts: qcom: pm8084: Remove superfluous empty line
        commit: 45142714cbbc11b988360cda7915df415569d18f
[06/38] arm: dts: qcom: apq8026: Add newline between subnodes
        commit: 9df53dd8f25f50e1df85a272893fb6fa46da3e9f
[07/38] arm: dts: qcom: apq8026: Add space between OR-operator
        commit: ff2ecb673fe8b8798c4487803677b132d564ffb8
[08/38] arm: dts: qcom: apq8060: Add newline between subnodes
        commit: 09781c9bdd1420809e3afd1dc6280141bb415ca0
[09/38] arm: dts: qcom: apq8060: Align multiple property data
        commit: 62cc70db73f86a8fbac51f547efd57ca5d9f583d
[11/38] arm: dts: qcom: apq8064: Add newline between subnodes
        commit: 91befd2233976da5e93c352c412ac016e1d4b524
[12/38] arm: dts: qcom: apq8064: Remove empty line at end of node
        commit: 32f2a3ae88836da3599497fa48ce00d8386e90ee
[13/38] arm: dts: qcom: apq8064: Add space before line comments
        commit: 668d5c4f17ba7ac71dec8171a3089cf86bac6013
[15/38] arm: dts: qcom: apq8064: Remove tab after property name
        commit: c80842bc5645048d3420a70212d266b1180d97a0
[16/38] arm: dts: qcom: ipq4018: Indent closing brace properly
        commit: 2e5995f56125656a764b10dbf6a851bc4aa78e80
[17/38] arm: dts: qcom: ipq4019: Add newline between subnodes
        commit: 0bb2cc21182d4ec9b2f735969eab5b7e6e166547
[18/38] arm: dts: qcom: ipq4019: Align multiple property data
        commit: 7ee7adcd177ef173ac5173d9f2abd4a11fcb6ee8
[20/38] arm: dts: qcom: ipq8064: Add newline between subnodes
        commit: 1af8b1d15661d9fab079707b3033d5972581b370
[21/38] arm: dts: qcom: ipq8064: Align multiple property data
        commit: 60e3b3a311d7d279d854d45544361840eda8d4e8
[23/38] arm: dts: qcom: msm8226: Add space between OR-operator
        commit: 599f0af30d988442a91b1ae06d85c416370d131d
[24/38] arm: dts: qcom: msm8226: Add newline between subnodes
        commit: 067a79e474d668879973e8ade04c15930c065a3f
[27/38] arm: dts: qcom: msm8660: Remove empty line at end of node
        commit: d4d1902dd9fc44ee750aa8e26f747a6a415a0d94
[28/38] arm: dts: qcom: msm8660: Remove space inside array property
        commit: 1981640ac8f8dd8d142e649a6b6067ae1966a689
[29/38] arm: dts: qcom: msm8660: Align closing array bracket
        commit: b8523cf55936a779055a8e407982d577ecef0dcc
[30/38] arm: dts: qcom: msm8916: Add newline between subnodes
        commit: a9cf6dc7dda2ef9bd6b35a9a3a0cf68ebd4014cc
[31/38] arm: dts: qcom: msm8960: Properly indent subnodes
        commit: 8c70a6486f560ae5d50914f89ba34e066ac85ff0
[32/38] arm: dts: qcom: msm8660: Align closing array bracket
        commit: b8523cf55936a779055a8e407982d577ecef0dcc
[33/38] arm: dts: qcom: msm8974: Align multiple property data
        commit: bcf022999f71e337dd2bfa6e3ce860c3267d0c36
[34/38] arm: dts: qcom: msm8974: Align closing brace properly
        commit: 9e5e19b9591f6ca93e20256603b14aa90573d520
[35/38] arm: dts: qcom: msm8974: Add newline between subnodes
        commit: d53daef23defdb7a926fde228764209f9d71e317
[36/38] arm: dts: qcom: sdx55: Properly indent subnode
        commit: 88b3da2433d0c661dc7548b3a148afb4bf8dbeb8
[37/38] arm: dts: qcom: sdx65: Remove empty line at end of node
        commit: 83a91ecbb1fa193f1cee7339a477f8dbd5ac0b62
[38/38] arm: dts: qcom: sdx65: Align multiple property data
        commit: ae2005cea2e4f84692268e54199bb03f5c6f4558

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
