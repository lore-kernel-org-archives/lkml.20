Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009397;
	b=uFLw5n/El6TgV1aM1N77o+IOgsPFy1iX2AVLNCHXsBHE83BRR/UjM687QYh2BhS1VKxl
	 1fIbE3rPL+XNB7DQtwjjgtByseeFYTHJiVCTUVbnN/lj5AhoxI6i+tvA+j0r7BxLyqXBv
	 qlOnykygSVbLAWxuETW8CUOLy/pYAUNFYOCGg2v3iGzSYQJghqiwUh8ArtaJAgCsnp5TP
	 Elk89h1KbXGMW/ZdHqCvQ/a3oLuRWvCc60hK0NQH2CycsjSr1n4C9OAZHz+SMxjpUBtOK
	 ZM7qs+lv6Zfhi8LgwqbX2OF32ApV9PELMj1V5/yoNG8DFF6uP4rDO38oD6kWKtPzYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EtflxX4ou/rS8siTGeQ9/kzfCic2/dNUrxNTnt/0D+w=;
	b=hRywCiZk6tzAACo43blFJ0EI7gZ+PUNyd4dQs4HW0bed594F1i22ATxXMsINPjgzQ5zb
	 v5vZpl4rsaQ+YnAkOh3DrE3lmGL9wMYmNJduQPeLJrC92UI6t1j0nSmah0q/aJztS/YUD
	 3U/44IB7qYz8aas20Ytb7kJp8d/334ttU7kZemqctT45C2/fNfq2hl2/LHBYY2QFDRfpm
	 eYMGTLubPB/6z2yrjyffYkYTEQG+B+HFNWuoF9dJeMnejfyZ7q8xrcqJ/S3l/8LFea3oL
	 zh1ruYhj6h2UbUXG0E1MUAvI8+oOVwxvmtu6QbwGWw6stUE4h3p/JjzKtomd7Xvzgxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RQixQwAh;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2340160A260F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2340160A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RQixQwAh
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e977109392so15807435ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009396; x=1793614196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EtflxX4ou/rS8siTGeQ9/kzfCic2/dNUrxNTnt/0D+w=;
        b=RQixQwAhL1cEL364bEARsYy8uGw4LKnpmmsgI9aiUTrSJESIUQ2hzMOwGo7x3DUehx
         G+TnSnTNG46yYPsTwLYpRuyOGKVy1YwQ5Va4b2XBLcgwc9FrDLS25aIW9xj6TT9B/p4V
         Z8DcGTszFwD1TA6nth5uXT+yWLnkBep+74VpH74YMRCqB1EmNGnNwC9xyHCGYd/Y9Vja
         R9/Pz+B4FEW1/QhpMx40AB6ffgtEITLTw7uup7cFL+9FHIoAoIlrYZyP38wyfvTS6SiQ
         8ZwD1PAU1hRXcD21nTbdRCicQfU11LqwkzNA4xp8jEh6hr2vmsjxwn4OsLZOJExrXClI
         RwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009396; x=1793614196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtflxX4ou/rS8siTGeQ9/kzfCic2/dNUrxNTnt/0D+w=;
        b=UJSvn7ZRKAw95/TjxSAvBlmKltEWGJiTNkKorn4cUL6GF771vQwJ/maRlnwcP+9U2s
         TSqqp6Y6h1osUOKRBU0FnXLsAPXMkMReOe3V0G7GTM28EU6vPM68ivKWIx/jyRzKTTyr
         0ZZTulzPW1X/taLUPqhGGgRDFOf2xkJGB32QJJBt/mDH4FLwYFkpKMANUb41LE4PQzNx
         TN9RryCHh9slMnTiLovqUU+jgBAv5/0cmKuXK6YKN4WI6cUtLhFri3DCUXO56hQsc4T6
         SQIQKoXr8+xxMNGDLO3FtTPyC9x3gB+ryH4PU60dkNVKRh29BCOVMxuOnF48R6UDmcQY
         zsbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpgG5HD162NE6f8BGWu955z6O7sBuB/R/x1qpE4XAZDULvCkJuDi/lzD4rOr6ZZ0rpDgJByU9FUlyH1mY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhcVboszLIVGrHBeKjiruBzXD2fdkaC++WUuxyNcysH/EwqSjl
	EBpytZ+GQ8kcfBGA7NtgralU1bJZx6ZVWAmMxHNHIdMvg7lopcRCljwVnJMgqaTi
