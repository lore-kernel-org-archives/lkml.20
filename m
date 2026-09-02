Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAE04AF150;
	Wed,  2 Sep 2026 21:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385531; cv=none; b=UIpw7Ny1NvFYDDWtbCEQOsbgKsJD4iExFmQqxArGvJ7CFDZtv0zJyrS1r7Ba/vUBGL70L7Sfq/ye+LXhATQbgLxS/Pr9EDlDro4gqsJNx8IQEAoe+0kbf9uZi5GeU1lsXeAEqSKW/1j6JH/d2IMW+Ln41A+rnU1Mr32k+CuAHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385531; c=relaxed/simple;
	bh=IiuHrV0iRN81Gq+92V+dx721TXRS0PlkbPLHlF3v8Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pX/JTGHoAmIhYS7rxt6RtVf5Kn9EMS4c1uwBBog1zaphPXjqM/8RcGH8iDDiWMrZXGdmXjPP31sOFStj0oww/C+YvujCXj1Y2nc2+jfErCkPpuNKCYrHAbyiE3RgGuIo9QoTC2Abqnlx6eiBIuZyMhtNTV8EA5M2EghA3S2n678=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV3Hm52m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV3Hm52m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B56C1F00ACA;
	Wed,  2 Sep 2026 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788385501;
	bh=R18D4nnM1fC1oPCYMgfcRgGyfxbjD56ywDI0w+Ju0hY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oV3Hm52mNcTsJ2f0GdU5xc9D+PSQdQuS63PhsuPghcBcrIyhMEx1sZu0vr+sXKqDo
	 c3GeoflFaaZEoks3pYMF/YErjdSclYgxCz4j2ymgsIYp2QLUauyvv2eOXe0GdxoHz5
	 bfq8P0t/OArGYvm+H4Iy62YS4bdJokCHjQFlOrn4IPU5yb1eT+jysK+ymhP0LOaxS6
	 aszNeBJ3zOXe1osw8LuJ8Xk/m5bnrCfw8bbpnXx9P8ktABqznpOAUjxduJ4E8U6HRs
	 8pnVGnyAM0fyQYY+m5dykMuOUpycUeVTcCP0ft0P4/cTkBurucZNnK/WPWteyD7rPG
	 J0sAuoaE6+X0g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
Date: Wed,  2 Sep 2026 16:44:47 -0500
Message-ID: <178838546718.167607.2430723665063990847.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
References: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Aug 2026 16:23:43 +0530, Kuldeep Singh wrote:
> Add device tree nodes describing the crypto hardware blocks present
> on the Qualcomm Shikra platform:
> 
> - BAM DMA controller used by the Qualcomm crypto engine
> - QCE (crypto) engine with DMA support
> - TRNG hardware random number generator
> - Inline crypto engine (ICE)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
      commit: 099cd05d200ba241bcc7497c4384b8d657a5632e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
