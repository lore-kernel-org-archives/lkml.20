Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33935CB95
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034209; cv=none; b=rU8dGUI2o7SH4fNtuUi/Mwjmn3a+6kYUQSkokcmEOSX1BiaPlQXaf1h+gOTzubvFhzwKlpYvOECGket2jVxz3b1Vnj9EpKpG48KX+tLD6R54LBDQI8+BTYYHFfEel7gGHAC7Z5ZY7Ym9kqi0KRgQqjmJIgRI7O17Z8L3xlqHxas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034209; c=relaxed/simple;
	bh=5oKLT6Ad7ul9lJm85nuqXPePTH3oxV7lfO/Zda9f3I8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=JhWDjUsz90xx5SVwxZoIvmD60jUj7EHBji6PiEeDi0twF+KOV+Z4m2Tf2GmY0g7thC4fjh8R/T0LevE1sbtS4ZSMj+H49TxFG75sv83XagooONLl2vcNI04UOfCHb18oLhzjYdFGeMlMh4pM6P2D2z7zkG/xbVltIx3wH93tqvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jbh4nPhd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jbh4nPhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112861F000C4;
	Thu, 15 Oct 2026 03:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792034208;
	bh=5QrX25FLPsZ0J+eOmZ2r9RlpsAZQRmlu604aZKAw670=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Jbh4nPhdOUO7p2eW1b22vfeavoZ+cMZF/FYk5L6947Ugw6A78m0Bx7bE4o7TcqZdv
	 V00Qj2MHzlWcb6yr1zCYklA34onvgF/DJwT/XQineA6pKLWwuPm8DF+W3kan+o9xs1
	 YgYdFXbUqzcLhD6vEfJbV+6yANrt2AvMCsQTZAuuUWnKuvmQmmUWEBpoODJmpHPBb9
	 DA1eQobPGzuTUQcZyR9Kbi60ibIYQJE6kTK/MVKI+7N41RfVMMYe+JByh8KvJoxwWs
	 rPkfa7San6kWJ8Qg4ZnqdALjPfaZyKuZjZEORfjQDgjegtsJpEVLF3tDXCJ2OACttY
	 EM3Eg+C7/Qfnw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
References: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] spmi: mtk-pmif: Add workaround for FSM lockup/error in read operation
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, justin.yeh@mediatek.com, gregkh@linuxfoundation.org, nfraprado@collabora.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 14 Oct 2026 20:02:54 -0700
Message-ID: <179203337468.5720.6502878688124731304@localhost.localdomain>
User-Agent: alot/0.12

Quoting AngeloGioacchino Del Regno (2026-07-01 05:19:08)
> The SPMI PMIF in some SoCs like MT8196 is affected by a hardware
> issue that makes the first read operation on each SID to fail as
> the FSM locks up after sending the read command, and this happens
> at least in the following conditions:
>  - At boot, after bootloader handoff; and
>  - At every suspend->resume cycle.
>=20
> This critical bug may produce unwanted issues in regulator drivers
> which may fail to set voltages, making the platform to end up in a
> undervoltage or, a bit more critically, an overvoltage condition,
> producing instability or ... worse.
>=20
> In order to work around this issue, add a retry mechanism into the
> pmif_spmi_read_cmd() callback which will resend the read command
> up to 3 times in the following conditions:
>  - Software Interface returns an error; or
>  - Software Interface never gets in WFVLDCLR state.
>=20
> As to avoid uselessly blocking for too much time, only during the
> read-retry loop, the maximum SWINF polling time for each trial is
> reduced to PMIF_TIMEOUT_US / 2: this was tested on multiple SoCs
> and seems to always be enough, as when any read succeeds it will
> always take less than 40ms.
> In any case, this is still allowing 1.5 times the previous maximum
> polling time, reaching a total maximum (for 3 retries) of 150ms.
>=20
> Worst case testing that I performed saw a third retry only 3 times
> out of ~100 reboots.
>=20
> Fixes: 1f5be2d7f743 ("spmi: mtk-pmif: Add support for MT8196 SPMI Control=
ler")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to spmi-next
