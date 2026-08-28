Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715BD3B52E1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894732; cv=pass; b=I3Md0MMoFU8xWqr+uOVPIeukkwV7MZzSX/gnuzp+qHIc2Mfv3+gWrCoy044yjXhviWnbP3bdkQqwiPqcZoyqIrlhWuJuXf+tLeUWYd18RvAbnaaLfFZmPQUIgdECfalaJ8u7YUuqy+2JXIR2JXXe4lLhs3raB8O/RSSI575pK9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894732; c=relaxed/simple;
	bh=+Z2wmbjzuF9Zhx+bZruklzKVeL6Bf+IooszdmREeZr8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=QGXjzcOyBDFNRukOjgr1QqGm0Y+RzievTDsaDqmfeye9tkUn/TiHHyn2JlA0GTSKX7LEbZnbhXY6A3nLZvE3ftJWVB4uoZZoSBuflBFgdWEZV9cyVteu1r/cfyKeUh4jNZCCMy2owzrci6zW0D0BYvIEzUG52xOkkVOZBEr1lD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=N2jm9UrP; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="N2jm9UrP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71a50caa9so8029985ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894729; cv=none;
        d=google.com; s=arc-20260327;
        b=CqWeLCAKd+e7wzOzEXOOueLIERaGkYoaN0oCJf2a0zThG2pEtDbyHMj6eKpBQGog+T
         QONStQOX+O0+T2FenBCt0ZMMx1fdxs+o5FHDZIuFSF2PchBG3qmH8XUibxfmKQvZVFDF
         TM2Amqx2LgBNZQpOqT1pEwLhCKsYK/uum6dEYNXQ9tSHBbG36IwKAxsVWLe0jd11qxlJ
         musDRvWjpT8Gi61M5nyElrFhh1mvY37dw4hx6ER8L62Ur1s++iR5Fgh5Spx5BwozK3F/
         1XeG1CkstxjjX093wSZg9Cy3R9bYaKDkNh2rR/vyHsybI3DqZy2JQujPyt8EXaObnL7X
         at9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=mGN/lRZxU29BbpBQ8ZOdkFlQFbCpaIXAxgjyVfKXT/4=;
        fh=Ues44EzcZM0A8jJx6iMwHG6as2q6nQTMWG9Yomqtz54=;
        b=e+PJHbxhYXwc4ZerRh39145SlfiBPMw8z/M7hjUTITXdrDW+BgTgl20mjwcuDmIMvO
         OXv5IheIMAeDf6ylktTN+VDaW6MXVBrreQOzwQEcIMhClD66CDPw/BIBSGKF9L5+DbU0
         IpnF5qjloWmEbLSh9eWtbU+yKBZ0yVr4pNe98G51tCMYRIy2LRaVYiuCSIOGy/69dROJ
         cdPcVwZiA9e/ZcADPsAAqCnkEZjzAAmfRwJg8BWFj7x8CDP+K+Xu4AVmndj0U52SCQ6p
         uebbigasaPjINUrQuMtZfHzyDhYXcH3XiCYIb9jLgNraMPDyxA/TpK3VVJ4jkB52RQ/M
         telw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894729; x=1788499529; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGN/lRZxU29BbpBQ8ZOdkFlQFbCpaIXAxgjyVfKXT/4=;
        b=N2jm9UrPLVhxvtvu3ebc3dhSn/kAt6ZwDixbaNgjPKCATj9EBiiQPwkB130NXW38XR
         zTqinY/C9iHPauBxU0m0lZn1duSsfO94KVEyrLLoFJejZXXeJnmnctEgSg5QwTj/5E/d
         IDzLaKAHGXkeSx3iquOHa8pl2ME5jBLBY9zPSqM/4A/fT2fE8X/GBrRts8/NhNA40WqF
         rXOhYFmSfFzJesUbSineOCl6/YTcW/v3AnyhfBxMvnMTICGgEoNNdPWIuvlM7HfCLcWu
         HZ0lt+zReTf3dzXSSqj6YI7w9maByG/VI3NnEqJfkw+F5K3SdGM4oE/+kJCLmZkFUqsD
         IRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894729; x=1788499529;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mGN/lRZxU29BbpBQ8ZOdkFlQFbCpaIXAxgjyVfKXT/4=;
        b=jt0Ej8uRJx/yIKjCceG4C5suq+mOAcoqwv/lCbF2kUAFVFD1tNZMR+xD1j81yPOZb4
         zHGNsx0g2bdyxuALC60mtPmID5fqnWsibKKXVUgF5bVqYxTGID2pewMBHKFjKb67cehv
         FdQfOjc5MC06VN0r8rr86L4YDF7b378qbgDSA9rhGuh0E4k4n8+DF/A1AtlxJUR/qrgW
         YXc2g3vuz4yHWRyg4O8Jq3+XTFa4xuV0PTO3bFzcQycAl/wyPS5Ax5AXujba8QDRYLKo
         px3N0bMdo0xE0aHtnV3jaXK8ZOItm8TUhdnSGQtL3MJyni/tTGcq7MSI3/tRznHvH1AZ
         HfUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq956v2UO6pJTRv6jwPLfm2JXR4EnCPZV1Nw0fD2rhKLjopCUoJ6ptjU6/3jJMkmpjNvkFV5au+7A6tFwc=@vger.kernel.org
