Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586073;
	b=UrTnTxaM/6w+HWQbWvl84ktIAW7mNq/+UZvO9K2iwU8P1whKEZONr3flcyknxhOLvHLv
	 JFGmtghVlDhZnFMrLJ/sKK1J5Skqc8+rqGSrAGO4CflHh1qgIBOzQSCZlrbdSl6N/8yz+
	 DXFsklz5fpI7J0JpHGuAA7UKhVjc78dHq/BOe7qKcEy3U1qbkZHuhxeT/HN0O76It6o0K
	 hXUGhJTYiueJjVOuEkj/45Y2j+ocxcdqNhEgdCViKP0wWYOZWe8i1wrydPV/YWJGm5ub0
	 Hnhkc0IeCf3xtyiDclV1AeD0R1cYBwXIL35SKK069bm08xxDKTLceNhBaIrLUpQlqYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XO8Ovd8Yga4MN2GzBAV0MC7glt1HQ8NzqivIkAGhHag=;
	b=J1aJu+14dujUdqDe+F4BeZOlD3houTgYjZhZXwOi/2Ec2/Cf7hIS/xwah5YaR46iQM3/
	 lNozecKoO8hi7x4hf7ZCo6tFn4IBQD1/SY6B34wzZmCCU7XRCsCK9JO/x2v79iXL1ecJW
	 L2/f1lwVUOhMw/gdhZqtyLsVzN8sgLoM37S7o0AooeJAFkBwX2AmxcaccPdh5FUq2NTNu
	 wyo/6mMU6H7x1xtqj1HQlzgQgSp46dvoA4Zg6E/s5G3XDofQmOh0XarbyTWNAsalGr/zI
	 r0MmmqaZlhzITg4hy8VOdecr2cZ3sqPUXZnMO5jpwCNqYlYCE2hEVw0OPdOkzbt/TgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIGMdYiR;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D93606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D93606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIGMdYiR
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso410915a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586072; x=1793190872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XO8Ovd8Yga4MN2GzBAV0MC7glt1HQ8NzqivIkAGhHag=;
        b=LIGMdYiRZ/LgfeAWS3K7xA4D9vdGmAhtmyJIzl7jROn5XS2gJKFwOEIIi1HCzyuGoZ
         vqMD2l3P5uiOYvLgciZ1LglD+5hmKqdh+c1QhDxUI8Xw5M57AdaB2cqqGrhqfRexV+gq
         UxC6RZsD2fIWcFbV3mxCQMLYYsbMFTCi9KEBYom1zlXPrRRtZBtw/lUR52kkaX996xeN
         P06rzkw8b+oBb/ryHRDCu57R4HBaWWN3L9roc3JeD7NG86fQLgVf0NhsqO32c6vXH+in
         XMlc5L+PRGh5LUWGk6lxW8NL71++Acn7CeaRZRMWj0QRFu1QNIEQPi2OPP1jaNKG70kr
         Xbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586072; x=1793190872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO8Ovd8Yga4MN2GzBAV0MC7glt1HQ8NzqivIkAGhHag=;
        b=1Dlop/XElJWUbVEpWuPPOMASQUaPgDWg3MzCCHF8lJlk0XRMvTBuyNNOGUvPjdYKw0
         Cu+ap2jP0luwGwH3GHoEa2w6GUbET0ktmyPHjl3IjvJTQotvyAHxmyJsEL/TdOEu8s5t
         mn2stDAeSK6v1BX8w10zODgS2z2CoUw3VAeDsnMJB9HTmXWukuDIV5MuBNGRtinEaCBs
         8kEVlPP1FoM8+biFKb0x7iuvL5VrWViVmDfMcz4YA4HKYuFVDSHYXBXJ00UbQ3V6EW16
         RpGov60v6EHE0f1d7rIYdqyyNSgG7DIXOjCPrQgsP7SW5Rg8FwYPwBfGbca+D7KTrtyL
         UOWA==
X-Forwarded-Encrypted: i=1; AKwUvBw9iVLYwA3zBZre4/4V5IDZra3JzGdOvD7qoM54iy2dDmLO98qyS68qpEUgLtXhNiy0b8e2cY/yLIg4Yew=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCS8J3VuUpI8yb7qGVUxkkCTVW34Ly5iNuKru/khpKwsTShyLT
	kBAX+QbhdBRTpTAeqHzoIFJ6HaQ/rj5P20gbrMb5p3r/BVNI3bUEFuCT
X-Gm-Gg: AYBFou0hY+7uQtWfjzUx+xVQ/fU6owK75BZYbyf/zJrCwvnFGWxKAKA9yfmMjOumsI+
	1NWhnGm+GB6R20/b6Y9pXG12Ya3xLvJvOFYEMPBUsXq0iXvvy3TeQpXmBYDoqPERzfnoXmksvW1
	lh8hombMt22x5ZLwAN9D/yL7NQGNBAls33ad2kAHFyY6RcXKj2KKXVn7J01lEPRMhmmSuCPSgNN
	rn17oZ/Pno3dhqHmAW0uquvFwxtcor0aPoY+a551ndSgSO2LkcDdSeM0TtNL1jRhXohJXOjTqhg
	u+4HzN7DyyfL/D7woBBjH1R0MVeetKQ9nnsPwPvULaQHoR4UyAllnPKEBzNFtPVLz6BbOruW4fg
	cBN6cJxwtK4RXHBvQHdyRzeuksUAthMD0EeNeLEfQ85uxitdRzQTtKu//PFO3VodyWCgaITSig7
	Y73/ubzFjl6Np/djoUl3oBb2pRU7pawP7zwo+0M32tfuzKFl6p6Xz30ssdyZDghhZOE7f+tFX2P
	7DqA3/K1qkJCpgK9joEi+5iY2/5gjxHATuur/xMJqcmUhqiz2mPGyo2
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr1474331a91.26.1792586072096;
        Wed, 21 Oct 2026 05:34:32 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:34:31 -0700 (PDT)
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
Subject: [PATCH v13 0/7] Merge redmi-wmi into bitland-mifs-wmi
Date: Wed, 21 Oct 2026 20:34:07 +0800
Message-ID: <20261021123414.25516-1-qby140326@gmail.com>
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

Does accept_zero_function still necessary since the driver now permits
0x0 function field on SET operations?

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

Mingyou Chen (7):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add quirks table
  platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
    if last performance profile is not available
  platform/x86: bitland-mifs-wmi: Permit zero on SET functions

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  11 +-
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 357 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 ----------
 5 files changed, 259 insertions(+), 271 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 893018d51f27ec0449155b0afe371aaf65380630
-- 
2.56.0

