Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445F233941
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802453; cv=none; b=hXfSC8lOvEhTb7V/DieOAh+hgywnK2jbg8iSUWyb04HsW7ofZT9wPLARoS+law4BG/jnLxiZpB6rD2V1uK4KewMIpojFmI+bKTbRs9NwFeRaDBscTpy0xZdmowfV+/0t/x25lzylGHIB8bS2ucRzC2NZkZOj7KNqp7t8X6mM4WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802453; c=relaxed/simple;
	bh=aUqQ+/nrrCfl/Fsjbg1whSE6z57LUzeLhqVamZC4ZQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jxvG4hi3AaR7/F7ElJN3jAS5xr721z7Yb9e5hoBlubzf6eOlMx0+tUGVd3HPiz57jms1ipJmo7LrA67V4pYADiChhGGHSPGsuo1x3S2ZkuvvC25eN72YThsnZ6FEmDr5UEjNpRIxWmMlMvI8vL08LozuH+9GhFhT6kkrmRSvmb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdyptknZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdyptknZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd82be878so1242055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788802450; x=1789407250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXIYeviFW2An3MiG2FIAz4Avl4P0N7d8PiSZ5BjNGB0=;
        b=fdyptknZ7znh8Zo6JHDtXZKUpi4Ybeuod9uy64icFFbFGjPHOPopqOvQJeBfKlDFs7
         l5jF+IzTiagwzheOmlwGGfgzIE45FZBBSTh79zIpT8X5+6sqZAYxukPGHzJsorTq5Yxq
         2e+c/DlvKAGwhI6BH58BEsVOMHLiCmDiyTfomw4Q/wRWh4LlE7EaOIm1v7v3zOX5cJW5
         trDKw1ZvbtiUZBg2voVk8AX3ng+fnr8FUPrkX0L4aZ4Q2CrbJk9Pr/9zZz022QP2Ke25
         YQFF4Z4NIDs/W1eeXraNuDQJVGQOil+kek54ZZ0i1kCQNKFZbl4BhQ2gWnPeSHkUPurA
         c+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788802450; x=1789407250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXIYeviFW2An3MiG2FIAz4Avl4P0N7d8PiSZ5BjNGB0=;
        b=Djq4XFWgZ1bkkw2nw3UK+z5AlO9zkORTEj0Pg0xxKHNXoH9tDO1cvxTOa3cNsROgqR
         C69GnzacBDvyhuXGsF11r2ilRfKsAG3RVPEpDKqmj5xmE5BCqFr1wYFDq0/82FacsV0Y
         wVBgbtMs2WS+3CF/TO+H1sQnXtJEtXW6PPvhpD31p3t/J6c6fs5AQnpE0HArX0gQGbAO
         6axtmMP+V7dY4cPD0e6ObINmYk57HkSyjyza5vrsgY2Rv/ibY4K3dnftJAVdqWRXHVNM
         vDjpG4h3ix0mnzPFpsEcmN/ed4PMrqIQyyZ5st/epoqlOAEydoMhu75L1Lp2YhhShHsj
         2Txw==
X-Forwarded-Encrypted: i=1; AKwUvBx1WKzbxdNmZIoo2FhSXrBFxv4a4gPmkv9Ydlwm5YyP/dpzA6ijoDPli5U+f+Gyi5uDnF+6X9NU3W248hw=@vger.kernel.org
X-Gm-Message-State: AFuF++ngIGY01HZcAJQuUwABucyW7yaFcZaM4k6tkrm/sG3vG4g2pOXz
	RzrJBpI6uqCuRrIN7LsOfzDePz68Gu4E5jZGZIeHPDWwOdkI62eltE48jzEcBQgz