X-Gm-Message-State: AFuF++lb4BY/BUD0dHw2GEHyDQVo/fwIxszsSrTnrOih3SuTLbXMZJfh
	kTGHJuHuoZDGNg8Tl+wUwjwiAI0G/Bcn6cHUX5IjOc4cBfEx1YlSU+RwE+ID7tmG/mXtzAwogyL
	liMDY0Vq8w68HJAy2T80SVKW6ywmlg/vKyn3g7LQrUdPc8He/8GQc9A==
X-Gm-Gg: AR+sD102OskJNrYCgz+pdnR3eB5B3Ye4eb7mhW1pNM4Ql4fJCzBU1Ekq0XyVbIRZ6B+
	NICxo+LgzIJK7qMJH1flyrQUzerUlFyPm7HAsIktOxJgu2aEIaqzJy68YtVP7pGekITLFyQ6MKj
	HHyJXV5J83o89TMQ+HB/XPWU7D8pTQ8PTChkMQqBE7x9cZj+drxLu04Fvr3O23t0yn5z8jVzeHu
	5gj0+HwaR5F/J6BVMvr2E3O9BsWycMaYVaYe5hI8nkR+kW/QKOxthDMcA9OwPopJGgqwPM3JeEg
	UXDa1iVKkNjrOsUCcw/cM7v3/EM1asIXpWs6I9AI4c1kzkLXjlH2qN6tB/fkh6NGpIMt/EAUhC3
	pE5aML7O9MbPxb7W0JgeemDmNDBal+/fih50x4RQzHRM=
X-Received: by 2002:a17:902:f705:b0:2ca:d9b3:715e with SMTP id
 d9443c01a7336-2d74ddc1f8amr83557495ad.9.1787894727597; Thu, 27 Aug 2026
 22:25:27 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:25:26 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:25:26 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:25:26 -0700
X-Gm-Features: AcwNN1WpakcA9pl0JhjRkudW_kJKamE1iEzN7R2J-FKPFrJJjD_piymV01P_fhU
Message-ID: <CA+0ovCgiXX28Mdyu5xA4mDU2pPwoByEzEKgLn5JnfapEKg+PmA@mail.gmail.com>
Subject: [BUG] ath9k_htc_tx_cleanup_timer -- ODEBUG free-active-timer and
 use-after-free on USB unplug
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
	Jeff Johnson <jjohnson@kernel.org>
Cc: falemi@asu.edu, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/137-ath9k_htc-timer-outlives-wiphy/

  usb 1-1: USB disconnect, device number 5
  ODEBUG: free active (active state 0) object: ffff88811ead3940 object
type: timer_list hint: ath9k_htc_tx_cleanup_timer+0x0/0x4d0
  WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230,
CPU#0: kworker/0:3/2242
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   debug_check_no_obj_freed+0x3a2/0x470
   __free_frozen_pages+0x5d1/0xd90
   device_release+0xc4/0x1f0
   kobject_put+0x228/0x560
   ath9k_hif_usb_disconnect+0x135/0x240
   usb_unbind_interface+0x26e/0x910
   device_release_driver_internal+0x4d9/0x870
   bus_remove_device+0x455/0x570
   device_del+0x527/0x8f0

  BUG: KASAN: slab-use-after-free in _raw_spin_lock+0x2e/0x40
  Read of size 1 at addr ffff888105d701c0 by task kworker/0:3/2242
  Call Trace:
   <IRQ>
   lock_acquire+0x84/0x350
   _raw_spin_lock+0x2e/0x40
   ath9k_htc_tx_cleanup_timer+0x57/0x4d0
   call_timer_fn+0x18d/0x5f0
   __run_timer_base+0x652/0x8b0
   run_timer_softirq+0xb7/0x170
   handle_softirqs+0x22c/0x860
   </IRQ>

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
