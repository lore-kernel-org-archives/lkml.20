Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3CF1DA23;
	Wed,  2 Sep 2026 21:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385520; cv=none; b=dVu5f3XOX5JLHTtaBCKarXl+V5ukTrRWLNWOlxs/o/2MDD8/e6XkPv4YxVHjfvUtK50f00IVzzwQIf9WoBbP/RGTOQyYnYnXbZMEq7m8dH4FhgiTSe5VON0b7inB6Fj2MnthoA1RY4eAhGrxiqpOF8Eb8VaqExeFCq3AeTdtv2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385520; c=relaxed/simple;
	bh=uf384duYr0vFDk43j83CXr4xTzEPtDNzufau+PW6jGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dT2bZ6bJlr869J4pOnionc8UFdsBF/3hH2dy+YN1nMv0b9ziZSjX+atVPyrLwL6dGO/W8L8NQOpjaPG1WIn05gA6p1Ck+2OIPGO/eQtUjn+eFUMT5UoyTH3RmQv81RCuvVEPZmmOQuhZTEn9noibbJRr6DOM3RHtP2WrwVUzGgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVn7MJuQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVn7MJuQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244671F00A3E;
	Wed,  2 Sep 2026 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788385507;
	bh=jgLSFLVt4kD4SBhaPh4iPCCiu/xbg67/7//8rFS8zXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KVn7MJuQ8BEy2uljoJlCpNWzInmlXT3p4roEbrdhwNAml3SOJRXr65dtD7JN72UkF
	 LX1R36CK65yRWc/9ScjZECORQlNCKOMRRcpeBRQQB+43A7My0F9xgri/30coRsAK6n
	 1KjCY3QM/Bij4sazKjMmb3+Dusixb9RNBeEcUIkSM9OOBDCmnbLcXTUJvpZNc/jLak
	 05StLWG7gscea5Pd/d2hJw1tFkK1u4qfKu2Gocy9ajzJPH6AC5bYGSq2URNFOj3Gn5
	 d6J6m35NwRcS1jppP0GKSHiVTv83g6s6hb49stPkiHeQQTqVRD/QYHN2UWXZNqfeq5
	 kFm1UWebY52Bw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xueyao An <xueyao.an@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: shikra: Unreserve GPIOs 14-17 blocking SPI5 access
Date: Wed,  2 Sep 2026 16:44:50 -0500
Message-ID: <178838546720.167607.14649009147731040770.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820085347.822-1-xueyao.an@oss.qualcomm.com>
References: <20260820085347.822-1-xueyao.an@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Aug 2026 16:53:47 +0800, Xueyao An wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Since there is no TZ use case for
> these pins on Linux, they can be safely unreserved. Removing them from
> the reserved list across all three Shikra EVK variants (CQM, CQS, IQS)
> resolves the SPI5 access issue.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: shikra: Unreserve GPIOs 14-17 blocking SPI5 access
      commit: cc7b14be66ed27cab379c09918a6ad40a0c4fded

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
