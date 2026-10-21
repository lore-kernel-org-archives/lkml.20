Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551948;
	b=sMBK0UhFnmksMhdbsRaNJ5U8l1lm5oJekibHXdLhD4uE7nocWL4i49WhnutIREwr84F4
	 54Q0IRwZZxLVBP+Ot0UaXItTMqxnjdG/bq4aMflNk6sDpi6yCZ/d0vXd4u4DrXgWTnmCR
	 qX+w2/NZvrj2qcEQZYkldXnK9BEv1BBkInai6iNbYDsxWwl068Z+8SKeOrskmFkmd1Pk+
	 qGTZBESyabS2P+ZWXSNdc50DiHjoZEo55hpb+OQhOsMtx8QZLZ0rOkhUmI5EqGq9u6kEk
	 WiHw1T9lHruVnU6Os9wElPi77IQrdeM4jzofXHuWHartKsx8rCQ5wSKjFn+jOChw+Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gDndSD0GZIvZyUTYE/Z9F/DZP122ym6cCPQpCZSHgLk=;
	b=GfcGoB+SwsR6m1g5j3MHonBF/aPCaHbQ1W6JN2ArzYaHHysukalrrBIQ/1Pl4vfHreS/
	 cShbzkp+jCAJ4PZY3mjmbnHVXLTya8MT4X/HuhK+AQdK3M6NDaRoLT4htD+xZNxyXNHMN
	 DxjdTOJGTTNGBxR8ohcvpgDuqiEffCmlgXgU0AEGVa923uf1dN0mxiImim19mbj43hNsf
	 ORbYHUcwGtgR3+xbWKalit+Pehz8qENMrROCA0IIx/RcP5E+rasvrTsdkxRN9axJE0/fd
	 +7N1j7al8+5dadnYf7KzbZEbIAshl+REC7XogrLgL2qrbyvjVLZFo9NhKt6V32Dx7Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iyEoV8X7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F219606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F219606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iyEoV8X7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd35952so23709f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792551946; x=1793156746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gDndSD0GZIvZyUTYE/Z9F/DZP122ym6cCPQpCZSHgLk=;
        b=iyEoV8X7OnT+MoWdag8gC0LlhSjG7fzgL/q3idOwMs/rP3y1qFo81s/SJIcmiuci0l
         JW3akbq18jxuXt1DhdQIkCEJ0PjMVP3Qz8Bz0rntL/+Bgo+LklOQ3JlRFtkGq3NK/vzF
         7QoPp9ApQZpD9f+xyJvxbas5mgubXjROp7Lpilj8ZihGbffu6fYjpyQbEKxwQ4SzaOv6
         mwuIMtSVVhl5qgeHNW24LzzX00EWYzh/op64Y2O0Yq4o5rWgYq6ezPlrOlLEiJpCX3hA
         6EaK/HTlFVvVxwgQH5qj3852iR7qUcXJjMGerXZgpcN/ax9CaojSVLA+IewPINQoiwD1
         BIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551946; x=1793156746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDndSD0GZIvZyUTYE/Z9F/DZP122ym6cCPQpCZSHgLk=;
        b=Xj459m7gs+UvszYSTY8a/otNuqCZRGV/nnwVg+RRmmzDHRRuClesFOcniQLb/9uZFn
         oBn3YfZVpGO5uwzR1FYNjk8hBUnYvokxwdzV/eH1fM5Z/R8sAQqdVc0je4PjgK2moswm
         btJdpZqeEeNu4DvfwbMSHBFh5j+gtyLLjPZKTV6zJuqjb609tmHNEKawmB+qJ34d1oV6
         gUKLOyP9denwu+FB+oPeGktkZWyRypNbDgNJsvRrELEhkmk282AOd4TSQc9bV4veyMmx
         Vo7WL8f7CXnp75OCyq1ArTkJYVMPcHjOh4vqFJKnb/5HWkwsKrqEpNr1PVTptJbeSvxf
         I1nw==
X-Forwarded-Encrypted: i=1; AKwUvBzM+EMQ2Oj0sZ1B+jObS+Q3g8DuolbkFuvWeCBEBYLRIGDhV42FWf/fZDolN5GujKfwjoHYKChaCACOf94=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMGgqwPz9NMPvxRzx/tTEwEHHKU4b2CShGlYWpiLuUWJT10Jg2
	WJvIvMMaeqD3rY1egkIOIsZ1ZkD2zsAuLHHkzsEWev6jiHalI1SOH2Jv
