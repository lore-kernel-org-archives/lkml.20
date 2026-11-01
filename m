Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571406;
	b=u5InmVy7hs0/x+NT0Lf6kqv8sga8w3+pNPKHp3GcFYj+azawGkMQ8UPWwRLi+XbhXSq0
	 YYQKVTE70PDTUTJTd/ajcG+6UBfYoQvd4THQehMUJakWG9M2fRs6o31b99QtfM/AgVya8
	 BNf3LBsYKgOEGW05ebVjvx5/pBxl4Ng/MONlrA0BaBKcrnNfTtil0ya0lEbytIjW4oRvF
	 1xsU5FaMLprrFePCCIDD2/t34RbSTXhqHzL+0+q9bpjUYdsYodtmDXVylPhmHxehfBoSz
	 zgHEzt1yWn69hdfRsQAKqmiwuYHRr8xYcw51Qbr8xwZ8k30EsiP2dYp0vp9rQtpDnoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571406;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=n3w1Fl6SJMp1kr9973CPt7D/UB+btgvPCLo7vh9GdrE=;
	b=A5mXDglRERla6JSYTYR4LPI3Iy0Q+MZ6gnLH+VkfnwMDK8CHnBLmL8lfHqBaF9d8nGv3
	 ot8dsqA/0S/WdizcfPrys445iHJNvvlkD5ntLmjz3HdEzcumWj2S4mfLsjomdCYrlkDTb
	 B03SSqBwonURAaaHCOp7HKNskn4N+t5XM/m0Db0ZK7rTBHmXBmioudtWHuXrmg4BzAFbJ
	 PHv387zaGchHHfEr1zoPlLTcVTe3omkw81fniBy478MfVVje7hpH0YTygGKoU4uZTTWzS
	 6TGTiK27voPZxlA/yoS9VQx3Iw1Yjs53gdiVkK3nbr/AvUV3eKyp1YHr5D6Afn0X3jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=p3eIOyeN;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2016606ECCD;
	Sun,  1 Nov 2026 22:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2016606ECCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=p3eIOyeN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=n3w1Fl6SJMp1kr9973CPt7D/UB+btgvPCLo7vh9GdrE=; b=p3eIOyeNLwKdvGgs0DrdVSQ8AN
	pIrjanYCEEVzJtZkLgPuQekvVXx/BUa0ZfyE+6Z9T5DGD+P1gkPZoLHl/7w8blOWDd0HAiHdrSbKA
	C07nlsh2JRBJ6gwFymecy1OJIpZVJLHwnV6Ov78hzlianq2McrvIBDlR7oazvu20VMT7esI7ZOYip
	YYwScpE5Tf5tf4L/fcgXcMkGFcQ3q+0p2ea/DGT3NZyjGCxItglsSMJEYtNPkNScw2OEqIKyzE0+R
	eNqyM5/iJGS/8dLRjMKoDfeTZBMxJih72F47iHoaJ95WOQ9Cuf8ppbd/IZK4Bag1wC3t+/plqYb7N
	ZjnAyqyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	Alexey Charkov <alchark@gmail.com>,
	Kel Modderman <kelvmod@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Fix Orange Pi 5 Pro headphone output
Date: Sun,  1 Nov 2026 23:16:32 +0100
Message-ID: <179357139327.4108484.4012953822270877213.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
References: <20261018-opi5pro-amp-v1-0-05c84e91bf6d@gmail.com>
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


On Sun, 18 Oct 2026 16:35:29 +1000, Kel Modderman wrote:
> The Orange Pi 5 Pro inherits vcc_3v3_sd_s0 from the shared
> rk3588s-orangepi-5.dtsi, but on the Pro GPIO4_B5 does not switch SD card
> power: it enables the headphone amplifier. With the regulator claiming
> the pin, the amplifier stays off and the headphone jack is silent.
> 
> Patch 1 moves the regulator and the sdmmc vmmc-supply into
> rk3588s-orangepi-5-5b.dtsi, which only the 5 and 5B include. The
> compiled 5 and 5B DTBs have the same nodes and properties as before.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Move SD card regulator to Orange Pi 5/5B
      commit: 7fad20ae8bf8e289cb6423d68ef4f0d67f4a33c5
[2/2] arm64: dts: rockchip: Add headphone amplifier to Orange Pi 5 Pro
      commit: f21e9ddb7415eb60a404297e2a44fa23243fd2d4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
