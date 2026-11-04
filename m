Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793784074;
	b=qjjUjzAvlnaOEYy9A0KeNXsku4WrfYGpxn2LJGqVWHLpl1vTrHHZp7anbHhwTJLwhAKU
	 hoJOd5KgtVuS/Mf9hhBgS2TB7mMVAMltgUgx42XGmFNYP+Ouz7PikdXqfdEcXCVyG1acw
	 Nx7JUbvAb+I2U4dl7htjvQerLZm+iLZmGyKYrCbS5DQP9uHmAdGEDxSNWD5S33bGzhwnY
	 73oc1f4kHqJDRH7Y+CCYAFqe8J8qLccRye4PCZ0iIc0Y5X77EGLOhDoqeSVMfRb89P+vl
	 Hr6nwQVxspAqV5Sm3heO4FBvKXArrz0xvrGSKD6xipP8OV/s5umdOckH7EFyVhMEEfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GY0htM7LLybH60Zvhq77Fsv6T50kPeUsLh+oGL9owIY=;
	b=vMBP00X3kQWihFDsGIfpIQAZIYs1Lfsvwzt6NxPFI77Wvl3Sha4CQXaCc0ii66AlOqbO
	 2ICWpaRk1otohjgDKi0vE0oMK6rNFRzPDHGq9/cvJ6cLIHTvAD6CYMiixp0PwXl2ltd6Y
	 f5A14vhjAtGb8TCf8jajMo+g9baYplXALLtKeamjcKfRTtMBF9G2Zn/2JKit1t1tsKPkf
	 W/Ip4g25f4C5kQw1RSIkJAV6JcK2SKy2kddNzDYFNjWReCu5Fk4/42BmP5ETpFyXJaYnP
	 lVbnxKmB5KxTC2WzvLaCO36/pP21jK4DssjcTpWsQh/S6Js34y+7JiqRT9XBghUURQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRKpF+mo;
	arc=fail smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F19606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F19606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRKpF+mo
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso4189027b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793784072; cv=none;
        d=google.com; s=arc-20260327;
        b=QbWXwX6oRdJeKlr0bHJVd7vIHDnl8piilFVHxGC4qUf1UC1BXFn7DGtm1W/ww0JB1z
         UfuYfcs9T3Nm4PDql6D+Gc8qa8vbcCf/1QBc+L0bar7vZqfN/K9xHTdQoe5eHbb57e5N
         uVW8Qw9bLlRVGCu4/ew8lzJSjGlciuefDaebA+UPcpqUTbi0DfWFFTYRTzjC679MoFcZ
         Ll3I81aockGgPVAw3RCwcTjS6wSDLN328Zr94aQoLVQh5JkA3nR4lm5tXHu4NGLzqa5K
         QHCdD1BuiMJHigw7MeyIF8A+sRY5DYsq9DxRf6kJfg+ihUVuTOZ5tl9yfN0Q69mYuLr6
         WHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GY0htM7LLybH60Zvhq77Fsv6T50kPeUsLh+oGL9owIY=;
        fh=MXSGabhzFQDRgQ/dbJTT/g33jdfJalwhjN8Z2vjgdjg=;
        b=GE88KOGei9K8Y+iqD8hFySu7gVIHITSGtuBY7M8wGgQNfWC63W2ciPM+0h9Ge4dl7C
         YWhPHDXipWDb31W7Qbsk/pD7taNo6rrowC90l6GdaL3mkCh/D6qBvq7pvKsnpvdsLV8H
         30JIlcUwiUn8Mj0BhtxWIee5PV9r0pp7RCBm0AFxVop0TnTG9t4k8qUQPrjYxxN1Y7S2
         TMuOCVq5PsZi9w52vQQa4wjpYjFX5P6qtBvPEGwP8y6iBH6EzNLW56dahYXU+3bcPGmr
         xnzlP/JthgdiRltYrois3i5vP0a3MIC2xZqTQOEETkVjn0MoyLlSUuFER5n0OuI2joCd
         cw6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784072; x=1794388872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GY0htM7LLybH60Zvhq77Fsv6T50kPeUsLh+oGL9owIY=;
        b=YRKpF+mojX5gIcBXUamGdAWJ7kMFWIy8+YYu4+aKV+1U5/nhl4aJNR8LSWs+hpuo0o
         89kqSzZRDO19yN21vK5wpbjZO6YZBSvhs66ZT3ZvnPEAYuRQe9+8+RcbHh/R8MBJKxww
         urRzZIB3ibLIXsB8VuQz/Qm9jb/+ScusInci2MqTwUVr5IlwxC/z9czLoHOo/69W7WAx
         rbwZuzOypvXbe+qlEdCDF19Tg3AMNCAhjwZVZHSKz40mkkCB9JO9sRhHjWpmY8QEqJ9E
         af/y1ap1XjUOv4VvWbAx7RqYpSAYehvY0+ruPM0S24Kc8NUUlNQ0kqSW3ddIGbleSoYZ
         3Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784072; x=1794388872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GY0htM7LLybH60Zvhq77Fsv6T50kPeUsLh+oGL9owIY=;
        b=whax7e+3iJk0/d0+y4jGcrty4WTH0JGj3NsMhsskYwRTdrnBmCIzENiACqNjyLjq5O
         33KkBxKwb80z9f+3Pr8TtQnp13Mh+I3Wdx/kFwwajd4oEPvm1jLyuGiFJub6KXyv5I1u
         mTowG1FCMC1xV1fBKfKn4P03+suSP/Uo/+png/42d4dysK8pVW2so4A4ou55M9zF/GGO
         ei3RPUKJzthYtxWkfBKuJHp7czTz1kBsqvpwJlUN7PWWonxxzvWzwTPQPW0rrxdMANa0
         6O41qLlVKfPE9QveOEuFW2P2fJoXH5TEzjLQzb2t09eoCHrRI6mY7QWKK8Mn9WcchyR7
         Gs3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxv3XcdYSNVrzfXfbDC2IdKU5x76iGFng6Xa6BGbVNUfdTMcuo6epTb0dlgvoHeu19zJXw/JlF8j5dcJGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8KtmdQw22X+54RLvVq65mhS2ZExYfXliM7MX/vJNgOqKOKJ+G
	iZpJDznsXjD+A9zk+T180osvFkFrGTjIdjP2k7dnuuAGF5hVdSrSLdAjVDykJ1UEQw/GZuzoCto
	vpK3mjURECH7401YCGFmlpq1COc9hZm8=
