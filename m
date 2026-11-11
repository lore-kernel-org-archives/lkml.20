Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380180;
	b=vZx39U9QvgTy+vOTm4b76oZfeZSF/V5AjP1k3SoEJ8kWNrL+61OUoh4bxsuMIh6awcBf
	 DriT9KNkpdd6BM/+T15hT6W7pLivhg1uYnbw++W15sx20SicFSKBbTc5QMbIfV6VwMnvF
	 2Asaj72rBWB7rEErGypTfDmQJVyv1PFwGPLowuj5uwFbG8jxlfuaVefEWG1+VI3VDbuP7
	 rTrLx3UpPra1i044UQTGwcEadMWL9ScUJPSwuwXCVdxlJLiFCm9mBUFPgjw+MChV1lMMo
	 2mdv4Xi7vK3HOAzhavmnxEfp8W9LUaLKZDgAQNaGFXXBk2SzF1H/q/vkavJdRaMfhTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=sRt8SVJz/Vt9vpxkGcSvU6+JuP4VVZwcJ5DXfG5Bwk8=;
	b=bT2Be7re1KAzjoLuZd+SJUVabkh0LYEmaHYJxR/e3YAw1SkiyTV1THT6SBccf6mzLpxt
	 oSh/TaS81XRhU7Tu50ST0M+iUnIU5F2SF32Caa6uvORk5w0McBLOWTt+PmjoKYfiUjtDP
	 kiwdjg6YuR3cZk4mtgPHEfNHN6vRfWEZEM3YzlMtq2480MYVesqb3XMXGlUY5m0l2B0Hr
	 MCCl/L9J04FLljbqBgw4710vTmpUE8BL6NJReOT23l9VouWVL2DfktZ7nWQaY3Jnvbub9
	 jBduNZCUWcZe0fL2be4xlZSA/aqcz6Tb20BkUGPIV3m1F+gsXHlWEimjWhLy1bnM5IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vG+6Iv0i;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F73606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F73606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vG+6Iv0i
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so373568c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380179; x=1794984979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sRt8SVJz/Vt9vpxkGcSvU6+JuP4VVZwcJ5DXfG5Bwk8=;
        b=vG+6Iv0iVI2/fjDyZP49QfGvIb8ptaYFYOp+zSC0gewxIPWg0BM5R1LLE/pB71IdQF
         RNRWmng+gkMrYJ1O0gRkKqBGYZ1xBKHFZIRRWjapcuohTr3hNprA3jyoDKIy3uD+PRct
         iY2cIr6PjWnL7m/jgGbPbh3C0DAf+vthIwnrvEFOaIHcqwHtIH/41++kmCYdcRrbGTx0
         SXfRZG1Bb2ro5HMH54KMbg8NifIoq7snB/AirSRRaIVWnWCUfmosgteJNL2klHSKinW7
         LnD2T9W+QCoJmvzxHqdJcTCV/P8zq1arQfo9qSRbzHl40aaaA3emjHjvGF884oXLXFpN
         TMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380179; x=1794984979;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sRt8SVJz/Vt9vpxkGcSvU6+JuP4VVZwcJ5DXfG5Bwk8=;
        b=1EYIakavi0rC/DQoJAA7OblxGJ7HSZahgYYb4ilH2j+NSMp13xTl9+TEbXwuoWlyUp
         /f5jNVf6hGNgzq/HszRi8p9K9WRKy8zaRUPhdYUdiYZ7B13aiTtIZqY4zmS06vKzBTHY
         ax2fDfUjuHWWty7uy+ub4jGP/qF+KBc7I0qPYQqDV0Yiet5jGG2QzkxHGY9WI77YDdFM
         Cbmxph7X2XDoSi6x3Vhck06UaEsdtfGoZS0ntT3q9/z36k6WiuBHLTw0muhy+xge7Exr
         5lIGqx1zBX/ztES+PECb+i92yWL6wOkSw+1i3pQw9yxKIjoxY9vzwFU+N2WbXMzBBqLs
         qIBA==
