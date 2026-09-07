Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1B419304
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766613; cv=none; b=LE8hB3fZkY80f/7POWlSbRLwc75fhFkYpwoX+PDjVvGlip1Sd3KZYmn9YcMvQe1A26JQZqU79FZKm3BW/Xi65znIl435+AArZZejnF+9odjf8OraB8YdWvre9HSVQ8nkyEl6dUZ+JRiH1/CbzwtCrAWMxMdq7/4kQq8TwN0JH24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766613; c=relaxed/simple;
	bh=KUXT1cvj3E8DNaP845q8m3ThSwXMWIo8fJIuukTfnqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYvvj3Ma40tsuoFY98z/vGxCfNRJR7JXT8+RJ452tjmjk/VjW+Ffv2NQM7t2+7hoVx9+k7VvfabImd0y1Wp3iQp0Zuk1yu3+7Joo+fB8w8XWmegXtJDBBbnWW9TyXRSwTDyaQg/vBRZkoAnT5qK8Ml+0zPNE+C9MmpL9o3p6rxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c7afda4515so1896070e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766611; x=1789371411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r71PWtF5lxEG8yZB3mpAEnjiknr+9LGf2snMKlbVdJ0=;
        b=HSlQvqictLhGmlWdBznYOOWtC1yH6VHBPmZ07bGfyLyxrADEpX+bDbQz3EXjcrnKUQ
         Roa/L1AmkRL7jI6oBasfp7apdVHY/k8dUzqSlqIVQsxAGnDxk6MUGS19l6th3oA8c6er
         ouaj4ErGCVhxaS19fK66upAGcBNWgcmqtWMTLzWFvsfTHB2X5pYAqZ/voVzkssxcle7i
         hDOfUES6wT2rp1AU5uR/zIWTQyCe+P1IjFNxXNsvGzft6ZZiAN9uPH6F/qXqMV6V5bVq
         nkGZosZt3l4EnhyyV+vho6i0HEF6eroisRBT/7cn1AB8IUbTM0Jbqs5Fz6nJ+dj3CBw+
         pzYw==
X-Forwarded-Encrypted: i=1; AKwUvBzM/MgjMnllmk8cAiiYXPWlY2bSVdP0SIRq+kFDUQxQ0ChXJU+NJCQZxBChOwRV61P6UOelfaYPGpYWJOg=@vger.kernel.org
X-Gm-Message-State: AFuF++n9FLsmiIJJDb5K8Rb5nae527jhUilcaFxZnt17ecTX+cVkwDHe
	rgOpSl6X1nsRwy0vDPiWfOnLIwiwsQrml+HNJND0QcCkZsJXMLE6hPNcGzxfDalv
X-Gm-Gg: AYBFou2EqEhiBW5nsHZAw3CpuhnfbXyWk94lRruKOXZvjFBlj5+vud3PiNrEW6FyGL/
	uQHK/1oS8QaQ1GTfxVnu0A1T6N/rtB/R6QTkyq4SE65XjvubJXlLVfy8gDNdIIPOciI7VDh0HvK
	Tu8ycXgiRmhubY6KRJGcOUrmFi3ccoqSFXGATBN/lB8ZYFCJHhSc5MHp2URDsGWI5dCaPxkK13G
	9Nxb9uX6dV5CUtT+m7YdMiF+kWzmMfy/8Gdmh2Ti3fZBRJG+nO2maAOP4ka+ez8JgLmX01Pq+m+
	hA4451FT5D7nqPV/idM7Uru6JBRQK9HOvb6AaFsw40DoAoYbyYePtkMhCK6UzYwbmfMmDKHijvu
	8bVnsuZWkJ2fkjwHdi9O+ExMcOjIiVeEvWTisiycSVFRamLe1YBK5qwhFZWHvwMe2GZOi13AQwU
	7DG8T59W8PO0DtTKr0xxrw3QkaglMpkgSvhufznr3mTEwI8yYk77MndVYwrAQaqHq7eop/XlUef
	2Fy25jkw7O3E65QX/GGPa70uw==
X-Received: by 2002:a05:6122:4689:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5c7ed087c0cmr8975082e0c.0.1788766610841;
        Mon, 07 Sep 2026 00:36:50 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm7436763e0c.12.2026.09.07.00.36.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:36:50 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so808396241.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:36:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByk0Z4YMV3B8qqcZ6wk+Y9qInZGkNv83U6q7LhFxZFYADNBdSO/A78Jf7a/3pqlb+7WJrAKmogFCTe369I=@vger.kernel.org
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id
 ada2fe7eead31-78a4a6f61c1mr6350849137.6.1788766610006; Mon, 07 Sep 2026
 00:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9ty9kjb1bKFgjgBS1tgM3zP2tK+5qTFzT9-0t+1jykBDxw@mail.gmail.com>
In-Reply-To: <CAPM=9ty9kjb1bKFgjgBS1tgM3zP2tK+5qTFzT9-0t+1jykBDxw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 09:36:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG7_7GDPhs3H7kiarqSYR1_gMD1onYu9Hzem-_a-ookg@mail.gmail.com>
X-Gm-Features: AcwNN1Xh1E1drhlmxpdW-6B-oSys0CxIfVnacGZNB9MW0x38Cq66CbRDiOO3eRI
Message-ID: <CAMuHMdUG7_7GDPhs3H7kiarqSYR1_gMD1onYu9Hzem-_a-ookg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 7.3-rc2
To: Dave Airlie <airlied@gmail.com>, 
	Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Fri, 4 Sept 2026 at 21:52, Dave Airlie <airlied@gmail.com> wrote:
> amdgpu:
>  - Fix for drm_amdgpu_info_device with mixed 64 bit kernel and 32 bit userspace

This commit contains a "cherry picked from"-reference to a
non-existing commit in upstream (it does exist in linux-next),
and mentions a discussion between three people.
It would have been better to include a link to that discusion:
https://lore.kernel.org/20260820045438.3974-1-yogesh.mohanmarimuthu@amd.com

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
