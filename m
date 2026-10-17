Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC993AF647
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206883; cv=pass; b=f6w/4/NWjIHDWJCZhMvwfsqsSTYgo3i00MmgXLKypia9ucHWC3GL0kybRB4+IvaYjxllEG3z2uTWsrhRy+aQWwCtuxo/zTGmM8i8qqPi218yt+QglPWg4E8Nx9YKS3XiB5UU0WePjMF/vmoS8GNNQ3DGe+LaWgPOdej5xBXFbEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206883; c=relaxed/simple;
	bh=LEJB3CMsdWhcuO9Uznal2vKEOhdcLtR+2E+o3nG3VQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUrjpImu1Xh7UnLr/tLj2loQ5Gz9j2Vg88BLXTwHJ4667I2INVQwXBFqIFWGLfm7fDodV3SOaF20ok5pHY9b55JyqNlGJYopbuBTrO0St3VZybRUqRm0pdmorpDoPg/tLMlW+kqcOsin5Vw2KQW3JqUfIJiCT2srAOTOK45rRZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb9M1TXW; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb9M1TXW"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b89c6caffso3772426d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792206881; cv=none;
        d=google.com; s=arc-20260327;
        b=BKHgN+7pd2xBCyd6NWfljfUy42b16NP4x29hkQHJg1ZrAsXaMMxrxu3ek2AgjRlMjx
         yJJ2CtnAoBPIol656+B+PB8vB9uUiV7MZJ900bADZjegWID91fHMknXdYnRg33ZUjkVJ
         p0GBDxzIDxSFgdMag46e8L96eJ7QCtbj6y+djNUHMgIqtA9SEMFQEUD/M2eh2vQG4GqV
         S2mFxpkS13GlK2CIKxj0EjpinPijpThNxwhsa8LJj+jfYCTT7HuDMHOnhoMECesPSsFb
         nTyo+fviXFjVNkvMtHe7v1/GRzELN7XXMSHInmS7hQH1lHuncqP6DmWvBq6o6ef5ydMJ
         bEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LEJB3CMsdWhcuO9Uznal2vKEOhdcLtR+2E+o3nG3VQs=;
        fh=bCdPAozmz1UBm60cE7pJv9cHzhJVKPoQO1NqhUl161Y=;
        b=AY9SomuuNLEQFh5hJ4FDZfWtR/VORz6O38Q8hGqXTiGMIknS3fQvp7f9je31+HkR6C
         WkVuBuRpVqmlz05PguDbXVvtg1fN7t9VfoiBDzktsk+WeSLf9kX38uwpK1oXB/8h8MyD
         fMVOCTZW7dOGQT8W7jWw8yN5A/DNUnzQA7/FsjBsvuXQzZFtHgrFQ2e0IKm0YMws4iou
         MTiqW1g6512KbFshyI0vw+EQ8YBTrL7Cxs3HBC0w3akjQ1kOq+F1D5tpdcp2fF5I0rYr
         PE7pRUBRkkF2YsT0JXPQilgxXWXnDw3MH99lHLEvoG+X1V+bdgS42KWHnscCi34NbEJX
         xZyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206881; x=1792811681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LEJB3CMsdWhcuO9Uznal2vKEOhdcLtR+2E+o3nG3VQs=;
        b=Yb9M1TXW5wciV1PBzIYfL7B/1Af/PGyPShKeVxsnzRSoWVILCYuQj2NK62WtF0Px0h
         awAAPwE0DSxGzUeijRRAbJQeNTybz5Sdn0VmdEfO6tuidpho9kpze8ahaALHxr02EVyA
         oMxCq6OLcHLbf2fHLmt7U287dAvIc+2Uf+NQsfqzMwTqquKyvHHGBPrqnHLYM2VtLXab
         hRi+WF7XS9aQ9xMgS6kcApfRMUns2PtnP4bYgdTHLFr9c5l5pkQIG9KW4zJGsGvd9n8+
         D3U8v4wCTpeGh+FnLz9GB/GSfujEUXKVLtCKV7F6HuYx0VeqgXAKlJU0/a2fiKc8VBco
         vOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206881; x=1792811681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEJB3CMsdWhcuO9Uznal2vKEOhdcLtR+2E+o3nG3VQs=;
        b=wzMniFcUueYkV83u1IpTe+HEXxmX7f9OTjaTs0uNU0yxljdL3BWUONeTHOrN1gHsv/
         XdbDJI9lPRqu1NoQ63ifryh8kJgYm3irB6h6SJlQLbFJiyT8XlXGkOKm/rE5u/OC/t9K
         AZXR7MoeeNxdiuawpySdlYY4a3FJbUGNqkLgNy5r2Fg9Sfqkn81g0FKGYPGp5r9NkpUR
         qdrMYM7PlsiT68hdRVNJzPzpqdjV66eFfdK7skqb8Be70noPKzFt83LFJVhVUmGbUAOn
         AkdnssOE5C+1VpVxf5Pl5+faXgb/AHt/XZyc7RzwD9/lLZinsGlECi2tuutpufnQWaQi
         DUAw==
