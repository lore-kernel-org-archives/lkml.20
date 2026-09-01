Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392C39CCFB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255190; cv=none; b=Up0M9UZd0RlcSTmhqJw8AZbCQciyAIidCA+RtMQAxJzX267s5F523CS18qAgrOI7rBxINJsw2OPh57URcmFY32xGeZioilljR72TWSCAktMqJszI4YTHyuxaxA7nJm3Y+He/a+vjCZAgin0dvFTzcOnwvVoHUY+tn0HdrOOdlSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255190; c=relaxed/simple;
	bh=6KK5fVuZ9z6P/O16flYCyD75zx66yzmdh/CxjeG18k4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+N1untFE36O9zhBjlaLdezz927tf5g6LGRnb2iayWLKHNdUSpW6Mtq+MvXdaWv/KqO0n9I7nQwsqiJlqeyvP1qCJT77g8mfmx7zqVYvv+ZRcpvG7qZqPmIWRk4hN4PDZYl7dqSTWuOcB25SIGVYiq6GTQqpfH1XQJHvc0ocNuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=X2+dHXhU; arc=none smtp.client-ip=79.135.106.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="X2+dHXhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1788255172; x=1788514372;
	bh=isvYCq1bv3AzVbla2tsCwq5Mgf8zk6gHrYmACgX3Btw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X2+dHXhUS+psyfmcxNGSYwnDBpPO2GNi2/4IEGlap3M0MsxO9X7IBxH6EjGSe1mTP
	 Eo0x0M6hvhstJagHyFpH8WG/Noj3qObHM2cn2KhBBlbJburYtCXBq0sW7GFR8SyLje
	 M+EjqXpitrGmrikpTUuLA8Qu076S/ETEWrlBqZ+FR/IXVvDplULgolFanhUt7xDdpc
	 2s0yHUFINpwEnL2dfYpUxTKWdeCyfmxjbnV4Q3+X7cyGp197IvA/jHLMkB/cT04y5Q
	 YFUa4Q6L2hz3UuL/s23H+J2ZEtp7VQyJ1NbRjKYG4pE8y0+clgaYiqWZu+lbdQR4CW
	 Jpm1Fbl6qPcCw==
Date: Tue, 01 Sep 2026 09:32:46 +0000
To: Fernando Rimoli <fernandorimoli11@gmail.com>
From: Jakob Berg Jespersen <dev@berg.pm>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Arsalan Naeem <naeemarsalan@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Message-ID: <zDaw-AawkcNfIRsmWXbsPx2WDcg6ltaiPc7FZZTNp7DH-ACLsF98A3QDuuhX4iejr2-VLQYf48c1cingAI4i58i4t2dD4t45SfHr5d4MeOM=@berg.pm>
In-Reply-To: <20260831181858.325109-4-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260831181858.325109-4-fernandorimoli11@gmail.com>
Feedback-ID: 210104851:user:proton
X-Pm-Message-ID: 21111f53b0e328d0c45a6cf12b2d749b29ea7ce6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi, just did a new test, see below


On Monday, August 31st, 2026 at 20:19, Fernando Rimoli <fernandorimoli11@gm=
ail.com> wrote:
...
> Parse the "clock-noncontinuous" endpoint property (which sets the
> V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag) and, when it is present, gate
> the clock lane while idle at stream on.=20
...

Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, IPU6 Tiger =
Lake

Retested on the Surface Pro 7+ now that both the value and the mechanism
have changed. This covers patches 3 to 6, so it exercises the bridge
matching on Tiger Lake rather than only the register value. Patches 1 and
2 are not exercised here: this machine enumerates the sensor as INT33BE.

Both kernels are v7.3-rc1, your base-commit, differing only by this
series. Front camera, 20 cold opens each, libcamera 0.7.1, full
resolution (sensor 2592x1944 BGGR-10):

  v7.3-rc1 unpatched       3/20 runs delivered frames; the other 17 ended
                           in "stream stop time out" with zero frames
  v7.3-rc1 + this series   20/20 runs at 28.64-28.65 fps, and one run of
                           600 frames with no drops

Reading MIPI_CTRL00 back over I2C during a live capture, on both kernels:

  unpatched    0x4800 =3D 0x00
  patched      0x4800 =3D 0x20

with 0x300a/0x300b reading 0x56/0x90 as a control that the bus and address
are right. So the bridge did supply clock-noncontinuous, the driver did act
on it, and the read-modify-write set bit 5 and nothing else.

Two things that may be worth having:

The unpatched register really is 0x00 on this machine, so your argument
that the whole-register write and the read-modify-write resolve to the
same value holds on Tiger Lake as well as on the Pro 9.

Zann580 asked on GitHub, when posting the 0x20 row, that the minimal=20
value be confirmed from a built module before the patch was narrowed=20
on the strength of a userspace poke. I think this does that.

(Surface Pro 7+, Fedora 44; kernel 7.3.0-rc1 versus 7.3.0-rc1 plus this
series; Tiger Lake IPU6 8086:9a19; ov5693 as INT33BE; libcamera 0.7.1.)

Regards,
Jakob