X-Forwarded-Encrypted: i=1; AL+hErFQLWbCOLS0mjt23tSh5gnLa5maamN8b/Jn7YUH2jlpA9EVNksgRA5yg3xdwnMDYGadVnG85ZJsZ93zFv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GNy6nx5FCtpg128BzxJVf4Sf5LPNkN3GoJRi6MEb7tlwg3bzU
	UZvQ1GBx2CRL6VqbdH0Qi4aq6BhI6z8jXpiX8MltfYylMaYG/RXMC/VZ
X-Gm-Gg: AYBFou24ObsAHYbWT8m3chH1kvbL0LNMk+dvfMgimUke6+fmQpyzXlydncTOYL4aZbu
	yFuNlczvo5VCNCFybnlERsT7zPpcc7tthrcqLlXlVaGpqMZ6ZbyXEyLSRhYoxdlBKivzBZtbi6Q
	MbkEqi9BtcHBeLAa0D+RB6qgkGZpM5Mlp+qrmPtjuPc4q+HntejS1Th7YNycRTsl0uFfhvlcI5X
	UG0k10tACnFIYUH9OzmLvtE2/qE34E4KdSyFeYMLhkZiF+sf+nFim5HR5LgOpS0lPPgBkL+JzWp
	PjilqDSU7/yDsclmQx+J0dES0d8tbn2VsbrfJaXnIRM3JgpWPRokVJsfN/tMAudhxqk6MNr4cVI
	lRZD73c2cz2N1H+5+4+hi9cFzyTKrDyEB2KV2W1G0jzv+pHhZCjIHbIdwjF/s0Tk4pg6XQgSS/c
	/TJNuJ+V9DIKRSJflJw7c65FNIjho0Pn8dViwQfFNIh6m2ZsMPK2WtFLhtF3/Z1WUFjyPLMIO6I
	fBPS1w+rAU7ngk2PJW6jaefg0ZmauedY4Rh8nW7ow3+v7cHYLMo9BWeuB2qHT7VydPG1hctC0SQ
	IXmN5+vqw+2PSoOBisC4/wfQcDpd44739bWE04j4TGf78ig8OyTgOpyJ6T4QincKltZXV+Lawb3
	oOIBf0dScYEcgSXIAEJw=
X-Received: by 2002:a05:701b:4187:10b0:1ac:9da7:e881 with SMTP id a92af1059eb24-1b3c034a47amr1556236c88.36.1794380179189;
        Tue, 10 Nov 2026 22:56:19 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:18 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 00/33] HID: logitech-hidpp: G920 force-feedback fixes,
 rework, and cleanups
Date: Tue, 10 Nov 2026 22:47:58 -0800
Message-Id: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4P9GoC/y2NQQ6DIBREr2L+uhhAQ2lX3qNxoYjyWxUD1NQY7
 16w3UzykjczO3jtUHu4Zzs4vaJHO0fglwyUaeZBE+wiA6dcMMYoMdiR0Q4YtDIJloUIKcu2b0V
 TlBJicXG6x885+qh/7N/tU6uQlpJh0AfrtvN1Zcn7H9AbTVnkXMqrKARhpJswuC2Pvn0Zu1bD1
 OCYKztBfRzHFz5HYXDBAAAA
X-Change-ID: 20261110-hid-logitech-hidpp-6884bfb6a348
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

This series starts from Gideon Heinz's report of Logitech G920
force-feedback initialization timing out in v7.3 and addresses several
additional pre-existing bugs, lifetime races, and cleanup opportunities
found while auditing hid-logitech-hidpp.

