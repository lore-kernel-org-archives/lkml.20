Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE41A3E51F7;
	Fri, 16 Oct 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134027; cv=none; b=UGq2m8kvxZpPGbaErrmTgE00FN0sL7g6CA4+0HxhvJ4wBy8GT24AhUrd0DOXn8AOEapPZeD1ATohfyZfznsEcoiaIwav5MiixjzaODH9VxXWZFogn8peT83zd/ISpMSpFtFZOwTiu5uTLPt5GaYyncTyCUnKJatWpEjHs4CesMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134027; c=relaxed/simple;
	bh=XczG4FV9MSpDKn/SsVQXz1gX8fELT27eYZyjGxzjG4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOVKE2pV6gRVuw+pxyWeWPY1Gka3ouRpbsJDAmKpQqXTYb6SI54wPOo4kHY+qeK4My/Y7T/NgRaHhGYiHni+wUgzMfFojEVf43C4DXwCMGQIp+6WEwW0VVcKIVdjkWnQPZwxO9/x0l5h2VZpTtbTGxYh38U5kTcinDlDw8YhJTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=MWGkroIV; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="MWGkroIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792134015; x=1792393215;
	bh=XczG4FV9MSpDKn/SsVQXz1gX8fELT27eYZyjGxzjG4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MWGkroIVCIqjLXi2jAk2/G24ds14Etd4N06az1kGD5RIrrhIVsqqD+JBvMSOfXJQT
	 f+nag5mqOKcxIOKCCKtzMiwRK4uKPpHYuHlMSLS/JYpHAsOSc+i+Agb7PLPr/u30Hl
	 WQ9HqjHWdNz0eQP2FSbqcsIODbw2O022TvgOsz3k1A1pcRxHgjItb1LEdyjMVFJz11
	 9jqemDCp344ZHlqq51+/VrXPGjc40weUam+96XvpumpUbUZa23d9BxMDABBHPqCy5b
	 r2f0XKZ+hsrcjtydv1XiUUneK7hV0e/AVp2a6IMgE+vsByBAE3k2a3HCI60SfCebTL
	 RKgvnkVYw0Eag==
Date: Fri, 16 Oct 2026 07:00:00 +0000
To: George Neacsu <geocausa@gmail.com>, Andre Gilerson <andre.gilerson@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] media: imx681: C-PHY for the Surface Pro 11 (Snapdragon)
Message-ID: <20261016065952.11638-1-lsa.uz@pm.me>
In-Reply-To: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 9631ddfb1ea563b271d2dfd76ad141b952cd9ab1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

Thank you for this, and for testing it on the Snapdragon model.

The D-PHY path on the Intel model works with 2/2 on top of v8; 1/2 has
nothing to check on ACPI. On media next with IPU7, the sensor streams
3844x2640 at 30.01 fps, and v4l2-compliance passes 46 of 46 on the
subdev and 54 of 54 through the media device. While streaming it reads
back CSI_SIGNALING_MODE 0x02, CSI_LANE_MODE 0x01 and OP_PLL_MULTIPLIER
303. CSI_LANE_MODE is 0x01 here without your write too: neither v8 nor
the driver this machine runs daily writes it, and with the latter it
reads 0x01 while streaming. So writing it changes nothing on this
machine.

For 2/2:
Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel), D-PHY

As for how to take them, I would keep v8 as it is, since it has Andre's
Ack and Krzysztof's review, and have yours follow once it is merged.
Andre, does that suit you?

Sergey

