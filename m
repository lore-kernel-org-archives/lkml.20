Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BCB47424A;
	Wed,  2 Sep 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347507; cv=none; b=Un3Kv9LQiwwnTbGWUigd+g7qw8RZI9PrKr2qz6L6jmSqdqkfsolwCrR1f4B5q/e8TPY2BU6nB7N5aeCTM6jt0inFjZo+DMuifsr0IzqkAkQZjyl0uHkjHMK0Eeu0dCCwdm7GuFx81ODMBRvqCiD95nyar4YkJ3aA/z/iyVw9nJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347507; c=relaxed/simple;
	bh=7E8JJOBC0pSp1XL4NavfYbOLHqbLj6dqXOypQ9bgWtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnXF3eCmjJDxhWZV3nTL7wUMnklvFSH1e2IzQCczooakssVCO0A62Gos9S8WKSjmd9YfL8b4bTJiX/zpz7aWuzCn4pZ+uxNxkJuwjNEfFHEuzXhrymCPckgdXIqab9qWjLZyTyaTV4HSODY1k9NK8yJRomL/sUi/OCe0D7Jfgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vzuvRbPS; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vzuvRbPS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4iGP/Ny9qyvWjshmUHMb/d+fjjArqiKV1JI8S/MR9aE=; b=vzuvRbPSPVB7yq5nS3DhOwU7AD
	gBLhpL5R5LnB0zpx6QRH3wXweGs/tI1/16Yl6g694tKHQhG6xBeeFbsjeTg+ZwRSzEliu1Wob+soq
	w6PYTNrOtBDOq3Uqc92FKqIhaCzk2HLg/EdctgajR/RwozKPtBDDBgt8IuWTq5s3AQQnmto7xjfyN
	uhuEQHNJtyg+mefUarInL3gKp+QE1gsu9Kc9MdeE/U4BPILnW0eRdE41Q2rRFnQhutd8nss+rgu1W
	vDxTdti9nR3iN3HrDlxEMWEFxJ5HRsR3xhJuGbNrImv+n/29pMx5Wp/vFaovHvHzS9hWnnQQ82N44
	9aOq03pw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cunhao Lu <1579567540@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add LubanCat 5IO board
Date: Wed,  2 Sep 2026 13:11:11 +0200
Message-ID: <178834747219.2268650.13087919588318622991.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_E56643A62E2161842C400BD1D30FBB698B05@qq.com>
References: <tencent_E56643A62E2161842C400BD1D30FBB698B05@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 23 Aug 2026 23:46:53 +0800, Cunhao Lu wrote:
> The EmbedFire LubanCat 5IO is a carrier board for the LubanCat 5 BTB
> core board based on the Rockchip RK3588 SoC. Add devicetree binding
> documentation for it.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add LubanCat 5IO board
      commit: db7e3af507ea357d69116c3b785c5ce3b17428c2
[2/2] arm64: dts: rockchip: Add LubanCat 5IO board
      commit: f7b576f3535665840709efc85a5e2ebe6abc331c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
