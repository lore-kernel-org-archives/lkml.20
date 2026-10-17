Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD413B6BFE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257191; cv=pass; b=XtGSr5G4QprT/PseUjSfTFnbJdf/lv+Ymd8Q6UYydBm1q+CWiGqZtTTf8tfJrhpE7yeYrnB4FrLLCYdt/rP/xTZar69+kUPAL78zkF910ZVmTn1JGlyxsqcdl47tyYOV5Coh2D4OhWkTugopKOGcZCJwODiAm7LeQw0GTThmVxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257191; c=relaxed/simple;
	bh=KK/6HWZ+d5OiLSob8WEPa6l+Oq0ZCC5OK2DI+kb6CZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+7IDTn8iz86kKsZe8oiqLX+lYs9A+RwR9Jf870jJ/xhRcbUbitouD32Yq1FJAYaD86Bk2rq0xt7OrVOxCAaFjD3fjlP4HXoNWCDFRlAXOqt3nvyQCSRzMsxsHkBdj5+djFeU7qB6lTBnfKlhL/CFkHuaW3XAtUgO5CMbbgpFFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com; spf=pass smtp.mailfrom=miget.com; dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b=P5FvQWdG; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b="P5FvQWdG"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4c9859ea2ceso544133b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792257189; cv=none;
        d=google.com; s=arc-20260327;
        b=UB6RDBkpyb9b9XpNBGOoe0bs+xC9/M4CGLqTxQiMOURxdjs/41NhDIqdYkLtOoZfwD
         zz6RMRXppXWUvmdgqSr3qbmRyYnygnZrdJfrVr+NZ6AFXnZwb7reCnn1LrTfQB7p6w0Y
         isvYt3pQczNwBBRG81qwFDBNNuzumV1gi3ew2aQ0Vzf9raAX0CvTegfuxzBBLoGUvTrc
         vL4gaSpAtndLZ3UH8oqZNFey0R+RvAW1UPEDFMY68qbugjGTNSaCgEZXoxPJ5STCqFd8
         xz9bnLAkiu2rDusHBkHhOAoVmv/BZZlN6tqWR2QsBMUih+HfN9gXXW84zY2XkSxFLBz3
         ugBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T/Y1OukdaSXyrw1Zr7uqBLhMe38c1BeQbrBUuBsxqXM=;
        fh=EQlvqC32BzO1pxSAWKw4uU1LFH28TERiojWmdo3Yx1c=;
        b=lomNxYtQcMKfYoUzl69mdL3r9dNvTEq2tdXKULzavprGK3Nvh9a8KHTdPILDuTJZ4a
         pRUn6CzZsHcyEQAIjYKqI4cF8PmsCGLxagyRi+84m7yMYWkIW2z7OfisW4/jz4Goy0X/
         bu/+wPu25iyBvw6bSAS3iU/T+RFhUYg1yOSPh4AjYIyQouRdF995fBnKsJWggd0rQMJT
         AGMbQxxeYHe+9pp6IfpBar8FgXG7iQ30Rek9DxJP+iCl5cZeqrNWWYLJbOhvvjK6zPQo
         CAszWzMSzmvizqbUosdizZfuDao+kbD46t1pcUSHg5WpukcbwFvpjhZj9H+lGvgJ+RfS
         EOQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792257189; x=1792861989; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/Y1OukdaSXyrw1Zr7uqBLhMe38c1BeQbrBUuBsxqXM=;
        b=P5FvQWdGOzqr2mH5vTpNkk3SC9EVNH8MFGsLMTwMG2QYOMVFaubqQ4A7EM7hAHp40i
         bdLtbrwO61Q6FeSelPD4PMLEh2/apnP+aYFIExtJh+rVQXVI2LEyBY5sxIcSqis9DPjn
         tyz3lMR5UM/1KeFivFGa4+U74T4Df9upj18Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257189; x=1792861989;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T/Y1OukdaSXyrw1Zr7uqBLhMe38c1BeQbrBUuBsxqXM=;
        b=Ly5XbaSqy81DBBZNvec3n7adhL/tvJZx/nDDHsD564U1nLP9VRzfJDRQ8NAbGxxgc9
         QdJXMmiksbhD6e+k7xe67sPnwLEydxWADiJcaRgCeysqWttCEBKItOGJBx2g0NjNd6Bf
         14BNEZn/KLHDfylibvh5Y7IOfalenNEChgi6UT4ZpH1iqZeHHgm9RXh6CEQqLVEsVRmG
         hXOYDlRxzmMniL8tlTY8G8MSx3eoTnbk0rik+qdyg9cTuKGR2eQJl8kdsyt99ztndZyD
         XgRdY57rg1hWWKx9uq8RTqYMVoW7GGzdLkZE313yMWC987ic6rPZ7JNsVaSbt/rWQDJG
         995Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTYWVrSZ+zp3x4RdQ/G+2nC7RhGpvVjLKnD0jFsbSBM5pAyNwxUoGUqL1oB68zjiHH4pzBs0OkSlZcJAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnoUYwVoajSuvJbMQQRs1OyibHKFPNWR1IFFgZzJHGtg9LSsZu
	0+BiisvLxB0tz5j6LABIuh9kr8IBBw2wb/QG8dg396KqpJ1HzNh8cstEkLhnTdlSGOn35bDeXGZ
	PNxVVn8kw8dJ391cab4uO4ibKwQ2UOhgVAFyhb1IwdA==
