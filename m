Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625E941378E;
	Tue,  1 Sep 2026 02:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228618; cv=none; b=iGdHXT6pZTH7SSTvacBdEJqtSWpyl9czcQ1JZTUBU6sILtt7bG24W/tqCvJiWd/zzDTBrS1reWtwo6Hs9jbueABcv7ryTMYgiEGy87yAglkLtTkM+nLh3HJzrHJj75LSaVXCBvgf9XC4KKxVe3d2NESRO6iI9PBrDJqcSAWaDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228618; c=relaxed/simple;
	bh=NW2DX/I1wr1rrpowgGgV4Z9+bgCw6ednG1bVb2YvM/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfhZmWBWM6a8SjSnBXodDV72KFQ6jsK1tedES2CJXqpuzsKevrr6YEl+xl6sm35LkiE8HyNCG6mtVCkhyXdJINT82+49qjmU4xLCOt3oxMHmZQ2mboZ+6kPxohgAOcVSK7Et2ikj2tcCv3AXm266rx3uy+YAjKtL8WvnhPFIpm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuyD+1Sw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuyD+1Sw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127631F00A3F;
	Tue,  1 Sep 2026 02:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228599;
	bh=RWddEQzCbwXPjjPj6HBeM7w+AjwEPa05RWsmZTFMy2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YuyD+1SwbGEZJTjUJ64ugCaiwxjMx4VouSom/eZnfTWQO0uNJE2TcrPN98ooevEeg
	 n0JN5+Yg83PztTkDBy4hkEAa/2dexJpFTGGZeNGevA7j3W/FbL4iEMjf+NhWk8IMQl
	 0TKB3GskiXq4N61BlG9c4R3e0QZ2tG7JXTNuhLFNo7nApSahV54xVXTqwD1IkRZ2r4
	 MfkWrnrPOV1IOU+5OaHV/04XgXadFkDRz+kzLf1TT8aE5/ESOmV7N29zmTu6eVh2zm
	 nlC7WVQXKyWPMUMsgvt2JUJJ7bG9hv+w6zPHBIRu5Y9Utnetk1ostkD0p2FnFr7VqN
	 /AECULppmDNRQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
Date: Mon, 31 Aug 2026 21:09:33 -0500
Message-ID: <178822856243.1835959.15333044095313620420.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714-gpucc_dt_v6-v6-1-16bf5289572d@oss.qualcomm.com>
References: <20260714-gpucc_dt_v6-v6-1-16bf5289572d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 16:40:01 +0530, Taniya Das wrote:
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
> 
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
      commit: f695831a7af1f8d39203357572683981ebe4de77

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
