Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1843525A69
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169911; cv=none; b=E/Pcn+JsmaXDEgorcS0tKgNOyKUFh7jYI96JKvJrq4imci6tMnWpZ7WUdTMvd6Z6/JM+Z7skBCCRo4lGd3N+BEhObObTHU+ECSFBZPLIGd8SJHujGxU+2c2WgnEMIrNugYJTIl6NlaWBMGDiFrTYhfyxGowS8vCRKGmS71T/RKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169911; c=relaxed/simple;
	bh=ojQNh898lyvNp90ocYGeTVX8yGY+Z6nDQY1xUg1zuwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+VO8qNkTmTxvq8PTRZs6KsgiiK4XseLrEdCN85mVED0cujtBRrR3rZ4rR03aDnjME+4qQQ5p6KtKcD/XgUMti/jQxK0QgfJvpXJ7HQnfapc+Ks11lHG8u7A3OmxqX2tiIDDs+NRVyhGqoGsITTnoepQRCHIT6MzM9BE5mijshE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=UaxTjVaf; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="UaxTjVaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792169900; x=1792429100;
	bh=sdidUHHaw9wa6g9W7a3mjfR2MSS9GT2Fsx2RaFzHYK8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UaxTjVaf7U4SI48KUi4MOxnLqzHm/hraLYRWrE+n6HazQNRkS1M0liTFs4qwSQjNq
	 VmNMp0gjwFnYYhdNXMbtzu5tRm8z0gqIumic2EWyjjo20DmstDiW9DpZ+yXcQjL+8/
	 2XXmNOrsar0M6QTf8pp461fBbsBvYtJnJX1Gmc2rRj2wLuE89QpUCOTFFOEyYqls+f
	 ou3Zao0eCzyzpJ0OcRF51Lk93g1YefbRNsgOUJQm2BIsVu+F6VgZuZP/odmsa1V3mm
	 fP3JAeEBuo8Bgk8QPsyCS+wHMJHupl3PgCX+6K+p9FLu7d8xJan8x8MiRwCSPNO9wJ
	 wFeFcRM3pxTIg==
Date: Fri, 16 Oct 2026 16:58:14 +0000
To: Ryan Brue <ryanbrue.dev@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in mtk_dsi_poweron()
Message-ID: <5YDZiRpFJP0aWb7TVPf0B1RZnD7z_d94cL8JhkMGSFrplp49jELQy6a9qKP4NsVXpqlTzh20O8pRoR0S3XBB0powa7ajhNmLIupt54ldTIY=@protonmail.com>
In-Reply-To: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 67cb0910836930895d2ef1e4849652f6d1d2aa8d
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sunday, October 4th, 2026 at 11:49 PM, Ryan Brue <ryanbrue.dev@gmail.com=
> wrote:

> mtk_dsi_reset_engine() does not touch DSI_MODE_CTRL, so whatever the
> bootloader left there survives power-on. On boards where the bootloader
> lights the panel for a boot logo and hands the DSI over still running, th=
e
> leftover value is a video mode, and the first mtk_dsi_host_transfer() the=
n
> takes the "already streaming" path: it stops the stream and waits for
> VM_DONE, which never arrives, because the engine reset has already stoppe=
d
> the stream. The panel's very first command fails and it is never
> initialised:
>=20
>   [drm] Wait DSI IRQ(0x00000008) Timeout
>   *ERROR* failed to switch cmd mode
>   sending dcs data 8f a5 failed: -62
>=20
> Set command mode right after the engine reset, so DSI_MODE_CTRL describes
> the state the reset leaves the engine in. The video mode is programmed by
> mtk_dsi_set_mode() when the stream is actually started, exactly as today.
>=20
> Seen on the Amazon Fire HD 10 (2017), whose LK bootloader draws its logo
> over DSI in video mode and never stops the stream before jumping to the
> kernel.
>=20
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

This is useful for quite lot of mobile SoCs, at least mt6572 and 6768.

Acked-by: Roman Vivchar <rva333@protonmail.com>

Best regards,
Roman
