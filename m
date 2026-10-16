Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAEC3A7F68
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792184909; cv=none; b=ik8uP1zUz8ani6FY/z/cH1b7sSw/0LdPMs34wd60M4nqAD/IQZ7DPKp9rj2vtiAo+xE5RmodU7Qnb06xdCzEpD/rjrrY6emXLkmPIE7YzXE1KohQx8HbA8rw201oVxcC3dVXhgYQ6nhMPao/BKb9Fg2XqFIZpB58C7QkDqCnjpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792184909; c=relaxed/simple;
	bh=KrE5SOravJ/C6V5pdHW9BR+hI4dfQ4vjRxhukM1xFbI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e5EXA8LgIVo8TJMKiynxn2PKnYTYsuGJo/nNm4KWVNTCBdTBs4nB/w9EdXXKGKcawRHjv2rZOGStUpDuDqPJWKMH/fGqzr3Z/liapKOgJBjCS1rFETA9KLFiA/xfLfp4eqG556DA0C9IkQyd0nqLco2tD38R2quJbpP+az44Y0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=o2qiihF1; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="o2qiihF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792184899; x=1792444099;
	bh=r9Ra18ZLCrleR5NFenor5hOv0bhc8T+B+13i2FeK/Nc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=o2qiihF1OtfPbERalUoFioS6vX2aambkurECqTBmVGpRWObu6Vf9+2H0P/kynXUTM
	 v5B5QYNRdlGYFYofFW5mnTfpXz74zPO9yBuE8+AyxsUJG1d+SGGC58Gw4ENc6T7zaP
	 /avcmL97C6SbDlTkuTAAmLHhF8ud/pCnNl+rmccQhOOb2gtQ5sSA2O8GnAUJ1rHhd7
	 zO/d5W47a4Ztor0RQMjtQ5o47FQNUgI0WGLfcb6L1uS5W/V1wPXcspsXvqe9czX3Ak
	 zqhbB5Lj8YcIOwpCXKFAz+pgl/9jxSJUWbIiJ/CP5M9cXsaueDw7yk4XO0lxayx2w2
	 p30CJhyz4vCQg==
Date: Fri, 16 Oct 2026 21:08:13 +0000
To: Bryan O'Donoghue <bod@kernel.org>, George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, Simon Kruse <simon0x+git@proton.me>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov13858: Add device tree support
Message-ID: <20261016210802.60605-1-lsa.uz@pm.me>
In-Reply-To: <711e8518-5054-49ab-8432-346049a86cd1@kernel.org>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com> <19662dcc-4a25-4d18-a3bc-6b277bd676a6@kernel.org> <MauBAKkof1YpFlKvbDY7aCVPJ7mWZAEfTqh_cFY0daJOpY1UolMkV0PgU4LBc2A7dPrI2RmhQYAlVg5SLA9fmA==@protonmail.internalid> <20261016161618.209290-1-geocausa@gmail.com> <711e8518-5054-49ab-8432-346049a86cd1@kernel.org>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 80451489a5933ba06cf7cb9365692e360c84685c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bryan, George,

On 16/10/2026 21:43, Bryan O'Donoghue wrote:
> b4 prep --edit-deps   # add: message-id:
> <20260831130312.26296-1-lsa.uz@pm.me>

Please make that v4:
https://lore.kernel.org/all/20261016210246.58562-1-lsa.uz@pm.me/

The suspend test George asked for found one thing in v3. On the Intel
model a system suspend during a stream is refused by the ISYS (intel-ipu6
driver), as isys_suspend() returns -EBUSY while a stream is open. But
DEFINE_RUNTIME_DEV_PM_OPS() gives the driver system sleep handlers, so
pm_runtime_force_suspend() powered the sensor off before that refusal
(ftrace), pm_runtime_force_resume() powered it back without the stream,
and the stream stalled until restarted. v4 has runtime PM ops only, as
camera-sensor.rst asks of sensor drivers: the same refused suspend
reaches no ov13858 callback, and the stream completes all 900 frames.

Otherwise both behave the same here: 20 runtime PM cycles each, and two
s2idle suspends with the camera idle, after which the sensor streams
4224x3136 at 29.95 fps and v4l2-compliance passes 46 of 46. A suspend
that completes during a stream, as it may with CAMSS, cannot happen here.
v4 keeps v3's Tested-by from German and Simon.

Sergey

