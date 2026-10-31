Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449083;
	b=LUyXsM9kxZWSQttx4+nDcZ0pDw11y/TwP6uXTSUW7jXrrx5ku1Lu9DEmD0ID5Ls+PZ7C
	 3YWmplDAQRdd1VyR6mi3S++FAiF+izX+Ucg+TD2iy1pCAO89sgKLScHOxgugW+b7IUZes
	 vcSqDxyAb/LWabx5+hjlzEGUR+KQdYwXoTDLsr+kM23bswl3bhL1dxuwNq9hj+kHX65JB
	 /qIbuPFbzrDH6F5yX/B5t9O2/q7X/pzr8LukTU9qjgFa3UDLL6C0hqHpDzIvvOogYyq1+
	 qcE3hV3MjrPsxiC4RHlMGeDMQ1n5EYyzElNjP3paHRD7xDLWfxEakoaAXY/RE78eAcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449083;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WfqDrmC+ehUZ60Gx9Aa5w4mrh+zG4BxXWhM7P84e/E4=;
	b=xyrNG9Bugwh7UDECN0CEc+AXIzTP0M7fd96NN3lI3gxpje6pfSTIPJAFc2bpBxvXkgIa
	 7mi9IHwaqp8tlCKHd4l/XR2p559hTbpbiHtmLGMlCa8ioNevdWHRqNX/4wxkKoYYrjPlA
	 0xdS0d2VzCnYXvUx5RiOe61c0xaUHphQke9rA20iFVrPCL33IKhEBiX8IwnmG2V7duUHl
	 8KMkJPEiGqHKzpUYsuqLA2Y5xNTcIsX76m1iC1t0qbKrrQ9Oar49yqYsrBb7YGF5q8zr+
	 heGIusziYh1KYljGIHCZkrpkJqhSmBUErdvSzUDX/M7g5ivzyQJzcVcsMnUk0/tny+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvRvl7W4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A42606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvRvl7W4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73181F000C1;
	Sat, 31 Oct 2026 12:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793449082;
	bh=WfqDrmC+ehUZ60Gx9Aa5w4mrh+zG4BxXWhM7P84e/E4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GvRvl7W4RGrqljpx94XdbaZMsVvL1Kt/Z5Jd/55eORWHsalS5nFdOLhZslVPHATyj
	 Epqi1/8K2P+7A0aNrdghr3K0m5IKSQhcClb9RXYBmakKy8MPKStyQWmBH87IH10nf8
	 eEw5QOOfHjMHbUF24xNoaBSgLAY0d9lzM00aOqEfsR4dJw5IFzIdMcMJ2mOkycUdrA
	 57Hm22yeq29PdAbHNTDoD+NKhP9WJBm1s0CUo4SHgyKLXCy7meoL3v2MaMZsIH8cIT
	 EYpEeAzPOzbogU1W1PvT1ADFAEq5SGwV5qRz4Wbl1AwHr8iQXW9XRQxGfi16qKyFEI
	 qTuDlCJgPT3nw==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 1/1] phy: mediatek: phy-mtk-hdmi: Use regmap to
 manipulate hdmi registers
From: Manivannan Sadhasivam <mani@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011082042.348422-2-l.scorcia@gmail.com>
References: <20261011082042.348422-1-l.scorcia@gmail.com>
 <20261011082042.348422-2-l.scorcia@gmail.com>
Date: Sat, 31 Oct 2026 17:47:39 +0530
Message-Id: <179344905948.5901.6799097646166176701.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=806; i=mani@kernel.org;
 h=from:subject:message-id; bh=JmZC2SA93RT2nPUoPyZmky/enQbqCKoYwEii8HOdWaU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5dxxUWs3ovbRHBJTHeGitgowF1no/6nrpoiQQ
 oBBFLTs8GKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXccQAKCRBVnxHm/pHO
 9VQoB/4v8G/Tb9ty7lQVKYjEB7a7AKK/iMtr9bXlp4uhf0FbVMlBFpK+AqT+8hXG2Ve55+mvO3n
 w+/xPG4afcQ8jvJbvZIV58WBAhvz2bqcD4euJOA086kJzuGuMclGxwj14c/2NJg54MHpXd0nTIS
 l48kwjeeEjv+CNZaShfLX5LZPLTM3lfngz8mbECL90TIpRCEvErerhFamQUNdE7VQPHBnYaEpar
 6+VVkA3oVnQLdsJVXAA1Ch/4qPAfotKX/QJtctVHRWkhTOMED4AhCgo/5CKzs0Dq+itjhre2eaJ
 PHzkdZJn6fMqAOgKbr47Mf9YZ61mvvmSV7rFZCjdz2M6BhZy
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-11 10:20 +0200, Luca Leonardo Scorcia wrote:
> Use the regmap primitives to manipulate HDMI registers instead of custom
> helpers from phy-mtk-io.h. No functional changes.
> 
> This avoids the following issue with mt8167:
> 
> hdmi-phy: error -EBUSY: can't request region for resource
> [mem 0x10018300-0x1001831f]
> 
> due to the fact that HDMI PHY registers are actually mapped inside the
> apmixedsys memory space.
> 
> The same situation is present on mt8173 too but this SoC does not exhibit
> the issue as its apmixedsys driver uses of_iomap instead of
> devm_platform_ioremap_resource to map its memory space, just like regmap
> does.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Why RFC?

Anyhow, please fix the build errors reported.

- Mani


