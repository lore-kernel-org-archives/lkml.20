Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BE43E1D02;
	Fri, 11 Sep 2026 02:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093555; cv=none; b=RZVMUUNRoNFOneG4hQiQbE1f/1m+rjHgRZhXO+bLyrvRAfoqo+JCIKEPuwk5vmBUOLX3wNa48x6G9o6C3M8riJaOIX3OPF/V4rBIEms8r9ZkL7PMqpsVc9CDM3Zd1HJPbGKN/2fPJdXZGQh4njPRDHMceE8csDax03f0OQx3qxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093555; c=relaxed/simple;
	bh=58bAbOzioyh/v3b3Zj6yiRktm9g5b6UOu43RPXLmgLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PC8xl+BLF/swewdsFq0Z4ZkV9I3MVG0NSrN1o+9MIxuFso3UlBT340IzOA/dqHlX1JL8UJPNBqkgZKP2HqjDBvNbnlN1EZiRasDlf1dR7Svr5wATY/hBwDYdoW2W7LsNTVaG8l445sFU1ZNXjJ6rEcIvBckeq1ukjZV1qBEfZL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=On+xQ6PY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="On+xQ6PY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7AD1F00893;
	Fri, 11 Sep 2026 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093553;
	bh=VIff25diZraUQFn2eqZ3w2RSBfQ12i+j/wjreH2txnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=On+xQ6PY7CGJ5Hz/eXLWSAfzi96FGqzDPgENa0NYNifz5MuldD512vBFHoG/ZtFYd
	 djC65EF1tjuWQxpeDeMgJJ1NkvNCvpbjWee58whYSmTYpPvxWEAnquxT0YlhksftGl
	 HASdZanzq8xuvBk1IDsfwM25F9ZMl47Y2MQZDJsI25ncoc9u4D/8jNOlQQPbL2s02m
	 e2yjMcMgx0uQ+PifFIA4LPfRF91sCRr2abKHrLAPJ5TReHuEmNxtEUUR9/R0qNozW4
	 E3A5msUN2fJrU9y83kBK3RvTlYS2PYpSBiRld0F+GAOUjNaoar2kiNIgFoTq/ZExSO
	 v6plvhhxj8DgA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Date: Thu, 10 Sep 2026 21:25:31 -0500
Message-ID: <178909353849.920241.3436941850671686094.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com>
References: <20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Sep 2026 11:13:35 +0300, Abel Vesa wrote:
> Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
> shader firmware path.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
      commit: f0d9238839b3c2ebe3f8c821a2b60e8e3ce2ae6d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
