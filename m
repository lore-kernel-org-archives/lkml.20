Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204668;
	b=cD6VY4Y1D2i6VQD4ltySiIWxFFTgJAwC7BEFwVHhjXhF+3Vpe6a47C1nCXaaXmSMl3NQ
	 yjJBtEZYIBD/7h1FvMaj8/HsUZZ2Ukx1oHUCcu53jqjUBBEgtMBvOMT0XK/1OagW5sOMB
	 zS1/av4DukFSNCKlmvCmDLw0swsSHuRwI5h6V84m+NW2WGuuf5XuaiAUsQS0Le/x1vBc/
	 D4g6N6N8/51tiQ+XnQYw7FvIbgKkV1bAaWiDA8Izyrb5n/eqcjvecOiCIHmjEXT7zNgTM
	 oPMAEcu1WB6mKteGBqFopKf9mKGf5QMkEiG+P6uAkPaIS1/EewPXdT0eZLmrc/JZkdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lAIxUlsOsE3c+RFTq1cEesmVMLTDAQRhBOJXl2o3yEw=;
	b=jEp3DouIBEREcDWJIW7HMuZzHST/F6P60/bzmXS6N7GG95uVzan1s9eZ7SwGt8SNd8Rb
	 CR1Zu2Q5gM/EYaO9gvqEGI3WboA4eV39rxB76xsh6soVLCUzDH5Okx2UyydipLb6j7dxj
	 iO3Kerldo/71l31/PTCeneR1ByC+rJeXy4EXy8P3LTbIDvBJGYyU2Kmn3qAG5WKsdBQZ1
	 5e1IOv6DyzGopcQ5W42fWz0/y9FnsQXK/tIf1/s/42u7PGOQpeBzM/wBVzmJfwSTC69/i
	 POuiPw5lcHxTBLbWkTAzqYD7NdQiDfOAnM8uWx6kvyDmFDEM+XElqS5XD/rDr+bi7hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPU9yL+x;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502C4606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPU9yL+x
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3720addb068so764902eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204667; x=1794809467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAIxUlsOsE3c+RFTq1cEesmVMLTDAQRhBOJXl2o3yEw=;
        b=zPU9yL+xy0Ne3z/OKDEIAHYurpWdOIM62HXeL7N2yYpVfaYLmqlyQYBziI5M4ch8C0
         7yZ5Ai+X6zEWSEYfZAxhVBS7OV+/yT9afNxS3CWd4gooN6zii8SNYRrcepQOIWCy0OQ7
         +2zI5f4JRcBS6jFcS+Q/4eXWvAGSOFZDIemfopT2ZEmX3AI0zFDeZH6gaI1pr1AkHYIz
         EdEQn1aW4M68Rzb5IAdF/1gMvDLUb43PXEJCYbSitv9klN0A+6cbXk+tAJK2VJABCiJ5
         0kldPwXrY95DEE0kzK6b0Csb9yvhApCTF/KMm2BY7sV+v2aWreWAkQZ9Tf+3Vh18peDs
         6r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204667; x=1794809467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAIxUlsOsE3c+RFTq1cEesmVMLTDAQRhBOJXl2o3yEw=;
        b=rgNxOrNHMD6hEpm4WVwAphkDurJCMNggdw8y3R7zL/+n0Ne6S7TFe9UBwj09ta/kcT
         5k2F/dDFXErh4VGl+Q/TnzHQoGrjNuOfiCxegQoAmeIW0K8Ii+1TXJBqnNRA8oV6FJZk
         0ONCAHnvu42j98D5Gyh+ESh8zHUheKJkNRpepO2is+OIYLetVHgK/AjXavawaj+zygIk
         hN0O0aGGJ3CH3yunaz3UExCWJjeR46pJW6FxudMho3oAo/Xui1iGD2IllMmk7Mcm6L30
         crH9nGRyecbZJGzZELi9fG2o9+uL3CSpmtHmK/Q1IT5oC+A4eZiaBdFNFYl8FynRLSCY
         Jp/Q==
X-Forwarded-Encrypted: i=1; AL+hErFr3118jz6zKY0KX9quMry/WscicA+eqB5ONDloW/3CVnoxuk/QszuUheNcbjOa+ttBzbPDzv/AUdaeWPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VpMj9lRWKSe5qc2JE6eX2LnMXoY9+5mZq4hJOcC4jDJwMPqrz
	7NO4sihCViovaJbjDZX2amHeHtr+LmzYjki6qyNcwlDNSV1muHLBceNd
X-Gm-Gg: AYBFou2XtHSSqCONsrmwbGd0Ykw5O/L0wnj84tLOvH3bOGoCktwPZYh/GKIUmrzAZ/K
	THxsHrsBfGey++I10icUza7xWFgFAxSYFZzTpn5S/zlN2dtPuukHFZIZ7iGGD+/hvp2ckMmjzPb
	Nc0JdhhSKxv5I1z+QvoTWKexLdRZxwPyC+219HTWaIzeWrsBZaOQPccRYosFe/xw1gJWyWgJLNC
	GprldUoM/s674Tn0HBagFQ5yeKwmHVSvHVj+hOChx++AxDueu1C9xj/aXpR87HVKytNHntoVJN9
	7Jcn6HeWnrWGFHUk3GhCAnINgxNDf0EoZ/WM0R3IkqB+IXla54sIHiPfAofzMewL6rnFK6vSxGH
	PN8T0aUaI4w/7adloh78BgpRIx6TbzIYiPxkjQhFzfODtS5yXcQ+Xv7nJMiu/NRf+EZBEarMGBj
	1CcdJlTq3R+p1+cTQ1CFysy2kWWsWxybqEb+6inuBBKsPzCkTIwzJJ41VefhfSkYg7kF3HSXiAr
	xxuFzOxEdE+k9sujpOg82iBjo0gL6tlQS8q4ueOrILalCAeSdS5ePpoBdY1cXwTnhvn6CkDI+Hp
	FeFomzZlITr0mJcAI/fZVviTOrO+/M5V4g6k2DDJ8/AXwyr+PjclTLm3NaT6KzDDRw+v30CZghu
	ijo2qYrEI4tWLXVQgjg==
