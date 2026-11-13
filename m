Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794569361;
	b=yaY390r3R+El31pQNZNGjFRUB8roe4Ekfv7qP/BbLIRjA7KVMbOWnFNIKnZveyCfTk4r
	 +2u4oRnIGREUKxUEiY5WaumN0ehBWLks4LR9RbI7poi1WK5qXoCN5ym9SBGDNbBQr5t0y
	 o8/ADURhOopsySxq6W/hT079+jE1jt4fEyzFJdkCtivS/uzkLBEAmO3hbo9U8nQttmjbA
	 UaybCG+Ak4+qGi4Of5Cshd3DxkO3sNC+cTumTG57m7yzFOqEts/vQNtHR4knYnNVxNs2Q
	 NtNE2a++uyGsTrGXARkg5SMmCMpyK6FniXy0tsi49esEz0YK8QNPBNqIkq1amxcwazw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y5+YZN4kuYSMz/+TK8p/WErG9vs4h43P03FRIOTzw1c=;
	b=eiY1U7hVN25CmnBNiAP7HWd+9llaGTgHXN1RMoaKmWLZhX5pAolc8OMsYiajCcRxHpzC
	 xWGUKw2a74zwY1biv12M2wUlagWx3BObsbqaPoi+7UWBCcJ1IrNuCSNZQf95Qf3TzFJUQ
	 /QHncfMIeCE+J52tYFf2AI8LawkpZvIojrVyXrVHFVpj/61nuGXysFALq2iBRz7/iaFED
	 X/lbYug2vQhfUJRxjeP2XMlbY/Fjq/BHakS02J45u9TUDN/rWPZlnE+DcZzLIdtgOwCEP
	 xbOCP+y/Y2+NVGz89OktUk/ZWwchLOqUAN2uGh7nAkGAEtd2E89zghBuPiZG4KLtXIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4LfJo7t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0751B606A889
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0751B606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4LfJo7t
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b360828905so8501987b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:29:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569360; cv=none;
        d=google.com; s=arc-20260327;
        b=Lj3zMXlbNplWRaBeS+5DKs3487qj5i1nwLEw6vzpaYZ/dFAstHO09kMDfy9yneQWWR
         nuOE5efLka+trWHfgjo/v7EYhkhCxqiuAEL3Y9Pb/Dp9r6zqWnyd7EuZ8iAFEWh2dT/9
         4iUMLRhrKxOWczto6HxcA0Bm5+f4N+Q6R+sbr6CL+8EePwE2JGxcDltHLSwwvS//WGcG
         jRS2pxt6m4fiHY3oZfIPnIVXVtCCZ78CH6xqx0QQAvERWwHXYi9JQUdVvatHd/0DYC86
         P4KaVLaaGjbneHw+sXpI0KSMGvwttd93yKMobloEA4Lh7XAhK2LOR+eGHcoFbsYWwcN2
         tqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y5+YZN4kuYSMz/+TK8p/WErG9vs4h43P03FRIOTzw1c=;
        fh=m5jVjukC8EbSMdFO/zzQtgw/jib7iFcUI/WgqMSvuDE=;
        b=nTSrIIK3bBWXDVdMHUV4dESRsRJyZ3pLrWEKn2FCZbY/PNyb+toXWCGgc3rMDxuqI9
         PSRl0q1oVBj0I5e0qdoAIy92+H5LabL36kuyCQQ/TBdShWXkxzQELWWyw0733t8GTUgP
         gyKss5lr+qJfdm6/szuUuSTU47M75ECZAugSMRmxmmmFEDfLajGEIQU5cltMMq9EQrPf
         37vLR/E5QYjo+Q29xrDN9lEa7ki31wT7xkvk+rWM+QczS2SyKb1es3otsCkY844tmG2Q
         K3thAU4FI50TbetlGNMpQQrrI2k6xJ63qlV1PeL3RK7GBFnr/RifjdvhQZXYxIbs9RqB
         EUwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794569360; x=1795174160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5+YZN4kuYSMz/+TK8p/WErG9vs4h43P03FRIOTzw1c=;
        b=v4LfJo7tquKOZY7sBr/o+Hs9E7el+fw7zYEK5wgnK9ANucz4kI6u1PItAnG5C60p7q
         SM/U64waRJamGLxooX/xhSyOROaiF5Bu6iTQh+XnIs2wSAmnbDNa/WGCoFMa4epVpFdK
         bFW+SqbdKRlnQTUNmVKkHWgeb9M+tfQN8eidD/3lh2AUuqDfQLcuCsUidvSCLj4q+Fj1
         D7TLyhUg64xdtQiOY/tQcj9BROnrwR38gnd/BbIEGmAOF19HN4q0z2XBeieYkasTdAef
         NoHsRse4Ch+kUq42r9jKQEVD9U4p5L3LQITtzFdXb4BqqgDWVpAVcezdFaQEYdfefJ2E
         73Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569360; x=1795174160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5+YZN4kuYSMz/+TK8p/WErG9vs4h43P03FRIOTzw1c=;
        b=UnVQlUzIeYrGJgLJYdlRWDDSiQtaSe+jyTDBvaOUL+oO6i8k0fuabyUKKgGiptRk6A
         cBZd07Qow29kUmDul6tYc0F6gKUS9yM8Yu+BS6G+gcoNZ32H8gWlbZvf8jS9n8LiZOeu
         4I1NTs1K9JWIwg+lpv17YN6pkFAg75w9qWFEJYyH1pzZLTy61314YBT0l5XFX2RnLH3s
         O2cXuIzIJl0+TIVZipQzeqnUUq61fhz/5tGEJnytO+hXOmPIpUuUSLvwiuDDPe89xAYa
         TsVQ9S94qSml8a58Tfum5lBR+7cPgZUDbVtUTjWyznS/hbsEXa3ARoyJmxiwCvQviNde
         Mdtg==
