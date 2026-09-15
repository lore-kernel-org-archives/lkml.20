Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C67330B09
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459360; cv=none; b=ECyA75Hbvg8dKYGhzY0V6ZfPyU4n0gH6BUma3UOoM9rNE0xNiOmOT37NkxQc2JPyZTJH3yb206OVDoxw0Y8wRz0ON1AbS4hwO5mf2ve0eSx0p8DuqEcjV3PZl1uNjDWCZ+zV3FPhw6eqhrmmWuK3yvGAUTOxZmrizFuhqQ0igf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459360; c=relaxed/simple;
	bh=kE2g9XSuQ3CbMf+Pck0/cIbAUHuSN49Q/ta2mmrnaYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtwAqBpbkOIMc3ceOlkUAo90LtokF1I9DpFd4jbvHtUnPt9+s627C8kRM7h1nczOpPowKm6A2zZwgwanFgfRbna+nVLUx7uRhFyqV6koWlq9UNyXBj78YzL3uDM3liVgqTh4JU/Pw3IejCDLqnm1cxRrR91naZDrolPbbTeQyFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-79c44f865b8so1045532137.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459357; x=1790064157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=51S+pj+NMPpYQZLFg4RlFKvBNKhAajYHE1g36uEsn0Y=;
        b=0OkWtJlmalVFsj6jZyBE+IpsDgIwQL0jBI0UW1quLLFdtfsGo58O8DgzyPj7J7GVM8
         VBBolgleyN0fvJgy0QxbC5m0TdYnok1HUsRZXF/hAilx4mij1rTpyb3Uhnyy4bYhCQG8
         aOyejFjJqUuV9OV767SdCI4WUPlXhLAG6MiCoeMmWbVHrn1nm8FcR9YGVujgvwVyxgO6
         MpEGJXxDBUCy/UnnRHa/s1qLZDIeC31fSZvOU/MGWlwRbCgeMfHzAqYtvn6c2R7p/L8I
         R+RounLRGgLquCkEjRIbqjUFfFY0A6V1l7FEDtBdjgFA6AuNtE8Vqu/u4DqadqMjQ4Fb
         7O/A==
X-Forwarded-Encrypted: i=1; AKwUvByRlCtCOG6Hq0hp0q66bdUGqfQV2faomvoIeqZ6THPslkLOlNhtXJNVzAp12qQrYtJS72+UjiA+4RPIA1g=@vger.kernel.org
X-Gm-Message-State: AFuF++nHLshiMAkIMlowizznH+B1Z9vu6v4zGdRCYbHDSK7VUKFdYm6I
	zkg6jX6BUq1fKKYoy+qy/zY2sfPLR/CA1IN+5gRxDKPc6rfBCcM+GNsd2/9uy4bP
X-Gm-Gg: AYBFou0od3zq1YXp8j2l7s56ROFneEqgIvZBPu445evMXn2BJUrclVmliZIAdor7yQu
	OmcGZsgvw7L+TV96ep4i7iOsr1q7VAFKGzU4xJXEYKMm7vMEvFsFo3etBhHseFsvaTMEcsu/gVm
	vEraMXlvaAz/pxp3jpTE+WcHX9HE79wlVhb+pXnIPqCq7mo63tsNqGGoITflXW1MiqU+QMOa4jB
	rguZhekrejrRz3wy+MCaj0aHue5RQewG9Q14S2DUV32A0WYHU2cYMyHHc5XVkTRcxyHbYwd1XQF
	iyQifdyLtEihl2utMrRc4J3mytoATLc9NB1Cw7L6e0AZxnawK1YsDuEKy/8YCPkHfyn6820TUyP
	8JQBHIF/FzhrUvgkYMPsWQXL6EkeTx7hxXHx7egAtwIxX6QyDJ+TjsS8mq8R8BxnnLIkWAeenHO
	2dg5mAjp7u/7wnCtpSa3FqYHdv/kwqoRNOautNs4L7014bUvregxqlgm07TWLxKK+SdaNRmkRcU
	FfbcVWquIAOWt/pVVI/b+/4Mzyc12GbEeFlRGWu
X-Received: by 2002:a05:6122:2215:b0:5bd:fb77:842a with SMTP id 71dfb90a1353d-5c981d7e25amr7207244e0c.7.1789459357003;
        Tue, 15 Sep 2026 01:02:37 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c846f76238sm14235347e0c.2.2026.09.15.01.02.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:02:36 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so4478804e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQh9WhINA+BbXERFJotYqQ1ZkmbrTCb3V6T0bDBJUIDNqenmGlJyFbMCKK1XKpFGV+wVpk7lxs6pj2osc=@vger.kernel.org
X-Received: by 2002:a05:6122:1d04:b0:5bf:d3cd:3d64 with SMTP id
 71dfb90a1353d-5c98188436dmr7062831e0c.0.1789459356510; Tue, 15 Sep 2026
 01:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914215900.84712-2-blum@kernel.org>
In-Reply-To: <20260914215900.84712-2-blum@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Sep 2026 10:02:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwiVjs-Dqiwoa_oOerDyz58=P3SJfdyT3PsODFDPU20g@mail.gmail.com>
X-Gm-Features: AcwNN1VJlmmjReTQUYQHfnyOvudBS9IClSvuXQXbg53716FCHoIlz6aoWDjejv0
Message-ID: <CAMuHMdVwiVjs-Dqiwoa_oOerDyz58=P3SJfdyT3PsODFDPU20g@mail.gmail.com>
Subject: Re: [PATCH] powerpc/ps3: Simplify control flow in ps3_{virq,irq_plug}_setup()
To: Thorsten Blum <blum@kernel.org>
Cc: Geoff Levand <geoff@infradead.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 23:59, Thorsten Blum <blum@kernel.org> wrote:
> In ps3_virq_setup() and ps3_irq_plug_setup(), remove the goto statements
> and handle errors directly.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
