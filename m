Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472167;
	b=ZdWfIPHX5Y9Y7xNQdln2SRHclp/7vkMH2+vPiBd29I/iYRH0jv5W1vFzmdwIhzWRbVaj
	 ccftQhVRBQNg453WFBl04CkgwG6wdPyLbMExL+yPCJkXgaCX2Gt23B+f8r7LzX6OI/Bz/
	 CRXNAi1Ie6rg8kjdc/aJRukLS9KxbJCllotNQvcKBcxraCYLr933+0uHnb4YHLR9vwDIe
	 gmy6EWvZndh2tm/rqyY6pp3gpS1zz+z9AOWQdxcZ+L4fWEaLkGptILwDzwYeRWpB0eL1X
	 xHjLfE9q3ApP63kMuIQPpOaL7+5qPZpmq9pHjmk4O4xR3+b07KZpReoTb0JdYQ4CjKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472167;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XuscN1Ri564Wpo3m39uIOx+8POLBub6iNsNptAd0ggY=;
	b=NActzkyb+3ztv9WfE6dRkneEyNMozcjpiHyuMxXbKCNyvj5WSYIpR7njndciaxhhcx2+
	 Iav6N1dQRaKFFAk0x6lwymyztnluMLQQaGfTZj7a4iRoKu67lXKd1YkPmbI9Zy+DPWsQc
	 LjryXP5lojH3xWvc2wz7eDzhfN51x1aI9rtrBMbUmPYcs4PairqRHUWWglnuInc83gLX7
	 Mq+dkN+PsoFqI0Ke2/HU1tu+6Zhw3gWrHHoTKnCaoYlwTUXvfLUG/vmSjBndUgbqni3Qm
	 NIIopMHvjoLHd+bn61DVrvVEZ/xM49tWP+bLnDxSjKL7JHexWSk1bEvtfes2GTc4edQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkltRoqW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7738606A323;
	Thu, 12 Nov 2026 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkltRoqW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821D21F00A05;
	Thu, 12 Nov 2026 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472167;
	bh=XuscN1Ri564Wpo3m39uIOx+8POLBub6iNsNptAd0ggY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JkltRoqWZcBVLsQkvIBByulEzNnzGve35H+Lw5Npmp3/etTCJ5l2j/y+FTuHjGFfn
	 wfXpcfVX0xvOb46wpMmwSNaKno+Rc8/yGmUputb1AbNXOd9axtcpbP7iHzaxLW7zDT
	 xMWi2tA29nl7TZ2buXperh/RD2H9mUwyMhdjdbpjP199GLydINw38PkOaVB97EYg9c
	 QbqSzQZJoEgvlv5wJc5abusPICc40ChkbJwL978GCAQeBW9bd+2XiE1E/Lo24e2tlA
	 J00LRVk0YueT+bOGYKGM07GZFj7pC8zGjB2f6zaqBsCQQQJ1cyf7Pw3bRcz7vNFpmL
	 zfdYV+TPNh5wA==
Date: Thu, 12 Nov 2026 13:59:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add qref and refgen regulator support for QCS8300
 and SA8775p PCIe PHYs
Message-ID: <avV44_YBLgj1wJfL@parshuram>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <f4d10126-e2a4-41ad-9960-ff129d92f39a@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4d10126-e2a4-41ad-9960-ff129d92f39a@oss.qualcomm.com>

On 13-10-26, 15:27, Ziyue Zhang wrote:

> 
> It seems the patches get reviewed tag for a long time, can you give this
> 
> series further comment or help me to merge them ?

This has some unresolved comments from Konrad, pls fix them and post
again

-- 
~Vinod
