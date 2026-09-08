Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361A551981;
	Tue,  8 Sep 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872816; cv=pass; b=rH4Y/lIFGXKdIISk83f13mQXpLRgxsmsZ0YYvlJfF1MUDOkRGqcyCGAnKRnUZHYr+S/qJKb9I1bQxKl3kMq7T7g6ibgBRX4+V+E+xXe2mZcLoKQzcG4WuUmjFwYh1Ru2gRBQaDV5TwSSGOJy4Sf0JUtJHnDcrZKMjNQpDXKmwXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872816; c=relaxed/simple;
	bh=NaP/J5T2eIiARwG/stKRO6SC9ngKWPZ1pTESv3O8puk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAA4uOwPVQvecxs1vMg3gNOUMEyPbe8AeOA8PpJtEUgtzdVWRvfXmdhrjfaMZDUdE/HuKCYsYs4z/YmZyUraEC4Q1F+UYV7uEFifSjz/o82lfdhbjW3h5rSZE45xC63ATRd+bCXx9e00UQofRYx7WxgokbtZL9QwLkZPo/Kd8KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=eZHbuMCM; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="eZHbuMCM"
ARC-Seal: i=1; a=rsa-sha256; t=1788872764; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A0YszLG+PWpxYhe0WbOiJKVQo2aummx10IY706YiNwWlNDRC77HwwmxpOfuYFoRCCMzB2F2mQBYAPpDUSRrejiR1OHjHz/gvLOUgnO644UTb5V+62bW+ZG08bYGrTSK1PUhRPOox7fseHkPC52eSg9b9mjflmeoOkmJSqfS5liI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788872764; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XVs4oKmISHkAOkb4rV8/+gmRq8fwPo7lkct9jh+IeMU=; 
	b=TiGHHdmmqaHtBBHlrC2Cc3s21qYftiZbTjfEpMoNbFggGFAbA+7R77nizT8WxlMoT9TTY60W4gSsy4wYta0uBcvkNA8QXks9jNUABGVnODWK3IcoXh7OWe+qz/zt4kWr+2qUR62np6UXXgFi/FJd6ZIZ2wGB5ibm46N3aPRgyDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788872764;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=XVs4oKmISHkAOkb4rV8/+gmRq8fwPo7lkct9jh+IeMU=;
	b=eZHbuMCM/zkR5rTWFSaxHFhkDAhXqCT7CjyRIlE8uTcE2jpH8N08PPUpSOmqe1Ii
	I0a1iHs+GzeUkg9VCch0jDnlIdCsBmLYHEoguNcQ9MC5WjxUaaVn99AISMg6oXYojxe
	nIt89vNfVE54KN436qWDOHk5qBrJrco511MEtgsc=
Received: by mx.zohomail.com with SMTPS id 1788872760262283.72706590675045;
	Tue, 8 Sep 2026 06:06:00 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 870E31816EF; Tue, 08 Sep 2026 15:05:55 +0200 (CEST)
Date: Tue, 8 Sep 2026 15:05:55 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: s2idle resume hangs in ohci/ehci on RK3588: HC registers touched
 before the USB2 PHY is powered back on
Message-ID: <ap__5zeUakMSLWOQ@venus>
References: <20260907190000.s2idle-usb2-resume-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3iqzmvrd5khtbjx6"
Content-Disposition: inline
In-Reply-To: <20260907190000.s2idle-usb2-resume-royalnet026@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.865.29
X-ZohoMailClient: External


--3iqzmvrd5khtbjx6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: s2idle resume hangs in ohci/ehci on RK3588: HC registers touched
 before the USB2 PHY is powered back on
MIME-Version: 1.0

Hello Igor,

On Mon, Sep 07, 2026 at 07:33:47PM +0200, Igor Paunovic wrote:
> on an Orange Pi 5 Plus (RK3588, mainline 7.3-rc1 based tree, generic-ohci=
/generic-ehci with
> phy-rockchip-inno-usb2) resume from suspend-to-idle reliably hangs in the=
 USB 2.0 host
> controller resume path. The CPU that runs ohci_platform_resume() never re=
turns (RCU stall,
> "CPUs still haven't responded to the NMI"), everything that waits on it i=
n dpm_resume()
> stalls behind it, and the board needs a cold reset. With the four USB 2.0=
 host controllers
> unbound before suspend the same s2idle cycle completes every time (RTC al=
arm wake, full
> resume, 3 s), so the rest of the platform is fine.
>=20
> Wake-up itself works: the board is woken by the hym8563 RTC alarm (PM: Tr=
iggering wakeup
> from IRQ 52) - that needed a separate dts fix which I sent yesterday [1].
>=20
> To find where it stops I put kprobes (with tp_printk) on the resume path.=
 For the two
