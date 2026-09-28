Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F04502779
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633298; cv=pass; b=sFkmvs1R8e5y3jsxkM7TMkZhRxT51tCY/3+eRYpsp1h1cPsfSIX56CmGHpm8frmAepcmAgImuF5tXBM4mL/VTMLkmtQqK5aVDWp+/BwMQ+z81T1nYBilcy9zPIoaAoXvm8oq6mBHvXsKf/+oxfGeMl3CUwGrqB7zllM202GVBOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633298; c=relaxed/simple;
	bh=SzImJYMfymE8sykAXPSv/mWUCQ+vfnBooY/CiPR+OCU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=d48FugKb8awc7UBOTeNrL/1EoB7CZP1y/oSuve/DBG0LLmnHqaZnZdTlCDE+881FI+xzE55w9smVRpqctjc7864wXyEvepceHxmwiDZFMOMFikl5KwnI+yDfgqtgqaZf40fbu9nZjvshZQBo5Z0P/N6vPQCaKx8Yhm1DbhqbLac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qikb6KAM; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qikb6KAM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso334879a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790633296; cv=none;
        d=google.com; s=arc-20260327;
        b=ZnVZ3L1CrN6JW/4XzxNoi3DvAJYfosXk9OqStKNqo+NJURLkZToBrdI7WqYuw6aPu0
         ftD8Y1+5lIHrTVTu5w/8fo3AHw/Vk4nH6sb2j7Im1+beXR1GqgsEIwgcF1PfS6EAJABH
         GaumuXiEjfiw6y16L4716z8NJxJzYxkPa/RN2icHxBg0ZT7DtYSBt4VVq8JLdU//hoGN
         lG11yfte46/o+rlOdqLKybOuHvwE3UY3s3iqYJfvfJfvkduDuP2procK6dX9PSxSZEoT
         oj3t3pxwZT4p5DFZm444PNI0DJdQkvwSdWn8NbDKDrhAARZNih3Oc+JxSUzU3YnQKyCL
         FRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=D1ze9HPfjWfjvyQJHsSv47RyPM7ssoFWycdCeIx1780=;
        fh=YJNQeuUDhMpLIsjkjw/GlUaYU97HvKGxfqW8kAuHs8E=;
        b=rkqsQfQoidMrq6j53h97jCF/tjbCzBgQE9K+DlPu1fjfomb4m1tLfMu/QupCIdED+O
         Id6SsSh/ibXdKegy2C6jDaUAIZ+k+vHZe6+oxVuL2YIOXp6sl36BRmELWA8iZIKzBpBf
         Vm4JkKodgp0Wpkg0n9WfMMTSpN3KNy6TrXyZxp5J72Y8wLQ/fC+m+tZ/BPapymX6avHP
         P8TGDEDSI34E9YKvdPF+4px12oyBxaTrAZh8leQAQV2mN4kMoOykyY0VjC2Xbi4bZ1zQ
         +WUbaNuDovSj868dzRb6nfGIi9AZHfKPtwr9IzXPuaQvAxbj6GbELawZ4gY0m/+eYLlf
         R4kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633296; x=1791238096; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1ze9HPfjWfjvyQJHsSv47RyPM7ssoFWycdCeIx1780=;
        b=Qikb6KAMKnC8mMpkAilSXDMVjjwlwI3ElYJLTF8kVEzGPAVQnsgu9FEIjbYsLBQqSL
         C78/InFEuCFMtM+4LW++uT1zY5wNnAQvBDi27aRmXMChJrObueMBI0Ixn2sD6Mk3/gD0
         xLOI+k11NkdWd/oKH7DASp+D7CQFZKKJvmhH2hZ/k+L7BLqMCftHAXsBHynfXDEkxH2V
         2BCorx6mnTXifLdkceqimzY1CixMJH8TmOgfABeOWBUw2SeEwCH++v9qe7KxR3iq7EBB
         J+qD4tJXG7U93Ju6n/OetsDRf7oqD/HZcMXuwcbQFmGrtCEcXZM+ROEvZyKjOdEwFnx2
         Rc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633296; x=1791238096;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D1ze9HPfjWfjvyQJHsSv47RyPM7ssoFWycdCeIx1780=;
        b=fz/WYCWVRGZWzjsZb8chZ3WMPCXd6/BW+uP0ezpTVWPNfT1zRcGltq1m2WFh71x/87
         pfoFNueUolM9w7l/N1g+TLCQwfuNoXrEhBwaUiRgM3weYnlcHFvG0Iz/7zXXloIH42QP
         260hhbe+o4us63YUWgOSTv2rTaothV8Xlg8exhIX6Na71AeF8qY1Y9QLcKq8tr+vnK+n
         ySlvglPdsJijCn88eHkNEflyYuAXOYcRl7iU8LRum8HvfTSzi7vqx5o+vMouSzj6X3RH
         MnHBFuFpHVdHWN9ows6c8a1pukXZvSWb0mbqcOAJB+dkshAJIo1TnsqsDxrzAWF56Kw9
         M+lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNG2lHhSq7rxcNEgy+3/bxso11W9aqUCI1rQ0sA45QoxR6X23VvEx9+YCGXW1DQloIdfsoLJo/ZfxQFuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0C1cvbQr6cyX3VLfGljoSXHWe4G8rV9TpaqT/PKL7n2CWFjlT
	TIt9WIMzXtgFCelq5xidcK//ovkbF5xTR7mC0lR563IzIhy+YIcL5A+jm0Dk1fXuVIW5ThGcene
	MMpwGmDxj/yGnRjHGVHGqVZ/IGWQxAr4=
