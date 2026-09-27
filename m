Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66BC344031
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790537219; cv=pass; b=o3ZX4v35kGwcP9HpYAOlmrBcs68dqkcuHHl+5qU49JDBGQ6PS0XOwkO8Pw3grRBIKcYydn1OYwfVGRkX5MINliTrsi9sSBPY02C+Bx3P8Ehu3WH26KdHhA4vypsRyhKHODwC49vO0clakxf8t7LqMcm/nGIy/bM7wdE7PnTeKok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790537219; c=relaxed/simple;
	bh=c7beOP7YTTkGYf6lX60AuvvLOMkpaXTWjJ6zogSNaIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrTEidg99OokIH63u6u1yH7MXs56GhYevYkLqrP8c9E6FgS0q8+qSbenyA0mV4wFAi6LI7Wu40zBIQohx/E/UBF4TVlVkqeWgUwyslZEdGlXyV2pH0SxprAR1TYzzXx0GBeTQeS8HeEqJ7g0JKL3FMzH6kPnK6kt2u+TdkwNgaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBh/uzao; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBh/uzao"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-141a5cf1371so137494c88.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790537218; cv=none;
        d=google.com; s=arc-20260327;
        b=cCmDXElc+RtPuNh8Q0hRhrCY+/qVoQOQ9weWYRkTY1wegOdJLmWX7tG1xEYEE/ZIcC
         E6f6AGcf+/NqPN0GXtPULaaIJNjyCD0UQTuzXgohe0XT8+uyJhrRW1Nc5iR5/+i3BBM2
         VmbDUUDK8fBQpHJ5r3Mmg+7oWU+uouQWrbD09Tl6FJ9yoDULMQs53PUo8t4NRU+zuNIZ
         S3kyYBBW5ZJclM/PZsETP6gxmCub3r2yZArHXsz8FFZNnBDxfXivKDY2CwRQXrtJEf3s
         nAJoqSWzrMfv527xX+f/S5rBEzURvEaZvadnZZL45P3DApOFGqK+oy4bvw+jei08e/dp
         saiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bLQ6al9H/Dbtt02cX9S5WR+KWcZ7MbpFtL/ELZ6WlQM=;
        fh=kw6metXQR7iRvqggnl5g6AfWZ20H9GC3T5mHIaDvlvM=;
        b=ZPoDDttxoA1yu6bPheJRx7Xh4TeF++gJtrX9aCnEsAouoxCBl8SHsfoi9xYuRhksHN
         SYG+iVZLQzBU01OOzfwu5ldWDrgQWk2aHxK480TVcZR5zv/a50wz6i8mfEqlfw89PcFu
         fGGQduwyqk+CyC/oz8c0CSRfuF1QzrO7lyxGA7zHVYSJpIyFnCHeygyVcMCW54qcQlLc
         YXID22B9RoSoY5wOKfWrdeAI6Sch+o1z3PHGlOUGizmTyHCXZINm0jYwl+WsVhtrKj1Z
         uSvnS6+8ydFjTkY9YWdPdMeuFm1Bxn8z6/utO1GDLhjrDvtUQtmXA3kfEicu+mx7qH2p
         SOgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790537218; x=1791142018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLQ6al9H/Dbtt02cX9S5WR+KWcZ7MbpFtL/ELZ6WlQM=;
        b=lBh/uzaoL41h8yoe+5zxwiv4fvYZczO4dUg3+yZOCHgcIFjoZt6QT1pDSQHMWcuKYU
         ZanWn0aMLXhgPtK8s13xJBNTdmNQAA0wGZhIW106Y82ywpXrTFLtYrPXapVy0clt5Qsz
         09tsWMvZJ8J3CiGfhH8Nbz4dMawgwAoiaQwy+jQeY/uAg4j6hMHbQcC4HOem28yAKOx4
         jrpz7KRXOUBZUkSDfMLSxkJrNe7RHUC4TrUtc9KtEjorbNmlww8q9mb8Ayy7RPRNpYLG
         raToRa9TyErx8Zeqs/LZQXw2H3l+7rhI+TtywvkTP1MXlPlzV57aBFHDWrxhNpxdN2mF
         Zu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790537218; x=1791142018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLQ6al9H/Dbtt02cX9S5WR+KWcZ7MbpFtL/ELZ6WlQM=;
        b=k59kQfVcoGPSWX4OHnUMiPXliCGWTvjrTl95scW7KCRe2SNGQgxclBLPmi2nrBqmQk
         amFLob5R3hcnfNIFpEtPka5HF8YxSHNQW3Bl+IbzUVblODbgetL2x3eekaNqJL3nBJ7E
         ZaR6pWqbuLCkg0T1s1yM2vB8R/+dJFhDow41IEfdlbAqhW+2sVkJx/lgjkoumaapYbUS
         XsjQNpajt4+nHqn2CASmE/gefXqukzzoHJ//r9mBuXso/+JTgtSZMZBtc7HkUXuniIsj
         gEklzQMZDwqo5540FHXvZrZKWwvwSP2+74nVwPHQsChnVd17mgAa3mNuCxOipAlvBHOX
         8Gdw==
