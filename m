Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F344E80A4;
	Mon, 31 Aug 2026 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183616; cv=none; b=tXLNijh3D9Wh56/ak/6KJT3ZCvpF6nNhnAvu1hQwX+2KqZjhiQZ/uSXVtOoGLu7N3uuJ1if8SiT1dOmexSThuEsd8JvRztfOxxYP0BA4FfXRiBmrfJPfLy/PGMYPP4dl5sVHTiKNMPTV5YSXaDRUywir+9ZAriyG/Dp4OEJtfFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183616; c=relaxed/simple;
	bh=t+z3zCB5eiQhg2VqeH6k4J/XtDVvvQo68xmZbiUMlXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjKs9k799cSBlaQPLgjgeonMGO2AMd0KgVO035ztpxICIpfxVQlwkd+BKpxF5lHSX/Hfh5I2fDT+V/hqEv15H1Foq3BvMUjoyQzn7igiUly6CZHCvfQUfuMlUBITBtL4I8KXFEIyFpqIH/gTM3gSbMcQpjmGkcUj/djI09Ywi20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=w5PNVfsL; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="w5PNVfsL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=M6/gR54E6oPAO0ZYT1ptCwiGgBWPwLQA/I5bPLxrvok=; b=w5PNVfsLQutLaDVN/Qm19wDlSV
	A9TfBbyADHaddupHuqdj2Q6ru9HkuOwORabxepobgQEapNPiPwukZP6IL/YaR5sWFPF8gwwVM0Lz6
	uKB8qKh5SGClm0DMv5Hfw/XPbB5oPmHQ63NJLY4+Uo7ZgeMrUxHp4AlisU0Ah//FVhYSPqTQEjhpM
	5azymwbDRkt9phrcfE7IQPbOzGQKqufEuDqPhaLVMdd5VowaACZJu+lbpNRtfWknlEKUYhKmFrCgQ
	3SSIrzlOD4nB9fGcerhD+pncf2WQq47KF5PW41PlH+ldLWkpDo/IDLkr7zd+EmNE+laC9125J4uN3
	oHwl6mGA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amin Gattout <amin.gattout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: correct rk3576 SDGMAC GRF reg size
Date: Mon, 31 Aug 2026 15:40:00 +0200
Message-ID: <178818359737.1934409.16083582780928081843.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820-fix-sdgmac-v1-1-38e8d222b933@gmail.com>
References: <20260820-fix-sdgmac-v1-1-38e8d222b933@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Aug 2026 16:25:53 +0200, Amin Gattout wrote:
> The RK3576 TRM lists the SDGMAC_GRF register file as 8KB. Adjust the
> reg property size accordingly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: correct rk3576 SDGMAC GRF reg size
      commit: a3827558c623db5a4f7033f3cffe214577470df9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
