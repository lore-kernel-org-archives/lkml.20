Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9649372691
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.200
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178953; cv=pass; b=HCGp502Tggadia0/dPfJrSgPlW4yFuFF4LfWJNxmegkw+sm4+moGfNApuU7XYBcgSLo434wZDO/Nl39lgdM2/OQIcP/9cCMzXDT4QEFboQKEsvStKHv308JXW/9nmtKlS1NZ8/I0QNJQIcgbe++j3UomAhbAB1DGytp3OWieFsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178953; c=relaxed/simple;
	bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y50ZRLJSpe/XB8C1aeYcEz9r/icFfmw9QmPPOHQOZjDF6gjc2wjAselImSYU9GqjTTq+0hhM2RA9dzvNET2UeA44+6sxAV60rGe/gCCSodhusyO2W+qPIkV36E8tzsewUTfAifZXmvgebkZW+JkJ/XHiEoN8odanJDtnR4TOmo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haSfbs4D; arc=pass smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haSfbs4D"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-530e2f0c0a8so4153361cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789178947; cv=none;
        d=google.com; s=arc-20260327;
        b=Fk911wEgryojW9U2Tw7txVunaIVqO9738rLbiqkjRLn+Qy2vSp+PvQ8zJ6tr001jpH
         hRPXR6AuACg95+iGBYFe4kumwZ3KODmSCS3Hf3Iy4R0tdL7RF+SwiW7Nh/430e1xLyqu
         mESlEI7a/sGy5u4r/UIpAc80wTzYybPA2xx0fH4KziyZMkNiZq1KFG3xTOk/XyvaEKcY
         DvA6OEjRohLKwVtk9BUZgHVMUfGwTgdZLKKyZ3WQsTtit6um51d+DK1OnfHnzfheqKR/
         SKrk27Tta40ccnfiauaZNZv4To/M2TAdeRrh14Y2wavLsTGpGxiKn+hwjujuWJCZFyAU
         HMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        fh=PojVPuzqvEdUrXPwIpbTOl23R7wd8gPTyO30V9Slmx0=;
        b=jLId/H/XmegmV/WIZS5IIvQOv8yHRCKNpYbp5yMw5MsZfSpSouvlOOeDyw0a4fJTYd
         qYhOCx5bwbNn2+oQSyUWpQbMUgrCqzGvKpIYgJ14uMNCWh1Y17uA7ZH98+VmdfKGPlYe
         DfO4xTeqoCQ6CBwWjEOJI05uX5HgH0Y8jqLsk79/g66ARfjBgLPNfDbCt4BSBo/p3sOB
         SW4vEg3n9W6jpe8VgGnBpHL0iTnAcu9txX7frCWap6KRk6Oq6XD5oI2CBalbV+Jxryo5
         bQe67WlNeqMgoxIV9uoRMkLE7aCZIa1vYCdz69shBM3PeIRonC3Y8/r+sFdhxsO30xOW
         gfCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789178947; x=1789783747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        b=haSfbs4DLoa/DAimtNX+pLEgqVbB7AgCSaa9bMdLPLPuxwKrwGhBx6UXOTpqKsX3In
         HmPfspx9fu9BmY6nqeDEKMHkk4AfRVKdygG1wjixkkNt491Q5PdYIBST2VNmRyWmEFzQ
         qX1Hc/DXQC5bNhj0fQXw31rlPm+l7E6BUz++lSI3Kw24acU8zmdqgk88WwKlS9ljAf4u
         BMtf0NbTwyATUMBTOiHfCfoai66hcwlO1fS98WJDfMROGq1Kj8b5+1Bq05A23o/VE9sA
         jpNl9UK+fREU+YaTa3g4rVRk84pTrhtji2/oOGf0OpTqWofga//DHQycVfrqmj0xByET
         u7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789178947; x=1789783747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        b=UMmD/uQBgzcO8mALJeRHSLAya4tcVF/kQiNzqdJ5YE/nEbSZa1gomfhPpCMOdzUVih
         Uoe3MChsAbKWQvX+CM0cbox7SBHjqMlCgUa8IWZlqX00YcJMjLwUuOY6JTB2ATHGbyNt
         R0QoTgMU3Gizwmzez32q1tzthJXTjlgOQclpK4u3yF0tGhjXujW8lSKiTZIgpGzJKNh4
         4LGBNwSyohvSKeKDnn5UTPViXDyFfMyqCeLmsNpbRTgRQZb/a62xmbpRa4KwInK35Kc2
         8svsHPvUDiU+MZWtBUpu1yTb31f/gk8DeuzEHeJ6YaKdGuLnHhlsbxNHRKzIKacGhImp
         GgUw==
X-Forwarded-Encrypted: i=1; AKwUvBwhE9AhrBhCCRKcSZxTucjTficP8xjjzMNJ0tEYaaSzNPXd9sfrh9wT3KuySEkNFfSY/IKZkvOn2aEJOFg=@vger.kernel.org
X-Gm-Message-State: AFuF++nlADqInGOyrynOyuJk62Nv1wYO1Bb8ROg/+RznJTFUNafCrvVp
	nkfiJVbjXWuNQiEe0mON015EpFg5WJN7PV06xho2WRQLMcVbSiZpm9IRsxoHOcOkRxOjE4nWCDY
	g8wjkWm1F4g0caVbz1B+UyA9Fl2TyLAU=
