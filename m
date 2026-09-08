Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259D839E164
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851564; cv=pass; b=DSKayZpY/xg4xXb8j80uGHCYsqHjJlbUToYU7CQpErcQFQEQ8WqLA9XWbA6zIXUhnPIog02lmR8rdhkjZQw1JdxPXspZ8xvm9dfKs8ICS0SKe3GzmLz+nYEbOtHSANbSrr3FTpwebIIvjY7D1s0K5uwIlzIJDwYO5Rq8PaIMNlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851564; c=relaxed/simple;
	bh=kYtRBGff3Cf3tt3/PvyqbO1QmTw52cRguqV6Q0iAHR0=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkPZ/HqkDvJKag+grpoG4tv8TfAdo7zfHrZDyG+WxCAgekQR9OYXCFTx1ohXxUh91Rmy2jzbbmiwC57AL4XIQ8sRs9QTOD+fjljEXSyu16yjYJHqofa7qN1dDIT/CuZJymVUpl3ouXSTELwS2mKHwl++U4l5PQgCD6Z95hqPlbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dxcys2xJ; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dxcys2xJ"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1909323e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788851562; cv=none;
        d=google.com; s=arc-20260327;
        b=EQOgqTDmQqLWHzz15JAEFrXMGeKW3Yw61z+xATscrMX6BofLw8r4Xy6pWUlqoRq81x
         TKRKgIEVIzntX7sekIXBzHRuAmi+mfpqtNp1eOrH5n0h3aMCLoo9FLhu0FZqxAPRadx/
         gOZ5lOX4EJOdn6bHAJs6EkKtMLcIkiegMjDAk/7U1gvKiGrT4A5kh0754c4pp5txrUes
         xZFyM83igJFTFKjIGTTRVBT/gq4ZzMlXxYie6PC26Pu2LwcYv1eqYqvmh57hUEqHXhuJ
         UUCN+TxX6846IiSBfRNGX1+vbD+vA7h6gRxrcPEO3UdM7OGg5Y5yUhA2sErhhuxzsXuH
         nA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=qsLaUxYbGMpI4z4uQbUiwjTKmX/vPTtkRhbslycMFDU=;
        fh=Xujqxby/ok+kDbXawzpyoufTXOije8Gii48cEGFJaJ0=;
        b=JIDsjYrztCMgIscV76JEh/YYIdZsN7wqKYFIPxuWwCsC3QY3O82YWnjMTTBkNUH1+9
         prlR0SEDLYFgbhnDNAQdV9bm/YuQYYi6Z2zj1h3uJxsebcUyFwmqtATkjglIl9ykgPVm
         0tcvU+G0wCdvYeVHKDzRzgAYuV8wOrI+fHVlJUpbmBX/ekH2Tv2wtA1wykFXXxD3S0lK
         wE0Tlw4qZncIeTv5xzANi8xrKpOxK/JrJB+GS/TKXfDTkjWlBh2BtHCmQ8N+zcXeKUU6
         EjkZueDinLbnrXFgQc8GnJAwjk2FYtXtdTjHR/dewTN/87lcmhWFLvnKAzb2363gYwbl
         GCjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788851562; x=1789456362; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsLaUxYbGMpI4z4uQbUiwjTKmX/vPTtkRhbslycMFDU=;
        b=Dxcys2xJlv1bJU1/poc23s8dTEXI9jvI6QGpv3P84aiOaXWBx12Cu2conP0kYTdpH3
         R3hMPT5HYO2nUS4bzoxzDYB9EXCPEG0doJA+fVusoE9Rz2I4yiGnjGhttu/cDOYFlRFH
         zsA5Y9BN4ChZptL2cu4YMeepSoQ5zia3MS8hathZKO6OCbLg62YH37FiBUXf3P7N7tEW
         I1RoGHXJAOnxafuMmMhW0bNeHSc0JjToOse9gusEq58HAmC7np12zcuoack5Ko9erQEz
         nsokIkFXqPtHHSrJWLrcC5t5yq6ZAnp+WrpS4MkK4dxPM9K8uiciawUDREv9JHn3Zl9u
         shqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851562; x=1789456362;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsLaUxYbGMpI4z4uQbUiwjTKmX/vPTtkRhbslycMFDU=;
        b=kvKvj2xtJ89nzgwCsKrk9cPOkPP0Qu05/XtV4mgl1gZ/ckY/+BI5w9YSWCs/qIZYFW
         gmUZEJwO/9dTkb8lOFfEax23F+8ye2wawUIHl51CTGYPyPvdGvnh9OEIFFA1dn3lrf4x
         VCQQkOq3MEzLji1ZkDLWgcQtBYUUWMhjWamFfUCHC4rWpHlq3FA0CVsFfPucksaNeCCD
         EHSnCfMJ3mtzayOtpGL43P2fK8E2+eZ+/lw8XHTYtrnWS0yDo57aX0rPNQLlXU6QPeqg
         /nMy4RNW25qZPRoDV92x+48tF+GX10XffqznqQK+O2+47QolgTPUQLeIvmZexbglcGAL
         DP4w==