X-Gm-Gg: AYBFou2p66yruie95E/oX9A0TVLWWnATVGCCwpgq05mqFucXovIfWGZjsiZoLnQ71Rn
	BdXRMS+caD/GbnydfSg5sHvUM/GnCgGoSifnNobCBejlysKMDzhEBCwgdfrVpBXnmMtiYQqVT5Q
	I7OcjB6zpLEX70cB6ebkUldfbCiLkXal5W4t/R9W8+nVXKzLZSCU+SgveIlY1Sfy8t28BMwhe2L
	40/+QPBBeRL529Bx8RgxlcjlCmBTo/EuuO/JcnFg19t/ysd0CX3M35r0Zj7f5eT3AgWtOABf1ri
	ecr6U1HxGLJDHmNQoH2ky6No0v18sK1L9VfA60DspBkNHdb7YiBcjN6bb+A4BRwAsrguLkxzDMQ
	GRi9hWSDexfOt+uDBvhz0yjf6q3gb3h96SwB9jm9neb6V4ItjFyeey5Ij/50UOPEWjjA5+Iqc/S
	QZngqndLxpgH4lScFp4Eletd7JUqc5BvCeQpKgun3tGUB9SKyx7Ps6Y8226qAmtDUN/VNukSsFM
	9fdAxqmXIK2CmjqKXbW/Hyv4TVSyxN/0cvPUKAJcwFIGIAtTB2727ZeAH1msJWerxwvnKRYim1H
	T0ADWEYgZfm6wSgkTm38CRTbNfXgG7TJRGTU
X-Received: by 2002:a05:600c:3e87:b0:4a1:d899:b633 with SMTP id 5b1f17b1804b1-4a1fdae0e9cmr9334205e9.1.1792551946307;
        Tue, 20 Oct 2026 20:05:46 -0700 (PDT)
Received: from localhost.localdomain ([194.36.104.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm131033835e9.4.2026.10.20.20.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:05:45 -0700 (PDT)
From: Iaroslav Voitovych <yaroslav.voytovych@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org,
	patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	akpm@linux-foundation.org,
	linux@roeck-us.net,
	shuah@kernel.org,
	patches@kernelci.org,
	lkft-triage@lists.linaro.org,
	pavel@nabladev.com,
	jonathanh@nvidia.com,
	f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com,
	rwarsow@gmx.de,
	conor@kernel.org,
	hargar@microsoft.com,
	broonie@kernel.org,
	achill@achill.org,
	sr@sladewatkins.com
Subject: Re: [PATCH 6.6 0000/1651] 6.6.160-rc2 review
Date: Wed, 21 Oct 2026 05:05:42 +0200
Message-ID: <20261021030542.1434603-1-yaroslav.voytovych@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020075535.084584701@linuxfoundation.org>
References: <20261020075535.084584701@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 09:57:46AM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.160 release.
> There are 1651 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 22 Oct 2026 07:53:04 +0000.
> Anything received after that time might be too late.

Built 6.6.160-rc2 (c578c158a368) and 6.6.159 for x86_64 with BlueZ's
doc/tester.config (KASAN, lockdep) and ran the BlueZ CI TestRunner
suites on both in QEMU/KVM (emulated controllers, no Bluetooth
hardware). Four of rc2's fixes show up as intended:

- "Bluetooth: hci_event: fix simultaneous discovery stuck in FINDING":
  mgmt-tester "Start Discovery - Simultaneous Inquiry Late" fails on
  6.6.159 (Start Discovery answered Busy) and passes on rc2, 3 of 3.
- "Bluetooth: MGMT: Fix status of pending commands flushed on power
  off": a vhci reproducer gets Command Status 0x00 for Start Discovery
  on 6.6.159 and 0x0f (Not Powered) on rc2, 2 of 2.
- "Bluetooth: MGMT: fix crash in set_mesh_sync and set_mesh_complete":
  mesh-tester "Mesh - Enable 2" hits KASAN stack-out-of-bounds in
  set_mesh_sync and then a GPF in mgmt_pending_remove on 6.6.159; on
  rc2 it passes.
- "Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_connect":
  l2cap-tester "L2CAP Ext-Flowctl Client - Defer limit" fails on 6.6.159
  and passes on rc2, 3 of 3.

No other case that ran on both kernels passes on one and not on the
other: mgmt-tester (rc2 465 passed, 37 failed, 6 timed out; 6.6.159
464, 38, 6), mesh-, iso-, sco-, rfcomm-, bnep-, smp-, ioctl-, userchan-
and 6lowpan-tester, and l2cap-tester up to "L2CAP Ext-Flowctl Server -
Accept 2 Close 1", which hangs on both. No kernel warnings, sanitizer
or lockdep reports were found on rc2 in these runs.

Tested-by: Iaroslav Voitovych <yaroslav.voytovych@gmail.com>