X-Gm-Gg: AYBFou2Y7R/WfnpPrvmeZ8JFNWdB47EDVRlzI/56iooz/Oe00kGGY62yBI+1h/t4Ufp
	fSzmwxaElj6+pj0H6WGA/a0ATPIIyTX74J4SAMqeH0wZf8nORqKQcWpEX0rU7o3xd/f2S+L7CX/
	4e0cuyqOnuk2Ad3SSOs2oBY6aXSV7njogu/Qx07H1tB1r05dGpu8soDWHdqpGA2Ac2nCDdOYTtn
	4arz4CuqaM3lwYX00b8ZDOCfKUrEsd2xILU2/oixGtOVLhPwgFGaMndHGHNHU3ur1Evb2W2Zwcd
	DGy6QZqOhq2GysDhPyBGJbMh+ZYyXcETMDW2ki8qbBIzW7V3tNAP8DqEw5ylKM+lrtfNDN8K0u4
	+BkBXprnHUStcFnUnr3OagomriI9k3GARR5x4psmK
X-Received: by 2002:ac8:5dc6:0:b0:530:d1d6:792d with SMTP id
 d75a77b69052e-530e7dd8ae5mr13590681cf.15.1789178947506; Fri, 11 Sep 2026
 19:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com> <aqRI3N5FPX1dpIlk@gmail.com>
In-Reply-To: <aqRI3N5FPX1dpIlk@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 11 Sep 2026 19:08:55 -0700
X-Gm-Features: AcwNN1XgIQzd6k50BFzIHmb9Q0P_yN5Y-RnB_uEDdmfcLkrtltvi4fLr_oEAXtE
Message-ID: <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Karl,

On Fri, Sep 11, 2026 at 11:43=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
> I've made a RiscPC emulator in the browser using QEMU and WASM. It boots
> Linux kernels and currently emulates a StrongARM RiscPC:

That's awesome. Are you planning to add support for the NetWinder to the b?

A couple things that I didn't see when I glanced through the code:

* QEMU needs to model the broken ldrh/strh instructions for the Risc
PC (but not the NetWinder). I am not sure exactly what their behavior
is on real hardware (though I have seen forum posts where people
investigated this - I'll let you know when I find them). For now, you
could just have them load/store a random value (:p). It would also be
helpful if it could print a warning when one of these instructions is
executed, to help people detect and remove instances of them in e.g.
JITs.

* On ARMv3, CP15 register c0 is write-only, and you don't model this.
This caused Linux on ARMv3 to be broken for a very long time before
support was eventually removed - it was broken even in 2.4.18-rmk4. A
patch to run Linux on the CL-PS7500FE (=3D ARM710 Risc PC on a chip,
used in the Acorn A7000+) works around this by keeping a copy of it:
http://webpal.bigbrd.com/patch-2.4.18-rmk4-wp3.gz. According to a
comment in later 2.4 versions, that approach won't work, but I don't
understand why. Also, the patch fails to fix other reads to the
register outside cpu_get_pgd() (I forget which ones).

A few things I know about early ARM hardware and Linux that might help you:

Before 2.6, ARM support in the mainline kernel was very incomplete
and, IIRC, unusable. To build a working kernel, you needed to apply a
patch from http://ftp.armlinux.org.uk/pub/linux/arm/kernel/. There are
no patches for versions newer than 2.4.27, but the 2.4.27 patch mostly
applies correctly to 2.4.37.11 (I didn't try to fully fix it up
though). The last patch that was released was 2.6.0-rmk2 - it has some
relevant changes like the CL-PS7500 PS/2 mouse driver. There is also
an unreleased 2.6.4 patch - I should ask RMK if he still has it.

The NetWinder development team shipped patches to their kernel with
additional features for the NetWinder (and other ARM hardware,
including Acorn). This is the last one:
http://www.netwinder.org/mirror/users/r/ralphs/kernel/patch-2.4.21-rmk1-nw1=
.gz
I don't think most of those changes ended up in mainline.

The Risc PC and NetWinder lost their audio drivers when OSS was
removed in commit 727dede0ba8afbd8d19116d39f2ae8d19d00033d. RMK was
working on an ALSA driver for the NetWinder but never finished it
(IIRC it is in 2.6.0-rmk2 but probably doesn't work).

> I used LLMs a lot while building it.

I don't use LLMs for environmental reasons, because they are often
inaccurate, and because I like using my own brain and don't want it to
atrophy, but we are all entitled to our own opinion.

> Your GCC work looks useful for this. I will look at building the RiscPC
> Linux kernel with it, and at emulating the original ARMv3 CPU too.

Great. Let me know if it works.

P.S. I have a few UI suggestions for the emulator:
* Make the display bigger and able to lock the mouse/keyboard and go
into fullscreen.
* Remove the LK201 keyboard - the NetWinder used a normal PC keyboard
(if you add it), and the Risc PC used an Acorn PS/2 keyboard (a normal
British PC keyboard but with no Windows key):
https://chrisacorns.computinghistory.org.uk/32bit_UpgradesA2G/Acorn_RiscPC_=
Keyboard.html.
Just keep virtual keys for the keys that you can't input in a web
browser.
* It should be possible to middle click using a modifier key if the
emulator ever runs Risc OS, because middle clicking is heavily used in
Risc OS.
* I think some of the explanatory text is unnecessary.
* The skeuomorphism is cute but inaccurately represents a Risc PC, and
I think it clutters the UI unnecessarily.

Ethan
