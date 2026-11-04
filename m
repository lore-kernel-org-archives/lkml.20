Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796774;
	b=vRfzniEejPxHhdxrpi7xuEHkVCFm84aevhTjrm8XIA6dzgNswUn5EFe2kaJb6UDJBmF3
	 XkeRK+b3hkgWmukZaael+WNut8foWxhbQ0CDYP9j/V8SRhMc2A6LPdGTXsbaCVUO9hq3Z
	 PL7if771vI0X27SclpuflWs6F+wh239geCswjcIcwxQy78S79mu/df3cLBDkYh0hjFr1r
	 8+yQi/zxBGivfkRZdnnWcWpd8y44jVPoJ3S+Y6jDdVvMnw5n9/cHEMRyxWhmP9o35T6ad
	 Y1pF9ZjxuiteCu2Ve6D7mlKjlPwuyKslQliB26nT8q/4SJ/RcKuzpFQgkrQgEB4yrag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EPqf68p4zgOm5bk1tzpmfEq+lDmfobnZCEG8E1tQHtw=;
	b=DKEbscUrquyBcNYA2oB3EWYQBI1AzdIZ9nqYXPhUOAL/ZjMF6ooNuSu4ODU/9vV9dcY3
	 S04PMj94G304hvBMJ6FxxjQ88YjVXnAZVq9Z2JpSJ2z6EVM1dQTBp6tpRfAv7NRsb7HfF
	 oDsyxbCrK6Z0UXropMSs0qI+IiZNHvnl27USqEanAIZdWETeCthHHnVwtF7EXYtlAOoS7
	 eLL1WU/XJ8u/Q2fSHKnmQZXiswv3vuhCpgZgiThlYi7S1qdeMY9JU4yFbSoY1Vj9EDrnj
	 y1MtkydkGONqlcXGdXTlupkerjggKK9CAj9kbuzMNagwEqBFlFvLk1NltvuzZ/1EY6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=charmerstraining.com;
	spf=pass smtp.mailfrom=pythoncharmers.com;
	dkim=pass header.d=charmerstraining.com header.i=@charmerstraining.com header.a=rsa-sha256 header.s=google header.b=YosD2RXZ;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B8A606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B8A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=charmerstraining.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pythoncharmers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=charmerstraining.com header.i=@charmerstraining.com header.a=rsa-sha256 header.s=google header.b=YosD2RXZ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b244fb7fffso942585c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=charmerstraining.com; s=google; t=1793796772; x=1794401572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPqf68p4zgOm5bk1tzpmfEq+lDmfobnZCEG8E1tQHtw=;
        b=YosD2RXZdWNvcRFJn7BVGQ+ywSx0BydGmYtEkiPOE8tPZWjHCSiZ/LoTPOJawDx9Ya
         REG9kmxChvR7+siF6YGK3x+zexZ7PehCpgnA18UZv/DsYaEgH5BlwAgh7F729ugcVGxF
         tleGrE9krFdotry6OGOBHMnEbxA8unjQGr+8uPlMF1NdUvH1WLdaYENBDxV4uvSV8Fcy
         mUtpy+GjXvVLnRYe5ORBED8ZE6qb/YsEL0AiIyNetZo1F/JINFgPGioGcmD7rlaVKs1c
         qFDsnGTNPLB1it0lLC8c+MTqlHuDIOHqSVtQWAsJ6Dq8ueWRpmWINom68vCPXq9TXH8T
         tVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796772; x=1794401572;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPqf68p4zgOm5bk1tzpmfEq+lDmfobnZCEG8E1tQHtw=;
        b=PfwbcQ2shhMX6IxF5lrSzJqTW6IcdN4L5GMI1A1CKjpiLIB/a6MW7ZsDidbOP+oudd
         ywZ6YyJsQEbnKFgud0mBOUrq0P/CRW2BjTTGvH7uJNzqiBjCDJd+/iNw4MDk5TMGgA7U
         ArBAvf6q8/oYijF2C9q+tddx2Z8rgS2FldxFxdBJFzDHc14GAKrKNVm9rHci/Afp40rL
         6NjiHS7LQOR3PdN7JyEpGW40dbZlQXWv1N4orhiJ3QWO3GDX2zwddOx8t4gratVlWmH9
         Siq83gzwLLXXrG3ok7rkpX3OFE8pzNfPQo+RB1rJJbHW+Yq+pdMw3zFao+QGSdD0u7Fr
         PIBA==
X-Forwarded-Encrypted: i=1; AKwUvBxNtPvltIoKGXUslTTlfuAURWh5BCpaHlR/sUx1oYo3obZ7/xnIVN+/fR2qET/vRqn0mQE6BehrYir6xRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QDgQsWWFXyn+2dVdzV/GiL2J0L7mfRw02jRqk1YjFC20rNuMh
	kEsWwInrKR8+yHB2KRkCrbatv1L+fg1siXXVAf3YWzpkpwE0F42ObQg3p+2bnmjcaxo=
