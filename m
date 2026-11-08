Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169464;
	b=pRU68Ev1wCdEnmI3WkvkCT78keP7UphIOELivLbDKN7pRZalwbXpsTrutCkJwaV5Qj/D
	 AFX6mkN8Lzwi+gjyeXWH+/BDp1mzDLzDsVbUZxY4a8is8+GTEWWXQb+cw3MVhYz2QGoPI
	 10cvHSm+8HQ/xUenBVpCIYVrLbQHMbJYVww7Tm5IUj5O2klkrzp99alfHJN01t5pzy8ci
	 1DsElLxPAuWrO03xZERnrGNC+sUsf+cLyLSL9Q2be9GXaF7KFRm70B+FGwBLBL9NBbnn/
	 iXL3CevlPALwmUFhFEGa7Rb4eDxyPyZizmJGN1lQMOvNBBX5pG4Ci+xotxcxymX8uPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169464;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5mw73LN/A4v3KZJkjyKOCzcglb2HZR1xIa+njPbc2FE=;
	b=Ob64NmHiTa2uAP+711+sst5kP7ZWcqMArZZmtuvUPe2P7uR0fHim9lJQBti3nxgwTLNU
	 +X5IsYujcMmawk7oFPw1XamU4s6JYC6pnEzwe7bGS+LcKv/Ekvx5L/dT5XtBAgNtYW2fh
	 FqgdEF28EUjMj1UKTIYuV8/aNTpdGf+u2uAGh4+jRTY0eBrllSy1Riz8JXEY2YTyTeVdq
	 7QdrgtLDWmVhDXYojYbSSOO/SSv9ZR3SpkQQKLR98KrP6/IqETMOh2RcNal+k4rX0vNZG
	 H2ANV/UZVJgETwIKL483l6DgW2z8ioIzSq34QpcQSmiPyCLwtjNTHgX4HuJVb/eSxew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOw8TnSE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320B6076C34;
	Sun,  8 Nov 2026 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOw8TnSE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3712E1F008A1;
	Sun,  8 Nov 2026 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169464;
	bh=5mw73LN/A4v3KZJkjyKOCzcglb2HZR1xIa+njPbc2FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SOw8TnSE7gMjpA/OOeoynrrYJ/WTlzKS34O1Zi22hMieXyBfHTnvI77kj43KoQWln
	 71E11+PjjdXhTTNCbDVxLejPz2Q/m0ZimzCBUWSz+dP1YfDSUE3W4vBCyBRzjboQ/k
	 P0jiMWdGdJ4y/G4zHpN0CgkjIrzaY5fShElnXUsjXOG8UMPlypvq+GUGdV0DQu1pdk
	 HkG+CKDAbSv3oyWWRSU8DC86p4INUQsKLt9SMFlxIxMzbSceHNIw3EBM744XcTRUF8
	 MBnArBLCGsH4mEqtoJl0suS0UgiIMijcH7tVRKBGNAc3yTdrJmCU4uGdjH2Mh4ct7W
	 pYfnAfEMwOtqg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to play audio via DisplayPort
Date: Sun,  8 Nov 2026 14:20:58 -0600
Message-ID: <179416929463.628393.16769183462772113988.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
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


On Thu, 22 Oct 2026 11:36:20 +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the DisplayPort altmode
> outputs for the SM8450/SM8550/SM8650 HDK & QRD boards.

Applied, thanks!

[1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
      commit: a583bb91f527bcc727941f1d4c18d719998da61d
[2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
      commit: 654a6fa2a9a0e10a7bfb9ad4c516b8098f00e0ca
[3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
      commit: c658034a92f87057d9a43c87507935ca10851ed8
[4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
      commit: 679981b6aeb777384b69258e4ec960600407e350
[5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support
      commit: 9622685d68d671f01f04021e32e8b25fa505ad50

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
