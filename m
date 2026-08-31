Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73621387569
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195134; cv=pass; b=OjR3UP9JyrCo+mCTi7+gOi+UVitpweT3hEyAjGgJN8RPH6sZWaIhblR4IeVvAI4TG+ueOhdu7V/j3qfv8+VAMezQnyAVXnGtSzajvWVZJWptDGrb+TNbL0lTHhpjzqoyKaBcqqCqssl80BNsvwE8SpVlMJ0nxqejhDEGoQvRqwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195134; c=relaxed/simple;
	bh=ZXciYJHRkksEQipZcqQCYJUB+kYIr6B9V7Na7gJA0HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Riw+F54T0SfB2e0FzbbiZ71fR9aKOXN4Lg+NUm8zeIXer662P+dlvzN0seSw2qzmohgm+J8JCvpBngssFhr5XZ1poVSMcXoOWHlCNOv4p0ZWynkbZSQoKfcobxZSDAB9omeokt4++QqDiWyp3B+tT02+YKmM+am2lV7jLPorlXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JuARjgy0; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JuARjgy0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2531f453eeso576801666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195130; cv=none;
        d=google.com; s=arc-20260327;
        b=rRww4wRcs9fveWNM5bBAgFf2ERVpNgiLF7osG03eI0muYnaMg2l28Sbk5iyY+2Ayl/
         eZP4KFlQd4AbDOvYDronMNgLSdRZMzb688DA5xa3mvdSSkDNXbGR3zBFtdTTyVeKN9QS
         SfeGvuzII7lICYM7G5me/EQyhMmlG75CjPm6NcC6Aluuz7+YRjkKEvR6SSEBVTszECDs
         BLckQOhwTQJpKAu7O2Ld7nSUuSOsiVG9lllHtUa3MNziS6KD2a0PvZQ3S1HTnyJJzkd4
         Xcsn2JOjNkGjp3/l9OQj6uGgUkBneFQH3r9W+UHILdzwEYrLeI0mh8m+V3smzLRQ8V4a
         VfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FmT8nUkVUuQb1uewm46Ud8rp0grLkwqQ5xMhiT5eYRU=;
        fh=F6wt3+3Itj6AoAx+BvuuLfpPuq50KRFsAIo6EOsUR9E=;
        b=pC5ndvFjrvDd5vr8+lC95wOm5xfDJt3m+W1rgI1mCspAc8BKLij9UOzQHF87s7AREl
         53P+ZjjQmLm5Ur8lfawu7oLwY3Adrob5HanMHoGEFGij0xHrU2LPmN12FPe4GTQdy8jI
         k5+GdHKADx2dQx1PPnPvzCeg4kcR0a17xokk6tZmmKQstefXoeT53JZIr4Dvtd6hfFOK
         oPXOKko/wR4Gn3RCi3RFqMFTQvvk9Fh/sWFnAVBtEeeokPowX8sMALYZ98QAHMu45jcJ
         D+q4YfbOIB27ftaldAJyRXKsu1zTFRFIt7Q9fS7YZKMJDvpgeTEtxlL3e1Jnn9g7WUBa
         IYkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788195130; x=1788799930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmT8nUkVUuQb1uewm46Ud8rp0grLkwqQ5xMhiT5eYRU=;
        b=JuARjgy03vWVJjOvPbf4sUOv6qb9hKF7JPOq5l8mmPBGv6CWPYmOZfXUrNjhcQURgI
         931AHuKrk5oHa33u21f7ZodoChRCp+yTdH3dZha50kEcgczr10fp3tqty8gJhswdy8YB
         vu4zUwXEjdOVzSLK/4MBxXqkQluBhSLZ/zoI6/UkGVLee2vQmLhtEbAQo4KBI9k+QhEP
         uZgDS61YP/uYXRGwCOO5snkEorUOaMHWP1FnrcngRHeoqe6XaG3BpqMtTwXCBkllOdRx
         FOW2Jh0kFA9jX8yM4zBMbINj5UelU7ja1kWStU6iAfTTfyGWuwhZfP8t64hdUB/pW825
         xINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195130; x=1788799930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmT8nUkVUuQb1uewm46Ud8rp0grLkwqQ5xMhiT5eYRU=;
        b=m0PCmdWWGT1kQLS2AR2jjwdhzLhigA/0sjPkaUgw+vUdIcYDNtm55zEkVu38fcat24
         50V51wRirRCYWtkH+Tp/3b5jKoVLYCJUuK1HZykkZT5FUlFoweig3NvLDRfXWvdpmL2H
         K8C65SwZaPkd1o377nffTq4T/ztwf/zeRaUBcP/I/XFmmp2mspWCPY92rsKdryGFP7Gx
         m/NwP6ROeytmoCnpCnkRY65iZZNf6GtYE3I2yhTgrUiY0wxKGSignARaO3t0M5QxwiOX
         jhIWFks04j3gH39X23ZQxoorxvnmfWqb0qTqWFKMYhtQpaL0DO8ozcEMrOnCvlpVrHbU
         I35g==
