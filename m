Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788294;
	b=QizCOI2qtWh5StRdbiEWsQsuQonctDyLYNms4p1fpNt89WUGTR55/xf6nFT4xDPNS/Hh
	 pzwralMtZEArEoA/fwH1OC4Wk8F6ImuvJT7QAsmCmiR5vCtmspLm0cIXkxRyAxXjVSkYv
	 QZwk+rks8Au/2vlDM75PKwcUev5JGjW+oB7Ji2ShufzVpIjYKXaz4MCIWrP2xTJn2zrso
	 lUdMYQs0gddnWdGV14qTF6FVTdCGee53vM4306F5uyOPqy8axeJWBDcqMZ93j5GV0yrQq
	 9O93kmDm9LlXuGVEvOS8i6A/TqOiHwC1hLpvNzTBhP0Mixk2LW3Jk1Qg40RQ8nFRKiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788294;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RKVbe5wtyaqbdsS8/HbDxH4t9plMOA4+bl7LHbj9uH0=;
	b=cP8CY6TCp8Uf0Il6asVA0ApenQ1MRRyiyvFn477MbloLo/8u3f3xdrF1+7kcHwOp6XYs
	 CTL6K1m0zqqiu3GRz8ZSJbHILcYYhZN0yydNxztpE25YFPIRvpmlABu/F1WXw8mIVmud2
	 lOiZct13J/ENe+7Pn7YUMUAmoddl0ItzscKaRXzS/DSObGrpkW3Xs5u1fnnFw/+l35HE5
	 ZAxy88GDF3V2xdJujlSyHEurQXTic3E19Hhu2Pgocexc6W5qONY7TIptv8Sd/rXiu2jI8
	 hCMBX88OklGpLoVWPTfFpVOUNhuZ9C00mB1Tkrybw3Dfg/oLJfp64+D5ialMM/JG26Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNiFsKk5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713CD606A326;
	Wed,  4 Nov 2026 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNiFsKk5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05AF1F00A29;
	Wed,  4 Nov 2026 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788294;
	bh=RKVbe5wtyaqbdsS8/HbDxH4t9plMOA4+bl7LHbj9uH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BNiFsKk5EddmshYubBEFa4JaZYePkjiGsNL3b/iWP/6a1xZ/Dba43ghaXEc1ZdLSK
	 eCTcqEKKQ7IJNnoS94Ntu7XicSYRVqNgn4Odbvy7kmxVZfjTegG9MMighktixbJ2xz
	 XtySR+p7+ljRUBXDE18+yTSgGCfCZ74uxOxTOZAJBJ92nGZa0I9GXgketKl4PIg/OJ
	 CB3LiA84oV/ae6cr8zodF8pwzwCzQCPW7vKNH4EYK28EMvNjAlctkEiYq3PyU23fhy
	 V7zoJTiPwRr7G/SSS6Vzu2YRIuCDO8sXCf9/Bpr69mLQW6sy/q+Lj/4CCkY3gMS5UZ
	 Fv9fLgrqvKqXw==
Date: Wed, 4 Nov 2026 11:31:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v6 3/5] dt-bindings: arm: qcom: document the Lenovo
 Legion Y700 Gen4
Message-ID: <20261104-offbeat-cerulean-degu-cfec1b@quoll>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032648.209747-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104032648.209747-4-xiaqinghuan@mail.ustc.edu.cn>

On Wed, Nov 04, 2026 at 11:26:46AM +0800, Qianhui Xu wrote:
> The Lenovo Legion Y700 Gen4 is an SM8750 tablet that ships with the
> lenovo,elden board compatible. Add it to the SM8750 section of the

Board cannot be shipped with such compatible - it's first time usage
here. "Add Lenovo Legion Y700 Gen4, an Qualcomm SM8750-based tablet".

Best regards,
Krzysztof

