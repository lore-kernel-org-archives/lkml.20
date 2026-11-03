Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716814;
	b=ZPJgWZB/7YBpPg5HowwQaUgxMlm0TyaoKXh3qJbKi+iQRgA+rvwum2wgrv7Q0osoQbuv
	 yR0sMUOIlEvbDG7+s4WeoFTaF7VWNBUP6mfEk+CAscpBzGGf0wfiZRWHS7XNs3aZq42/6
	 g8DUEbu+EWL5h0HU5XpeqFLBKDABjjG3eNrDzjWZntLwLSQo6i7jSuMn/gST4Pca7X8C9
	 fR9e8anr3FRl4z+RHak1c6dX0Ws8eMD0onsiVRYLTEUVscQoWDRexy8oQn5UD/MDsEV8s
	 ZkvyUb5OmDvI/nVreBkuBh0GEZqspssZ4M39w2WxGNTa0ocfQt2MIknrCqiJ3pX+b/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UF0GzqUufapZrE0IyDVIG0vsjoer8oICiJGSt0J409E=;
	b=vruL369QDsoDus+TNuSbGwjAKVdKECiByt9yEbl8Z0fc++Tmgc7cijVgTa6PzjFF/2QV
	 yjDJV46+sA1R75MSbm90bvCuFQYIdn8gdn+TPN3A1ZcI2TEtpyk9eEfjc21eTNVZ7HZMY
	 SxgnGrfPSabqs68srZdX5RfeO10l/pPUPoov8/4EkXiyXn+vUSHhndQex0gmw3GPU/NXt
	 obIg26B8+mmL5+3m9/6ITlbUM+KGA0Pym6Nc7JHZB60Jze/0eAbc90FGsGN4RY4OWWKco
	 jakgu29zvq+JsS0tTPo7b2BdxeZRNGswWeiqbS5PhXz+V6tLulJNtgNn61y7PatkLRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzTz96R4;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E653B606D81C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E653B606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzTz96R4
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9f6a16aedso26038975ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716813; x=1794321613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UF0GzqUufapZrE0IyDVIG0vsjoer8oICiJGSt0J409E=;
        b=QzTz96R4bqPaqtq06FnUr+M4JSib5KzIZyNc5E4RvEkwqMNG0HFdqtpqn5YoNVJrEe
         640kPTvQ19xFE34cR00Mj6ATjcnHSDs9K6z+E5UL7GNuc92GIFUVDKjMxNlh7MDrFLop
         HDcuO8GhSmaM/5u7cFj5Y0E0qQZvJ929/bkF4uXj9cbK+C6zDUlxb0/pz/tGk5FuOay5
         +XpIzitPkyRvXQy50byfUlDBP5h/OOieCtMoQbfGdFc6lCQv4YMfo7+XLyHUtFkeFFYQ
         KRKBH0JSIUQj1GFHT5ISeFSvYk/pYggNxGi7Y643prbYwUAaqn95sLEw91D3Fb+41AIJ
         Fefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716813; x=1794321613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UF0GzqUufapZrE0IyDVIG0vsjoer8oICiJGSt0J409E=;
        b=2pf3GTFB0w1N1OF2c1ynGA/kLTHJvnd4djBhq1O8EJ2mMFobDmBZJsDplmv2lXkBEe
         QpccM4zSo7meVSAE0LjolP8P4FdunNLAE/+UULoGM8EWyYgqV+1w3etzE44ciiYABZXD
         Ue/V5s+4hSUBWTBcSLcClNpCgp3sRwrtnz4w9D87OBihYtcpwkMEtkYgGHS3u2hqcS2E
         w2WvSnz2WBF64NeIFtHEFKchyXokoX2lxnKqfQjyjtGJUhLZpFESCfloYKAh0Y1jaqOx
         FP+Ad3WPn09hOZZBg4lnuhGg//nLrfiuv8mlSn1ggTITpxqGAjiU3etjTx9WXaRcLYI8
         N+lA==
X-Forwarded-Encrypted: i=1; AKwUvBxGZMgpLpVAi/nUULkidAKl7XBovWSTKZ08aI9f9ukcPA9MG7bQO7zPX1kq/yhTYVoLx/I04EZmgsREG6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yjUeijQ7n6n5U4bjI7RBmGCVPr/1mN/jR8/XHKlViIMYNFhI8
	fAH+m/6vUZSiVmlvc4Kw9/WJgWPSjkXldL4GaJORE7SDdA4jX28muZuA
