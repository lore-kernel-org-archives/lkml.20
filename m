Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693034;
	b=GqN4JMFWJucWP3TjMAdYGZTbwHmNIy16gbMTELGo+y8RdtyUJZQeCrvQTZd/PHyJNGdc
	 AfZyGlvrZRpcGiZxvdXOG8zjYRrFreJP3zkiwmfvRwIk63IzO4p+ePOsDlBTMCjka9+29
	 sFVMOTtFSNGX7G2vyfiSUHR1LkyR27syXbGUIssCDl+Kk6EgzRpDvHCgaGsVVERJhfGdg
	 vqqKARstQZOa5MQ0I4pxZFhEIVOWAf9U/DvwmG0w1gx+6AvQuLhyOqckPtBfticUVhjwg
	 p0KX+QanxRMhpFeUhuFbzpbJr0J3kXAU1Yd6SMAHZk+HJyXsMulmLyXltoPLYb35d6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l0oN+XMjttu7u+qY1h/LMatbQ4tscjSIcI7cSuVtBZ4=;
	b=Y6yygf3fbSMWW0NRbTv0dRZpxi5js6m81iNm7vyQMO3AoOVMp898GWC3b+pgcFbCS6kv
	 nxgqVhIf+oGX/o/945SAQq4DZsk0ihwwlVmMezfUDMyIqZ8q5T4AU4fA2gL0eSBlD7+Xw
	 yQqdDr109jSKCj0xelsg9aWjoLDj98QXe9vSDs71jU85JpuRMr8/OdTjlcDPLYc49nqwW
	 3i5KmkSKWizYA/dAkCZlsrcxuPjGNuxEbnhX6I9XbqKxJu/wv80b7Vruv4VywudA0arUE
	 wfespwhntxzQ28bBr/eeAniStt72pguKywLOQTiUV4NzOgPB2qoV7nsXn2cL7YvMRkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrVGbqDA;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AEF606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AEF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrVGbqDA
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso640828a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693033; x=1794297833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0oN+XMjttu7u+qY1h/LMatbQ4tscjSIcI7cSuVtBZ4=;
        b=QrVGbqDA7blWhqsVvYV0d54pyJP379JBkJc79mkCztb6PN6OJPGU9YEzwMKPHPeexk
         KAXrZh4mRJlZ2D/0/xP2wuV+acLGdTj+aDfX9vTdxk+2Ae/aoB+lKLb88wi/xM+vS49q
         dRQ2b7Hwj3ndgshLNm7b2CkI3eR0sD1Devwp8IoiWqjeQU90dR34vzOE9Nr5cQy5d0L9
         ls5lKYhIpnVPmVYsvZrdUMN5JFehouYMDZCcTUpwjSAytBRh1uhZe6hQV9UXvB6XrBTT
         8QBBmHHClqzzgYpUO+OlB2q0Bs3/v29bC463crvaXK19+4C0F/jA6OLcTFQu3NYvTAZO
         S3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693033; x=1794297833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0oN+XMjttu7u+qY1h/LMatbQ4tscjSIcI7cSuVtBZ4=;
        b=rBs2hVCaIFzNeFOksQFrpS4JspXMaZJaOcumLyjebzt1IFvxtBiPnjEVOeSvGUrXed
         jvP9tKZfQxFTheiey1VkQrBwoEv/KfT9LGAcwFzPjNMAkFWAPXgpaHMhtZ6/tpj7lu8q
         AUpT5ymYPZtcn9a2xyYJkr4ZQ06XFbvz/1/MF27/NN+xmuepspBBlWoEYox08jz6Grgo
         P9zCu/tzfQNKXt/xV6x9bZ648R5Z7sCIQL4wMiuA33EMAOfHrOqcqCCy9VuuMbIEP/MX
         VmVRLmxK2285PKUfSX23VtKH0KQpffe3v7j1AD/S2xyTXqoiAWl1sxd62NavJCEzoT3V
         G3JQ==
X-Forwarded-Encrypted: i=1; AKwUvByD1YF5J3iFSRIQav0eZvWjDXJcKUj+c6nbr5wYoXLunv4+hPBNII1DNApZtu+QrXlnfmpGnnSu343qlXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9600X+frtw7lLqAWh4EbhfTJabuofO4cCQiKnD44oiDzihJxhe
	ULl3q0l1A5D9HDPz0viw43iOEmuf1++nP/RG8M8c5y3z27sG4dwGWWZkZ5GvCkQW
X-Gm-Gg: AYBFou3hmBmqLjlQEUoCx0hKEoekYlgHyiI7d79/TbIPLoqPHGhLVu1G/YKso6jmBnl
	DVsKDPVjwcUiDMFLGdtRxdSjDTwFy7nrx5ER5xjm/dz1FgiZkaBvHIbdK1DdJkDVNLBwNfJRLzG
	Qoj3egW91tEVM7iYdYRsBuT4+TKfFb8UnFmgD6dorZjZUv58qGyxDXig75jwDGCoZEzjRqEBzuY
	8Jcj9UjgOnR665K67DKUGRfalIEYhFJ7An/ZMs2+xdv+c+gX7Xh0ESkAD9IGNqS/Ruh0nwjPGYF
	EFHJeCEjGKyDQKpZAsOrQrfxckihm2M87eoX1mwPtsVk4/ypZygCoVMvp74WfKONyiNJi2GWhTo
	PwQFW9yzhVC2tN6RFvduJ4qJG/rdPSRfeVSc5Mij+ti+3blQq0dY95CfjezbhD/zFLhgOcyABVz
	4laUZzGFCCCUGAY5XYh0opuTeUU3kwWnQK9R8iRPUoo5GInHnycYoJUNlfjTrZ9Y9x2Hv5dUx0Q
	Itgt8r45xwW0z7dpnZkv9Na0h4YtfCpFlXhAZNVJZOTlaF5XiKEha91jIJfIg31M652tabjqgoj
	G1MFRIUvbLpz0GahSKKSw/E4ZFqQOV1Nfw/rrxw42lUewN17mtmJYhw=
X-Received: by 2002:a17:90b:264c:b0:3ac:9463:83e6 with SMTP id 98e67ed59e1d1-3ae896f8520mr9353815a91.10.1793693032938;
        Tue, 03 Nov 2026 00:03:52 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5814basm3316347a91.2.2026.11.03.00.03.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:03:52 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: mhklinux@outlook.com,
	stephen@networkplumber.org,
	linmq006@gmail.com,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Drivers: hv: vmbus: Fix the error paths of channel setup
Date: Tue,  3 Nov 2026 16:03:45 +0800
Message-ID: <20261103080347.90310-1-izaiahsun@gmail.com>
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

Changes in v2 (patch 2 only, after the Sashiko review of v1):
- vmbus_match() skips a device whose channel pointer was cleared, which
  a concurrent driver_attach() can still see.
- Failures after device_register() (the channels directory, the primary
  channel's kobject and its sysfs group) no longer unregister the
  device: a bound driver such as hv_sock, or one that opened
  sub-channels, can keep the channel past its remove callback unless the
  channel was rescinded. A sub-channel of a device without a channels
  directory is refused.
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

 drivers/hv/channel_mgmt.c |  5 +--
 drivers/hv/hyperv_vmbus.h |  1 +
 drivers/hv/vmbus_drv.c    | 71 +++++++++++++++++++++++----------------
 3 files changed, 46 insertions(+), 31 deletions(-)


base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

