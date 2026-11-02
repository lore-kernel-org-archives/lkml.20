Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612847;
	b=L2zeXMuoDb83K3F+9ypebocRPICPB9M5g5xG1nvC0dWOXcDXKjGSgQyjUnNmNVCWXZSi
	 M3RBs+JqvLcUR62T3J+UmpmqgJ+mJr+EDcMzLo4M01HHTrHc0cgZyvwyRHT5TkaScnGJy
	 UnnI/C6LwgijFaUl9P5wqzNSLVwaPdwIytjMWHNHbasFmq3xsZojLV1kxlgiwwMDujshC
	 zgsba3c09558mGCE7KssIgr3CYI+ZKgxloopLZYxbO4WDd+wIVxMYD1uBO40zNw8l/usW
	 wNEBVjklze74n7ahltpWFDn/SePsc2NAA3PEn67ELkMkFClCAcKIDtAnogXMTqhpgOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y3+gPSeYwDPGYWTnElZIx43Pcw1WxgOGBpOWJAlZDg0=;
	b=TSTaBzp8vjuMrDwDV5qIu6/Yz7sJO+5VEmekZQC5NElbBq/Uwb570cXHpOf4WYB/+/5X
	 l2usaPwJQwaAj3gNH1afCqVzoNQIAG0h7oO1iq8afmP/xLZFunQhZ0UjkZC9YPQrqOQ1o
	 0T9uu0xEKVZ2Qf79egGdUId1PJL5svnrmZya/Yr08lQcErZINa4vw2ZYH/wSe1zCd1Q7i
	 7gzcuxGlqukFYb3VzkOfFGMbBw/9/bv/ZBkf+2pd6qGCy8BdEGf73q1a03Mq7ZdmbP+ud
	 9fafSdgFk0W993BI5s9jd1XDF+z+Bu5rbPG8j8GFXrNwLD8qD+oBNnC/c1CZ7ntamaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jW5/pw6s";
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F260A2600
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6F260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jW5/pw6s
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05b210703so931575b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612847; x=1794217647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3+gPSeYwDPGYWTnElZIx43Pcw1WxgOGBpOWJAlZDg0=;
        b=jW5/pw6s+475EzX6+ac9QfNwT9Hbc1xdssMVii92Mo0bZLlUep30yq7pBXEH/ntmKB
         QTRNV+NHNX4eXR2UEPmSopl64jgeWpa5MI1i/0EruT21jNw33QD6dmqJM8s+diHA0SXF
         4TEcz0HJKxC6zPEThoi2P9ZahJMoTRf+yyaEqQPWVDK3DNAsazgFxqQoVR9zoJMSs5RH
         jrweA4f0kZSQVDw5b1LPjj13pW1UrgysZzG4qSu2izUrZVZpwCOGGnb8y68FYePCZ+m6
         zX7WWNFyk+XUdS8XrjRlrg5t1RcnitTJAE8lO78vczZ5aH/BB3dzse8fNGBjQktDVtpa
         oyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612847; x=1794217647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3+gPSeYwDPGYWTnElZIx43Pcw1WxgOGBpOWJAlZDg0=;
        b=irkVfh0A13BtvNXCz8VF9RE983psjjIZ62U4UgYBAr1U5PUnSZcaoduqvuddmH32UP
         et6tCu0R96yUyWCQUlnXN8Fyy+G7BjGjvLLYdTJlnzQwK5BuGdgq/JfWwi49SX0ZlBSg
         pjrblbRapsetqvLWtqS1Ye5ZJwbUHQrq0FdHbXHFFv9OUKvyYDLbTUsx0ANBN7w33skB
         JucrN6e16XPZi3W4rQnvz++Ou5aLrV0pCVpr+g5AK5k4KtVwn0pcPCLb0j6GcjE4htcU
         JfiZOIiH5IfClILIjkanjy9AhNhbEwiMN24GANzJHL6bNpKslh/DZXijg6mJ28cSKRpF
         R5wg==
