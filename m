Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9E4119F9;
	Tue, 15 Sep 2026 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489111; cv=none; b=g6PietbA4B5iT/bWVGMpznW2vxUET1LknsP94I5O9pwAwxxLPPTQiVDjDfCDcIEatWQEkDdgaQSVAcaUv+9i9NUQJxEwviPUepaeJTfv7phgW+Hd0to92qnLQlBg2I2WJGjcj0UG90nGkpItN71AJSr89XLEMlYEkWM4G/qIPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489111; c=relaxed/simple;
	bh=xsHfdw96GFbaepBJbdXAFV0YRCZ+PaNC0b49O+JVBp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jn0VzZWh4eyjOfw6tlfAxdZheix+tqzxPQ3/Lsuk4x85jyunM31+VLUWjNaoznhYNqipySaZvhFvb0i5IOKpiPbs8wHRdqkAtWvrfwlxcurOtJgvPf117lKjLs7o2ZF1J8kcCa1CaykWB2vCR3mzFgKEoQowkB4l1fw0ocjdWxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h27yCwED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h27yCwED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3F11F00893;
	Tue, 15 Sep 2026 16:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489109;
	bh=zdMtzOEeKhZuTFoJsqIR3X1skRiJm5fGYebmf2XTqE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h27yCwED5eGU5g7CjoRIMjXid1gcL0jK0GIkjqMBQUvezag4D7EoNkuvSCEqur0D2
	 daVAKP9EZ4rnltqq1O3bZgPwu7oZPS8nB6jnIOQk0oX6i7HVATaCyQq5VgNy65h4rr
	 LBLMVmA8lx7OdSEbHtlg0JRcHdL/RCfDv4iB+HPR38r5/YcnGy5AUbNRA4v5ysSxhn
	 9dihzuIcsyXeBmoUtCp9dmFZHQHnhIo6b7LgOEvd7GubTKzN3VOSeLCkAG4WNRMyQy
	 0gFiruljocQ7QTDMYwK9+TKqxCKwaRauuIyiCB48VbWoL7wGSk1rjSF5Dv+XCOt28W
	 F09pU1HC4yPjQ==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Khanh Le <khanh.le.xr@renesas.com>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>, 
 patches@opensource.cirrus.com, 
 David Rau <David.Rau.opensource@dm.renesas.com>, 
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Yingkun Meng <mengyingkun@loongson.cn>, Trevor Wu <trevor.wu@mediatek.com>, 
 Julien Massot <jmassot@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Shane Chien <shane.chien@mediatek.com>, 
 Daniel Beer <daniel.beer@igorinstitute.com>, 
 Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20260915063317.28971-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260915063317.28971-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: Use consistent indentation in
 the example
Message-Id: <178948092653.151760.9676551205398911501.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xsHfdw96GFbaepBJbdXAFV0YRCZ+PaNC0b49O+JVBp0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqW/KhCABg54MOkosoFTzPXmeLy/RlhkivifSk
 jMcT3bipsWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqlvygAKCRAk1otyXVSH
 0LcyB/4hxF4ifiG0nOiFlkrrz1CCm5Ai3AIXbPgY9VtS02VcW230+rF+S51HzwY3b/C69z5M+sl
 E5Bz+18HBKeoMsXQemKmgV3INECe3Ea9Ar+RsVNdjlak3uOxsrweJQs3wXAmBk39p6XeKwsIxa2
 NFhIiS+s3/H5RQoltOYjzF3kbeotptgw8GlvnraZJLU3E8cvMurY4BbIb4ZdIYMR8eAYZ1TIYDC
 tE68mtQGyskHvWIMuv/9pVeHIevKetO+5V4kN/PpMhJXr++EfVuolMTpCMGWRJT/FclrHONvFUq
 MHa017eKvt2sLQlj4BPmTFz/WuSKhH6YpMhSdDizVu85Oo6q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 08:33:18 +0200, Krzysztof Kozlowski wrote:
> ASoC: dt-bindings: Use consistent indentation in the example

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: Use consistent indentation in the example
      https://git.kernel.org/broonie/sound/c/bd1041d3e1c0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

