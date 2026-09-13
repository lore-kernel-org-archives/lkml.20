Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFE12F3C10
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332494; cv=none; b=UtZGdU7IzNbuWX63J7lC6HjvikS0WV/1Ofd+r+RCPN6vY+ZK7bCC8hRiW/h0hybLD0+BOZdB6hfg+3Kc2/ZH8CE47Ye/nOwD2XxK1LsQH4eoxEIV3YTc3yps2XPEYmPx98PFCNKCGeeAgIK9DuWkCm/SPnGXJKqb2fWFF66RYeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332494; c=relaxed/simple;
	bh=OgWpSiiCVCMjd9MVKoGzYwMWmRA16L6acE9L1x/mWLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nk/rEIUMCs8HFx8FsA0O74kcpQRs+d36fnETyM+DdSzEW1t4ZzVX2dDAVzvmMkhKQgIrguPAAk99QA7am3evhrZOrA7tErfcywULf6T6CXT/P4PAEr7vzvqtFnZ9K8RPm/N82vq2fFmtg0/atW66M82ZjQMqFPe7aBj+zudKQhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=K0bvKXJ3; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="K0bvKXJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789332490; x=1789591690;
	bh=h6XrpRnkTUfqGJKJLmJAqROSOGkj9wyvgoWBb6/XIbg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K0bvKXJ3HoYYpQkJQGXtlcan56dmk6xMsAu401uvBSIjfKb6mCpPO2Qncr85CeyA0
	 KnP9/yNAJbuITR9UCkuQJD7WoYuw6jgcEFpLG19NhQNFd/D3lFvgCPUDEZ1a6kV8VY
	 rsj+QmUBcvie+1Y7KIe5wbvtyT8pFl7x2xLj6Rt7h026OhkCjVDj9Z/HVMV91y245v
	 SNeBFCCZFsA++hOrG6NXZGoGTai/uaSPLmKSlJbEwykdhVZyGk1b/3XWtY2WAYstC8
	 oXUbAueG8a5nEU6bLCZV5m+X2C8zUqgxMn8LTm6cJwcnmK67fPu/kHzsbQ0hQDKY9r
	 iU+KGV1oTTa6A==
Date: Sun, 13 Sep 2026 20:48:07 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov13858: cap analogue gain at 15.5x
Message-ID: <20260913204759.85961-1-lsa.uz@pm.me>
In-Reply-To: <20260831180746.68878-1-lsa.uz@pm.me>
References: <20260831180746.68878-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a10eb1aa193f3f5871fc3f75077001e528aa47b8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A ping, two weeks on:

  https://lore.kernel.org/linux-media/20260831180746.68878-1-lsa.uz@pm.me/

It still applies to media/next at df9e111016, checked today, and nothing in
it has changed.

Two things around it have. An ipu-bridge entry for this sensor is now on th=
e
list and has been tested on a second Surface Pro 11, so the OV13858 is abou=
t
to be reachable on Lunar Lake by more than one machine.

And that second machine exists. The measurements in the patch are from one
device, which I would rather say plainly than leave implied; if a
confirmation on hardware other than mine would help, I can ask for one.

One note that is worth more now than when I sent it. The gain table came fr=
om
raw Bayer at the ISYS capture node, not through libcamera, so the GPU debay=
er
fault that has turned up on this hardware in another thread this week canno=
t
reach it. The luma cross-check below the scissors did go through the softwa=
re
ISP, but it compares before against after on the same path.

Sergey