X-Forwarded-Encrypted: i=1; AKwUvBwkL4PJM2tO4WLPPMb6f5ELq5Fim4q4DdxG8giibeq8giNRmAqjr1OgRzjOHNcAdGF8OJobCi+h+/ToeiY=@vger.kernel.org
X-Gm-Message-State: AFuF++nXuD45CSnnqedQMzbZjZmTpCKMaS1Cr2GivphDRA8cnKSY5rNe
	B7aL+IAtg0Zje13pGy1WS2H0g88Jvx453utAmXAKWSk/ewtse0MILiPaYpO+eXVEVdCarxEjRzp
	ykwWbCkzAiqN+laSJFTu0927B8Z7aH4I=
X-Gm-Gg: AYBFou26Hle4WjhS3jaoZI9TaRiodvwq7d59QfpAJCnLtMO/esSloB0+xAxc7W7u0sI
	nZh4T7CpxJQPZXRRUQ1k2hV5UB6BjgdrL0oU5ZhOHKXtOx0232wgH74mRgmuAEPM9wAwDjZdFRC
	NFFULYhuRUiRyXWVXSIlZ+UBT1GCaPkSVEhpqQ9BCnUKaFT/+yYvRErPooYalMvXyWIqhhP7UQm
	ngcKHTvVRb7fup/7boxqnwZR+pzu0bR57QWdhyOstDQxXIWxpPauXTsXHIwdx6EXB37YRSCyGxC
	xYiVytZUxvHGSXRl3apy/Al/mMhD2vCEW0E+Sf41ycCRzCcPFVKTHQ==
X-Received: by 2002:a05:6102:61db:20b0:78a:700c:ad84 with SMTP id
 ada2fe7eead31-78a700cc36fmr3564272137.9.1788851561548; Tue, 08 Sep 2026
 00:12:41 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 8 Sep 2026 02:12:39 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 8 Sep 2026 07:12:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 8 Sep 2026 08:49:32 +0200
From: Zhao Li <enderaoelyther@gmail.com>
In-Reply-To: <20260905193122.76f5d3245cd2e0603e7743b7@linux-foundation.org>
References: <20260427145247.84157-2-enderaoelyther@gmail.com>
 <20260428030712.66256-2-enderaoelyther@gmail.com> <20260428113037.88766-2-enderaoelyther@gmail.com>
 <20260905193122.76f5d3245cd2e0603e7743b7@linux-foundation.org>
Date: Tue, 8 Sep 2026 02:12:39 -0500
X-Gm-Features: AcwNN1XwTG0-VWWtLuCWHyxR5vlmphPm1tauraRmPLL5-TyLDFGlaKBhLxDmXoU
Message-ID: <CACHPgzxQ5ajoo3yrkXZgkmeDgOmOQTZxHpJcDc8P0GBRLvP8FQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm/hugetlb: fix max-only subpool accounting on
 alloc_hugetlb_folio failure
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mawupeng1@huawei.com, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Sep 2026 19:31:22 -0700, Andrew Morton wrote:
> I do like to see a clear statement of the user-visible effects of bugs
> when we fix them.  "subpool quota leak" sounds bad, but how does this
> visibly manifest?

Thanks for picking this up. The added description accurately captures
the max-only case.

The leftover used_hpages charge reduces the free space reported by
statfs(), so the mount can appear full despite having fewer allocated
huge pages than its configured size= limit. Later allocations can fail
with ENOSPC, or page faults can result in SIGBUS, even when huge pages
are available.

The patch leaves the min_size= reservation-accounting case unchanged.
I'll make the user-visible impact clearer in future patch descriptions.

Thanks,
Zhao