X-Forwarded-Encrypted: i=1; AKwUvBwvvaDrl1p79rLL6T4oN8aeaitUWHfxHGOCJ+M0UFNAdfpAAN6FUNftZkeLOXt4HgXHtmNr3TtCx/4eRJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkv3vq2M1815vopmE5MED9MdnM/cNdld1LBp0JY34BymloLGin
	rE4Lz3w9o4DvsodDKwkksgEjfZdp6vSKIKt1RSx4RTbvzLhIPsDQQyLpyPPs8lk98DE7a+ubadD
	jipFmqCmZu25tuxlivkC1Wx7XhnUvJkc=
X-Gm-Gg: AYBFou1RmkNXjJows/wkroi9C7gfQprDbZxH++pGJBlGtlPx7Cnxd5Ss3/kwDskkpu8
	NT11VeqJvYwH/6FM2s+2sosiDj+EfE42O9epohs1FUgKUNM1MJ/78nUoycT1n7j0KUT1W2GX0gv
	mz+rx//0kHtg+HRKCfvx9QS6/lBtZMyU8eSmZF8orn3DvkIyLIthGZkl92tcTuZAd4+Is328+U9
	ZxQLW2o4ARoDdAHG8oguQOLnDmjM228lRbD1jKgadDL3dYSHGQKeY8RiZwOQ2P4+dmheS5gVoaR
	uInG1T4laMEsG8zkf4RHUyCwgVycrBD3y/BTRIB2raDtC44BlvkQPeAQ/JOPX3qZA3rpMnqgp4d
	F6Q5QYcJoybytloPYorCgJYKjt2mfGZ+MLkt3hQk=
X-Received: by 2002:a05:6214:860c:b0:91b:852e:28d7 with SMTP id
 6a1803df08f44-91bdec36a8amr33004946d6.4.1792206881499; Fri, 16 Oct 2026
 20:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015102353.999695-1-linmag7@gmail.com> <20261015102353.999695-7-linmag7@gmail.com>
In-Reply-To: <20261015102353.999695-7-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 23:14:24 -0400
X-Gm-Features: AclHuK8b-1N0Kck8gq02GK77qViHsl9hk9oOSmLb4AnO9XSbIW9ppfwvemwHfkg
Message-ID: <CAEdQ38Fd5ozhu7ZZCw9zJhH8JSQAKB6SUmoHxTU_w3PXw=g=eA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] alpha: add bounded Clipper console-log scanning
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:24=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Clipper console logs have an HWRPB byte count. Bound wrapper and child
> traversal by that count before decoding embedded processor and system
> logout frames. Print the wrapper name and event/halt timestamp, halt
> code, and recorded CPU ID for processor packets.
>
> Acknowledge the log only after a complete termination packet. Retain the
> firmware pointer on unknown or incomplete wrappers and print at most
> 1 KiB of raw bytes using print_hex_dump(). This avoids the generic
> scanner's unconditional acknowledgment after a parsing failure.
>
> The ES40 record observed during testing is class 5, type 4. Its wrapper
> layout is unknown and remains raw and unacknowledged; it may therefore
> be printed again at each boot. Successful decoding of a nonempty hardware
> log remains unverified. Keep console scanning independent of the live
> machine-check and environmental handlers and restrict it to Clipper.
>
> Console environmental payloads also remain raw: ES40 Service Guide
> Table D-18's sys_offset conflicts with its field offsets. No register
> layout is assumed for unverified extended subpacket types 6 and 7.
>
> The scanner invokes the payload decoder directly during PCI init; no
> generic subpacket-handler registration is needed. Mark its helpers
> __init and retain the PCI init hook in sys_dp264.c.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Reviewed-by: Matt Turner <mattst88@gmail.com>
