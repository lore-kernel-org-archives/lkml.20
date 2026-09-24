Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9431AAE17;
	Thu, 24 Sep 2026 01:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211754; cv=none; b=KmxwoysRKjnOdVmFbnRx83mJKssimvBcbyMso5Dc7nyKXBaiL4FSniiJIKBdh/5dFGGgEInGwei2j46qWDyiYmGROk7RhQfwlq8xetpTJewe9amMJdkbYpfsM72PIDsiHpdH/qcMuPinMpvkIYbV9YURosQumj0vRloNZqqqh6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211754; c=relaxed/simple;
	bh=Sxxm7IyJvW1Ge/KBEv3zbmm+4MEggAN5WYLamAwXYzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNB7Y0I72HqG54Pa8YJcm1edTsz7tszvmcDy4IULCBcMsh3XVCSxqbyK05HtNWHcH44e9gH5JeOumWKREG8xQwyJV+bfwrOfnxnsPMuS0iBKK/UHgV3GYHGSOd3NynygpAx1U+G6ipZJCUEP35bSrBwIph6kRcomZ19DZApRsY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayo0nd93; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayo0nd93"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386991F000FF;
	Thu, 24 Sep 2026 01:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790211753;
	bh=Ohn3s2+B4+aU4JI/OTO2IArcrwKGjEgN8EsvuF2QzoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ayo0nd93KgMfqu2D/gruDx1IIn7iLiGXQLLaGW3wLoSFXckgIFWVu5tvKIfmo0yXf
	 nGnTe95kTbgZnlhROYH5039wdlnqOD5PzFHtch8CqvZroHDkzpIaxxAzObLjUghJby
	 J/aWrvbjF6kSCib8hMin/BRkSJ/INbljdQKV4OtDNkjaMrR3ZOj0baFjGrxL67Hv0I
	 Q7ovzFjY4oEueHXebIJ4/IFWGGHp0B83OSjOoktoo3iv1l7U0YVLGLSm/Bcu6vi3s2
	 NTrDSVof0ZpJpVjwQAN4+R9FrjQKhB5Qq2RBrxS8RJ9usvLaN3faUHjDs4iFA5Eh1+
	 dBYOQulzV9BtA==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add Qualcomm SM8975 (Hawi) socinfo
Date: Wed, 23 Sep 2026 20:02:29 -0500
Message-ID: <179021133104.298587.11449419665235494253.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


On Wed, 23 Sep 2026 02:37:31 +0530, Mukesh Ojha wrote:
> Add socinfo for recently announced Snapdragon SoC SM8975[1] which
> represents the Hawi platform.
> 
> https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-extreme-gen-6-mobile-platform

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8975 
      commit: 1827e076cf0e1ad0e9f20a35ed53b8d4d0039a34
[2/2] soc: qcom: socinfo: Add SM8975 SoC ID
      commit: f255e2055701285d6b5f11d2a6facc6614c51ed7

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
