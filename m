Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604095;
	b=ql33cfzUPOW6GVBtu7411Y3mOUq+wnfMeEmlso+/jopSuxcRru6jEiuniHm5SInNU/Nx
	 r2aXwHTOX2zgZumOBx1G32BbaSMj687zdJChBaZN9E9sRYc/F7giTJv9DXFsR51/HRRQf
	 IfLd948sMRF73ZI1Y9pTQUFCNRejLMrxvhtQBtBLJmtD+MV6HJ33R8fq2GdKVxPUVVNxH
	 DC6tTi27IZBT/e/57MQ6tuV674gJabHO1u/tLKuIkBzBQkMnjLjInikOggGai93klKTfk
	 jjYaGbbZjTFP4rrmkBTcFHeOBoAEEFD775xVY7O0SI0/9sl8G8w7YmruyaZhyZYU6qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604095;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KL61sUxGGXBLoXiDN/MT8f5YU0XPMLUvi7kW1YNxd5w=;
	b=D6/1PImAEAaNV/hCjZbw4OadqCaL93XhyqKFtN8IEpB2h981fTyM7D7emV1FeNg8QQ9O
	 PCLqo406jDciILSZtVCrHv+5zQrh/qqaVf/wxaxAhRG8rLJKNYQSrurZDuAn6SK5tgTyI
	 h0V7iEQ2BSzig9auMxu5QZyNx2kxzPQiDDcoJkigRFi4oHYZ3vYZpSeJOjOk3B5eMf4RO
	 6rn2wD4GkO1yg2gxadGkwrWYnhutdSmk4OivqQOiNRl6pA2+kiU1l7pztrvx0hbofYzS9
	 wlqPCfF/gkCdbvLClEizKeOnC1SkULR3lS23zeTmJYvvegGkDQyVXVCHszn6qcIwMvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Fq6FkOsr;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28BC606A334;
	Fri, 13 Nov 2026 21:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E28BC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Fq6FkOsr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=KL61sUxGGXBLoXiDN/MT8f5YU0XPMLUvi7kW1YNxd5w=; b=Fq6FkOsrggmsp8mQ2lX6leF3JL
	G2Xu+3xGCgwVm/HxXjIZr1p46QA4Y0DNs9L5+eh/pMO9xPa00hg34VjICP6NT+nePRGSSGtcKlQtQ
	Ezue9u3CwCzQ2GnRVquBzdp2q14X1kxeDvPeGKdxF0gOpn14xzH3kq80S2XXQgUBPGPBTPxU1m6O2
	nE9AXoEwNgr6ryO5EzDx3MVXBQWAfyC1ZOGlSH3tRU/heDHuPVAo2UzQbpdO321aRVJNjr/6NbOPS
	pSHVdP8WjpwznDkCCqwl99mp4RHIzy8Rgo7XrVMUPeCKoENGtkl7CTMEmQwYhjOL2YExxymHUIE07
	K0QsAYWQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Describe more of the power tree on Kobol Helios64
Date: Fri, 13 Nov 2026 22:08:03 +0100
Message-ID: <179460406460.1165597.4015563597141303036.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108-helios64-power-tree-v2-1-639ac2fc5ad7@iav.lv>
References: <20261108-helios64-power-tree-v2-1-639ac2fc5ad7@iav.lv>
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


On Sun, 08 Nov 2026 23:00:18 +0000, Igor Velkov wrote:
> Add the regulators that the Helios64 schematic shows and the device
> tree does not describe yet:
> 
> - RK808 DCDC_REG3 vcc_ddr_s3, LDO_REG6 vcc1v5_s3 and SWITCH_REG1
>   vcc3v3_sys_s0 (sheet 6),
> - the fixed 0.9 V regulator vcc0v9_s3, fed from vcc3v3_sys_s3 (sheet 8),
> - the hard disk supplies vcc5v0_hdd and vcc12v_hdd, fed from
>   vcc12v_dcin_bkup (sheets 4 and 9).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Describe more of the power tree on Kobol Helios64
      commit: 6c9bd34d299ccf3cd1374a79749f9509059f5bd7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
