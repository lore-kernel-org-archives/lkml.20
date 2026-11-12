Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474224;
	b=cZzTc+SA7KQ6+VkG9DORWoZ50WILcx25kDGc7KPecuIapQP/WKlj5hqT6XTnILACqcq3
	 XXqpL07aaSK5nQRJ5qOfUXsGZBhoMRN8ep5FN0TIizw2cnpWPzU/DD1VZfPwunt4SirsD
	 /0YKKRS9uZy7/7iJo2IOeO6nGQOxlouei+ZqVS3QmHeSqhDPI/zAasVmeVAtlsX2H/pGt
	 uIw3wEmNzIyDkLsEHGqzmUMMQPTeMH1yDz5+nkJ1Qhhj9Ojn9H+ujfSVDT2NsWc5Exyog
	 IGOBq+1cCxNdvo12PEsyQSU9Ti5rKWfyMxYdpX3hGqN+Yr6ihOrcUFBDioa9tznN2MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474224;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=0SqNMvBpkWCMg1sYf6ydGcAXlRxW8TbvM8AG+7xsJjo=;
	b=T5DNuw5nZkqPuOhN1itHw0ZNqSNkNLvFDlykvan21sBg8zfiY3Zji4BRG1HA5RBrzl/q
	 /lTCJSwGU1xdvjHa/ubXr1Vbo1eBpHbFd3bxb8y3NXh7gsc9v5OGpHoeBeyBvzrHrlLuH
	 Hh36lnWiiH4rqgkn/bzlAUxsinD7IBVf+p+KW89eYJtdProVwu4QJoDYfPf1RCndz3G5n
	 FKF5bKNDVrP3d++tTu8aozwaabgqqCFebm7EkL05b9/QH2Z08KeJNL49Vypj/eQsEr3cJ
	 7uQfcIYgvmix6x0lvyrafe9f+NxHNtd69G1YpARNVwAqebXcjhVlv3FXWeofpOlvu+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MheNxSAw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA2606A8B1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MheNxSAw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DB41F00A06;
	Thu, 12 Nov 2026 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474224;
	bh=0SqNMvBpkWCMg1sYf6ydGcAXlRxW8TbvM8AG+7xsJjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MheNxSAwXmt49Dnj1PXDxgAkV0lUuNDkpb5VPGEI71seXnh81299CSKxoiA7eaMgT
	 gZrfF3Mb4gx4K1OOwYvwil0SR/KrYnpwbS8DKnBDakAbEODfRsLMuQVDb47rWZ7oyX
	 oLcxuuEPrOPC1ZKabkn2TCx/ZH10m1CtK+xTFJDwi8FR6UdDvvBoxocLKdnuozwIlc
	 MfVGSbu4wt7dkdQXoxost+1kBuPbhJqGtmCx8t1lcCilwMNIyjrEwYX4Lzz0E69oYZ
	 t1ggkOHCP92FL4uU9rSuTatXPcMADyIKtMPnGRPiwv7R2TWxWHiHWKIbogKypqwT/O
	 GUQHIutwkRs3w==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, johan@kernel.org, kishon@kernel.org, 
 rogerq@ti.com, Hongling Zeng <zenghongling@kylinos.cn>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 zhongling0719@126.com
In-Reply-To: <20260909122630.1313205-1-zenghongling@kylinos.cn>
References: <20260909122630.1313205-1-zenghongling@kylinos.cn>
Subject: Re: [PATCH v8 0/4] phy: ti-pipe3: Fix clock resource handling
 issues
Message-Id: <179447422182.428158.17793904820702370114.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:33:41 +0530
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
X-Mailer: b4 0.14.3


On Wed, 09 Sep 2026 20:26:26 +0800, Hongling Zeng wrote:
> This patch series fixes multiple clock resource handling issues in the
> ti-pipe3 PHY driver.
> 
> Patch 1 fixes a critical issue where ti_pipe3_init() was ignoring the
> return value of ti_pipe3_enable_clocks(), which could lead to unclocked
> hardware access and unbalanced clock disables.
> 
> [...]

Applied, thanks!

[1/4] phy: ti-pipe3: Fix ignored clock enable return value in init
      commit: 64207b5bc6be7db5e75ba9b7eb271dbda30834e5
[2/4] phy: ti: pipe3: Fix clock resource leak on probe errors
      commit: 6dc01e3516d79cf4d690d892499a0bd08a14285b
[3/4] phy: ti-pipe3: Fix EPROBE_DEFER handling for clock resources
      commit: aeb637c73631851de0965514151f7ff7bc13f940
[4/4] phy: ti-pipe3: Fix clock leaks in init/exit error paths
      commit: 2be6a65608a5e32b2be6f5da843b1f29f1091098

Best regards,
-- 
~Vinod