X-Forwarded-Encrypted: i=1; AHgh+RrGjCxAkGOVh6h44G35XlFGmb8hh62XV+XIXrZY7zOPDqhphVwRfXJBFKuOkBLh4DKU718sRzX5x2Acqvg=@vger.kernel.org
X-Gm-Message-State: AFuF++nrcGVB/S3jFxF15AGeVRM0JKl5lKk+/4SDE4t2gDrZvDqKkXW5
	E0ushv4afELPssq/VXc94lGtbKOAbjnIFu0AJuXiv/3McQ7wB2ibR88vgk6L4E0AcjqhtwEwBrI
	/dyNwNWCoYB688Git2bOdxay3b/vMIzWJXrm4g7zj
X-Gm-Gg: AR+sD12CN6b1Chyn/oUqL6gTVe2r60RCWNuS4o6bpr9eOXyybPvxqJ1JHunpcRvEJhN
	J5fuGW0/Bk6VrMyBXU8eC0ixVlw0hIdhwLiVyd6YGPXMN8b/Mac3EqDSxgnqgPhNyXP3Y+ilYxg
	VsoDcdWF4NgsgdebfPLozYR3h/FgHmcqpe1B9oQkFfXoZPJHGAXvoIlpYuvtozMyV84lahWgT4g
	ArW/7tTygIYBeMjjYZ14LrgxMMPB6T33d0OI+udfYglWj3TSNk5cgMUKSkAgk+HzaNDaladA0Ei
	L8V8KrjMS6hQqEoIUe4qQrR80kJfMNFbATkL9jXpbmd79TkwSkoAWE40h5P2vD/9dog8GUfnT1L
	SRbl7lSnYykbJZ95YUoIUZ4OpoiB30l5yZAd8nqjBshz6xuJeFEApvpxq4lVEy8n+2zSAQY+WoA
	srzEt11vgx9g2o3A==
X-Received: by 2002:a17:907:3d08:b0:c20:1bc5:7002 with SMTP id
 a640c23a62f3a-c25b3bb9072mr147543066b.3.1788195129945; Mon, 31 Aug 2026
 09:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828094703.11081-1-lance.yang@linux.dev> <20260829052606.49470-1-lance.yang@linux.dev>
In-Reply-To: <20260829052606.49470-1-lance.yang@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Mon, 31 Aug 2026 09:51:33 -0700
X-Gm-Features: AcwNN1VQPBfCPfhwh_Qc0VZ9XU2d9ihnYQWNppXae9qOXp_k0rv-I5kwwTdHhjA
Message-ID: <CADrL8HW3=n8VqW+7YSb2kyhkHidNKGy32+2s7A0OfF+oYoAifg@mail.gmail.com>
Subject: Re: [PATCH] mm/khugepaged: Don't collapse uffd-minor-registered VMAs
To: Lance Yang <lance.yang@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Kiryl Shutsemau <kas@kernel.org>
Cc: david@kernel.org, ljs@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	usama.arif@linux.dev, shy828301@gmail.com, zokeefe@google.com, 
	hughd@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 10:26=E2=80=AFPM Lance Yang <lance.yang@linux.dev> =
wrote:
> >On Fri, Aug 28, 2026 at 12:50:04AM +0000, James Houghton wrote:
> >>If userspace implements post-copy live migration using userfaultfd mino=
r
> >>faults, this situation is currently possible:
> >>1. The VMA for guest memory is userfaultfd-minor-registered and nothing
> >>   is mapped in the page tables.
> >>2. A stale copy of a page is present in a naturally-aligned THP (from
> >>   pre-copy live migration).
> >>3. khugepaged collapses the mapping of the THP, installs a PMD.
>
> Ouch ... I missed this earlier. The problem is real, but this commit
> message describes the wrong trigger.
>
> Background khugepaged calls try_collapse_pte_mapped_thp() with
> install_pmd=3Dfalse, so it cannot install the PMD or trigger this
> sequence. MADV_COLLAPSE passes install_pmd=3Dtrue and installs the PMD.
>
> So the problem described here can only be triggered by MADV_COLLAPSE,
> whether it comes through madvise() or process_madvise(), no?

Oh yeah, you're right. In our downstream version, `install_pmd` is set
to true for the khugepaged collapse path; I missed that it was false
upstream. Sorry about that. :(

So we can definitely remove cc:stable, there is no bug here.

WRT the semantics of process_madvise(MADV_COLLAPSE) and normal
madvise(MADV_COLLAPSE), I think it makes sense to always disallow
collapsing of UFFD-minor VMAs, whether MADV_COLLAPSE comes from our
own process or another. UFFD-minor faults are intended to be resolved
only with UFFDIO_CONTINUE, and until someone asks for it, I don't
really see a need to make MADV_COLLAPSE actually work to resolve minor
faults. I don't think userspace can *rely* on MADV_COLLAPSE resolving
minor faults either.

Lance, Kiryl, let me know what you think.

Thanks!
