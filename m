Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A073B47D0;
	Fri,  2 Oct 2026 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934828; cv=none; b=CIOiyo3kIu3Dn/mV3J9UGquPeq4qnxyr8zaHIOJHVue3ubIYya7gKZsdzBERQQPfVkPIJ2d+RGLJUV2DEsPktY1jAJ7sn8VTdXRlj1i692wGOaQqGmrlimk8LmXXL4TOeZMveAQANEwUnroZBQmsZVuIv8Dkn9B8ejxQQZB5V4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934828; c=relaxed/simple;
	bh=gBVfS8Z97pp/piGdlIkEVhWZcOZCyLP6JZH2sHnPxI4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pnmX56NPuRcTegPmTcm/Et5t/imlvkD/uUafEtUP6dvdMhVJXZN/Od0qe/L2j7ZEh6sVwDRVnx0JO/Ps57CNFlbhevdxUOQ2nOUysCPOWrW64EMLKT1MgNs61pdElah3YpHvWYK4Y7DnDMu5LgAlwV+GtGz4zEkq7Mz15B2FTMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=EqSkZGWI; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="EqSkZGWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790934818; x=1791194018;
	bh=gBVfS8Z97pp/piGdlIkEVhWZcOZCyLP6JZH2sHnPxI4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EqSkZGWIt90Bk+2itJm4JwvBaT8CrCrbwDCHBxI4k36yLUcJfv9GSWAH709/R8Gg7
	 36ANzuQJJ3qRxmHUmZV/25OoVb8oMDlmUKEvR7S1etMz3YgAoxqeEjcvTlurv8A2fw
	 R5URhN8yHmXzS97FPQPi4N3TCphgJrBo43gyLTlBofCks0lont+uDw3HoYVakM8E4o
	 PfvdCs+0urapr6L/hymmk9nhYTjhqo+0se7x9u7YB3G+PtmpCv+Ox+pO267pAKques
	 VjTcJLvYEi9XxMJO0RSEC/Kf4HHIXvjOyX+TsTsiopt7ppycxhpfMJZaV5q5XICjse
	 mWm6V1uMgNBQQ==
Date: Fri, 02 Oct 2026 09:53:32 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20261002095324.65355-1-lsa.uz@pm.me>
In-Reply-To: <20261002082537.74084-3-lsa.uz@pm.me>
References: <20261002082537.74084-1-lsa.uz@pm.me> <20261002082537.74084-3-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: e99c89fc6fe63ed71028b4fc2830343b8854d6c8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sashiko's review of this patch [1] went to devicetree, not linux-media. It
asks whether the flip controls are read here without the control handler
lock:

> When a userspace process calls VIDIOC_SUBDEV_ENUM_MBUS_CODE or
> VIDIOC_SUBDEV_S_FMT with V4L2_SUBDEV_FORMAT_TRY, the V4L2 core locks the
> file handle's TRY state, but not the control handler.

The TRY state's lock is the control handler's lock. The driver sets
sd.state_lock to ctrl_handler.lock before v4l2_subdev_init_finalize(), and
subdev_fh_init() allocates each TRY state with sd->state_lock, so these
ioctls hold the same mutex as S_CTRL. No change needed.

[1] https://lore.kernel.org/all/20261002091451.1476A1F000FF@smtp.kernel.org=
/

Sergey

