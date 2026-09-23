Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BFD419FB2;
	Wed, 23 Sep 2026 22:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202006; cv=none; b=HVtsCexW12UazZ8B/3gTLHq1oD2soHxjMWOR0W/fVgf68OvlloxYdffMSgxztgTbY7IdhLYGqFJRPhVzRnZHwweqRipa9CJg1HEEl5BCe27krkJQUdvxgP8kh6EHBISGZSk+cyfTCuI7X0pveE5YeK/KJJWxRe5+SUPc01/Tnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202006; c=relaxed/simple;
	bh=DOYliRI4Bm+Krr9IWqs3gkmLe0Z3X2dQSNQsrQ7jWIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lq5wmLOF4ZUErL4SD7KBysRE9tgUTAq6TKX4zkNGGRnrp0KDGb2/6i4RyiOtSYwfaEkB9PLDHj8FS/rm4WSowJSYh3SDrdPkOfcv9EwUTMn52KJIaer5yo6skqruS/+52o8uo2s+v1fDwf5XMjmluBJFls9QCzAJgOP7+nnDPXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBo//1df; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBo//1df"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16841F000FF;
	Wed, 23 Sep 2026 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790202005;
	bh=XqCpkzNetQz5PuLAIl8cTYQN7N3WGD5tuRvZen5KYA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PBo//1dfZS6ouFDOPRZbnN//aYWw0vTqbRNV6BLdZHkbDHZ4MrzBNFvN03IL3GGtC
	 T7cUPIOFK4aOhOlwaoSWEX9DFCK3nokYYyRQAWEtdvrVmJnCGZ3V9uXYOeEN5bSxba
	 OL/yp4botzCxwzWx97Wf7PioeGy3j2JQWhg1qV+kwJL3f5x0Im9eHTYOnXC/7VMN4C
	 +H3nraHKbRcaUNakmqIwlALmTw2ZY/bJkWXn0b+1rjLPJgHUjOKsoDIpcdcCuAL5BB
	 QrVCIg9tscYRvef3KV7Y2iAkK5NAelmdaIpfNBFflssyUbjD3kExDEFzPPtlWORK7t
	 TAU5G+w/Hg4fA==
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: Add EC support for Purwa IOT EVK
Date: Wed, 23 Sep 2026 17:19:56 -0500
Message-ID: <179020199814.520949.2112926853306939366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jun 2026 16:10:16 +0530, Anvesh Jain P wrote:
> Add the embedded controller node to the Purwa IOT EVK board and document
> its compatible. The EC provides fan control, temperature sensors and EC
> state change notifications.
> 
> 

Applied, thanks!

[1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add Purwa IOT EVK
      commit: 9d1a720973d0f16e0f93b658f82c45033b61a02a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
