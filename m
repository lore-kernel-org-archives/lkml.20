Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169354;
	b=3LO5Un8xjkcvQuK1XGz0VWwcqr2r/aPma9WHkvTh7bgsk0xWff5kty46uaxa3DixNVZw
	 nsXa2dLr02d1VI1JIx7F0le/XSPG3W9ZM4PDgWH3CGNJTfdcg4j4OB7sVZ5qPPCawPR6Z
	 46SE5gY4l2Z5OIKN3/RSTXeu7KAAFZK46QB7Npo+sS+6HAGP70rMhlt8Za6kQk/V8soBe
	 A+NmisRD1T9LIStEFJfyndsfGhh3/t4TrwTRCwB1aRugwm1EyqD+SQEzNxLTvQA6e22Lp
	 CgVuva51cGYaupDSgtLyYXkETqYixLwNgFe27sYjuT2AWT2uOh+N450ZEE7XJCz693w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169354;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TQmicMAwCZ+veK2Wt9ragwSxHzWQriH/AV22oia2TQE=;
	b=szH4tOXQXhHlalU2Eml7SsSyqKApSL5p8feVyEUo4RbJQ35J53iGc+UTakpUdk1SUgOH
	 154gEVivS6TZSNR2RpqU0+C20C6GhgWGvgL4qPOgVj4Ib/cQALfPJWkWl0buuloesJV/h
	 z++QxDWkwG09/y7qbgOi7aIpln9GiOT1posLxGHBDed0zHABSJqggHEH2Zi6f2dyhOGdY
	 R+dKxIxuPEbW9vKg0lyN1ZT5XNXyfKdkEPjbFymEoEbK223hTwLHRo2dtkccWn50yqSo0
	 tMHuOacMZfupAju/tA2d6j42Th8iG5fPHCqYFE9ph/zBcGF7mfetYFIGMQ0MoiLU19Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6z1qQH2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950A360A5BE0;
	Sun,  8 Nov 2026 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6z1qQH2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B431F0089F;
	Sun,  8 Nov 2026 20:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169354;
	bh=TQmicMAwCZ+veK2Wt9ragwSxHzWQriH/AV22oia2TQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V6z1qQH23g2pnP8xOJSVocQNl4S7OnwjBUZ1W+jFtv1jCKr5rXrNDgYoPl1HzCtM+
	 BZIRHbwo5/Y/oFtJcr8z9MlhCNvAIWIx16AFbSpYzBXCSyRVH0kDsGaey/YNelyeqH
	 ATe4+PilfTH9NLCEUypFe19QGujsqnTitKWR9MckcF6kWMRZLL2r3boc2jNJ/MuHbj
	 Gwk4mIUE12pOLza5hTLpH/7VFoKO7O9NYsi7JfJT6FUa1jN73fycvudJy1n15JCVwa
	 N6UOz0iYlISoDOPmo9kqMZkHzJV5nw8yydgm5MQ9jUcC7oYQx2yzanJjPvKFXg/FwN
	 kOZDb7FKyNr+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp
Date: Sun,  8 Nov 2026 14:19:40 -0600
Message-ID: <179416929393.628393.13698830723595892104.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
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


On Fri, 16 Oct 2026 12:06:45 +0530, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower nibble
> of its IOMMU stream ID) it is associated with. In the cdsp fastrpc node
> of the Glymur SoC, three compute-cb nodes had incorrect reg values that
> did not match their SIDs, leading to SMMU translation errors.
> 
> The fix renames the nodes to use correct lowercase hex unit addresses
> (per DTS convention) and corrects the reg values. Since the fastrpc
> binding's patternProperties only allowed decimal digits in node names,
> a binding update is included first to allow hex digits.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp
      commit: 59cfafdd42611fe446c400e692814f8acaed8021

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