X-Forwarded-Encrypted: i=1; AKwUvByuoALj8W1DlQ94ExCAtNDYNRC6v1IEwmTNlaBBjZFMbcJ8AXmK0FcgSMlSRJcTZZCL59tjA0B8S/24fvo=@vger.kernel.org
X-Gm-Message-State: AFuF++lRDKfQ9nWxYbIz7P/Wr+CQOTLFQcALgkZlDQyWSiEBa6T+JM8l
	rViy7pNBnHcQc2OwBsev9cTAYDPCsd9Gd/Z6RqVS1sjBBtur3J0Cd+99eKntTJG+58SUyFiepD4
	jdqr2sw4ZElFGfQmS8CDX+BK78Qm2VWs=
X-Gm-Gg: AYBFou1zRxiBeeOd90nayM7kt7dOFv0CkrAJqXh2UmIWdxgT/CXH1ooDMVljP3hM7Xe
	GIL0iQbi6MfJjjE3CBST4XzRFHLbhx6tJgFVP3vfUo4yUo+/dFhX9UUWtvE0TLxV81yMDnLKgst
	iZEYUcJpSkGOd1NHqMsrP0/5HV0y2GHbHU+rc8OsmNZm9b+9DRQsBnCmgIT+iqiLeV2ahMWDHgC
	vJw7xMkNg3eAyLfxevBDMJMFTRnPU6hQpCxXWWIao+x3VwX9aj1Nxv+NK8pUOghSAz8JafIa3y3
	1BukDyB8oGDR6zMSmuDOlhsL4LSfR/iaJJRxsypqxlpeK49YRk50j/ClQqS8pUEOJX61bd8o91D
	52sE9LQw3CGlk9Z6qirjEbo+dvT4Vb+ICQ9EGxiKMOw==
X-Received: by 2002:a05:7022:29c:20b0:12d:c389:ae54 with SMTP id
 a92af1059eb24-146cfdd1a65mr11563219c88.2.1790537217579; Sun, 27 Sep 2026
 12:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927145505.16883-1-kaloz@kernel.org>
In-Reply-To: <20260927145505.16883-1-kaloz@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 27 Sep 2026 15:26:45 -0400
X-Gm-Features: AclHuK-CrK0NLf-dOyv1g22nCfXksI0ZY8rCmFNjK9n1wbeXqCSPRlaJ6RVXPAU
Message-ID: <CADnq5_OB21LmvT-J2Ou_v1cNPNwQHz9wapwgauNzuDthRHcMiw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/radeon: Sun XVR-300 support on sparc64
To: Imre Kaloz <kaloz@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 11:06=E2=80=AFAM Imre Kaloz <kaloz@kernel.org> wrot=
e:
>
> These two patches get radeon KMS working on the Sun XVR-300, a
> FireMV 2200 PCIe (RV370) board, in sparc64 hosts.
>
> Patch 1 fixes an Oops that any posted radeon card on sparc64 hits in
> igp_read_bios_from_vram(), which dereferences an ioremap() cookie to
> check the VBIOS signature. It is tagged for stable.
>
> Patch 2 adds a legacy connector table for the XVR-300, which has no
> COMBIOS for the driver to parse, so both DVI-I outputs are found.
> The XVR-300 needs both.
>
> Tested on a Sun Ultra 45 with an XVR-300.
>
> Changes in v2:
> - Read the signature with readb() before the allocation instead of
>   checking the RAM copy, as radeon_read_bios() does (patch 1).
>
> Imre Kaloz (2):
>   drm/radeon: Read the VRAM VBIOS signature with readb()
>   drm/radeon: add a connector table for the Sun XVR-300

Applied the series.  Thanks!

Alex

>
>  drivers/gpu/drm/radeon/radeon_bios.c    |  6 ++-
>  drivers/gpu/drm/radeon/radeon_combios.c | 51 +++++++++++++++++++++++++
>  drivers/gpu/drm/radeon/radeon_mode.h    |  3 +-
>  3 files changed, 58 insertions(+), 2 deletions(-)
>
>
> base-commit: fe2ec83746e501645709761605c2464a44fd2929
> --
> 2.47.3
>