X-Forwarded-Encrypted: i=1; AL+hErHELwZNLyFzLo4fzxHg8vygrBZyi2MczOQ4FuKlr9LAKIrLwSOBw/0pPnC7QAjlUZd5vJoOlYf7AM/yNyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MDWoCatZj8fWW2SsxYM6qVBrW7XRTHgOcgLCRcdfarxQ9lM4W
	BqbTq7tOU0kDSPre6eC8HMoAfaRuuWyBxwEi+I7BXl78LD4stU7hhD1LHqNgHyKfoGZDkXF1a6k
	nCCHPD+IxbHHO0pWXhbC/wWVwUjummvQ=
X-Gm-Gg: AYBFou3wb/TX0oPiy4Wp2xCNT3KmdZ3MXj9PkDsxugi8TtC38lxn91JcLLzDVgMrYyD
	s/AlK+ODFZVhrMoa8vMksRrYsigxC6hLND2ad8tC1yleiX04W4pJfjewc3tTQ9O2TIFGuO7Z3ye
	MimCdcwUXUoCpwSl1lKic3zl15ED3F9yysNHhrP4TBsi+Ax0V1S38D2QlGLW3xVKnssLEvWzQq/
	AWikok54GOaThqVGb7pfsPpsT/637bAoipAxJTLoUG5FI6PAAAGdEWzuk3NgCsR8pbdr8wavqVl
	32ficcYKutjwgqgI/9S4PYB/UWnLN5FI/+uQpZ1e2CAgXJ5LsO1y7Z+TliC588W1UNHUcXkIoIY
	KxDp7leCh/+eS9fQffRv9wkT1g4fEsCm21r9jB4uDOq6jYSUn2p9ec7/E7naJNEqBUTeChhWNAt
	+F+lLpHSHH3BqevSgLhTMZQoejaMerX93K6mvsyvyCRMUFb76oyc2R0I1V3wQa1Cjb09VcKSDcC
	t1DvLF6cX8ACY+ZAm8pFVNOeV6e1Vpxps3v8gWSyYgpjhL//nxJBijBxgpCiOTGitcLTTLhbG89
	PT7fLCA=
X-Received: by 2002:a05:690c:a05c:b0:8b3:b952:39db with SMTP id
 00721157ae682-8b4aa239ca9mr10091467b3.23.1794569359843; Fri, 13 Nov 2026
 03:29:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113104218.32566-1-farbere@amazon.com> <20261113104218.32566-4-farbere@amazon.com>
In-Reply-To: <20261113104218.32566-4-farbere@amazon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 13:28:42 +0200
X-Gm-Features: AclHuK_l7pbfT9WtHP2ajmhTcb5eCdGVukVYrSxkY0jj7LNvZaOiW8nn193laj0
Message-ID: <CAHp75VffC0+So4CErnh7eKX6_uMPqBJ8Q7Jz5yYZ2GSJv92amg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] ACPI: APEI: GHES: remove unused ghes_{,un}register_vendor_record_notifier()
To: Eliav Farber <farbere@amazon.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Sebastian Reichel <sre@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Len Brown <lenb@kernel.org>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>, Breno Leitao <leitao@debian.org>, 
	Terry Bowman <terry.bowman@amd.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, 
	Andy Shevchenko <andy@kernel.org>, Kai-Heng Feng <kaihengf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 12:42=E2=80=AFPM Eliav Farber <farbere@amazon.com> =
wrote:
>
> Remove ghes_register_vendor_record_notifier() and
> ghes_unregister_vendor_record_notifier() along with their
> EXPORT_SYMBOL_GPL()s and ghes.h declarations, since there are no
> remaining in-tree callers - all users go through
> devm_ghes_register_vendor_record_notifier() instead.
>
> Inline the register/unregister calls directly into
> devm_ghes_register_vendor_record_notifier() and its destroy callback.

I'm just wondering, if you use --histogram diff algo when preparing
patches. I think it might look better for reading with that being
provided.

--=20
With Best Regards,
Andy Shevchenko
