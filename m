Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672192;
	b=oE/4+fG5QuwKVy2Jo8aOaXPElQ9pWXuWFynCOcqJbitMEfV5h+gB07Hie2SNUwocPGu9
	 b17hTtzKLiebbUej7RlhFJXZ37VDJqUPt6qagac7EYRrLAVENAethC0GMHqiFEo2OecZs
	 RMg7cauVayrMcCFhOSt9NvbJ9ejrLnipvtGFeAhJHiutBIj8AQQS9Xwo6oY2sjrVBeuSo
	 u/iyerPJog3rT0KPy1BfkEaf18DOOB+uHiaGpEewsVfDNkoekiC1t+5tpyfGJ8e6GeT66
	 pjz/GeNQX2A8EhIASwlWbDucLzBgNwig20cU42w7j0/5hryfYkQqhTgf5WeiAegfT0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672192;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=sfsMVLLnQIl2c/TSBakPGy/YmZ5fohM4IYX3/lhT36M=;
	b=VG1MMqckJGl86v6eGfgi892ThSNeqfguQdeWiCnIsoTxEFGN/E3VnqWbUNUADNpawx4y
	 7B0p0xVSP/WJ886tP36BDhStBuuq4oH8DaNU48KZMc247lVrC3rTLeE4gwZivqsN7xPVu
	 vpfITReEQ9n9J95c17Ao0/IO46GuQe2nNfx6xpONToq7RtmMdM1153EUGEW+b8WaUa6JF
	 5Ai1smpNXCMdyUnfHPiGLEk0lqCUrW0RJKh+42+zFcLwwZmOcWCrgYtKEuncNd4/KcRt+
	 ZdtOXdfPwF/+bWr1VQzNAUhlQPifKwEDv34P0asTSnMWaAkezLrONJzUe5hrfKhbGAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b="Un//uSdC";
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80F606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F80F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Un//uSdC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794672189; x=1794931389;
	bh=sfsMVLLnQIl2c/TSBakPGy/YmZ5fohM4IYX3/lhT36M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Un//uSdCLl1gy8Pp24cfvsJS/o7ZeQBA09MtBfLEx5CX01tvZRM56yep4Ok07abHX
	 1IBd+Ay/ZH3inqH8s2VBoERiZ20XZfGPbBwSTY8ASJv1ooNerzhEVcKnbmLlLpKrbB
	 fwOSV1gRZq8nq9gqZ1OideisgijWtOKjkqdds8UBgdwGd3ys+ui6w1PkHnbZXChY6Z
	 rYGHkJ1u8tqZkJmcKT65KCrsk+61PgMh4paivKyUIU6NQEHVWIrZk0VdUSX/Xk0R/r
	 fElvix99hEp3SVNOzcG0weMtSHaiU2XJfIwFJiTMxXWYm39/z5OcwZDLrXkczxNeX4
	 b1yMeYq5Q8UGQ==
Date: Sat, 14 Nov 2026 16:03:03 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fuwei Xie <12313607@mail.sustech.edu.cn>
Subject: Re: [RFC PATCH 2/2] platform/x86: huawei-wmi: expose native Turbo mode as platform_profile
Message-ID: <EjBEfObhfJDnZ55NQlG2QsrN1vIwNF5koBTvhI10lceDUSg-ehU_zaxIzKjNHc7zQ4vhn2s20Lx-so3LhGaeyGYXw1goKsT7hfPmrQKq-6M=@protonmail.com>
In-Reply-To: <583B99876AEC4CF2+20261108041714.328986-3-12313607@mail.sustech.edu.cn>
References: <20261108041714.328986-1-12313607@mail.sustech.edu.cn> <583B99876AEC4CF2+20261108041714.328986-3-12313607@mail.sustech.edu.cn>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: 03e481a96952fc2c7a30f4371100a96f6f01b115
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fuwei,

I tested this series on a HUAWEI MateBook 16 (AMD Ryzen 7 5800H), DMI
product name "CREM-WXX9", BIOS 2.32. Its firmware has the same \GTUB and
\STUB behind WMI commands 0x0e04/0x0f04 and sends the same 0x2a0/0x2a1
events, so with one extra DMI entry the series works there as well:

=09{
=09=09.ident =3D "Huawei MateBook 16 CREM-WXX9 (BIOS 2.32)",
=09=09.matches =3D {
=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CREM-WXX9"),
=09=09=09DMI_EXACT_MATCH(DMI_BIOS_VERSION, "2.32"),
=09=09},
=09},

I applied both patches and this entry to the driver from pdx86 for-next
and built it as a module for a 7.2.15 kernel:

- platform_profile_choices is "balanced performance", and writing either
  value switches the firmware mode (checked by reading \GTUB back).
- GNOME's Power Mode menu (tuned-ppd) switches between the two.
- Fn+P updates platform_profile, and 0x2a0/0x2a1 are no longer logged
  as "Unknown key pressed".
- On battery, writing "performance" fails and the mode stays balanced.

A few details of this firmware that may be useful:

- \STUB only checks for AC power here, not the battery level. When it
  refuses, it still returns status 0 and sends 0x2a6, so the read-back
  after the set is what catches the refusal.
- When the charger is unplugged in performance mode, the EC turns Turbo
  off by itself and sends no 0x2a0 event. The power supply notifier
  picked this up correctly in my test.
- After \STUB, the EC also runs its own Fn+P handler (_Q71/_Q72), which
  sets the SMU power limits through ALIB. Switching through
  platform_profile therefore has the same effect as Fn+P: the STAPM
  limit in the SMU PM table goes from 45 W to about 50-52 W. Each \STUB
  call produces two 0x2a1 (or 0x2a0) events about 35 ms apart, which
  the refresh work handles fine.

Tested-by: Eren =C3=96zen <erenozen@protonmail.com> # MateBook 16 CREM-WXX9=
, with the DMI entry above

Would you be OK with adding this entry in the next version? If you
prefer, I can send it as a separate patch once the series is merged.

Thanks,
Eren

