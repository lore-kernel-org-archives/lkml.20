Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793566500;
	b=NjQ2+c2LQdE044Je/Qm6UeuDv4slDkY+b83ss68ODTYqlB8+zXDRVcrIbnxvYaMoMEAm
	 eiSZ6u+6ApTi+gWiarmLlFhcwee88wEduMLAsPeA01KFY/W+Jzr2t0/7q85SQd8fCTMlG
	 duDXL/z0n7pDyZ6R/eaflsbU7FkrzPF2houUjd4Xg+Nrzg8VJCqPAi+0MW83iApSNmEfk
	 uo2C2L7O5X0RkFGyk4lCdC1nd3gju5TWBXyOaLOVTBIgr9wXKhfQe05Jt5mXJ0K3KHB3A
	 yn2N8anmO8HGget9BwkROXA9En6wDPxBWeSs28Q0nID1YapSe0GnfJSUE938OI4yxnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
	b=Lm5Dm9Vcv4Ao42z91EwufnybKtZ7KAXSYRC6HrqbjGyA7RF3SUux+oHHDlNUO+BlB0Rh
	 g85vW3EN1/ZyFWcF+frJbTxpiW2V5KThdl085FoJDdKxv+dPlO7tqH806RPZjLoCZFiWk
	 gTahRASwRXre6ZDJNjsywFJCl3aIxxwV/PS/HrS3WrzFre34GvaL99Z1Wz2RFYTztWK70
	 n5P/2Pdc0c4Ri2HEMRvGyBpgKWT6D5oeB8KnJfywCtCaaIUiOvmNPFZcVEvIujyCDtBij
	 82infIw6RzEhRap4MhqKjg94pzwX6S4V69mr9KeMSM3y89AbKIBGafCX4wLS7qhcaJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724B606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4724B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so3213871a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793566499; cv=none;
        d=google.com; s=arc-20260327;
        b=SkEvhN8hKbplYr9h3FvkvGnFG/fizJ4RTLV/i1OdOOYW5umXn1TvwLbfzd0VF0JlJC
         K+C/pygHYU17/6/V96V9T4r1iaIi8Bfoa/2IiQid8feEFxbArG0kSR0f86FEJBEFevIf
         QWf2mcgC7Lfe5NkhudrV6k5SLf4wj/7Z5939hbZu7n0JHpMkRNQ0Q51gHJMW9a3fBYCO
         u8+eoEIkKh+m8t6DOU7kNm0D/kVFiCGhA8Hr94zHyNtRrtS8AZNhHUQx1kzUBQ5dFoxW
         LyBQxa28YcoM81RKGAs6wnrm8nSmNMhKbN88XDXn275Uq8pHL4kcVLqqJMNZXp6DI9C1
         j+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        fh=BlI1fpa47Wt+AMPGB8iHJTr/eG1Fpm0zFaGNfQNImtQ=;
        b=IoEHIsJ34rSwvAp2zfjXJ865rqjHx9AaP9qZmsnp+mR0poE1U8Ym95UFB3DEfWie9f
         ImU3VnWjHNJ4bNmub2AOXIggjNT5BTAy1VmnqLyH0EAXeFb2My6ERwUu7mWvVXRpnCZi
         nMPYugeZv24aUJNK9UxXBaPmuAkTmn1rAhXfga+fGOGC00W29W50trJkLj16KfCMj+YD
         7hWBzVbzx3EN+NHfyJuPTKWOVhMOqFNuxrCj2/6U+JDpQYmWhRsI449eiTsZCEnbESCL
         ujrDxKdqBBx9NYOI5ny86ZkhQgdYL2PA2vcsRDPNN1q7wBxxZaUMP5UiK5+FDLa25Xrl
         +N7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793566499; x=1794171299; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=OxB94iZp8kdfd8GGKl7b92g3lomCornpCWOX5vG+FCefMPIoOtL/O2J/UfZYK5YxrF
         Ivv6cnQUQcyQUIfr8TQDTGMme9b8bQMpK5Q4EOvhLX6eZsOHWv2ctm3ukB5MBhYYPoY5
         4u3OOXQt4eXFHxmaIMUeQ0mJTZaMyYE/c/7qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793566499; x=1794171299;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=ziIezLQcvxfsU49Txw4kXxSXzlsgyzMesc9v8nmpwUJ/SjPUYV43uMNPLImtkeQ4Tk
         Y/HZgCnhuD4oXlQQgVd+UsRJu+1vHaijn5QusH4KSVrE5WAP0UZdBFvMBTNR2RONdSwH
         kD6p0d2PKvYclBGaaFVQZwCZNNuiZafkKNHMCsd+C1lfEK7StIUEcNUUrAVHJXkmiTb1
         q7MJHGOJGwN3MElPUfgT1dC5fsh+dyjoDhaOwk3dl75S9KDJMdTJTc3RBbbJHUy6UOEW
         SAVdT6ba3SLNnvW7OR6WFUkIqkZ/7qLgPJTg4w0FvH/1zg5xa0tKyy3enGZriTv3mcry
         aaGw==