X-Gm-Gg: AYBFou1zATxHuVrIKS13jdd8iE39o/VHkJa/ZmQj9JgYucCddBUktIlZmi17mrxFO3d
	bMgiNJQzuiCGoMXH4tHJyU/r3dnYbGmwcTSD86R6V9+KLXhoEXgbeXEHKR3pYvR+fvL6Bx0c370
	65kkQnPKBD5MrYu8rn2euAIKonbLSr7ZIuFGuSAOZUMgslbrxDJsfRVSlvgudsxSQNj29H02hER
	PefyqgoeSi44X8kmPMX51Q3NX7oAdwIdD1zM7N5UrMR7QvvLMSFhFyn+22R09J+hC4HcbkxJvo3
	dQbFQFYwRoP0KYydL+ScmnCuD39uYW5JaL9INeMQPaC89qS27kce2tdYUQsVtHeQq8bCRJEbKNw
	Es/y6qcno/Cf81xNxmTcPDhB0/S77+ZZRhbMOKhWj6QqFNOwCzyLNfO4ldA9PqFk2zTDU5WvKki
	1NsPVbu9fqaJozw0pl1MIcRIfrX1z/lXKQXqZhHZV5cWX8DMDnYmntHVyUKTghSHPnsHufzEkQ9
	6/Dwl8kga9IAf4q2XPDdu6Pv++8iXqinxfL2dtGlxAIIQizkeRSWZVtHQW7wCY9z7T2zoRdbUdN
	51+g/stgcIEqflYAmViYE3gmwfHfcp3TuceV3EYQnTek5scdfCEPjtXdzjhneA2c
X-Received: by 2002:a17:903:1251:b0:2e9:970c:2c9 with SMTP id d9443c01a7336-2eb364704bfmr129611875ad.42.1793716813250;
        Tue, 03 Nov 2026 06:40:13 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:314f:4575:be3:a064])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052edasm42898465ad.4.2026.11.03.06.40.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 06:40:12 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: mhklinux@outlook.com,
	stephen@networkplumber.org,
	linmq006@gmail.com,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Drivers: hv: vmbus: Fix the error paths of channel setup
Date: Tue,  3 Nov 2026 22:40:04 +0800
Message-ID: <20261103144006.69857-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When setting up a channel fails, vmbus_add_channel_work() and
vmbus_device_register() do not agree on who cleans up:

- vmbus_add_channel_kobj() drops the channel's last reference when it
  fails, and its callers then use the channel and drop it again (patch 1;
  this is what our static analysis reported, for the sub-channel path).
  Paths that fail before it put a kobject that was never initialized.

- When vmbus_device_register() fails, the device's release calls
  hv_process_channel_removal() on a channel that was not rescinded, which
  hits BUG_ON(!channel->rescind); vmbus_add_channel_work() would then
  clean the channel up a second time (patch 2). Patch 2 leaves the
  channel to vmbus_add_channel_work() when device_register() fails, and
  keeps the device when only the channel's sysfs entries fail, since a
  driver may be bound by then.

Changes in v3 (patch 2 only, after the Sashiko review of v2):
- vmbus_match() reads the channel under rcu_read_lock(), as it is freed
  with kfree_rcu().
- The channel no longer points to the device after device_register()
  fails and the device is freed.
- A channel of a device without a channels directory is left out of
  sysfs instead of being refused. v2 refused a sub-channel offered while
  the primary channel's device was still being registered, which could
  leave a driver waiting for it.
v2: https://lore.kernel.org/linux-hyperv/20261103080347.90310-1-izaiahsun@gmail.com/

Changes in v2 (patch 2 only, after the Sashiko review of v1):
- vmbus_match() skips a device whose channel pointer was cleared, which
  a concurrent driver_attach() can still see.
- Failures after device_register() (the channels directory, the primary
  channel's kobject and its sysfs group) no longer unregister the
  device: a bound driver such as hv_sock, or one that opened
  sub-channels, can keep the channel past its remove callback unless the
  channel was rescinded.
v1: https://lore.kernel.org/linux-hyperv/20261102094719.35760-1-izaiahsun@gmail.com/

Testing: QEMU (x86_64, KVM, kvm=off with the hv-* enlightenments,
vmbus-bridge and hv-balloon) with KASAN, hv_vmbus and hv_balloon as
modules loaded from init after failslab is armed, on mainline
d135ab453a74. failslab is limited to allocations under
vmbus_device_register(), and fails the N-th one when the hv-balloon
offer is processed. Without the series, every failure hits the BUG_ON.
With it, for N = 1 to 95:
- 53 failures in device_register() leave the offer unbound with
  "unable to add child device object";
- 31 failures in the channels directory, the channel's kobject or its
  sysfs group leave the device registered and bound to hv_balloon, with
  the channel missing from sysfs; unbinding the driver and binding it
  again works;
- the other runs fail an allocation whose failure is handled, or none.
No run reports anything (no BUG, KASAN, WARNING or refcount_t message).
v2 and v3 give the same results.
The sub-channel paths are not covered: QEMU's VMBus offers no
sub-channels, cannot rescind a channel, and hv_balloon cannot be
unloaded.

The failures need an allocation failure while the guest processes a
channel offer from the host.

Yuqiang Sun (2):
  Drivers: hv: vmbus: Keep the channel when vmbus_add_channel_kobj()
    fails
  Drivers: hv: vmbus: Do not remove the channel when device registration
    fails

 drivers/hv/channel_mgmt.c | 12 +++--
 drivers/hv/hyperv_vmbus.h |  1 +
 drivers/hv/vmbus_drv.c    | 97 +++++++++++++++++++++++++--------------
 3 files changed, 71 insertions(+), 39 deletions(-)


base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

