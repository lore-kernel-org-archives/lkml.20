Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F413ED5CD;
	Tue, 29 Sep 2026 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651780; cv=none; b=LDZmxtbQGW1ShHNTkgWzDAbDH3YKaN3kq8RDUyiPirMxTEt0wOhLO7yH6+zQ+y+hhaZsxIz1UNjcZ9noXWJwlPyDqIIBgsX53bDWLRRItapNQAyGgMAuC2xe1HeG435N2KPaeHU/vbVRBR2E0GSDt0/eMAH40D3auEsEqXDCjXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651780; c=relaxed/simple;
	bh=C1+fUQ3tiW++VEGsWq9tR3IsCbEhNP6FjKSewB0jDjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aa1Z6CQ0j+Qi3rKEOpvUUinFuWo4+10/OIJ4wLECxNo9RmV/dTdVCHaiUeozw3vfBhquBMO80OwMZdoqhI1IA9IEUThDawpSfZerX8TixMs9+AiVmq5PNjTX+7GkIDJASbZFui/2JQxyJNJGouIswwJwNcjClCBkSLVOvilYygI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqCw+zbg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqCw+zbg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B0A1F0089B;
	Tue, 29 Sep 2026 03:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651772;
	bh=gEss5SwbyDbCCEm7/XB7wEABU/zn8M695Tx1rcAworU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aqCw+zbgOq6wf3wI++hPKNNjwfxoWMiB0WQwMKj6cOt+k7MVgLYj4vgq7AUU9ZZow
	 KIUTp4jNG51pxW4Xy+8pYIWrt42PwfgEtFrR4EdDP/CS63vfVx2klUSXP4vNTNUT+G
	 fElk77hG3WmIxBGFEEtWAQD0vI4QByLz/MiXB2Iq4vPh5el28dnQBzTjYKvHq/P48e
	 rhMUKDgPLi5T1keN0Fd7YSCfdQG7sekGxZS3KfdrGmzpW84ZVCyPqDrI6mHymthEkv
	 VDL8d4n1HE/+WUcFsY0ry77GmE/ar9MmnyO0aLE5/7lmcjhvaObhzxFyNlYgfX68vx
	 dtMo7M+hfPiZg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent supply for regulators
Date: Mon, 28 Sep 2026 22:15:05 -0500
Message-ID: <179065170962.2673486.8090025662302091481.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Sep 2026 11:20:56 +0200, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> PM7325's l3 and l5 are supplied by vreg_s2b ("ebi.lvl"), however since
> that regulator is not modelled as regulator, skip the -supply
> properties for those two LDOs.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent supply for regulators
      commit: 82f9b9a3472fb1dbc7881fc06e24807f9e2699e5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