X-Gm-Gg: AYBFou3BRjimvHY41DxWvQpJcTOU8cDseleneNxQ6+H+01VoscPMllG13o3HHkGOdEW
	bEKuDKD0tlsyARgIG5FiboUm6WlbdUz5QR8cF648BHrgZj1uqfYIFE8cojI86CJyaBdLfH1sCXU
	nyHQMgElzJ6YRHQHIS1Uvkc40g82HOQe6j6tXFS1Sq77jo0EkzdhuJ5UijYy581m54+yJkBzTvf
	CoGzMFzNT1ZrBDv4N/u4CUXdvf5h6M6ZZDTs1S3LA8yJvFgGpHSl1w1jNdw4C2DovqRic5NnBYp
	HsVTxBJXiDfE86WKghlFaC/FdkeIiiPIsohzgYN+V4W2XGmo3Lk1AxapS1EU3Tcr9eRCZ8AqbU4
	yzGUzbdo6goNsM8+kpvBaXhR9dEN5BaKE83KEi1oYi8dO2X8BnF6q2mI3afR6NsNpauWR2HdM
X-Received: by 2002:a05:690c:d83:b0:8b2:fde5:d95e with SMTP id
 00721157ae682-8b2fde5e72dmr27025397b3.63.1793784072404; Wed, 04 Nov 2026
 01:21:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102103621.156928-1-umangpokhriyall@gmail.com>
 <20261102103621.156928-2-umangpokhriyall@gmail.com> <auot2ZVM5YjyFlZZ@kernel.org>
In-Reply-To: <auot2ZVM5YjyFlZZ@kernel.org>
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
Date: Wed, 4 Nov 2026 14:51:00 +0530
X-Gm-Features: AclHuK9dbghBwN40s0Kd9a8eejM4zi0u6MKlqoBKgZ5z64zrzbWRBqHetF1dhp0
Message-ID: <CAOdFi6fb=d8RDk3EJSfGHSCKtsVjf=dmG5o2fq0dPxQoyBohzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] userfaultfd: validate the whole range before changing
 write protection
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 12:24=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:

> If we a breaking on any error to out_unlock, why do we need err =3D 0 and
> this check?

We don't, thanks. v2 drops them and the -ENOENT inside the loop. I kept
the one before the loop, because for a range with no VMA both loops are
skipped, and without it the call would return the -EAGAIN left over from
the mmap_changing check instead of -ENOENT.

I'll also drop the selftest.
