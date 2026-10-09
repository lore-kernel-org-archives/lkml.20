Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870C1F09AD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564678; cv=pass; b=jp443fDPZtb3K9MSjS3pL7/QwFIt4X23PJ+Pfz9xDcG7x94043l4x7eEh7EsWDHEr1wugyVF3u/V2x0W/3oCkJDTJrP/vxSyWvusI0Lg2/15I6XPEYVkTncqGGPF/SCjvOuzA2ojDGI5ch2AHhILKZjS8lGdEnBhS0JU2jxWqy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564678; c=relaxed/simple;
	bh=78cHai7ihd4+p39lusAWTnI9XfTfcoKEciRQ26SEZkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUiDUwUcVvm5OyRpwfRb+V19BxuFMJeu8lIkkX6cSOwnKQvImfeqSKZUV7K4aAPYSIWpBPPKnznLfNNC0A/1jROSERYo7bwsHRjh+rEpySON9RMvbwmpqCAHqbvRxx9vrCqXNYErNwpbpU172ThYTu+LL+vFbCj8dE3T0puQ/Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYwv56ZJ; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYwv56ZJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso4843666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791564675; cv=none;
        d=google.com; s=arc-20260327;
        b=T26KXpGet32kHUt4rcXJdF5Sx8v8YAq5esVyG5WQjVqP5cPPm9L1yGbaEWsx/vPTjz
         I5srbrWd+LcRwlhIK4HBs58Djvv44s1Td6raS2AG4LXZyA6eC1jtG8f/02AICNXkq9ia
         2/D4TfqJ0fodbuW01n9f7PrYYyoB2aFy7hLnc0mKJWGzrGqzjsn7vtu2LbXKnZJQgIyP
         QbFKV2B1bT/eZmB8KgO41pU/7snTE+u54pfW2ewON6lkkLwV3/6jGFKdZbvxhkm1xdEB
         AOS6W8ebStrAqWoOHUMSWmKsZ7V4U8S78OoRzTXKa2Z0s0ONxH2tDdK+9mMTTJGEK37i
         3GKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+8Tekpu+Ng6nSgWyCgi0KryBmJKh+vqeWpWiW1vi4I=;
        fh=3jB2fYi38FPuM2RGb4emAMJrC9VGWMKZKqfi1qFXJwc=;
        b=JeqPTuXG5VvGLoGwJsDO3vQ+E8pWPCHhwMEVT+FdUjm0NsGeFyFOQIsVn5O7caitbu
         FVqAQ+xOz+jYLs5GkHGUjIY6FHFiKLN29v7CIfqO/3kCF16CfpKm3vfzxSUHzka8MHeU
         uoHs4n72CHysbtAJthQ8ugZuDPSCQIqkDU7YxmCmGHpt4J5hSO3Vq+wb8gh6OnvgGlvC
         V1Ka7GnyPtUwFUaLTXJV7ciZoeu/KQwJJsWE0fSVZG5ws5ginwzLWOazwTBqgC4DIxLU
         2iM2zo47dLHxgGJqUZ7eBg/5IulhckDcHDjsqyzzDVEi6/H1JZlFOMJPTcB4mHxN8QVl
         5XJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791564675; x=1792169475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+8Tekpu+Ng6nSgWyCgi0KryBmJKh+vqeWpWiW1vi4I=;
        b=hYwv56ZJ9juZsW/WSLDaZdDAofbl8HpKcttt+YDG9jcJt87us6XqS7YsC/pwQQsKfX
         dfWpv+LmKFRr1qC1KJRvfCH2apjh5X9FdGKuu+YRtFHy6/WpjkMcWUVaz/ZJkMG2kgHy
         aqTDFzvOBou6HmD98fJXN4FCyyxqkPJ9dgOjtPypRv5UFR7H4LkyWWoKKAqldX3mmgZw
         n/K6/jCNIf9IFJjeUfnJnO2NhMLdUOT4FYCrcy8DRW3SV1pgs9nmzr3FNSMTfYb8iHck
         mbKmXO7Ve+zI5vNq1+omvDmkHRYRELMKDWLsQ97XgXFPCtohEdVWM5Mk0Hkj0zSBdKYm
         yc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564675; x=1792169475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+8Tekpu+Ng6nSgWyCgi0KryBmJKh+vqeWpWiW1vi4I=;
        b=EYl2rq2YgGH7Yql5CPjT7W9lZrn68UddJXmLFyTAQ/kV1U2GJxIp1c6IxGSxhe7q27
         /FId4XZnUwZquwZPgNQGh+To0QUK+lvDO1aWz13Q1njm+SLSwYwjGVdVMkyfABzuDQyD
         zAVA4xkohFNHoqslI/IUl96vVf7+ci36V0/nVvD9KnMI47ep3v2OVrIbRAnBhJtH1rzO
         XePbrbVnFWyKq1fpqQ4XAwmgT3jAsivG4jthMxbJRXQXFzKlRljbX8RFBSissDXzgLpm
         9DzG11JuzSX9fqRUrU1OmeHVhvGETXpMHbn1fFkt55b9N4xhQH6S4w/L/QLTM5MsGmEI
         W9tA==