X-Forwarded-Encrypted: i=1; AKwUvBznpTTV6n/7mbcoTk7NOJYnv3CjVKQ1OY/bGOjlxd8TC61pgWUQflaOb8mf/kLLj85hLhPmrT+BVrX/N80=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE57XvP2qfUDUQiJvF5JMD3nf0DCjeGIVXJoPDzaLjbsSTtn6c
	e2KK/iG7ul0ebgRsuGxf4pifnC3175MA4QRXVBJzfXtHwzj4ufYxYFyHWZ7cjiJDeoK0/Q==
X-Gm-Gg: AYBFou2fjSLn++qygagLQg45OXx6ctZO8+nK+MRBjSoN+L4NOaHG4TbkX9Z+3FXtsPT
	ds+zmNuv4bbYzGIjfav1PnC1gLpwjv35/fE0yCc2F9GXFcG8WsKidYp7QC1Y4wIx5gkqqRzcLMS
	ewu3iPJhg7h9X8RScOjl5la6ufOBnCa5ytG+tUGtIchP4gK+fKS9qMYTpEqMg/mg8n/BVk1xMWA
	Dl9Bs1RT/5in8AUNZYxMHnkrVXHfmFB6DMfGp86+SWC5RsjB5hnkw6JwXfz5paAvv1uEPimr85Y
	MSt9Tnqz5WREE5RphJRJxDZe+QkCMwEtVq2BhqHPjAUmTDZrWY9kAq3V8tf9kzatIWrtJ2z1CCo
	S4LOk95rG1PzNK239m0snGMwshUlTlH7pmqhHWFYLyFFXvO/mRWCXGKno5SADp/EbGssPMeKURi
	IaaFYiDEV7E9ToUORRhX3e+bqtcXWrXPrf2sbIfgS6H8CbtniaMWI8dcr5IMHCvu0oNR3uKtyzY
	IIjmO4LHHKrBgJWueZDJZ5iJKrKUS+JQEMhzTPIM87NjIr54rDWwTnYqmsaFK/81dW8abZOXogX
	Lwq9UV6W/aoJVilCSYFXg0vYmzfO13tslehGx2XDHHyRoQMwmLpFrEw=
X-Received: by 2002:a05:6372:a745:b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3e929074329mr6370502637.74.1793612846659;
        Mon, 02 Nov 2026 01:47:26 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d479dsm1802116b3a.39.2026.11.02.01.47.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 01:47:26 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: mhklinux@outlook.com,
	stephen@networkplumber.org,
	linmq006@gmail.com,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Drivers: hv: vmbus: Fix the error paths of channel setup
Date: Mon,  2 Nov 2026 17:47:17 +0800
Message-ID: <20261102094719.35760-1-izaiahsun@gmail.com>
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
  clean the channel up a second time (patch 2).

Testing: QEMU (x86_64, KVM, kvm=off with the hv-* enlightenments,
vmbus-bridge and hv-balloon) with KASAN, hv_vmbus and hv_balloon as
modules loaded from init after failslab is armed, on mainline
d135ab453a74. failslab is limited to allocations under
vmbus_device_register(), and fails the N-th one when the hv-balloon
offer is processed. Without the series, every run hits the BUG_ON:
24 of 24 with the failure in device_register(), and 30 of 30 with it in
the channels kset, the channel's kobject_add() or its sysfs group.
With both patches, all 54 runs leave the offer unbound with "unable to
add child device object" and report nothing (no BUG, KASAN, WARNING or
refcount_t message). The sub-channel path of patch 1 is not covered:
QEMU's VMBus offers no sub-channels.

The failures need an allocation failure while the guest processes a
channel offer from the host.

Yuqiang Sun (2):
  Drivers: hv: vmbus: Keep the channel when vmbus_add_channel_kobj()
    fails
  Drivers: hv: vmbus: Do not remove the channel when device registration
    fails

 drivers/hv/channel_mgmt.c |  5 +++--
 drivers/hv/hyperv_vmbus.h |  1 +
 drivers/hv/vmbus_drv.c    | 43 +++++++++++++++++++++++++++++----------
 3 files changed, 36 insertions(+), 13 deletions(-)


base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

