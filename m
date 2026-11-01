Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571351;
	b=4DzdbZIinWppBae1PSAmlOdwjWKpptFD1heQgJtFl2hQZwXN7imowAS9JkY3ZpJz/fuD
	 5lH/WC81Pq8kXmBqJ/sMUDQQ5j8ptrHXuLJkMKhxnofzo0UGh5ChT/oBRWrOvW+8PpTUq
	 l35pjk3Sj6YntwXvtsVEi6yHRKwx5SKrHS6yWpHxwdIVPWXy7orUrHyknuzgPxvSLpfP3
	 WLlhvrYt2i2UGVvz8skdMfHyxW8w6EtddHsJEjva/DGFIGQNSKWj0mw/ZSaQFabPrQLN3
	 Gx+YdVHR0pRPbvx97JijuvhYV6cr8pVstmEsMyrrrMD5xdVWn/OVfnPLOaSFMa5C75Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571351;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wv1ABuR7Ob1gLZHZ2qpyHBZVXGvor+J+W/F07nCfMhU=;
	b=RXxeNVpA20vLh95nHMMU2VOOCrj39p/RFXZkZQcxQSD+957TBu2TZ30egThlVpO/8UUO
	 Zr/r76r/P0JMu5COUaka+mFuqhd5yEdyieWJo4BghyaQ52ISguwZy9EJp+EQIqe5lzv8N
	 6YY60mBzyW57Frfnyam+UqwmQPiv3Z5AuM9sJg8tFSeGJbiq62DapwMVFeTMiQpqCuA5m
	 O1UWmdGI55YL1xtA5sHXWgYoWDKDMl2C6AgAUMpdX8FduIYQyrv0xk1FEs0ZI4a/3fWBz
	 oDMBf6qyv+L28hyIM/xjsB+aujpXGbxbtrlVTZ97t0CqRdymMkFZ0Uz0YrTwm1eYrWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2FC606A32C;
	Sun,  1 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wv1ABuR7Ob1gLZHZ2qpyHBZVXGvor+J+W/F07nCfMhU=; b=J7kQ17dyQsTsAEHG6ajo+xgzCO
	CAaNzQK8q+FqqOxfFCRVLMxqVh8dfcyNgha8Ma+cvRRBkZvFVTnx33fcIjA1ULi9aodpNX5yYrZUG
	Su3u7GDWgBLF5dJdSME3kryro7FPb93nBPkGJP588b5otHQkNxSQxAdmJVh5TUFgg3dbyZIHxH4HM
	KUz+znBW3GKmQHpJvfWOibYLRa/A/JUzY1ZJ6xXRaI1lLUuk83Q0jSbnRS/hrhkl/N5xUOj2OsOzU
	rVhknn3WovtpDtWH3paOls/PrZvs70uCXo6ARaaWTahdX7WIKWmtsKJH65XMBKB12G8i6gxaMLzT8
	ecb0JEIw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable the NPU on LubanCat 4
Date: Sun,  1 Nov 2026 23:15:20 +0100
Message-ID: <179357131388.4107717.16646264299235456794.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_9C3151C59C077D547095ACDC1F08B481A50A@qq.com>
References: <tencent_9C3151C59C077D547095ACDC1F08B481A50A@qq.com>
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


On Thu, 06 Aug 2026 00:57:06 +0800, Pufan Jin wrote:
> The three RKNN cores and their IOMMUs are disabled by default in the SoC
> dtsi, so the board has to describe the NPU supply before they can be
> enabled.
> 
> This board feeds both the NPU logic and its SRAM from a single RK8602
> output on i2c1. The vendor DTS makes that explicit by giving the same
> regulator node two labels, vdd_npu_s0 and vdd_npu_mem_s0, and then
> handing one to rknpu-supply and the other to mem-supply. There is no
> separate memory rail to describe, so npu-supply and sram-supply both
> point at vdd_npu_s0. The binding requires both properties.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable the NPU on LubanCat 4
      commit: 77026e98dce776dc45ca7bc77c3d2ba95c39f6ca

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
