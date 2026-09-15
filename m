Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB4B2857FA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458998; cv=none; b=fooG7XKD5IW+57OQjTfXfoU6RVTIwJ+YaF0KiZwepKYzk6t3NaV4PkpW/O67Xl+h1pJ/8sbciwYLgPaRech/wfTsYqox0y4ulnSmh+rEEDMfRBNNAd7RtWVrI7qB9Q+8Qvti5BcT257EmN8A8YkgIz+yKpviLw5vsijgaL+29w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458998; c=relaxed/simple;
	bh=g+EasKO2bi7mxkYRHU6ebTWU9VqhTRqT05/QyINn3W0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxVDbyvL+h4i5oI3T65rjlIRVkPW8QD9o7axPDwGKNB5gxB8IaiIh9l+CZ1R8lZhEaZU+140xy0QkqfhtZv8YuAnmBDzyYK1R8DT4a1KaY0KY9rIuZA5rf6cNkg/SDj5Lh99PgwglipAr6+1BOJ8Qy8T87vKlGGwBxg72a9o87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=eSNe5Oay; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="eSNe5Oay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789458989; x=1789718189;
	bh=ImAhYoPtxPkBaBIuifb9Gdy1uqlzRhoT/JFuafRJqjg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eSNe5OaybYgLITbUYhA9G9W4Nwfjg1O1ZwYiHxj5HRT5JgDvs4/WKfqxuOFRz7hAV
	 wBvgwD9cRmWX0AIqdqqB6NDc+MBnV/DygJ5eOjcC5QToiSi6wrpvm+xsWNllggcWAA
	 GURFlDIS2sMYwNgPjtTrlJsPmkpb0Wm0AKaGKkUFtgEuT09yHLJIEaUph1kQx7Up2X
	 ai9cdQJjEn/8Y8cW4bvvlfLE7mbKN4fKHknQ4PSw4XVwbB60UjDGWCTBZaAMtOODZ/
	 V1XmrSXefL1g3C4v1XqMXyQ34bbyiSBpRcb/Pc+gmu43y0Lg+vpQt58cY/C3jjE7IQ
	 wslZffBbZ9eJA==
Date: Tue, 15 Sep 2026 07:56:24 +0000
To: Fernando Rimoli <fernandorimoli11@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: Add upside-down sensor quirks for the Surface Pro 9
Message-ID: <20260915075619.96025-1-lsa.uz@pm.me>
In-Reply-To: <20260915000140.47125-1-fernandorimoli11@gmail.com>
References: <20260915000140.47125-1-fernandorimoli11@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: dbac799915a13a26dd2d8ae6fb4347d87e51e3b8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Two things your commit message says are ones I have checked on the Surface
Pro 11, so for what it is worth from another submitter rather than a
reviewer.

That nothing in the bridge turns pixels - measured. One static scene captur=
ed
through libcamera with the property at 0 and at 180, vertical brightness
profiles correlated: +0.995 the same way up against -0.781 flipped. Asking
explicitly for rot0 with the entry in place makes libcamera answer "Camera
configuration adjusted" and hand back the same frame - it tells the
application it cannot, rather than doing it. That was on a 7.3.0-rc1 built
from media/next with libcamera 0.5.0, on a Surface Pro 11 for Business
(Intel), firmware 17.105.143.

What happens above the bridge, which your last paragraph leaves open, has a=
n
answer now too. German Pablo Lindo tested the SP11 entry on a second
machine. The image is correct in Gnome Snapshot and in Firefox, and still
inverted in qcam. His reading is that the first two take the frame through
pipewire while qcam talks to libcamera directly. So an application that rea=
ds
the property does turn the image the right way up; the one that ignores it =
is
qcam.

That the entry only fires when the HID matches - read rather than measured.
ipu_bridge_parse_rotation() walks every DMI match rather than stopping at t=
he
first, and returns 180 only where acpi_dev_hid_match() also succeeds. That =
is
what makes DMI_PRODUCT_NAME safe for a model that might have shipped
different sensors, and it is the same reasoning behind the SP11 entry.

On your note that mine no longer applies
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

You are right, and I would rather be exact about where, because the tree
decides it. Checked today:

  media/next, 27953c0449        table ends 960QHA / OVTI02E1    mine applie=
s
  mainline master               no 960XFH                       mine applie=
s
  linux-next                    has 960XFH                      conflict

The 960XFH entry is Felipe Calliari's Samsung Book3 Ultra patch of
2026-09-05, which has reached linux-next but not media/next. So as posted m=
ine
still applies to the tree it is aimed at. It stops doing so when that entry
arrives there, and then it wants exactly the one-line fix you describe - as
does yours, for the same reason.

Thank you for raising it rather than letting it be found later.

Sergey

