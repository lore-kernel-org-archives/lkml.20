Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047437;
	b=aT7iW6ycaWWw7uyHtXkBkyZ+7Sr1cYajVj9gNhrJlDt0mvFCzjup0tG8ub1mm3JNk21z
	 B3Kq2oVp+nfWqdgTfwxODXHdFaZW4DZqVfXT56xNLWXXC4FgmOAL6x0ieh+LMw2RC+lCD
	 0r6vWOCEv8fsTIHfREAzMgNx87GiqaAeNcOzFteGfmtBWge6amzb9gJJAxoEeyvIczBC4
	 vaDFOcQN4wNMNfntyQTgrLFM033qb7Ppwctj1sOFvhKBJ3MeXQbb1i72WDiVivEU1UX5x
	 Z9UHy1uvGgXqzxSuRvIQ2JAwJYDlYqWckFVcLGn23tcJQm8x9JNbOqofDoNFVXlYgqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047437;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JCvFwhWeuBSmPCx6/gJBF3WOeNEMn6DFI6aoPU6jfN8=;
	b=Y0hGrDeRicbM7NH9Cu+EWzbrouCbCtHQMwYxpCnOKQo5pGGDV3hSDFZLLGc+JTOVKV+/
	 vCCHDXs7RGIESRhaa6yrBNTMPpwyOFNeUhiXq4YqsuoX6ximw+dOIc96yxkXYTH1XszJs
	 OEVYNRuxoXaNj0VTya60C64thchGdHd/FWKv1pAFTS8iVbXLvh1CDDD0riulGWW/QtxrS
	 BpXKJ4o9rTofpF79ERzNjpBwV6L9WHjr2BnlGsfO6f8M2Edb630W9It3Jg4lWluThkrc1
	 eRn6MU8N/yLGdeqZQ4yYYE2/WEHY+FA6cWWW6g3Yg7oRUyk5I1tkRcu4LNsSfkjgKOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HoxjQMEE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3040B606A31A;
	Mon, 26 Oct 2026 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HoxjQMEE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9DE1F01825;
	Mon, 26 Oct 2026 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793047436;
	bh=JCvFwhWeuBSmPCx6/gJBF3WOeNEMn6DFI6aoPU6jfN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HoxjQMEEDEuwwdewkulqVqK9RqITwba+CZXZo+lW76cFRJhEYh0pFkWQB9mFAw9aH
	 ixczoQMztwZsBCgX3SFi86LS+O8YBdbpfCbRA3IyQY6Q7cp+GW+KGcXgRPMQlclA3c
	 7H+WtP+WEXp75Wek53j0sA5FljNDn1en3hbsP/3u7IGnJfz0ig6PHTZqDm6Ez0nBKd
	 sKyZjM/1Qyx9r49eMqZLYwoLH7hV8PhDnwN5jfsqwW5neBBL/oo2IWLiYktV4jQDyK
	 7JOT9VcEtjztTvcKeIEfi7ngkPceQJ/hpUPFK2eTXwP245yEcbfVt7ewZMBAARERsQ
	 bCu6AxyYpQw9A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E2A741F286D2;
	Mon, 26 Oct 2026 20:43:41 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Juan Benedict Tanoto <juan.tanoto12345@gmail.com>
In-Reply-To: <20261026112137.257723-1-zhangheng@kylinos.cn>
References: <20261026112137.257723-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for HP Laptop 14-em0xxx
Message-Id: <179301733925.199157.2674683706439433125.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:22:19 +0000
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=itgCQRMcTh9OLRoOUPWD47W38ufnklImM7T9PWGcNPM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLu7641Cc7fajHtnuR8ORFFifu/Xn2bUs+c8WSpyW6PH
 5bnrLJ/dJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi2yYyMrSWXJFnXs6nf+dl
 8anZ28xjavnrqpVunk3XUI6oE7727w3D/yoO3y/cYlWGazJL/jzkTt8SktxaLbTCd6q0bNjHNXP
 k2QA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 19:21:37 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for HP Laptop 14-em0xxx

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for HP Laptop 14-em0xxx
      https://git.kernel.org/broonie/sound/c/9080b18ad561

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

