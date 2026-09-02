Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7690476CD8;
	Wed,  2 Sep 2026 21:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385506; cv=none; b=DRwGlfV8RMCvhQC0420Wu1rMzrI0xVdYJXgDuS5JFyatWrmoGbykPbfyL1bTmzpJ/1K4qB2Dr7zWWwKl2Ve31f+x60UqKTgP/6X7QvaTG6IWdt+1j7S/r3FPux7s8XUXKC4Uq/Za6D7AEwtTGJVIw7+BYCikmh/y1m1MO2wZm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385506; c=relaxed/simple;
	bh=wtG/IfKGG5r9hl+0ygdbGjmMIdIqAuQGB+BlO3L2Wlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDsEQHuBpxjYiIBHAdzMeYOKrlKpUOJFLK8F2ETNOui9z0gMIetR+W5oY8w1v250vT9a4F6MT1CWTF8FiprvDYg78fDY6oKYrwM25b2MI81lSnSnQGZ5VXDzZ2N3o1W4+sTMGGTJ4/qRlhduvx3SAySoUZ2G+9H1T6yR5+fy/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaMxLwFq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaMxLwFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FCB1F000E9;
	Wed,  2 Sep 2026 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788385500;
	bh=DKhiFcIu3U/nZQ+nOoipt2+PvemBJAQMmi+1qUgcv3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EaMxLwFqGWrC61tK2jVCoTo4fmzbjPJ0grEnLR4xmMDsp4pR95EcPG901+WWB721J
	 W6YyUYdNHj5kLffFOCRgKF6/wYav0tQ/SVv545TBl5XhaUbU02YneiWITBq9vXWQW9
	 vrCUoPkbhSOFpyQ0wV9rjVRroCqpQBxZEzC/FAOM9AMdAUAmMXbE1FS5knZo6wntu7
	 yMEkcMzNI0hUEFYECLJHWDwbMo1nU5z4OPTxYzUe/GkJzdhXFZJ0b+lVvrD9WB+49d
	 QH54fEhLSKAVf/TnA3RRNifjClCsXAryA4AQYvlSfheBSr0G3C38otP/hhTg2X7E25
	 72HODp6ZUu4Nw==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Wed,  2 Sep 2026 16:44:46 -0500
Message-ID: <178838546724.167607.3784743895923860900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Jul 2026 09:16:13 +0800, Jie Gan wrote:
> This series adds the CoreSight debug and trace subsystem for the
> Qualcomm Shikra SoC.
> 
> The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
> Trace Control Unit). The CTCU on Shikra shares the same configuration as
> the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
> "qcom,sa8775p-ctcu" compatible.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: shikra: Add coresight nodes
      commit: eed738c6dd0ca67e8e0ed0e18c97e4665078867b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