X-Gm-Gg: AYBFou3svCj1L4s+8D2byxKJwEZchc9Fk7lwvJhz1wO1HKEIgpKpjr1gOZ0dJdXbs1r
	zYqNd6Xmjd/zNNSeRHPRngIkiuJc9OiEhLSF4DIi9aQs0vlRo4s/ZXRqTgKA6+1sLHweeVIaAY8
	hUG6J153htO4RMm47z7i0LFeWPggI6qy3aoEmVKwvr1Y++A71rqEKEP0L6aa24CCwp7H+2OmYL7
	vXQQpbz2U6Dua1hpuctuls8acCApCMg+dHK0qqNzpIrh+VsYFd0WHohIIxt6EoYZbdibx/J3UPV
	sXrFP0McUe3YH/0VKp/wo9GlnrMIeKlQGbaBixu0wfWbM81632sEi3QOyFHCkAGuX2bldgs2uUT
	GCfGDDDDnsdokICorVtbkMAAkRde227b4AjDv5tIo1GNdTSuXzYrai9cvjSXTCsZJRYUT53e/aL
	l6i5z2RHpZxnPvLfilHr+p3qknVeYAuwkwsx0EMrjvTuw8RwvPsT+FjMGH+RFJlfej9Xf4IPmDg
	GPRaGcKJW5cQ6OH+8YuDfxxNgyreNYbGPYUS2KDU4BLGrc73gZraRnVMNrjT6bh7rYq
