Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2953DD532;
	Sun, 18 Oct 2026 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345611; cv=none; b=aFfRdvn2ThWaoY0GgYCRdk4xBwLLWuLy8GMHHgA/fwJz0unTF8FBVCf9yX7tZgKacCBYx6tKZrmizktyndmTtVYkm9RHZDY8Spf44J+mk3DDjKTTxsSkgFnHTsXT+r0JnUelvCrC37tydrCsYEp/M/8TDibnl9q3FpoG2Xv+ZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345611; c=relaxed/simple;
	bh=IbT8SVwvSYBBCTFESIc2KDm/QvSO2/KtgP4EGXiEp2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cIdn2pOkiZJfE23RurXjlqq6tbQhkBemMdbZCfcwrtpwPrNXWI8A+wBdyBt0nmjzIoWJJxf7sTiu9SC6nW4s8i3xZyvWOSICGKBrUnX31bG7CPh1RDXdZnX/CCR6ev4g+PY5nJvabkKP3jQoBtCXNajNNtZVAYdbhLYgSjodHo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgnkizFN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgnkizFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A623A1F000C4;
	Sun, 18 Oct 2026 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792345609;
	bh=qm0bUZ3rcefAzU93QB8wx2LCgCq+YoUpSKzCmzw8aJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MgnkizFNOowWE0evXr5Uh7vD+jPSO/gov/FeEK/pjNv61+X6+VimnKiL+gqgPhcTs
	 /CMiac64dU9bA9cVg+BtlqJVWkEqvDLka/3h4Nm290GCXsZ/q/+R78ZTxGq5JcaRqC
	 65QcxFTZ7f1Msa1P1CPR7L3Sg7c+AMXBDaQoDpuCYzDuE0w+sR5tWuFMPuHzyJBx3t
	 Pf6JUV719A+lnO1EXjyeqCIr5hTwxP275HOPCfkVWguVthrbUVj4EhQE4R7UjmGg7g
	 B7BHLbKEtecZPWwidrdGQiLbtk6ICAo/FHXjg4O8qImalzZJiNj+KBVK8fn7rZp3Ze
	 pJocK/ZjMhiTw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, phucduc.bui@gmail.com
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
 wangdicheng <wangdicheng@kylinos.cn>, 
 Chris Bainbridge <chris.bainbridge@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Neo Chang <YLCHANG2@nuvoton.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Hemanth Selam <hemanth.selam@gmail.com>, 
 Md Shofiqul Islam <shofiqtest@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Zain Aboobacker <zainaboobacker33@gmail.com>, 
 Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 00/11] ASoC: Address remaining PCM constraint issues
Message-Id: <179218517604.3162228.12724790769290148003.b4-ty@b4>
Date: Fri, 16 Oct 2026 22:12:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IbT8SVwvSYBBCTFESIc2KDm/QvSO2/KtgP4EGXiEp2k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKusq6VV7j4Q+fT+tV8Vk/qHp+cEyB9TcR7+6xfMrncC
 cd6DjL87ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBERF8w/I/7XJ85O8xAc/Hn
 nbNu/1105pQVi4Gyd/41ga2VX2ew9MYzMjQYSM+fFbll6zJbMxubowlLrefOfC8z43y7r+I/4eA
 5/7kA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 16 Oct 2026 11:09:35 +0700, phucduc.bui@gmail.com wrote:
> ASoC: Address remaining PCM constraint issues
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Since v1 has already been applied, this series provides incremental
> changes to address the remaining items from v2:
>  - Add comments explaining why .open() and .startup() must return 0
>    on success to prevent the issue from being reintroduced.
>  - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu,
>    and Acked-by tags from Morimoto-san and Cezary.
>  - Remove redundant integer constraints already applied
>    by snd_dmaengine_pcm_open().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/11] ASoC: amd: Explain component open return value handling
        https://git.kernel.org/broonie/sound/c/1ba2cb30eeab
[02/11] ASoC: apple: Explain DAI startup return value handling
        https://git.kernel.org/broonie/sound/c/ec2e1434c7f7
[03/11] ASoC: atmel: Explain component open return value handling
        https://git.kernel.org/broonie/sound/c/1554ce7a5d99
[04/11] ASoC: codecs: Explain DAI startup return value handling
        https://git.kernel.org/broonie/sound/c/a6b1f3ccca48
[05/11] ASoC: imx-pcm-rpmsg: Explain component open return value handling
        https://git.kernel.org/broonie/sound/c/f3e3dbbbbfd6
[06/11] ASoC: intel: atom: Explain DAI startup return value handling
        https://git.kernel.org/broonie/sound/c/2f8d93394b7f
[07/11] ASoC: renesas: msiof: Explain component open return value handling
        https://git.kernel.org/broonie/sound/c/394f91bd0f7a
[08/11] ASoC: renesas: msiof: Remove redundant period constraint
        https://git.kernel.org/broonie/sound/c/d2f4c848d010
[09/11] ASoC: renesas: rz-ssi: Explain component open return value handling
        https://git.kernel.org/broonie/sound/c/65850cb2f9ce
[10/11] ASoC: renesas: rz-ssi: Remove redundant component open callback
        https://git.kernel.org/broonie/sound/c/a0b64de6ea7e
[11/11] ASoC: rockchip: Explain DAI link startup return value handling
        https://git.kernel.org/broonie/sound/c/48ed45aa30ce

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