The first 14 patches carry Fixes and stable tags. They fix the v7.3
G920 force-feedback initialization timeout by temporarily enabling
device I/O around g920_get_config() in hidpp_input_configured(), switch
hidpp_ff_queue_work() to GFP_ATOMIC since playback, gain, and autocenter
callbacks run under the input event spinlock, drain the G920 FF
workqueue before closing the HID transport on input close so queued
commands still receive their USB interrupt IN replies, synchronously
disable driver work items and disconnect input devices with device I/O
enabled before stopping the transport on removal and probe failure,
avoid storing an ERR_PTR in battery->ps on registration failure, avoid
NULL pointer subtraction in the HID++ 1.0 consumer keys report fixup,
and fix an off-by-one in G920 slot tracking that made the 63rd user
effect in hardware slot 64 unusable and leaked it across reopen.

Additionally in the bug fix section, hidpp_send_message_sync() is
updated to stop retrying non-busy errors (timeouts and transport
failures) so failed commands fail promptly without 15-second stalls,
and response buffers are initialized before publishing send_receive_buf
to eliminate races with concurrent or spurious packets. Battery fixes
correct HID++ 1.0 battery mileage event parsing to read capacity from
the correct report byte and update state, properly propagate negative
transport and timeout errors in ADC measurement (0x1f20) queries, mark
devices online when receiving unified battery (0x1004) events, fix K750
solar battery feature lookup and reconnect handling, and expose the
charge_type property for the battery voltage (0x1001) feature.

The next section prepares transport handling and reworks G920 force
feedback for next. Connect-event work is kept disabled in probe until
hid_connect() completes successfully. Transport error codes are
preserved in __hidpp_send_report(), and hidpp_send_message_sync()
is switched to return standard negative error codes on failure.
G920 capability discovery moves back into hidpp_probe() while device
I/O is active (keeping force feedback optional on failure and
excluding generic USB PID force feedback), device-level wheel settings
are separated from the input FF queue lifetime, the G920 range sysfs
attribute moves to driver dev_groups, and FF workqueue teardown moves
into ff->stop so open evdev handles across USB disconnect or unbind
no longer cause use-after-free.

Furthermore, G920 range store, effect upload, and effect erase are
converted to execute synchronously with proper transport lifetime
handling, avoiding asynchronous command queueing and work flushing
during device close and teardown. Effect slot lookup is streamlined by
indexing slot arrays directly by effect ID instead of performing linear
scans.

The final section modernizes the driver. Multi-byte packet fields are
switched to unaligned accessors, the device serial is stored as a byte
array, and resource management is updated to use guard(mutex),
__free(kfree), alloc_ordered_workqueue(), devm_mutex_init(), and
devm_device_add_group(). Lastly, unused kfifo fields and helpers
are removed.

Note that device removal teardown still has limitations due to how HID
core's hid_device_io_start() and hid_device_io_stop() (via
driver_input_lock) gate both driver raw command/response I/O and
subdriver event forwarding, disabling I/O before .remove() and
hid_disconnect(). For instance, HIDPP_QUIRK_DELAYED_INIT devm-managed
input devices are still unregistered after hid_hw_stop(), and
hidpp_connect_event() publishes hidpp->input before input registration
completes. Resolving these teardown edge cases cleanly will require
follow-up work in HID core and driver input registration.

Thanks.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Rebased the series on top of linux-next.
- Collected Tested-by tags from Gideon Heinz for 17 v1 patches (omitted
  from patch 4 where hidpp_remove() was significantly altered).
- Reorganized the series to place all 14 stable bug fixes upfront,
  followed by next refactorings and modernizations.
- Updated hidpp_remove() to enable device I/O while draining work
  items and disconnecting hidinput so in-flight transfers and
  force-feedback teardown can receive device replies (noting that
  complete resolution of delayed-init and transport teardown ordering
  requires follow-up work in HID core).
- Stopped retrying non-busy errors (timeouts and negative transport
  failures) in hidpp_send_message_sync().
- Initialized response buffers before publishing send_receive_buf to
  prevent stale response reads on concurrent or spurious events.
