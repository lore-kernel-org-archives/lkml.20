Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA94D9F74
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474135; cv=none; b=LsLI5jq0zYAMhgu8ti/erwBKrzXePiv3f/qhMG04tVdEEuAGGIQxklrpFqY++n0EwOFdfMdlcE9IIvEPcjym9jjYtqACyMfeZvDEKRinJXYcpjM0WbdIqwwoWeA5AeVh6vXpDtnZBHuLA9+ATYzO0fw4mhYBmva3tN5vGRMUgXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474135; c=relaxed/simple;
	bh=kFYB2YE03Fr1cNJfzEYyTe0jd63mjl+q93uWX9YFs7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dYJ2Ee50SVnca2l9AEUrrMallGlAZT4uqF6QPLuSIt5B84F/dMfNR4KN1E2I+6Dq3yO6c09Sh6+BMRSISh8wu15/xvmxhnASGQG6TqsIaFh1D5MZJ0foeysYJJlnKdtEEnN6BOgIQKvDvVqxovnB2m5++1Il7KH5aJcpyDX1MCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJhOtLkZ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJhOtLkZ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93cbc3ab2fdso259409485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791474133; x=1792078933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u6VEga/fDhA/LHHVWZ01lUO0WQKoIfCOS1lH5jNGjs=;
        b=OJhOtLkZDn5zt/hI8ZJsspzrv1uC9f3FYu8SVAyOwbQFuO0OPK5xkmDoO4HGeNldBT
         8o5Q/ST+uSlVkMjka9xGBMxsx4C9jy4Zc7ritC7KZB5g3tgSgijxkHp6Nve94ATzM7Ft
         Og/zlv2aj29WIgM5NCTKGdvjTwSWuQ1j2EtJk+7oDmK8GjTlV2dScsTFL0Jn7qKxNVv3
         RUoO0IYD6qwn1WpEicjrRq1zxlE/IkzwktJMYZeEZrb9yRhd1xZAC+JZ/p8LNbxWw+dD
         0hskWMY5D3QHzLoglWvqc7BF8OjUS81DJ7MIT8CeE6Fph+DHp5En/FLQjQE4Q2GuPoDh
         wkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474133; x=1792078933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u6VEga/fDhA/LHHVWZ01lUO0WQKoIfCOS1lH5jNGjs=;
        b=lkToXc65pyb+At5V/eG8H7rs60+eV02hfRcfqNJBzcTZ+0Sb3TS0nlmylpnTE4XPiN
         Kvd4LeKfgrOThpSguvOj4pOipBdC0yFeWSGfSwtQ6z1C3PcezZCTRhfvwJOqAvtUmGON
         kBDva9CerqPLpl2EV+z3n5y8MUbYRATAp0DYN6x63dRnf4UdueiFsEu1/BUeqasvN7We
         1VhTY9w9Sj0zgejevmKMZtjIJkF77/m90lIQJLlVDKzyNLbPwCq2q3++LHptuZHoy5a7
         YzSuYm+fgkwhwHXQ41fO0+Hhg/efJy2pHNFS5GTtkTwNwiMMe9fdFTyu/WdFDSXrIqwz
         yeLw==
X-Forwarded-Encrypted: i=1; AKwUvByLIm5RVwbTuH74BT2XedgS5DD0yzHnE8V/t21srNQCCRgcRmYC8A2WkhssW+LmJup9IkcKX9zwERvNWmA=@vger.kernel.org
X-Gm-Message-State: AFuF++nvmouLCsQ/GcNJWRzMXQxKA41InoglwmsUwPMSkrwngcJXmho+
	+U1Z878DfUFfjDnnulcyTHCYDjPxgTA3jpR+vVhBI1Y3sE5hb56sBMo4
X-Gm-Gg: AYBFou0rfQcF1kG64ps3uucWwUmjKpz168nLu+UjgiFDEBEh3oCFintFjCiNjeWdUJr
	932hZK79DoVIUPAH+7+2Z1LRxWc1YpZPQGvkxeKiGy+LvhDnpRvAp2M2hXDrvlt9QOW1CLreS8k
	cvqtNgNtXrCWW4WUwRSTco5YlvhjiyjjFCsA8iJSb7Ni8iAFYoeA2CEBh7yAZ99LqxG5uCfO13E
	6LptbeDUGjA5Mj8WpmHzufoql5sxaA3mNLqrpLcrAgzE3V26R7CeBP63JAMagf1szazuse50aMw
	Y867kNiab35KnXsne89QrXUX70zoPdRUfr0g48ts/cHbtBr4EJtFt5wzyAVpFhmDALDg1gOY+Ll
	x2TPwlyPvdaR28l3lc4n/l9KGC6hG4rfMMydE3QAs5Ds0LMG69rKSP5D7vhQ61SOuXnMreaY6bs
	CVjQmEkqAYPSZ9u9n3txhCgDWuB4/r2dAMbxAzn+EkCLtBlA3EmWxD+3Wfhs344y/AmwuVQpHIs
	fwB0hFWozKBdBh5Qo+2YH4lA4m6Unu8FLLZ23Hj7CtHmzD6NPNddYLIITZzg44PU3pU2NBsw38d
	1pN4TjDd4W8Q1alELSJIKNnB5DcQQUDb5Z7iY1sc1jTryGY42wgRgvkH42uvEotq7bujaMYFYOc
	zODwEM8Kul4TBGlBlnE/LZ+/bs+K8oR/iD5RtPZV+S89CAHGcc7lB0ZeI0oZ6pO/cwSgkAJnV9/
	CBsB7Y6OAqtGTB+dDmp9kmkiy8GscB
