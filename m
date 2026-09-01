Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F206340B0E0;
	Tue,  1 Sep 2026 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228609; cv=none; b=q0k9xsQxaW/iyMVO8YbnfJu/zx2DohrsmqbH1TLIF8ODinev4SJRqO6bLnXSjo0eLA3wSFIB78HH952CTHhvp5yU0dV668cx3ynNa3iqPaSGuFTq0f92zX0M3w4NP3IhWpFSPGd/pW17QeW/0cAk7fYviDgh3885kFCeL/zXXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228609; c=relaxed/simple;
	bh=rueSU3UK+XcX4HrKxav7mLtPYF40/5m3Gjmp/9ArePs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzpuIMY66W/JI3huNHfNtMFG8QNDW0EMMHLxc/QX8NWC+C/1kAHYzd+7nfqtb7RhiL/x21oRd0k+A1gSwRLCh/LHCx2XTkn74hUAdjcnT4+AymzXNeaINUuuzYwFSsqFVEB2BFRTu77jyOapIOPh07gZHAnjcxcH0h1qvpRI21k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPcwdzXb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPcwdzXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8B41F00ADE;
	Tue,  1 Sep 2026 02:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228587;
	bh=vmaAfbWHGwLcti2TlXMDXUq+DvFQ5ZoOFVXxydmhGrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NPcwdzXbFAz7LdV+i8lTfKO3SbL8a239juAaEq0h+Tye0iCXqY+WttUHcy4enekA4
	 CYaOzgHnESK3eiPFul++hOUuh9vdIlQ+lh8Jshqnu8CqlZJsd7oPOEWPnTugkCC1LL
	 mS7zxd9U+Y1LGkvQdtfNF7hPewNh25TWfRzPz7PoACNvmQuJTX9l8iKxNzg7f42u5C
	 QN8JNQRhHoaaut5DFwxOjoZG1efi8l1lHoj+XJoxjopxCOr4wl7SLG0XkzEObCutgv
	 YBgGFHjh6yysqv3PeoCGRySK4UnWthUfiU4iVhwB2UjBmANMgAWXCPa94p2FSq1b6I
	 l88z+W2V5iTRg==
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
Date: Mon, 31 Aug 2026 21:09:23 -0500
Message-ID: <178822856255.1835959.13014643071629589214.b4-ty@kernel.org>
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

[1/2] dt-bindings: arm: add CTCU device for shikra
      commit: f0c7f46249b917668851f51c7f6e9297c44d42d4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
