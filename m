Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD34455621;
	Sun, 11 Oct 2026 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745886; cv=none; b=tvtmXGDDip6PqSDfsDrLw974kvLULyZgyjK5eqvzjX0fpXGZxg6YtslrJ1FYigLMouUXXNVuWY+gd9kOLbkODSMee9Tf3xstAiYcLkJPkg1oJRBpWnX1uFXjWDuQQiVce8RM4w8Q5DNraj0s+tDoFJNr/M0xVcdBZ5IfDGPV5AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745886; c=relaxed/simple;
	bh=BN1m8aRxYh/TVDnUaO3wTnoO7Rn9ELxley6ItvF27xs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=if9GX0hhxV7o83pSpuETZfGyg8pNKeUA2jh9XdndhUGvKnCiIL/fj4f2V65vPP66DVNSkCpMYGIUVUjtAwAAsMP1GYN9DsXfGSzfCSvr8C7T26J59Uz0fVgRHkzSqtdndRMpLoqeqaYkWoX6Af56bYGLZpiva9EtnNGWeTiy5Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=GfzyDkJZ; arc=none smtp.client-ip=79.135.106.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="GfzyDkJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail3; t=1791745871; x=1792005071;
	bh=BN1m8aRxYh/TVDnUaO3wTnoO7Rn9ELxley6ItvF27xs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GfzyDkJZr+XDmXWKm5wj6DeMMymt/eCCHvgAQNlMOw+IQY0859TumN9yHsO/43C6L
	 M2xNfkPfrXAcdcMAs0TzIAGtvdZIsj2q6WIVHRWu8LcXG7YAGcqNY/AD5cRgluTWNS
	 Q1XRSsgCp6WLhRUr/14QoxbE7vbGfoUixEVo6+cy147Aog1v9OLbAHCd7psRtqSMeH
	 xiNmcxMjOhl7T+Z4SES57gMIaqU8JValxH+zIT4oFG8R9YgVfZ83BSMTn2meogl0Op
	 iAngEAlPEBZLodg9X9YYbe5qu2lBZANjH3YU1owI/lnd04bh8a4N0rMgc+PSEfIy4g
	 D0d5fBsYWw6Ug==
Date: Sun, 11 Oct 2026 19:11:06 +0000
To: Liviu Nicoara <lnicoara@thinkoid.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Message-ID: <XfNxZso6VdoMvmz-65QWqKRpiWcOPX9884gflMCfOHwYyf8RS8N5phhElEsHtSF38WwbgStB4MEesQpl3XBMMQN19oZKG0M6rGN9SuuHDvs=@vinarskis.com>
In-Reply-To: <20261011184257.28668-1-lnicoara@thinkoid.org>
References: <b53444dd-c273-4d92-9502-046978303d47@vinarskis.com> <20261011184257.28668-1-lnicoara@thinkoid.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: d122610f0d5de0c683b38db94dfb11c8a09e762e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Sunday, October 11th, 2026 at 20:56, Liviu Nicoara <lnicoara@thinkoid.or=
g> wrote:

> On Sun, 11 Oct 2026 18:28:30 +0000, Aleksandrs Vinarskis wrote:
> > The initial patch for camera from Laurentiu Tudor that Abel was referri=
ng to
> > was never submitted upstream, as it depends on CAMSS PHY and DT camera
> > series which are trying to find their way upstream for over a year now.
>
> Thanks for the link; I had not seen it.
>
> > Just an FYI: CAMF_RES_QRD.bin is an AeoB file. Some time ago I made a
> > repo to keep a list of already de-compiled files for other developers t=
o use,
> > might come handy.
> >
> > IMO this comment can be dropped.
>
> Will drop it in v4. The dump agrees with my read of the file.
>
> > Windows may only be switching one rail, however there in fact a 2v8 rai=
l
> > provided by LDO 7B.
> >
> > I would recommend to add it.
>
> Will add vreg_l7b_2p8 and avdd-supply in v4.
>
> One question for dvdd. The sensor's DVDD pin is 1.2 V, so a regulator
> on the module or the board must step it down. On the schematic, which
> rail feeds that regulator: L7B, as Tudor's patch has it, or the 1.8 V
> behind GPIO 91? That decides whether dvdd-supply goes on vreg_l7b_2p8
> or on vreg_cam_1p8.

Unfortunately, I do not know. The step down is not on the motherboard,
but on the camera module itself.

Alex

>
> Thanks,
> Liviu
>