X-Received: by 2002:a05:620a:471f:b0:93e:4f4c:b380 with SMTP id af79cd13be357-93e9b2f09fbmr1114619485a.10.1791474132642;
        Thu, 08 Oct 2026 08:42:12 -0700 (PDT)
Received: from node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us ([128.105.144.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991a014esm507954485a.27.2026.10.08.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:42:12 -0700 (PDT)
From: mosafer <mohsafer@gmail.com>
X-Google-Original-From: mosafer <mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	Mohammad Mosafer <mohsafer@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] driver core: complete deferred binds when drivers_autoprobe is off
Date: Thu,  8 Oct 2026 10:41:05 -0500
Message-Id: <20261008154105.256340-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Mosafer <mohsafer@gmail.com>

device_add() registers a device and then runs the bus's initial probe
via bus_probe_device() -> device_initial_probe().  With
drivers_autoprobe disabled for the bus, device_initial_probe() skips
__device_attach() entirely.

That is correct for automatic *matching* against the bus's driver list,
but __device_attach() also doubles as "complete a bind that a driver
already initiated": when dev->driver has been pre-assigned outside the
normal match/probe path, its else-if branch finishes the bind by
calling device_bind_driver().

With autoprobe off, that second duty is skipped too.  USB depends on
it: usb_driver_claim_interface() pre-sets dev->driver on an interface
that is not yet registered, documenting "let the future device_add()
bind it, bypassing probe()".  Composite drivers (cdc-acm, cdc_ncm,
cdc_mbim, ...) rely on it to bind their sibling data interfaces.  If
drivers_autoprobe is written with 0 while such an interface is
between the claim and its device_add(), the interface ends up
registered, with dev->driver set and iface->condition ==
USB_INTERFACE_BOUND, but never bound: its knode_driver is never
attached to the driver's klist_devices.

Teardown then trusts those flags: usb_driver_release_interface() ->
device_release_driver() -> __device_release_driver() runs a full
release and calls klist_remove(&dev->p->knode_driver) on a
never-attached node whose knode_klist() is NULL, which klist_put()
dereferences:

  Oops: general protection fault
  KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
  klist_put <- klist_remove <- device_release_driver_internal <-
  usb_driver_release_interface <- acm_disconnect / cdc_ncm_unbind

Reproduced with syzkaller's C reproducer on a 7.3.0-rc6 tree:
instrumentation shows the doomed interface's device_add() racing an
autoprobe=0 write; the bind-completion branch never runs for it; later
teardown hits klist_remove() with a pristine node.  With this patch the
same instrumented race completes the bind inside the window (knode
attached, crash gone): 3 VMs, 5 min per run, race window hit and bind
completed 8 times, zero KLIST-REMOVE-BAD, zero Oops.

Gate the flag on what it means - automatic matching - not on the
completion of a bind the driver already requested: pass through to
__device_attach() when dev->driver is pre-set.  Other subsystems that
preset dev->driver before device_add() (w1, tegra xusb,
zynqmp-ipi-mailbox) get the same correctness back; when dev->driver is
NULL the behavior is byte-for-byte unchanged.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: b8c5cec23d5c ("Driver core: udev triggered device-<>driver binding")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---
 drivers/base/dd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f6525a7ee8c5..98315264295e 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1149,7 +1149,17 @@ void device_initial_probe(struct device *dev)
 	if (!sp)
 		return;
 
-	if (sp->drivers_autoprobe)
+	/*
+	 * The drivers_autoprobe flag only suppresses matching the device
+	 * against the bus drivers.  If a driver has already been assigned
+	 * to the device (e.g. usb_driver_claim_interface() pre-setting
+	 * dev->driver for an unregistered interface, expecting device_add()
+	 * to complete the bind), the bind must be finished regardless of
+	 * autoprobe: otherwise the device ends up registered with
+	 * dev->driver set but never bound, and teardown oopses removing
+	 * the never-attached knode_driver from the driver klist.
+	 */
+	if (sp->drivers_autoprobe || dev->driver)
 		__device_attach(dev, true);
 
 	subsys_put(sp);
-- 
2.34.1