X-Received: by 2002:a05:6000:460f:b0:485:8e7f:ec0b with SMTP id ffacd0b85a97d-485907fd697mr14697954f8f.5.1788802449653;
        Mon, 07 Sep 2026 10:34:09 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8822007B3AD9A87B9E27CB.dsl.pool.telekom.hu. [2001:4c4e:1b88:2200:7b3a:d9a8:7b9e:27cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm34477370f8f.12.2026.09.07.10.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:34:09 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: s2idle resume hangs in ohci/ehci on RK3588: HC registers touched before the USB2 PHY is powered back on
Date: Mon,  7 Sep 2026 19:33:47 +0200
Message-ID: <20260907190000.s2idle-usb2-resume-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

on an Orange Pi 5 Plus (RK3588, mainline 7.3-rc1 based tree, generic-ohci/generic-ehci with
phy-rockchip-inno-usb2) resume from suspend-to-idle reliably hangs in the USB 2.0 host
controller resume path. The CPU that runs ohci_platform_resume() never returns (RCU stall,
"CPUs still haven't responded to the NMI"), everything that waits on it in dpm_resume()
stalls behind it, and the board needs a cold reset. With the four USB 2.0 host controllers
unbound before suspend the same s2idle cycle completes every time (RTC alarm wake, full
resume, 3 s), so the rest of the platform is fine.

Wake-up itself works: the board is woken by the hym8563 RTC alarm (PM: Triggering wakeup
from IRQ 52) - that needed a separate dts fix which I sent yesterday [1].

To find where it stops I put kprobes (with tp_printk) on the resume path. For the two
OHCI controllers, same kernel, same cycle:

  fc8c0000.usb (host1, survives):
    ohci_platform_resume -> ohci_platform_power_on (clocks only) -> 0
    ohci_resume  entered        @142.838
    usb_hcd_resume_root_hub     @142.859   (the "powerup ports" + msleep(20) branch)
    ohci_resume  returned 0
    ... later, root hub resume: usb_phy_roothub_resume -> rockchip_usb2phy_init/power_on
        -> ohci_rh_resume
  fc840000.usb (host0, hangs):
    ohci_platform_resume -> ohci_platform_power_on (clocks only) -> 0
    ohci_resume  entered        @142.994
    (nothing else, ever)

So the hang is at the first HC register access in ohci_resume() (the ohci_readl() of
HcControl / the port power / intrenable writes), which happens before the USB2 PHY is
powered on again: since the PHY handling moved into the HCD core (usb_phy_roothub), the
PHYs are powered off in hcd_bus_suspend() and powered on in hcd_bus_resume() (both only for
system sleep, !PMSG_IS_AUTO), i.e. at root hub level, and the root hub resumes after its
parent controller. At probe time the order is the opposite: usb_add_hcd() does
usb_phy_roothub_power_on() before hcd->driver->reset(). That matches what I see: after a
"hosts unbound" s2idle cycle, binding the drivers again (probe path) reliably works, while
the resume path hangs.

On RK3588 the inno-usb2 PHY powers down its PLL/refclk/bias blocks while suspended
(phy-rockchip-inno-usb2.c, comment in rockchip_usb2phy_power_on() about common_on_n and the
reset done on power-on), and the OHCI/EHCI controllers take one of their clocks from that
PHY (clocks = <&cru HCLK_HOST0>, ..., <&u2phy2>). So an AHB access to the controller while
its PHY is still suspended has no clock to complete on, and the access never returns - which
would explain the "no reaction to NMI" symptom (this is my best explanation so far, not
confirmed with a bus or clock trace). The Rockchip vendor tree avoids this by giving the PHY
driver system PM ops that reset and re-tune the PHY on resume, before the consumers run
(rockchip-linux/kernel, develop-6.1, phy-rockchip-inno-usb2.c, rockchip_usb2phy_pm_resume():
"PHY lost power in suspend, it needs to reset PHY to recovery clock to usb controller").

Data points (all dvfs test kernel, 7.3.0-rc1 based; every "hang" needed a cold reset):
  - all 4 USB2 hosts bound, s2idle:            hang (ehci x2 + ohci calling, none returned)
  - EHCI unbound, OHCI bound:                  hang in ohci_resume of fc840000 (2/2)
  - all 4 unbound:                             OK (4/4)
  - all bound, cpuidle limited to WFI:         OK (1/1)   <- timing dependent, see below
  - the surviving controller (fc8c0000) took the "HC state retained" branch of
    ohci_resume(); the hanging one (fc840000) did not get past the first register access.

(The OHCI platform devices resume synchronously from the main dpm_resume() thread - power/async
is disabled for them - which is why nothing else in the resume sequence is printed after the
hang; the EHCI ones are async, so in the all-bound case two ehci and one ohci resume were in
flight when everything stopped.)

Why host1 survives and host0 does not (identical PHY port configs) - reading the PHY GRF
status and the clk enable counts right before suspend, in the test configuration (EHCI
unbound, OHCI bound): the u2phy2 port (host0, nothing plugged in) is already in PHY suspend
(GRF status phy_sus set, no line state) and its usb480m clock has the OHCI as its only user;
the u2phy3 port (host1, a HID dongle plugged in) is not suspended and its clock has more than
one user.

So the port without a device is already put into suspend by the PHY driver's host-port state
machine, and its 480 MHz clock has a single user (the OHCI): ohci_platform_suspend() drops it
to zero and the clock output is gated; ohci_platform_resume() re-enables the clock, but the PHY
itself stays suspended (PLL down) until the root hub resume powers it on, so the first HC
register access would have no clock to complete on. The port with a device connected keeps its
PHY awake and its clock never reaches zero, so the same code path survives there. With the EHCI
siblings bound the outcome depends on timing (the async EHCI root hub may power the shared PHY
on before the synchronous OHCI resume touches its registers), which would match the mixed
results. Also: after suspend the OHCI ends up in the RCU-stall/no-NMI-response state, i.e. the
CPU is stuck in the bus access, not in a software wait.

Questions:
  1. Is the intended fix to power the roothub PHYs on before the controller's own resume
     touches the hardware (e.g. in ohci_resume()/ehci_resume(), or a usb_phy_roothub_resume()
     call from the platform glue before ohci_resume()), or should this be handled in the
     Rockchip PHY driver with system PM ops as the vendor tree does?
  2. Has anyone got s2idle + USB2 host working on RK3588 mainline? I could not find a report
     on lore.

I can test patches on this board (UART console logging is in place), or try one myself
for whichever layer you think is right - I have not attempted a fix yet because that choice
is the question. Per Documentation/process/coding-assistants.rst: the kprobe placement and
the log triage above were done with the help of an LLM assistant; all measurements are from
the board and the reproducer is the unbind/bind matrix above.

[1] https://lore.kernel.org/all/20260906181622.11991-1-royalnet026@gmail.com/

Kernel: 7.3.0-rc1 based (drm-misc-next + accel/rocket DVFS series), BL31 v2.12.0-10-g70d814213
(v2.12.0 plus one local cherry-pick unrelated to USB), Orange Pi 5 Plus.

Igor