> OHCI controllers, same kernel, same cycle:
>=20
>   fc8c0000.usb (host1, survives):
>     ohci_platform_resume -> ohci_platform_power_on (clocks only) -> 0
>     ohci_resume  entered        @142.838
>     usb_hcd_resume_root_hub     @142.859   (the "powerup ports" + msleep(=
20) branch)
>     ohci_resume  returned 0
>     ... later, root hub resume: usb_phy_roothub_resume -> rockchip_usb2ph=
y_init/power_on
>         -> ohci_rh_resume
>   fc840000.usb (host0, hangs):
>     ohci_platform_resume -> ohci_platform_power_on (clocks only) -> 0
>     ohci_resume  entered        @142.994
>     (nothing else, ever)
>=20
> So the hang is at the first HC register access in ohci_resume() (the ohci=
_readl() of
> HcControl / the port power / intrenable writes), which happens before the=
 USB2 PHY is
> powered on again: since the PHY handling moved into the HCD core (usb_phy=
_roothub), the
> PHYs are powered off in hcd_bus_suspend() and powered on in hcd_bus_resum=
e() (both only for
> system sleep, !PMSG_IS_AUTO), i.e. at root hub level, and the root hub re=
sumes after its
> parent controller. At probe time the order is the opposite: usb_add_hcd()=
 does
> usb_phy_roothub_power_on() before hcd->driver->reset(). That matches what=
 I see: after a
> "hosts unbound" s2idle cycle, binding the drivers again (probe path) reli=
ably works, while
> the resume path hangs.
>=20
> On RK3588 the inno-usb2 PHY powers down its PLL/refclk/bias blocks while =
suspended
> (phy-rockchip-inno-usb2.c, comment in rockchip_usb2phy_power_on() about c=
ommon_on_n and the
> reset done on power-on), and the OHCI/EHCI controllers take one of their =
clocks from that
> PHY (clocks =3D <&cru HCLK_HOST0>, ..., <&u2phy2>). So an AHB access to t=
he controller while
> its PHY is still suspended has no clock to complete on, and the access ne=
ver returns - which
> would explain the "no reaction to NMI" symptom (this is my best explanati=
on so far, not
> confirmed with a bus or clock trace). The Rockchip vendor tree avoids thi=
s by giving the PHY
> driver system PM ops that reset and re-tune the PHY on resume, before the=
 consumers run
> (rockchip-linux/kernel, develop-6.1, phy-rockchip-inno-usb2.c, rockchip_u=
sb2phy_pm_resume():
> "PHY lost power in suspend, it needs to reset PHY to recovery clock to us=
b controller").
>=20
> Data points (all dvfs test kernel, 7.3.0-rc1 based; every "hang" needed a=
 cold reset):
>   - all 4 USB2 hosts bound, s2idle:            hang (ehci x2 + ohci calli=
ng, none returned)
>   - EHCI unbound, OHCI bound:                  hang in ohci_resume of fc8=
40000 (2/2)
>   - all 4 unbound:                             OK (4/4)
>   - all bound, cpuidle limited to WFI:         OK (1/1)   <- timing depen=
dent, see below
>   - the surviving controller (fc8c0000) took the "HC state retained" bran=
ch of
>     ohci_resume(); the hanging one (fc840000) did not get past the first =
register access.
>=20
> (The OHCI platform devices resume synchronously from the main dpm_resume(=
) thread - power/async
> is disabled for them - which is why nothing else in the resume sequence i=
s printed after the
> hang; the EHCI ones are async, so in the all-bound case two ehci and one =
ohci resume were in
> flight when everything stopped.)
>=20
> Why host1 survives and host0 does not (identical PHY port configs) - read=
ing the PHY GRF
> status and the clk enable counts right before suspend, in the test config=
uration (EHCI
> unbound, OHCI bound): the u2phy2 port (host0, nothing plugged in) is alre=
ady in PHY suspend
> (GRF status phy_sus set, no line state) and its usb480m clock has the OHC=
I as its only user;
> the u2phy3 port (host1, a HID dongle plugged in) is not suspended and its=
 clock has more than
> one user.
>=20
> So the port without a device is already put into suspend by the PHY drive=
r's host-port state
> machine, and its 480 MHz clock has a single user (the OHCI): ohci_platfor=
m_suspend() drops it
> to zero and the clock output is gated; ohci_platform_resume() re-enables =
the clock, but the PHY
> itself stays suspended (PLL down) until the root hub resume powers it on,=
 so the first HC
> register access would have no clock to complete on. The port with a devic=
e connected keeps its
> PHY awake and its clock never reaches zero, so the same code path survive=
s there. With the EHCI
> siblings bound the outcome depends on timing (the async EHCI root hub may=
 power the shared PHY
> on before the synchronous OHCI resume touches its registers), which would=
 match the mixed
> results. Also: after suspend the OHCI ends up in the RCU-stall/no-NMI-res=
ponse state, i.e. the
> CPU is stuck in the bus access, not in a software wait.
>=20
> Questions:
>   1. Is the intended fix to power the roothub PHYs on before the controll=
er's own resume
>      touches the hardware (e.g. in ohci_resume()/ehci_resume(), or a usb_=
phy_roothub_resume()
>      call from the platform glue before ohci_resume()), or should this be=
 handled in the
>      Rockchip PHY driver with system PM ops as the vendor tree does?

Coincidentally I looked into this issue last week when testing my
PCIe patches on RK3588 EVB1 instead of RK3576 and fixed it up from
the clock path. From my perspective the root cause is with the clock
registered by the PHY driver. The clock consumer expects it to be
running when the enable function succeeds and in case of the PHY
that is not true for the suspend resume path. The PHY just ungates
the clock, but does not take care of resuming the "parent" PLL.

I've not yet send out the fix, but you you can find v0 here (part
of the rockchip-devel branch):

