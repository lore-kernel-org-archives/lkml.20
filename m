Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7903D0934
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180618; cv=none; b=Aw7sGsuNVwmpYuv+MXGZahoRES4XlEkDrN7ukfm1FUVOJhQnF5Fdgfwv3+7fYyqKr71qhtLBJ5drfsS1ICfqqhRDq95LJqBoxH4nztyCTwzulx8DjBdur9m7TOhRb7ONNYfMmRvHaxKlEdHGH2dig+THmosSLXuflH7K/e8xbfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180618; c=relaxed/simple;
	bh=StScrlx6lr6n0DYNI1exVra22pUcitIIBu1ey0wEmT0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fc1DiDJPwa36ElumgVeEaggeU3dOpJarlQNgm5he2zVfu9SgkgslombNEjG6xHiBio6jAVqVlyfTc5ncJ1/wbTnwjjWpZCPfT64t0MPwgjP/xoYXj7v0+wvynq5/M71F9cG+QrQ8ghTxTFBwEOUQFLgPGuPfgIHEYMMu1FfWDRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=XWS3YcMo; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="XWS3YcMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788180605; x=1788439805;
	bh=zHt3KzR7Tm3s9s61dun5SYzT6Lk3sZsQIaVY+2vg2Pk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XWS3YcMojiRcvs+QWy/tq5sFI5+nehFj+daZjiFcYvoqil4jmMz8HxZYwNT0+lT9u
	 b1Xn6nfSJ2XVey+Kom2diFu1FZIfZTNoiPj+twm2vswOhTuARCR4KtYOrfAWomoVP3
	 0S/Zpp4Z/XC8ZInYyHALFzU3BPrH3i0qIykelNPNs7JZzw+0Ml0WUV78ILaVNOVynT
	 qYJUK6aajQAWSz/hQO8EUAq3W1HqGRvvJYIZUjFBDqaRX7bEerWsxRYmrvX4ZFenr8
	 jUdYTVHiBelXMCMuVjEP7RwfpHemUYQ09J2NYZvbRcjqq6pS8kceKlqzG+JyHgHMs/
	 wDMrEc8duPbOg==
Date: Mon, 31 Aug 2026 12:50:01 +0000
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Kiran K <kiran.k@intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: btintel_pcie: controller left dead after a boot-stage error, 1 in 12 warm reboots
Message-ID: <20260831124952.87484-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: d8e0ff226e3516f67d3a6cb3052fd84144127e13
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Roughly one warm reboot in twelve, the Bluetooth controller on a Surface Pr=
o 11
comes up dead with BD Address 00:00:00:00:00:00, and stays that way until
btintel_pcie is reloaded by hand. This is a report rather than a patch: the
trigger looks like a device-side fault, but the driver has recovery machine=
ry
it does not reach for here, and that part looks addressable.

I could not find this reported anywhere. Searching lore for "Unsupported cn=
vi"
returns only patches carrying the string in the driver source.

Hardware: Microsoft Surface Pro for Business 11th Edition with Intel, Core =
Ultra
7 268V, UEFI 17.105.143. Controller firmware 2026.8 build 113003, bootloade=
r
2023.33 build 45995, unchanged throughout. Ubuntu 26.04, kernel 7.0.0-30.

What differs between a good and a bad boot
------------------------------------------

Twelve consecutive warm reboots, one kernel, one firmware, nothing changed
between them, thirty minutes end to end. One failed. The second-stage firmw=
are
load from each, trimmed to the lines that differ:

  failing boot                          every healthy boot

  Found device firmware: ...-pci.sfi    Found device firmware: ...-pci.sfi
  Boot Address: 0x10000800              Boot Address: 0x10000800
  Firmware Version: 107-8.26            Firmware Version: 107-8.26
  Received gp1 mailbox interrupt        Waiting for firmware download to co=
mplete
  Waiting for firmware download to ...  Firmware loaded in 645371 usecs
  Firmware loaded in 685555 usecs       Received gp1 mailbox interrupt
  Received gp1 mailbox interrupt        Waiting for device to boot
  Controller in error state

One extra gp1 mailbox interrupt, arriving before the download rather than a=
fter
it. Same firmware file, same boot address, same version, download times wit=
hin
10 % of each other. Counted across the series, every healthy boot has exact=
ly
one gp1 interrupt and no error state; the failing boot has six and three, t=
he
extra ones being the driver's own retries.

After that it fails the way a driver fails when its handshake is out of ste=
p:

  Timeout (3000 ms) on alive interrupt, alive context: intel_reset1
  Failed to send frame (-62)
  Intel Soft Reset failed (-62)
  Firmware download retry count: 1

three times over, and the controller is left with a zero address.
"Unsupported cnvi 0x00000000", which is the string one would search for, is=
 a
consequence several steps down and not the fault itself.

The part that looks like a driver question
------------------------------------------

btintel_pcie_msix_gp0_handler() detects the condition and stops there:

=09if (btintel_pcie_in_error(data)) {
=09=09bt_dev_err(data->hdev, "Controller in error state");
=09=09btintel_pcie_dump_debug_registers(data->hdev);
=09=09return;
=09}

while btintel_pcie_pci_resume() reaches the same predicate and recovers fro=
m it:

=09if (btintel_pcie_in_error(data) || btintel_pcie_in_device_halt(data)) {
=09=09bt_dev_err(data->hdev, "Controller in error state for D0 entry");
=09=09...
=09=09btintel_pcie_reset(data->hdev);
=09}

Reloading the module recovers the controller every time, which suggests the
device is not permanently wedged - only that nothing tries again. Whether t=
he
boot path should call btintel_pcie_reset() the way the resume path does is =
a
question for people who know the hardware; from outside it is the obvious t=
hing
to ask.

Rates
-----

  retained journal, to 2026-08-30                     16 failures / 50 boot=
s
  controlled warm reboots, 2026-08-31, after a
  firmware update to UEFI 17.105.143                   1 failure  / 12 boot=
s

The earlier 16 were clustered - 15 inside one 24-hour window - which is why=
 I
waited for a controlled series before writing. Note also that it is not
cold-boot-specific: 12 of those 16 followed a warm reboot.

I can test patches on this machine and reproduce on demand; twelve reboots =
take
half an hour. Full logs of the series and both boot types available on requ=
est.

Thanks,
Sergey