X-Gm-Gg: AYBFou1DUjRkyfR2SiWDoWQpm308rVCMIwsLXWeZbOxiy7JskAuaIuQZIcD2yZkW6t9
	4vwJcMeMOKgPohHwzfna0a7TYImXcVvUgnnG8LWwiCZqwM/qqczslBiivmnLyeLmstdFQDHE2Fp
	d7va8xmEAKukf4/+yCD0AS8p+cKABm/3UaEqqqQ4ACnmfvZlQ8TlzMoMCEnnyOnRyOLsbjmIHM0
	XwEKWO7IFlKEdrQISU+Hp3f6UJhTVg7HA3zbK2m5F8PYaXXSHkC32sGZn35oerkm7gbZUs1oSnk
	8xBS11F8msq6fKT65bJy4nQuIKWPbyrsuF/aYlOxUElUURqP6krIe2vYY1eYpeFtomHN6nMBmGr
	mgrEGARnadFQp5k1HMsUo2GSK+qsf3vHJOfGL23Gkw+DbIgKTBKhzFb/MkW/uEBnXYYWibn7HoM
	A201QqOE0SsIEZDbpi4Pg0F8Hvm63IJ3XgMTZXfoiYYg36efsBx2I2L7x3Cc3pAigcNe9pL5UX0
	2Cd2/laeke2nab4gfChVJwHxIjTzGWvA2nD2+CqkhFPiYaBRZ5q40BTwrXOvqK30Lbt0ALhxQjq
	E1iAJvefmY3FaSismQukj6fFu1FUm4ePb1F9j4klGb9ROs+9+cJK0R6b+VyTUdqcZymP7BPqY5t
	J5yDjnHUCftrp9WbKVBOB7VqVU/43ptbTBRuC47kcKC3a0KFMoiStnVBzWTm+HgdzoKRz3RU=
X-Received: by 2002:a05:7022:92b:b0:1ab:fe29:5055 with SMTP id a92af1059eb24-1ac5bbb9041mr29240092c88.9.1793796772092;
        Wed, 04 Nov 2026 04:52:52 -0800 (PST)
Received: from ip-192-168-20-3.ap-southeast-2.compute.internal (167-179-142-232.a7b38e.mel.nbn.aussiebb.net. [167.179.142.232])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm9787264c88.21.2026.11.04.04.52.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 04:52:50 -0800 (PST)
From: Ed Schofield <ed@charmerstraining.com>
To: alexdeucher@gmail.com
Cc: atharvatiwarilinuxdev@gmail.com,
	dev@deq.rocks,
	aditya.garg@linux.dev,
	alexander.deucher@amd.com,
	kenneth.feng@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
Date: Wed,  4 Nov 2026 23:52:41 +1100
Message-ID: <20261104125241.39209-1-ed@charmerstraining.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CADnq5_N-sobVK3qitqABjqMv2HMyGNdxX0XMXa4TZzVnMv8MLA@mail.gmail.com>
References: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com> <20261103150057.1227-1-atharvatiwarilinuxdev@gmail.com> <CADnq5_N-sobVK3qitqABjqMv2HMyGNdxX0XMXa4TZzVnMv8MLA@mail.gmail.com>
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

Hi Alex, hi Atharva, hi all,

Alex, I'd like to withdraw my September v4 submission. I also don't support
applying v5 as posted or the simplified patch you attached later in this
thread. Please remove my Co-developed-by and Signed-off-by tags from both
versions. I no longer think deferring UCLK is the right approach for the iMacs.

I also excluded the MacBookPro16,1 (020f) from v4 deliberately because a tester
found that with deferred UCLK it still hung after login, as it does without the
patch [1], which seems to fit André's PPTable diagnosis.

Since then, I've been working with Atharva to get his native-5K iMac support
upstream. His patch initializes the display before the SMU, which has also
prevented the boot failures without deferring UCLK. On my iMac20,1 (0218), 13
of 20 warm boots failed with the upstream order; with display first, all 40
boots passed [4]. Another tester reported one warm and one cold boot, both
successful, on a 0219 [2]. On an iMac20,2 (021a), changing only the
initialization order improved warm boot success from 11 out of 20 to 100 out of
100 [3]. His patch only applies to the iMac20,1 and iMac20,2, so it doesn't fix
the 16,1 either.

I don't think the iMacs and the MacBookPro16,1 have the same problem. The
iMacs fail while amdgpu is loading: the SMU stops responding to
EnableAllSmuFeatures (message 6), and the probe fails with -62. With the
display initialized first, the same message succeeds with UCLK included,
and the iMac boots normally. The 16,1 loads amdgpu without errors and hangs
later, after login, with or without deferred UCLK [1]. So deferring UCLK
seems to help the iMacs only because it moves the enable after display
init, and it doesn't help the MacBookPro16,1.

I have prepared a draft patch with Atharva as author and me as co-developer,
incorporating his review feedback. It combines display-first initialization and
native 5120x2880 support through two tiled connectors with suspend/resume and
display power-management changes. The current draft is here:

https://github.com/edschofield/linux-t2-patches/blob/7273823e425200e9f371e9272e02ebf9abb6f1c2/7003-amdgpu-add-support-for-5K.patch

This has passed some initial automated testing on my iMac20,1 but I need to do
more testing and get Atharva's final review and sign-off.

Alex, thanks for following up on the boot issue and checking with the Windows
team.

Best regards,
Ed

[1] https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-5646139127
[2] https://github.com/t2linux/wiki/issues/743#issuecomment-6083265811
[3] https://github.com/t2linux/wiki/issues/743#issuecomment-6131809640
[4] https://github.com/t2linux/wiki/issues/743#issuecomment-6163146905
