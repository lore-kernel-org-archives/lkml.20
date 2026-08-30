Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749473B14D1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104325; cv=none; b=EL8QNkvUuNu5KLZSI8ti40N0XDgEOVVA4tSGQtla4yB/jKBPGAu1X4XYzib5T3I+0xxHfKyyx90Y5tBmL9UEa1EKq8qfZmEBVM77mvHF9lEKzs4Um/havGpMi/1jpRRie0PZLySaS5weJNhodgQ21+Eme//a/xIFXeX56vfnads=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104325; c=relaxed/simple;
	bh=m6+Ek/PN1wctkJuUny68QYg7Ai+Ffk6R8mB2ne1u+6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1WyqxoGdrs20ckmpkB3dhV+rjnTHiQXC07UuI4SDl6HI3HNHJUc9NiGP9Q/X89OvEtrDp9MBiXPli6GLfPinEszQrmfyE9xjkoJMWJpigq7tXVOfHcKNzVVQ7csAmdZbTEAZRS1EneeHgDWFsJlrt6jhiC9R8yWKzmcHi5S/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EvGsCBhp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EvGsCBhp"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso3447711a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788104321; x=1788709121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Lg4J0njR1Ed9ei5b7HWuRMrIb2Pa5yopcVpnUkqUlM=;
        b=EvGsCBhpTClMtQwDoW1bIlb5qGHmWE+BjClb8YdRvglrB90CQQjZ/xubsLIo5/2H96
         2vdy5IeMz7J33LAywkstIrmzUnWK57gg5HbPJVBhQdDA4O/DLGn2Kl4ZOgPb7EPkh8QA
         ofb+b/E2AfRVcI8gvs2bcQ224v3PeE6Rdv0Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788104321; x=1788709121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Lg4J0njR1Ed9ei5b7HWuRMrIb2Pa5yopcVpnUkqUlM=;
        b=j+l98fQ7d4dH5A52ZeiJOjrBUKr7ZH2HFak/JoRakpGnI3HZfReTFffDxuqeddKW9D
         h1SfRaloubNn6eyexHTLVHIZS4Z+bwv+yDM+Blpv6GNA1NufzW/8IPTDowGaZGYJjAVC
         iGoGf7k308ATf4zovv0703LQhZTMExLr9ET/ECv9KaAZ0AXftKAfs58rf0ylDIQB1CFe
         mvDaitkRvbvInKihC7ONep6cg6ZT+VVGil6ol0Aoh6YAgyPRTaTtrrjLmi2O0ANpQTRv
         EgjVGQYHxe/YOLVyJqfApoEp1NxsofUsN8puQZQ4ObG2jaz/LYQbtsnNjdYtHIvniaoD
         Ye4g==
X-Forwarded-Encrypted: i=1; AKwUvBxaMnmjh8jo5vXti1La91f5CUVGb2y0dsqrrXeyB59MLAuvx6yq0ay+brxBE3uwiE+d6TXSBBwiiBX9gWc=@vger.kernel.org
X-Gm-Message-State: AFuF++n7N27+HB45oH8k8POyU2JNQIKUcLHOVA6NcUgyHl8B3vpklxVV
	9okVmMaBpcdxjTx85x6Xlaxkk6endzof8ZSKcDSmRZ6xOXg80vDCP7rVRJg7Am710FJCvm7ga3u
	5nHtQOYE=
X-Gm-Gg: AYBFou3Fh1TuHHIZww9461PaWzVngcA9rTEh6rAMR5U6m+kqtYE3uma8o9xIIY0UOaV
	bcuXWnigT/1bd7A7OzSHgoTwIK9fqM+SQW6h4k+x4ML7jgxl++2O0qUaooU4sM8lMi9JkqAgXMx
	+gMSuT6/lsWuuglFZZT743ZljVDfN7lniZSfa3EWTv336tLjYUvtFxgeF+9oWDFce3OO/cZyfWt
	2qU5N9M0a005xYrayUhWMHNQYobhUs3/ByYmSpKGVFrs42kyfCTDV2EZw3srOJ6crcRLVeYdpPI
	SppnLcGpzsjfLBrTd0FzgI+TNbqRD1ZnU0JyabOIK7i7HrcbpNFn12O54x3SZ1OPm2z4MHzoiK9
	8mZlZ+t5t6O5uM2LG++iReBAEViamULwdBlLSr+U7pEuVq6qV0BOdbvSlmy+cwfOMaUeYwqzMXa
	aJWMJFlO0pwEBtNcn6+duDsQCi9+w/LhB+gcxkPDHE2YV9OpTp0WaHtv2qjBZY1LpIzPd9d/1YH
	iS0k4zCa1LqsmEZufrWuA3npCYNUUEAUlAAmow=
X-Received: by 2002:a05:6402:4586:b0:6a5:d907:7703 with SMTP id 4fb4d7f45d1cf-6a60d3d5a52mr12729515a12.14.1788104321429;
        Sun, 30 Aug 2026 08:38:41 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c52103sm2217183a12.21.2026.08.30.08.38.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 08:38:40 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2055573c8cso325865066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:38:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoEAlrnjUdtVWf+4tHkajshVgEKRtHn82kMhBfagD2QVey9KBeudplVKLZQ8yDETip8VhkOkXUDQrJSkFU=@vger.kernel.org
X-Received: by 2002:a17:907:6d24:b0:c25:4cff:5d01 with SMTP id
 a640c23a62f3a-c25571b1b5amr1265164666b.18.1788104320046; Sun, 30 Aug 2026
 08:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjUmLrJd4KM4xvJHUN4P0r8oSu5LyvG4JipnhxizBrE9Q@mail.gmail.com>
 <cover.1788018958.git.legion@kernel.org>
In-Reply-To: <cover.1788018958.git.legion@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Aug 2026 08:38:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whswMNv4Cdjb8Wz9kXOVzvMVuJEgrCUD4Q_c8-Vb7Y4yA@mail.gmail.com>
X-Gm-Features: AcwNN1Vwzq543nI2mh708cBhUlSRpApbG4s3sO2SbH8vefWOqxWCXiyIIN7mRF4
Message-ID: <CAHk-=whswMNv4Cdjb8Wz9kXOVzvMVuJEgrCUD4Q_c8-Vb7Y4yA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 17/30] sysctl: net: use sysctl_field in SCTP sysctls
To: Alexey Gladkov <legion@kernel.org>
Cc: "Eric W . Biederman" <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Joel Granados <joel.granados@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Aug 2026 at 09:15, Alexey Gladkov <legion@kernel.org> wrote:
>
> Does this look better for you, or should I just stop?

This certainly looks a lot less disruptive, and seems to allow
subsystems to migrate to the new model incrementally.

The conversion patches for ipc and mpls looked sane to me. I imagine
the other various cases would be similar. So I don't see any huge
issues here - obviously the affected subsystem maintainers may have
some (I suspect mainly networking), but the whole "avoid having to
copying the tables" is certainly a worthy goal.

            Linus
