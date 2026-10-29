Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267062;
	b=KDdtma0qB6RWaeMplP/7lqleqebAkHor80Yj8TMfxNZL7kuUron77S9k6ldisNM3V2S+
	 DDa+JURXI177F1H0qNb87kuRqBkvpWcX/FcVfXsKGwR9WW/8jszqy6IbDWsRNC3OEf85V
	 Zi87uBgnZxyZOUk5GNGRyujzIwDmLK391AsOeJPWiS187gWecOokPYZgIUGOUF3Ur4Icc
	 N4npZUJYNOb+R71RjUJBEQuXEFh5PTE4A9FiEEugTXSYKANWMgnunNr3BrwpfGlaVxlkv
	 L1kszXma040efe3JHQibumvC0ciihs0m6qCFgqq7ukxyYLpBX1yRXT9o5LhYsTkBhsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UKSebZaSFVefMa83WA9Risb9bDftelK4ymQGDTUiUGc=;
	b=5JLnK8ofiOBcuN1cK8LMoH7fG0zK8cCSMmArie+CZL5UkkV5D64wB2Z2DBaiy7ovC0U8
	 wPxoOxV3NyGXnVlZ0/psqwknR8unUcsQVbkRA7BGBELOVvmgeBMrAaJYW0RylnZaCUbCU
	 lwQNGMoFLaTIjmC+V9doYdMmoQRQJxPkOIgQyuNVDH6Lqi6x6xpVUlP5Bn+d4Ja/twiPs
	 /JYyLdE1AR0y9BjPVbAi9JJ2YGWqdXK9X91TyqRZjRM3N/Lu3jyFgGbGefERo1VbyKiX0
	 EzS7u55jirFAi4eA5eRZMq+yVbEHGRVLRXeaPiNwI+/4q1j0FVR8bEYIXxnNtwHCZ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhUWxnDw;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B15606A331
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B15606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhUWxnDw
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ccca948203aso838811a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267061; x=1793871861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKSebZaSFVefMa83WA9Risb9bDftelK4ymQGDTUiUGc=;
        b=RhUWxnDwJvX15K7ipRR4XPyycz56J4nWxBJ9wQ+7eveSbrpw04HV1uu0M/TFmlJFmu
         lz0Yh8IQWBwf4EE41qfAD3bAIpcDW4vWPzANZwgbOIgn8rhNRIh+vxKHE1OH2Sii3drj
         1D9ouxhDZbqIFhW1+IUYbrnXkM7Xz9jbkkHOZ2LoBy9ZfSDgFETK+iOTjip9E+kholLQ
         oxQmFNP2JgK2m3UOLr0n1jREU+DEtFBd8idnQhSc3UeYOaw2KEk9HtN5Yc9roucMviUc
         lErwfgPN1F3zlPe834PQmwHx3H5ARm6HXu48UzJQYYsr+Y71lX8bzBgpV6ewGH8GTH/Q
         13Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267061; x=1793871861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UKSebZaSFVefMa83WA9Risb9bDftelK4ymQGDTUiUGc=;
        b=0nv6U8NiA/MFMkELYtugheZ6dzxVcUnT1JYZu7mI8ejfsfGZfYyPpqm05jqtk+Yl5h
         mf/P7MdIgdI4knL9BSuh33SZ3xYo5VUDeiE2aAyKsEX0bHl00khH+pnFOOELYdwL7Jlk
         /LkL+qLfM8dWpMqx0OT2wrKLLXkK76Ut/jy8MQd9OAyI5x3uLHf0xr7Mrx4G0O0Mfy9z
         hS1mHcolK5lPsLOlnKCP+qdZt3iwppxOa21IVQEJqvCZxAyjWshjkGusAyLYt27FlsPS
         efkHJM7+0bRYzDxWUscSeibsd9Qi7GYNPjlWB7Umax9HT1BWIwIbNQuEydNFbp8hFjxK
         ynPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxr7mnm1z5dg5CmasHueSi/PVVl8cg9f7ya7vZptMrSYf3baLByNEpDdzfBGPV13fKReA1F/3EzVct3LPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8jWbhNrYLdA4xvNF1Zxv4PcceEy9KYaRcKTc59c3FJ2sz7Zd9
	ik0vBIUAFyNRoX2DRocqFEX2m3lbj4WmMjo52Zwt+EeXC5rXoHHvo2aH
