Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169453;
	b=teLDdRu2GQ05rScmBqXyUbwzTbRKSVtaHa4pqVmTnNbqMfs5iguspjxbe1qhKzmIWDz5
	 myXOSTiHgnKRrHTGK+XBG1/qXptEb73XfyaTc4tSAIKdPgvlkrFJXRF10ra3/R5lPDWtU
	 HXWC1YQl3aIXJGGYu5J1pUo7WxUcQVKMjURXXxFBjKV56zolF6tg4RKvKhflptAxnkVU5
	 4dr66N2NOM0Wz5ZAI6AK3Qf5kEdP2mYYYg8uMzkD43Ji9ltT0AZy8inF/b3KPjd7tHJ6W
	 DXm5lWq3JT2BFv1/LeNukgheZ4xncboIlGOWcoZtCA56jLUHhHs3MQs1dj3gusdc6wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169453;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=H5NdynXi3McZhqJDXg8g3XbykgDJEPZ7u1rzM6f+Mc4=;
	b=VNQhmWRg3zusWE123b6bzvBqH4ibjCljknnEXL3B6F9ldDnXKBwPtEpuCBmtU037cPmp
	 W9SOP8Xan+6AnMU5vC/T2A0u8ayFVtAnFPmMpnfBbqDKs95Q7pH7nfusgGoL10trHtQBL
	 tvFco/DGblhfzgc1+0ZvIJ2NqEfgMgZYth8+WV1xlzH38lGXHrCKv3mp4HzJjKjRDiQH/
	 lo/nsVbiIFrH5ajxGdm5AQApbJoPfrcLyWMOqK3ibJxncB8ILBiu7QIugopndpD26I10X
	 R4cZkuAgCc6sz2teVINb9X49ZpR5luvJc9qEzF3IvEaneHr3+MpE+3RJlsD+vp8IkKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFGSVFA0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9146078039;
	Sun,  8 Nov 2026 20:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFGSVFA0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77D41F00904;
	Sun,  8 Nov 2026 20:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169453;
	bh=H5NdynXi3McZhqJDXg8g3XbykgDJEPZ7u1rzM6f+Mc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MFGSVFA0WdxsGtaejOUClh5m+MfIpLoetAynmgoAypAIlBSuYNNAoHcXRGlvcyPVd
	 roa/RmWnSvsrBsCT494b1Kc9we8Sdr59fxWqsG5r4735fy/W8szbmoqkh4SKTNm47C
	 yUsdnQpwoMP/M7xOJU/p/BcFjaoBNCe/iPy1595V1bs5Uen2tF4w58k9LUHeimXzlC
	 LtSTY2xiIW9Qon3l1ghbJONiiUWoSJyzGpmdQAWbhTkn0IUMljlgDVu36h4jTG7bUa
	 jd375b42zaoC6ymtBUXeDb06BcxjCqnrvcOwO810ATKTZR6Z2tTxOWp1oA7l0LYWX5
	 7LSsxk7J9RzoA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pradeep.pragallapati@oss.qualcomm.com,
	nitin.rawat@oss.qualcomm.com,
	mani@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card detect
Date: Sun,  8 Nov 2026 14:20:49 -0600
Message-ID: <179416929501.628393.16114732471311269419.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
References: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
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


On Wed, 28 Oct 2026 18:44:20 +0530, Monish Chunara wrote:
> The SD card detect signal is active low and requires a defined high
> level when no card is inserted. With the GPIO bias disabled, the
> card-detect input can be left floating and result in spurious
> interrupts.
> 
> Enable the internal pull-up on the SD card detect GPIO to keep the
> signal at a defined level when the card is absent and avoid spurious
> card-detect interrupts.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Add pull-up for SD card detect
      commit: 25c209e099120cb312b2c725fb7149d78ac3c581

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
