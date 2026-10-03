Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4201943DEDF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041121; cv=none; b=D4pU44JKZ1yLLHKB2Uf4oZzbtyn0IiV5612maSFFrT2S55UaN1MSLksP65xG1yJ8aT6GGCCqkzYwpAr/94WjukA7+QxxyHMs6CjpOrV8zoTnf3dCg/n3Kf4KAQ4TGynSP8p41/C7nl053CiQvpQwzFrG2yi5mrYB13frbtb4sMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041121; c=relaxed/simple;
	bh=nVTeKTRzwJeNV7j40u0xXS5IwjGrjaN1WEjX/Ql5KfA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tQbEZugPKVPa6HhbAIuFke6f9Mc0LtJRH3LlfEf1y9MVrUY6P+Bmx7zeAcWvlDgAEfkMLVgU6AljZOpSWC6x8aUhk88TFjB307XdkuJvo6JQR8LmxTZHUU2s3FLZ+GTrv8I4ec+GtD8hvwyM5doAEKjqFnYg00BnkluN3eU5WG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxpJPO9Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxpJPO9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042F71F0089C;
	Sat,  3 Oct 2026 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041120;
	bh=DiX5YW6EBF7WudDBAa3mCh5+8hepxsK5EmgVDcVUaHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KxpJPO9Qmv2UgUpdX5duGVS+kcrJcLxiLByfXnXLACZpzcadShH9Ab148O92g8LYx
	 3n4IWgPohS6M+beqz1UK5gL6Aykjda4JVWuRBu2mIyJ9ytS1ru2a0M5+mTtQTXERv8
	 rto/2CSxMpZD8UbhRJvRq0yZ/RpjBLcOPpo2hQr0WGHROIpDGCRREEiRVaEr/7q1X/
	 xYu7XQW3+gxpqgYjlefdOoafEgWwLkMeHZIkVX0xgCyE9dNdvZhNB2Zhx9z3bprTTf
	 CvtwmoFlkp3jrcXTLJVk+sxgANh1xV803u9i68pbUHOASGA6CYrK2ZtOu9LNN77Sz6
	 Vh2/3utiS3vmA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jason Yang <jason98166@gmail.com>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com>
References: <20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com>
Subject: Re: [PATCH] phy: rockchip-samsung-dcphy: Enable runtime PM at PHY
 core level
Message-Id: <179104111766.223537.14780886695955286078.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 21 Aug 2026 19:44:19 +0800, Jason Yang wrote:
> phy_create() only enables runtime PM on the new PHY device if the parent
> already has it enabled, and this driver enables it afterwards. The PHY
> device therefore never gets runtime PM, and phy_pm_runtime_get_sync()
> returns -ENOTSUPP for every phy_init() and phy_power_on(). The block is
> still resumed today, but only through the supplier link fw_devlink builds
> from the phys phandle, which fw_devlink=off and =permissive do not.
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip-samsung-dcphy: Enable runtime PM at PHY core level
      commit: 261e84f9278f4373970471ad71479df20d82ed4c

Best regards,
-- 
~Vinod


