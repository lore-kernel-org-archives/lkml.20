Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604096;
	b=r8g3gVHQBawy5lJOwJdXLzkQ2NbbeGNWcB2ykZv8445oBrSSVR+0ANpVbX/S1U77qZJx
	 0ewohmzyU3ijydcRFeiEn5P2qIoIuzFGAyUNR581Gd+ZYvgOA4TwaBfFamdu1NDQB76Cj
	 XyXFBZZYkS+hPVafSuVJ+uU+drCPfxDiJjygEkJvnVckZRev7gbm0ugFizxPYq3BZv+ew
	 hokp3Ai89XGyZm+tLOnqrJcAG4joRW5CAuClQ6RdkJqF28wy5RB8MB4gbZua+xG15lMhO
	 zqGXNJ5zR13uGdceaknnL6l9z1TvfeDwPhgGstcMrBfbW6HTTRhglCI96hwMyGZ09kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604096;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r2gkPj5kQuz9YqUKX4TJeW3u1cPMLY58iyNWLASDipA=;
	b=3gggC68cShevvXlu70HW2mh9UcM8C1ZcXd60rRGTkgL1E2ChThfe/eoaub7Id62/LU79
	 6dpztkwM3N6zAOEvvTgC/IYF+CWm99WI6c8db0LBRIap67DsyUYT7V87GlpxMPpQ9Msyz
	 j36CtIbpNq+lj7jvH4khzFniLk5YxXsRQAWmXFvuNko8u/hB37FBUFp3zsc/+KXJx/rmc
	 nYFHb1N1VHkgaQ8PSq/Wc1LaOjw62Gwic9TUkWfyLVGi+wuwG3H0Ip5fZEptcYDKK7QzZ
	 ToSwvE8DRGV9CtBdFu+XogOWLJkzhVsX4L1ZQQgEzHEPZpv/BHIeaCntpKkkCnL8POg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=p5fVi0mu;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A3606A331;
	Fri, 13 Nov 2026 21:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 474A3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=p5fVi0mu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=r2gkPj5kQuz9YqUKX4TJeW3u1cPMLY58iyNWLASDipA=; b=p5fVi0muYoS+ENLYrw5ud36LFT
	zNplE/CmOFckyyUm2RutQKe3KeivclMTP411SN74kLmPsSZyrRnXVzj5lhcNODYBQnLs9gEWfnJGT
	vs9U47u3fqEnX7AKgU9o8Dinud+QKqrMI4w7Db0U1IURk9Bf/QEdn7d0mDTnXp2cIWrV5UN2THIWx
	wZXE8+k3phwgqIqyZVeEZOwh50ez2GUQcPEXs7Lr0TS5uF0VZYf7oThAaYjEGy4XI7aj+7/p/LHF8
	7DUetwlOmWmNhtfzHxD3xlvmyKknn6zRwyd6/leWm/QRYGe7TGJBRYARx5TG/s8kgBXcVhjOSSIeG
	hdM2yO2w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com
Subject: Re: [PATCH] arm64: dts: rockchip: Enable all CPU OPPs on Kobol Helios64
Date: Fri, 13 Nov 2026 22:08:01 +0100
Message-ID: <179460406461.1165597.1626712698379788020.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108-helios64-cpu-opps-v1-1-31aa4afb7eb8@iav.lv>
References: <20261108-helios64-cpu-opps-v1-1-31aa4afb7eb8@iav.lv>
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


On Sun, 08 Nov 2026 22:02:51 +0000, Igor Velkov wrote:
> The Helios64 device tree deletes the lower OPPs of both CPU clusters
> because the board was not stable with cpufreq.
> 
> With all OPPs and regulator-ramp-delay = <1000> on vdd_cpu_b, the board
> hung about 9.5 s into boot both times we tried. With 40000 it ran 40
> boots and three one-hour DVFS runs under load without errors. We did not
> find out why the slower ramp hangs.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable all CPU OPPs on Kobol Helios64
      commit: 30eb5fd93649928b9e4149d24fa182c8521fdc20

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