- Fixed HID++ 1.0 battery mileage event parsing to read capacity from
  the correct report byte and update battery state.
- Handled negative transport and timeout errors properly in ADC
  measurement (0x1f20) queries.
- Marked devices online when receiving unified battery (0x1004) events.
- Fixed K750 solar battery feature lookup and reconnect handling.
- Exposed charge_type property for battery voltage (0x1001) feature.
- Kept connect work disabled during probe until hid_connect() succeeds.
- Switched hidpp_send_message_sync() to translate RAP and FAP protocol
  error codes into negative Linux error codes (-EBUSY, -EIO, -EPROTO)
  instead of returning positive protocol values, and preserved transport
  error codes in __hidpp_send_report().
- Converted G920 range store, effect upload, and effect erase to
  synchronous execution with slot indexing by effect ID.
- Added G920 force-feedback helper cleanups, removed unused kfifo and
  struct wtp_data fields, and cleaned up minor helpers.
- Link to v1: https://patch.msgid.link/20261109061103.2887636-1-dmitry.torokhov@gmail.com

---
Dmitry Torokhov (33):
      HID: logitech-hidpp: fix G920 force-feedback initialization timeout
      HID: logitech-hidpp: use GFP_ATOMIC in hidpp_ff_queue_work()
      HID: logitech-hidpp: drain G920 FF workqueue before closing transport
      HID: logitech-hidpp: disable works before stopping transport
      HID: logitech-hidpp: do not store ERR_PTR in battery->ps
      HID: logitech-hidpp: avoid NULL subtraction in consumer key report fixup
      HID: logitech-hidpp: fix off-by-one in G920 force-feedback slot tracking
      HID: logitech-hidpp: do not retry timeouts and transport errors in hidpp_send_message_sync()
      HID: logitech-hidpp: initialize response buffer before publishing send_receive_buf
      HID: logitech-hidpp: fix HID++ 1.0 battery mileage event parsing
      HID: logitech-hidpp: handle negative errors in hidpp20_get_adc_measurement_1f20()
      HID: logitech-hidpp: mark device online on unified battery 0x1004 events
      HID: logitech-hidpp: fix K750 solar battery feature lookup and reconnect
      HID: logitech-hidpp: expose charge_type property for battery voltage feature
      HID: logitech-hidpp: keep connect work disabled until hid_connect() completes
      HID: logitech-hidpp: preserve transport error codes in __hidpp_send_report()
      HID: logitech-hidpp: return negative error codes from hidpp_send_message_sync()
      HID: logitech-hidpp: rework G920 force-feedback initialization
      HID: logitech-hidpp: use sysfs_emit() in hidpp_ff_range_show()
      HID: logitech-hidpp: manage G920 range sysfs attribute via dev_groups
      HID: logitech-hidpp: execute G920 range sysfs store synchronously
      HID: logitech-hidpp: shut down G920 force feedback on input unregister
      HID: logitech-hidpp: index G920 force-feedback slots by effect ID
      HID: logitech-hidpp: execute G920 effect upload and erase synchronously
      HID: logitech-hidpp: clean up G920 force-feedback helpers
      HID: logitech-hidpp: use unaligned accessors for multi-byte values
      HID: logitech-hidpp: store device serial as a byte array
      HID: logitech-hidpp: use guard() for send_mutex
      HID: logitech-hidpp: use __free(kfree) for temporary allocations
      HID: logitech-hidpp: use alloc_ordered_workqueue() for FF queue
      HID: logitech-hidpp: manage send_mutex with devm_mutex_init()
      HID: logitech-hidpp: manage ps_attribute_group with devm_device_add_group()
      HID: logitech-hidpp: remove unused kfifo and clean up minor helpers

 drivers/hid/hid-logitech-hidpp.c | 897 ++++++++++++++++++---------------------
 1 file changed, 411 insertions(+), 486 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-hid-logitech-hidpp-6884bfb6a348

Thanks.

-- 
Dmitry

