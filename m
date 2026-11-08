Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169488;
	b=wqRxkcgFCeH6j9918UrXM93Nke4l2DDuhYG+Onmwb1BXE1OmKrM2bdexaCND/Vp+awED
	 Qd5U8ypUMImV2XElO3/kSzKQpWD0XkLVixn32C5xfdTMDyqxINj8703pkBuaAJ7GhbyN1
	 gWF+JuqdYJGsVQCS5kN6ym96KSVGkJBgYaqOahMcqvsHGRSG5166CJ7Iub28QXwao1749
	 i7MwujuvaqkxgMGm4fhnAeMoOQPcIs0E6EaFbC+397th+xn4D2fpvGTlqZa0bLaL7NQY9
	 H0mKVmPz1SplyUOqRID4IVePwv6E4vuHvBbLvmMmFw8nvThxaHHts+MP8p/QNHp/qnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169488;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pO1W7c1SbD1BkmlKzh/q+I6rey0+/Fg38A1vWIqg6hc=;
	b=suK1Mfovr/ReDkY1Nz6OqFwaHyIYb7TTXJ8A4YqfYkKFpS+7gksZWmk30nfUc3/JDJi2
	 QidcuVVNH09Ojij5CY17okLFYIHzhHSgBFFhuYLcgOPYRRcYAeyJkQTzA9tt+jFOQF2rU
	 Jndx6dSFGmyrDc1XGZ7WTEl1CoE25TGh6+fCEpLvDOcg/qZ9aVUbZg3zUZu++pXdLORqj
	 dYDU4xcBeCPMLwZKChLx6DUPCWijgGpPy4eqLjop6Y9e2mxGN+ghKiccguCvU/+zqMOxS
	 6O97AfP7Me/uf83tnLZ84B6wKErG63EcnQepZU0uPodNRzwhGSNqD83UOXPDQbVxTPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VuwqGCir;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22679607F901;
	Sun,  8 Nov 2026 20:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VuwqGCir
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284721F008A4;
	Sun,  8 Nov 2026 20:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169488;
	bh=pO1W7c1SbD1BkmlKzh/q+I6rey0+/Fg38A1vWIqg6hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VuwqGCirVu4fKJ3fg6cf5J847o9vs/JOh2JFo0eTthlE56ZX/kCYAiFQGJr10WwlE
	 DxDTOPQEVdrUS18uMP96d8s+HANK476IJ7USJe5ZpjZvvIkEwRaDkH5WUU/EzbKQFi
	 EME85sQuusSAVxx4zCK9A/nlzPT9Lm0JbyNK1NGGSHRj8pnw7N4fa5Wfidr30TbY/8
	 rm7UoDArlQ8Zuhk4nPRQvyOA7Mh7XomWPdE9LAeWUW1eFFTrngRmSpdGgannICWMWq
	 NftpVA5nXsl9XP1189NtZHbHnc3CbphsQhdndsG/Raoy+imOuy8eZdGosvgTCUmRXm
	 La9dCNJ/2saqw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Shujath Mohd <shujath@outlook.in>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-sony-tama: Add battery properties
Date: Sun,  8 Nov 2026 14:21:16 -0600
Message-ID: <179416929235.628393.6398163987269781142.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB51414E1C0843688784B069C4C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
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


On Thu, 10 Sep 2026 10:06:48 +0530, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> Use the TMM fuel-gauge profile values from the downstream kernel
> (`somc,initial-capacity-uah` and `qcom,max-voltage-uv` on the 4250 mV
> bins). Akari also shipped a BYD cell (3056000 uAh); a single
> simple-battery node cannot express both, so prefer TMM as on the other
> TAMA devices.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-sony-tama: Add battery properties
      commit: 30c200691b175037067e599ed0d1f31418f4edb3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