X-Received: by 2002:a05:7300:2a91:b0:369:f05d:6c67 with SMTP id 5a478bee46e88-372573d107dmr6375141eec.12.1794204667261;
        Sun, 08 Nov 2026 22:11:07 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/18] HID: logitech-hidpp: G920 force-feedback fixes, rework, and cleanups
Date: Sun,  8 Nov 2026 22:10:44 -0800
Message-ID: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
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

This series starts from Gideon Heinz's report of Logitech G920
force-feedback initialization timing out in v7.3 and addresses several
additional pre-existing bugs, lifetime races, and cleanup opportunities
found while auditing hid-logitech-hidpp.

The first seven patches carry Fixes and stable tags. They fix the v7.3
G920 force-feedback initialization timeout by temporarily enabling
device I/O around g920_get_config() in hidpp_input_configured(), switch
hidpp_ff_queue_work() to GFP_ATOMIC since playback, gain, and autocenter
callbacks run under the input event spinlock, drain the G920 FF
workqueue before closing the HID transport on input close so queued
commands still receive their USB interrupt IN replies, synchronously
disable driver work items before stopping the transport on removal and
probe failure, avoid storing an ERR_PTR in battery->ps on registration
failure, avoid NULL pointer subtraction in the HID++ 1.0 consumer keys
report fixup, and fix an off-by-one in G920 slot tracking that made the
63rd user effect in hardware slot 64 unusable and leaked it across
reopen.

The remaining patches rework G920 force-feedback initialization for next
and clean up surrounding driver state management. G920 capability
discovery moves back into hidpp_probe() while device I/O is already
active (keeping force feedback optional on failure and excluding generic
USB PID force feedback), device-level wheel settings are separated from
the input FF queue lifetime, the G920 range sysfs attribute moves to
driver dev_groups, and FF workqueue teardown moves into ff->stop so open
evdev handles across USB disconnect or driver unbind no longer cause
use-after-free. Follow-up cleanups switch multi-byte handling to
unaligned accessors, store device serials as byte arrays, and adopt
guard(mutex), __free(kfree), alloc_ordered_workqueue(),
devm_mutex_init(), and devm_device_add_group().

Please note that not everything in the driver is fixed by this series,
especially around stalls on close and teardown. Draining the FF
workqueue before hid_hw_close() keeps the USB interrupt IN endpoint
alive during a normal last-user close, but close still blocks flushing
asynchronous FF commands, and paths where device or transport I/O is
already stopped (such as driver unbind or module unload while effects
are loaded, inhibited input devices, or writing the sysfs range
attribute while the input device is closed) can still stall for 3 x 5
seconds per command because hidpp_send_message_sync() retries non-busy
timeouts and transport errors as if the device reported busy. Fixing the
synchronous send retry logic, converting sleepable FF operations
(upload, erase, and range) to synchronous execution with proper
transport lifetime handling, and fixing a few remaining battery
reporting bugs will come in a follow-up series.

Gideon, could you please give this full series a spin on your G920
(checking initialization, force feedback in fftest including exiting
back to the shell, range sysfs access, and general wheel/pedal input)
and, if anything breaks, ideally bisect within the series to pinpoint
the offending patch?

Thanks.

Dmitry Torokhov (18):
  HID: logitech-hidpp: fix G920 force-feedback initialization timeout
  HID: logitech-hidpp: use GFP_ATOMIC in hidpp_ff_queue_work()
  HID: logitech-hidpp: drain G920 FF workqueue before closing transport
  HID: logitech-hidpp: disable works before stopping transport
  HID: logitech-hidpp: do not store ERR_PTR in battery->ps
  HID: logitech-hidpp: avoid NULL subtraction in consumer key report
    fixup
  HID: logitech-hidpp: fix off-by-one in G920 force-feedback slot
    tracking
  HID: logitech-hidpp: rework G920 force-feedback initialization
  HID: logitech-hidpp: use sysfs_emit() in hidpp_ff_range_show()
  HID: logitech-hidpp: manage G920 range sysfs attribute via dev_groups
  HID: logitech-hidpp: shut down G920 force feedback on input unregister
  HID: logitech-hidpp: use unaligned accessors for multi-byte values
  HID: logitech-hidpp: store device serial as a byte array
  HID: logitech-hidpp: use guard() for send_mutex
  HID: logitech-hidpp: use __free(kfree) for temporary allocations
  HID: logitech-hidpp: use alloc_ordered_workqueue() for FF queue
  HID: logitech-hidpp: manage send_mutex with devm_mutex_init()
  HID: logitech-hidpp: manage ps_attribute_group with
    devm_device_add_group()

 drivers/hid/hid-logitech-hidpp.c | 509 ++++++++++++++++---------------
 1 file changed, 264 insertions(+), 245 deletions(-)

-- 
2.56.0.506.g506a7eabc5-goog