X-Gm-Gg: AYBFou3QnkXaBXw64eiBaUsNDZle28wLq05SqYmcFRywIrNqZMHz75lkq+FT8BUrK10
	XOocCQZJrzdTGblXWcxiAhF0cjp6ON6umMqGaGxkv+Xa1Op0dTlbeUBGmns/IOKsNVihF+7a3Ld
	KXVhrhtnAr+7qAw1kyYZM5CfrL8yG+9p4ofl1HYrI8iU1UF6mEifLYp/bqhtu/XetTRoZDd5y84
	T/Hk2UqCORkChmQRS3FhK3aKMfzSkNy2Pfx2aO9DZXYhAWWbBiddYWDeTd9Ry9G667yMYv+T65U
	jepS4k6TneMIz1t6mNOL/y710h9LpOUgOJHPyhNvJmBwDYeePsha7wiEEwgrqEjmxm1cneL4/E+
	Q3ERdTgK3mll8HjRjjae29cnPyxd/Frh48E22TX8DXprCT+M7XVjuD/zvjjrV0uT3D/qmTz1zCi
	meNjfAfTW7WxBo2QXmCNTySUOzLGvsqbL2e0WJfw+Opjnwdch1HRcJGHyQkPkqwjutF1ykAZC6l
	El7kgXvF8E4cLkFfIH4jLH9ntWs4KmJA12I+BU5uTMAi1lczseZT75ur/1Qxu/1cR/MDIm65PNk
	cWom9IA/WIAB4X9tjMF134oZk3eTgAK4u4p/0BC+H/o1HfQ/TxZDqr1/HdhYlL8H
X-Received: by 2002:a17:90b:4b89:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3ae581e1959mr3851734a91.47.1793267060784;
        Thu, 29 Oct 2026 02:44:20 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae579c59a6sm2912203a91.3.2026.10.29.02.44.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 02:44:20 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: iwlegacy: unregister the LED if 3945 hardware registration fails
Date: Thu, 29 Oct 2026 17:43:37 +0800
Message-ID: <20261029094336.19250-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029081955.GA10212@wp.pl>
References: <20261028142328.18560-1-enderaoelyther@gmail.com> <20261029081955.GA10212@wp.pl>
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

Hi Stanislaw,

On Thu, Oct 29, 2026 at 09:19:55AM +0100, Stanislaw Gruszka wrote:
> On Wed, Oct 28, 2026 at 10:23:28PM +0800, Zhao Li wrote:
> > il3945_setup_mac() registers the LED before the mac80211 hardware, but
> > its registration error path does not call il_leds_exit(). The analogous
> > 4965 failure releases the driver and reaches its existing remove cleanup.
>
> Could you explain exacly how this is fixed in 4965?
> I do not see this in the code.

There is no il_leds_exit() in the 4965 error path itself. The caller
handles it: il4965_mac_setup_register() runs from the firmware callback,
and a failure there unbinds the driver.

  il4965_ucode_callback()
    il4965_mac_setup_register()   /* il_leds_init(), register_hw fails */
    goto out_unbind
      complete(&il->_4965.firmware_loading_complete)
      device_release_driver(&il->pci_dev->dev)
        il4965_pci_remove()
          il_leds_exit(il)
          ...
          ieee80211_free_hw(il->hw)

il4965_pci_probe() returns success after submitting the asynchronous
firmware request. If the callback reaches device_release_driver()
before probe finishes, the device lock serializes unbind with probe.
The callback completes firmware_loading_complete before unbinding,
and il4965_pci_remove() unregisters the LED regardless of
mac80211_registered.

3945 calls il3945_setup_mac() directly from il3945_pci_probe(), and the
probe error labels never call il_leds_exit(). ieee80211_free_hw() then
frees the il_priv that embeds il->led while the LED is still on
leds_list, so the next led_trigger_register() takes the trigger_lock of
a freed LED.

That should have been in the changelog. I'll send a v2 that spells out
the 4965 path; the code change stays the same.

Thanks,
Zhao
