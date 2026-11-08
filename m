Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169480;
	b=jsXL65IkAWX0ck5Y89fWWqNmOFc5NDmvazPx17+OEd1oBOmKpsgX3FRn7WvZx3eDZIvn
	 38DrGo50tnZPK0fyk6imAl99XYpZQdcF62skRbzaS1YljOYZzggIBNAQIuCce8xaoDOsn
	 mZztnjZZT4mGVhPa5tyPu2EJz0o8lnEVozSpI6rxcaURZbGOQZH47PU96votwObPfhGO+
	 MDtSAtqKL+6khoSOt2eOkgENn0/DFuTW5xk0yVoILzx7kdOJ3Ab0FKL9AxxqPANMwtCoO
	 /VPyenc2wm4QR83aFBzfoAA4+MGLfUVtS1KDh60V6lchccxsqDq5JAVSoX4Rv1EwNjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169480;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GfvYLsTHz3/l6HskiI7P/bM0T6VoeKCGPimmsCzetPM=;
	b=jpAjOUCY2LNrYK/KHzAn9YvlpiL0yNlUQOSPvAoBZVmw0aD57cyq1OHLrpJv7J+ALMc4
	 BT7TlqvLdKqiW2Bdz5KOVhxwi1QXPQZXi49H0dJSZUytAdg7MYGJtKu4f8xl/ZwseedoQ
	 sVYz4PukMLjduojIsgYYoSvHF3h5kRYZ0ypGq2kxCRmIVKZoGTVLianZN1xoJed+FJmGL
	 ozXtQ7QIz/F++4ho68y9ilx6JoHDXYF9M5K0FuODAEBD4Uqe89P8d+++BVgjRcvrSCS7i
	 M8W9u4jDk1m8eAA7sjHGOEnKJ7KFbAYaXvAgZSt+G9Q3o/Svwn1fDplXVq73WIE+1VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xy4R28FC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E099607E485;
	Sun,  8 Nov 2026 20:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xy4R28FC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033B21F0089F;
	Sun,  8 Nov 2026 20:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169480;
	bh=GfvYLsTHz3/l6HskiI7P/bM0T6VoeKCGPimmsCzetPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xy4R28FClJpA1TsKuWRv3sn8Bk00uG0kg8aUPf0i91OpjyOMi9dqNc1bNkzMJ1N40
	 UqGJTGmZf2P9CzrZjS8Ptg+g5brdAfFW/refwO0ytpNOjdLJAYrorNwNUvEXlpyYdC
	 TCHPmcMjUut+F/zo0j2TgjbiCiec/+vP3Bw6FGrHJ1xrpIjSRzMsbLEtnzf2BZ7Qgd
	 59CVF3pRzHTaPJzUv3GEvey4J7AxRWiSOMXDPnYQghSFhVwBPCfCz7TRwtUkiqwz7d
	 DtbHUdn4JMTYAXehN/NIi8x4z3K8K8G9nOxnsuuw/5roTUKjc32cs9lJJ79A3d0eGO
	 5ui7TLMfUbPZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
	Pushpendra Singh <pussin@qti.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add BWMON support for Nord SoC
Date: Sun,  8 Nov 2026 14:21:10 -0600
Message-ID: <179416929256.628393.9310772869242339111.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
References: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
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


On Thu, 24 Sep 2026 15:32:20 +0800, Shawn Guo wrote:
> The series adds BWMON support for Nord SoC by documenting the compatible
> and adding DTS nodes.
> 
> Georgi's Acked-by on the binding suggests that we can apply it via
> soc tree.
> 
> Changes for v2:
> - Fix "reg" length to be 0x500 for all three bwmon nodes (Thanks Konrad!)
> - Combine bindging and DTS as one series
> - Link to v1:
>   https://lore.kernel.org/all/20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com/
>   https://lore.kernel.org/all/20260922080416.484280-1-shengchao.guo@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible
      commit: 829c6f29642d0832af2aef566f9f2078a9100027
[2/2] arm64: dts: qcom: nord: Add bwmon node for Nord
      commit: 82e95d1e9dc0afa36b7fad6bf93445b76fc23446

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
