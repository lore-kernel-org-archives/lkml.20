Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169455;
	b=g90Lw2FZ+CljQrR5ieHZ0M/gjqOf05KveGu3cWm6z1wgXdxDY2gcxc2C456KndMGrWDU
	 mMWUbhku6IMxzhirxhKyXv4K2egAWRGu99d+aAIVjV4oyHIooJjNYQsJylHY7KsGvJKS5
	 Z/oy3TY++3ynitlvlXeZIHtDsh4P6cPBPV5bVMfIw2G1rnhfs8m2cyiZ8PJqYef3cAkw6
	 r5zI8MnHPEEwRCCbodXjW2HEXlQCsl4lWXEqK7ZP0IaFq/sta/7n7d2d2BhAhjX0NevdY
	 sK220qNpvBC2/Ny/rqzxG3Iz3aoPPnZmXlwoHNJHAz7WhrTMT0FfT5zWbAdwiVvouxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169455;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nGMLpiWvH9sKNGbpE6506yen0eFWFmvv9vK9HigzotQ=;
	b=H0Gy+uJtnfaUn4x0Ew/33rKqu8G1x/PgJ0HUNB8/wu2/41zJi3kByK3t8eIvSJnzD/F/
	 AeZOxr4gny/LghIq+OeZyZTChZTmXn7p5mqsYQuhcpFsn892Y6bgkh1XX0bbJSlRVcoQL
	 qVlYkJoF2sq3eRLWSM1Qjx57tH5LjIzcwJD/gfik7GQ4achmBhQKsULN7cHw+KQS55X0w
	 FOLVspfBFQNjp61ga7zJj8a+kA7tjdvToNLZV7+NLZ3WQoigaDQZhAcUPzBJSQ9yMscGx
	 6OUAMWNe0iwDVgz5+7Sj7j7Bc4WFTGfgahW3V8Y0eYFeiU94DIXtU4uMElpYw86/ubw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cmg+OBd4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC96078A85;
	Sun,  8 Nov 2026 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cmg+OBd4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7761F0089F;
	Sun,  8 Nov 2026 20:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169455;
	bh=nGMLpiWvH9sKNGbpE6506yen0eFWFmvv9vK9HigzotQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cmg+OBd4qnK7CsNmvyUIIqmU6aX15hA4RR3x5YDwr6YU7WcSkmDGQGWK7Ob1fkxp+
	 wM+80iErSERT1C/NYpK2+k2k1sGdd9nfUY4o0GJvk3dMXcmaReyPGtpvjQN2oUve8U
	 v+NcViM3JrigeERZZ7ANLw1NDS/WvbZ8cySkMCufdFoOIAJonNpwJ0Eg9hIjym6vte
	 XswG1sE/7Iai5D/T3iimY83if24wenET1a0lmk3m6ur4CFJzJ4Y8KTQPyeEuazAMwp
	 2Qa/CL1fUWnhBfpjLdNXyRLdoZESMIhVxufOzCRTpF6t2QPTO+qulF7F3xRplqzloP
	 Sly8Ol8QMG42g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
Date: Sun,  8 Nov 2026 14:20:51 -0600
Message-ID: <179416929219.628393.8049194985355344602.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805134436.2817251-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805134436.2817251-1-mukesh.ojha@oss.qualcomm.com>
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


On Wed, 05 Aug 2026 19:14:36 +0530, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
      commit: 95c893fe67a963a4f1085145c57da561d1f39f25

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
