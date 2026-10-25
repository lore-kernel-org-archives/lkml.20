Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792949926;
	b=Y7W4e+Dy1vsR8tTiO5Fh24uiq0zDp+Hg8DRbZIfM0I+VqsQ+L65m3d22I2EMg1yKXvS9
	 dZPNVeg9R0Y7HchX/NCdAB6j2ujNFZFSo4vyhi3kEzjDodvpBvUJD8MPUcT45nlQ0bFvQ
	 ueyY8UpyWCElGdLMrIwbCzd/N6524wWnoY51Cbl7bAQDOKhZcQSDvydEEymue05sIocI1
	 V9oISKmn+HspEBalB9qCy4mCDCSbVYNkV4s2/1Qo/7wjwVb2qyT7s6hgDYs3/b2VbTXL1
	 UGO0JQsaQGPB9FQH/50Jb003W7KIzX3/YYNuUNnLnRlZPZVdAV5f9R7VpGEJqoHU/hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792949926;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=YghpuZTDCdx29fZaAFItxmF6K31N3RPtByLlIZAXPfg=;
	b=cPqQbMYTpKsNZNco0E/ChGJHH0nrUhsAbKEHRe8JAp3UPPxUstsoNDMAx2VcpSryTXMi
	 cazMUNQ6h1l+qmZUOEzPP4v7ndwAPhNF6lygv/t6Kc0YV9qcmRdPeAts4ysfqaM2IeWdc
	 2qZZp/t49eya052HeGOHdTWSLmWbWNz140VS1cqjw33Ama5lrZ/40khxNk+/uCQBQzDgZ
	 W2ZeKbw/JT0/Rwrny8e3+Wqr6d8N4Qm0dR95jMXXhN5lVj+f3mHvJOMGvdAXA1g6gOddu
	 FuPVSc3/Ohd1UF/dqO04UbrITzC8SWA970tnnM2XpWN51ZX59HOxdcWzUm0O6moZF4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=g9hZUfNa;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2646606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2646606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=g9hZUfNa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792949923; x=1793209123;
	bh=YghpuZTDCdx29fZaAFItxmF6K31N3RPtByLlIZAXPfg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=g9hZUfNaVRHnqqoZH2oZmdHojuXRteiL7zmiKOogfOpjabWSIbsSrrTEEpOAWeTkh
	 mVvnJQmibJEHwA+sZ6nunavTNWBt4z14y6Wmt/CIQ0R2VnnKwv4Fc+4UzD32nACfLp
	 +DLx60dLerwo6VexhdDJrD8JQsr2U/SSHdp9RX2+4BFW3aYQlRNEGTRiXWpBetYFTD
	 X+ndfjrLKUkKeCvraog4t4keQ6hkxo2ZKd9M0bEefxiEd+uBlDystDNz1FzxpkYN8Q
	 /mmkNxD0GDIvHcELRM9lhui+84Tuq3oj8gFjBAJrW+plmXak4TpOY0YHELdlkTgwE9
	 4gIMKISP9c1Nw==
Date: Sun, 25 Oct 2026 17:38:35 +0000
To: Fernando Rimoli <fernandorimoli11@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: Add the ST VD55G0 global shutter sensor
Message-ID: <20261025173825.60385-1-lsa.uz@pm.me>
In-Reply-To: <20261025155158.44392-1-fernandorimoli11@gmail.com>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261025155158.44392-1-fernandorimoli11@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 9db915d6a9fe70f5a7a0cf7ed4dbe583502cfc40
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fernando,

Thank you for the run, and for the detail.

On 25/10/2026 15:51, Fernando Rimoli wrote:
>  - renamed "dovdd" to "dvdd" in the ACPI supply names, because the
>    6.19-based int3472 here registers this sensor's two GPIO supplies as
>    avdd and dvdd, so dovdd got the dummy regulator.

The Surface Pro 9's ICL2 has the same two power GPIOs as the Surface
Pro 11, types 0x0b and 0x10. Mainline v6.19 has no name for 0x10, so
the dvdd comes from your tree; media next calls it dovdd, and the
driver as posted should find it there. If the int3472 names change, the
driver's ACPI names follow whatever lands.

> Since the driver needs a multiple of the clock it believes it has, a
> separate entry for this IPU (8086:465d) through the per-IPU match in
> ipu-bridge would let it run in specification without changing yours.

I would rather fix the clock. With 19.2 MHz reported as 24, the sensor
runs at four fifths of every rate the driver computes, so an
in-specification link frequency would still leave the controls off by
four fifths, as your 57.20 against 71.49 at 600 MHz shows. On Hao's
thread I have pointed at the Surface Pro 9's _DSM, which looks like it
takes 0 for 24 MHz. If it does, 396 MHz is in specification there too.

> 2. Nothing bounds the exposure while the strobe is on, and the
> illuminator has an overcurrent limit that a long exposure trips.

The same here: on the Surface Pro 11 the illuminator holds up to 68% of
an 1860-line frame, fades at 70-72% and goes out at 72-75%. It fades
rather than cutting off, which points at the board's LED driver rather
than the sensor, so the fraction belongs to the board, like st,leds. The
sensor has the means: MAX_EXPOSURE_LINES (UM2829, 13.8.1) bounds its own
auto exposure as well as manual exposure. I would do that as a
follow-up, with the bound supplied from the same place as st,leds,
rather than grow this series. Benjamin, say if you would rather have it
in the driver now.

> 3. On IPU6 the stream needs a CPU latency bound, or frames come out
> corrupted.

Thank you. I will mention it in the v2 cover letter, so that IPU6
testers do not take it for the sensor.

> I will add a Tested-by for the Surface Pro 9 on v2, if it has an entry
> for it.

It will; see my answer on 4/4.

Sergey