X-Gm-Gg: AYBFou0BNq9dFCPPn2QpC0oQnV+S1f7ulxSRh2o6mG2nweWl2UKF6ksvwutVZ8J2NPa
	2Uajg/WmrkL9TdltIgNFfz1Z4+pwJbD67vCYDRQGZdaKPzaspUjkmJ+S3jeE8zv+ixIiIFdt6YS
	NzokRFLRDhK8QBN/BlhRZcUTl0VVk2x6PBZnfmpfrELaQ1yVDl5M1Rt/9NetwUk5AHLpvRuy59y
	wZYGCGZmmfupb8VrDU7DfpbBEd0eGGR/6QcmCdWn9RViKRn5EMe2RHPX1hyV5yT51kqUl9QqZCB
	pCi5JT3fs3/fquoXq1nRnJo5DjqCK7sEyJYJi72wpnm2DToWgmx9IsoVt4SCrYyNEjAqRPGs3GR
	/k37ZVj0ZnTieiulfp3OCPiAGwcRu8tDl94MAoWVrUPTx+jtRr5y+4iW0ka/QIQD62toSqW7Za1
	4ZM5bfw2nnuy28HtutsJ3kzcvIu7trhZqTt842t9wtyqdeLMrclVWysMo27wwPx1kbQLGvpINwC
	G99d3lajY1JfRGPuThIBHjbQMq8cVDSOd5YZpw=
X-Received: by 2002:a17:902:cf0a:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2ea9c82f6f7mr53434965ad.44.1793009396361;
        Mon, 26 Oct 2026 03:09:56 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1e52f3sm14586065ad.67.2026.10.26.03.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:55 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Mon, 26 Oct 2026 18:09:21 +0800
Message-ID: <20261026100927.217643-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition
for Redmibooks, dropped the previous redmi-wmi driver and intrudoced
the quirks table for the bitland-mifs-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

Tests are welcome.

And by the way, the no_set member in bitland_profile_entry means a
platform profile is only report by the firmware but not available for
set.

And I've got a question, from sashiko's comment in my v12

https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com

> Will this result in the loss of KEY_PERFORMANCE events on event-only legacy
> devices?
> Looking at bitland_mifs_wmi_probe() in drivers/platform/x86/bitland-mifs-wmi.c,
> if dev_type == BITLAND_WMI_EVENT, it returns early after registering the input
> device:
> 	if (dev_type == BITLAND_WMI_EVENT) {
> 		/* Register input device for hotkeys */
> 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
> 		...
> 		return input_register_device(drv_data->input_dev);
> 	}
> When the performance key is pressed, bitland_mifs_wmi_notify() intercepts it,
> invokes the bitland_notifier_list, and returns without reporting an input event:
> 	case WMI_EVENT_PERFORMANCE_PLAN:
> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> 		blocking_notifier_call_chain(&bitland_notifier_list,
> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> 					     NULL);
> 		return;
> Because the platform profile and notifier were not registered during probe
> for event-only devices, does this mean the events are silently dropped instead
> of emitting KEY_PERFORMANCE like the old driver did?

I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
bitland-mifs-wmi) looks like an event in this LKML thread

> Since the event reports a change that has already happened,
> platform_profile_notify() is the natural way to pass it on, as
> suggested in my v6 reply: power-profiles-daemon then re-reads the
> profile, which is harmless after the driver's own writes too. If
> KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
> keep these events observable), it may be worth not reporting it for the
> event that echoes the driver's own write, or at least saying in a
> comment that it reports a mode change that already happened. On
> Ibragim's TM2209 the profile SET is reported not to work [3], so there
> 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
> you confirm?

https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/

So should I follow sashiko's advice?

And some remaining comments from sashiko's review of my v13:

> > -	/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) */
> > -	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
> > -	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
> > -	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
> > -	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
> > -
> > -	/* Xiaomi G Command Center */
> > -	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
> > -
> > -	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full speed */
> > -	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
> > -	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
> > -	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
> > -	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
> In drivers/platform/x86/redmi-wmi.c, redmi_wmi_notify() reported these
> keyboard backlight events (event_id 0x05) as KEY_KBDILLUMTOGGLE and OEM preset
> power mode events (event_id 0x16) as KEY_PERFORMANCE through
> sparse_keymap_report_entry().
> In drivers/platform/x86/bitland-mifs-wmi.c, bitland_mifs_wmi_keymap defines
> the four WMI_EVENT_KBD_BRIGHTNESS entries for KEY_KBDILLUMTOGGLE:
> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },
> However, bitland_mifs_wmi_notify() returns early for both
> WMI_EVENT_KBD_BRIGHTNESS and WMI_EVENT_PERFORMANCE_PLAN_ALT before reaching
> bitland_mifs_wmi_report_key():
> 	switch (event->event_id) {
> 	case WMI_EVENT_KBD_BRIGHTNESS:
> 		brightness = event->value_low;
> 		blocking_notifier_call_chain(&bitland_notifier_list,
> 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
> 					     &brightness);
> 		return;
> 	case WMI_EVENT_PERFORMANCE_PLAN:
> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> 		blocking_notifier_call_chain(&bitland_notifier_list,
> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> 					     NULL);
> 		return;
> 	...
> 	}
> 	payload = get_unaligned_le32(buffer->data);
> 	bitland_mifs_wmi_report_key(wdev, payload);
> Does this early return leave the WMI_EVENT_KBD_BRIGHTNESS entries in
> bitland_mifs_wmi_keymap unreachable and cause a regression on Redmibook
> laptops (especially models that only expose BITLAND_EVENT_GUID without the
> BITLAND_MIFS_GUID control device) when pressing the keyboard backlight or
> power mode hotkeys?
> [ ... ]

Don't actually agree with sashiko, if we report the key to the
userspace, when WMs handle the KEY_KBDILLUMTOGGLE key, the keyboard
light will be triggered twice if the firmware already respond to the event,
which is not expected.

So the question is, does the firmware respond the KBD_BRIGHTNESS event?
And should we report this key to userspace?

v14:
Drop the accept_zero_function quirk based on Chris' comment
https://lore.kernel.org/lkml/CAAcRvKPSk5FYzZGkw12cPVGkxWVGFACwRvupBDDNae7B_JwF0A@mail.gmail.com/

v13:
Fix the zero function value problem find on my device
Fix the memcpy size issue
Remove WMI_EVENT_PERFORMANCE_PLAN_ALT in the keymap
Select BITLAND_MIFS_WMI and deprecate REDMI_WMI instead remove the
config entry

v12:
Fix the issues mentioned in https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/ .
Copy payload_data to output->data at bitland_mifs_wmi_call, not
overwrite the entire struct.
Correct the key name (Mic Mute) in the commit message of
"platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries"
and my device doesn't have a FN-ESC key, so I renamed the enum variant to
WMI_EVENT_MIC_MUTE.

v11:
Add missing return_code_at_end and accept_zero_function logic
Fallback to balanced platform profile if resume to performance failed

v10:
Replace the previous "profile table" with dmi quirk table

v9:
Add the missing feature introduced in the commit
e0d6312578e1 ("platform/x86: redmi-wmi: report EC state change events").

v8:
Correct Ilya Gladyshev's email address in the MAINTAINERS entry

v7:
Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
in bitland_mifs_wmi_keymap
0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),

Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
Rename the reserved names
Use Xmas tree order in bitland_mifs_wmi_notify
Collect the Tested-by and Reviewed-by tags

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.


Mingyou Chen (6):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add quirks table
  platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
    if last performance profile is not available

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  15 +-
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 353 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 -----------
 5 files changed, 259 insertions(+), 271 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 9d3475065167197742b0882aff21cf8e78393277
-- 
2.56.0

