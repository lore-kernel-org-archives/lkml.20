Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED54B2F8BEE;
	Wed, 30 Sep 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794166; cv=none; b=MaxI1fnsKLpH1ck7qqYYPhDRPBRd65K+3d/5OUmQHdPHxvQnc/bfs3CL8EWEPm5Ndw07fhiDliobskofXcgOaNe3HJXyq1i9nZbdJea9OP9QcCfdlRhdsXNmNaB+lLgD/S2H+J8g0Xjx6BwjCvrzECfvxBRJ1zn0YI5tLW78OQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794166; c=relaxed/simple;
	bh=27hrsO8VlYEdJl8DiE0jTqrwz/BBQM2oJHQJtMWitBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cO3+ZrNkLdgD0p1UEq6A4HvIS7h30zSYhtXrV8b1tcXYnntsoZBzVHaf11Owith4/xE3LHB47IYaBrMnvpCNn1g27rv5qcM1BqEUj/oIhkFqVICEx/SuG1sb/S+6RGpy2NvFtbn0P2Icjimu8aIePpFKFHNCDCw1z/fpx7114ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=uDZ7k2T3; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="uDZ7k2T3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ns09Eizq9gM2NnPJw5DNGALzDeb2i0DrDbvIrjDIWdQ=; b=uDZ7k2T3nH12rjcCI6OGpnDxkI
	dF5BOvVgtoKzSK8HGsNy5x+K25IAkUINHrBX2PGDFmT7d92X7nMwiZTwVOFsqu1YAROMxIHMLFIRc
	0+HQhHeerEAfcSx5gVww5fUzHSVyALJ4jJmBrScGC/nnpvG6gzbC0UK6c+GsJq6GFdJVfY4dVSCT7
	XH1zzciEv/zzkqw9/P0nHlD5teNlzWu2vNNVno+g/+bkssyYS8UAc1H0JZxHgouvWpLAmMaUm+uXG
	+nT3I8/3VN+StF5KqLNjHq17AzNX0LyWOMYKfgFgfapKkKeho0aayLBB3cfb4XQypBgFNhrMOy9yE
	ccnu7Jvg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Adam Wermuth <adam@wermuth.pl>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] arm64: dts: rockchip: Add PWM fan and WWAN overlay for Radxa ROCK 3B
Date: Wed, 30 Sep 2026 20:49:09 +0200
Message-ID: <179079409724.2398180.1900201056909150214.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925080258.46489-1-adam@wermuth.pl>
References: <20260925080258.46489-1-adam@wermuth.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Sep 2026 10:02:56 +0200, Adam Wermuth wrote:
> The Radxa ROCK 3B has a 2-pin fan header and an M.2 B-key slot
> intended for 4G/5G modules, neither of which is currently described
> in the mainline device tree.
> 
> Patch 1 adds the PWM fan and ties it to the CPU thermal zone. Patch 2
> adds a device tree overlay for the B-key slot, enabling the USB 2.0
> host controller serving the slot as well as its power, RESET# and
> W_DISABLE1# controls.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
      commit: afcfb6982a13fb4b3e0045f96c7aa6d64063a034

Only took patch1 as the discussion in v2 did not seem finished
and doing it correctly trumps intermediate solutions, especially
adding overlays we might have trouble removing in the future.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