X-Forwarded-Encrypted: i=1; AKwUvBwLWnTuZFIVsBCB4M7ex5ICaIWVKZUJMLJl+v1dIkwBfnuRxNsAbnAF8TK5oQbikZ95RtRVSVTpRgHhHuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvfNwYmpM9JPmC9q6FJ3U4c/faYxb7JZb8VM684kHCPiRhaNBw
	1SDywhNft2co1uiPRWIzT2kwZncSp0QhrqlXdkngsTfdnMHYuTD1irIxhejjH9rd9B0/PhPjH29
	AD7xdmOb0NcB+NZxiI/PxccrqZdYpjcU=
X-Gm-Gg: AYBFou34LDEl8rhoT8R5LA63STO7QIM4PGWsp+mUXMI5H9HyWx2UlGow6xc45wKFyvs
	wgQ2RRxVcbppQjlfHSze4zGRu4qByF9UVLtX3EUAt/1e7QdakhmqloK/QteC9fbslfIac3nMQhF
	9f9hXy7ugthyVVt4XmX/6IPdbdi9e5zRPH/IYj58bQgaKTjEabpMUqzicJ/LENZsIjclJkcao56
	Xx9sku1qrerWJPIj+p1kpYcrb37BHwb/FIBuxpJLnmtWpyD4DBNtz1fqXDejheoGMN0QqMnCDgA
	rFZ/roG6zMigHucmEbNr+QZEVW7DvAmbmp6aKDC01dQlpK5I2JPwwIOxDBBt5R7DhiL0JJKJSMZ
	XGQNDFK4ceXANnmjTovbhOkU26JBpxKbLbL5t5e29MK3DenzkgF/1jVIzdpkA4k9z+Wx72b6bFs
	OpUTUbNU5DofjBFMZPk/Ky
X-Received: by 2002:a17:907:7b8a:b0:c2e:855:3375 with SMTP id
 a640c23a62f3a-c31aa05d48dmr267328266b.30.1791564674847; Fri, 09 Oct 2026
 09:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009161832.GA980777@bhelgaas>
In-Reply-To: <20261009161832.GA980777@bhelgaas>
From: "Perlow, Jason" <jperlow@gmail.com>
Date: Fri, 9 Oct 2026 12:51:03 -0400
X-Gm-Features: AclHuK-7AfAFQYv2cTll8HDVHIrz5FK0KVf6exm9S66osr63JbCL-_swxrWvd6k
Message-ID: <CABZrw2EnZzKCdJc2oCtm14YuDndpj=uAV+MRCmYEfimy_Zv5jg@mail.gmail.com>
Subject: Re: [GIT PULL] PCI fixes for v7.3
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Alex Deucher <alexander.deucher@amd.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver OHalloran <oohall@gmail.com>, Christian Koenig <christian.koenig@amd.com>, 
	Vitaly Prosyak <vitaly.prosyak@amd.com>, amd-gfx@lists.freedesktop.org, 
	Aditya Garg <aditya.garg@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am now producing a draft quirk that uses the known device IDs and
models for you. Will post shortly.


On Fri, Oct 9, 2026 at 12:18=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b9=
35:
>
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v7.3=
-fixes-4
>
> for you to fetch changes up to 79c168e2aa957ed0054c93db17caba653b95e377:
>
>   PCI/AER: Skip error recovery on false alarms (2026-10-08 14:33:04 -0500=
)
>
> This fixes some GPU initialization regressions caused by eddba19b8b5f
> ("PCI/AER: Support Advisory Non-Fatal Errors"), which appeared in v7.3-rc=
1.
> That commit also caused a MacBookPro16,1 spontaneous power-off regression=
;
> I expect a fix for that next week.
>
> ----------------------------------------------------------------
>
>   - Skip error recovery if no unmasked errors were signaled, which fixes
>     GPU initialization regressions caused by new Advisory Non-Fatal Error
>     support (Lukas Wunner)
>
> ----------------------------------------------------------------
> Lukas Wunner (1):
>       PCI/AER: Skip error recovery on false alarms
>
>  drivers/pci/pcie/aer.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)



--=20
Jason Perlow | Argonaut Media Communications

Voice/Text  (954) 242-3484 | jperlow@gmail.com | Blog: techbroiler.net
Read my Tech and Food Industry articles: https://linktr.ee/jperlow
Bluesky: https://bsky.app/profile/jperlow.bsky.social

Need to schedule a meeting with me? https://bit.ly/3y8P3Gp
