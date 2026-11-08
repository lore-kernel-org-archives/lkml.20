Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169454;
	b=GgiiLbrHMHspUB1vHm9KHs2R61QA+fptexRXBJ+qez1xqsVCSZl0Z791uYV6lzTTrxoM
	 43hopz2mgTX3XNeyWTvK1EcvPdri+S53PPhrY9z9lVjOR5ky4puRIKLYJ4PTSf5rb9ULE
	 aShH9YH2/hdVSQ8fnO1RsZ1rVNatu/6glUOC1FcPSKwyXW7/c5rJ2MtafziGxwsSsGfWP
	 HgteCulUIT5Re+JDOkLndEomS+xk0NRkbPGO3v/lYmTLIwgHHgVt/4qhI9EFqcSQShpPc
	 2qjqHOeBjTKFEDoUyN41cZZ0WcpgH6geuFleFGObjtartSqi9lqiZqkiCSr1u9ONyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169454;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kcntJoPzHXmeg/Zv97SX9M5nZW3uwGreJaLFrPpkosk=;
	b=lepAuIUCVfvWpL6ybn005UMf4QKCJ3uv4nigwIaFqJAeO+FBLjFGBjzJk9IfcCQpgoCa
	 Jk1SHFMTq6pB4LIWSjVaoH/OphKA7Ze5nsK3dW3MAElcnspKwyBLc58YBhm28VWO83ZNw
	 lQH9hCjEKDGN8NHBVVWeFjH2KiU55Mw7uIUGe+QJh8LSWpCCHxTp9o76f+LUFQoRuKMyE
	 xjCKzo8Roz/Ibvu3sGZ2iGVjYqyzDqrRouIe/pcRC0FU5Jx2EKSapZ0C21ADjeYPreAmo
	 uvZBc/JxgDZMNHbd+qJZaRtOKLC0L2mxI5mwpqHqE4BM8mdMNgJIv8PODyCixqvHO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERtkcu4t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC0360A3838;
	Sun,  8 Nov 2026 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERtkcu4t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373491F008A1;
	Sun,  8 Nov 2026 20:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169454;
	bh=kcntJoPzHXmeg/Zv97SX9M5nZW3uwGreJaLFrPpkosk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ERtkcu4tU/l65OIk+h94j8lXGwUEbXQUWdGRch5MBeREVpmEVLDAVRDisectAU43c
	 +u/Eleho6jh3Fnvhj2dNLZ353stCSRJ+lpB0ZHophHyTz/zpN33Pr83AZYBZLrFWjJ
	 GTxIL4fA+KTBrdSnvUNvsM7gR7N53MXbett9NG0fm6750bq/imi1DCdf8IFavnbAiH
	 +SERIiZATkHZBdBkXTxPoHn3tdrPQQ0wMdfNBkrHZXeE5y+85fjxol7lQtRbb7KQVV
	 McK9u4kAIEhwyKKhRuBnJK6ujtyeyNNrxpsVIDnU7rTn3dg3WCVhDAnmOX1uqUI6OJ
	 59mAtFV6bAVqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
Date: Sun,  8 Nov 2026 14:20:50 -0600
Message-ID: <179416929217.628393.5520790051729545300.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
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


On Mon, 03 Aug 2026 17:40:40 +0530, Mukesh Ojha wrote:
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
> this series adds the DT overlay that describes the IOMMU streams and
> other kernel-owned resources needed in that mode.
> 
> Patch 1 is a small independent cleanup of the two board .dts files:
> keep the wlan_ce_mem reserved region (its /delete-node/ was erroneous)
> and drop the redundant wifi memory-region override that duplicates
> kodiak.dtsi. Patch 2 adds the kodiak-el2.dtso overlay and wires up
> the -el2.dtb variants in the Makefile.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and drop redundant wifi memory-region
      commit: 4856fb5502546e8a3aae8f492e125f70f37e6ad8
[2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
      commit: 40d8618f7109a00cfb2f44009e768f49296c4ae5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