X-Forwarded-Encrypted: i=1; AKwUvBxVmQ9uXZLvuyXmacRPWusRV4rWA9oyAPHwp7b9Y7P2tyZczmXaezxnzoGs9yGR++sMfnn6EAIv8947WwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bdhD1lQbE6Y5/dSJfTVQmp/PKevbIE9IERj3tQFP97tfstHk2
	G4VC8YDy/H3kQurDB+trOwI1OvJHdwP9cjqpyqNDboyih6lsjYCFYTRDEeiOBS3RAl1SQq1QAuy
	nbyuNvPicIkb76mDSITqwOrYihoCMaIVrxHDbNi6N
X-Gm-Gg: AYBFou3gfuxPDSri49u6RNW8JrtFkVoFOOYbluESGAszX+KH4y2+WdeYPXeEZsRuZyo
	edpBoVtucJX9lAZ7gKW5YU09LLiRAeaAap1xeBr7uEKrYBF1TQdCHB5EFjOZano+AeolJ72V7zy
	4BU7Y4nJOGuL/JXqjFj/Z5n/spba3dy5T/g7ePG6ZaosHwqWhRjoBxtMoD+8baBUBXU1hH8Kmvg
	0lCAA3BC0hy2EpsyTGb5E6rsv75cGYxARJFEPIT2DJltPJSHrSmtRh7CAXFtn3tkR3aIf1hFkOx
	Az+EFtE3rzbctfQEi6/GjYAtV2XqOxwUDEUCUF83X5P8vbabVVQlPnqpazV+bCalLkjvTFVgMHL
	8IH67vrGqeIIxBy1jtLr7AjA4nn0MeYLuF4O0UNUHVpJWUqf4WUskfhiDGmzXb83vyTLDoTc=
X-Received: by 2002:aa7:c1cc:0:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b4d4d6f96amr4159175a12.25.1793566498639; Sun, 01 Nov 2026
 12:54:58 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:57 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:24 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com> <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Date: Sun, 1 Nov 2026 12:54:57 -0800
X-Gm-Features: AclHuK_IoQTHoKBTaMx-KZNiIPIi7_TIlou2gkeHseuy-klQIv193ZXwZZvOcw4
Message-ID: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:
> I think that was in the the "after the cut" part, where I said:
>
> You can see the fdtfactor post at:
>  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

OK, that covers where the tool comes from, and the question goes away
once fdtfactor is imported. Text below the cut doesn't reach the git
log, though, so a sentence or two in the commit message on why this is
wanted would still help.

> The goal was to make sure that we could fully reconstruct
> __local_fixups__ after applying the overlay to the base. v2 of the
> fdtfactor series handled this more properly, and I'm planning to see
> this through and land it unless there are major objections.
>
> By default here, I'm running fdtfactor with "-S" to strip the
> __local_fixups__ out with the assumption that today people don't
> really need them. However, someone could easily override that locally.
>
> I'm a little unclear how things would silently produce a bad overlay, though.

Sorry, I should have been clearer. This is about overlays which kbuild
applies at build time, not runtime ones like Beaglebone capes. An
entry such as:

    lemans-evk-camera-dtbs := lemans-evk.dtb lemans-evk-camera.dtbo

is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
make_fit.py path then puts in the FIT like any other DTB. There are
several hundred of these on arm64.

My concern is the input to fdtfactor, not its output. In the in-tree
libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
__fixups__ to resolve its phandles, then overlay_merge() copies only
the __overlay__ contents into the base. Only __symbols__ is merged, so
the __local_fixups__ in lemans-evk-camera.dtb cover just the
lemans-evk.dtb part. Cells from the .dtso such as:

    avdd-supply = <&vreg_cam1_1p8>;
    remote-endpoint = <&imx577_ep1>;

end up as plain numbers, with nothing marking them as phandles. If
fdtfactor needs to renumber them, or puts those nodes in a per-board
overlay, it cannot tell they are phandles, so the overlay applies
cleanly but the links are wrong. Stripping the fixups from the output
with -S doesn't change that, since the information is already gone
from the input.

Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
If so, composite DTBs would be fine once that is synced into
scripts/dtc, and my concern goes away. If not, one option is for
FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
the original .dtb and .dtbo files in the FIT separately and the .dtbo
keeps its own fixups. Leaving composite DTBs out would be a simpler
fallback. What do you think?

Regards,
Simon