X-Gm-Gg: AYBFou1XZuVu3WKtkVODlk+x+c0Q3SS5CppS0RHkwRc1Clu8MC0GkSDvshU8jyGt8GK
	qKshu+eVz7hJRqxpxKZVefvgWJzhDWV77esiIcJb71NWVEB1Nn2EkK1/BGQ/In1Q9y6MzHXiHvj
	TIck1gLKqDWQ1Mhe3/YQfMEai6GPa4GyjJWb0y2/tkD//4PPeBHT1h/S266AuTnpodJ0osku8JP
	FlC/gzCFZBh7guc3069pYQyp5cUCLFS49O636WJ2RIR798jFNhcIBIM3DszmDi3omFctuEAzeeu
	tttlfY/eUEuHh8fsXkKvHakCYmh2bDZi5bPznAjJvTOEizItdR7unDv6aPn2giY424UzPbkfwBu
	UZLpD9I99RRN3eqBo5tz3
X-Received: by 2002:a17:90a:ec8c:b0:39e:2e7c:d43c with SMTP id
 98e67ed59e1d1-3a0bb552ff6mr8388164a91.7.1790633296328; Mon, 28 Sep 2026
 15:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Haris Khan <hariskhan936.hk@gmail.com>
Date: Tue, 29 Sep 2026 03:08:05 +0500
X-Gm-Features: AclHuK8nfD3n1L-P--ReJiOhAWtcSF00GXexEk-BbySvWubtT0hOi-mHhOLkupc
Message-ID: <CAPWg44R8LrM95GSC+m3M9vux-LG3SoxdBftjHyuLtYftO1yJ3w@mail.gmail.com>
Subject: ThinkPad P14s Gen 2 AMD: Synaptics LEN2073 stuck on PS/2, SMBus
 companion not ready
To: linux-input@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, dmitry.torokhov@gmail.com, jdelvare@suse.com, 
	andi.shyti@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a Lenovo ThinkPad P14s Gen 2 AMD with a Synaptics LEN2073
touchpad, and I appear to be hitting the previously reported
SMBus/RMI4 issue on this platform.

Hardware/system:

Laptop: Lenovo ThinkPad P14s Gen 2 AMD
Touchpad: Synaptics LEN2073
Synaptics board ID: 3471
Current kernel: 7.2.8-1
libinput: 1.32.0

Under Linux the touchpad is detected as:

SynPS/2 Synaptics TouchPad

The PS/2 interface exposes only two multitouch position slots:

ABS_MT_SLOT:
Min 0
Max 1

It can detect additional fingers through BTN_TOOL_TRIPLETAP,
BTN_TOOL_QUADTAP, and BTN_TOOL_QUINTTAP, but only two fingers have
independent positional data.

In practice:

- One-finger tracking works well.
- Two-finger scrolling is smooth.
- Three-finger GNOME workspace/overview gestures are noticeably janky.
- Windows on the same machine provides significantly smoother multitouch
  behavior.

The kernel also reports:

psmouse serio1: synaptics: Your touchpad (PNP: LEN2073 PNP0f13)
says it can support a different bus. If i2c-hid and hid-rmi are not
used, you might want to try setting psmouse.synaptics_intertouch to 1

I have tested:

psmouse.synaptics_intertouch=1

but the RMI/SMBus device does not become available and reports the
previously documented "SMBus companion is not ready yet" condition.

This appears related to the existing P14s Gen 2 AMD reports involving
the AMD FCH i2c-piix4 controller and SMBus Host Notify support.

Previous related discussions:

https://www.spinics.net/lists/linux-input/msg75885.html
https://www.spinics.net/lists/linux-input/msg101577.html

I would like to help determine whether this issue can now be fixed
upstream.

In particular:

1. Is I2C_FUNC_SMBUS_HOST_NOTIFY support for the AMD FCH / i2c-piix4
   controller still the blocker for RMI4/SMBus on this hardware?
2. Is there any current patch series or experimental branch that would
   be useful to test on this P14s Gen 2 AMD?
3. If useful, I am willing to build and test patched kernels and provide
   libinput recordings, dmesg output, PCI information, ACPI tables, or
   other diagnostics.

Relevant current psmouse parameters:

psmouse.proto=auto
psmouse.rate=100
psmouse.resolution=200
psmouse.synaptics_intertouch=-1

Thank you,

Haris Khan
