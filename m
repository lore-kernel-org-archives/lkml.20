Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38F33E9C0E;
	Fri, 16 Oct 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134126; cv=none; b=ubDqrSjLEc5V8vzT6qiWPozlJyyq3rztVVCJo5R9ln+Nr/Ks5Oh66rUYCcJt4D722x+TQ0ygAlxLWeHBVNEK0pVFGN21fcHiAd1Kwqa+NrrW6CxKOfwBZC0OU8TNsJNB3E2IWCQe6UIBNPzKjN3NwV5JYOGvWgkI8cc6lNDT0aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134126; c=relaxed/simple;
	bh=AQi/9A/y64vKci75UOD1V3dJqNZtHvVbxX8L8DK3VUA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lzfXVa9WzeSrnIG8rzewjFB9ASlMO4xMa0dbL7O29rmTihFIY2EEa3ddIRvHLIH5JigiY0wlBWMgzrX/6jOotYsIgz95MGh8qP0gFEMeweCzX/QZhSxvg57LsrXzBv3HSMg1k03rw90Rff00ebhWYF+BHXmiBFvuPsoET1+KhwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lmJ+cQ1a; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lmJ+cQ1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792134115; x=1792393315;
	bh=AQi/9A/y64vKci75UOD1V3dJqNZtHvVbxX8L8DK3VUA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lmJ+cQ1ao7nQu/b7B+ruW03ulKndn0pRQzdBTFjQ3pF1/8f8WVyiC6AZaAilVzL3a
	 su2BcgrGBAbuiUdtXmjKgxB01ED6os85vut+nwqkoUnqL4qcd9zDcaL+6/h2rm840D
	 oZboYgHZ3ll/cbBm+RtwhN5g8gUSiTGd+nFdM2jyHb5dCwNhqMrwVRfJnDIARBCno5
	 ter66W1c65Ja8oBzT6HZ6rG8C5QgVgCzYgkq26ASuJSX7Fnbx67WRBf16Q/qMkOtC/
	 PHxgAdWzhiqqmVtye9G7nPBTUZ05HI7OWMm5FV/n/ECJA/VsM5yNB0QCGATd4t1DS8
	 O0Ts1PoUOTttw==
Date: Fri, 16 Oct 2026 07:01:50 +0000
To: George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Message-ID: <20261016070018.11932-1-lsa.uz@pm.me>
In-Reply-To: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 4c6c5d4014db768c4361150de54b0e3e231ae605
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

On the Intel model, with the power-on v3 and these two on media next, the
new endpoint check passes with the endpoint ipu-bridge builds (four lanes,
540 and 270 MHz). The sensor streams 4224x3136 at 29.95 fps, and
v4l2-compliance passes 46 of 46 on the subdev. Through the media device
one test fails, Active VIDIOC_SUBDEV_S_FMT, because
ov13858_update_pad_format() never sets the colorspace. That is in media
next's driver already, not in these patches.

Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel)

Thank you for picking up the power patch as a base.

Sergey

