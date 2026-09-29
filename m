Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5412E3EB10C;
	Tue, 29 Sep 2026 03:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651747; cv=none; b=Jwe7imfCJXw8c8hvvG9CMlRJVFKQjx75LzqZWB/LnBvLK8nDV7nYU8Akl/q8aI75qFs+pSpZaQdV+0H7y+obD9VWKOuRyZEGxgtL82T184scvJIiXOa2stUuNkAejZUNEnuBfsGe8xIA6n5K0CEBxEu4L7pCXH5CV7sxJnVkZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651747; c=relaxed/simple;
	bh=2U9DUrCQUBRbnIIvu7d5ZqMeDiMucaNcjcpu3shUzl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdWbFIH0M2XJP9NE/uquNJiF4AUmsoFOTkLh0fI1njgE1n4qpT1H+rd85tfKJz7f+ZZLm3AugQwDQVFT7jUIUtpRw3Nm0IbBgVe9iesxGbl4/PCIPdz5o5TIvM6tVxOq6GBvKGYeMbBL6H0sppu3kkR5A90CoGuiZ/qDGTRF+bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRvFyJFV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRvFyJFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7AB1F0089A;
	Tue, 29 Sep 2026 03:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651745;
	bh=q+aR/gIfTCXctkDc1a+P11srgqdJ79NOOSINB+llb9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LRvFyJFVsNv7rsKHnbaB0FnxXTHCvdW0ILw47PrnFRwUFqdS+KAw4LZl2lr1LKs0R
	 05zn2WYJ+VtTaB+6ZuemHNTxvKOQBcr4ZO06FXEcDrwx4mHPCg+LZRVBldp79LbccO
	 cLZr/AnwltijQikYRx88FsyHRatgfxB3IR4FpkG+d+1g3JROsaLa2XMcPKvXDIfWmb
	 F1tqQmdUN22WQWqpuZcqqAkDNnKghX48ulGFyN+7kUPFrbzN/rgLxAxfhNgU5A4/Dd
	 QKDU2dyw6n+uzl1t4mPxDCFPfinih5wak6Iyi7QCFOCM/4FQIm1ItVBFWdPcElkHL1
	 I/uYOGN0cOHMw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: Add Glymur QCB
Date: Mon, 28 Sep 2026 22:14:43 -0500
Message-ID: <179065170977.2673486.14663238368949456133.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
References: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Sep 2026 23:40:51 -0700, Gopikrishna Garmidi wrote:
> Add initial support for the Glymur QCB (Qualcomm Compute Board), a board
> built on Qualcomm's Glymur SoC.
> 
> Unlike the CRD's closed enclosure, the QCB is an open form factor, suited
> for bring-up and power, signal measurement.
> 
> The base support boots to shell with rootfs on NVMe.
> 
> [...]

Applied, thanks!

[3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
      commit: 949f4c35d0864dcac7391751f57bed6a8e3e4788

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
