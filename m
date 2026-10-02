Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E032344239B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927224; cv=none; b=R76jLnKa8gphTIorpZvmBbaqKK6lpKhtPhwX943XqR3R54kIdq4v4nYx6KcBanLCq9nWslE1EB3taclLrPbB7BIhK+o7u9NhQxp0WS1IuQu9XatSMtteFZbr3IF3QaFTLsEcJoHQkR67DGAwttO3vWn1+A8CnvfKqHjUVRg2e0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927224; c=relaxed/simple;
	bh=qTDa3VZgufpxHWeAIL3ps4sfzg+LvOXD0IBSbeBButA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsPqGXKBr7xTkgCpZHSCJWTBERpt26L7nZf/gCBcSAWwEzz3kHSaB7njgk6p67C5yoBSyDB+ROMd/FVOzPpuoPL2GANRme2JkaHPzDVUcpeQ3qCIlPRd2yqt4uYZBBtNX0w5xC/CaGN8frxHRZwpCIWvhJHN8zsZ/+QusfTCRjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SZ/8ti/J; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SZ/8ti/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790927213; x=1791186413;
	bh=qTDa3VZgufpxHWeAIL3ps4sfzg+LvOXD0IBSbeBButA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SZ/8ti/Jf4b/70LHUAQdetm4h1O1euGXY9EVUpheoGFFuQ6An6JJv2QhRjbogbg1y
	 Po06uyXtE+dsIoFMPD3boe/BRmsSQsdWA4OHbR83wLPUUxJzskedhkuEO5hiD+PizT
	 8Mq7VMfOgKqkXJNgaUtyQILHpBBGav9B9NpXdYXIIhTu3q7ST+wIllcwk2NMjEBuc8
	 Gudwft2hRdV9fobAlkrLaddkhmj+EoEjUriC7cx3ZuAlxVJacS7abF4ZvYqgB8c7Jv
	 /Ol4sALJny40SHR3xoB1nf3BUUC8OmtQ+DEv1xo953IK4oQW7xJQ4MSFKL1itOAu0b
	 qR8jq772Ek7LA==
Date: Fri, 02 Oct 2026 07:46:48 +0000
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: linux-mediatek@lists.infradead.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanley Chu <stanley.chu@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Convert MediaTek GPT timers to OF probing
Message-ID: <HCFYDcAPoXmpcQH8fPYz0vXbaTszyO9pT8KAPrqWLyez8RYykEaWAYaB5twS38J-Dn7rMc2BEB-zVHaDn7I4aLyekOzQLCRVIUdaCQiTaxg=@protonmail.com>
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: c44013cceecdc63de2df44b47e44f3ce4e5109c9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Friday, October 2nd, 2026 at 10:21 AM, Luca Leonardo Scorcia <l.scorcia@=
gmail.com> wrote:

> While chasing a kernel freeze on the Lenovo Tab E7 TB-7104F (mt8167), I
> stumbled on the MediaTek GPT timer driver. This driver is currently early
> loaded via TIMER_OF_DECLARE. I noticed that on mt8167 (and I guess mt8516
> too), this driver actually fails to probe because its device tree
> declaration depends on two HW clocks, CLK_TOP_CLK26M_D2 (13 MHz) and
> CLK_TOP_APXGPT (bus clock). However the driver providing those clocks is
> loaded later in the boot process, leading TIMER_OF_DECLARE to fail with
> -EDEFER.
>=20
> Patch #2 converts this driver to OF probe, fixing this initial issue.
>=20
> I noticed that other devices avoid this by connecting the timer to
> fixed clocks instead of referring to an actual clock. This approach
> may work on mt8167 too, but I think referring to the actual clock is
> cleaner.
>=20
> Once the driver probed successfully I noticed that even if it was enabled
> by the boot loader, the kernel would quickly turn off its bus clock as
> the driver wasn't actually requesting it.
>=20
> Patch #3 enables it and attaches it to the timer device. I wondered how
> other platforms made it actually work, and noticed that mt6735 declares i=
t
> as a critical clock. This approach might work for mt8167 too, but same
> reasoning as before applies.

Most mt67xx and their 81xx siblings are feeding arch timer from cpuxgpt tim=
ers.
These are usually turned on by the firmware at EL3, so in general you can
disable both apxgpt and syst in the devicetree (unless 8167 feeds arch time=
r
from the gpt6 like 65xx...)

>=20
> After those fixes the driver probes and works correctly, but I would
> occasionally notice a crash at boot inside the timer interrupt handler.
> It turned out to be a side effect of the bootloader enabling the GPT
> timer at boot: an interrupt may arrive and be handled while the driver is
> not completely initialized.
>=20
> Patch #1 fixes it by requesting the IRQ but keeping it disabled and
> enabling it after the clock source initialization completes. I sorted thi=
s
> patch before the others because it's actually independent of the latter
> two and may fix (rare) random crashes on other devices.
>=20
> Please note that all the changes apply both to GPT timers and the SYST
> timers, but I have no device to test the SYST ones.
>=20
> The series was tested on the Sony PlayStation Classic Mini (mt8167).
>=20
> Re: patch #1, credits for issue discovery and suggested fix go to
> matemiller992 on postmarketOS forums. I am submitting it upstream with
> permission. Not adding Reported-by or Suggested-by tags because it was
> requested not to share real name.
>=20
> Unfortunately, this series did not fix the tablet randomly freezing durin=
g
> boot. Any idea on how to better troubleshoot this is more than welcome!

Have you tried to add {clk,regulator,pd}_ignore_unused? If that doesn't hel=
p,
try turning off cpufreq. On mt6595 I had to mark CPU regulator as always-on
(although it should be safe to disable) to avoid system freeze at the boot.
Otherwise start adding status =3D "disabled" to the devicetree nodes until =
it
properly boots.

Best regards,
Roman