X-Gm-Gg: AYBFou3JdU1Z4Z2hpB7FOZ6R9l30Hm7YlZC82dchLvJVn4n5bSY9ZZPs+XkkcMkizHp
	UDgMS4NyAiDMmnfV5PpYF9Dx4WioC31Y9SNFcf4QxTKT9hRk20qaGXWtpTi9Nhn2HQ0pWWyh4Zv
	Afyc4CA35IuWLidkjcWUJ2/kuTbRW+E91xZCqybLS7//JCQNGBKrL41lZE4C/hcnk8DpWLxBr5l
	JfdN7G6v5ZLSNyokvw1C/Osox09qOsaa7VoU+eTPjMfP01Y7BHoPoW7OQq5ZVk9PUJLDf5J85L8
	Dj3kmhhP/QpN9V4POFt5gHkytWBQBI1zE6eZGUzcO977PsBBnt5VilKDgZyPOmIMsZzXGwBZ50I
	prSvJNi068Tx8
X-Received: by 2002:a05:6808:3010:b0:4d6:93e2:5bc1 with SMTP id
 5614622812f47-53cd2a5cfe9mr2177806b6e.66.1792257188784; Sat, 17 Oct 2026
 10:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928153902.139956-1-chris@miget.com> <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
 <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
 <793647dd-8835-3bb2-88f4-ddc053580bd3@linux.intel.com> <CAAcRvKOADz1T_MCv4VB1QxT6uMxmU5Ax7B3HGRYbZ8Ph7+8-rg@mail.gmail.com>
In-Reply-To: <CAAcRvKOADz1T_MCv4VB1QxT6uMxmU5Ax7B3HGRYbZ8Ph7+8-rg@mail.gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Sat, 17 Oct 2026 19:12:57 +0200
X-Gm-Features: AclHuK8n5EfYY9SaP2lrJrOiRKsWmEW7O5PHGE7-d40srHBfuwEOIDu2OL5plDM
Message-ID: <CAAcRvKPfrFUS7vC-F+seSJyMAWfK36S-_UoQXzRy3R_udpVJPg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: TuteMthCD <matias.civadda2342001@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Mingyou Chen <qby140326@gmail.com>, kento@kekto.ru
Content-Type: text/plain; charset="UTF-8"

Hi,

Following up with test results. I tested v12 on the Xiaomi Book Pro
14 (TM2424, BIOS XMAPT4B0P0909), applied on pdx86 for-next and loaded
as a module on v7.3-rc5, with a local TM2424 entry: 0x02, 0x0a
(no_set), 0x03, 0x09 and 0x04, plus skip_ac_type_check and
accept_zero_function. All four profiles apply on AC and PL1 follows,
and pm_test=devices suspend/resume is clean on AC and on battery.
Without the entry, GET fails with -EINVAL and every SET with -ENOMSG,
as expected.

Mingyou, two more things:

1. In 6/6 only -EOPNOTSUPP falls back to balanced. Without the entry
above, restoring the profile fails with -ENOMSG and the resume
callback returns it:

    bitland_mifs_wmi_resume [bitland_mifs_wmi] returns -42
    PM: failed to resume: error -42

A failed restore leaves the machine usable, so I think resume should
warn and return 0 for any error after trying the fallback. The same
goes for suspend: bitland_mifs_wmi_suspend() still returns the
laptop_profile_get() error, which aborts system suspend on any model
whose firmware reports a value missing from its table. That is what my
earlier "Don't abort suspend when platform profile access fails" patch
was about, and it could be folded into 6/6.

2. With skip_ac_type_check, bitland_pp_check_capability() still
refuses balanced-performance and performance without a power supply.
On BIOS 0909 the firmware runs 0x04 on battery (PL1 58 W), so this
blocks a mode that works here. Kento reported that BIOS 0707 NACKs
0x04 on battery, which bitland_mifs_wmi_call() already turns into an
error. Could skip_ac_type_check skip the power supply check as well
and leave the decision to the firmware? Kento, would that be a problem
on 0A0A?

Thanks,
Chris