https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/comm=
it/53014abcf948b7afcb2150ea690a8f6062cf66a6

>   2. Has anyone got s2idle + USB2 host working on RK3588 mainline?
>      I could not find a report on lore.

mainline still lacks my RK3588/RK3576 PCIe suspend patches (I plan
to send a new version this week). Thus with pure mainline the PCIe
driver will block the RK3588 from going into suspend in the first
place.

FWIW There is also a bunch of other bugs around system suspend on
RK3588; most of them are less critical though. Also some BL31
firmwares seem to be broken.

> I can test patches on this board (UART console logging is in place), or t=
ry one myself
> for whichever layer you think is right - I have not attempted a fix yet b=
ecause that choice
> is the question. Per Documentation/process/coding-assistants.rst: the kpr=
obe placement and
> the log triage above were done with the help of an LLM assistant; all mea=
surements are from
> the board and the reproducer is the unbind/bind matrix above.
>=20
> [1] https://lore.kernel.org/all/20260906181622.11991-1-royalnet026@gmail.=
com/
>=20
> Kernel: 7.3.0-rc1 based (drm-misc-next + accel/rocket DVFS series), BL31 =
v2.12.0-10-g70d814213
> (v2.12.0 plus one local cherry-pick unrelated to USB), Orange Pi 5 Plus.

Greetings,

-- Sebastian

--3iqzmvrd5khtbjx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqgCCsACgkQ2O7X88g7
+pp9Dw/9HyY1qAwitHZIPL4s9VmxXR8xZsHAtbulk5F0w42e6pWXRDW1jaMeY+f5
5EatFtTTqzGhYE0Q2pU/Xv73x7tfhM1hXGqHDS0g4+DIakkTSKZsUY6nWhT+O8Nx
fIlWWHMfeCEBHOObcsME263QLgXnBG1YKycJOM0+X1oeAwsuZYASbhAY0DVDxtis
Twurk+6T7ejLjKHP4i4p9C5T2yjKHmWTP3ebqpbupeYig11Z7KIcOhFhV3JLVPxo
0LU67ZyKguiecq+a1dLkkXz915j4B2edTaEoug+YHXynV70mGGSMy7O4U0nHMsBj
YRroqFgloRBARyBFdg302DmYHQ18tsgQYqfF1sTUYF0R5q+0PR90NzyKtid9jYe0
cZ9a1l3rdKP8C2Iv5KeII81CGmkFPZf22wMKEs+dAiB6dd5L+e9PXXtrQaZ2iRFR
/gZD/LUErQmTVam+YCjrggytgPuffhWU//dcd3FM5vOeunO7WvnOZEVSSFZJs5wv
9V9+cDPOtFfgyyT9sIGaYiZcI7VdYS3UC+M5mekF6kKGUjDXD3bC0w3PVJhe+Y3T
OUQFOO6st/84zRSfYoQQisqjQO5rvmaJpjEhMuhe98+urWgzWj5fNI5hEFTqOnl2
GiK6mnkcRP0G4xFjI5grE2nexu7GZ2l9c6e516b3lOpra36GQvY=
=05Ry
-----END PGP SIGNATURE-----

--3iqzmvrd5khtbjx6--
